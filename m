Return-Path: <linux-renesas-soc+bounces-22473-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 01773BAC6F5
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 30 Sep 2025 12:17:30 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id B04D33A2F64
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 30 Sep 2025 10:17:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A8EAE2F83DE;
	Tue, 30 Sep 2025 10:17:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b="TnlQz9tD"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail.zeus03.de (zeus03.de [194.117.254.33])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 988E12F549F
	for <linux-renesas-soc@vger.kernel.org>; Tue, 30 Sep 2025 10:17:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=194.117.254.33
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759227445; cv=none; b=tPtgkoMpxKUyfjzUkfecRmiAZpX+2m2JORuu1wdQ0g3dnm4/M9n2cIXpUwoB3fp5ifVIVrYzjVRsOwTfukWKztXKKfx10au2p7Nx39T00sujpnWqtxSKTmdohq0IlE5uEvlc0m+3J4vGdQigqsh+xh7r3rC0quX8AjTB97euATI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759227445; c=relaxed/simple;
	bh=QandvF5KWpOp+GaANjOBwjYh1R57HZSpAtU3WMEf9g4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Gb5Ijtzjw8DdcMS/hiifY4Vql9/SWeen8MZvP4YUK3qfg5SpXDcdh/SZmTprQmeLzj7tkohJnsRCAsQU6K/fjT6r9DodfaeSARAsCjk16yec12pr/H1QrwYo2TCsDATZCfjA0QWPJu5xTXV0rUIB3atou3BFUuRwUz3BHeOCyHI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com; spf=pass smtp.mailfrom=sang-engineering.com; dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b=TnlQz9tD; arc=none smtp.client-ip=194.117.254.33
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sang-engineering.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	sang-engineering.com; h=from:to:cc:subject:date:message-id
	:in-reply-to:references:mime-version:content-transfer-encoding;
	 s=k1; bh=sheERehMFUpF0485bXSmqi+Yb//OliKj2Vr9w1NHpLA=; b=TnlQz9
	tDMUSEg0zssysVTVHXbHiEmXsXOihmw+dKoMDBsvATKty+il4itYL8aYfsuYJYQ9
	76P5bC239ZZmcFBkMC2Isom48RHSY8axWr6XucQWfLyiMtVdltufRnyAMVY9/N2t
	0iOjd0ctOqDMDMAarkjPxSQMPh3Ml8OnOKGMA0Aa+ZFCj/2GnJIzLp4chaukjFAd
	K8jMk1SFsEmeQtFKiFoMYRAovz6UVjtw7MgcSru9I+li1Vrg/zjNPQdEgKpBZjHK
	dFGtif/tFbUA32Yma48xm0d9t5m5V0p5XDLsGi20/fvMoKsuZRBL28xScqSGxHXp
	Dw/fvZgU1ySD4IyA==
Received: (qmail 3595881 invoked from network); 30 Sep 2025 12:17:15 +0200
Received: by mail.zeus03.de with UTF8SMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 30 Sep 2025 12:17:15 +0200
X-UD-Smtp-Session: l3s3148p1@gdRgDgJAMosgAwDPXwQHAL/S9V79e5yL
From: Wolfram Sang <wsa+renesas@sang-engineering.com>
To: linux-renesas-soc@vger.kernel.org
Cc: Wolfram Sang <wsa+renesas@sang-engineering.com>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Magnus Damm <magnus.damm@gmail.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	devicetree@vger.kernel.org
Subject: [RFC PATCH 2/4] ARM: dts: renesas: genmai: mtd-rom has no clock and power domain
Date: Tue, 30 Sep 2025 12:16:58 +0200
Message-ID: <20250930101656.33435-8-wsa+renesas@sang-engineering.com>
X-Mailer: git-send-email 2.47.2
In-Reply-To: <20250930101656.33435-6-wsa+renesas@sang-engineering.com>
References: <20250930101656.33435-6-wsa+renesas@sang-engineering.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Clocks are now marked as critical to avoid regressions with XIP based
systems.

Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
---
 arch/arm/boot/dts/renesas/r7s72100-genmai.dts | 3 ---
 1 file changed, 3 deletions(-)

diff --git a/arch/arm/boot/dts/renesas/r7s72100-genmai.dts b/arch/arm/boot/dts/renesas/r7s72100-genmai.dts
index 3c3756509714..835a918a0924 100644
--- a/arch/arm/boot/dts/renesas/r7s72100-genmai.dts
+++ b/arch/arm/boot/dts/renesas/r7s72100-genmai.dts
@@ -31,9 +31,6 @@ flash@18000000 {
 		bank-width = <4>;
 		device-width = <1>;
 
-		clocks = <&mstp9_clks R7S72100_CLK_SPIBSC0>;
-		power-domains = <&cpg_clocks>;
-
 		#address-cells = <1>;
 		#size-cells = <1>;
 
-- 
2.47.2


