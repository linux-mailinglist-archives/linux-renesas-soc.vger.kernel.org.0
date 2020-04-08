Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 2658D1A1E34
	for <lists+linux-renesas-soc@lfdr.de>; Wed,  8 Apr 2020 11:46:53 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727916AbgDHJqw (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Wed, 8 Apr 2020 05:46:52 -0400
Received: from sauhun.de ([88.99.104.3]:39634 "EHLO pokefinder.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726345AbgDHJqw (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 8 Apr 2020 05:46:52 -0400
Received: from localhost (p54B334FE.dip0.t-ipconnect.de [84.179.52.254])
        by pokefinder.org (Postfix) with ESMTPSA id E6CED2C1F39;
        Wed,  8 Apr 2020 11:46:49 +0200 (CEST)
From:   Wolfram Sang <wsa+renesas@sang-engineering.com>
To:     linux-mmc@vger.kernel.org
Cc:     linux-renesas-soc@vger.kernel.org,
        Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>,
        Wolfram Sang <wsa+renesas@sang-engineering.com>
Subject: [PATCH v2 0/3] mmc: renesas_sdhi: improve TAP selection if all TAPs are good
Date:   Wed,  8 Apr 2020 11:46:35 +0200
Message-Id: <20200408094638.10375-1-wsa+renesas@sang-engineering.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

SDHI (with SCC) has a mechanism to select an optimal TAP even if all
were considered good during the tuning process. This series implements
support for it. Before that, some refactoring of 'best TAP selection' is
done to avoid code duplication and get more understandable code.

This work is based on BSP patches by Masaharu Hayakawa and Takeshi
Saito. It is built on top of mmc/next. For convenience, a branch is
here:

git://git.kernel.org/pub/scm/linux/kernel/git/wsa/linux.git renesas/sdhi/new_manual_calib

It has been tested on Renesas Salvator-XS boards (R-Car M3-N and R-Car
H3 ES2.0). There were no regressions detected. HS400 could be tuned the
same way, and checksumming large files still works.

And while this series is useful by itself, it is also the last
prerequisite to implement some 'bad tap avoidance' on top which is what
we are originally aiming for.

Note about backporting: The super useful iterator
bitmap_for_each_set_region() is only available since v5.6. If you want
that before, you need to backport the needed bits of e837dfde15a4
("bitmap: genericize percpu bitmap region iterators"), too.

Thank you to Shimoda-san for his valuable input since the RFT version
of this patchset (see patch 1 for details)!

Kind regards,

   Wolfram

Wolfram Sang (3):
  mmc: renesas_sdhi: refactor calculation of best TAP
  mmc: renesas_sdhi: clarify handling of selecting TAPs
  mmc: renesas_sdhi: improve TAP selection if all TAPs are good

 drivers/mmc/host/renesas_sdhi.h      |  2 +
 drivers/mmc/host/renesas_sdhi_core.c | 64 ++++++++++++++--------------
 2 files changed, 34 insertions(+), 32 deletions(-)

-- 
2.20.1

