Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 007A82D8F52
	for <lists+linux-renesas-soc@lfdr.de>; Sun, 13 Dec 2020 19:40:31 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731031AbgLMSjM (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Sun, 13 Dec 2020 13:39:12 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60086 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727843AbgLMSi7 (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Sun, 13 Dec 2020 13:38:59 -0500
Received: from mail-il1-x144.google.com (mail-il1-x144.google.com [IPv6:2607:f8b0:4864:20::144])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 24D36C061793;
        Sun, 13 Dec 2020 10:38:19 -0800 (PST)
Received: by mail-il1-x144.google.com with SMTP id u12so13727779ilv.3;
        Sun, 13 Dec 2020 10:38:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=nirapVzmyBXtlR0zSXiW6nUnfOw2BvU+F4T6ARlrvxg=;
        b=Ulx4DJdoJiPMBFJHRJhE7s0qoe2BunLbwy+/YU9Oby1X6yraveGrTQEYRTQefcq7Ah
         w8x95Ie+zyQAouuWFFej0aGppBOCazKrevrrG25xzFWWH1Sv2GN5fKzajbMxnktxogv+
         D+YEIkqnV3Pu2dbHrXhKaLrT67yJ2JTqv+16+H1EpFDqPpi8CKxTYcsHYdbfVIleP5IV
         p1/k7520M0aorSG9cHA1Ty8vIBcqplPtNpVZ0ok0YKr47U1wZ002Qfm2dog/OvAIE3R+
         pQbS7E1nxCR4V1JQPKLyHESDOO0GYCFMWpQU6OPzNLZIBBMbnbUPq6WSt1gt2+ARAtkz
         Y9yQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=nirapVzmyBXtlR0zSXiW6nUnfOw2BvU+F4T6ARlrvxg=;
        b=LlnS1ciyMNSsL7iv0cgkWsWPPBjKe2ptuFaI0qA+prmp13ni/hapGgHoPF7YNuh18S
         +cBeoB4bXZ0fRmpyYEfobDekEG2dTUgBviHmHt65cnuZ/SRETQ7IjoI3Q9fa9YKFZvPU
         N3GF31dL9R4A/wWqdJgb5p8yWnDKEO2epepzan/xhkR1/FyIG7BGU/kkfTqj9Vai4XqQ
         26iaC8bO2h26kQWC6/vNuOY/XfbgBmKzfXsC3OLo20OtXWnPby/rc1ez14BsjvxyT/gq
         hjBZ9ncwyzTvOSiSYsJHQFDzWXVCF6A4DWn7E5Qi4n+NT0HQMZn1qWiQ9jzm9tNQLw+U
         NAoA==
X-Gm-Message-State: AOAM530YnaPP9hjk0qic0aeej3F0XzYuZXKY/A694WSWco+KRHhVbkuP
        L8rSPgScPLi0s7giXf5jYeSk32VgJBIvug==
X-Google-Smtp-Source: ABdhPJzuqO7ExBQ42b6qpF+2h8qwDjlk11nn0HmZQj1OxT+des4uAQ9pSTi6lBTfiylltRvFnv8Kgw==
X-Received: by 2002:a92:155b:: with SMTP id v88mr28688882ilk.303.1607884698202;
        Sun, 13 Dec 2020 10:38:18 -0800 (PST)
Received: from aford-IdeaCentre-A730.lan ([2601:448:8400:9e8:f45d:df49:9a4c:4914])
        by smtp.gmail.com with ESMTPSA id o11sm7804532ioa.37.2020.12.13.10.38.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 13 Dec 2020 10:38:17 -0800 (PST)
From:   Adam Ford <aford173@gmail.com>
To:     linux-renesas-soc@vger.kernel.org
Cc:     aford@beaconembedded.com, Adam Ford <aford173@gmail.com>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Magnus Damm <magnus.damm@gmail.com>,
        Rob Herring <robh+dt@kernel.org>, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH 03/18] arm64: dts: renesas: beacon kit: Remove unnecessary nodes
Date:   Sun, 13 Dec 2020 12:37:43 -0600
Message-Id: <20201213183759.223246-4-aford173@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20201213183759.223246-1-aford173@gmail.com>
References: <20201213183759.223246-1-aford173@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

VSPI0 and VSPB are already enabled by default.  There is no need
to add extra nodes to enable them.  Remove the redundant nodes.

Signed-off-by: Adam Ford <aford173@gmail.com>
---
 arch/arm64/boot/dts/renesas/beacon-renesom-som.dtsi | 8 --------
 1 file changed, 8 deletions(-)

diff --git a/arch/arm64/boot/dts/renesas/beacon-renesom-som.dtsi b/arch/arm64/boot/dts/renesas/beacon-renesom-som.dtsi
index c50f8e63c80f..b093a34b0fa0 100644
--- a/arch/arm64/boot/dts/renesas/beacon-renesom-som.dtsi
+++ b/arch/arm64/boot/dts/renesas/beacon-renesom-som.dtsi
@@ -329,11 +329,3 @@ &usb_extal_clk {
 &usb3s0_clk {
 	clock-frequency = <100000000>;
 };
-
-&vspb {
-	status = "okay";
-};
-
-&vspi0 {
-	status = "okay";
-};
-- 
2.25.1

