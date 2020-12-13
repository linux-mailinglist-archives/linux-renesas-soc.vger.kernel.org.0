Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C6C572D8F86
	for <lists+linux-renesas-soc@lfdr.de>; Sun, 13 Dec 2020 19:47:59 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2392871AbgLMSpo (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Sun, 13 Dec 2020 13:45:44 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60188 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1732699AbgLMSjg (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Sun, 13 Dec 2020 13:39:36 -0500
Received: from mail-il1-x143.google.com (mail-il1-x143.google.com [IPv6:2607:f8b0:4864:20::143])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id EE890C0617B0;
        Sun, 13 Dec 2020 10:38:28 -0800 (PST)
Received: by mail-il1-x143.google.com with SMTP id v3so13806430ilo.5;
        Sun, 13 Dec 2020 10:38:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=m5YgN6qqhZgsLehjuXc972ccf0CgA0fEb+BYfoDU6UA=;
        b=UTniVvkHiG+IuE3tQFTlnM8rkaY06ZUKDY26U5uW0vpWvgTKVHImIGpNU49ozYyYoT
         zaj2aXwnPanlSurwjTzlozvZtoA3Xy5+VEVqOaf1307dWJMbzq3vWX/sP4VZgs3b/wGg
         8HrL0RLc6BxJ1Ax8Ifm8WIsnUbSYlalaWS5e3Br+K9dKsV8+iZ4opjm9IoGrBrUfVJ9D
         y76+ql/T6FWhZs8dd3u56HVzybNhn8YyimXo6U9I9lKgDS0dyd+9Oe/F2u2yUgRIlsUX
         WLDHcg30V/wzzdv5Y8EmSP/KFpiBJf5or7xiKBLVbZIDO7r+06kyFVmg0NdhitmfseBz
         FTTg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=m5YgN6qqhZgsLehjuXc972ccf0CgA0fEb+BYfoDU6UA=;
        b=LYOE1sG4+6as1ADEGlqI+XxiIjDotmEIgdNncfyVXXp4tAbTK+P4E6TQ7mYoLp9mhs
         K5q7ocQx6XuTAB7a17unwDLBgRdPoMAr94fBu+Xa/1BoznhLX3S15cXo+EFzLiw3kJZ0
         zcveI5itp3c499aK43ikMLct1U+AX1E5V0thyVaIpjW5VaoCfKtymKOSHJj8prnoJxXW
         5uqEdyU5ML5MG8/rXq42EFqUmOgvShA/99+4Bypqgk3wFHYJUShpy9c20iX5QTbGIN8l
         csRx2L/QZJPzdjAPiXXeplfftz3jUSV7qjW1B00FDTwlbY2HtHRu2KrVkPJvj333OvtL
         dlGw==
X-Gm-Message-State: AOAM532IsTxOdszfrVaxR2Okbld2r3hwyaRp8h9e3TOyTQYym3x+NU14
        1kw5J3dxgPJPguuRD5WT+O4xNikj9fodjQ==
X-Google-Smtp-Source: ABdhPJz6YYA+/0mMo3J9UskzFnH01qlEcNfdJvylEJB/Y8sHkY5/zcn8ZijzxlwjFox9j324jaVHBw==
X-Received: by 2002:a92:5:: with SMTP id 5mr29848324ila.150.1607884707969;
        Sun, 13 Dec 2020 10:38:27 -0800 (PST)
Received: from aford-IdeaCentre-A730.lan ([2601:448:8400:9e8:f45d:df49:9a4c:4914])
        by smtp.gmail.com with ESMTPSA id o11sm7804532ioa.37.2020.12.13.10.38.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 13 Dec 2020 10:38:27 -0800 (PST)
From:   Adam Ford <aford173@gmail.com>
To:     linux-renesas-soc@vger.kernel.org
Cc:     aford@beaconembedded.com, Adam Ford <aford173@gmail.com>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Magnus Damm <magnus.damm@gmail.com>,
        Rob Herring <robh+dt@kernel.org>, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH 08/18] arm64: dts: renesas: beacon: Enable SCIF4
Date:   Sun, 13 Dec 2020 12:37:48 -0600
Message-Id: <20201213183759.223246-9-aford173@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20201213183759.223246-1-aford173@gmail.com>
References: <20201213183759.223246-1-aford173@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

The baseboard supports SCIF4, enable the pins and the node for it.

Signed-off-by: Adam Ford <aford173@gmail.com>
---
 .../boot/dts/renesas/beacon-renesom-baseboard.dtsi    | 11 +++++++++++
 1 file changed, 11 insertions(+)

diff --git a/arch/arm64/boot/dts/renesas/beacon-renesom-baseboard.dtsi b/arch/arm64/boot/dts/renesas/beacon-renesom-baseboard.dtsi
index aab39aae5ccb..bf047a9836ed 100644
--- a/arch/arm64/boot/dts/renesas/beacon-renesom-baseboard.dtsi
+++ b/arch/arm64/boot/dts/renesas/beacon-renesom-baseboard.dtsi
@@ -578,6 +578,11 @@ pwm2_pins: pwm2 {
 		function = "pwm2";
 	};
 
+	scif4_pins: scif4 {
+		groups = "scif4_data_c";
+		function = "scif4";
+	};
+
 	sdhi0_pins: sd0 {
 		groups = "sdhi0_data4", "sdhi0_ctrl";
 		function = "sdhi0";
@@ -706,6 +711,12 @@ &scif0 {
 	status = "okay";
 };
 
+&scif4 {
+	pinctrl-0 = <&scif4_pins>;
+	pinctrl-names = "default";
+	status = "okay";
+};
+
 &scif5 {
 	pinctrl-0 = <&scif5_pins>;
 	pinctrl-names = "default";
-- 
2.25.1

