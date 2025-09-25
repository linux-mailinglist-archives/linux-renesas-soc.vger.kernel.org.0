Return-Path: <linux-renesas-soc+bounces-22362-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id CEEAFB9E739
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 25 Sep 2025 11:40:56 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 4F03C16D784
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 25 Sep 2025 09:40:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 800BC2E8DFD;
	Thu, 25 Sep 2025 09:40:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b="eUpHjrzi"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail.zeus03.de (zeus03.de [194.117.254.33])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A18C525EF97
	for <linux-renesas-soc@vger.kernel.org>; Thu, 25 Sep 2025 09:40:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=194.117.254.33
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758793231; cv=none; b=SPhNNGDEv4QiWPXPh28eMwbQVj7XfzMQlaLpF1F3HzEBzdysqOnytlEGFmK2yXIwM5f3oTwUuFeX1AZoZg1bCrUAXX85me0J7LUObTkK/ZgfWj5P3uQM8kaJxFKnD8tvesU5keWI/k5A+tj5gssVCWYm4dxaVQs4WBLxLoAciVo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758793231; c=relaxed/simple;
	bh=J5SWTwBQj3vZ+uBbVI4a+cRgayYj0KygIoeyuTFXEZM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=N/cl/bLem7WaAoZDwByp4YWnbheoPPQE92e4Z6ckYW8DHlYYWSArlX8aJ7RlyOC2twKAjWpebbeZOb7GGqqSgItx5Xj5qdJFhlKVXcJ/YCWsixLjefPBn6FRsNNwuN6PsMGIwoxqFwCACiR2KvF1pckA43LDvEdx8JqgjhPdjhM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com; spf=pass smtp.mailfrom=sang-engineering.com; dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b=eUpHjrzi; arc=none smtp.client-ip=194.117.254.33
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sang-engineering.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	sang-engineering.com; h=from:to:cc:subject:date:message-id
	:in-reply-to:references:mime-version:content-transfer-encoding;
	 s=k1; bh=iYLiglZoP7UdNQXASDqzp2JktW5slBs7HguEMHDrwfM=; b=eUpHjr
	ziFTuRyQjrj+OdrsncyuGAyIarOWqUEWHfhKf74/8xgiCBm2bl9e6Ic+vN+PPVJJ
	4DIEp8PMLKTbtIHs5FSxxjnY8ue5c4z4jTTJcmbb8fdP05EsxIKQeDe+XDidiXSm
	hGTK6AmDo/VGdrX1GcCa1GEBpidkiN6hF+VIjOB6OcZUb5VYGX2MPR8LJXZcfz4h
	CfwM8rynzQhHdGHb1dunw4G1wkPgqmsP5XQVTaUeAUDXYbwENekjNkgV3EV6+K2g
	pf64F3iBAHWf/Ukg8jh0JQVds83zZkqvJRTV+l/rJ6VJYoTpqZ6duJU9dLqFG8Lb
	JMGo3ctLDEDM/OpA==
Received: (qmail 1813477 invoked from network); 25 Sep 2025 11:40:22 +0200
Received: by mail.zeus03.de with UTF8SMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 25 Sep 2025 11:40:22 +0200
X-UD-Smtp-Session: l3s3148p1@yo9F9Zw/XpcgAwDPXwQHAL/S9V79e5yL
From: Wolfram Sang <wsa+renesas@sang-engineering.com>
To: linux-renesas-soc@vger.kernel.org
Cc: Wolfram Sang <wsa+renesas@sang-engineering.com>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Magnus Damm <magnus.damm@gmail.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	devicetree@vger.kernel.org
Subject: [PATCH 11/12] arm64: dts: renesas: ebisu: mark SWDT as reserved
Date: Thu, 25 Sep 2025 11:39:50 +0200
Message-ID: <20250925093941.8800-25-wsa+renesas@sang-engineering.com>
X-Mailer: git-send-email 2.47.2
In-Reply-To: <20250925093941.8800-14-wsa+renesas@sang-engineering.com>
References: <20250925093941.8800-14-wsa+renesas@sang-engineering.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This watchdog can't be used with Linux because the firmware needs it on
Ebisu boards. Sadly, it doesn't mark the node as reserved, so this is
added manually here.

Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
---
 arch/arm64/boot/dts/renesas/ebisu.dtsi | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/arch/arm64/boot/dts/renesas/ebisu.dtsi b/arch/arm64/boot/dts/renesas/ebisu.dtsi
index c4c86344fb90..adc4449b809a 100644
--- a/arch/arm64/boot/dts/renesas/ebisu.dtsi
+++ b/arch/arm64/boot/dts/renesas/ebisu.dtsi
@@ -858,6 +858,11 @@ &ssi1 {
 	shared-pin;
 };
 
+/* Firmware should reserve it but sadly doesn't */
+&swdt {
+	status = "reserved";
+};
+
 &usb2_phy0 {
 	pinctrl-0 = <&usb0_pins>;
 	pinctrl-names = "default";
-- 
2.47.2


