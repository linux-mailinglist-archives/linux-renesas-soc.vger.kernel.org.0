Return-Path: <linux-renesas-soc+bounces-22111-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 93BFBB8C118
	for <lists+linux-renesas-soc@lfdr.de>; Sat, 20 Sep 2025 08:45:12 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 2C9A3188BAF3
	for <lists+linux-renesas-soc@lfdr.de>; Sat, 20 Sep 2025 06:45:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8E8EC2D5C6A;
	Sat, 20 Sep 2025 06:44:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b="SYNAL7ZZ"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail.zeus03.de (zeus03.de [194.117.254.33])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A4C692D6E45
	for <linux-renesas-soc@vger.kernel.org>; Sat, 20 Sep 2025 06:44:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=194.117.254.33
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758350697; cv=none; b=nqmkU7XMnBHNetf4o3+yvlmmMtZE+fm4a+4USKi5aZtYhY0VZuKaKhhY2jI333hItvcC6NysMhkH+ECF7e+8gdwNFz3wNvnSDhT+qBiPJF+IM2rdqbumXGUdZGpdNk9lFeC2/fVSQz4ZqWizuttKXMDfzn5YJ/j80wAUECeNCMc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758350697; c=relaxed/simple;
	bh=GOOW/d/ss8up/fz43pypDl4Y02NWzBsQZ6XqY2/VBCE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=eNgeiMq/e+2RGELjfWjC/rgIriSWfWnipBeLzfVcT0cA2TJkJl1vzDK35fZTmUxuOsxGDV3shtvYoHEy1lWn0OsCI3LOvvgvbgqj0B+YsLGKZl0YA7QSJZtXtlTICaUty2e8bxO2qrlkozDy8zd61u0zlzxOHNPSrN1wcCUtF90=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com; spf=pass smtp.mailfrom=sang-engineering.com; dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b=SYNAL7ZZ; arc=none smtp.client-ip=194.117.254.33
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sang-engineering.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	sang-engineering.com; h=from:to:cc:subject:date:message-id
	:in-reply-to:references:mime-version:content-transfer-encoding;
	 s=k1; bh=tAQzM1sJbeBSeptPyMrJdNzl+tol7KBGvjuoPdcZrVc=; b=SYNAL7
	ZZr5mWNusA9XYw6JVntlViD0ZszPNniDnJBBrz4FLVW8hZVDY9cNDya1chzSdGM5
	rGOQxPBfdR+tXO0MBRaDF9c3thIZPFmUn9rEzX5Mjmn+k0LgjpV+Yq8Z3CQA0orX
	pyxlcH44VRtp0Bhehyen8WY3A5+/khGxiCRCm9jJ1h9xHWyFeUea07SSdf67nHWJ
	efmSkYRVJJbLgyPOZBfS1mpzCLu33mBwUus1i4mdTow28dGNrcZyFbemd7sXTCJC
	xRN9ewWFVlm0UZHKC6yG/MJ7p4F3hVRclGB0LdJqVFgBqS9bito7Q3aJjiMVylbT
	DafllC0AztWh7g6w==
Received: (qmail 4169376 invoked from network); 20 Sep 2025 08:44:46 +0200
Received: by mail.zeus03.de with UTF8SMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 20 Sep 2025 08:44:46 +0200
X-UD-Smtp-Session: l3s3148p1@MF0D7DU/eskgAwDPXwQHAL/S9V79e5yL
From: Wolfram Sang <wsa+renesas@sang-engineering.com>
To: linux-renesas-soc@vger.kernel.org
Cc: Wolfram Sang <wsa+renesas@sang-engineering.com>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Magnus Damm <magnus.damm@gmail.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	devicetree@vger.kernel.org
Subject: [RFC PATCH 6/6] arm64: dts: renesas: ulcb: mark SWDT as reserved
Date: Sat, 20 Sep 2025 08:44:33 +0200
Message-ID: <20250920064428.5544-14-wsa+renesas@sang-engineering.com>
X-Mailer: git-send-email 2.47.2
In-Reply-To: <20250920064428.5544-8-wsa+renesas@sang-engineering.com>
References: <20250920064428.5544-8-wsa+renesas@sang-engineering.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This watchdog can't be used with Linux because the firmware needs it on
ULCB boards. Sadly, it doesn't mark the node as reserved, so this is
added manually here.

Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
---
 arch/arm64/boot/dts/renesas/ulcb.dtsi | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/arch/arm64/boot/dts/renesas/ulcb.dtsi b/arch/arm64/boot/dts/renesas/ulcb.dtsi
index 8a30908992ab..a9e53b36f1d9 100644
--- a/arch/arm64/boot/dts/renesas/ulcb.dtsi
+++ b/arch/arm64/boot/dts/renesas/ulcb.dtsi
@@ -495,6 +495,11 @@ &ssi1 {
 	shared-pin;
 };
 
+/* Firmware should reserve it but sadly doesn't */
+&swdt {
+	status = "reserved";
+};
+
 &usb2_phy1 {
 	pinctrl-0 = <&usb1_pins>;
 	pinctrl-names = "default";
-- 
2.47.2


