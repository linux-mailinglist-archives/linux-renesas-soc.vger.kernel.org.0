Return-Path: <linux-renesas-soc+bounces-22683-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [IPv6:2a01:60a::1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id 9006DBBD56F
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 06 Oct 2025 10:29:23 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id 18166349BF0
	for <lists+linux-renesas-soc@lfdr.de>; Mon,  6 Oct 2025 08:29:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DC790260590;
	Mon,  6 Oct 2025 08:29:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b="bshZ43Oo"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail.zeus03.de (zeus03.de [194.117.254.33])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E01A625D540
	for <linux-renesas-soc@vger.kernel.org>; Mon,  6 Oct 2025 08:29:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=194.117.254.33
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759739348; cv=none; b=VPNmUjyvjPxB3PGUNLYKnHAHhik+4lu3JMKvgQcyfDlTQPjR8IbUPtS/OrJP5ATSjb+04NK1Pd/WTLH4/dxlBuWgGf9gv+BlHHIxiHt7jB2T/LohZzBXJmEm2VB/v6VSZc02o0Z0RFbc8QiBHAOu16/P5pQA6qM4fC+mZ3dlaFE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759739348; c=relaxed/simple;
	bh=mRSrhPbrrCh5BaRKkepzZgbK68IUQ3MlzTcu+fYmGqA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=JPx2BlkCJIwrA0ICXsPS8zpfm3m1ctype3puhaXDTCGXqMNLnrPQUWF/YVBzJOx0lCDAik8LdVigULSZV38OHS9tQh3SfXdkRKrvQHGMq+o1+7l+ac8MrWGOs5fNiDzqR4DVivl7kzI9FnV1hXIz9b29Fe/mRstPl7k5oFE3Vt4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com; spf=pass smtp.mailfrom=sang-engineering.com; dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b=bshZ43Oo; arc=none smtp.client-ip=194.117.254.33
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sang-engineering.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	sang-engineering.com; h=from:to:cc:subject:date:message-id
	:in-reply-to:references:mime-version:content-transfer-encoding;
	 s=k1; bh=neMNi18cayVN9r4QbRdGdrzvl1Z7fWX0iDtC5qyAZhU=; b=bshZ43
	Oo2/a/O9OaCLk4kCrMH7x0OH135YByXLgiI/DlPqmiwj1JkpgsQK4GgT2uUIdROq
	kT/tUj4t5YbUFgYJJNs1m9CZr1kt69mzG8+TcLItdH+DcE33+AjU2lvv5wI6bGwV
	u6jquxRaUSpXe8yHp/IXn/v3TtZhjReswbBb4z5oLGW59qUcCmUaVzkb6Mmo3xf4
	uCeyxYOqaijeE04kS3ZYfe3ie0kW0s50rtadHjbeQKFYN7WoUwNoLSl9Zgty2So+
	oMKc0sMdmj4WeU1P7A1racCQFgt3kK5HeeA8QdsEiWd76LbiuYF/JKiv9gmDVQEo
	AMyuX3UZxL8vAeTA==
Received: (qmail 1689760 invoked from network); 6 Oct 2025 10:29:02 +0200
Received: by mail.zeus03.de with UTF8SMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 6 Oct 2025 10:29:02 +0200
X-UD-Smtp-Session: l3s3148p1@5ldqPnlAYOwgAwDPXwQHAL/S9V79e5yL
From: Wolfram Sang <wsa+renesas@sang-engineering.com>
To: linux-renesas-soc@vger.kernel.org
Cc: Wolfram Sang <wsa+renesas@sang-engineering.com>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Magnus Damm <magnus.damm@gmail.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	devicetree@vger.kernel.org
Subject: [PATCH 1/9] arm64: dts: renesas: r8a779a0: add SWDT node
Date: Mon,  6 Oct 2025 10:25:19 +0200
Message-ID: <20251006082520.10570-12-wsa+renesas@sang-engineering.com>
X-Mailer: git-send-email 2.47.2
In-Reply-To: <20251006082520.10570-11-wsa+renesas@sang-engineering.com>
References: <20251006082520.10570-11-wsa+renesas@sang-engineering.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
---
 arch/arm64/boot/dts/renesas/r8a779a0.dtsi | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/arch/arm64/boot/dts/renesas/r8a779a0.dtsi b/arch/arm64/boot/dts/renesas/r8a779a0.dtsi
index 2c3fb34abb28..5b69fd73fbdf 100644
--- a/arch/arm64/boot/dts/renesas/r8a779a0.dtsi
+++ b/arch/arm64/boot/dts/renesas/r8a779a0.dtsi
@@ -90,6 +90,16 @@ rwdt: watchdog@e6020000 {
 			status = "disabled";
 		};
 
+		swdt: watchdog@e6030000 {
+			compatible = "renesas,r8a779a0-wdt", "renesas,rcar-gen4-wdt";
+			reg = <0 0xe6030000 0 0x0c>;
+			interrupts = <GIC_SPI 24 IRQ_TYPE_LEVEL_HIGH>;
+			clocks = <&cpg CPG_CORE R8A779A0_CLK_OSC>;
+			power-domains = <&sysc R8A779A0_PD_ALWAYS_ON>;
+			resets = <&cpg 1128>;
+			status = "disabled";
+		};
+
 		pfc: pinctrl@e6050000 {
 			compatible = "renesas,pfc-r8a779a0";
 			reg = <0 0xe6050000 0 0x16c>, <0 0xe6050800 0 0x16c>,
-- 
2.47.2


