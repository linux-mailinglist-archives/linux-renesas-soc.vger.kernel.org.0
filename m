Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2ADC52FB9F4
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 19 Jan 2021 15:55:28 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2391467AbhASOju (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Tue, 19 Jan 2021 09:39:50 -0500
Received: from www.zeus03.de ([194.117.254.33]:59318 "EHLO mail.zeus03.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S2389747AbhASNeM (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 19 Jan 2021 08:34:12 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=simple; d=sang-engineering.com; h=
        from:to:cc:subject:date:message-id:mime-version
        :content-transfer-encoding; s=k1; bh=dBx4j8trm1AxttSJ/4c+9ostNn5
        cou5dXIQVqa7hs7g=; b=J1vJdB9hGL0QN3BW863/oRSSdAjhEvHEC7Y5Wbgr/q6
        M55SRIR3vJDRAsCqXuqFR7M6IWZHVDpt8rzqB74QBL+w2jLJxKmCPoYf9MB/anAR
        c51iD9N1KtzzMjCfqVTf40DT8ogJxBqq5YalAxAqYEEJBIaWot5TLvFhU2jj998A
        =
Received: (qmail 1084567 invoked from network); 19 Jan 2021 14:33:31 +0100
Received: by mail.zeus03.de with ESMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 19 Jan 2021 14:33:31 +0100
X-UD-Smtp-Session: l3s3148p1@MTpj4kC5FNwgAwDPXyX1ACWcscxtZ2TX
From:   Wolfram Sang <wsa+renesas@sang-engineering.com>
To:     linux-renesas-soc@vger.kernel.org
Cc:     Geert Uytterhoeven <geert@linux-m68k.org>,
        Wolfram Sang <wsa+renesas@sang-engineering.com>
Subject: [PATCH] arm64: dts: renesas: disable SD functions for plain eMMC
Date:   Tue, 19 Jan 2021 14:33:22 +0100
Message-Id: <20210119133322.87289-1-wsa+renesas@sang-engineering.com>
X-Mailer: git-send-email 2.29.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Some SDHI instances are solely used for eMMC. Disable SD and SDIO
for faster initialization.

Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
---

I recall that ARM64 maintainers prefer such changes in one block and not
individual patches. If that's not true, I can convert, of course.

 arch/arm64/boot/dts/renesas/beacon-renesom-som.dtsi | 2 ++
 arch/arm64/boot/dts/renesas/hihope-common.dtsi      | 2 ++
 arch/arm64/boot/dts/renesas/r8a77980-condor.dts     | 2 ++
 arch/arm64/boot/dts/renesas/r8a77990-ebisu.dts      | 2 ++
 arch/arm64/boot/dts/renesas/r8a77995-draak.dts      | 2 ++
 arch/arm64/boot/dts/renesas/salvator-common.dtsi    | 2 ++
 arch/arm64/boot/dts/renesas/ulcb.dtsi               | 2 ++
 7 files changed, 14 insertions(+)

diff --git a/arch/arm64/boot/dts/renesas/beacon-renesom-som.dtsi b/arch/arm64/boot/dts/renesas/beacon-renesom-som.dtsi
index f4201e1c2226..c9bf5234dbd0 100644
--- a/arch/arm64/boot/dts/renesas/beacon-renesom-som.dtsi
+++ b/arch/arm64/boot/dts/renesas/beacon-renesom-som.dtsi
@@ -312,6 +312,8 @@ &sdhi3 {
 	vqmmc-supply = <&reg_1p8v>;
 	bus-width = <8>;
 	mmc-hs200-1_8v;
+	no-sd;
+	no-sdio;
 	non-removable;
 	fixed-emmc-driver-type = <1>;
 	status = "okay";
diff --git a/arch/arm64/boot/dts/renesas/hihope-common.dtsi b/arch/arm64/boot/dts/renesas/hihope-common.dtsi
index 2eda9f66ae81..7a3da9b06f67 100644
--- a/arch/arm64/boot/dts/renesas/hihope-common.dtsi
+++ b/arch/arm64/boot/dts/renesas/hihope-common.dtsi
@@ -328,6 +328,8 @@ &sdhi3 {
 	vqmmc-supply = <&reg_1p8v>;
 	bus-width = <8>;
 	mmc-hs200-1_8v;
+	no-sd;
+	no-sdio;
 	non-removable;
 	fixed-emmc-driver-type = <1>;
 	status = "okay";
diff --git a/arch/arm64/boot/dts/renesas/r8a77980-condor.dts b/arch/arm64/boot/dts/renesas/r8a77980-condor.dts
index 422ec53740cb..04d47c0c9bb9 100644
--- a/arch/arm64/boot/dts/renesas/r8a77980-condor.dts
+++ b/arch/arm64/boot/dts/renesas/r8a77980-condor.dts
@@ -217,6 +217,8 @@ &mmc0 {
 	vqmmc-supply = <&vddq_vin01>;
 	mmc-hs200-1_8v;
 	bus-width = <8>;
+	no-sd;
+	no-sdio;
 	non-removable;
 	status = "okay";
 };
diff --git a/arch/arm64/boot/dts/renesas/r8a77990-ebisu.dts b/arch/arm64/boot/dts/renesas/r8a77990-ebisu.dts
index e0ccca2222d2..f74f8b9993f1 100644
--- a/arch/arm64/boot/dts/renesas/r8a77990-ebisu.dts
+++ b/arch/arm64/boot/dts/renesas/r8a77990-ebisu.dts
@@ -712,6 +712,8 @@ &sdhi3 {
 	mmc-hs200-1_8v;
 	mmc-hs400-1_8v;
 	bus-width = <8>;
+	no-sd;
+	no-sdio;
 	non-removable;
 	full-pwr-cycle-in-suspend;
 	status = "okay";
diff --git a/arch/arm64/boot/dts/renesas/r8a77995-draak.dts b/arch/arm64/boot/dts/renesas/r8a77995-draak.dts
index 8f471881b7a3..6783c3ad0856 100644
--- a/arch/arm64/boot/dts/renesas/r8a77995-draak.dts
+++ b/arch/arm64/boot/dts/renesas/r8a77995-draak.dts
@@ -496,6 +496,8 @@ &sdhi2 {
 	vqmmc-supply = <&reg_1p8v>;
 	bus-width = <8>;
 	mmc-hs200-1_8v;
+	no-sd;
+	no-sdio;
 	non-removable;
 	status = "okay";
 };
diff --git a/arch/arm64/boot/dts/renesas/salvator-common.dtsi b/arch/arm64/boot/dts/renesas/salvator-common.dtsi
index 6c643ed74fc5..c22bb38994e8 100644
--- a/arch/arm64/boot/dts/renesas/salvator-common.dtsi
+++ b/arch/arm64/boot/dts/renesas/salvator-common.dtsi
@@ -831,6 +831,8 @@ &sdhi2 {
 	bus-width = <8>;
 	mmc-hs200-1_8v;
 	mmc-hs400-1_8v;
+	no-sd;
+	no-sdio;
 	non-removable;
 	fixed-emmc-driver-type = <1>;
 	full-pwr-cycle-in-suspend;
diff --git a/arch/arm64/boot/dts/renesas/ulcb.dtsi b/arch/arm64/boot/dts/renesas/ulcb.dtsi
index 8f8d7371d8e2..a04eae55dd6c 100644
--- a/arch/arm64/boot/dts/renesas/ulcb.dtsi
+++ b/arch/arm64/boot/dts/renesas/ulcb.dtsi
@@ -468,6 +468,8 @@ &sdhi2 {
 	bus-width = <8>;
 	mmc-hs200-1_8v;
 	mmc-hs400-1_8v;
+	no-sd;
+	no-sdio;
 	non-removable;
 	full-pwr-cycle-in-suspend;
 	status = "okay";
-- 
2.29.2

