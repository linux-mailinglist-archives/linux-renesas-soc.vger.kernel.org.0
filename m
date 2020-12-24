Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 85B812E282B
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 24 Dec 2020 18:06:24 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728795AbgLXRGK (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Thu, 24 Dec 2020 12:06:10 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53454 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728039AbgLXRGJ (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 24 Dec 2020 12:06:09 -0500
Received: from mail-il1-x12d.google.com (mail-il1-x12d.google.com [IPv6:2607:f8b0:4864:20::12d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3FAAEC061575;
        Thu, 24 Dec 2020 09:05:29 -0800 (PST)
Received: by mail-il1-x12d.google.com with SMTP id 75so2409062ilv.13;
        Thu, 24 Dec 2020 09:05:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=RC7cz4XzV8lhMElGRYTUL2l/Wg2mnAz5kpiinuzSRHs=;
        b=u70PCBTkSAJsDuuGAOBOpSB30KHsWffMNC5s9NcLuGup9OdvV7dIiUKmkAwKGqpA9X
         4JCpXpWJz/P5FIWgOibnY9Sri3PZr4sktM7pDgBnmkfWzEZUGW6twhMmJt++vNHYdo39
         KJ7UgEv9cEUyWj8dI0yT0Lvvv8RVU9VrwiUDL5G4a8/RaPWO3sqMwZaz4KjyqsqE/vik
         PnTGi5wIHBceAJjU88qZjziRg0+wDh2lpsuKVlZcB4aD/opDcLJ8MfpdHbQsJzV95XZW
         QoexBzQOm+lix0w46LXnKcrw1mzFvP5XNxE60i4Ul1cvFfWRxQOtEaV7+M5Pudp5Ao7l
         wJHg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=RC7cz4XzV8lhMElGRYTUL2l/Wg2mnAz5kpiinuzSRHs=;
        b=QfeHKZpFa3OdMANyLXkzIbvNtL549QsICy9jy/GHYtAVUP+rvKOe3rpJgjdJqFbnEb
         hed1RqlJD0pOcJ+e+qLNCH8hqK0yhx16poUcGUcKtv9C5z9dliqMiHKEqLihRnytduTi
         9VRtji80zlX+ZDLXGKaCMbYqTQe4C1PWa8+1wVQOZemRkr/TNGU9HBC2DUtxbGH8iyUB
         lD2G98ggBu325A598QnIW/3yDjh4vhwxbVqnA5vIsUU1S6tbIi8vDNzMV2069e8lbQg6
         F5RpeztXKzg1cMZfY/tPAu2wGQcjhquNVU0ZERm9sLfRmj55j1FNNh50ETs2K8lI0v7C
         AZWg==
X-Gm-Message-State: AOAM531oB3P+niSwWVPBTOAgQRx7ZnSe5qbn9jYBivKgO9NEeBR2vUh9
        h0VfdAXWo9YZIz23EQz/4fvIK/5TdHM=
X-Google-Smtp-Source: ABdhPJzn+e5XK45iUIbW7VfVH3TgDR1AmeUm2ERnFIrdsgiZJsT8INq9IAdp0/+2zEpeNz5KVcqqug==
X-Received: by 2002:a92:c990:: with SMTP id y16mr30772729iln.35.1608829528115;
        Thu, 24 Dec 2020 09:05:28 -0800 (PST)
Received: from aford-IdeaCentre-A730.lan ([2601:448:8400:9e8:f45d:df49:9a4c:4914])
        by smtp.gmail.com with ESMTPSA id f20sm9732965ilr.85.2020.12.24.09.05.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 24 Dec 2020 09:05:27 -0800 (PST)
From:   Adam Ford <aford173@gmail.com>
To:     linux-renesas-soc@vger.kernel.org
Cc:     aford@beaconembedded.com, Adam Ford <aford173@gmail.com>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Magnus Damm <magnus.damm@gmail.com>,
        Rob Herring <robh+dt@kernel.org>, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH V2 2/9] arm64: dts: renesas: beacon kit: Fix Audio Clock sources
Date:   Thu, 24 Dec 2020 11:04:55 -0600
Message-Id: <20201224170502.2254683-2-aford173@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20201224170502.2254683-1-aford173@gmail.com>
References: <20201224170502.2254683-1-aford173@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

The SoC was expecting two clock sources with different frequencies.
One to support 44.1KHz and one to support 48KHz.  With the newly added
ability to configure the programmably clock, configure both clocks.

Assign the rcar-sound clocks to reference the versaclock instead of
the fixed clock.

Signed-off-by: Adam Ford <aford173@gmail.com>
---
V2:  Go from fixed-factor-clock to just redefining the rcar-sound node
     to reference the versaclock instead of the audio_clk_a.

diff --git a/arch/arm64/boot/dts/renesas/beacon-renesom-baseboard.dtsi b/arch/arm64/boot/dts/renesas/beacon-renesom-baseboard.dtsi
index 46a3ba895330..4e86d308d07e 100644
--- a/arch/arm64/boot/dts/renesas/beacon-renesom-baseboard.dtsi
+++ b/arch/arm64/boot/dts/renesas/beacon-renesom-baseboard.dtsi
@@ -223,12 +223,6 @@ x304_clk: x304-clock {
 	};
 };
 
-&audio_clk_a {
-	clock-frequency = <24576000>;
-	assigned-clocks = <&versaclock6_bb 4>;
-	assigned-clock-rates = <24576000>;
-};
-
 &audio_clk_b {
 	clock-frequency = <22579200>;
 };
@@ -574,7 +568,7 @@ sound_pins: sound {
 	};
 
 	sound_clk_pins: sound_clk {
-		groups = "audio_clk_a_a";
+		groups = "audio_clk_a_a", "audio_clk_b_a";
 		function = "audio_clk";
 	};
 
@@ -625,23 +619,6 @@ &rcar_sound {
 
 	status = "okay";
 
-	clocks = <&cpg CPG_MOD 1005>,
-		 <&cpg CPG_MOD 1006>, <&cpg CPG_MOD 1007>,
-		 <&cpg CPG_MOD 1008>, <&cpg CPG_MOD 1009>,
-		 <&cpg CPG_MOD 1010>, <&cpg CPG_MOD 1011>,
-		 <&cpg CPG_MOD 1012>, <&cpg CPG_MOD 1013>,
-		 <&cpg CPG_MOD 1014>, <&cpg CPG_MOD 1015>,
-		 <&cpg CPG_MOD 1022>, <&cpg CPG_MOD 1023>,
-		 <&cpg CPG_MOD 1024>, <&cpg CPG_MOD 1025>,
-		 <&cpg CPG_MOD 1026>, <&cpg CPG_MOD 1027>,
-		 <&cpg CPG_MOD 1028>, <&cpg CPG_MOD 1029>,
-		 <&cpg CPG_MOD 1030>, <&cpg CPG_MOD 1031>,
-		 <&cpg CPG_MOD 1020>, <&cpg CPG_MOD 1021>,
-		 <&cpg CPG_MOD 1020>, <&cpg CPG_MOD 1021>,
-		 <&cpg CPG_MOD 1019>, <&cpg CPG_MOD 1018>,
-		 <&audio_clk_a>, <&audio_clk_b>, <&audio_clk_c>,
-		 <&cpg CPG_CORE R8A774A1_CLK_S0D4>;
-
 	ports {
 		#address-cells = <1>;
 		#size-cells = <0>;
diff --git a/arch/arm64/boot/dts/renesas/r8a774a1-beacon-rzg2m-kit.dts b/arch/arm64/boot/dts/renesas/r8a774a1-beacon-rzg2m-kit.dts
index 2c5b057c30c6..25eeac411f12 100644
--- a/arch/arm64/boot/dts/renesas/r8a774a1-beacon-rzg2m-kit.dts
+++ b/arch/arm64/boot/dts/renesas/r8a774a1-beacon-rzg2m-kit.dts
@@ -27,3 +27,24 @@ chosen {
 		stdout-path = "serial0:115200n8";
 	};
 };
+
+/* Reference versaclock instead of audio_clk_a */
+&rcar_sound {
+	clocks = <&cpg CPG_MOD 1005>,
+		 <&cpg CPG_MOD 1006>, <&cpg CPG_MOD 1007>,
+		 <&cpg CPG_MOD 1008>, <&cpg CPG_MOD 1009>,
+		 <&cpg CPG_MOD 1010>, <&cpg CPG_MOD 1011>,
+		 <&cpg CPG_MOD 1012>, <&cpg CPG_MOD 1013>,
+		 <&cpg CPG_MOD 1014>, <&cpg CPG_MOD 1015>,
+		 <&cpg CPG_MOD 1022>, <&cpg CPG_MOD 1023>,
+		 <&cpg CPG_MOD 1024>, <&cpg CPG_MOD 1025>,
+		 <&cpg CPG_MOD 1026>, <&cpg CPG_MOD 1027>,
+		 <&cpg CPG_MOD 1028>, <&cpg CPG_MOD 1029>,
+		 <&cpg CPG_MOD 1030>, <&cpg CPG_MOD 1031>,
+		 <&cpg CPG_MOD 1020>, <&cpg CPG_MOD 1021>,
+		 <&cpg CPG_MOD 1020>, <&cpg CPG_MOD 1021>,
+		 <&cpg CPG_MOD 1019>, <&cpg CPG_MOD 1018>,
+		 <&versaclock6_bb 4>, <&audio_clk_b>,
+		 <&audio_clk_c>,
+		 <&cpg CPG_CORE R8A774A1_CLK_S0D4>;
+};
-- 
2.25.1

