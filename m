Return-Path: <linux-renesas-soc+bounces-9062-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id BA4B4986E5D
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 26 Sep 2024 09:58:19 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 638D6B21FB0
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 26 Sep 2024 07:58:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DCE2D192586;
	Thu, 26 Sep 2024 07:58:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b="TIE9wMJW"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail.zeus03.de (zeus03.de [194.117.254.33])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BE2C318EFC6
	for <linux-renesas-soc@vger.kernel.org>; Thu, 26 Sep 2024 07:58:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=194.117.254.33
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727337489; cv=none; b=NtWoU6KSXA4bZPU+DG0tyG05kp0lYx+eObAXl7pH/ZKXUFPxuTZvbJcAgxwnAZSrTSJ0KGxQSFTrQfO7J49HEi5KIDSS6tNHoTYtHPFOlvm6CJhZ+5F5jYApGnyeK+LmG6D887LmS6JlCyVG2V8SLRCLAPt4OGf1+9pBLtfuU4c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727337489; c=relaxed/simple;
	bh=wIYRf9EbMSEeEWsgflMzL8D8raMSQj1o9zyGDJJTQ3w=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=VJQK7geLRScE+L+1it4Pv+S7Y1hGvE642nCIjciZcifJId8Dq/V6+GZJYUT4uVuDj+q7USDMMtc9JIz4uPd3m/OIveVB+ph6wYCJqCEZyMMIMCvSldOvwoA8HiAcT2eVtIQ0kF7/gB7ZCY4DaMjFT82WeAaKl10Mhv47ieObHTE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com; spf=pass smtp.mailfrom=sang-engineering.com; dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b=TIE9wMJW; arc=none smtp.client-ip=194.117.254.33
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sang-engineering.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	sang-engineering.com; h=from:to:cc:subject:date:message-id
	:in-reply-to:references:mime-version:content-transfer-encoding;
	 s=k1; bh=pWFnICiipa/0tr8pZTJI/3qd/xnCHDQlED+6r1DmjXE=; b=TIE9wM
	JWtb+TvOKTYcrfY+iSr9V+3GQ4VUmlDFqZXJZ9pSxKWBeXVew95fTXrgNvMmfXNP
	anhLxth84G8zARSrAHnsLeZMwDM/ORVJinGPxMGNnFpOtKxtSv8r1ciZmzHzvgRI
	r/UEawBDn7UoslRGRz4SBmVUSSGHF7Tikt09UZ8TrL5VMqwpDkQe5i3EZe3cUdar
	DF3BB9ExnJzG4stJHAiWoAYq0S0tpVNO5L0k+wvNudMBnVIhJE69aSiLmVK6KGVd
	60P3a1u1HSoFHK1zATv60w89jbfDMm1//NaG704m17s1wI0NroYxeGfdg2KksevW
	Dy/Or3J3GVLhCHZg==
Received: (qmail 901368 invoked from network); 26 Sep 2024 09:58:02 +0200
Received: by mail.zeus03.de with ESMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 26 Sep 2024 09:58:02 +0200
X-UD-Smtp-Session: l3s3148p1@k/UCGQEjLQ5tKPAR
From: Wolfram Sang <wsa+renesas@sang-engineering.com>
To: linux-renesas-soc@vger.kernel.org
Cc: Wolfram Sang <wsa+renesas@sang-engineering.com>
Subject: [PATCH 2/2] ARM: dts: renesas: r8a7778: rename 'bsc' to 'lbsc'
Date: Thu, 26 Sep 2024 09:57:27 +0200
Message-ID: <20240926075724.6161-6-wsa+renesas@sang-engineering.com>
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
index ab0b76eacd3c..c2464602cbb8 100644
--- a/arch/arm/boot/dts/renesas/r8a7778.dtsi
+++ b/arch/arm/boot/dts/renesas/r8a7778.dtsi
@@ -40,7 +40,7 @@ aliases {
 		spi2 = &hspi2;
 	};
 
-	bsc: bus@ff800000 {
+	lbsc: bus@ff800000 {
 		compatible = "simple-bus";
 		#address-cells = <1>;
 		#size-cells = <1>;
-- 
2.45.2


