Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id B52FB14D1F7
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 29 Jan 2020 21:37:27 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726672AbgA2Uh0 (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Wed, 29 Jan 2020 15:37:26 -0500
Received: from sauhun.de ([88.99.104.3]:41348 "EHLO pokefinder.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726317AbgA2Uh0 (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 29 Jan 2020 15:37:26 -0500
Received: from localhost (p5486CF2C.dip0.t-ipconnect.de [84.134.207.44])
        by pokefinder.org (Postfix) with ESMTPSA id 4E8292C06AB;
        Wed, 29 Jan 2020 21:37:23 +0100 (CET)
From:   Wolfram Sang <wsa+renesas@sang-engineering.com>
To:     linux-mmc@vger.kernel.org
Cc:     linux-renesas-soc@vger.kernel.org,
        Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>,
        Wolfram Sang <wsa+renesas@sang-engineering.com>
Subject: [RFC PATCH 0/6] mmc: tmio: move TAP handling to SDHI driver
Date:   Wed, 29 Jan 2020 21:37:03 +0100
Message-Id: <20200129203709.30493-1-wsa+renesas@sang-engineering.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

TAP and SCC handling is Renesas specific, so it should be moved to the
SDHI driver. After previous refactoring, this is possible now. And
feasible, too, to simplify further HS400 corrections. IMHO it also makes
the driver less complicated.

See the patches why this series is still RFC.

This is based on top of the series:
[RFC PATCH v2 0/5] mmc: renesas_sdhi: add manual correction

A branch can be found here:
git://git.kernel.org/pub/scm/linux/kernel/git/wsa/linux.git renesas/sdhi/new_manual_calib

It has been tested with a Renesas Salvator-XS boards, one with a R-Car
M3-N and one with H3-ES2.0. Tuning to HS400 still works.


Wolfram Sang (6):
  mmc: tmio: refactor tuning execution into SDHI driver
  mmc: renesas_sdhi: complain loudly if driver needs update
  mmc: tmio: give callback a generic name
  mmc: tmio: enforce retune after runtime suspend
  mmc: tmio: factor out TAP usage
  mmc: tmio: remove superfluous callback wrappers

 drivers/mmc/host/renesas_sdhi.h      |  5 ++
 drivers/mmc/host/renesas_sdhi_core.c | 90 +++++++++++++++++-----------
 drivers/mmc/host/tmio_mmc.h          | 11 +---
 drivers/mmc/host/tmio_mmc_core.c     | 77 +++---------------------
 4 files changed, 71 insertions(+), 112 deletions(-)

-- 
2.20.1

