Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id EB2A52D8F69
	for <lists+linux-renesas-soc@lfdr.de>; Sun, 13 Dec 2020 19:44:36 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2388643AbgLMSjl (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Sun, 13 Dec 2020 13:39:41 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60204 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1733026AbgLMSjj (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Sun, 13 Dec 2020 13:39:39 -0500
Received: from mail-io1-xd42.google.com (mail-io1-xd42.google.com [IPv6:2607:f8b0:4864:20::d42])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E1A45C061248;
        Sun, 13 Dec 2020 10:38:36 -0800 (PST)
Received: by mail-io1-xd42.google.com with SMTP id i18so14777724ioa.1;
        Sun, 13 Dec 2020 10:38:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=/OgZeJlCecpw/jV69+gT7Zez3Y1kSFf/SBD2vw0Ux2Q=;
        b=tSnrs/7FzmF6mfaLuacUNiYk/Ad39mxGqROYN5mgXlFOn9CeH4Og3byhIM4i9VYUOp
         DNO8nNnZWZ00aECzVnDKNfvGrv8wsvHP1dCNrqkrG2PEz8Qzm0kbdtNcHgjxQBCGOsxV
         RvQ2MDW9JBmmSizG3ontdtEzzxhqpltfZx65ct2vJTseF5gaDO/iz7cVLDzoqbhjd1p1
         2hgq3bOiR7Jl1+qP4XB1+SaGKMZihJpkJgjKj4p34o2spJ2d7wR1evnq5BeFnrOY6p4s
         5RfD9g2MCbpC7uKrLIvKzgTXLWOokl4osvaNl9H2y0WOyRsYTgaUNyMk16Sq53aHNfk2
         KqjQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=/OgZeJlCecpw/jV69+gT7Zez3Y1kSFf/SBD2vw0Ux2Q=;
        b=iwJlYstY1FgshPQA9FxiDFAiH0tw9o1dw7JWCGhMlQ+wIgqy4kAs35AGSqt6rxBJqf
         L+BLWPF8h19AP0c+wJJGU95Mo5VCCiSVDxeIXuQuGN/I/z1/aBZ3L0KJHc9WcTjmwDKo
         E0UrOSmSKmLGP3NzR4IisPxt07xRuKdaWpEgRu6SezzboagGLl23VYqmqEjie0HNdKMf
         ml46B8xq8u1R68NVeMLgWLoNafM89ITIHsbGG+mBvQTn10uGphTvEQ4EnxThHCFDLImj
         THEOv8JLgp5Bi+k/3ULHlMzQz6/rEThy/A+k2pG7USvZGX5C548wy2COVCATR0wh92fs
         0z1g==
X-Gm-Message-State: AOAM5318aTIiSp5ak2BMr4vlsTIIbtyCA1YOrF3OHjQyb+S3gCxjaXAS
        yd+atVpGBUDZ2aXXn2182Ijjreuh1qmxRg==
X-Google-Smtp-Source: ABdhPJyPh/wZ6QFwKP4YPqPV/IUi1Zpckn4JdOSPBuIzMkznX8wQBDEhGzhZvCnwerhMS0uvT4Ubbw==
X-Received: by 2002:a6b:6b18:: with SMTP id g24mr27665386ioc.189.1607884715891;
        Sun, 13 Dec 2020 10:38:35 -0800 (PST)
Received: from aford-IdeaCentre-A730.lan ([2601:448:8400:9e8:f45d:df49:9a4c:4914])
        by smtp.gmail.com with ESMTPSA id o11sm7804532ioa.37.2020.12.13.10.38.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 13 Dec 2020 10:38:35 -0800 (PST)
From:   Adam Ford <aford173@gmail.com>
To:     linux-renesas-soc@vger.kernel.org
Cc:     aford@beaconembedded.com, Adam Ford <aford173@gmail.com>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Magnus Damm <magnus.damm@gmail.com>,
        Rob Herring <robh+dt@kernel.org>, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH 12/18] arm64: dts: renesas: beacon: Better describe keys
Date:   Sun, 13 Dec 2020 12:37:52 -0600
Message-Id: <20201213183759.223246-13-aford173@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20201213183759.223246-1-aford173@gmail.com>
References: <20201213183759.223246-1-aford173@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

The keys on the baseboard are laid out in an diamond pattern, up, down,
left, right and center.  Update the descriptions to make it easier to
read.

Signed-off-by: Adam Ford <aford173@gmail.com>
---
 .../dts/renesas/beacon-renesom-baseboard.dtsi | 20 +++++++++----------
 1 file changed, 10 insertions(+), 10 deletions(-)

diff --git a/arch/arm64/boot/dts/renesas/beacon-renesom-baseboard.dtsi b/arch/arm64/boot/dts/renesas/beacon-renesom-baseboard.dtsi
index beaea6de547b..db3ef33faac5 100644
--- a/arch/arm64/boot/dts/renesas/beacon-renesom-baseboard.dtsi
+++ b/arch/arm64/boot/dts/renesas/beacon-renesom-baseboard.dtsi
@@ -40,38 +40,38 @@ hdmi0_con: endpoint {
 	keys {
 		compatible = "gpio-keys";
 
-		key-1 {
+		key-1 { /* S19 */
 			gpios = <&gpio4 6 GPIO_ACTIVE_LOW>;
 			linux,code = <KEY_1>;
-			label = "Switch-1";
+			label = "Up";
 			wakeup-source;
 			debounce-interval = <20>;
 		};
-		key-2 {
+		key-2 { /*S20 */
 			gpios = <&gpio3 13 GPIO_ACTIVE_LOW>;
 			linux,code = <KEY_2>;
-			label = "Switch-2";
+			label = "Left";
 			wakeup-source;
 			debounce-interval = <20>;
 		};
-		key-3 {
+		key-3 { /* S21 */
 			gpios = <&gpio5 17 GPIO_ACTIVE_LOW>;
 			linux,code = <KEY_3>;
-			label = "Switch-3";
+			label = "Down";
 			wakeup-source;
 			debounce-interval = <20>;
 		};
-		key-4 {
+		key-4 { /* S22 */
 			gpios = <&gpio5 20 GPIO_ACTIVE_LOW>;
 			linux,code = <KEY_4>;
-			label = "Switch-4";
+			label = "Right";
 			wakeup-source;
 			debounce-interval = <20>;
 		};
-		key-5 {
+		key-5 { /* S23 */
 			gpios = <&gpio5 22 GPIO_ACTIVE_LOW>;
 			linux,code = <KEY_5>;
-			label = "Switch-4";
+			label = "Center";
 			wakeup-source;
 			debounce-interval = <20>;
 		};
-- 
2.25.1

