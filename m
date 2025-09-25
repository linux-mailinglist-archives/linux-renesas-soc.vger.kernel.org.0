Return-Path: <linux-renesas-soc+bounces-22357-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id BC6DEB9E730
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 25 Sep 2025 11:40:49 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id AD8551670EE
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 25 Sep 2025 09:40:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C698B2E9EA3;
	Thu, 25 Sep 2025 09:40:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b="LJXu/zve"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail.zeus03.de (zeus03.de [194.117.254.33])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8A3512E9EBA
	for <linux-renesas-soc@vger.kernel.org>; Thu, 25 Sep 2025 09:40:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=194.117.254.33
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758793225; cv=none; b=iycJbT/MtKSlL3CryeqJU53418IlyoKplTeFMavCYvXwZYi5EH4qBCB78jEMO8A4XH9wDGk6vbT2ZembPB0tiOsAaNiYvRjPqi2RtBTR2xTRjlKgU+bJVwqEIuFe2Nw+ApuOSVFso7Jxf9fSiyMaPgEbTqPcv5LldfIrqiLBZLg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758793225; c=relaxed/simple;
	bh=vxvYLQO9phYGJkc+gdjo1Xhhq7lgjFu8nyQNXpnJqY8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=K53Ef+u/MatDHNtjUKZz9OxrJ9K/IAoiswFTpaTBUye1BTrIgqXr1I8+LcTW1JvDFDVXjKCPkm0u4//MqqTEfGHkA5HmnbHJxpbdmfzWwx5zSXb3orG7Gem/XcNpnuKAqnVhpfuu/3j5+ZT9jOr861QQ0Kd8yztG2uuN6oFFz7s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com; spf=pass smtp.mailfrom=sang-engineering.com; dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b=LJXu/zve; arc=none smtp.client-ip=194.117.254.33
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sang-engineering.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	sang-engineering.com; h=from:to:cc:subject:date:message-id
	:in-reply-to:references:mime-version:content-transfer-encoding;
	 s=k1; bh=3Wbv3jhwyJBfvYddoKPHnDNYV4judAvwM1bScbqM2vo=; b=LJXu/z
	veG9mI3jSEmb//TGoBUWq766vm2xIisoWvaBgZ1KT0Q+ICgUDgXOPFguaVOPvudQ
	cPR8lrh4orLfJ4JEK1dMa0w/bCQdcA1bpVqhxbLd6bT4+wV/Fx4X7sPemeHWao32
	7i+CQFUsAg1p2Hr6jv4+Mvx7x1tSDkeySbuphSRLMc2KIDSju3Ihb84EiqfXJ/FP
	aq3gTeXk/pegHg1ufwYThIKx94f8Lryh3JLM3n9psCo16yQgtUSfCJxDfD2P0U1c
	6jFHE1EyG8rEGFI4i0eF55NTOo4YKM6WKjQZDjEzrYbFL+ON9PkR+WNi0/ntu0D8
	sEvgEVgvp8ixs9GQ==
Received: (qmail 1813310 invoked from network); 25 Sep 2025 11:40:19 +0200
Received: by mail.zeus03.de with UTF8SMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 25 Sep 2025 11:40:19 +0200
X-UD-Smtp-Session: l3s3148p1@DFQV9Zw/yMQgAwDPXwQHAL/S9V79e5yL
From: Wolfram Sang <wsa+renesas@sang-engineering.com>
To: linux-renesas-soc@vger.kernel.org
Cc: Wolfram Sang <wsa+renesas@sang-engineering.com>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Magnus Damm <magnus.damm@gmail.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	devicetree@vger.kernel.org
Subject: [PATCH 07/12] arm64: dts: renesas: r8a77995: add SWDT node
Date: Thu, 25 Sep 2025 11:39:46 +0200
Message-ID: <20250925093941.8800-21-wsa+renesas@sang-engineering.com>
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

Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
---
 arch/arm64/boot/dts/renesas/r8a77995.dtsi | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/arch/arm64/boot/dts/renesas/r8a77995.dtsi b/arch/arm64/boot/dts/renesas/r8a77995.dtsi
index b66cd7c90d53..1987a5104cad 100644
--- a/arch/arm64/boot/dts/renesas/r8a77995.dtsi
+++ b/arch/arm64/boot/dts/renesas/r8a77995.dtsi
@@ -104,6 +104,16 @@ rwdt: watchdog@e6020000 {
 			status = "disabled";
 		};
 
+		swdt: watchdog@e6030000 {
+			compatible = "renesas,r8a77995-wdt", "renesas,rcar-gen3-wdt";
+			reg = <0 0xe6030000 0 0x0c>;
+			interrupts = <GIC_SPI 141 IRQ_TYPE_LEVEL_HIGH>;
+			clocks = <&cpg CPG_CORE R8A77995_CLK_OSC>;
+			power-domains = <&sysc R8A77995_PD_ALWAYS_ON>;
+			resets = <&cpg 401>;
+			status = "disabled";
+		};
+
 		gpio0: gpio@e6050000 {
 			compatible = "renesas,gpio-r8a77995",
 				     "renesas,rcar-gen3-gpio";
-- 
2.47.2


