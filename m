Return-Path: <linux-renesas-soc+bounces-29351-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id SEzqHGYNtGlvfwAAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-29351-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 13 Mar 2026 14:13:10 +0100
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id B1B22283867
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 13 Mar 2026 14:13:09 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 77FC93019821
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 13 Mar 2026 13:09:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E3E2E313532;
	Fri, 13 Mar 2026 13:09:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="XDvbOq8o"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D82E32BEC23
	for <linux-renesas-soc@vger.kernel.org>; Fri, 13 Mar 2026 13:09:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773407367; cv=none; b=fNt7wHbez+NoMgRZn9qtCgcHrKsvfOdRZ0mM3h7wMEEaZykWjUUqqETZ9OYm7EJaABZIcLcdoL91A9ARIqcG5MO6B+y2kkHwy2OPKnE26JofyRtsCN7nuQxItKRyfR0VAObfadc0IEw3GdlcZ+4VdKOMFhW3FAWEfmC7Kwz/PnE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773407367; c=relaxed/simple;
	bh=Mlt3zUdyupnQfZwuM8KKfUxd48phrw7cE9cI722FfPI=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=Infwmwa25OvqErx7HBTf3GldFD63oqnJklfySmJgv4wvPV5yGBuIT9s3ytDex6EzeUiTqDEzVbOb7wken8/zWFZxrJ/46T+dwtRNGADuO+C6MSQ1kIX15ZTRn2gLFRhdcDuG/lpes/Yc99dZ4uv04PRE5PKe9Ku+a75JHYnJd1Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=XDvbOq8o; arc=none smtp.client-ip=209.85.128.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-4852afd42ceso18797915e9.2
        for <linux-renesas-soc@vger.kernel.org>; Fri, 13 Mar 2026 06:09:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1773407364; x=1774012164; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=ed+WuC0uh59SneD30CqhyUzh0JI9osHE2Nkw5mIBBPE=;
        b=XDvbOq8o1HBdC/GEQ/BGBPfTJMvqWML4x88m6kFMaO8TaIxExzSKp8zFurKpMjp4d6
         L10lWtxdYPJ4eIjFDWKH8XlK/0JjCyn04EBc3d1W9mrtwRXF1l9c7Tu+kdTllX6KW0UW
         o/kIJIiGoDXBWIvN+j0RfYFpt6i70zpEJGf8wjDBfh6qTWeFIZTgI9iidERLWZmLnQ2Z
         Se4dpkd7uwSPEhpqMB7+4aJfB6ePM9LNuXjhtMtKeUPMOwSzoETQg4RxvZ1+AT66Fq9f
         XI466Gc3aKAK3OuzdhLttaZtIMEXqQfnS75o7iZegLKrkzZ0iy7vwG6/tB75TLcH/QVI
         l90A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773407364; x=1774012164;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ed+WuC0uh59SneD30CqhyUzh0JI9osHE2Nkw5mIBBPE=;
        b=BgNLmGZZmdjps4fh3B9uIRDNuLhPLfY/8Avmz427mtiirLxzu3tL1wNSAt6rwT+org
         AcPaS8adAbbRQibPZzcSRJnh68g4PcjkADb4BVfM3Ir/k6YZ3mP0tqwmDCA18KnKO6no
         T+4tn4QDxPssl/657Af7QpO1pxS357wiMN9YjccOe1TLvItAlYmi9jynlb3jcXnE3VmV
         nPxSChRrUf1ZcKIGuWFtn51fpJgVvVAGJHVhFlCedNVyRgnHkj1rasnm7694VmVl2ls6
         SKNJ3rTHmxhfEuPb3OqKSLG8ovDNsIw7IRY+uQ/xg2dJ1mBQnloM126Fu3sb6bNE5H6O
         Tbng==
X-Forwarded-Encrypted: i=1; AJvYcCUPX9pOJEx1PhehwVJlj3aYyWIEZ1NaXYi8nGCn4a1DkwKZr7elKNxi0ymyWFHMYgWtLkh/AnnfwceEWux/C3/3Cw==@vger.kernel.org
X-Gm-Message-State: AOJu0YywZs5A7l0oC+Z9eDFq8f0fLNFQaRdKsrvgCHWawDk9f7zJlviH
	Si3Se12jr/zviBD5jGbolysbqMOwxw/jqEq99GkSnFelIapdn60MW8L+
X-Gm-Gg: ATEYQzxZEQUYEw0vHwJCWHOEiOhcB/m+Xo6ppOREMhsildYBKG1ERacxrrZvIu09hfN
	vrmLGcSa8/lITdlQm6+eMiZ/0LYC5bZppOthD4kKxjDrLkOXy94/AnaDM7OScmr7Bhefqw6zTcI
	n6QKxf8nBnzeuqF1uI82sYdpfSiS7SaaUkfiLlfqEpB5pj8pJ3MLYwVTm2q/TyIydN6rwbyjvZA
	J1J36RtnwNfe/UoPQ+1a/5kebM7J8fkoeHRlbxboLx3GzYmQQE9cxMDdbjAtndDdSTyGAC5+2Kc
	AVaTHaOgycjx/BVfLaK5wmIk0nq4GaSyoWjCNEKWklplGo9EmGbzPhF/LmxqX+Ouz+HZTLtM3Su
	zFWOnv+UzfHxvhrM/yxQUXDeD63FV8NAng5vB9O6KX6iwPvmK7gRgNiwJedZm0Ogz5/pki+IOie
	Xk5nEE5o74CLnUFeqEt6M5idN7CCtAgvVHcFvhVVLT8TyvghuJ
X-Received: by 2002:a05:600c:c1c8:10b0:485:3a8a:5df5 with SMTP id 5b1f17b1804b1-485566cfcdbmr39843165e9.13.1773407363908;
        Fri, 13 Mar 2026 06:09:23 -0700 (PDT)
Received: from localhost.localdomain ([2a00:23c4:a758:8a01:6418:ccf7:57f1:473f])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-439fe20b544sm18456212f8f.20.2026.03.13.06.09.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Mar 2026 06:09:23 -0700 (PDT)
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
Subject: [PATCH] arm64: dts: renesas: Remove redundant ethernet-phy-ieee802.3-c22 fallback
Date: Fri, 13 Mar 2026 13:09:18 +0000
Message-ID: <20260313130920.298392-1-biju.das.jz@bp.renesas.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_MISSING_CHARSET(0.50)[];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20230601];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-29351-lists,linux-renesas-soc=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_CC(0.00)[bp.renesas.com,vger.kernel.org,gmail.com];
	PRECEDENCE_BULK(0.00)[];
	FREEMAIL_TO(0.00)[glider.be,gmail.com,kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[gmail.com:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	FROM_NEQ_ENVFROM(0.00)[bijudasau@gmail.com,linux-renesas-soc@vger.kernel.org];
	NEURAL_HAM(-0.00)[-0.997];
	DBL_PROHIBIT(0.00)[0.0.0.2:email,0.0.0.50:email];
	RCVD_COUNT_FIVE(0.00)[5];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[11];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-renesas-soc,renesas,dt];
	FREEMAIL_FROM(0.00)[gmail.com];
	DBL_BLOCKED_OPENRESOLVER(0.00)[0.0.0.0:email,0.0.0.12:email,renesas.com:email,0.0.0.3:email,bp.renesas.com:mid,0.0.0.7:email,0.0.0.1:email]
X-Rspamd-Queue-Id: B1B22283867
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

From: Biju Das <biju.das.jz@bp.renesas.com>

Drop the ethernet-phy-ieee802.3-c22 compatible string from all Renesas
arm64 device tree sources. The c22 fallback is implicitly assumed for
PHY ID-based compatible strings and does not need to be stated explicitly.

Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
---
This patch depend upon [1]
[1] https://lore.kernel.org/all/20260313130623.297712-1-biju.das.jz@bp.renesas.com/
---
 arch/arm64/boot/dts/renesas/beacon-renesom-som.dtsi    | 3 +--
 arch/arm64/boot/dts/renesas/cat875.dtsi                | 3 +--
 arch/arm64/boot/dts/renesas/condor-common.dtsi         | 3 +--
 arch/arm64/boot/dts/renesas/draak.dtsi                 | 3 +--
 arch/arm64/boot/dts/renesas/ebisu.dtsi                 | 3 +--
 arch/arm64/boot/dts/renesas/gray-hawk-single.dtsi      | 3 +--
 arch/arm64/boot/dts/renesas/hihope-rzg2-ex.dtsi        | 3 +--
 arch/arm64/boot/dts/renesas/r8a77970-eagle.dts         | 3 +--
 arch/arm64/boot/dts/renesas/r8a77970-v3msk.dts         | 3 +--
 arch/arm64/boot/dts/renesas/r8a77980-v3hsk.dts         | 3 +--
 arch/arm64/boot/dts/renesas/r8a779a0-falcon.dts        | 3 +--
 arch/arm64/boot/dts/renesas/r8a779g3-sparrow-hawk.dts  | 3 +--
 arch/arm64/boot/dts/renesas/r9a09g011-v2mevk2.dts      | 3 +--
 arch/arm64/boot/dts/renesas/r9a09g056n48-rzv2n-evk.dts | 4 ++--
 arch/arm64/boot/dts/renesas/r9a09g057h44-rzv2h-evk.dts | 4 ++--
 arch/arm64/boot/dts/renesas/rzg2l-smarc-som.dtsi       | 6 ++----
 arch/arm64/boot/dts/renesas/rzg2lc-smarc-som.dtsi      | 3 +--
 arch/arm64/boot/dts/renesas/rzg2ul-smarc-som.dtsi      | 6 ++----
 arch/arm64/boot/dts/renesas/rzg3e-smarc-som.dtsi       | 6 ++----
 arch/arm64/boot/dts/renesas/rzt2h-n2h-evk-common.dtsi  | 4 ++--
 arch/arm64/boot/dts/renesas/salvator-common.dtsi       | 3 +--
 arch/arm64/boot/dts/renesas/ulcb.dtsi                  | 3 +--
 arch/arm64/boot/dts/renesas/white-hawk-cpu-common.dtsi | 3 +--
 arch/arm64/boot/dts/renesas/white-hawk-single.dtsi     | 3 +--
 24 files changed, 30 insertions(+), 54 deletions(-)

diff --git a/arch/arm64/boot/dts/renesas/beacon-renesom-som.dtsi b/arch/arm64/boot/dts/renesas/beacon-renesom-som.dtsi
index af6d15f90c65..f8442b6a85a7 100644
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
diff --git a/arch/arm64/boot/dts/renesas/cat875.dtsi b/arch/arm64/boot/dts/renesas/cat875.dtsi
index 191b051ecfd4..5815e9d2d8a9 100644
--- a/arch/arm64/boot/dts/renesas/cat875.dtsi
+++ b/arch/arm64/boot/dts/renesas/cat875.dtsi
@@ -22,8 +22,7 @@ &avb {
 	status = "okay";
 
 	phy0: ethernet-phy@0 {
-		compatible = "ethernet-phy-id001c.c915",
-			     "ethernet-phy-ieee802.3-c22";
+		compatible = "ethernet-phy-id001c.c915";
 		reg = <0>;
 		interrupts-extended = <&gpio2 21 IRQ_TYPE_LEVEL_LOW>;
 		reset-gpios = <&gpio1 20 GPIO_ACTIVE_LOW>;
diff --git a/arch/arm64/boot/dts/renesas/condor-common.dtsi b/arch/arm64/boot/dts/renesas/condor-common.dtsi
index 6b22cc0b05b1..1da5661b240f 100644
--- a/arch/arm64/boot/dts/renesas/condor-common.dtsi
+++ b/arch/arm64/boot/dts/renesas/condor-common.dtsi
@@ -162,8 +162,7 @@ &gether {
 	status = "okay";
 
 	phy0: ethernet-phy@0 {
-		compatible = "ethernet-phy-id0022.1622",
-			     "ethernet-phy-ieee802.3-c22";
+		compatible = "ethernet-phy-id0022.1622";
 		rxc-skew-ps = <1500>;
 		reg = <0>;
 		interrupts-extended = <&gpio4 23 IRQ_TYPE_LEVEL_LOW>;
diff --git a/arch/arm64/boot/dts/renesas/draak.dtsi b/arch/arm64/boot/dts/renesas/draak.dtsi
index c83c97d99113..099e4f6fee3e 100644
--- a/arch/arm64/boot/dts/renesas/draak.dtsi
+++ b/arch/arm64/boot/dts/renesas/draak.dtsi
@@ -243,8 +243,7 @@ &avb {
 	status = "okay";
 
 	phy0: ethernet-phy@0 {
-		compatible = "ethernet-phy-id0022.1622",
-			     "ethernet-phy-ieee802.3-c22";
+		compatible = "ethernet-phy-id0022.1622";
 		rxc-skew-ps = <1500>;
 		reg = <0>;
 		interrupts-extended = <&gpio5 19 IRQ_TYPE_LEVEL_LOW>;
diff --git a/arch/arm64/boot/dts/renesas/ebisu.dtsi b/arch/arm64/boot/dts/renesas/ebisu.dtsi
index aaedb1fb51ae..a844d4376436 100644
--- a/arch/arm64/boot/dts/renesas/ebisu.dtsi
+++ b/arch/arm64/boot/dts/renesas/ebisu.dtsi
@@ -316,8 +316,7 @@ &avb {
 	status = "okay";
 
 	phy0: ethernet-phy@0 {
-		compatible = "ethernet-phy-id0022.1622",
-			     "ethernet-phy-ieee802.3-c22";
+		compatible = "ethernet-phy-id0022.1622";
 		rxc-skew-ps = <1500>;
 		reg = <0>;
 		interrupts-extended = <&gpio2 21 IRQ_TYPE_LEVEL_LOW>;
diff --git a/arch/arm64/boot/dts/renesas/gray-hawk-single.dtsi b/arch/arm64/boot/dts/renesas/gray-hawk-single.dtsi
index 2edb5cb3407b..a1fe9c5be78f 100644
--- a/arch/arm64/boot/dts/renesas/gray-hawk-single.dtsi
+++ b/arch/arm64/boot/dts/renesas/gray-hawk-single.dtsi
@@ -207,8 +207,7 @@ mdio {
 		#size-cells = <0>;
 
 		avb0_phy: ethernet-phy@0 {
-			compatible = "ethernet-phy-id0022.1622",
-				"ethernet-phy-ieee802.3-c22";
+			compatible = "ethernet-phy-id0022.1622";
 				rxc-skew-ps = <1500>;
 				reg = <0>;
 				interrupts-extended = <&gpio7 5 IRQ_TYPE_LEVEL_LOW>;
diff --git a/arch/arm64/boot/dts/renesas/hihope-rzg2-ex.dtsi b/arch/arm64/boot/dts/renesas/hihope-rzg2-ex.dtsi
index 4113710d5522..83b6c04274ac 100644
--- a/arch/arm64/boot/dts/renesas/hihope-rzg2-ex.dtsi
+++ b/arch/arm64/boot/dts/renesas/hihope-rzg2-ex.dtsi
@@ -24,8 +24,7 @@ &avb {
 	status = "okay";
 
 	phy0: ethernet-phy@0 {
-		compatible = "ethernet-phy-id001c.c915",
-			     "ethernet-phy-ieee802.3-c22";
+		compatible = "ethernet-phy-id001c.c915";
 		reg = <0>;
 		interrupts-extended = <&gpio2 11 IRQ_TYPE_LEVEL_LOW>;
 		reset-gpios = <&gpio2 10 GPIO_ACTIVE_LOW>;
diff --git a/arch/arm64/boot/dts/renesas/r8a77970-eagle.dts b/arch/arm64/boot/dts/renesas/r8a77970-eagle.dts
index b26c5a709777..65f2c67ae546 100644
--- a/arch/arm64/boot/dts/renesas/r8a77970-eagle.dts
+++ b/arch/arm64/boot/dts/renesas/r8a77970-eagle.dts
@@ -107,8 +107,7 @@ &avb {
 	status = "okay";
 
 	phy0: ethernet-phy@0 {
-		compatible = "ethernet-phy-id0022.1622",
-			     "ethernet-phy-ieee802.3-c22";
+		compatible = "ethernet-phy-id0022.1622";
 		rxc-skew-ps = <1500>;
 		reg = <0>;
 		interrupts-extended = <&gpio1 17 IRQ_TYPE_LEVEL_LOW>;
diff --git a/arch/arm64/boot/dts/renesas/r8a77970-v3msk.dts b/arch/arm64/boot/dts/renesas/r8a77970-v3msk.dts
index 343f9610f892..433c85ad6d27 100644
--- a/arch/arm64/boot/dts/renesas/r8a77970-v3msk.dts
+++ b/arch/arm64/boot/dts/renesas/r8a77970-v3msk.dts
@@ -113,8 +113,7 @@ &avb {
 	status = "okay";
 
 	phy0: ethernet-phy@0 {
-		compatible = "ethernet-phy-id0022.1622",
-			     "ethernet-phy-ieee802.3-c22";
+		compatible = "ethernet-phy-id0022.1622";
 		rxc-skew-ps = <1500>;
 		reg = <0>;
 		interrupts-extended = <&gpio1 17 IRQ_TYPE_LEVEL_LOW>;
diff --git a/arch/arm64/boot/dts/renesas/r8a77980-v3hsk.dts b/arch/arm64/boot/dts/renesas/r8a77980-v3hsk.dts
index e3725304fed0..ed716f066acd 100644
--- a/arch/arm64/boot/dts/renesas/r8a77980-v3hsk.dts
+++ b/arch/arm64/boot/dts/renesas/r8a77980-v3hsk.dts
@@ -120,8 +120,7 @@ &gether {
 	status = "okay";
 
 	phy0: ethernet-phy@0 {
-		compatible = "ethernet-phy-id0022.1622",
-			     "ethernet-phy-ieee802.3-c22";
+		compatible = "ethernet-phy-id0022.1622";
 		rxc-skew-ps = <1500>;
 		reg = <0>;
 		interrupts-extended = <&gpio4 23 IRQ_TYPE_LEVEL_LOW>;
diff --git a/arch/arm64/boot/dts/renesas/r8a779a0-falcon.dts b/arch/arm64/boot/dts/renesas/r8a779a0-falcon.dts
index 6bd580737f25..55397b9eb874 100644
--- a/arch/arm64/boot/dts/renesas/r8a779a0-falcon.dts
+++ b/arch/arm64/boot/dts/renesas/r8a779a0-falcon.dts
@@ -27,8 +27,7 @@ &avb0 {
 	status = "okay";
 
 	phy0: ethernet-phy@0 {
-		compatible = "ethernet-phy-id0022.1622",
-			     "ethernet-phy-ieee802.3-c22";
+		compatible = "ethernet-phy-id0022.1622";
 		rxc-skew-ps = <1500>;
 		reg = <0>;
 		interrupts-extended = <&gpio4 16 IRQ_TYPE_LEVEL_LOW>;
diff --git a/arch/arm64/boot/dts/renesas/r8a779g3-sparrow-hawk.dts b/arch/arm64/boot/dts/renesas/r8a779g3-sparrow-hawk.dts
index 3b47e3ce95d4..2b423ac86d00 100644
--- a/arch/arm64/boot/dts/renesas/r8a779g3-sparrow-hawk.dts
+++ b/arch/arm64/boot/dts/renesas/r8a779g3-sparrow-hawk.dts
@@ -242,8 +242,7 @@ mdio {
 		#size-cells = <0>;
 
 		avb0_phy: ethernet-phy@0 {	/* KSZ9031RNXVB */
-			compatible = "ethernet-phy-id0022.1622",
-				     "ethernet-phy-ieee802.3-c22";
+			compatible = "ethernet-phy-id0022.1622";
 			rxc-skew-ps = <1500>;
 			reg = <0>;
 			/* AVB0_PHY_INT_V */
diff --git a/arch/arm64/boot/dts/renesas/r9a09g011-v2mevk2.dts b/arch/arm64/boot/dts/renesas/r9a09g011-v2mevk2.dts
index 39fe3f94991e..07147743de93 100644
--- a/arch/arm64/boot/dts/renesas/r9a09g011-v2mevk2.dts
+++ b/arch/arm64/boot/dts/renesas/r9a09g011-v2mevk2.dts
@@ -100,8 +100,7 @@ &avb {
 	status = "okay";
 
 	phy0: ethernet-phy@0 {
-		compatible = "ethernet-phy-id001c.c916",
-			     "ethernet-phy-ieee802.3-c22";
+		compatible = "ethernet-phy-id001c.c916";
 		reg = <0>;
 	};
 };
diff --git a/arch/arm64/boot/dts/renesas/r9a09g056n48-rzv2n-evk.dts b/arch/arm64/boot/dts/renesas/r9a09g056n48-rzv2n-evk.dts
index c191ecb39713..dd5e4b13f0f8 100644
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
index dc4577ebf2e9..8ae7b6e3d712 100644
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
index d511e152d7c6..7eccdaffb221 100644
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
index 3e8909a872e3..15f2e9eaaf0b 100644
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
index cd4275d86935..0f917d7c9939 100644
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
index 3b571c096752..cb5066443722 100644
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
diff --git a/arch/arm64/boot/dts/renesas/rzt2h-n2h-evk-common.dtsi b/arch/arm64/boot/dts/renesas/rzt2h-n2h-evk-common.dtsi
index f87c2492f414..d25113ff14bc 100644
--- a/arch/arm64/boot/dts/renesas/rzt2h-n2h-evk-common.dtsi
+++ b/arch/arm64/boot/dts/renesas/rzt2h-n2h-evk-common.dtsi
@@ -197,7 +197,7 @@ eeprom: eeprom@50 {
 
 &mdio1 {
 	mdio1_phy: ethernet-phy@3 {
-		compatible = "ethernet-phy-id0007.0772", "ethernet-phy-ieee802.3-c22";
+		compatible = "ethernet-phy-id0007.0772";
 		reg = <3>;
 		vsc8531,led-0-mode = <VSC8531_ACTIVITY>;
 		vsc8531,led-1-mode = <VSC8531_LINK_ACTIVITY>;
@@ -208,7 +208,7 @@ mdio1_phy: ethernet-phy@3 {
 
 &mdio2 {
 	mdio2_phy: ethernet-phy@2 {
-		compatible = "ethernet-phy-id0007.0772", "ethernet-phy-ieee802.3-c22";
+		compatible = "ethernet-phy-id0007.0772";
 		reg = <2>;
 		vsc8531,led-0-mode = <VSC8531_ACTIVITY>;
 		vsc8531,led-1-mode = <VSC8531_LINK_ACTIVITY>;
diff --git a/arch/arm64/boot/dts/renesas/salvator-common.dtsi b/arch/arm64/boot/dts/renesas/salvator-common.dtsi
index e505161caa67..bcb0fdf8f7ec 100644
--- a/arch/arm64/boot/dts/renesas/salvator-common.dtsi
+++ b/arch/arm64/boot/dts/renesas/salvator-common.dtsi
@@ -355,8 +355,7 @@ &avb {
 	status = "okay";
 
 	phy0: ethernet-phy@0 {
-		compatible = "ethernet-phy-id0022.1622",
-			     "ethernet-phy-ieee802.3-c22";
+		compatible = "ethernet-phy-id0022.1622";
 		rxc-skew-ps = <1500>;
 		reg = <0>;
 		interrupts-extended = <&gpio2 11 IRQ_TYPE_LEVEL_LOW>;
diff --git a/arch/arm64/boot/dts/renesas/ulcb.dtsi b/arch/arm64/boot/dts/renesas/ulcb.dtsi
index 67fd6a65db89..c110efab2c44 100644
--- a/arch/arm64/boot/dts/renesas/ulcb.dtsi
+++ b/arch/arm64/boot/dts/renesas/ulcb.dtsi
@@ -157,8 +157,7 @@ &avb {
 	status = "okay";
 
 	phy0: ethernet-phy@0 {
-		compatible = "ethernet-phy-id0022.1622",
-			     "ethernet-phy-ieee802.3-c22";
+		compatible = "ethernet-phy-id0022.1622";
 		rxc-skew-ps = <1500>;
 		reg = <0>;
 		interrupts-extended = <&gpio2 11 IRQ_TYPE_LEVEL_LOW>;
diff --git a/arch/arm64/boot/dts/renesas/white-hawk-cpu-common.dtsi b/arch/arm64/boot/dts/renesas/white-hawk-cpu-common.dtsi
index b4024e85ae5a..466b76a032db 100644
--- a/arch/arm64/boot/dts/renesas/white-hawk-cpu-common.dtsi
+++ b/arch/arm64/boot/dts/renesas/white-hawk-cpu-common.dtsi
@@ -163,8 +163,7 @@ mdio {
 		#size-cells = <0>;
 
 		avb0_phy: ethernet-phy@0 {
-			compatible = "ethernet-phy-id0022.1622",
-				     "ethernet-phy-ieee802.3-c22";
+			compatible = "ethernet-phy-id0022.1622";
 			rxc-skew-ps = <1500>;
 			reg = <0>;
 			interrupts-extended = <&gpio7 5 IRQ_TYPE_LEVEL_LOW>;
diff --git a/arch/arm64/boot/dts/renesas/white-hawk-single.dtsi b/arch/arm64/boot/dts/renesas/white-hawk-single.dtsi
index 976a3ab44e5a..c2aec33c8388 100644
--- a/arch/arm64/boot/dts/renesas/white-hawk-single.dtsi
+++ b/arch/arm64/boot/dts/renesas/white-hawk-single.dtsi
@@ -68,8 +68,7 @@ mdio {
 		reset-post-delay-us = <4000>;
 
 		tsn0_phy: ethernet-phy@0 {
-			compatible = "ethernet-phy-id002b.0980",
-				     "ethernet-phy-ieee802.3-c22";
+			compatible = "ethernet-phy-id002b.0980";
 			reg = <0>;
 			interrupts-extended = <&gpio4 3 IRQ_TYPE_LEVEL_LOW>;
 		};
-- 
2.43.0


