Return-Path: <linux-renesas-soc+bounces-32080-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id wBz7EzTo+WmdFAMAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-32080-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 05 May 2026 14:53:08 +0200
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id 555944CDF89
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 05 May 2026 14:53:06 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 75AC33032A12
	for <lists+linux-renesas-soc@lfdr.de>; Tue,  5 May 2026 12:38:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EAD5E478E2B;
	Tue,  5 May 2026 12:37:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="IHvTBlcH"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-wr1-f45.google.com (mail-wr1-f45.google.com [209.85.221.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3BBB247279F
	for <linux-renesas-soc@vger.kernel.org>; Tue,  5 May 2026 12:37:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777984638; cv=none; b=jwev1zxfuVZTxnDwouPOnRaLY1A5684qOrqLgjwDeKrH7IDGwj9grmJkyG3ew+nGDiZPkSlxOreQFoVQeB6v7yFgB5W9p2eFI8QxoVMXlPJRyV+YMg5mauMiuHmDx1zC0MlhddqEM8LOkoWbymol+3Au2vmKDU3DLQKhbLRi6mM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777984638; c=relaxed/simple;
	bh=E7JDCwHJgVaFL1A44K4ePqolMC8wjNE4dhRVxypVutY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=H1/d2ivDBezC8t/Sw/gB2Hp4OSgwxxCL2eDmzFpRoREjOPR3+vx9rJ3SUiyfkNLveuGFpif8EeXtloNB+2pa0G/F8lBV0YR7AhMXX0yMvWdHRMyze5m274nYzWp/vaD/9E8pC3yEw3hQVcq1zC3/6VsbbfPQLRa0A+wq3yPM9uU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=IHvTBlcH; arc=none smtp.client-ip=209.85.221.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wr1-f45.google.com with SMTP id ffacd0b85a97d-44b330c5cc6so2336569f8f.1
        for <linux-renesas-soc@vger.kernel.org>; Tue, 05 May 2026 05:37:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1777984635; x=1778589435; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=32ZCzWFkzCwQPUS0qlHqnLdTw8nu/0VnY/TwVeNGcz8=;
        b=IHvTBlcH9TpNBnrsgSPJtP2ZC/awjX3uNd3DkuMyWme9/EK38vGLRReVE15QN6WhFv
         0q0sK/n0v1gAHSTX0x/RxSDGCCEDYVXsHoY0fYucKcmDA8J4N0zQElH1hsH8nPy/JRO5
         vXiijxFC5yyuMr9uWVmaEUO+43fGLT6CZzxY71jUdYajngh6tFcVmyOk7su1uQ3wFy4W
         8CN/BczTJSo7Rx7IQXGEFX6FvwOLeKgaNYrlEb+KomVcWPAiIBWfZwO+Pjr8TqC0Rjr+
         AXZn9wf71XT0J3RtZI0jYdECo6El2/ChJhXg+4zExj/ezZdVmcuqeHAAOZTbSQLeB/KI
         n43w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777984635; x=1778589435;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=32ZCzWFkzCwQPUS0qlHqnLdTw8nu/0VnY/TwVeNGcz8=;
        b=VjUltrborXrMbnZY6F6z1wJKwL/BleLSxcfyINqi59ygHPY04ZwEe24+3mnoEIIGIH
         veVWg5aH4ECbADLVF8FDytc8osmaIOuxGocYGVQGC7GhsDtIJlV/4EOb00nAodmsdYOE
         +4TWM0dsITo1g3/Xa0QAIEdvxXz73FVwMnjGsNTirLcXFJJeE/p6GXMqwV/mTgq98txf
         4ZMQa05Fa4AAsJDc6rp9o6MVBqhRXkKNGvUIqxkREBSNM26g5ZocrgKcRlmZsajyjHsz
         D4rIkrEV8fFmdTbjWH55LwJV/xSC4CG/isi+LeSzBgDuYB+Lf5JExkrQ3dQF+UTr3QX1
         gUXA==
X-Forwarded-Encrypted: i=1; AFNElJ8vEZR+k31XTgnfun5FPQd5WN222Cikm0fswQOoU/OtiwOC0XVqIj08Py98bQOCO3Uwxy3fl49gKOz618JKGTPnqQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YyRHe1Q/syBq1Un49jEo1IumYgQVv2tF6ohuoQ4WEAtk4gSciCf
	LNbYCdvDjTAO5pBFIsZSu1ySbyR/9lvNOc/46w+5e1hamvLc19omlPL5
X-Gm-Gg: AeBDieue8XYo8TTp5JScP80VthZrTJDEzfQW26RXxT4Ef7lNRDOU5ctQ0Pv2LfU1bh1
	b7RQIqioJUFBHCabhEbN61IKFE5MlndIf1vM/Di0oQUJNu+/iu/ENxADJoqCLsTbTzSmI4K99pt
	J7uHbAnKNrx/n7rx+yTiAze7YTzMDTaeCZMMf87TdV4J2p2a/Wk2i4RuqWVYGyG4JxjGhmS6Sc/
	0/YboB0bv0dEcxwo1bu7p3CVHNmmjHcrFRPKz+bwzJ7ZamNZ3aEWeIbBGphv+XXIiwrESerbFOE
	IBzvzhkAbdhdYyedX1gFKlRCb5XnNpc4zVt2CAjximhERaOOm72bzXNRU88Wzk/rfsYkiNc7hye
	9J+XrtemTfvsT4N8HuzRl5ijxltqd6iNfWpKKmD+yJKGhgNHrkOZjbeMJLyU6BrNU4FIV3P9N4T
	hB8d66VySMM+CUJMUsC8AMzsnhkoKUaZWU2YMddmV1EwDDMKArVZ/DSGGRw2w=
X-Received: by 2002:adf:fe8d:0:b0:44b:dd6a:2c80 with SMTP id ffacd0b85a97d-44bdd796f29mr14779940f8f.2.1777984635192;
        Tue, 05 May 2026 05:37:15 -0700 (PDT)
Received: from localhost.localdomain ([2a00:23c4:a758:8a01:1da3:f63c:84a5:197e])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-45055960902sm4703780f8f.28.2026.05.05.05.37.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 05 May 2026 05:37:14 -0700 (PDT)
From: Biju <biju.das.au@gmail.com>
X-Google-Original-From: Biju <biju.das.jz@bp.renesas.com>
To: Geert Uytterhoeven <geert+renesas@glider.be>,
	Magnus Damm <magnus.damm@gmail.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>
Cc: Biju Das <biju.das.jz@bp.renesas.com>,
	linux-renesas-soc@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>,
	Biju Das <biju.das.au@gmail.com>
Subject: [PATCH 4/5] arm64: dts: renesas: rzg3l-smarc-som: Enable versa clock generator
Date: Tue,  5 May 2026 13:37:02 +0100
Message-ID: <20260505123708.134069-5-biju.das.jz@bp.renesas.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260505123708.134069-1-biju.das.jz@bp.renesas.com>
References: <20260505123708.134069-1-biju.das.jz@bp.renesas.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Queue-Id: 555944CDF89
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_MISSING_CHARSET(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-32080-lists,linux-renesas-soc=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_CC(0.00)[bp.renesas.com,vger.kernel.org,gmail.com];
	FREEMAIL_TO(0.00)[glider.be,gmail.com,kernel.org];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[bijudasau@gmail.com,linux-renesas-soc@vger.kernel.org];
	RCPT_COUNT_SEVEN(0.00)[11];
	NEURAL_HAM(-0.00)[-0.999];
	RCVD_COUNT_FIVE(0.00)[5];
	DKIM_TRACE(0.00)[gmail.com:+];
	TAGGED_RCPT(0.00)[linux-renesas-soc,renesas,dt];
	FREEMAIL_FROM(0.00)[gmail.com];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[renesas.com:email,2.220.108.0:email,sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns,bp.renesas.com:mid,0.0.0.68:email]

From: Biju Das <biju.das.jz@bp.renesas.com>

The RZ/G3L SMARC SoM has versa 5P35023B clock generator to generate the
below clocks:
  se1: AUDIO_MCK (11.2896 or 12.2880 MHz)
  se2: RZ_AUDIO_CLK_B (11.2896 MHz)
  se3: RZ_AUDIO_CLK_C (12.2880 MHz)
  diff{1,1B}: ET{0,1}_PHY_CLK (25 MHz)
  diff2{2,2B}: Not connected
  ref: Not connected

Enable versa 5P35023B clock generator on the RZ/G3L SoM DTSI.

Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
---
 .../boot/dts/renesas/rzg3l-smarc-som.dtsi     | 20 +++++++++++++++++++
 1 file changed, 20 insertions(+)

diff --git a/arch/arm64/boot/dts/renesas/rzg3l-smarc-som.dtsi b/arch/arm64/boot/dts/renesas/rzg3l-smarc-som.dtsi
index fb868ea99b7f..419a0e1584bc 100644
--- a/arch/arm64/boot/dts/renesas/rzg3l-smarc-som.dtsi
+++ b/arch/arm64/boot/dts/renesas/rzg3l-smarc-som.dtsi
@@ -40,6 +40,12 @@ memory@48000000 {
 		/* First 128MiB is reserved for secure area. */
 		reg = <0x0 0x48000000 0x0 0x78000000>;
 	};
+
+	x2_clk: x2-clock {
+		compatible = "fixed-clock";
+		#clock-cells = <0>;
+		clock-frequency = <24000000>;
+	};
 };
 
 &eth0 {
@@ -75,6 +81,20 @@ &extal_clk {
 &i2c0 {
 	pinctrl-0 = <&i2c0_pins>;
 	pinctrl-names = "default";
+
+	versa3: clock-generator@68 {
+		compatible = "renesas,5p35023";
+		reg = <0x68>;
+		#clock-cells = <1>;
+		clocks = <&x2_clk>;
+
+		assigned-clocks = <&versa3 0>, <&versa3 1>,
+				  <&versa3 2>, <&versa3 3>,
+				  <&versa3 4>, <&versa3 5>;
+		assigned-clock-rates = <24000000>, <12288000>,
+				       <11289600>, <12288000>,
+				       <25000000>, <25000000>;
+	};
 };
 
 &mdio0 {
-- 
2.43.0


