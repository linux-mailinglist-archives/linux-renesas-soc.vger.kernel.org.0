Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id C506F665825
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 11 Jan 2023 10:53:02 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232027AbjAKJw7 (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Wed, 11 Jan 2023 04:52:59 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51616 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S238972AbjAKJvT (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 11 Jan 2023 04:51:19 -0500
Received: from mail.zeus03.de (www.zeus03.de [194.117.254.33])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 06B2712AB7
        for <linux-renesas-soc@vger.kernel.org>; Wed, 11 Jan 2023 01:49:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=simple; d=sang-engineering.com; h=
        from:to:cc:subject:date:message-id:mime-version
        :content-transfer-encoding; s=k1; bh=/TMA3tuEf4Ib1PleCbZv6IqdQYG
        yOKugKcaNKodoKmA=; b=C9jLbAMNM4mZtAs/ANElnxITf2KjRmnatxjRW+m9mAp
        Qq+uv3D7z4FZPoCR1FMcpN2Yot2miuLWSMCigTvBex3Sgxh/j5A8gFgKeG3Wi28S
        3s0KJ6fq4hGj4FBv7t8O97OZUWkjChi4WGRYdfc6EXxXCICvzxZF5t881W+Dmlds
        =
Received: (qmail 159421 invoked from network); 11 Jan 2023 10:49:56 +0100
Received: by mail.zeus03.de with ESMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 11 Jan 2023 10:49:56 +0100
X-UD-Smtp-Session: l3s3148p1@G5837PnxYMxehh9g
From:   Wolfram Sang <wsa+renesas@sang-engineering.com>
To:     linux-renesas-soc@vger.kernel.org
Cc:     Wolfram Sang <wsa+renesas@sang-engineering.com>
Subject: [PATCH] arm64: dts: renesas: condor-i: add HS400 support for eMMC
Date:   Wed, 11 Jan 2023 10:49:44 +0100
Message-Id: <20230111094944.5996-1-wsa+renesas@sang-engineering.com>
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

HS400 support for R-Car V3H ES2.0 has been fixed, so enable it on this
board.

Signed-off-by: LUU HOAI <hoai.luu.ub@renesas.com>
Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
---
 arch/arm64/boot/dts/renesas/r8a77980a-condor-i.dts | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/arch/arm64/boot/dts/renesas/r8a77980a-condor-i.dts b/arch/arm64/boot/dts/renesas/r8a77980a-condor-i.dts
index 9f488dea0f34..53fc21709345 100644
--- a/arch/arm64/boot/dts/renesas/r8a77980a-condor-i.dts
+++ b/arch/arm64/boot/dts/renesas/r8a77980a-condor-i.dts
@@ -13,3 +13,7 @@ / {
 	model = "Renesas Condor-I board based on r8a77980A (ES2.0)";
 	compatible = "renesas,condor-i", "renesas,r8a77980a", "renesas,r8a77980";
 };
+
+&mmc0 {
+	mmc-hs400-1_8v;
+};
-- 
2.30.2

