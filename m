Return-Path: <linux-renesas-soc+bounces-15001-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 2878DA74DE5
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 28 Mar 2025 16:33:21 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id ECD6317B954
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 28 Mar 2025 15:33:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 133F11C84C8;
	Fri, 28 Mar 2025 15:33:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b="KBNtGK7G"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail.zeus03.de (zeus03.de [194.117.254.33])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 84BC71B0F32
	for <linux-renesas-soc@vger.kernel.org>; Fri, 28 Mar 2025 15:33:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=194.117.254.33
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743175994; cv=none; b=LP2MpOh8pxLkI94guVeQEe6z220tteupqIr8v0VF3qTHLjzQAMry5xOLPpCtFEEgFDSqGtS5Oi9lFDGpg9UPjc+fKnaCw1ZkIo203xVZ/dAZvCXnmndPsRc82dR0jqsJALmCeBhYyn4es0eSSh9nO2M3DVl6ka5grxAe5nWns80=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743175994; c=relaxed/simple;
	bh=gAfSTmt6C9wVmBCIgiPdQ30mpD7ytGP+lPJARTBZUG4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=P8jeL5A6j36MRfXp6lcKaTWxRkWSOEocWsYNuslzx3TRc4s0/8aNQxWbVDUoygYhixPDRnzmB8MuMemwK9HknH6dKqW4kXS/BCKekuoaVqU+GoT0pa/wvm2lvASjT55Ovm8f4RimKYLPvRprS1cmJnfgvWNINvZoZOGL95r4k7s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com; spf=pass smtp.mailfrom=sang-engineering.com; dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b=KBNtGK7G; arc=none smtp.client-ip=194.117.254.33
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sang-engineering.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	sang-engineering.com; h=from:to:cc:subject:date:message-id
	:in-reply-to:references:mime-version:content-transfer-encoding;
	 s=k1; bh=eRounbwEII1Mji3E5hvnFfPeOe9F5TF+yC1aFeQ/G7c=; b=KBNtGK
	7G33cAdYYUfIkCVRGbMBRfK5K1h9yrAeKTxDEure3Cc5qNCcp8FiDBimhgl2WHox
	y80K2v2Bwf17DQsFZy/lfsE2c08YeLKawqwBHObBgV2m+3LS1OZD4rc/VV/Xbd0p
	ob8W3jWLsJ4eqQ4blJEIqtDoSZZr8nCshYExEXqNdZTzkqqroj0S6LolN24HeDde
	H6bQ0Wkzn+ihoSeC7AIxnBUnc7bvtFli22aitJpV/z/X/+YxvSyt3rnnyztlTKef
	J9iJ5YBrxgmvuDPw+7Nm817cW7noluIku294rCAevVrb297o5y6MTH2rDO1s6xYK
	EVyjTZEoiEkMDadw==
Received: (qmail 298991 invoked from network); 28 Mar 2025 16:33:09 +0100
Received: by mail.zeus03.de with UTF8SMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 28 Mar 2025 16:33:09 +0100
X-UD-Smtp-Session: l3s3148p1@3oWXyWgxiBJtKjE8
From: Wolfram Sang <wsa+renesas@sang-engineering.com>
To: linux-renesas-soc@vger.kernel.org
Cc: Wolfram Sang <wsa+renesas@sang-engineering.com>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Magnus Damm <magnus.damm@gmail.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	devicetree@vger.kernel.org
Subject: [PATCH 3/5] ARM: dts: renesas: r9a06g032-rzn1d400-eb: describe I2C bus
Date: Fri, 28 Mar 2025 16:31:36 +0100
Message-ID: <20250328153134.2881-10-wsa+renesas@sang-engineering.com>
X-Mailer: git-send-email 2.47.2
In-Reply-To: <20250328153134.2881-7-wsa+renesas@sang-engineering.com>
References: <20250328153134.2881-7-wsa+renesas@sang-engineering.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The actual sensor might differ, but all known are LM75B compatible.

Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
---
 arch/arm/boot/dts/renesas/r9a06g032-rzn1d400-eb.dts | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/arch/arm/boot/dts/renesas/r9a06g032-rzn1d400-eb.dts b/arch/arm/boot/dts/renesas/r9a06g032-rzn1d400-eb.dts
index 1aac06b0e423..56da1d5fd5f4 100644
--- a/arch/arm/boot/dts/renesas/r9a06g032-rzn1d400-eb.dts
+++ b/arch/arm/boot/dts/renesas/r9a06g032-rzn1d400-eb.dts
@@ -14,6 +14,14 @@ / {
 		     "renesas,r9a06g032";
 };
 
+&i2c2 {
+	/* Sensors are different across revisions. All are LM75B compatible */
+	sensor@49 {
+		compatible = "national,lm75b";
+		reg = <0x49>;
+	};
+};
+
 &mii_conv2 {
 	renesas,miic-input = <MIIC_SWITCH_PORTD>;
 	status = "okay";
-- 
2.47.2


