Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id D61C84E3C03
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 22 Mar 2022 10:55:31 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232216AbiCVJ4z (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Tue, 22 Mar 2022 05:56:55 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37810 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232234AbiCVJ4w (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 22 Mar 2022 05:56:52 -0400
Received: from mail.zeus03.de (www.zeus03.de [194.117.254.33])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 43FDE7E5BC
        for <linux-renesas-soc@vger.kernel.org>; Tue, 22 Mar 2022 02:55:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple; d=sang-engineering.com; h=
        from:to:cc:subject:date:message-id:in-reply-to:references
        :mime-version:content-transfer-encoding; s=k1; bh=ZapqxcZIUvJ4Qn
        ZHiW2gyk3DnG6ywmX+tceW2OqvBoA=; b=wothT5PdsRkwkjKKk/qDBJnZC34yzT
        0qaXO8XtuRX3WDE65I44h0/SAkN/BrBwC8s75OfQ0SwbXdY28ttSAkdXsoeRFi02
        5N9P0Lq5ofl59R9tTnYVrNQsGJYkwAVSoUp/U4Yd1NRo0LkC6BhfnhcjImrEUJwe
        utQ742ZXH4kT4=
Received: (qmail 1276172 invoked from network); 22 Mar 2022 10:55:22 +0100
Received: by mail.zeus03.de with ESMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 22 Mar 2022 10:55:22 +0100
X-UD-Smtp-Session: l3s3148p1@BZV5nMvaSOsgAQnoAGKBAIBddhzCa5pi
From:   Wolfram Sang <wsa+renesas@sang-engineering.com>
To:     linux-renesas-soc@vger.kernel.org
Cc:     devicetree@vger.kernel.org,
        Wolfram Sang <wsa+renesas@sang-engineering.com>
Subject: [PATCH 5/5] arm64: dts: renesas: rcar-gen4: add interrupt property to the watchdog node
Date:   Tue, 22 Mar 2022 10:55:12 +0100
Message-Id: <20220322095512.4707-6-wsa+renesas@sang-engineering.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220322095512.4707-1-wsa+renesas@sang-engineering.com>
References: <20220322095512.4707-1-wsa+renesas@sang-engineering.com>
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

Driver doesn't use it yet, but let's describe the HW properly.

Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
---
 arch/arm64/boot/dts/renesas/r8a779a0.dtsi | 1 +
 arch/arm64/boot/dts/renesas/r8a779f0.dtsi | 1 +
 2 files changed, 2 insertions(+)

diff --git a/arch/arm64/boot/dts/renesas/r8a779a0.dtsi b/arch/arm64/boot/dts/renesas/r8a779a0.dtsi
index c4be288b1912..39b1391c0cb2 100644
--- a/arch/arm64/boot/dts/renesas/r8a779a0.dtsi
+++ b/arch/arm64/boot/dts/renesas/r8a779a0.dtsi
@@ -81,6 +81,7 @@ rwdt: watchdog@e6020000 {
 			compatible = "renesas,r8a779a0-wdt",
 				     "renesas,rcar-gen3-wdt";
 			reg = <0 0xe6020000 0 0x0c>;
+			interrupts = <GIC_SPI 23 IRQ_TYPE_LEVEL_HIGH>;
 			clocks = <&cpg CPG_MOD 907>;
 			power-domains = <&sysc R8A779A0_PD_ALWAYS_ON>;
 			resets = <&cpg 907>;
diff --git a/arch/arm64/boot/dts/renesas/r8a779f0.dtsi b/arch/arm64/boot/dts/renesas/r8a779f0.dtsi
index b0241aa29fc8..df46fb87cffc 100644
--- a/arch/arm64/boot/dts/renesas/r8a779f0.dtsi
+++ b/arch/arm64/boot/dts/renesas/r8a779f0.dtsi
@@ -63,6 +63,7 @@ rwdt: watchdog@e6020000 {
 			compatible = "renesas,r8a779f0-wdt",
 				     "renesas,rcar-gen4-wdt";
 			reg = <0 0xe6020000 0 0x0c>;
+			interrupts = <GIC_SPI 515 IRQ_TYPE_LEVEL_HIGH>;
 			clocks = <&cpg CPG_MOD 907>;
 			power-domains = <&sysc R8A779F0_PD_ALWAYS_ON>;
 			resets = <&cpg 907>;
-- 
2.34.1

