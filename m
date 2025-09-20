Return-Path: <linux-renesas-soc+bounces-22112-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 11D05B8C106
	for <lists+linux-renesas-soc@lfdr.de>; Sat, 20 Sep 2025 08:45:02 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id BEEB3562F88
	for <lists+linux-renesas-soc@lfdr.de>; Sat, 20 Sep 2025 06:45:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 07EDD2D660A;
	Sat, 20 Sep 2025 06:44:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b="SzsZAsNh"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail.zeus03.de (zeus03.de [194.117.254.33])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 598E62D6621
	for <linux-renesas-soc@vger.kernel.org>; Sat, 20 Sep 2025 06:44:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=194.117.254.33
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758350697; cv=none; b=AeDx9XnfBS+5PNsyM1W4NYcwfJpjDQqQKDKAaXNwLVj80jUPNndDe+KGL1p8khqygWuZvpFzwHa73M2cml0ZeS/X2U5ANUUxhgAIQ99C2T/JkAjOJswxYsco19F7hhckMR5bToEoPbHxQnR+yP2sjZfoIGHRiDRkRWSYjpByM/s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758350697; c=relaxed/simple;
	bh=2HtWnFe/hnuIwSJ9zIEL7aJj77kqqVpiEMPUnqqzWZw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=eTZ4oOvV74jn9oFg4RuGFnTzl33SnXOq1ZOTz1QYJOKuiZW8oB5QCQST94xGGt8YvFt/E4ubt31UBWB4OLJo7Rw4NsoEeKlbC+iNUR3Ir9E6cU++zU/+zGGu1oKPPEinVD8xG/ldY5QaiCRotg7SsUSVJMYgEqb9+BMCdIa1W50=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com; spf=pass smtp.mailfrom=sang-engineering.com; dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b=SzsZAsNh; arc=none smtp.client-ip=194.117.254.33
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sang-engineering.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	sang-engineering.com; h=from:to:cc:subject:date:message-id
	:in-reply-to:references:mime-version:content-transfer-encoding;
	 s=k1; bh=bowJhqsSTk2Nlx4kyprHvlK9kZLzKae9EUW/TMd/5L4=; b=SzsZAs
	NhFQtr9WGTn1OS1k04qUT3m7Kw4hEsFo6OqBsgGp8AN8JExb5+4MPWHM73TYTfng
	HfUJaDBQPdrqBhVpOdV/6O9Ijw6yOtiXfezK/C7oXDYHjjvlxGUW38wfg+JSjJps
	dQtLSv5FEb74hOr/pciieaF5nMgEGtxbdsTJKhpWk24ouAmVXsM9+YuFf4qL1fNN
	KKshVMvGwCy690qX4e+czCTaLWDUHP0WpMKt5ZU8ZWtrM0LwTU5YE4J9VJVSjb1h
	52GUo4PHbe40PrBDmMj1s++ruxMM14+1zHZKAaBGbEFi5IKN9rwhehNX9dM93HNQ
	1ljN3tz6OwIo/A+w==
Received: (qmail 4169358 invoked from network); 20 Sep 2025 08:44:45 +0200
Received: by mail.zeus03.de with UTF8SMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 20 Sep 2025 08:44:45 +0200
X-UD-Smtp-Session: l3s3148p1@aFn26zU/dMkgAwDPXwQHAL/S9V79e5yL
From: Wolfram Sang <wsa+renesas@sang-engineering.com>
To: linux-renesas-soc@vger.kernel.org
Cc: Wolfram Sang <wsa+renesas@sang-engineering.com>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Magnus Damm <magnus.damm@gmail.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	devicetree@vger.kernel.org
Subject: [RFC PATCH 5/6] arm64: dts: renesas: salvator-common: mark SWDT as reserved
Date: Sat, 20 Sep 2025 08:44:32 +0200
Message-ID: <20250920064428.5544-13-wsa+renesas@sang-engineering.com>
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
Salvator boards. Sadly, it doesn't mark the node as reserved, so this is
added manually here.

Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
---
 arch/arm64/boot/dts/renesas/salvator-common.dtsi | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/arch/arm64/boot/dts/renesas/salvator-common.dtsi b/arch/arm64/boot/dts/renesas/salvator-common.dtsi
index bbb3583372d0..fa8bfee07b3c 100644
--- a/arch/arm64/boot/dts/renesas/salvator-common.dtsi
+++ b/arch/arm64/boot/dts/renesas/salvator-common.dtsi
@@ -1004,6 +1004,11 @@ &ssi1 {
 	shared-pin;
 };
 
+/* Firmware should reserve it but sadly doesn't */
+&swdt {
+	status = "reserved";
+};
+
 &usb_extal_clk {
 	clock-frequency = <50000000>;
 };
-- 
2.47.2


