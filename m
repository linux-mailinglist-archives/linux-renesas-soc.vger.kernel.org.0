Return-Path: <linux-renesas-soc+bounces-29366-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id OMwOAUs+tGlljgAAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-29366-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 13 Mar 2026 17:41:47 +0100
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 6F547287464
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 13 Mar 2026 17:41:46 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 536BD307FFFD
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 13 Mar 2026 16:40:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B6E533C871E;
	Fri, 13 Mar 2026 16:40:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b="RbLGuX7B";
	dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b="MvEnR20y"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mout-p-201.mailbox.org (mout-p-201.mailbox.org [80.241.56.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B5C573C6A4B;
	Fri, 13 Mar 2026 16:40:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=80.241.56.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773420042; cv=none; b=pncuhbC2jjz5JQRe3QjvLZggs+b++HDKde3487iWO9SDRE7qLIC1EKv9sd+T2s9JPqMdYD4u4+CiKuoscgrhZD04FuyL2NmC6FW28VIrMomrvKEMC2bGrWmbf6JWy838YYhccOhwMhMbyVz32AHs6ch4NbgRIi5vanIfpG3iRbQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773420042; c=relaxed/simple;
	bh=/AMNUFIo1DFcOA3pA19F6Zi57K446wDFP7i2duLvNII=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=qO+hhqpiYDWHaNzNOTFMn0GCZaRtYbuELWl1rP92jxLMkjQ8gZWBFlsFGULOkQYP+nITezHzih5dzLpNrRHT767oJENgjm6VWun8oyLbJ48BWwmYxwhGoqy0GvJrEDwda/cumZass5RyjmcQbn4kJwQl9yaUt7gbcjmS+28WrJc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mailbox.org; spf=pass smtp.mailfrom=mailbox.org; dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b=RbLGuX7B; dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b=MvEnR20y; arc=none smtp.client-ip=80.241.56.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mailbox.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mailbox.org
Received: from smtp1.mailbox.org (smtp1.mailbox.org [10.196.197.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mout-p-201.mailbox.org (Postfix) with ESMTPS id 4fXVbP0vhMz9tKQ;
	Fri, 13 Mar 2026 17:40:33 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org; s=mail20150812;
	t=1773420033;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Ioa4rs0AY+1xO/nDt/HduhJ3rE2814iMjAMBaaSwb7g=;
	b=RbLGuX7BJnbsX5Icu0ckNHxNJs0XlWZkRKBYM6SNG4dDks2Oeteg4J55QJv9vBi0VNZzqI
	KtlWi6Q3vQbYxIN1S4MBqpdxjt6dS6Z9iZJvggkdozmjlUD+FfCNZN3Wmj/Nwm7acblgVV
	2zwItSIHybFTN8BEygqHXbLdfNIuhtMjTvVfoLb9dhWPFSO8lF0DdbdGYwOfrEvz0Qc6pJ
	e9YjF6o4rat3CS1Eo1oQLV/xe32kwqPF++PFbj/5XOoXKUr0cawnMc3I1l8leTpO1UZq9O
	Ko0bUTEA+7XgIfH9aj8NhTKep+mVQxiz3qsFH4NlHd8/+C81xvky7X4vzRL9HQ==
From: Marek Vasut <marek.vasut+renesas@mailbox.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org; s=mail20150812;
	t=1773420031;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Ioa4rs0AY+1xO/nDt/HduhJ3rE2814iMjAMBaaSwb7g=;
	b=MvEnR20yinIH41rDIQIvHoU7pITpDfBLh7rBEB3kHX+ntujEh4g9viFv7552PlC2EEhnAP
	4zn0nSuHNYilG14KwobUIJjq3zz7oo6ao+EBxXkZJutzvHtfHze+rvSlb0gJKovT4G0Vs/
	pxgM+3Y5hxAWf1UuG+L7DGjZX6Yj8IPq5dQ/4IR6Zkf8QmnvG6J88f4mU41GnO/0n8PDI8
	1Ridx0EqBBh/70Bs6NTVM+FcWzCb8LWoXlzoztJ5NFV4hEzNIfWKb490bt+Kcs+XXARZYT
	LW8dCL5QuEWl7G/W0Ylpz5rDlykA370662ZxoeqbTV4F7sOYx6epDSWLJH10TQ==
To: linux-arm-kernel@lists.infradead.org
Cc: Marek Vasut <marek.vasut+renesas@mailbox.org>,
	Biju Das <biju.das.jz@bp.renesas.com>,
	Conor Dooley <conor+dt@kernel.org>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>,
	Magnus Damm <magnus.damm@gmail.com>,
	Rob Herring <robh@kernel.org>,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org
Subject: [PATCH 3/4] arm64: dts: renesas: Drop KSZ9131 PHY C22 compatible string
Date: Fri, 13 Mar 2026 17:39:05 +0100
Message-ID: <20260313164008.40933-4-marek.vasut+renesas@mailbox.org>
In-Reply-To: <20260313164008.40933-1-marek.vasut+renesas@mailbox.org>
References: <20260313164008.40933-1-marek.vasut+renesas@mailbox.org>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-MBO-RS-META: 8knds6w3qsktbd964geswkbkd65bjtph
X-MBO-RS-ID: f60970eea33126c8695
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[mailbox.org,reject];
	R_DKIM_ALLOW(-0.20)[mailbox.org:s=mail20150812];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCPT_COUNT_TWELVE(0.00)[12];
	FREEMAIL_CC(0.00)[mailbox.org,bp.renesas.com,kernel.org,glider.be,gmail.com,vger.kernel.org];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[bounces-29366-lists,linux-renesas-soc=lfdr.de,renesas];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[mailbox.org:+];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	MISSING_XM_UA(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[marek.vasut@mailbox.org,linux-renesas-soc@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_PROHIBIT(0.00)[0.0.0.12:email];
	MID_RHS_MATCH_FROM(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TO_DN_SOME(0.00)[];
	TAGGED_RCPT(0.00)[linux-renesas-soc,renesas,dt];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,0.0.0.0:email]
X-Rspamd-Queue-Id: 6F547287464
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Microchip KSZ9131 PHY schema indicates that compatible string
"ethernet-phy-id0022.1640" must not be followed by any other
compatible string. Drop trailing "ethernet-phy-ieee802.3-c22"
to match the schema.

Signed-off-by: Marek Vasut <marek.vasut+renesas@mailbox.org>
---
Cc: Biju Das <biju.das.jz@bp.renesas.com>
Cc: Conor Dooley <conor+dt@kernel.org>
Cc: Geert Uytterhoeven <geert+renesas@glider.be>
Cc: Krzysztof Kozlowski <krzk+dt@kernel.org>
Cc: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Cc: Magnus Damm <magnus.damm@gmail.com>
Cc: Rob Herring <robh@kernel.org>
Cc: devicetree@vger.kernel.org
Cc: linux-kernel@vger.kernel.org
Cc: linux-renesas-soc@vger.kernel.org
---
 arch/arm64/boot/dts/renesas/beacon-renesom-som.dtsi    | 3 +--
 arch/arm64/boot/dts/renesas/r9a09g056n48-rzv2n-evk.dts | 4 ++--
 arch/arm64/boot/dts/renesas/r9a09g057h44-rzv2h-evk.dts | 4 ++--
 arch/arm64/boot/dts/renesas/rzg2l-smarc-som.dtsi       | 6 ++----
 arch/arm64/boot/dts/renesas/rzg2lc-smarc-som.dtsi      | 3 +--
 arch/arm64/boot/dts/renesas/rzg2ul-smarc-som.dtsi      | 6 ++----
 arch/arm64/boot/dts/renesas/rzg3e-smarc-som.dtsi       | 6 ++----
 7 files changed, 12 insertions(+), 20 deletions(-)

diff --git a/arch/arm64/boot/dts/renesas/beacon-renesom-som.dtsi b/arch/arm64/boot/dts/renesas/beacon-renesom-som.dtsi
index af6d15f90c65f..f8442b6a85a75 100644
--- a/arch/arm64/boot/dts/renesas/beacon-renesom-som.dtsi
+++ b/arch/arm64/boot/dts/renesas/beacon-renesom-som.dtsi
@@ -59,8 +59,7 @@ &avb {
 	status = "okay";
 
 	phy0: ethernet-phy@0 {
-		compatible = "ethernet-phy-id0022.1640",
-			     "ethernet-phy-ieee802.3-c22";
+		compatible = "ethernet-phy-id0022.1640";
 		reg = <0>;
 		interrupts-extended = <&gpio2 11 IRQ_TYPE_LEVEL_LOW>;
 		reset-gpios = <&gpio2 10 GPIO_ACTIVE_LOW>;
diff --git a/arch/arm64/boot/dts/renesas/r9a09g056n48-rzv2n-evk.dts b/arch/arm64/boot/dts/renesas/r9a09g056n48-rzv2n-evk.dts
index c191ecb397135..dd5e4b13f0f86 100644
--- a/arch/arm64/boot/dts/renesas/r9a09g056n48-rzv2n-evk.dts
+++ b/arch/arm64/boot/dts/renesas/r9a09g056n48-rzv2n-evk.dts
@@ -260,7 +260,7 @@ raa215300: pmic@12 {
 
 &mdio0 {
 	phy0: ethernet-phy@0 {
-		compatible = "ethernet-phy-id0022.1640", "ethernet-phy-ieee802.3-c22";
+		compatible = "ethernet-phy-id0022.1640";
 		reg = <0>;
 		rxc-skew-psec = <0>;
 		txc-skew-psec = <0>;
@@ -279,7 +279,7 @@ phy0: ethernet-phy@0 {
 
 &mdio1 {
 	phy1: ethernet-phy@1 {
-		compatible = "ethernet-phy-id0022.1640", "ethernet-phy-ieee802.3-c22";
+		compatible = "ethernet-phy-id0022.1640";
 		reg = <0>;
 		rxc-skew-psec = <0>;
 		txc-skew-psec = <0>;
diff --git a/arch/arm64/boot/dts/renesas/r9a09g057h44-rzv2h-evk.dts b/arch/arm64/boot/dts/renesas/r9a09g057h44-rzv2h-evk.dts
index dc4577ebf2e95..8ae7b6e3d712e 100644
--- a/arch/arm64/boot/dts/renesas/r9a09g057h44-rzv2h-evk.dts
+++ b/arch/arm64/boot/dts/renesas/r9a09g057h44-rzv2h-evk.dts
@@ -281,7 +281,7 @@ raa215300: pmic@12 {
 
 &mdio0 {
 	phy0: ethernet-phy@0 {
-		compatible = "ethernet-phy-id0022.1640", "ethernet-phy-ieee802.3-c22";
+		compatible = "ethernet-phy-id0022.1640";
 		reg = <0>;
 		rxc-skew-psec = <0>;
 		txc-skew-psec = <0>;
@@ -300,7 +300,7 @@ phy0: ethernet-phy@0 {
 
 &mdio1 {
 	phy1: ethernet-phy@1 {
-		compatible = "ethernet-phy-id0022.1640", "ethernet-phy-ieee802.3-c22";
+		compatible = "ethernet-phy-id0022.1640";
 		reg = <0>;
 		rxc-skew-psec = <0>;
 		txc-skew-psec = <0>;
diff --git a/arch/arm64/boot/dts/renesas/rzg2l-smarc-som.dtsi b/arch/arm64/boot/dts/renesas/rzg2l-smarc-som.dtsi
index d511e152d7c6c..7eccdaffb221f 100644
--- a/arch/arm64/boot/dts/renesas/rzg2l-smarc-som.dtsi
+++ b/arch/arm64/boot/dts/renesas/rzg2l-smarc-som.dtsi
@@ -99,8 +99,7 @@ &eth0 {
 	status = "okay";
 
 	phy0: ethernet-phy@7 {
-		compatible = "ethernet-phy-id0022.1640",
-			     "ethernet-phy-ieee802.3-c22";
+		compatible = "ethernet-phy-id0022.1640";
 		reg = <7>;
 		interrupts-extended = <&irqc RZG2L_IRQ2 IRQ_TYPE_LEVEL_LOW>;
 		rxc-skew-psec = <2400>;
@@ -126,8 +125,7 @@ &eth1 {
 	status = "okay";
 
 	phy1: ethernet-phy@7 {
-		compatible = "ethernet-phy-id0022.1640",
-			     "ethernet-phy-ieee802.3-c22";
+		compatible = "ethernet-phy-id0022.1640";
 		reg = <7>;
 		interrupts-extended = <&irqc RZG2L_IRQ3 IRQ_TYPE_LEVEL_LOW>;
 		rxc-skew-psec = <2400>;
diff --git a/arch/arm64/boot/dts/renesas/rzg2lc-smarc-som.dtsi b/arch/arm64/boot/dts/renesas/rzg2lc-smarc-som.dtsi
index 3e8909a872e33..15f2e9eaaf0b6 100644
--- a/arch/arm64/boot/dts/renesas/rzg2lc-smarc-som.dtsi
+++ b/arch/arm64/boot/dts/renesas/rzg2lc-smarc-som.dtsi
@@ -79,8 +79,7 @@ &eth0 {
 	status = "okay";
 
 	phy0: ethernet-phy@7 {
-		compatible = "ethernet-phy-id0022.1640",
-			     "ethernet-phy-ieee802.3-c22";
+		compatible = "ethernet-phy-id0022.1640";
 		reg = <7>;
 		interrupts-extended = <&irqc RZG2L_IRQ0 IRQ_TYPE_LEVEL_LOW>;
 		rxc-skew-psec = <2400>;
diff --git a/arch/arm64/boot/dts/renesas/rzg2ul-smarc-som.dtsi b/arch/arm64/boot/dts/renesas/rzg2ul-smarc-som.dtsi
index cd4275d86935b..0f917d7c99398 100644
--- a/arch/arm64/boot/dts/renesas/rzg2ul-smarc-som.dtsi
+++ b/arch/arm64/boot/dts/renesas/rzg2ul-smarc-som.dtsi
@@ -75,8 +75,7 @@ &eth0 {
 	status = "okay";
 
 	phy0: ethernet-phy@7 {
-		compatible = "ethernet-phy-id0022.1640",
-			     "ethernet-phy-ieee802.3-c22";
+		compatible = "ethernet-phy-id0022.1640";
 		reg = <7>;
 		interrupts-extended = <&irqc RZG2L_IRQ2 IRQ_TYPE_LEVEL_LOW>;
 		rxc-skew-psec = <2400>;
@@ -103,8 +102,7 @@ &eth1 {
 	status = "okay";
 
 	phy1: ethernet-phy@7 {
-		compatible = "ethernet-phy-id0022.1640",
-			     "ethernet-phy-ieee802.3-c22";
+		compatible = "ethernet-phy-id0022.1640";
 		reg = <7>;
 		interrupts-extended = <&irqc RZG2L_IRQ7 IRQ_TYPE_LEVEL_LOW>;
 		rxc-skew-psec = <2400>;
diff --git a/arch/arm64/boot/dts/renesas/rzg3e-smarc-som.dtsi b/arch/arm64/boot/dts/renesas/rzg3e-smarc-som.dtsi
index 3b571c0967522..cb5066443722c 100644
--- a/arch/arm64/boot/dts/renesas/rzg3e-smarc-som.dtsi
+++ b/arch/arm64/boot/dts/renesas/rzg3e-smarc-som.dtsi
@@ -136,8 +136,7 @@ &i3c {
 
 &mdio0 {
 	phy0: ethernet-phy@7 {
-		compatible = "ethernet-phy-id0022.1640",
-			     "ethernet-phy-ieee802.3-c22";
+		compatible = "ethernet-phy-id0022.1640";
 		reg = <7>;
 		interrupts-extended = <&icu 3 IRQ_TYPE_LEVEL_LOW>;
 		rxc-skew-psec = <1400>;
@@ -157,8 +156,7 @@ phy0: ethernet-phy@7 {
 
 &mdio1 {
 	phy1: ethernet-phy@7 {
-		compatible = "ethernet-phy-id0022.1640",
-			     "ethernet-phy-ieee802.3-c22";
+		compatible = "ethernet-phy-id0022.1640";
 		reg = <7>;
 		interrupts-extended = <&icu 16 IRQ_TYPE_LEVEL_LOW>;
 		rxc-skew-psec = <1400>;
-- 
2.51.0


