Return-Path: <linux-renesas-soc+bounces-9074-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id AA404987193
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 26 Sep 2024 12:34:04 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 608391F21E18
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 26 Sep 2024 10:34:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 85F461ACDF3;
	Thu, 26 Sep 2024 10:33:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b="P/MsFE5D"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail.zeus03.de (zeus03.de [194.117.254.33])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B11871ACE0D
	for <linux-renesas-soc@vger.kernel.org>; Thu, 26 Sep 2024 10:33:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=194.117.254.33
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727346838; cv=none; b=W/apZi1O9f4PzAG1gY7EfLb1irC/0FZmFACuUUz2Mu6y3IzfOudcYtu/uYoMwGJht9P29HDhSQlbNHvYdcz0mGuuhdaM7FlyU+aSZKsRnWJXHElaSyCInBYxWD4w/sty68dFikhN2LYnhWjYBEkXDBbao8RBquHzA3afHLGuSJ4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727346838; c=relaxed/simple;
	bh=CySfBc6YWGtXz6VM4jwP5gdMDXxa6c1OCRr8ncH0yE0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=J6K6XBh0O9LSqFTraFnKDSykZSn2ZpW+AIc8iSLAXQ+9tfb13Wof0cg53ecKEK95it1siadF/6JfkTk140loLeI57NsP7Pn0TNb9+HQD0p0Kq4N3HexIk2/cgfrDcUynKzC06Q5BO5OOuEgkBG5ao7Oq6D/9mC/sHY+zJaVVs4w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com; spf=pass smtp.mailfrom=sang-engineering.com; dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b=P/MsFE5D; arc=none smtp.client-ip=194.117.254.33
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sang-engineering.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	sang-engineering.com; h=from:to:cc:subject:date:message-id
	:in-reply-to:references:mime-version:content-transfer-encoding;
	 s=k1; bh=YkJG9F//Q6JHq/2Pj9D1ei0q5eiA9lK1NK+cBFCM9mc=; b=P/MsFE
	5DRatRCAj9AMD4Ib26qA5FbwMM4DMIrI5flHbuY/ztnW4x4eOPXKZpjQmaW72HQ6
	fbD24XRfdMO2v1aP1cW5p7rgoEfFM/eLTqxldrtsabgrMFx0cINIOKVY3o3yvRn9
	QqI7dccRBBVEGmJQ5xjE369Ao/Ahaa8/QFwyAzfz//v0m1CmpicsIdZoUUYFidLr
	cqsqAEfUWsu78DCU3p68zJCrjOHbj14iA7ZfEucrfTzh947kG22gubczFDv7edLm
	lx8ZrnyKx22CkeHX//38bTsEMjcuQNRDiwqvRIus5HEGkjTNJbQDTeTpRoFoA9Lz
	LROeAYwI6FaRJdvw==
Received: (qmail 951263 invoked from network); 26 Sep 2024 12:33:54 +0200
Received: by mail.zeus03.de with ESMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 26 Sep 2024 12:33:54 +0200
X-UD-Smtp-Session: l3s3148p1@UJt4RgMj8qwgAwDPXzRXADDuo30Z+IZ9
From: Wolfram Sang <wsa+renesas@sang-engineering.com>
To: linux-renesas-soc@vger.kernel.org
Cc: Wolfram Sang <wsa+renesas@sang-engineering.com>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Magnus Damm <magnus.damm@gmail.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	devicetree@vger.kernel.org
Subject: [PATCH v2 2/2] ARM: dts: renesas: r8a7778: rename 'bsc' to 'lbsc'
Date: Thu, 26 Sep 2024 12:33:42 +0200
Message-ID: <20240926103340.16909-6-wsa+renesas@sang-engineering.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20240926103340.16909-4-wsa+renesas@sang-engineering.com>
References: <20240926103340.16909-4-wsa+renesas@sang-engineering.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

R-Car Gen1 has an LBSC which has quite a different register set from the
former BSC. To match H1 with M1, rename the nodes to LBSC.

Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
---
 arch/arm/boot/dts/renesas/r8a7778-bockw.dts | 2 +-
 arch/arm/boot/dts/renesas/r8a7778.dtsi      | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/arm/boot/dts/renesas/r8a7778-bockw.dts b/arch/arm/boot/dts/renesas/r8a7778-bockw.dts
index a3f9d74e8877..d79095470a02 100644
--- a/arch/arm/boot/dts/renesas/r8a7778-bockw.dts
+++ b/arch/arm/boot/dts/renesas/r8a7778-bockw.dts
@@ -61,7 +61,7 @@ sndcodec: simple-audio-card,codec {
 	};
 };
 
-&bsc {
+&lbsc {
 	flash@0 {
 		compatible = "cfi-flash";
 		reg = <0x0 0x04000000>;
diff --git a/arch/arm/boot/dts/renesas/r8a7778.dtsi b/arch/arm/boot/dts/renesas/r8a7778.dtsi
index ab3e42bded8c..859dd29dfce3 100644
--- a/arch/arm/boot/dts/renesas/r8a7778.dtsi
+++ b/arch/arm/boot/dts/renesas/r8a7778.dtsi
@@ -40,7 +40,7 @@ aliases {
 		spi2 = &hspi2;
 	};
 
-	bsc: bus {
+	lbsc: bus {
 		compatible = "simple-bus";
 		#address-cells = <1>;
 		#size-cells = <1>;
-- 
2.45.2


