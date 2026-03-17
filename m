Return-Path: <linux-renesas-soc+bounces-29585-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id GEBAKy8ruWmVtQEAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-29585-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 17 Mar 2026 11:21:35 +0100
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 1615A2A7C6F
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 17 Mar 2026 11:21:35 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 9796730A6A0B
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 17 Mar 2026 10:16:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5B63F3A5443;
	Tue, 17 Mar 2026 10:16:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Vpsbvyld"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 738393A5E63
	for <linux-renesas-soc@vger.kernel.org>; Tue, 17 Mar 2026 10:16:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773742597; cv=none; b=s7V8Wjvc9kW00vuCssMsvKNofOvK+rA839OG4G9UGTO0TJ5QXp7w3bqekw+BYLLXUsDWGq3vEH/xJnu9LT54HliEh/hYrQOAroGhENpjcRkLxfUdZ8hvsgaBDsFc9CDGpJZQTiUouSk8LXH0s9wpXft1UrzM/+P4yg9sv5z3cqY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773742597; c=relaxed/simple;
	bh=+gST9qIDLwx+PAONExhadksgQ6qC+s6Vkq5FGDT091A=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=bOVDN5kSB5/5eZtEWSCoRhNDXoP9JTQpwPt/2bONEMFWNLEl+XsDa7xTSEJtfGUEafoEt2eHTGsgTIJLswAusv8M20Rxc1o4vsqU63j3lCnd/m5RiMKD25hwFa1ZRqirkvRuC3/o1N0eU+tT3lAPANtszNBkNgQzFFgvj8i9Naw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Vpsbvyld; arc=none smtp.client-ip=209.85.128.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-485410a0a8aso50446985e9.2
        for <linux-renesas-soc@vger.kernel.org>; Tue, 17 Mar 2026 03:16:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1773742594; x=1774347394; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=RKn9+CLHPf91JmmIWUA4oTfuxyk7Dg46U3iktOxaSxI=;
        b=Vpsbvyldf4g1KvTNhEI3HRpQ2viZqIRoIxVHQ+MNux2+ZgEshPJBe6fEmGVIEA1MsM
         uBC0UOGerzvYz/6ZQoHrdMz8Gdt4Aq8+KdluYmBC+nNrRcTaTc93TEg3YTn+5cCNRocW
         Hys6B3n8pe7p3mfY7t4h1FTzTEi7qWczmh35aMDR/avizrLv8TDgvSzWpdSLhmXuPRKJ
         CHRzmvKp/ERvAG/QGCtFRcT/ppHxGlcMyg4yTReGx5ZcbCrcPTw9+02kjOkd80VIFcXe
         gcYnLgtHFepr48iEr7aLc+lBMsJoBOEsDwPNypE+4H90FPZCj3ji54epXpaV+H5unV/6
         KoFQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773742594; x=1774347394;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=RKn9+CLHPf91JmmIWUA4oTfuxyk7Dg46U3iktOxaSxI=;
        b=nlO3/UI7qk1Og5KlPEXR7i0wHIZuq4N1EjzPukBiHuyyXllKh+OJrxB1jYM3vYDKqD
         z8Nw2+jhEuKBYdplI6aP4ELWpPSGtJ3eLId+ALBcKOqeSQXP2x0FGYFNlS1aZPgJ41Ey
         +GKXQZyJ6TSIMGrSXzv66PUCnAhpCFw0SDc3hGOd0jPDBItFMXYp8GSDYn2xLdmB7N03
         dbXMb2xzln6EV6yRwKYv2D9SBnCCZ+QXqeVWkD2wVt6HwGgAgp+6YDIc7OCxaGURQ6FL
         U+dvEbhBEWhrJUtdV5QvHw8qaGDQyiHEeu5ZaA6E1i7LBT2uISB9R+St3NLoSj9yC0B4
         9vWw==
X-Forwarded-Encrypted: i=1; AJvYcCXf+3JmqJvuke2kMda2PhDsq+Rz4MHs5LyN2mzQ5BKA6G8sCOsFn8FZorZ/Mh2bPVsBAgoRqq+Z6o66wlfvlo97EQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YzOVGDaoTef3FHUywmOi4zQfocFWlo9T8SbjyrudL2P10eOacOR
	PohlEU33wKxgipR5SeNvuccf5wygwU6eePejRlIjX/zZGwHGt0+r0bUX
X-Gm-Gg: ATEYQzwXMRBgOy4AHM962uIINe1RKvXYxZ9vL+vXif+tMiIcXmWmEV1ZFHb+YH//GmC
	J3Lhcp5f/VguJiS6V8NCKKlYTUz0DszBaZpZSUNsiXuooeKimVEpWEKMVUx+JFi/YuNk7DEmZXA
	3Nlh7CA0UkFhGfjoBvTKtHBfUbYh8A9AuywbS2lbPJ+yPkY6hgIZ0iOoNBKf/tgKsiswdl6cwcM
	90IoUMDWx2c7fvZFuj4jaBfQQA5fOaNgowGuUbXKsMUymwrWGnJsITyUlmvlZdITRsdxhdoheqc
	FoAiZ+XZuixR4X12pg+zejm41h7gfgDY1n+CBNV8nHkSZX0dHA3065aOi/eO40WBnJ5vvSzPQM5
	zXv5+GP2vDZ3JQpTCR5k8az57dYuBK0eDs8R2ewilAr+a2w/LsIgN+8UUKQJYf+X4zwm3hiqJ0w
	qeDnrSuCogI+b/7IUD2dQEgzD/3mwT/wmNQRmp0VPd4leCftgv
X-Received: by 2002:a05:600c:628c:b0:485:3b34:2f51 with SMTP id 5b1f17b1804b1-485566c9440mr255638035e9.4.1773742593705;
        Tue, 17 Mar 2026 03:16:33 -0700 (PDT)
Received: from localhost.localdomain ([2a00:23c4:a758:8a01:e16b:fc56:e220:9aa9])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4856eaee510sm53903275e9.14.2026.03.17.03.16.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Mar 2026 03:16:33 -0700 (PDT)
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
Subject: [PATCH v3 3/8] arm64: dts: renesas: Add reset-names for RZ/G2L and RZ/V2H family SoCs
Date: Tue, 17 Mar 2026 10:16:16 +0000
Message-ID: <20260317101627.174491-4-biju.das.jz@bp.renesas.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260317101627.174491-1-biju.das.jz@bp.renesas.com>
References: <20260317101627.174491-1-biju.das.jz@bp.renesas.com>
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
	TAGGED_FROM(0.00)[bounces-29585-lists,linux-renesas-soc=lfdr.de];
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
	NEURAL_HAM(-0.00)[-1.000];
	DBL_PROHIBIT(0.00)[0.168.77.240:email];
	RCVD_COUNT_FIVE(0.00)[5];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[11];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-renesas-soc,renesas,dt];
	FREEMAIL_FROM(0.00)[gmail.com];
	DBL_BLOCKED_OPENRESOLVER(0.00)[0.158.216.16:email,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,0.168.156.16:email,bp.renesas.com:mid,0.158.255.32:email,renesas.com:email,110a0000:email,0.180.91.224:email]
X-Rspamd-Queue-Id: 1615A2A7C6F
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

From: Biju Das <biju.das.jz@bp.renesas.com>

Add reset-names for RZ/{G2L,G2UL,G3S} and RZ/{V2L,V2H,V2N} SoCs.

Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
---
v2->v3:
 * No change.
v2:
 * New patch
---
 arch/arm64/boot/dts/renesas/r9a07g043.dtsi | 1 +
 arch/arm64/boot/dts/renesas/r9a07g044.dtsi | 1 +
 arch/arm64/boot/dts/renesas/r9a07g054.dtsi | 1 +
 arch/arm64/boot/dts/renesas/r9a08g045.dtsi | 1 +
 arch/arm64/boot/dts/renesas/r9a09g047.dtsi | 1 +
 arch/arm64/boot/dts/renesas/r9a09g056.dtsi | 1 +
 arch/arm64/boot/dts/renesas/r9a09g057.dtsi | 1 +
 7 files changed, 7 insertions(+)

diff --git a/arch/arm64/boot/dts/renesas/r9a07g043.dtsi b/arch/arm64/boot/dts/renesas/r9a07g043.dtsi
index 593c66b27ad1..ded4f1f11d60 100644
--- a/arch/arm64/boot/dts/renesas/r9a07g043.dtsi
+++ b/arch/arm64/boot/dts/renesas/r9a07g043.dtsi
@@ -604,6 +604,7 @@ pinctrl: pinctrl@11030000 {
 			resets = <&cpg R9A07G043_GPIO_RSTN>,
 				 <&cpg R9A07G043_GPIO_PORT_RESETN>,
 				 <&cpg R9A07G043_GPIO_SPARE_RESETN>;
+			reset-names = "rstn", "port", "spare";
 		};
 
 		dmac: dma-controller@11820000 {
diff --git a/arch/arm64/boot/dts/renesas/r9a07g044.dtsi b/arch/arm64/boot/dts/renesas/r9a07g044.dtsi
index 29273da81995..cb0c9550aa03 100644
--- a/arch/arm64/boot/dts/renesas/r9a07g044.dtsi
+++ b/arch/arm64/boot/dts/renesas/r9a07g044.dtsi
@@ -1017,6 +1017,7 @@ pinctrl: pinctrl@11030000 {
 			resets = <&cpg R9A07G044_GPIO_RSTN>,
 				 <&cpg R9A07G044_GPIO_PORT_RESETN>,
 				 <&cpg R9A07G044_GPIO_SPARE_RESETN>;
+			reset-names = "rstn", "port", "spare";
 		};
 
 		irqc: interrupt-controller@110a0000 {
diff --git a/arch/arm64/boot/dts/renesas/r9a07g054.dtsi b/arch/arm64/boot/dts/renesas/r9a07g054.dtsi
index 0dee48c4f1e4..7a3e5b6a685f 100644
--- a/arch/arm64/boot/dts/renesas/r9a07g054.dtsi
+++ b/arch/arm64/boot/dts/renesas/r9a07g054.dtsi
@@ -1025,6 +1025,7 @@ pinctrl: pinctrl@11030000 {
 			resets = <&cpg R9A07G054_GPIO_RSTN>,
 				 <&cpg R9A07G054_GPIO_PORT_RESETN>,
 				 <&cpg R9A07G054_GPIO_SPARE_RESETN>;
+			reset-names = "rstn", "port", "spare";
 		};
 
 		irqc: interrupt-controller@110a0000 {
diff --git a/arch/arm64/boot/dts/renesas/r9a08g045.dtsi b/arch/arm64/boot/dts/renesas/r9a08g045.dtsi
index 997e6cf0bb82..3a69bb246bab 100644
--- a/arch/arm64/boot/dts/renesas/r9a08g045.dtsi
+++ b/arch/arm64/boot/dts/renesas/r9a08g045.dtsi
@@ -533,6 +533,7 @@ pinctrl: pinctrl@11030000 {
 			resets = <&cpg R9A08G045_GPIO_RSTN>,
 				 <&cpg R9A08G045_GPIO_PORT_RESETN>,
 				 <&cpg R9A08G045_GPIO_SPARE_RESETN>;
+			reset-names = "rstn", "port", "spare";
 		};
 
 		irqc: interrupt-controller@11050000 {
diff --git a/arch/arm64/boot/dts/renesas/r9a09g047.dtsi b/arch/arm64/boot/dts/renesas/r9a09g047.dtsi
index 2eccaa7ed1c5..5499cd969efe 100644
--- a/arch/arm64/boot/dts/renesas/r9a09g047.dtsi
+++ b/arch/arm64/boot/dts/renesas/r9a09g047.dtsi
@@ -265,6 +265,7 @@ pinctrl: pinctrl@10410000 {
 			interrupt-parent = <&icu>;
 			power-domains = <&cpg>;
 			resets = <&cpg 0xa5>, <&cpg 0xa6>;
+			reset-names = "main", "error";
 		};
 
 		cpg: clock-controller@10420000 {
diff --git a/arch/arm64/boot/dts/renesas/r9a09g056.dtsi b/arch/arm64/boot/dts/renesas/r9a09g056.dtsi
index 9192c5bf7e59..ab3aeb599137 100644
--- a/arch/arm64/boot/dts/renesas/r9a09g056.dtsi
+++ b/arch/arm64/boot/dts/renesas/r9a09g056.dtsi
@@ -288,6 +288,7 @@ pinctrl: pinctrl@10410000 {
 			gpio-ranges = <&pinctrl 0 0 96>;
 			power-domains = <&cpg>;
 			resets = <&cpg 0xa5>, <&cpg 0xa6>;
+			reset-names = "main", "error";
 		};
 
 		cpg: clock-controller@10420000 {
diff --git a/arch/arm64/boot/dts/renesas/r9a09g057.dtsi b/arch/arm64/boot/dts/renesas/r9a09g057.dtsi
index 9581af58024e..88fc7379b109 100644
--- a/arch/arm64/boot/dts/renesas/r9a09g057.dtsi
+++ b/arch/arm64/boot/dts/renesas/r9a09g057.dtsi
@@ -270,6 +270,7 @@ pinctrl: pinctrl@10410000 {
 			interrupt-parent = <&icu>;
 			power-domains = <&cpg>;
 			resets = <&cpg 0xa5>, <&cpg 0xa6>;
+			reset-names = "main", "error";
 		};
 
 		cpg: clock-controller@10420000 {
-- 
2.43.0


