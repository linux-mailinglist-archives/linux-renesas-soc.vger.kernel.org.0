Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 39DF82D8F57
	for <lists+linux-renesas-soc@lfdr.de>; Sun, 13 Dec 2020 19:40:34 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727843AbgLMSjl (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Sun, 13 Dec 2020 13:39:41 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60202 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1733005AbgLMSjj (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Sun, 13 Dec 2020 13:39:39 -0500
Received: from mail-io1-xd42.google.com (mail-io1-xd42.google.com [IPv6:2607:f8b0:4864:20::d42])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id EC795C061285;
        Sun, 13 Dec 2020 10:38:34 -0800 (PST)
Received: by mail-io1-xd42.google.com with SMTP id p187so14772511iod.4;
        Sun, 13 Dec 2020 10:38:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=nmk+eviMQ8enegxteADww7ViwrA77/SammngwbF2N7Q=;
        b=EylyejQq3Hn7nOwJALdCD0H28ytN/ndEiv902VKb4qYGf2KuZ1aEta8dmv0YEtMsO3
         uJtjgeBxeMvuGWcF4Riz7ugZmIOKoHl6BGsMTfvCA4jDRyadcHObO12vcVxqvCsUucTG
         kVhcs0oJ4Iog4UZ2vPYs8Ww87hx1gvI4pBC7p17DXa1KNegczeyuQyE67OFXY0jqkAjs
         67tornLUlqDWbgaG824ZqEx/fhjXKHrhY0w7EElkoJE79DcxOawzNfYJ0KZNFg8t0dwU
         Le5A1FuNi5vxa3OHPjpxxD3V0uZax3i6eYwvuVX3aT7mwydOnZfBkq4it1Xhc5PG2nvV
         bkEA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=nmk+eviMQ8enegxteADww7ViwrA77/SammngwbF2N7Q=;
        b=ma9pE2IMXXCAaP63fIroDbx4gY3lQp3/BuVjdR8LAbQ0BxJrx+33WhcsrT5cpZTGkn
         7TUkX6eKXM4D5hzwo5tFVF7ZO+PtvhIp1p54SdhkqXjG6lshDeLoqaIq2XT966Wan9OO
         TvV/vNhSEViMQdf6MJODvYKvprPoy3B7P8RcOhHxnHCSfMkoBNbHAoBuAjuVmT/L5SFt
         RvvgVMVhnQU+kltc2VGGnQpWr90mGYrkq9zRZIjWZjXtr4ya4Bz9u5fUW0lpuWQRBxMX
         qv9DOZicB9gi4FNvcPkyz4cVlfAXanXY+Km3F/H5yCRvekOKfrOGATXSCXIFzVsllfLW
         3fxg==
X-Gm-Message-State: AOAM531lwiSCpE+9jbnZBJYEJ/dpjVdJbA7BOrpiIMKvvbFlH0lAiqy2
        2KOnGWf6h+13/lowGrfAf+YZ+Y4FU+zVfQ==
X-Google-Smtp-Source: ABdhPJwNcsXm2xG2upy/MJ1xpI8ldbUozo4gOUAyVMlb9+LtTeITtTfsDeecpq7hzsM8nenv+D5ghQ==
X-Received: by 2002:a5d:824b:: with SMTP id n11mr27535479ioo.27.1607884713968;
        Sun, 13 Dec 2020 10:38:33 -0800 (PST)
Received: from aford-IdeaCentre-A730.lan ([2601:448:8400:9e8:f45d:df49:9a4c:4914])
        by smtp.gmail.com with ESMTPSA id o11sm7804532ioa.37.2020.12.13.10.38.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 13 Dec 2020 10:38:33 -0800 (PST)
From:   Adam Ford <aford173@gmail.com>
To:     linux-renesas-soc@vger.kernel.org
Cc:     aford@beaconembedded.com, Adam Ford <aford173@gmail.com>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Magnus Damm <magnus.damm@gmail.com>,
        Rob Herring <robh+dt@kernel.org>, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH 11/18] arm64: dts: renesas: beacon: Remove redundant audio code
Date:   Sun, 13 Dec 2020 12:37:51 -0600
Message-Id: <20201213183759.223246-12-aford173@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20201213183759.223246-1-aford173@gmail.com>
References: <20201213183759.223246-1-aford173@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

The SoC's DTSI file already configures this.  There is no need to do
it again.

Signed-off-by: Adam Ford <aford173@gmail.com>
---
 .../dts/renesas/beacon-renesom-baseboard.dtsi   | 17 -----------------
 1 file changed, 17 deletions(-)

diff --git a/arch/arm64/boot/dts/renesas/beacon-renesom-baseboard.dtsi b/arch/arm64/boot/dts/renesas/beacon-renesom-baseboard.dtsi
index f951bae2a1c6..beaea6de547b 100644
--- a/arch/arm64/boot/dts/renesas/beacon-renesom-baseboard.dtsi
+++ b/arch/arm64/boot/dts/renesas/beacon-renesom-baseboard.dtsi
@@ -649,23 +649,6 @@ &rcar_sound {
 
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
-- 
2.25.1

