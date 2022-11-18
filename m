Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id A314762FF8D
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 18 Nov 2022 22:46:09 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229666AbiKRVqI (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Fri, 18 Nov 2022 16:46:08 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49700 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230516AbiKRVqI (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 18 Nov 2022 16:46:08 -0500
Received: from mail.zeus03.de (www.zeus03.de [194.117.254.33])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4F95369DE7
        for <linux-renesas-soc@vger.kernel.org>; Fri, 18 Nov 2022 13:46:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=simple; d=sang-engineering.com; h=
        from:to:cc:subject:date:message-id:mime-version
        :content-transfer-encoding; s=k1; bh=I+n/cSBOlK+2oPfyvEXQ9g0vHwL
        U7toRyiBqdqVkVkE=; b=hhALRwZjACO0bG+E/Wyo5GW90d6LEig0TIQD9thsryj
        NypfiETaRo2y+6kEesft70Gh9Au6ajxvJ8AAMt5NtSeAshgTgdN1bDA6iDgUitAj
        xiQP2xVdJi34DPd29lcPIlMLx2PAuDg8dXn4EPdo1Pr4E4CU6dzlYZ7fe1leiXh8
        =
Received: (qmail 1916244 invoked from network); 18 Nov 2022 22:46:04 +0100
Received: by mail.zeus03.de with ESMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 18 Nov 2022 22:46:04 +0100
X-UD-Smtp-Session: l3s3148p1@lEvpocXtUIdehh99
From:   Wolfram Sang <wsa+renesas@sang-engineering.com>
To:     linux-mmc@vger.kernel.org
Cc:     linux-renesas-soc@vger.kernel.org,
        Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>,
        Wolfram Sang <wsa+renesas@sang-engineering.com>
Subject: [PATCH 0/2] mmc: renesas_sdhi: upport better HS400 reset from BSP
Date:   Fri, 18 Nov 2022 22:45:54 +0100
Message-Id: <20221118214556.81763-1-wsa+renesas@sang-engineering.com>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-1.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FORGED_SPF_HELO,
        RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,SPF_HELO_PASS,SPF_NONE
        autolearn=no autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

This small series upports a BSP improvement in a refactored way. The
original patch 15d7abbfc3f0 ("mmc: renesas_sdhi: reset calibration register")
added a new quirk for devices which always should disable HS400
adjustment. This was only applicable for SoCs which either had bad_taps
or needed a calibration table. So, I simply used this logic directly.
This is patch 2.

To achieve this in a readable way, I finally did something I wanted to
do for some time now. Having a helper to check for SDHI quirks. This is
patch 1.

The series has been tested on a Salvator-XS (R-Car M3-N). The patches
are based on mmc/next as of today as they depend on d901e2ba566 ("mmc:
renesas_sdhi: take DMA end interrupts into account").

Let me know what you think!

Happy hacking,

   Wolfram


Wolfram Sang (2):
  mmc: renesas_sdhi: add helper to access quirks
  mmc: renesas_sdhi: better reset from HS400 mode

 drivers/mmc/host/renesas_sdhi.h               |  2 ++
 drivers/mmc/host/renesas_sdhi_core.c          | 18 +++++++++---------
 drivers/mmc/host/renesas_sdhi_internal_dmac.c |  8 ++++----
 3 files changed, 15 insertions(+), 13 deletions(-)

-- 
2.30.2

