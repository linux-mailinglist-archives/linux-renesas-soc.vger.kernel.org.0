Return-Path: <linux-renesas-soc+bounces-16788-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 862CFAAF4E4
	for <lists+linux-renesas-soc@lfdr.de>; Thu,  8 May 2025 09:43:46 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 029594E1221
	for <lists+linux-renesas-soc@lfdr.de>; Thu,  8 May 2025 07:43:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5C715221D92;
	Thu,  8 May 2025 07:43:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b="KCQUC4Qe"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail.zeus03.de (zeus03.de [194.117.254.33])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4F1682222B4
	for <linux-renesas-soc@vger.kernel.org>; Thu,  8 May 2025 07:43:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=194.117.254.33
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746690205; cv=none; b=kNNWGon6Sg43T16z8opJ+XqN64dHtX0oehDcWEByuvUDHSoI7yYQ19bwFEXXVBwC2b9rNWJM6xJa5pFUxJSPg5n4B0BnuZbSYyidrIWm/PwQG0tyZ1E3NojKoDyzPPH+mhBzWOqNnRBEFvH1Hv7umVDnXUQW+7d7q8MqzqD9ntk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746690205; c=relaxed/simple;
	bh=RbivIt+RNJiE/Z6dsoLo0RKAvo1VweEt7+we8rg11bw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=MciXBe/+jFYOad1cLqDugoT3KhZ7wB9hp8q7b0N1s9Z+YRFJYM1+nnV9OEzcVjlSDHeI+qXvn4+SOOm30dMpdBQDYoei1IK5fMd68/I0wxkE7VL36/Hf4/nAeMTNab7ZcBAlKKzdgwB3NgqbvfhjfwswXLEe6SoIi6me9yurh74=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com; spf=pass smtp.mailfrom=sang-engineering.com; dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b=KCQUC4Qe; arc=none smtp.client-ip=194.117.254.33
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sang-engineering.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	sang-engineering.com; h=from:to:cc:subject:date:message-id
	:in-reply-to:references:mime-version:content-transfer-encoding;
	 s=k1; bh=zYH7l1qDluR4uZNcsoOblZcJLGUhttBGflEDpW4pTXQ=; b=KCQUC4
	QeayDCkkyYmKAz8qZa/5OJCTlhzLlkJffgcuf9NSpXCDVFo8c5axDBR+tLdvj5dG
	A7ygADcNXeM6z1apBihUFX14Qz1Swo8gib7ewWiwctojRMB6kBADxFXF6d6RYeHi
	fKUj+4q5815DE2y4Lrr7RjpyTj3xWuSRmi9LuDE0JUlE2pDwxkjMKNwPjSOKuRLs
	sy9BVZWdPQkiSUgxVJO3cbruV3xM1LeHU+4CBH8OvXkugh5BaqN2aTSb9Bffg9hk
	JiBxvlsIHDVchAZ+xNBFKvBw/UiRRJXzzoeeo3MSf9gR2quJcyLPWE08Wa5awI95
	iwd/2+S3IFb88C6g==
Received: (qmail 3712261 invoked from network); 8 May 2025 09:43:20 +0200
Received: by mail.zeus03.de with UTF8SMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 8 May 2025 09:43:20 +0200
X-UD-Smtp-Session: l3s3148p1@NYjkAJs0hMMgAwDPXxyAAIlRla1HkD11
From: Wolfram Sang <wsa+renesas@sang-engineering.com>
To: linux-renesas-soc@vger.kernel.org
Cc: Wolfram Sang <wsa+renesas@sang-engineering.com>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Magnus Damm <magnus.damm@gmail.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	devicetree@vger.kernel.org
Subject: [PATCH v2 2/2] ARM: dts: renesas: r9a06g032-rzn1d400-eb: enable USB host port
Date: Thu,  8 May 2025 09:43:14 +0200
Message-ID: <20250508074311.20343-6-wsa+renesas@sang-engineering.com>
X-Mailer: git-send-email 2.47.2
In-Reply-To: <20250508074311.20343-4-wsa+renesas@sang-engineering.com>
References: <20250508074311.20343-4-wsa+renesas@sang-engineering.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Can be used via the USB connector J20.

Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
---
 arch/arm/boot/dts/renesas/r9a06g032-rzn1d400-eb.dts | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/arch/arm/boot/dts/renesas/r9a06g032-rzn1d400-eb.dts b/arch/arm/boot/dts/renesas/r9a06g032-rzn1d400-eb.dts
index b3de325fb47f..fb74dc45bd25 100644
--- a/arch/arm/boot/dts/renesas/r9a06g032-rzn1d400-eb.dts
+++ b/arch/arm/boot/dts/renesas/r9a06g032-rzn1d400-eb.dts
@@ -238,3 +238,7 @@ &uart2 {
 	status = "okay";
 	uart-has-rtscts;
 };
+
+&pci_usb {
+	status = "okay";
+};
-- 
2.47.2


