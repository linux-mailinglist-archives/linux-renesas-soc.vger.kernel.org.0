Return-Path: <linux-renesas-soc+bounces-31867-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id aNqHCLSF9GlmCAIAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-31867-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 01 May 2026 12:51:32 +0200
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 981CE4ABC20
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 01 May 2026 12:51:31 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 655B4301F147
	for <lists+linux-renesas-soc@lfdr.de>; Fri,  1 May 2026 10:51:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B8392382F35;
	Fri,  1 May 2026 10:51:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="SypkS0Kx"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 492E33932DE
	for <linux-renesas-soc@vger.kernel.org>; Fri,  1 May 2026 10:51:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777632687; cv=none; b=EYXFpFOjfIP5PsJQx4FSg9JE61TBYjJvTMEAaV5RrRDK2NJT0pKCGuzvjZKDTZVLWIcPjFTNyNsc1339iGizmSo8cvS1gU2SgDUYP57XEXeMAYClktTTfF/1wcjvg38Rtykc3xJkC5K5BRB2pTj+4qzhn2RAa896e3TIDFfWhNA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777632687; c=relaxed/simple;
	bh=YZIfv/xYMSLx8rfHDitsoPPWFI2+0SnNLOTeX3UVhcU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=F1pkc0nZ70PFfHdMu/Y5ZUscL51220fZ8buVjSF3260pr2RS3SStAGMfbrdD3AJPBywzDi8Plfdf9sieHMZYYWvz48Y5WpKpM9k/VEZol2oZ3K2mxx/EemJRK+cFSufwNCwkdq6wObHvlbDZHxwremoMXiRBZXdbyxLMedOmNHk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=SypkS0Kx; arc=none smtp.client-ip=209.85.128.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-488a14c31eeso13245565e9.0
        for <linux-renesas-soc@vger.kernel.org>; Fri, 01 May 2026 03:51:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1777632685; x=1778237485; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=bCDFZE6fV1aNg2yGAdNEgFgwQukxcDX+8Md/YoFmfdo=;
        b=SypkS0Kxn3dkyHxYjls0/n0gPkNlXGJiBfPmMApcEH2UkiS0rUOFKFqB4AX9nD3K+I
         4EDdY0oX4Fe4EWP5xiWaUyZq5Z969MAE6io2sbTdpCo24kmzgxYM/yVJMGci16ZjtmAq
         B0kY6Ycs1zdU7bLD59EU0hfqT14gMO7qeVGbrRXcbt0iUGU1yWGQoMNmNot2M423baNT
         Ie7XxPgC/mZDXsaZ8SA6TUEJsmyutbbrz2I8pytKb2K4ao//IU8UJ9kDPi6PGHcILiyG
         40IfGYfSKg4MxNgozKf3gpEVsHTOY2x6rJFNwt3gSAgjGg9mSnoDIJt4Y24wv0BPef8c
         aG4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777632685; x=1778237485;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=bCDFZE6fV1aNg2yGAdNEgFgwQukxcDX+8Md/YoFmfdo=;
        b=eso2aF/iO7hIMU0P6VtI674ZWtwfkCsTVXWctWtTodpllC/wlS51HtguVTY2tHNXX/
         4pLW7DaxaQ6m71+mPJvs+Z11e0BQtFx97DVUtA/eDw1pHQT1fG8Bl/CUZJUuo3kILyWK
         /cRthVVwzZZlpDTaI6R0WZAGKfEZHg/U8XWb2hBPEVOuTdxfRS/TKVVuYWWE6vxULZY3
         qjaYlROaqlhI8zKjOhMcCizt5bSOyUQCsXV3ogE8fHF/EDz2AJXFdrJzRKyVkEoB8+yn
         lnw5iPo8Al9S8fjR0SjzqJC2wbyDdKP6JhnT/ffKVyDXhhSAQPuEsOA8/uFfPuu/+occ
         CCYA==
X-Gm-Message-State: AOJu0YxKgT/3RrcFwsXHCJfQJ94KLDx/6sN8ksR5fSBJ5WqYKtQ4TUJJ
	al9a/+iiV5DwMBP9aD1h9fTS8fe3LVo6rYQOM7uBsP/0E7Oo/+i2ID0L
X-Gm-Gg: AeBDietKGqu1dLCVv7ERCznU1vGmTGyoA5w9Hlf7jVnel3Dic2mZnkjSUw2c3pgas2R
	HMisKBdqGCNaOeAZJHUTHuQb1UFZM0CbcaNFtNtG0/hasxHSs2DkMGIwBkONv7JgFJqufqE4XjS
	T5/eibetbAElc+fw+7YL1bPZ6b/GZtxx9d/tJMFcZmDXk4hfcKk7gdYJj8IpYNQPsS/YnKBvhZR
	MBTjjwBKcMOvIvDaSPDSZIqwzQF6qbIziNdAdF5QYWOcmDJbiZ1sHfGFLE8QN4AhignW9NHCYFg
	RAJlQ7SmYqYo2JWa5m/fSDPDFeuFW97sPofXKGXz0wjcSIYiDP8Del/PyVZoUIjsvlJrj9IJ04A
	0bfOvawA0eAf9aa8uPGZ2rG/7J5YD6udqf8ND/Zhgt3pZnNtj4Fn+zP3a7VaNXQaVd9VQSnzEW8
	2xwRkHELbmcwA3Ec1mekeYgPDvu/8vIAdJg2wBlTEGpKxdVF4PR/WaV/uHRdvkI41GB9IW+ZKy5
	CiZ0DdTL3n30JPYVld7YGqlKAid68GFtTjy5y9kc/plQEc=
X-Received: by 2002:a05:600c:8b22:b0:486:fb0b:ad79 with SMTP id 5b1f17b1804b1-48a84524e1dmr110237815e9.20.1777632684583;
        Fri, 01 May 2026 03:51:24 -0700 (PDT)
Received: from iku.Home ([2a06:5906:61b:2d00:1220:5ff:c603:f3ad])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48a81b99127sm122313805e9.0.2026.05.01.03.51.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 01 May 2026 03:51:23 -0700 (PDT)
From: Prabhakar <prabhakar.csengg@gmail.com>
X-Google-Original-From: Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
To: Geert Uytterhoeven <geert+renesas@glider.be>,
	Magnus Damm <magnus.damm@gmail.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>
Cc: linux-renesas-soc@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Prabhakar <prabhakar.csengg@gmail.com>,
	Biju Das <biju.das.jz@bp.renesas.com>,
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: [PATCH 2/2] arm64: dts: renesas: r9a09g056n48-rzv2n-evk: Enable PCIe
Date: Fri,  1 May 2026 11:51:16 +0100
Message-ID: <20260501105116.33452-3-prabhakar.mahadev-lad.rj@bp.renesas.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260501105116.33452-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
References: <20260501105116.33452-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Queue-Id: 981CE4ABC20
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-31867-lists,linux-renesas-soc=lfdr.de];
	FREEMAIL_FROM(0.00)[gmail.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_TO(0.00)[glider.be,gmail.com,kernel.org];
	RCPT_COUNT_TWELVE(0.00)[12];
	FREEMAIL_CC(0.00)[vger.kernel.org,gmail.com,bp.renesas.com,renesas.com];
	MIME_TRACE(0.00)[0:+];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[prabhakarcsengg@gmail.com,linux-renesas-soc@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[gmail.com:+];
	RCVD_COUNT_FIVE(0.00)[5];
	TAGGED_RCPT(0.00)[linux-renesas-soc,renesas,dt];
	NEURAL_HAM(-0.00)[-1.000];
	TO_DN_SOME(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[renesas.com:email,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,2.220.108.0:email]

From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>

Enable the PCIE1 slot available on the RZ/V2N EVK.

Note, the PCIE_REFCLK comes from 5L35023B versa clock generator, once the
support for this clock generator is added, the fixed clock node can be
removed and can be replaced with a reference to the clock generator.

Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
---
 .../dts/renesas/r9a09g056n48-rzv2n-evk.dts    | 23 +++++++++++++++++++
 1 file changed, 23 insertions(+)

diff --git a/arch/arm64/boot/dts/renesas/r9a09g056n48-rzv2n-evk.dts b/arch/arm64/boot/dts/renesas/r9a09g056n48-rzv2n-evk.dts
index 00e5455ea5ab..43ffde419d91 100644
--- a/arch/arm64/boot/dts/renesas/r9a09g056n48-rzv2n-evk.dts
+++ b/arch/arm64/boot/dts/renesas/r9a09g056n48-rzv2n-evk.dts
@@ -63,6 +63,12 @@ memory@48000000 {
 		reg = <0x0 0x48000000 0x1 0xf8000000>;
 	};
 
+	pcie_refclk: clock-pcie-ref {
+		compatible = "fixed-clock";
+		#clock-cells = <0>;
+		clock-frequency = <100000000>;
+	};
+
 	reg_0p8v: regulator-0p8v {
 		compatible = "regulator-fixed";
 		regulator-name = "fixed-0.8V";
@@ -333,6 +339,17 @@ &ostm7 {
 	status = "okay";
 };
 
+&pcie {
+	pinctrl-0 = <&pcie_pins>;
+	pinctrl-names = "default";
+	status = "okay";
+};
+
+&pcie_port0 {
+	clocks = <&pcie_refclk>;
+	clock-names = "ref";
+};
+
 &pinctrl {
 	eth0_pins: eth0 {
 		pins = "ET0_TXC_TXCLK";
@@ -383,6 +400,12 @@ i2c8_pins: i2c8 {
 			 <RZV2N_PORT_PINMUX(0, 7, 1)>; /* I2C8_SCL */
 	};
 
+	pcie_pins: pcie {
+		pins = "PCIE0_RSTOUTB";
+		slew-rate = <0>;
+		renesas,output-impedance = <2>;
+	};
+
 	scif_pins: scif {
 		pins = "SCIF_TXD", "SCIF_RXD";
 		renesas,output-impedance = <1>;
-- 
2.54.0


