Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 032491EF518
	for <lists+linux-renesas-soc@lfdr.de>; Fri,  5 Jun 2020 12:12:40 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726010AbgFEKMf (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Fri, 5 Jun 2020 06:12:35 -0400
Received: from www.zeus03.de ([194.117.254.33]:34692 "EHLO mail.zeus03.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726378AbgFEKMe (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 5 Jun 2020 06:12:34 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=simple; d=sang-engineering.com; h=
        from:to:cc:subject:date:message-id:mime-version
        :content-transfer-encoding; s=k1; bh=gYFeONL5I/bcVZjzHzAV9PjeLn3
        ZeKKPj5bBnRQhTQg=; b=BsdTnlrI3rb+3fOyBppCVNJR4aWmRo8RyH2db5VdUlI
        UoSHqgO8NOXRzNi18CYE9Cn+BkLfjdlC3DCe0K0ofWokrHj4KaPX2QzLN6YPV4IQ
        2xy/Mr/q3fEkHvK3xguqL2nXHQmrC/yRvBeikAjZq7yziL5++kt7v5eFhObHfGgU
        =
Received: (qmail 2053844 invoked from network); 5 Jun 2020 12:12:31 +0200
Received: by mail.zeus03.de with ESMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 5 Jun 2020 12:12:31 +0200
X-UD-Smtp-Session: l3s3148p1@IXi+f1OnlpsgAwDPXwgPAMwULGf5QH9H
From:   Wolfram Sang <wsa+renesas@sang-engineering.com>
To:     linux-mmc@vger.kernel.org
Cc:     linux-renesas-soc@vger.kernel.org,
        Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>,
        Wolfram Sang <wsa+renesas@sang-engineering.com>
Subject: [PATCH 0/2] mmc: renesas_sdhi: support manual calibration
Date:   Fri,  5 Jun 2020 12:12:20 +0200
Message-Id: <20200605101222.10783-1-wsa+renesas@sang-engineering.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Some R-Car Gen3 SoCs need corrections after they tuned to HS400. This
series implements that. Please have a look at the patch descriptions for
details. The origins were patches in the BSP from Takeshi Saito.

Changes since RFC v3:

* moved detection in probe() a bit to the front before calling into the
  TMIO driver ensuring all fields are properly initialized
* tested on Gen2 (R-Car H2), too; no regressions

There is a branch for testing here (with the debug patch on top):

git://git.kernel.org/pub/scm/linux/kernel/git/wsa/linux.git renesas/topic/sdhi-manual-calib

Note: handling 'hs400_calib_table' in patch 2 uses some multidimensional
array vs pointers judo. I think it is correct C this way but I am
especially grateful for further review there.


Current test results:
---------------------

An unaffected SDHI instance (no eMMC (R-Car H2) or no table (H3 ES2.0)):

No calib table, so flag gets disabled during the reset in the beginning
of the initialization. The same reset routine will be called when tuning
fails.

     kworker/0:0-3     [000] ....     2.799451: renesas_sdhi_reset_hs400_mode: ee100000.sd: calib table 00000000
     kworker/0:0-3     [000] ....     2.799459: renesas_sdhi_hw_reset: ee100000.sd: reset! flag disabled

An SDHI instance with a HS400 capable eMMC connected (R-Car M3-N):

When preparing HS400 tuning, a calib table is found. So, (potential) old
HS400 tuning gets reset and the manual adjustment gets disabled, the
runtime flag (signalling new manual adjustment will be needed) is set:

     kworker/1:2-139   [001] ....     4.028232: renesas_sdhi_reset_hs400_mode: ee140000.sd: calib table ffff800010c76ee8
     kworker/1:2-139   [001] ....     4.028237: renesas_sdhi_reset_hs400_mode: ee140000.sd: adjustment disabled
     kworker/1:2-139   [001] ....     4.028239: renesas_sdhi_prepare_hs400_tuning: ee140000.sd: flag enabled

Lots of tuning CMDs:

     kworker/0:1-21    [000] ....     4.028370: renesas_sdhi_fixup_request: ee140000.sd: opcode 21, flag 1
     kworker/0:1-21    [000] ....     4.028576: renesas_sdhi_fixup_request: ee140000.sd: opcode 21, flag 1
     kworker/0:1-21    [000] ....     4.028668: renesas_sdhi_fixup_request: ee140000.sd: opcode 21, flag 1
     kworker/0:1-21    [000] ....     4.028754: renesas_sdhi_fixup_request: ee140000.sd: opcode 21, flag 1
     kworker/0:1-21    [000] ....     4.028832: renesas_sdhi_fixup_request: ee140000.sd: opcode 21, flag 1
     kworker/0:1-21    [000] ....     4.028909: renesas_sdhi_fixup_request: ee140000.sd: opcode 21, flag 1
     kworker/0:1-21    [000] ....     4.028989: renesas_sdhi_fixup_request: ee140000.sd: opcode 21, flag 1
     kworker/0:1-21    [000] ....     4.029065: renesas_sdhi_fixup_request: ee140000.sd: opcode 21, flag 1
     kworker/0:1-21    [000] ....     4.029149: renesas_sdhi_fixup_request: ee140000.sd: opcode 21, flag 1
     kworker/0:1-21    [000] ....     4.029228: renesas_sdhi_fixup_request: ee140000.sd: opcode 21, flag 1
     kworker/0:1-21    [000] ....     4.029302: renesas_sdhi_fixup_request: ee140000.sd: opcode 21, flag 1
     kworker/0:1-21    [000] ....     4.029378: renesas_sdhi_fixup_request: ee140000.sd: opcode 21, flag 1
     kworker/0:1-21    [000] ....     4.029453: renesas_sdhi_fixup_request: ee140000.sd: opcode 21, flag 1
     kworker/0:1-21    [000] ....     4.029532: renesas_sdhi_fixup_request: ee140000.sd: opcode 21, flag 1
     kworker/0:1-21    [000] ....     4.029612: renesas_sdhi_fixup_request: ee140000.sd: opcode 21, flag 1
     kworker/0:1-21    [000] ....     4.029694: renesas_sdhi_fixup_request: ee140000.sd: opcode 21, flag 1
     kworker/0:1-21    [000] ....     4.029775: renesas_sdhi_fixup_request: ee140000.sd: opcode 6, flag 1

First CMD13 after tuning discovered, enable adjustment, clear runtime
flag, show replacement value:

     kworker/0:1-21    [000] ....     4.030294: renesas_sdhi_fixup_request: ee140000.sd: opcode 13, flag 1
     kworker/0:1-21    [000] ....     4.030299: renesas_sdhi_fixup_request: ee140000.sd: adjustment enabled, flag disabled
     kworker/0:1-21    [000] ....     4.030300: renesas_sdhi_fixup_request: code 0 replacement 1

And then checksumming a large file works without performance
regressions. Retunes happen once occasionally and follow the above
pattern exactly (with different replacement values, though).

So, again a lot of text but I want interested parties to verify results.

Looking forward to comments, although I won't complain if this is the
final version ;)

Thanks and kind regards,

   Wolfram


Wolfram Sang (2):
  mmc: tmio: add generic hook to fixup after a completed request
  mmc: renesas_sdhi: support manual calibration

 drivers/mmc/host/renesas_sdhi.h      |   5 +
 drivers/mmc/host/renesas_sdhi_core.c | 152 ++++++++++++++++++++++++++-
 drivers/mmc/host/tmio_mmc.h          |   1 +
 drivers/mmc/host/tmio_mmc_core.c     |   3 +
 4 files changed, 159 insertions(+), 2 deletions(-)

-- 
2.20.1

