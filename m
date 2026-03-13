Return-Path: <linux-renesas-soc+bounces-29355-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id oGzxM3ActGlLhQAAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-29355-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 13 Mar 2026 15:17:20 +0100
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 556D5284C16
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 13 Mar 2026 15:17:20 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id A0B0831FBAB2
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 13 Mar 2026 14:11:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7F2FB332EBB;
	Fri, 13 Mar 2026 14:11:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="fttqLdf8"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 019523264EE
	for <linux-renesas-soc@vger.kernel.org>; Fri, 13 Mar 2026 14:11:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773411119; cv=none; b=UqNJcw1VVP2AmoL3cspPdWk6zbNbH3A05uCKO5oqdBr6gpKtQWi+mlq7k8AXIQ6cSsRuy6seNDN6OzjlYGDqnLpcF8LRS2XECBbVv3+zOAsmmVFs7zr7pbVXixZRKtDrFtdBlH8NU44UrBRNI3mrNZCaSE3BsK27YKVS3Mq2c2U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773411119; c=relaxed/simple;
	bh=n3tVET0RKCM0PolDzihzScVEZ6ugwLfmm5zML9kOaJk=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=VxD+O9QI00DuFpVl2ZkDhA3hNnK60obiDbKXIfbZpmNSDbk9xJs+CS1QTywYv+bc2DEOuqR/cJqYf/tQOJJ5GHFqk/BjRI/32N5L01nJM7rb0iyBkltOuv+2PE3Oyaig1swDD37U4YSvsGqnf+Anq7b11dAaw3zsm2txTLbyoA8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=fttqLdf8; arc=none smtp.client-ip=209.85.128.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-48558d6ef83so6668015e9.3
        for <linux-renesas-soc@vger.kernel.org>; Fri, 13 Mar 2026 07:11:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1773411115; x=1774015915; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=7YKDpvVSWs+QgQl+eLRaSI/aYj/+nPQA+bT6vdg6Kz0=;
        b=fttqLdf8mY77y3jsZQ7bbCpSxnnz8toZ67DsYv0FBM/kzQm60wgqnUzZ/gkiIbo+8Q
         4mLqrR4e5OD2Y51q14Z6803wAroeoXTBV1KVSTBkz7yc+gEfHWTDdI19UCD47VQOAgn0
         YMft3TuZhQ9NsEOcvdTAUGg2xuXNmGEXocXhLM/MVG4lnHhb0FVEygdlIr56aCzluhHb
         YmfRTf8hV0ngb0iivB9S/1JxNUP8IJxEsLWrzqD3qTqQpiTTiDhH6fJnLtoDZETkrBIc
         UqmHUdIl1Cx7ZokFQ2620j4xF6TnlSZhrsime0Eb7+Js9T9c04GeGZeEOrb2IWXPJjbm
         U2hg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773411115; x=1774015915;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=7YKDpvVSWs+QgQl+eLRaSI/aYj/+nPQA+bT6vdg6Kz0=;
        b=EQ/6hUWlSUuQ1pyi+l5pUgIySBDAXD/NvNHXu/BPBXgSJTt2GJwqKfyDBZLkqgCDji
         y/KPrqNPa9elIFg0wJdiQpng3FDNQRAsd0cGOFV3BEa7a2x+syi6+VBDz1lY4/datDuh
         UjABiLvLdVMwuLoOYJbFEhnnV/Y/B84pl5qHy1DuzIQ6MZMM40iMPs9hlA73MPjAD90s
         RZ2vZsDlVg1hv/5culNXh6FKIUiUQEfsIM9GzM39DrwQeVHoffnkbGvHZDs/BtQ/CROj
         uyg+NErzLzmpvEpkr8QwRMySrASutzramtCsPKnd8EaPldJOOc+L5q/NFJdxYoLG8QG/
         oQdQ==
X-Forwarded-Encrypted: i=1; AJvYcCU2xvaIm7C1YX90V2K9p0ArnOwyHC2RtE0D+kcd6spOLFzuUX3qbAzwrBMLtrMWMRd+rOCeeiuAftsf0p3CrIwYPg==@vger.kernel.org
X-Gm-Message-State: AOJu0YzuzS7KiCNhdoArXDc32HLyoyxyCEyhs1/uy74FRMVy/4IVydfA
	iXeJcqSSxLG0Lo1KnyHwFxvZ5UEwDEID6BRUeKXLuwcCTIg1HIPkhzFP
X-Gm-Gg: ATEYQzwaw6mxCua6RBfjSBLYnic0BGDVnQJQk1pxja7UeMwqj8/0sclzcyIsd1QZErN
	VnA1fnzIRHtA+9HNqdvXeumdRdZB5bSHuf1lXuNT4RYR7BybPP9Zuivz/lduVbKYObgGJ4AGnJW
	ED5LDtIxofntinn0ah6nma3lNjDWnRXG1xEKAZ5MHQp0GzQeVDMet16yjx0o2AhH2P+3sL/QmUt
	ogHGaZBm41o/w54DD/vYLF/Iz+fh3LQB8jAuLJhwFrZbvMKxtLQA5VkSnrBvYV9mXAr/RyfQxg5
	6XNnCapNrE9iERsQ5geDAn25JvWgsM3fig0ug15FC1DjTSeSr0OwLjBV29q8kGCUhtrcCj0gGaG
	OgdqJYuj01q3FiPhix/WroU40rk0L97tF6zw+2yDlltjpFmfUffMnNzyHG44q6WJjKMgxJP5Pks
	7KhoIV0A1mZKBa25m1zRshibQ7HFsIVSNquIg2RCi/pJc5gBuK
X-Received: by 2002:a05:600c:4fc6:b0:485:3f1c:d8a1 with SMTP id 5b1f17b1804b1-485566d2004mr52422155e9.9.1773411114898;
        Fri, 13 Mar 2026 07:11:54 -0700 (PDT)
Received: from localhost.localdomain ([2a00:23c4:a758:8a01:6418:ccf7:57f1:473f])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48557c679c1sm20703185e9.24.2026.03.13.07.11.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Mar 2026 07:11:54 -0700 (PDT)
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
Subject: [PATCH] arm: dts: renesas: Remove redundant ethernet-phy-ieee802.3-c22 fallback
Date: Fri, 13 Mar 2026 14:11:44 +0000
Message-ID: <20260313141150.406528-1-biju.das.jz@bp.renesas.com>
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
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-29355-lists,linux-renesas-soc=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_CC(0.00)[bp.renesas.com,vger.kernel.org,gmail.com];
	PRECEDENCE_BULK(0.00)[];
	FREEMAIL_TO(0.00)[glider.be,gmail.com,kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[gmail.com:+];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	FROM_NEQ_ENVFROM(0.00)[bijudasau@gmail.com,linux-renesas-soc@vger.kernel.org];
	NEURAL_HAM(-0.00)[-0.998];
	DBL_PROHIBIT(0.00)[0.0.0.3:email];
	RCVD_COUNT_FIVE(0.00)[5];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[11];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-renesas-soc,renesas,dt];
	FREEMAIL_FROM(0.00)[gmail.com];
	DBL_BLOCKED_OPENRESOLVER(0.00)[0.0.0.0:email,bp.renesas.com:mid,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,renesas.com:email,0.0.0.1:email]
X-Rspamd-Queue-Id: 556D5284C16
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

From: Biju Das <biju.das.jz@bp.renesas.com>

Drop the ethernet-phy-ieee802.3-c22 compatible string from all Renesas
arm device tree sources. The c22 fallback is implicitly assumed for
PHY ID-based compatible strings and does not need to be stated explicitly.

Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
---
This patch depend upon [1]
[1] https://lore.kernel.org/all/20260313130623.297712-1-biju.das.jz@bp.renesas.com/
---
 arch/arm/boot/dts/renesas/iwg20d-q7-common.dtsi         | 3 +--
 arch/arm/boot/dts/renesas/r7s72100-genmai.dts           | 3 +--
 arch/arm/boot/dts/renesas/r7s72100-gr-peach.dts         | 3 +--
 arch/arm/boot/dts/renesas/r7s72100-rskrza1.dts          | 3 +--
 arch/arm/boot/dts/renesas/r7s9210-rza2mevb.dts          | 3 +--
 arch/arm/boot/dts/renesas/r8a7740-armadillo800eva.dts   | 3 +--
 arch/arm/boot/dts/renesas/r8a7742-iwg21d-q7-dbcm-ca.dts | 3 +--
 arch/arm/boot/dts/renesas/r8a7742-iwg21d-q7.dts         | 3 +--
 arch/arm/boot/dts/renesas/r8a7743-sk-rzg1m.dts          | 3 +--
 arch/arm/boot/dts/renesas/r8a7745-iwg22d-sodimm.dts     | 3 +--
 arch/arm/boot/dts/renesas/r8a7745-sk-rzg1e.dts          | 3 +--
 arch/arm/boot/dts/renesas/r8a77470-iwg23s-sbc.dts       | 3 +--
 arch/arm/boot/dts/renesas/r8a7790-lager.dts             | 3 +--
 arch/arm/boot/dts/renesas/r8a7790-stout.dts             | 3 +--
 arch/arm/boot/dts/renesas/r8a7791-koelsch.dts           | 3 +--
 arch/arm/boot/dts/renesas/r8a7791-porter.dts            | 3 +--
 arch/arm/boot/dts/renesas/r8a7793-gose.dts              | 3 +--
 arch/arm/boot/dts/renesas/r8a7794-alt.dts               | 3 +--
 arch/arm/boot/dts/renesas/r8a7794-silk.dts              | 3 +--
 19 files changed, 19 insertions(+), 38 deletions(-)

diff --git a/arch/arm/boot/dts/renesas/iwg20d-q7-common.dtsi b/arch/arm/boot/dts/renesas/iwg20d-q7-common.dtsi
index 2cc2908b48ca..219f45b7586d 100644
--- a/arch/arm/boot/dts/renesas/iwg20d-q7-common.dtsi
+++ b/arch/arm/boot/dts/renesas/iwg20d-q7-common.dtsi
@@ -158,8 +158,7 @@ &avb {
 	status = "okay";
 
 	phy3: ethernet-phy@3 {
-		compatible = "ethernet-phy-id0022.1622",
-			     "ethernet-phy-ieee802.3-c22";
+		compatible = "ethernet-phy-id0022.1622";
 		reg = <3>;
 		micrel,led-mode = <1>;
 	};
diff --git a/arch/arm/boot/dts/renesas/r7s72100-genmai.dts b/arch/arm/boot/dts/renesas/r7s72100-genmai.dts
index 3c3756509714..9504b63bb5e1 100644
--- a/arch/arm/boot/dts/renesas/r7s72100-genmai.dts
+++ b/arch/arm/boot/dts/renesas/r7s72100-genmai.dts
@@ -163,8 +163,7 @@ &ether {
 	renesas,no-ether-link;
 	phy-handle = <&phy0>;
 	phy0: ethernet-phy@0 {
-		compatible = "ethernet-phy-idb824.2814",
-			     "ethernet-phy-ieee802.3-c22";
+		compatible = "ethernet-phy-idb824.2814";
 		reg = <0>;
 	};
 };
diff --git a/arch/arm/boot/dts/renesas/r7s72100-gr-peach.dts b/arch/arm/boot/dts/renesas/r7s72100-gr-peach.dts
index 23ddec217685..36cc1c4d41fd 100644
--- a/arch/arm/boot/dts/renesas/r7s72100-gr-peach.dts
+++ b/arch/arm/boot/dts/renesas/r7s72100-gr-peach.dts
@@ -125,8 +125,7 @@ &ether {
 	phy-handle = <&phy0>;
 
 	phy0: ethernet-phy@0 {
-		compatible = "ethernet-phy-id0007.c0f0",
-			     "ethernet-phy-ieee802.3-c22";
+		compatible = "ethernet-phy-id0007.c0f0";
 		reg = <0>;
 
 		reset-gpios = <&port4 2 GPIO_ACTIVE_LOW>;
diff --git a/arch/arm/boot/dts/renesas/r7s72100-rskrza1.dts b/arch/arm/boot/dts/renesas/r7s72100-rskrza1.dts
index 91178fb9e721..beeb2db1c28b 100644
--- a/arch/arm/boot/dts/renesas/r7s72100-rskrza1.dts
+++ b/arch/arm/boot/dts/renesas/r7s72100-rskrza1.dts
@@ -251,8 +251,7 @@ &ether {
 	renesas,no-ether-link;
 	phy-handle = <&phy0>;
 	phy0: ethernet-phy@0 {
-		compatible = "ethernet-phy-idb824.2814",
-			     "ethernet-phy-ieee802.3-c22";
+		compatible = "ethernet-phy-idb824.2814";
 		reg = <0>;
 	};
 };
diff --git a/arch/arm/boot/dts/renesas/r7s9210-rza2mevb.dts b/arch/arm/boot/dts/renesas/r7s9210-rza2mevb.dts
index f69a7fe56b6e..55221c82ef64 100644
--- a/arch/arm/boot/dts/renesas/r7s9210-rza2mevb.dts
+++ b/arch/arm/boot/dts/renesas/r7s9210-rza2mevb.dts
@@ -94,8 +94,7 @@ &ether1 {
 	renesas,no-ether-link;
 	phy-handle = <&phy1>;
 	phy1: ethernet-phy@1 {
-		compatible = "ethernet-phy-id001c.c816",
-			     "ethernet-phy-ieee802.3-c22";
+		compatible = "ethernet-phy-id001c.c816";
 		reg = <0>;
 	};
 };
diff --git a/arch/arm/boot/dts/renesas/r8a7740-armadillo800eva.dts b/arch/arm/boot/dts/renesas/r8a7740-armadillo800eva.dts
index 04d24b6d8056..f0e8346354d5 100644
--- a/arch/arm/boot/dts/renesas/r8a7740-armadillo800eva.dts
+++ b/arch/arm/boot/dts/renesas/r8a7740-armadillo800eva.dts
@@ -182,8 +182,7 @@ &ether {
 	status = "okay";
 
 	phy0: ethernet-phy@0 {
-		compatible = "ethernet-phy-id0007.c0f1",
-			     "ethernet-phy-ieee802.3-c22";
+		compatible = "ethernet-phy-id0007.c0f1";
 		reg = <0>;
 		reset-gpios = <&pfc 18 GPIO_ACTIVE_LOW>;
 	};
diff --git a/arch/arm/boot/dts/renesas/r8a7742-iwg21d-q7-dbcm-ca.dts b/arch/arm/boot/dts/renesas/r8a7742-iwg21d-q7-dbcm-ca.dts
index 33ac4bd1e63b..c43c08d9ff94 100644
--- a/arch/arm/boot/dts/renesas/r8a7742-iwg21d-q7-dbcm-ca.dts
+++ b/arch/arm/boot/dts/renesas/r8a7742-iwg21d-q7-dbcm-ca.dts
@@ -85,8 +85,7 @@ &ether {
 	status = "okay";
 
 	phy1: ethernet-phy@1 {
-		compatible = "ethernet-phy-id0022.1560",
-			     "ethernet-phy-ieee802.3-c22";
+		compatible = "ethernet-phy-id0022.1560";
 		reg = <1>;
 		micrel,led-mode = <1>;
 	};
diff --git a/arch/arm/boot/dts/renesas/r8a7742-iwg21d-q7.dts b/arch/arm/boot/dts/renesas/r8a7742-iwg21d-q7.dts
index 6a8a0d2113b0..86bc4a022267 100644
--- a/arch/arm/boot/dts/renesas/r8a7742-iwg21d-q7.dts
+++ b/arch/arm/boot/dts/renesas/r8a7742-iwg21d-q7.dts
@@ -175,8 +175,7 @@ &avb {
 	status = "okay";
 
 	phy3: ethernet-phy@3 {
-		compatible = "ethernet-phy-id0022.1622",
-			     "ethernet-phy-ieee802.3-c22";
+		compatible = "ethernet-phy-id0022.1622";
 		reg = <3>;
 		micrel,led-mode = <1>;
 	};
diff --git a/arch/arm/boot/dts/renesas/r8a7743-sk-rzg1m.dts b/arch/arm/boot/dts/renesas/r8a7743-sk-rzg1m.dts
index 9b16fe7ce713..60217797e534 100644
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
diff --git a/arch/arm/boot/dts/renesas/r8a7745-iwg22d-sodimm.dts b/arch/arm/boot/dts/renesas/r8a7745-iwg22d-sodimm.dts
index 3ac2526a24a1..a8a4ba5b67f1 100644
--- a/arch/arm/boot/dts/renesas/r8a7745-iwg22d-sodimm.dts
+++ b/arch/arm/boot/dts/renesas/r8a7745-iwg22d-sodimm.dts
@@ -123,8 +123,7 @@ phy3: ethernet-phy@3 {
 	 * On some older versions of the platform (before R4.0) the phy address
 	 * may be 1 or 3. The address is fixed to 3 for R4.0 onwards.
 	 */
-		compatible = "ethernet-phy-id0022.1622",
-			     "ethernet-phy-ieee802.3-c22";
+		compatible = "ethernet-phy-id0022.1622";
 		reg = <3>;
 		micrel,led-mode = <1>;
 	};
diff --git a/arch/arm/boot/dts/renesas/r8a7745-sk-rzg1e.dts b/arch/arm/boot/dts/renesas/r8a7745-sk-rzg1e.dts
index 571615a50620..42e82f069755 100644
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
diff --git a/arch/arm/boot/dts/renesas/r8a77470-iwg23s-sbc.dts b/arch/arm/boot/dts/renesas/r8a77470-iwg23s-sbc.dts
index e511eb425bc5..b78dff5d4184 100644
--- a/arch/arm/boot/dts/renesas/r8a77470-iwg23s-sbc.dts
+++ b/arch/arm/boot/dts/renesas/r8a77470-iwg23s-sbc.dts
@@ -79,8 +79,7 @@ &avb {
 	status = "okay";
 
 	phy3: ethernet-phy@3 {
-		compatible = "ethernet-phy-id0022.1622",
-			     "ethernet-phy-ieee802.3-c22";
+		compatible = "ethernet-phy-id0022.1622";
 		reg = <3>;
 		interrupts-extended = <&gpio5 16 IRQ_TYPE_LEVEL_LOW>;
 		micrel,led-mode = <1>;
diff --git a/arch/arm/boot/dts/renesas/r8a7790-lager.dts b/arch/arm/boot/dts/renesas/r8a7790-lager.dts
index 4f002aa7fbaf..8e7665501675 100644
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
index b1e20579e071..8ba9d85f1038 100644
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
index 61ea438eb6af..48db62e0ff87 100644
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
index 81b3c5d74e9b..811e263452ac 100644
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
index 5c6928c941ac..69d9c674bb03 100644
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
index 3f06a7f67d62..5d6d0d8cc4dd 100644
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
index 342825605768..af474b1d9676 100644
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
2.43.0


