Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B31D225A79D
	for <lists+linux-renesas-soc@lfdr.de>; Wed,  2 Sep 2020 10:18:41 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726536AbgIBIS1 (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Wed, 2 Sep 2020 04:18:27 -0400
Received: from www.zeus03.de ([194.117.254.33]:39446 "EHLO mail.zeus03.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726426AbgIBISW (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 2 Sep 2020 04:18:22 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=simple; d=sang-engineering.com; h=
        from:to:cc:subject:date:message-id:mime-version
        :content-transfer-encoding; s=k1; bh=Z4EqBe/WhXvNMVxykvKKGmGLqZ/
        45NhghU6Ulz8UWpo=; b=RnSQVEkWO54TWlqKJ8zeOSxneuuo/f5w/2QTZtONy26
        SzXvFA//P8TJmunhAfP/AnIdPSot49aM9h+hjqcbAIAiHTh6fOgngZeZHNopsNPa
        p+e4oe5EfozqUCRVqsyAb96SIREF/D6m2ey869T3He9IlrUQkPEoIw2xqkdjB3zU
        =
Received: (qmail 2768702 invoked from network); 2 Sep 2020 10:18:19 +0200
Received: by mail.zeus03.de with ESMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 2 Sep 2020 10:18:19 +0200
X-UD-Smtp-Session: l3s3148p1@/OZDR1CuJM0gAwDPXwgJAIvFhnYIE9zj
From:   Wolfram Sang <wsa+renesas@sang-engineering.com>
To:     linux-mmc@vger.kernel.org
Cc:     linux-renesas-soc@vger.kernel.org,
        Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>,
        Wolfram Sang <wsa+renesas@sang-engineering.com>
Subject: [PATCH v2 0/2] mmc: renesas_sdhi: support manual calibration
Date:   Wed,  2 Sep 2020 10:18:10 +0200
Message-Id: <20200902081812.1591-1-wsa+renesas@sang-engineering.com>
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

Changes since v1:
	* correction is now enabled after tuning is complete not when it
	  is initiated
	* rebased to new version of "fix stalled SCC series" which is a
	  dependency for this

There is a branch for testing here (with the debug patch on top):

git://git.kernel.org/pub/scm/linux/kernel/git/wsa/linux.git renesas/sdhi/new_manual_calib-for-5.10

Current test results (little different to v1):
----------------------------------------------

An SDHI instance with a HS400 capable eMMC connected (R-Car M3-N):

When preparing HS400 tuning, a calib table is found. So, (potential) old
HS400 tuning gets reset and the manual adjustment gets disabled. Unlike
previous series, the runtime flag is not enabled yet.

     kworker/1:2-139   [001] ....     4.160517: renesas_sdhi_reset_hs400_mode: ee140000.mmc: calib table ffff800010bc15f8
     kworker/1:2-139   [001] ....     4.160522: renesas_sdhi_reset_hs400_mode: ee140000.mmc: adjustment disabled

Lots of tuning CMDs, runtime flag still disabled:
 
     kworker/0:1-21    [000] ....     4.160630: renesas_sdhi_fixup_request: ee140000.mmc: opcode 21, flag 0
     kworker/0:1-21    [000] ....     4.160725: renesas_sdhi_fixup_request: ee140000.mmc: opcode 21, flag 0
     kworker/0:1-21    [000] ....     4.160831: renesas_sdhi_fixup_request: ee140000.mmc: opcode 21, flag 0
     kworker/0:1-21    [000] ....     4.160936: renesas_sdhi_fixup_request: ee140000.mmc: opcode 21, flag 0
     kworker/0:1-21    [000] ....     4.161024: renesas_sdhi_fixup_request: ee140000.mmc: opcode 21, flag 0
     kworker/0:1-21    [000] ....     4.161122: renesas_sdhi_fixup_request: ee140000.mmc: opcode 21, flag 0
     kworker/0:1-21    [000] ....     4.161214: renesas_sdhi_fixup_request: ee140000.mmc: opcode 21, flag 0
     kworker/0:1-21    [000] ....     4.161305: renesas_sdhi_fixup_request: ee140000.mmc: opcode 21, flag 0
     kworker/0:1-21    [000] ....     4.161407: renesas_sdhi_fixup_request: ee140000.mmc: opcode 21, flag 0
     kworker/0:1-21    [000] ....     4.161496: renesas_sdhi_fixup_request: ee140000.mmc: opcode 21, flag 0
     kworker/0:1-21    [000] ....     4.161579: renesas_sdhi_fixup_request: ee140000.mmc: opcode 21, flag 0
     kworker/0:1-21    [000] ....     4.161669: renesas_sdhi_fixup_request: ee140000.mmc: opcode 21, flag 0
     kworker/0:1-21    [000] ....     4.161762: renesas_sdhi_fixup_request: ee140000.mmc: opcode 21, flag 0
     kworker/0:1-21    [000] ....     4.161845: renesas_sdhi_fixup_request: ee140000.mmc: opcode 21, flag 0
     kworker/0:1-21    [000] ....     4.161927: renesas_sdhi_fixup_request: ee140000.mmc: opcode 21, flag 0
     kworker/0:1-21    [000] ....     4.162011: renesas_sdhi_fixup_request: ee140000.mmc: opcode 21, flag 0
     kworker/0:1-21    [000] ....     4.162074: renesas_sdhi_fixup_request: ee140000.mmc: opcode 6, flag 0
     kworker/0:1-21    [000] ....     4.162612: renesas_sdhi_fixup_request: ee140000.mmc: opcode 13, flag 0
     kworker/0:1-21    [000] ....     4.162671: renesas_sdhi_fixup_request: ee140000.mmc: opcode 6, flag 0
     kworker/0:1-21    [000] ....     4.162722: renesas_sdhi_fixup_request: ee140000.mmc: opcode 13, flag 0
     kworker/0:1-21    [000] ....     4.162778: renesas_sdhi_fixup_request: ee140000.mmc: opcode 6, flag 0

Tuning was successful, now the runtime flag gets enabled:

     kworker/1:2-139   [001] ....     4.163274: renesas_sdhi_hs400_complete: ee140000.mmc: flag enabled

First CMD13 after successful tuning, enable adjustment, clear runtime
flag, show replacement value. The replacement value is now also around
16 which is what Shimoda-san said to be an expected value at room
temerature. It used to be 31 in v1 of the series.

     kworker/0:1-21    [000] ....     4.163416: renesas_sdhi_fixup_request: ee140000.mmc: opcode 13, flag 1
     kworker/0:1-21    [000] ....     4.163421: renesas_sdhi_fixup_request: ee140000.mmc: adjustment enabled, flag disabled
     kworker/0:1-21    [000] ....     4.163422: renesas_sdhi_fixup_request: code 17 replacement 18

Normal operation continues. Some switching and block reads:

     kworker/0:1-21    [000] ....     4.163592: renesas_sdhi_fixup_request: ee140000.mmc: opcode 6, flag 0
     kworker/0:1-21    [000] ....     4.163645: renesas_sdhi_fixup_request: ee140000.mmc: opcode 13, flag 0
     kworker/0:1-21    [000] ....     4.163700: renesas_sdhi_fixup_request: ee140000.mmc: opcode 6, flag 0
     kworker/0:1-21    [000] ....     4.163747: renesas_sdhi_fixup_request: ee140000.mmc: opcode 13, flag 0
     kworker/0:1-21    [000] ....     4.217134: renesas_sdhi_fixup_request: ee140000.mmc: opcode 17, flag 0
     kworker/0:1-21    [000] ....     4.217357: renesas_sdhi_fixup_request: ee140000.mmc: opcode 17, flag 0
	...

And then checksumming a large file works without performance
regressions. Unlike the previous version, retunes do not happen
occasionally, so the new replacement value is indeed better.

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

