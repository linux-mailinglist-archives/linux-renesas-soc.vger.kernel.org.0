Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 04A6E6313AC
	for <lists+linux-renesas-soc@lfdr.de>; Sun, 20 Nov 2022 12:35:13 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229634AbiKTLfK (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Sun, 20 Nov 2022 06:35:10 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52528 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229508AbiKTLfJ (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Sun, 20 Nov 2022 06:35:09 -0500
Received: from mail.zeus03.de (www.zeus03.de [194.117.254.33])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5A5914F185
        for <linux-renesas-soc@vger.kernel.org>; Sun, 20 Nov 2022 03:35:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=simple; d=sang-engineering.com; h=
        from:to:cc:subject:date:message-id:mime-version
        :content-transfer-encoding; s=k1; bh=A2UC9rQneKB8tT54LG1I5bfxYGm
        X2O9SCTrffUQ6huM=; b=FP5fJbV7TOYnB52W00SOvjfpH7FL8Nn+3DWtiKOnxke
        aLwbuw9TYnEjILEKuo+sgqsL68UO2RgEDDvsKLYmmLY1AaLbyy5BP42KrxGem3+d
        5TW6N2/8xn/DEMJ4luIM/I4qMq+M0eVIW8VfJWJsXWCP66R/AP+W8a1XM9+8mNLE
        =
Received: (qmail 2515197 invoked from network); 20 Nov 2022 12:35:02 +0100
Received: by mail.zeus03.de with ESMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 20 Nov 2022 12:35:02 +0100
X-UD-Smtp-Session: l3s3148p1@OV1YVOXtKJlehh99
From:   Wolfram Sang <wsa+renesas@sang-engineering.com>
To:     linux-mmc@vger.kernel.org
Cc:     linux-renesas-soc@vger.kernel.org,
        Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>,
        Wolfram Sang <wsa+renesas@sang-engineering.com>
Subject: [PATCH v2 0/4] mmc: renesas_sdhi: upport improvements from BSP
Date:   Sun, 20 Nov 2022 12:34:53 +0100
Message-Id: <20221120113457.42010-1-wsa+renesas@sang-engineering.com>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-0.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FORGED_SPF_HELO,
        RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,SPF_HELO_PASS,SPF_NONE
        autolearn=no autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

This series upports two BSP improvements in a refactored way. BSP patch
de9461ece1fa ("mmc: renesas_sdhi: scc_ctl is always set in after R-Car
Gen3") made sure we have a pointer to always reset SCC. I refactored it
to include Gen2 as well, so we can optimize the following code a bit.
This is patch 1. BSP patch 15d7abbfc3f0 ("mmc: renesas_sdhi: reset
calibration register") added a new quirk for devices which always should
disable HS400 adjustment. This was only applicable for SoCs which either
had bad_taps or needed a calibration table. So, I simply used this logic
directly instead of a quirk. This is patch 2.

Two cleanups come afterwards. To increase readability, I finally did
something I wanted to do for some time now. Having a helper to check for
SDHI quirks. This is patch 3. And while working on this, I discovered a
new macro from the MMC core which we can make use of. This is patch 4.

The series has been tested on a Salvator-XS (R-Car M3-N) and a Lager
(R-Car H2) board. The patches are based on mmc/next as of today as they
depend on d901e2ba566 ("mmc: renesas_sdhi: take DMA end interrupts into
account"). A branch can be found here:

git://git.kernel.org/pub/scm/linux/kernel/git/wsa/linux.git renesas/sdhi/for-6.2

Let me know what you think!

Happy hacking,

   Wolfram

Changes since V1:
* added another improvement to the series
* reordered cleanups last so backporting fixes is easier


Wolfram Sang (4):
  mmc: renesas_sdhi: alway populate SCC pointer
  mmc: renesas_sdhi: better reset from HS400 mode
  mmc: renesas_sdhi: add helper to access quirks
  mmc: renesas_sdhi: use new convenience macro from MMC core

 drivers/mmc/host/renesas_sdhi.h               |  2 ++
 drivers/mmc/host/renesas_sdhi_core.c          | 29 ++++++++++---------
 drivers/mmc/host/renesas_sdhi_internal_dmac.c |  8 ++---
 3 files changed, 21 insertions(+), 18 deletions(-)

-- 
2.30.2

