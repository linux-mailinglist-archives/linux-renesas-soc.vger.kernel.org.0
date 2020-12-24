Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B4DF02E2833
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 24 Dec 2020 18:06:27 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728901AbgLXRGN (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Thu, 24 Dec 2020 12:06:13 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53466 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728891AbgLXRGM (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 24 Dec 2020 12:06:12 -0500
Received: from mail-io1-xd36.google.com (mail-io1-xd36.google.com [IPv6:2607:f8b0:4864:20::d36])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A32D3C0613C1;
        Thu, 24 Dec 2020 09:05:32 -0800 (PST)
Received: by mail-io1-xd36.google.com with SMTP id i18so2493653ioa.1;
        Thu, 24 Dec 2020 09:05:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=1TmoWv7xD1jRspjs+2ARKsLutJXEqRLYfp6/Y4HPquQ=;
        b=H6WXRTdELBeLeFkSqi616GkML1oc9hRYi3OQGOZIzjU7EXPBTya8+UaDb/vz+P9/uG
         jpz5DtDRzIdMkW9NaMnSyCL9DojeOPvp6p8irKRvaDsyj10l6ZtdtFe4pILulcJS7EdZ
         KJoVXkSPsWreZw3vNhivZzuxyGgTfsXNTwgBCSU4FiAIOPqvA+evtabCqoNmRJMTyxOj
         eXsIpyV/BGSm4siykghhLIq3KqVEfS2ZGl+f0jW/MRoIgGJqNBFaj1RH7sOwx7g4gbF2
         jYCB/qMg4G3IIPF4e/OSLcI3g1m2COY4WLabbJmtaBLmzHnO2JrWRtOV3/B3Hp7/nhwQ
         g8uA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=1TmoWv7xD1jRspjs+2ARKsLutJXEqRLYfp6/Y4HPquQ=;
        b=cHU4ZIZg4k9NqaEAlIZr7/Om+t0jCneINRJRA+vg2fVIeENPxAdl5r/GKaun89/Dan
         CltkwDpr1/EYWST4+5gFU5tOV5P0VJiWOMGMNJChKFuYmBUikJiUu+2mLjuiSLKNfJn+
         MFLSNszuGW3Kj3llJ7r+P3zaQwR0TMBxgNvSTVCs1/x4rIFMW0BwqQN8nSwfML6JvHSg
         UIe3oJufnJhoqi3Isg1wxztkxia7ojUaCeMfDawQbxgf2uA4Re9JHhuesDxq7nUWSe7q
         0sKfSi1k6eY55F7R8L7baGGq1CVw3GJ17T4fe8XO3g19CnPsUzwvZijbjX8YoAldszNz
         yCcg==
X-Gm-Message-State: AOAM533pnlbnG9pAkHh0RZls4Rr0OKhHP6zdPk0szMZMstLZUEDex0Rl
        DHj3zoj2OL5/yEOtdO1Na4gtpBpos58=
X-Google-Smtp-Source: ABdhPJwRO4LdZ7sLyo1lqzETNpZw16iwUzwMt3nX310N4/gLff+4tR0MkbIhSXj0iXI4jydYoUEtsA==
X-Received: by 2002:a05:6602:3154:: with SMTP id m20mr26128758ioy.188.1608829531703;
        Thu, 24 Dec 2020 09:05:31 -0800 (PST)
Received: from aford-IdeaCentre-A730.lan ([2601:448:8400:9e8:f45d:df49:9a4c:4914])
        by smtp.gmail.com with ESMTPSA id f20sm9732965ilr.85.2020.12.24.09.05.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 24 Dec 2020 09:05:31 -0800 (PST)
From:   Adam Ford <aford173@gmail.com>
To:     linux-renesas-soc@vger.kernel.org
Cc:     aford@beaconembedded.com, Adam Ford <aford173@gmail.com>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Magnus Damm <magnus.damm@gmail.com>,
        Rob Herring <robh+dt@kernel.org>, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH V2 4/9] arm64: dts: renesas: beacon: Better describe keys
Date:   Thu, 24 Dec 2020 11:04:57 -0600
Message-Id: <20201224170502.2254683-4-aford173@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20201224170502.2254683-1-aford173@gmail.com>
References: <20201224170502.2254683-1-aford173@gmail.com>
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
V2:  Make keycode match the key name.

diff --git a/arch/arm64/boot/dts/renesas/beacon-renesom-baseboard.dtsi b/arch/arm64/boot/dts/renesas/beacon-renesom-baseboard.dtsi
index dc5e05d7a792..a54ec36c69e4 100644
--- a/arch/arm64/boot/dts/renesas/beacon-renesom-baseboard.dtsi
+++ b/arch/arm64/boot/dts/renesas/beacon-renesom-baseboard.dtsi
@@ -40,38 +40,38 @@ hdmi0_con: endpoint {
 	keys {
 		compatible = "gpio-keys";
 
-		key-1 {
+		key-1 { /* S19 */
 			gpios = <&gpio4 6 GPIO_ACTIVE_LOW>;
-			linux,code = <KEY_1>;
-			label = "Switch-1";
+			linux,code = <KEY_UP>;
+			label = "Up";
 			wakeup-source;
 			debounce-interval = <20>;
 		};
-		key-2 {
+		key-2 { /*S20 */
 			gpios = <&gpio3 13 GPIO_ACTIVE_LOW>;
-			linux,code = <KEY_2>;
-			label = "Switch-2";
+			linux,code = <KEY_LEFT>;
+			label = "Left";
 			wakeup-source;
 			debounce-interval = <20>;
 		};
-		key-3 {
+		key-3 { /* S21 */
 			gpios = <&gpio5 17 GPIO_ACTIVE_LOW>;
-			linux,code = <KEY_3>;
-			label = "Switch-3";
+			linux,code = <KEY_DOWN>;
+			label = "Down";
 			wakeup-source;
 			debounce-interval = <20>;
 		};
-		key-4 {
+		key-4 { /* S22 */
 			gpios = <&gpio5 20 GPIO_ACTIVE_LOW>;
-			linux,code = <KEY_4>;
-			label = "Switch-4";
+			linux,code = <KEY_RIGHT>;
+			label = "Right";
 			wakeup-source;
 			debounce-interval = <20>;
 		};
-		key-5 {
+		key-5 { /* S23 */
 			gpios = <&gpio5 22 GPIO_ACTIVE_LOW>;
-			linux,code = <KEY_5>;
-			label = "Switch-4";
+			linux,code = <KEY_ENTER>;
+			label = "Center";
 			wakeup-source;
 			debounce-interval = <20>;
 		};
-- 
2.25.1

