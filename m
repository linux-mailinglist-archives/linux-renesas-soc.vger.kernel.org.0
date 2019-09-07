Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id B0A91AC796
	for <lists+linux-renesas-soc@lfdr.de>; Sat,  7 Sep 2019 18:16:42 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2391954AbfIGQQm (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Sat, 7 Sep 2019 12:16:42 -0400
Received: from mail-wr1-f67.google.com ([209.85.221.67]:35654 "EHLO
        mail-wr1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2388739AbfIGQQl (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Sat, 7 Sep 2019 12:16:41 -0400
Received: by mail-wr1-f67.google.com with SMTP id g7so9567168wrx.2;
        Sat, 07 Sep 2019 09:16:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=bYrOf9RTBwmZf5L0GW4BktLvAbpDYWcNsfWnV6+h4U8=;
        b=vK0U3Jz66s82RuowVHKEmY++wZPKSWyjMesPIgCXgV3Mh1+z30ApdX2rj94pOOPa/s
         K0Dzcph947gpzxWQ3zj+Bi6tBYIORc2VnoN5ungGxO/m0ucjOptyonaCDGL3hsh652QW
         GEPOukJuf/LesB3cbkpKVTP8bpG8aR4FA2Dy7oqio6p844l+T4RbLYy69Kem/qeYrxuq
         /OehV1uF83Rk9vK4ZuQl+h9QfHLHz3zbhgg4iZeYhV7rXiRXff7BHPilBEQaER9ys8Yo
         d7axXcAvK1fL9kUmHDYlEHmX5DX7zC0kxnOXg2ZiQUh6FaPhpR8MDCKmPAzjDl3wLxXu
         lAzw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=bYrOf9RTBwmZf5L0GW4BktLvAbpDYWcNsfWnV6+h4U8=;
        b=YOurgoM7qY4IZ7+X4tvikkU8D75LBRvp+ohYoEN9II63ZcuNipv9u9KcejKFJMKgHZ
         5x1qQiBEkSKSobsMJk047kXnjXsnTg3d0fa4qxVu3iYYDC+YTgRcE21LtY0cHLm8DBWO
         FY2iYY9wlcEjtN9xPLT49S50uBuIPT2fO7YbC21kQ/keqb/D63yibCEyne3dfs12SYJ/
         /BwExv+ekb06us1ZWRtPcwNWzg72In8tD4A2vanD+TVsLdSfxLr51oVZtCkBpX0IpHsb
         Jl8VCix9SNMYwxa2uFnFMSTwl33/zdPSXiNiSC0VRIEpRuoTEED2iIDVKiaiqIXar9B1
         4HwQ==
X-Gm-Message-State: APjAAAVr7mXkxQLzkXO1cDBI+q3Ip2olMwqhTSL7bnef7ht04E1+clSH
        hsp3sp2HIfhGpzheoOTnwik=
X-Google-Smtp-Source: APXvYqzQvWzM1P6EtR2ZVrYWJfWDLqA/kHDqNXWmxi1Tb4O71b0x+R9R4roPPEsa4zgsKrNtHZgZLg==
X-Received: by 2002:a5d:570e:: with SMTP id a14mr11690472wrv.39.1567872999604;
        Sat, 07 Sep 2019 09:16:39 -0700 (PDT)
Received: from desktop.lan (ip-86-49-35-8.net.upcbroadband.cz. [86.49.35.8])
        by smtp.gmail.com with ESMTPSA id d9sm14847713wrc.44.2019.09.07.09.16.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 07 Sep 2019 09:16:38 -0700 (PDT)
From:   marek.vasut@gmail.com
To:     linux-arm-kernel@lists.infradead.org
Cc:     Marek Vasut <marek.vasut+renesas@gmail.com>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Wolfram Sang <wsa@the-dreams.de>, devicetree@vger.kernel.org,
        linux-renesas-soc@vger.kernel.org
Subject: [PATCH] arm64: dts: renesas: Add /soc dma-ranges
Date:   Sat,  7 Sep 2019 18:16:34 +0200
Message-Id: <20190907161634.27378-1-marek.vasut@gmail.com>
X-Mailer: git-send-email 2.23.0.rc1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

From: Marek Vasut <marek.vasut+renesas@gmail.com>

Add dma-ranges property into /soc node to describe the DMA capabilities
of the bus. This is currently needed to translate PCI DMA ranges, which
are limited to 32bit addresses.

Signed-off-by: Marek Vasut <marek.vasut+renesas@gmail.com>
Cc: Geert Uytterhoeven <geert+renesas@glider.be>
Cc: Wolfram Sang <wsa@the-dreams.de>
Cc: devicetree@vger.kernel.org
Cc: linux-renesas-soc@vger.kernel.org
To: linux-arm-kernel@lists.infradead.org
---
NOTE: This is needed for the following patches to work correctly:
      https://patchwork.ozlabs.org/patch/1144870/
      https://patchwork.ozlabs.org/patch/1144871/
---
 arch/arm64/boot/dts/renesas/r8a7795.dtsi  | 1 +
 arch/arm64/boot/dts/renesas/r8a7796.dtsi  | 1 +
 arch/arm64/boot/dts/renesas/r8a77965.dtsi | 1 +
 3 files changed, 3 insertions(+)

diff --git a/arch/arm64/boot/dts/renesas/r8a7795.dtsi b/arch/arm64/boot/dts/renesas/r8a7795.dtsi
index 95deff66eeb6..2102140a6723 100644
--- a/arch/arm64/boot/dts/renesas/r8a7795.dtsi
+++ b/arch/arm64/boot/dts/renesas/r8a7795.dtsi
@@ -330,6 +330,7 @@
 		#address-cells = <2>;
 		#size-cells = <2>;
 		ranges;
+		dma-ranges = <0 0x40000000 0 0x40000000 0 0xc0000000>;
 
 		rwdt: watchdog@e6020000 {
 			compatible = "renesas,r8a7795-wdt", "renesas,rcar-gen3-wdt";
diff --git a/arch/arm64/boot/dts/renesas/r8a7796.dtsi b/arch/arm64/boot/dts/renesas/r8a7796.dtsi
index 3dc9d73f589a..d115ff34d0db 100644
--- a/arch/arm64/boot/dts/renesas/r8a7796.dtsi
+++ b/arch/arm64/boot/dts/renesas/r8a7796.dtsi
@@ -300,6 +300,7 @@
 		#address-cells = <2>;
 		#size-cells = <2>;
 		ranges;
+		dma-ranges = <0 0x40000000 0 0x40000000 0 0xc0000000>;
 
 		rwdt: watchdog@e6020000 {
 			compatible = "renesas,r8a7796-wdt",
diff --git a/arch/arm64/boot/dts/renesas/r8a77965.dtsi b/arch/arm64/boot/dts/renesas/r8a77965.dtsi
index 4ae163220f60..74d934cfe44e 100644
--- a/arch/arm64/boot/dts/renesas/r8a77965.dtsi
+++ b/arch/arm64/boot/dts/renesas/r8a77965.dtsi
@@ -183,6 +183,7 @@
 		#address-cells = <2>;
 		#size-cells = <2>;
 		ranges;
+		dma-ranges = <0 0x40000000 0 0x40000000 0 0xc0000000>;
 
 		rwdt: watchdog@e6020000 {
 			compatible = "renesas,r8a77965-wdt",
-- 
2.23.0.rc1

