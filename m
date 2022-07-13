Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id EFE6E5733ED
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 13 Jul 2022 12:15:03 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230472AbiGMKPD (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Wed, 13 Jul 2022 06:15:03 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40804 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234677AbiGMKPC (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 13 Jul 2022 06:15:02 -0400
Received: from mail.zeus03.de (www.zeus03.de [194.117.254.33])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3F653E630C
        for <linux-renesas-soc@vger.kernel.org>; Wed, 13 Jul 2022 03:15:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple; d=sang-engineering.com; h=
        from:to:cc:subject:date:message-id:in-reply-to:references
        :mime-version:content-transfer-encoding; s=k1; bh=YsRMUTzO6nNaFa
        rKeFmPt5ILeIr4kVEHiZg/G6IvetU=; b=j/r/j8euuZkXsQcn8nI32QHm3X0lcT
        5BTAKgxVTFQR1ODdOb8n+aDVfAYvuXA7nDboB0JoikDdW3HuZOcCgpSpQ7DMYTuF
        hVsOvXHff7nYlKOOw9lB6wLMtBLLbfGoSd5AMn08nOxCYWXDs2q5dPvftqVzmx0e
        lcPHVbacPye7Q=
Received: (qmail 126409 invoked from network); 13 Jul 2022 12:14:59 +0200
Received: by mail.zeus03.de with ESMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 13 Jul 2022 12:14:59 +0200
X-UD-Smtp-Session: l3s3148p1@y96zDq3jKoMgAwDtxwdRAEXXn+yo/Rze
From:   Wolfram Sang <wsa+renesas@sang-engineering.com>
To:     linux-renesas-soc@vger.kernel.org
Cc:     Wolfram Sang <wsa+renesas@sang-engineering.com>
Subject: [PATCH 3/3] TEST: arm64: dts: renesas: spider: Enable CMT
Date:   Wed, 13 Jul 2022 12:14:47 +0200
Message-Id: <20220713101447.3804-4-wsa+renesas@sang-engineering.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220713101447.3804-1-wsa+renesas@sang-engineering.com>
References: <20220713101447.3804-1-wsa+renesas@sang-engineering.com>
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

This patch enables CMT{0|1|2|3} on the Spider board.

Only for testing, not for upstream!

Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
---
 .../boot/dts/renesas/r8a779f0-spider-cpu.dtsi    | 16 ++++++++++++++++
 1 file changed, 16 insertions(+)

diff --git a/arch/arm64/boot/dts/renesas/r8a779f0-spider-cpu.dtsi b/arch/arm64/boot/dts/renesas/r8a779f0-spider-cpu.dtsi
index 7ef9f7cfe10f..51d31a62879f 100644
--- a/arch/arm64/boot/dts/renesas/r8a779f0-spider-cpu.dtsi
+++ b/arch/arm64/boot/dts/renesas/r8a779f0-spider-cpu.dtsi
@@ -41,6 +41,22 @@ reg_3p3v: regulator-3p3v {
 	};
 };
 
+&cmt0 {
+	status = "okay";
+};
+
+&cmt1 {
+	status = "okay";
+};
+
+&cmt2 {
+	status = "okay";
+};
+
+&cmt3 {
+	status = "okay";
+};
+
 &extal_clk {
 	clock-frequency = <20000000>;
 };
-- 
2.35.1

