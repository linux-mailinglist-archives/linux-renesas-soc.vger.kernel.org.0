Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 289F82D8F7C
	for <lists+linux-renesas-soc@lfdr.de>; Sun, 13 Dec 2020 19:46:07 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2404092AbgLMSpo (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Sun, 13 Dec 2020 13:45:44 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60184 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1732425AbgLMSjg (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Sun, 13 Dec 2020 13:39:36 -0500
Received: from mail-il1-x141.google.com (mail-il1-x141.google.com [IPv6:2607:f8b0:4864:20::141])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DD676C0617A6;
        Sun, 13 Dec 2020 10:38:24 -0800 (PST)
Received: by mail-il1-x141.google.com with SMTP id n9so2821260ili.0;
        Sun, 13 Dec 2020 10:38:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=jcDVGybb7Pc9GBcQHLaSWMHVNO9chVKX8Fz4lnmvy7U=;
        b=W+/NhBJJJGlftGfFsiQvAaV/iErFEK2vIB3Rqu0NxfujXPIfZjXgUr+ulMNatUeU7P
         Xb/nyFrD5uK+hlIdLrNeHZBaS+2aJt4IFc5XUJR+WviUGezvbCDF0E0zHIWqyCmNl1gk
         fYUFQD1OsYhaBcSZ8EODCjWiVFUqOYOBbkSXYUOeseK06DCqmvO5PjuPtds7G+Qna10O
         z7wcRj1ERMvo8/WtWVw7C1we07XTbJpizDE9Aq3wDlgrBZtb+EpstESgN0fkgT3MVcC3
         0/TyiDnwyJPLg9wykRob2UJ4IqvymLikZwLvUUHtc7YHIRmQG3s+uhhMgzismqu08fJw
         JArA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=jcDVGybb7Pc9GBcQHLaSWMHVNO9chVKX8Fz4lnmvy7U=;
        b=lG3wIw35HQLXh6uD/z1rgd5So5DJIXWFKNShFlxhQdI3ccl4FLb9I8rCHdRoV7PrfI
         KauTnngrmQVH9CMfZsWIrwsEbqsuXqXEGjc5eq+wvWxgUBl+uS2FUh+QouTIj7vn/Wrb
         Fqirhfca97yDpiYBXNEq3T5Ap21g1/v+FdukUIPYMkTKhYJfR7VMl4nZa7s8bz9eGKVd
         TvMHt5/jNGmpn4fE0GT81hGoFbS0Gp79T5dXM8KX/JoILlJlbGtv+s024eHXcvzqNVlh
         I10RWg1k/FY18BuAK9Z91MLtEUMN9yPbvI0eVysCIDstzb8ZwByD5Zj1Cn5vkw/zZAQj
         QYYg==
X-Gm-Message-State: AOAM532gKPFt0n4OxX6Lu5+NW8ZneEp+F7Txr6rtvc2LsSTbAIICfLrg
        WosIuyJiLRKv2h3nT1Qi3igEMVfIdlqCIg==
X-Google-Smtp-Source: ABdhPJxXVbsEgXPKkFbcR+uSRGecZRKtw8R/+4vZ1REypgoPxMMsXD1hm1QTstg55lTxGFWGOoqC+Q==
X-Received: by 2002:a92:cb52:: with SMTP id f18mr29745435ilq.41.1607884703989;
        Sun, 13 Dec 2020 10:38:23 -0800 (PST)
Received: from aford-IdeaCentre-A730.lan ([2601:448:8400:9e8:f45d:df49:9a4c:4914])
        by smtp.gmail.com with ESMTPSA id o11sm7804532ioa.37.2020.12.13.10.38.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 13 Dec 2020 10:38:23 -0800 (PST)
From:   Adam Ford <aford173@gmail.com>
To:     linux-renesas-soc@vger.kernel.org
Cc:     aford@beaconembedded.com, Adam Ford <aford173@gmail.com>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Magnus Damm <magnus.damm@gmail.com>,
        Rob Herring <robh+dt@kernel.org>, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH 06/18] arm64: dts: renesas: beacon: Configure Audio CODEC clocks
Date:   Sun, 13 Dec 2020 12:37:46 -0600
Message-Id: <20201213183759.223246-7-aford173@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20201213183759.223246-1-aford173@gmail.com>
References: <20201213183759.223246-1-aford173@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

With the newly added configurable clock options, the audio CODEC can
configure the mclk automatically.  Add the reference to the versaclock.
Since the devices on I2C5 can communicate at 400KHz, let's also increase
that too

Signed-off-by: Adam Ford <aford173@gmail.com>
---
 arch/arm64/boot/dts/renesas/beacon-renesom-baseboard.dtsi | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/renesas/beacon-renesom-baseboard.dtsi b/arch/arm64/boot/dts/renesas/beacon-renesom-baseboard.dtsi
index ee7809e8db07..130993b1b20a 100644
--- a/arch/arm64/boot/dts/renesas/beacon-renesom-baseboard.dtsi
+++ b/arch/arm64/boot/dts/renesas/beacon-renesom-baseboard.dtsi
@@ -424,13 +424,15 @@ &i2c0 {
 
 &i2c5 {
 	status = "okay";
-	clock-frequency = <100000>;
+	clock-frequency = <400000>;
 	pinctrl-0 = <&i2c5_pins>;
 	pinctrl-names = "default";
 
 	codec: wm8962@1a {
 		compatible = "wlf,wm8962";
 		reg = <0x1a>;
+		clocks = <&versaclock6_bb 3>;
+		clock-names = "mclk";
 		DCVDD-supply = <&reg_audio>;
 		DBVDD-supply = <&reg_audio>;
 		AVDD-supply = <&reg_audio>;
-- 
2.25.1

