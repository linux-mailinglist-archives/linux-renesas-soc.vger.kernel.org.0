Return-Path: <linux-renesas-soc+bounces-30303-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 8ORtF2S8xGk23AQAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-30303-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 26 Mar 2026 05:56:04 +0100
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id BE01E32F2B8
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 26 Mar 2026 05:56:03 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id D4DD83019B9F
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 26 Mar 2026 04:55:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5B09333507E;
	Thu, 26 Mar 2026 04:55:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b="rpUdAddi";
	dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b="wmev7xDR"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mout-p-101.mailbox.org (mout-p-101.mailbox.org [80.241.56.151])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3408F332604;
	Thu, 26 Mar 2026 04:55:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=80.241.56.151
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774500935; cv=none; b=BT43oEIM/SI6QTK4l92x+Krse/CctLSi58ZGplLDPg5X6AaPodtnYJpcmlh3M63C/k2zeUy6lDIpm52i2XPJfZu+cyX+SoPtVmHsvTLNrCFJEt36wuQtC87eL6+FfB9dqnCjaVDn5oCpGn/X8JSWSu/OJQvqRKjYkC6VaNX5+Sw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774500935; c=relaxed/simple;
	bh=0decYhza54LqnF0Tiw6Lz7z+WIfCD+o4FERq8NSv0T0=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=ksUKfcf71vsmjtIKg++Xqm75dAdSmeKibBexVTOh1Of2MvTCe4gSnucnasKLQ0U+jBPrnUxCl6hhdix4cD2TChbhLSJWRFHqm6T+Rjl2PoybyUL6f3pxBq2qhHMH0k86G9hVJs3As3T3oZHlGVbhpFFwKjSs89R+Aiw5DWQQXLs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mailbox.org; spf=pass smtp.mailfrom=mailbox.org; dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b=rpUdAddi; dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b=wmev7xDR; arc=none smtp.client-ip=80.241.56.151
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mailbox.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mailbox.org
Received: from smtp1.mailbox.org (smtp1.mailbox.org [IPv6:2001:67c:2050:b231:465::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mout-p-101.mailbox.org (Postfix) with ESMTPS id 4fhBKt1sLKz9tK8;
	Thu, 26 Mar 2026 05:55:30 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org; s=mail20150812;
	t=1774500930;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=ap1YbZX/yQWRBqsIyNu0uhaKay3h24DGIo1KCXMJJdI=;
	b=rpUdAddiB2SKM0+nCCfC0zqDcCY00A6vp06BgSvyzMpIrcWVe46UENK3fisagb1ekYyEmO
	3O4oswoKfqm3tnRx/GIgL/tw01mzuT1Bf9piHjvlFtVcEjtpsdOdjXQG7QTIB6Gu9rIiQb
	P4Pwc3TwOoaY9neF65N/CbOyba6reH9hoOp9oRBShH35hSKeWwAboi963CXeWzgFOirfyE
	IfI82ieOcgc8D0GycWqRyQganzEweMVa1YyIMejyPXFNR9qvbspieuGyKEBZ5mr8LlpiJZ
	6gU6VvCbG9sBMmawrnvEq6VxEohNTXm/W9sb/es7kREMjfEET3Vuvepw+qn+Rg==
Authentication-Results: outgoing_mbo_mout;
	dkim=pass header.d=mailbox.org header.s=mail20150812 header.b=wmev7xDR;
	spf=pass (outgoing_mbo_mout: domain of marek.vasut+renesas@mailbox.org designates 2001:67c:2050:b231:465::1 as permitted sender) smtp.mailfrom=marek.vasut+renesas@mailbox.org
From: Marek Vasut <marek.vasut+renesas@mailbox.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org; s=mail20150812;
	t=1774500928;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=ap1YbZX/yQWRBqsIyNu0uhaKay3h24DGIo1KCXMJJdI=;
	b=wmev7xDR8qN4VqrCDOlqwgqP/AC/fXR36IzzV+o3VfAGsIVyeuK5z34EsoDyoN01vSRw2t
	5SG31D8KZvRuEkOAynIfsQaWPdCHI5Aug6+PZ3fctOvGYfCXhfNgp1cFz5EjQ4gOWQjyt2
	k9GDWa1b61lv1stODCgWtxq9kvr2QGKlmrKRFiUZ01DQEt0GlZZrNrGWuPT2yZbuH06Pbr
	yxlM26T21AqHI+k01rPpNhPbmN80+W4c2oc999tZSBJW+Esh5ux3MZzTufuo0y5kWrJ7N+
	EHwzYZwkZftfhYhxTXBcjbC+GdbJhY2dpEWxJQfYXhbtspmiz1ULIyVN3BCx3w==
To: linux-arm-kernel@lists.infradead.org
Cc: Marek Vasut <marek.vasut+renesas@mailbox.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Magnus Damm <magnus.damm@gmail.com>,
	Rob Herring <robh@kernel.org>,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org
Subject: [PATCH] ARM: dts: renesas: Drop KSZ8041 PHY C22 compatible string
Date: Thu, 26 Mar 2026 05:54:59 +0100
Message-ID: <20260326045523.223620-1-marek.vasut+renesas@mailbox.org>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-MBO-RS-ID: c62c4ab2119fbda3824
X-MBO-RS-META: sx6tszgz3bzkhb8nkh5iswj1iwne7en5
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[mailbox.org,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[mailbox.org:s=mail20150812];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_CC(0.00)[mailbox.org,kernel.org,glider.be,gmail.com,vger.kernel.org];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-30303-lists,linux-renesas-soc=lfdr.de,renesas];
	DKIM_TRACE(0.00)[mailbox.org:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[marek.vasut@mailbox.org,linux-renesas-soc@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	MISSING_XM_UA(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[10];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linux-renesas-soc,renesas,dt];
	DBL_BLOCKED_OPENRESOLVER(0.00)[glider.be:email,mailbox.org:dkim,mailbox.org:email,mailbox.org:mid,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,0.0.0.1:email]
X-Rspamd-Queue-Id: BE01E32F2B8
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Microchip KSZ8041 PHY schema indicates that compatible string
"ethernet-phy-id0022.1537" must not be followed by any other
compatible string. Drop trailing "ethernet-phy-ieee802.3-c22"
to match the schema.

Signed-off-by: Marek Vasut <marek.vasut+renesas@mailbox.org>
---
Cc: Conor Dooley <conor+dt@kernel.org>
Cc: Geert Uytterhoeven <geert+renesas@glider.be>
Cc: Krzysztof Kozlowski <krzk+dt@kernel.org>
Cc: Magnus Damm <magnus.damm@gmail.com>
Cc: Rob Herring <robh@kernel.org>
Cc: devicetree@vger.kernel.org
Cc: linux-kernel@vger.kernel.org
Cc: linux-renesas-soc@vger.kernel.org
---
 arch/arm/boot/dts/renesas/r8a7743-sk-rzg1m.dts | 3 +--
 arch/arm/boot/dts/renesas/r8a7745-sk-rzg1e.dts | 3 +--
 arch/arm/boot/dts/renesas/r8a7790-lager.dts    | 3 +--
 arch/arm/boot/dts/renesas/r8a7790-stout.dts    | 3 +--
 arch/arm/boot/dts/renesas/r8a7791-koelsch.dts  | 3 +--
 arch/arm/boot/dts/renesas/r8a7791-porter.dts   | 3 +--
 arch/arm/boot/dts/renesas/r8a7793-gose.dts     | 3 +--
 arch/arm/boot/dts/renesas/r8a7794-alt.dts      | 3 +--
 arch/arm/boot/dts/renesas/r8a7794-silk.dts     | 3 +--
 9 files changed, 9 insertions(+), 18 deletions(-)

diff --git a/arch/arm/boot/dts/renesas/r8a7743-sk-rzg1m.dts b/arch/arm/boot/dts/renesas/r8a7743-sk-rzg1m.dts
index 9b16fe7ce713c..60217797e5345 100644
--- a/arch/arm/boot/dts/renesas/r8a7743-sk-rzg1m.dts
+++ b/arch/arm/boot/dts/renesas/r8a7743-sk-rzg1m.dts
@@ -70,8 +70,7 @@ &ether {
 	status = "okay";
 
 	phy1: ethernet-phy@1 {
-		compatible = "ethernet-phy-id0022.1537",
-			     "ethernet-phy-ieee802.3-c22";
+		compatible = "ethernet-phy-id0022.1537";
 		reg = <1>;
 		interrupts-extended = <&irqc 0 IRQ_TYPE_LEVEL_LOW>;
 		micrel,led-mode = <1>;
diff --git a/arch/arm/boot/dts/renesas/r8a7745-sk-rzg1e.dts b/arch/arm/boot/dts/renesas/r8a7745-sk-rzg1e.dts
index 571615a506207..42e82f0697553 100644
--- a/arch/arm/boot/dts/renesas/r8a7745-sk-rzg1e.dts
+++ b/arch/arm/boot/dts/renesas/r8a7745-sk-rzg1e.dts
@@ -65,8 +65,7 @@ &ether {
 	status = "okay";
 
 	phy1: ethernet-phy@1 {
-		compatible = "ethernet-phy-id0022.1537",
-			     "ethernet-phy-ieee802.3-c22";
+		compatible = "ethernet-phy-id0022.1537";
 		reg = <1>;
 		interrupts-extended = <&irqc 8 IRQ_TYPE_LEVEL_LOW>;
 		micrel,led-mode = <1>;
diff --git a/arch/arm/boot/dts/renesas/r8a7790-lager.dts b/arch/arm/boot/dts/renesas/r8a7790-lager.dts
index 4f002aa7fbafc..8e76655016755 100644
--- a/arch/arm/boot/dts/renesas/r8a7790-lager.dts
+++ b/arch/arm/boot/dts/renesas/r8a7790-lager.dts
@@ -685,8 +685,7 @@ &ether {
 	status = "okay";
 
 	phy1: ethernet-phy@1 {
-		compatible = "ethernet-phy-id0022.1537",
-			     "ethernet-phy-ieee802.3-c22";
+		compatible = "ethernet-phy-id0022.1537";
 		reg = <1>;
 		interrupts-extended = <&irqc0 0 IRQ_TYPE_LEVEL_LOW>;
 		micrel,led-mode = <1>;
diff --git a/arch/arm/boot/dts/renesas/r8a7790-stout.dts b/arch/arm/boot/dts/renesas/r8a7790-stout.dts
index b1e20579e0710..8ba9d85f10389 100644
--- a/arch/arm/boot/dts/renesas/r8a7790-stout.dts
+++ b/arch/arm/boot/dts/renesas/r8a7790-stout.dts
@@ -208,8 +208,7 @@ &ether {
 	status = "okay";
 
 	phy1: ethernet-phy@1 {
-		compatible = "ethernet-phy-id0022.1537",
-			     "ethernet-phy-ieee802.3-c22";
+		compatible = "ethernet-phy-id0022.1537";
 		reg = <1>;
 		interrupts-extended = <&irqc0 1 IRQ_TYPE_LEVEL_LOW>;
 		micrel,led-mode = <1>;
diff --git a/arch/arm/boot/dts/renesas/r8a7791-koelsch.dts b/arch/arm/boot/dts/renesas/r8a7791-koelsch.dts
index 61ea438eb6af1..48db62e0ff874 100644
--- a/arch/arm/boot/dts/renesas/r8a7791-koelsch.dts
+++ b/arch/arm/boot/dts/renesas/r8a7791-koelsch.dts
@@ -676,8 +676,7 @@ &ether {
 	status = "okay";
 
 	phy1: ethernet-phy@1 {
-		compatible = "ethernet-phy-id0022.1537",
-			     "ethernet-phy-ieee802.3-c22";
+		compatible = "ethernet-phy-id0022.1537";
 		reg = <1>;
 		interrupts-extended = <&irqc0 0 IRQ_TYPE_LEVEL_LOW>;
 		micrel,led-mode = <1>;
diff --git a/arch/arm/boot/dts/renesas/r8a7791-porter.dts b/arch/arm/boot/dts/renesas/r8a7791-porter.dts
index 81b3c5d74e9b3..811e263452acd 100644
--- a/arch/arm/boot/dts/renesas/r8a7791-porter.dts
+++ b/arch/arm/boot/dts/renesas/r8a7791-porter.dts
@@ -326,8 +326,7 @@ &ether {
 	status = "okay";
 
 	phy1: ethernet-phy@1 {
-		compatible = "ethernet-phy-id0022.1537",
-			     "ethernet-phy-ieee802.3-c22";
+		compatible = "ethernet-phy-id0022.1537";
 		reg = <1>;
 		interrupts-extended = <&irqc0 0 IRQ_TYPE_LEVEL_LOW>;
 		micrel,led-mode = <1>;
diff --git a/arch/arm/boot/dts/renesas/r8a7793-gose.dts b/arch/arm/boot/dts/renesas/r8a7793-gose.dts
index 5c6928c941aca..69d9c674bb032 100644
--- a/arch/arm/boot/dts/renesas/r8a7793-gose.dts
+++ b/arch/arm/boot/dts/renesas/r8a7793-gose.dts
@@ -616,8 +616,7 @@ &ether {
 	status = "okay";
 
 	phy1: ethernet-phy@1 {
-		compatible = "ethernet-phy-id0022.1537",
-			     "ethernet-phy-ieee802.3-c22";
+		compatible = "ethernet-phy-id0022.1537";
 		reg = <1>;
 		interrupts-extended = <&irqc0 0 IRQ_TYPE_LEVEL_LOW>;
 		micrel,led-mode = <1>;
diff --git a/arch/arm/boot/dts/renesas/r8a7794-alt.dts b/arch/arm/boot/dts/renesas/r8a7794-alt.dts
index 3f06a7f67d62a..5d6d0d8cc4dd8 100644
--- a/arch/arm/boot/dts/renesas/r8a7794-alt.dts
+++ b/arch/arm/boot/dts/renesas/r8a7794-alt.dts
@@ -378,8 +378,7 @@ &ether {
 	status = "okay";
 
 	phy1: ethernet-phy@1 {
-		compatible = "ethernet-phy-id0022.1537",
-			     "ethernet-phy-ieee802.3-c22";
+		compatible = "ethernet-phy-id0022.1537";
 		reg = <1>;
 		interrupts-extended = <&irqc0 8 IRQ_TYPE_LEVEL_LOW>;
 		micrel,led-mode = <1>;
diff --git a/arch/arm/boot/dts/renesas/r8a7794-silk.dts b/arch/arm/boot/dts/renesas/r8a7794-silk.dts
index 3428256057680..af474b1d9676d 100644
--- a/arch/arm/boot/dts/renesas/r8a7794-silk.dts
+++ b/arch/arm/boot/dts/renesas/r8a7794-silk.dts
@@ -412,8 +412,7 @@ &ether {
 	status = "okay";
 
 	phy1: ethernet-phy@1 {
-		compatible = "ethernet-phy-id0022.1537",
-			     "ethernet-phy-ieee802.3-c22";
+		compatible = "ethernet-phy-id0022.1537";
 		reg = <1>;
 		interrupts-extended = <&irqc0 8 IRQ_TYPE_LEVEL_LOW>;
 		micrel,led-mode = <1>;
-- 
2.53.0


