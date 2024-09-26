Return-Path: <linux-renesas-soc+bounces-9060-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 564A4986E5B
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 26 Sep 2024 09:58:17 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 020EE1F24483
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 26 Sep 2024 07:58:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2B45819004E;
	Thu, 26 Sep 2024 07:58:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b="mSkN74CP"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail.zeus03.de (zeus03.de [194.117.254.33])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0218C18A6CC
	for <linux-renesas-soc@vger.kernel.org>; Thu, 26 Sep 2024 07:58:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=194.117.254.33
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727337489; cv=none; b=J3B9gKlY2gWPnc+wcQH9W2jNReEtHB4Fqxc1xPY3Fhqjdd4q2UWyq+Ny0xDvIPjltah8S1qjUQWV/v+kCunOtFh4aGF0XyNDvJOmmIxu386VkAslKqT2gs2rxKJ6kAQ72xTNQ87FaU/bma2ySl6G1Yzfh/S0UrMW4lv2tLE0Ygs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727337489; c=relaxed/simple;
	bh=X3z5GNDpW/aQdgCoWj/T5g9Z54D7ylAPP7FRO7ygZQI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=pFz5tdEvHKDeZvq6y8Yx75x8ZtZ7SQyN0zw1P75dKzQK81Ghu7tFNIxoDkkJ31Nt9zFFkZ4h+3xUGzZqM95byNe0ZskAXrnoWkXYQq4UdhSU1Uw2uh66EB8V9xcD9LygNwJQI5CfaSmqiEJYuGnvr6IMyj3K3OcwOcdz5SWVFt4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com; spf=pass smtp.mailfrom=sang-engineering.com; dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b=mSkN74CP; arc=none smtp.client-ip=194.117.254.33
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sang-engineering.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	sang-engineering.com; h=from:to:cc:subject:date:message-id
	:in-reply-to:references:mime-version:content-transfer-encoding;
	 s=k1; bh=AzWb4wmZmJDeCnCufEuVDg06gJADSDQ05VMfTLb+Rq8=; b=mSkN74
	CPpv4WNcQxyjvbvpVr2Q182XwcZ/Pu5SSnmwzXkokng7p37ULIVfc5DS7ugwq9iv
	JmuO1F00Ne4blhA3ej3HJ4G1FL6Qq92Xt4tYLYR4tOkvN1ZdJGWPrZA3Fw5bcila
	KpYCNkuTwLPr/L89eU6B3sY739/6fMHFJp96d5TYhyv8SbgdVL8r8DxoKktrAA+J
	7iYk1p04TwOWsFOVVjmNmNgs8E/4dy7Y3V84R42ensY2btjhxY/Z3ceJC7+mb6Hr
	PpQTMr914L1ze4v6XAk6rsW5ofPfe233Q98KtiL1qN8CyCHEGKrE8Vs6TJ9R0qgs
	flKl4CVNNdWXGS0w==
Received: (qmail 901352 invoked from network); 26 Sep 2024 09:58:01 +0200
Received: by mail.zeus03.de with ESMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 26 Sep 2024 09:58:01 +0200
X-UD-Smtp-Session: l3s3148p1@mPz1GAEjCEZtKPAR
From: Wolfram Sang <wsa+renesas@sang-engineering.com>
To: linux-renesas-soc@vger.kernel.org
Cc: Wolfram Sang <wsa+renesas@sang-engineering.com>
Subject: [PATCH 1/2] ARM: dts: renesas: add proper node names to (L)BSC devices
Date: Thu, 26 Sep 2024 09:57:26 +0200
Message-ID: <20240926075724.6161-5-wsa+renesas@sang-engineering.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20240926075724.6161-4-wsa+renesas@sang-engineering.com>
References: <20240926075724.6161-4-wsa+renesas@sang-engineering.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

(L)BSC should have a "bus" node name together with its register set [1].
Add the missing names, and change one with a wrong address not matching
the register space.

[1] lbsc: $nodename:0: 'lbsc' does not match '^([a-z][a-z0-9\\-]+-bus|bus|localbus|soc|axi|ahb|apb)(@.+)?$'

Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
---
 arch/arm/boot/dts/renesas/r7s72100.dtsi | 2 +-
 arch/arm/boot/dts/renesas/r8a7778.dtsi  | 2 +-
 arch/arm/boot/dts/renesas/r8a7779.dtsi  | 2 +-
 arch/arm/boot/dts/renesas/r8a7792.dtsi  | 2 +-
 4 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/arch/arm/boot/dts/renesas/r7s72100.dtsi b/arch/arm/boot/dts/renesas/r7s72100.dtsi
index 07ffd9ec96cc..a460a9092c43 100644
--- a/arch/arm/boot/dts/renesas/r7s72100.dtsi
+++ b/arch/arm/boot/dts/renesas/r7s72100.dtsi
@@ -36,7 +36,7 @@ b_clk: b {
 		clock-div = <3>;
 	};
 
-	bsc: bsc {
+	bsc: bus@3fffc000 {
 		compatible = "simple-bus";
 		#address-cells = <1>;
 		#size-cells = <1>;
diff --git a/arch/arm/boot/dts/renesas/r8a7778.dtsi b/arch/arm/boot/dts/renesas/r8a7778.dtsi
index b80e832c9277..ab0b76eacd3c 100644
--- a/arch/arm/boot/dts/renesas/r8a7778.dtsi
+++ b/arch/arm/boot/dts/renesas/r8a7778.dtsi
@@ -40,7 +40,7 @@ aliases {
 		spi2 = &hspi2;
 	};
 
-	bsc: bus@1c000000 {
+	bsc: bus@ff800000 {
 		compatible = "simple-bus";
 		#address-cells = <1>;
 		#size-cells = <1>;
diff --git a/arch/arm/boot/dts/renesas/r8a7779.dtsi b/arch/arm/boot/dts/renesas/r8a7779.dtsi
index 1944703cba4f..3c5746dbe639 100644
--- a/arch/arm/boot/dts/renesas/r8a7779.dtsi
+++ b/arch/arm/boot/dts/renesas/r8a7779.dtsi
@@ -704,7 +704,7 @@ R8A7779_CLK_MMC1 R8A7779_CLK_MMC0
 		};
 	};
 
-	lbsc: lbsc {
+	lbsc: bus@ff800000 {
 		compatible = "simple-bus";
 		#address-cells = <1>;
 		#size-cells = <1>;
diff --git a/arch/arm/boot/dts/renesas/r8a7792.dtsi b/arch/arm/boot/dts/renesas/r8a7792.dtsi
index dd3bc32668b7..471a2913e51e 100644
--- a/arch/arm/boot/dts/renesas/r8a7792.dtsi
+++ b/arch/arm/boot/dts/renesas/r8a7792.dtsi
@@ -84,7 +84,7 @@ extal_clk: extal {
 		clock-frequency = <0>;
 	};
 
-	lbsc: lbsc {
+	lbsc: bus@fec00000 {
 		compatible = "simple-bus";
 		#address-cells = <1>;
 		#size-cells = <1>;
-- 
2.45.2


