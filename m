Return-Path: <linux-renesas-soc+bounces-16371-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id C8CB2A9C491
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 25 Apr 2025 12:01:52 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id DEFF71BA6EDD
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 25 Apr 2025 10:02:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 080EA2222C5;
	Fri, 25 Apr 2025 10:01:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b="gtQNdlen"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail.zeus03.de (zeus03.de [194.117.254.33])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EB59621B8EC
	for <linux-renesas-soc@vger.kernel.org>; Fri, 25 Apr 2025 10:01:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=194.117.254.33
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745575305; cv=none; b=lRWk6RX3jsXjtjvOlI5pG2qGqlkmBWX6Z0+YXcfT2yDo4264tD6T6TqWa0NdYA80GUcF/ThRhCHhd1TkMBhZymVvf0Qh0fWUqUDUi9FvSGV/K0aZ1lc5H9mhF579HzkK+omUi4amtm3llQJuxEeNE2xwmlGm4169xAu1HMAZF70=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745575305; c=relaxed/simple;
	bh=C/5dpLKB9ZbDEh4Eub7emrQ8nGMKppDelAtEUJ5iKsA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Ej9eiwzWqv38ikaNoSQg7PaNOZZ5iLOCssfz7vXHtj6pHW5z39tOQaCkB6SFSjkYw5b7V2WiHzZQOHN/L0aAIL+g4c+P3RcfGBMyWfoJpmR3FOC5G1UoXaogc+noq3exiRz+9zO53ZayTOEjTRSG5bsXIRJyqb82vDrCnhopEJA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com; spf=pass smtp.mailfrom=sang-engineering.com; dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b=gtQNdlen; arc=none smtp.client-ip=194.117.254.33
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sang-engineering.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	sang-engineering.com; h=from:to:cc:subject:date:message-id
	:in-reply-to:references:mime-version:content-transfer-encoding;
	 s=k1; bh=PeBoWcpKbk2CFjVFHWbDdK5hVieSG2OwNQCZ6N/ZCiE=; b=gtQNdl
	enS529QkLAlYNEXjnSDGhBkzcTRzWXN9GMcSObDMnlOINsxOIyGXB068bkcf+RaY
	Lyp2fiXTJa7S+Q0Bdgzzb23X3fkUkEgJjol2/2DX8EkSfjmjjBtzwN11IGC/1FS+
	mNIHWZtTMZxarkj+rKsPzHyplmeUKlvzzrN0uObDU38RYe3s4b8Ny1Ksxb0YgM5+
	SOe0xEkmwoxGxuIUHLiIZXNFTYVPDBQbn6Mp9CtOW0IIsU/fed7v2x7TE9AyXP4S
	Ca2/yXP/sjxhPFivOGnCaZQSEvUJ2jQLOlcAgmOoTKQMz1ubQFOmOYNMRwBOIgNi
	gpOBU6MDRscu54pQ==
Received: (qmail 3778982 invoked from network); 25 Apr 2025 12:01:41 +0200
Received: by mail.zeus03.de with UTF8SMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 25 Apr 2025 12:01:41 +0200
X-UD-Smtp-Session: l3s3148p1@yDC6a5czYOMgAwDPXx6JAAunYj8Nf7DC
From: Wolfram Sang <wsa+renesas@sang-engineering.com>
To: linux-renesas-soc@vger.kernel.org
Cc: Wolfram Sang <wsa+renesas@sang-engineering.com>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Magnus Damm <magnus.damm@gmail.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	devicetree@vger.kernel.org
Subject: [PATCH 2/2] ARM: dts: renesas: r9a06g032-rzn1d400-eb: enable USB host port
Date: Fri, 25 Apr 2025 12:01:32 +0200
Message-ID: <20250425100129.11942-6-wsa+renesas@sang-engineering.com>
X-Mailer: git-send-email 2.47.2
In-Reply-To: <20250425100129.11942-4-wsa+renesas@sang-engineering.com>
References: <20250425100129.11942-4-wsa+renesas@sang-engineering.com>
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

A rockbox based media player was successfully found.

 arch/arm/boot/dts/renesas/r9a06g032-rzn1d400-eb.dts | 13 +++++++++++++
 1 file changed, 13 insertions(+)

diff --git a/arch/arm/boot/dts/renesas/r9a06g032-rzn1d400-eb.dts b/arch/arm/boot/dts/renesas/r9a06g032-rzn1d400-eb.dts
index a3ef9d407a95..0806a1ea836a 100644
--- a/arch/arm/boot/dts/renesas/r9a06g032-rzn1d400-eb.dts
+++ b/arch/arm/boot/dts/renesas/r9a06g032-rzn1d400-eb.dts
@@ -153,6 +153,13 @@ pins_uart2: pins-uart2 {
 			 <RZN1_PINMUX(108, RZN1_FUNC_UART2)>;
 		bias-disable;
 	};
+
+	pins_usb: pins-usb {
+		pinmux = <RZN1_PINMUX(119, RZN1_FUNC_USB)>,
+			 <RZN1_PINMUX(120, RZN1_FUNC_USB)>,
+			 <RZN1_PINMUX(121, RZN1_FUNC_USB)>,
+			 <RZN1_PINMUX(122, RZN1_FUNC_USB)>;
+	};
 };
 
 &sdio1 {
@@ -236,3 +243,9 @@ &uart2 {
 	status = "okay";
 	uart-has-rtscts;
 };
+
+&pci_usb {
+	pinctrl-0 = <&pins_usb>;
+	pinctrl-names = "default";
+	status = "okay";
+};
-- 
2.47.2


