Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id CE1CA13B8DA
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 15 Jan 2020 06:13:15 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725957AbgAOFM6 (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Wed, 15 Jan 2020 00:12:58 -0500
Received: from mail-wm1-f65.google.com ([209.85.128.65]:56128 "EHLO
        mail-wm1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725962AbgAOFM6 (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 15 Jan 2020 00:12:58 -0500
Received: by mail-wm1-f65.google.com with SMTP id q9so16401117wmj.5
        for <linux-renesas-soc@vger.kernel.org>; Tue, 14 Jan 2020 21:12:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=n9NxWPcK/0Wvk5uOpnOHlNKUqHS48KY4vv65Up++8+w=;
        b=jsPbn0xE25CsviiaMCSLAgAvAN8wnluckOKmIIj5WK7PxnLBmR5FnoWrBi0jA8zQdI
         tP/++VyFja/lsKuYdRoK6So5Xf9jDd+Q7tbm/kK1IqM2nvRQCjIcbKB/5Kv6IXGNuG17
         jq+n/XlWsyB8Q5R1gmIpLAhHMwd3bRN8Mu5k817AoFKjwNjBKsAY/BWiYPyZ7fz0PxQA
         SR4+mshu8q8B9CJcOhHWo8oo2o1Wevdb3y27cgGgWXeE6ivXnPTVyozgv3XFcm1kRlPv
         SvxPZlJFzczo5oD9wlQiqm7iOJiFiRVpoK4VGrWBE2aOvrBvT3x90fLXfy4wuU1u+CnM
         r+5A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=n9NxWPcK/0Wvk5uOpnOHlNKUqHS48KY4vv65Up++8+w=;
        b=oYSzfZOr3SdKbfTXrVVocmXejXQwqxyTcAp9FGzfH2GhqeJ23YHzCmKdBAsFRPg4HR
         BG5Oi4Vht57vfw7WL0SErSz7N0J4i5oQLK/o+AgpsE6xaUi/8kH62SMmhQdo0JEBGP5K
         f4msfful7ktuMJn+/vz49SwK4rJRO0TjksD7JsRkvHdqHUae+7DkkCivpnUT2o+YkhxC
         kOkbKNECmCie0zSUXEnfc46TRfsQoN0uKJda3iH32QKHQbgCY/YsL/9pVgZUDVQuU+hS
         To+3LSti0AKOfVgOVVQz97GMTmSMFEkZUirqb3wnx4nO6STiQD/0YxVeoXFgs9gG8j+D
         W4HA==
X-Gm-Message-State: APjAAAWg0Y0EsUqtcCOxWmNVkr52W2UIxRPDYbPIwQhbJiMq5IsWcqQj
        tfyxguqfaH0b3R3iu+/Z9DQ=
X-Google-Smtp-Source: APXvYqxJwlTO95a0xARemiZJfDEj7XUZHZ68oYbHN+nMliDW8E8V2Xh+D42Qv4MEEPlT3mowYT7Ipg==
X-Received: by 2002:a7b:c444:: with SMTP id l4mr30092745wmi.178.1579065175436;
        Tue, 14 Jan 2020 21:12:55 -0800 (PST)
Received: from chi.lan (cst-prg-10-109.cust.vodafone.cz. [46.135.10.109])
        by smtp.gmail.com with ESMTPSA id z21sm20942156wml.5.2020.01.14.21.12.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 14 Jan 2020 21:12:54 -0800 (PST)
From:   marek.vasut@gmail.com
To:     linux-arm-kernel@lists.infradead.org
Cc:     Marek Vasut <marek.vasut+renesas@gmail.com>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Wolfram Sang <wsa+renesas@sang-engineering.com>,
        linux-renesas-soc@vger.kernel.org,
        =?UTF-8?q?Niklas=20S=C3=B6derlund?= 
        <niklas.soderlund+renesas@ragnatech.se>
Subject: [PATCH V2] ARM: dts: renesas: Add missing ethernet PHY reset GPIO on Gen2 reference boards
Date:   Wed, 15 Jan 2020 06:12:25 +0100
Message-Id: <20200115051225.7346-1-marek.vasut@gmail.com>
X-Mailer: git-send-email 2.24.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

From: Marek Vasut <marek.vasut+renesas@gmail.com>

The ethernet PHY reset GPIO was missing and the kernel was depending
solely on the bootloader to bring the PHY out of reset. Fix this to
get rid of the dependency on bootloader.

Signed-off-by: Marek Vasut <marek.vasut+renesas@gmail.com>
Cc: Geert Uytterhoeven <geert+renesas@glider.be>
Cc: Wolfram Sang <wsa+renesas@sang-engineering.com>
Cc: linux-renesas-soc@vger.kernel.org
To: linux-arm-kernel@lists.infradead.org
Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
Tested-by: Niklas Söderlund <niklas.soderlund+renesas@ragnatech.se>
---
V2: - Move the reset-gpios at the end of the list of nodes
    - Add TB/RB
---
 arch/arm/boot/dts/r8a7790-lager.dts   | 1 +
 arch/arm/boot/dts/r8a7790-stout.dts   | 1 +
 arch/arm/boot/dts/r8a7791-koelsch.dts | 1 +
 arch/arm/boot/dts/r8a7791-porter.dts  | 1 +
 arch/arm/boot/dts/r8a7793-gose.dts    | 1 +
 arch/arm/boot/dts/r8a7794-alt.dts     | 1 +
 arch/arm/boot/dts/r8a7794-silk.dts    | 1 +
 7 files changed, 7 insertions(+)

diff --git a/arch/arm/boot/dts/r8a7790-lager.dts b/arch/arm/boot/dts/r8a7790-lager.dts
index 097fd9317c6e..69745def44d4 100644
--- a/arch/arm/boot/dts/r8a7790-lager.dts
+++ b/arch/arm/boot/dts/r8a7790-lager.dts
@@ -674,6 +674,7 @@ phy1: ethernet-phy@1 {
 		interrupt-parent = <&irqc0>;
 		interrupts = <0 IRQ_TYPE_LEVEL_LOW>;
 		micrel,led-mode = <1>;
+		reset-gpios = <&gpio5 31 GPIO_ACTIVE_LOW>;
 	};
 };
 
diff --git a/arch/arm/boot/dts/r8a7790-stout.dts b/arch/arm/boot/dts/r8a7790-stout.dts
index a315ba749aa4..4138efb2766d 100644
--- a/arch/arm/boot/dts/r8a7790-stout.dts
+++ b/arch/arm/boot/dts/r8a7790-stout.dts
@@ -203,6 +203,7 @@ phy1: ethernet-phy@1 {
 		interrupt-parent = <&irqc0>;
 		interrupts = <1 IRQ_TYPE_LEVEL_LOW>;
 		micrel,led-mode = <1>;
+		reset-gpios = <&gpio3 31 GPIO_ACTIVE_LOW>;
 	};
 };
 
diff --git a/arch/arm/boot/dts/r8a7791-koelsch.dts b/arch/arm/boot/dts/r8a7791-koelsch.dts
index 2b096d5e06fb..687167b70cb6 100644
--- a/arch/arm/boot/dts/r8a7791-koelsch.dts
+++ b/arch/arm/boot/dts/r8a7791-koelsch.dts
@@ -633,6 +633,7 @@ phy1: ethernet-phy@1 {
 		interrupt-parent = <&irqc0>;
 		interrupts = <0 IRQ_TYPE_LEVEL_LOW>;
 		micrel,led-mode = <1>;
+		reset-gpios = <&gpio5 22 GPIO_ACTIVE_LOW>;
 	};
 };
 
diff --git a/arch/arm/boot/dts/r8a7791-porter.dts b/arch/arm/boot/dts/r8a7791-porter.dts
index f9ece7ab2010..a8e0335148a5 100644
--- a/arch/arm/boot/dts/r8a7791-porter.dts
+++ b/arch/arm/boot/dts/r8a7791-porter.dts
@@ -307,6 +307,7 @@ phy1: ethernet-phy@1 {
 		interrupt-parent = <&irqc0>;
 		interrupts = <0 IRQ_TYPE_LEVEL_LOW>;
 		micrel,led-mode = <1>;
+		reset-gpios = <&gpio5 22 GPIO_ACTIVE_LOW>;
 	};
 };
 
diff --git a/arch/arm/boot/dts/r8a7793-gose.dts b/arch/arm/boot/dts/r8a7793-gose.dts
index 22ca7cd1e7d2..cfe06a74ce89 100644
--- a/arch/arm/boot/dts/r8a7793-gose.dts
+++ b/arch/arm/boot/dts/r8a7793-gose.dts
@@ -591,6 +591,7 @@ phy1: ethernet-phy@1 {
 		interrupt-parent = <&irqc0>;
 		interrupts = <0 IRQ_TYPE_LEVEL_LOW>;
 		micrel,led-mode = <1>;
+		reset-gpios = <&gpio5 22 GPIO_ACTIVE_LOW>;
 	};
 };
 
diff --git a/arch/arm/boot/dts/r8a7794-alt.dts b/arch/arm/boot/dts/r8a7794-alt.dts
index f79fce74cd9c..935935c1dbac 100644
--- a/arch/arm/boot/dts/r8a7794-alt.dts
+++ b/arch/arm/boot/dts/r8a7794-alt.dts
@@ -343,6 +343,7 @@ phy1: ethernet-phy@1 {
 		interrupt-parent = <&irqc0>;
 		interrupts = <8 IRQ_TYPE_LEVEL_LOW>;
 		micrel,led-mode = <1>;
+		reset-gpios = <&gpio1 24 GPIO_ACTIVE_LOW>;
 	};
 };
 
diff --git a/arch/arm/boot/dts/r8a7794-silk.dts b/arch/arm/boot/dts/r8a7794-silk.dts
index 2c16ad854300..9aaa96ea9943 100644
--- a/arch/arm/boot/dts/r8a7794-silk.dts
+++ b/arch/arm/boot/dts/r8a7794-silk.dts
@@ -394,6 +394,7 @@ phy1: ethernet-phy@1 {
 		interrupt-parent = <&irqc0>;
 		interrupts = <8 IRQ_TYPE_LEVEL_LOW>;
 		micrel,led-mode = <1>;
+		reset-gpios = <&gpio1 24 GPIO_ACTIVE_LOW>;
 	};
 };
 
-- 
2.24.1

