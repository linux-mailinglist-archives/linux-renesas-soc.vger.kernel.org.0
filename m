Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id BC3E41B45AF
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 22 Apr 2020 14:59:50 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726984AbgDVM7Y (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Wed, 22 Apr 2020 08:59:24 -0400
Received: from sauhun.de ([88.99.104.3]:47578 "EHLO pokefinder.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726731AbgDVM7X (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 22 Apr 2020 08:59:23 -0400
Received: from localhost (p5486CD65.dip0.t-ipconnect.de [84.134.205.101])
        by pokefinder.org (Postfix) with ESMTPSA id CA6A22C1F8B;
        Wed, 22 Apr 2020 14:59:19 +0200 (CEST)
From:   Wolfram Sang <wsa+renesas@sang-engineering.com>
To:     linux-mmc@vger.kernel.org
Cc:     linux-renesas-soc@vger.kernel.org,
        Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>,
        Wolfram Sang <wsa+renesas@sang-engineering.com>
Subject: [PATCH 0/2] mmc: renesas_sdhi: avoid bad TAPs for Gen3
Date:   Wed, 22 Apr 2020 14:59:12 +0200
Message-Id: <20200422125914.16590-1-wsa+renesas@sang-engineering.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Here is a series which avoids using TAPs on R-Car Gen3 SoCs which are
bad to use according to HW engineers. The patch was originally for the
BSP (Thanks, Saito-san) and has been upported for the upstream driver.
Before we can apply this, we need to add some mising information for
R-Car M3-W ES1.[23].

Patches have been tested on Renesas Salvator-XS boards with R-Car H3
ES2.0 (changing from TAP3 to TAP4 here) and R-Car M3-N (changing from
TAP7 to TAP0 here).

A branch can be found here:

git://git.kernel.org/pub/scm/linux/kernel/git/wsa/linux.git renesas/sdhi/new_manual_calib

It is based on current mmc/next + "[PATCH] mmc: renesas_sdhi: shorten
types after refactorization"

One implementation detail: For now, I kept using a generic naming for
the quirks, e.g. "sdhi_quirks_bad_taps2367". It is possible that we need
to rename/add ones later which are SoC bound, e.g. "sdhi_quirks_m3w_30".
Especially when we add manual calibration somewhen. But for now, the
generic approach seems better to me, so I sticked to it.

Looking forward to further comments and/or testing.

Happy hacking,

   Wolfram


Takeshi Saito (1):
  mmc: renesas_sdhi: Avoid bad TAP in HS400

Wolfram Sang (1):
  mmc: renesas_sdhi: handle M3-N ES1.2 and 1.3 revisions

 drivers/mmc/host/renesas_sdhi.h      |  1 +
 drivers/mmc/host/renesas_sdhi_core.c | 62 ++++++++++++++++++++++++----
 2 files changed, 55 insertions(+), 8 deletions(-)

-- 
2.20.1

