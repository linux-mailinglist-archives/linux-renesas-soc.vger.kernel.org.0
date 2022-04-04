Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 9F5424F14EE
	for <lists+linux-renesas-soc@lfdr.de>; Mon,  4 Apr 2022 14:34:15 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1345957AbiDDMgJ (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Mon, 4 Apr 2022 08:36:09 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35128 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236450AbiDDMgJ (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 4 Apr 2022 08:36:09 -0400
Received: from mail.zeus03.de (www.zeus03.de [194.117.254.33])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id EA98B2717F
        for <linux-renesas-soc@vger.kernel.org>; Mon,  4 Apr 2022 05:34:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple; d=sang-engineering.com; h=
        from:to:cc:subject:date:message-id:mime-version
        :content-transfer-encoding; s=k1; bh=6Rcn2MUlweWB9DEK8RH0lHIHNHB
        Y2nmvM67slak2EsA=; b=keV7P27LJHpsFTZv/GVm7WNy0j2VlLQt0hECKd38xYt
        ESNK2mlrbOUM4F9E3OBEotdJ12I0jppfJoxgLqzaVoWihFF3Es1AJpnyXkJtvtS+
        ArjQdwUzsDTbPKrKyz55LoRqkZA/f34mgpoGuVS4U4MrewwtQR7oeSE9I7XJPObk
        =
Received: (qmail 1865407 invoked from network); 4 Apr 2022 14:34:11 +0200
Received: by mail.zeus03.de with ESMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 4 Apr 2022 14:34:11 +0200
X-UD-Smtp-Session: l3s3148p1@2UhhWNPbdKUgAQnoAHNmALK3JllQBOZM
From:   Wolfram Sang <wsa+renesas@sang-engineering.com>
To:     linux-mmc@vger.kernel.org
Cc:     linux-renesas-soc@vger.kernel.org,
        Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>,
        Wolfram Sang <wsa+renesas@sang-engineering.com>,
        Takeshi Saito <takeshi.saito.xv@renesas.com>
Subject: [PATCH] mmc: renesas_sdhi: R-Car V3H ES2.0 gained HS400 support
Date:   Mon,  4 Apr 2022 14:34:04 +0200
Message-Id: <20220404123404.16289-1-wsa+renesas@sang-engineering.com>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-1.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FORGED_SPF_HELO,
        RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,SPF_HELO_PASS,SPF_NONE,
        T_SCC_BODY_TEXT_LINE autolearn=no autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

The hardware evolved, so we only need to disable HS400 support on ES1.*
revisions. Update the code.

Signed-off-by: Takeshi Saito <takeshi.saito.xv@renesas.com>
[wsa: refactored to top-of-tree]
Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
---

Another HS400 update for a specific SoC. Builds fine. But I can't test
because of no HW. Reviews from Geert and/or Shimoda-san would be much
appreciated.

 drivers/mmc/host/renesas_sdhi_internal_dmac.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/mmc/host/renesas_sdhi_internal_dmac.c b/drivers/mmc/host/renesas_sdhi_internal_dmac.c
index 2cd81d22c3c3..c9585c4fd812 100644
--- a/drivers/mmc/host/renesas_sdhi_internal_dmac.c
+++ b/drivers/mmc/host/renesas_sdhi_internal_dmac.c
@@ -215,6 +215,7 @@ static const struct soc_device_attribute sdhi_quirks_match[]  = {
 	{ .soc_id = "r8a7796", .revision = "ES1.0", .data = &sdhi_quirks_4tap_nohs400_one_rx },
 	{ .soc_id = "r8a7796", .revision = "ES1.[12]", .data = &sdhi_quirks_4tap_nohs400 },
 	{ .soc_id = "r8a7796", .revision = "ES1.*", .data = &sdhi_quirks_r8a7796_es13 },
+	{ .soc_id = "r8a77980", .revision = "ES1.*", .data = &sdhi_quirks_nohs400 },
 	{ /* Sentinel. */ }
 };
 
@@ -265,7 +266,6 @@ static const struct of_device_id renesas_sdhi_internal_dmac_of_match[] = {
 	{ .compatible = "renesas,sdhi-r8a77961", .data = &of_r8a77961_compatible, },
 	{ .compatible = "renesas,sdhi-r8a77965", .data = &of_r8a77965_compatible, },
 	{ .compatible = "renesas,sdhi-r8a77970", .data = &of_r8a77970_compatible, },
-	{ .compatible = "renesas,sdhi-r8a77980", .data = &of_rcar_gen3_nohs400_compatible, },
 	{ .compatible = "renesas,sdhi-r8a77990", .data = &of_r8a77990_compatible, },
 	{ .compatible = "renesas,sdhi-r8a77995", .data = &of_rcar_gen3_nohs400_compatible, },
 	{ .compatible = "renesas,rcar-gen3-sdhi", .data = &of_rcar_gen3_compatible, },
-- 
2.30.2

