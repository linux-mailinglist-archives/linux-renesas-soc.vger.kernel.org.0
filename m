Return-Path: <linux-renesas-soc+bounces-27817-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id AJs2C97sgWkFMAMAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-27817-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 03 Feb 2026 13:41:02 +0100
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 7ED8DD9210
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 03 Feb 2026 13:41:01 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 0C16730DB011
	for <lists+linux-renesas-soc@lfdr.de>; Tue,  3 Feb 2026 12:35:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D9821345CD9;
	Tue,  3 Feb 2026 12:35:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="HvakYn8W"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3DB5B344DA7
	for <linux-renesas-soc@vger.kernel.org>; Tue,  3 Feb 2026 12:35:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770122113; cv=none; b=mZA23UgxmhNyC2qz6EnvNC/ZWBD3Tit9phAOufCX2qdK+1r823w193tTWfiBGba/pWlbVD3Sjt1l+O6f4Scw3QX7AkKppUEjm1Jnxsg4pSslpJ+npc9pso2Hyq8rnmT3a2ixgfeRzSDb4VR0bTdqCaIkkyfGmsmvHQyqRVZG/0Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770122113; c=relaxed/simple;
	bh=RorSjLaX7pGdqqpN+C9wX6wNwfenUgYC9F7+I9hWWyk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=REoQIgCfMzMSTWESfg5c9Rqbpmb4szlL5bfGRf5HYmI63JSoBlqe6w4hGvSJyzLFe5BNugFbl78Lj1sQa3vZTMVEGZMb8TutgeR02RMuBPdH73V5+5NJR8vDl58XX9ZesJhEG4eq+/LKJcfYZRypibI/M5LQqeyUMIj+s3MFOkM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=HvakYn8W; arc=none smtp.client-ip=209.85.128.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-48068ed1eccso51503145e9.2
        for <linux-renesas-soc@vger.kernel.org>; Tue, 03 Feb 2026 04:35:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1770122110; x=1770726910; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=9zafmNs4nVxr2+zuOn1Q4Qxj0agj57LaZX3rnIZfZm0=;
        b=HvakYn8WkyW4cC2he7w/yXaJVn+C4C8qm93eKUudBtGAe8MkhA8Z1riBOWHHUwmjlz
         BQ1P1LINxCJsUG59t0/qA8c3JoKtQ313ZJ0BSQo4TF7mYUaFbT4grQgvtreLCytmnVXB
         O5Lcs17VYT+A2UtgVFpSDbBQx/mhD41kEkoiNdrMowmr07JDGM51KCYxBbFTRFhxiR0Y
         tEwSIkbxxdxbSUIyqJpRx7SMogUeyO4ZZKwg3HI6i+vUzmPL5QGhkCWg/AO9GBsK4QRB
         bfrjhuaD2jyfLs72piIWYIVQoJhY2RDr3p++sWfA8jd28n2Rf1tEoOW889E7d5Qh840b
         nOfA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770122110; x=1770726910;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=9zafmNs4nVxr2+zuOn1Q4Qxj0agj57LaZX3rnIZfZm0=;
        b=hy8juAEAvnE/YbJ71+Q/p62YM7M93YvxchLBS4USjZ6IKx4z9eSZhmth1o3PWDcTZh
         Z/GDs3Evpsw7FW1MMvojbIDxHpdP47RSDci8WOfbD3K5IhHHTEg6JHR1/Pvo4T00giBy
         QE1Mz0zg60OtzqzY0jFLa3pVA3kA9jXTb65fEh7YB4Hjt+wlWfonB9uPPHJjudggepMq
         SxiOvqUze8Wcv0oARefU3TgeAdfKY2SH/E9mcpRji0JjCCPhlVU7gAtGVR2ouGCGzLLr
         Yb1Ce6Gnnl44YURO4DufANOuA1x7hf77G2TlGcZas67L+ilA6QR11OmLEkwcasQdxzMA
         uzmA==
X-Forwarded-Encrypted: i=1; AJvYcCWv8FwzTiy9kHBrgkDKKamJ8XUmls4QuPmvPSXIjNjwibCKrKjsfvK67GxBMtlb4w5nisiOkZHdMeMD25wusHblFQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YzwgDz48Tt/qP/wTfVs1d1IPghi/ErcdzPgNgkmd0zT5teTmeqR
	YT9AOCLJijNTS4rWzwLcCVUW/cqlIiXUuiXpgm5dgnZa+u4xZrrEs4O0
X-Gm-Gg: AZuq6aJo1dg5xb7tZFIFz9VLFK6/BEuYIW5wQoK0jtG3MeK+1IepHzwbOKKIops2TMU
	glPMux3ecePyGTHWHOfZgXxFBRflJTpjdyC3MK7L3D0SyoCVYqACgQgoU1CMERbDVsxLsYcRFRL
	GMiNNR1f8AnNtxydAr6Mo+dGStQgrrMvZP2VOc0aZaygSeipj2qKLsC6VZmJg1fIPmjGm2hw52w
	QGBlXK4ckwHJevHA7n5QiNdmcQaG6fnj32hP+XGXPQYnQDByq5FeuO+47gfNiRoYeoOoWSqnO7f
	ohk5mBvSDk6TFoq4HDPMWjhHH7V71p4PYvPeNYfsQakO0g69SrrAWNFuF0LjqtA4R0Id34/hIe1
	AxQGOSxQnEdda+q1vkcvmzQ8Y7ys9QzFPoAMG+2ivdEBLC48gE/YUk//uzqf6pyQoVPE1rCR40X
	a5GJkEimz+uA0y8dV69w==
X-Received: by 2002:a05:600c:6206:b0:477:b0b9:3129 with SMTP id 5b1f17b1804b1-482db44d215mr218506605e9.3.1770122110349;
        Tue, 03 Feb 2026 04:35:10 -0800 (PST)
Received: from biju.lan ([2a00:23c4:a758:8a01:9cd9:f748:166d:55fc])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-483051379c4sm60618205e9.15.2026.02.03.04.35.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Feb 2026 04:35:08 -0800 (PST)
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
Subject: [PATCH v2 2/2] arm64: dts: renesas: rzg3l-smarc-som: Enable eth0 (GBETH0) interface
Date: Tue,  3 Feb 2026 12:35:00 +0000
Message-ID: <20260203123503.314755-3-biju.das.jz@bp.renesas.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260203123503.314755-1-biju.das.jz@bp.renesas.com>
References: <20260203123503.314755-1-biju.das.jz@bp.renesas.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_MISSING_CHARSET(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20230601];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-27817-lists,linux-renesas-soc=lfdr.de];
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
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_COUNT_FIVE(0.00)[5];
	DKIM_TRACE(0.00)[gmail.com:+];
	TAGGED_RCPT(0.00)[linux-renesas-soc,renesas,dt];
	FREEMAIL_FROM(0.00)[gmail.com];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[0.0.0.7:email,renesas.com:email,bp.renesas.com:mid,2.220.108.0:email,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 7ED8DD9210
X-Rspamd-Action: no action

From: Biju Das <biju.das.jz@bp.renesas.com>

Enable the Gigabit Ethernet Interfaces (GBETH0) populated on the RZ/G3L
SMARC EVK. The eth1, pincontrol definitions and hotplug support will be
added later.

Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
---
v1->v2:
 * No change
---
 .../boot/dts/renesas/rzg3l-smarc-som.dtsi     | 35 +++++++++++++++++++
 1 file changed, 35 insertions(+)

diff --git a/arch/arm64/boot/dts/renesas/rzg3l-smarc-som.dtsi b/arch/arm64/boot/dts/renesas/rzg3l-smarc-som.dtsi
index 7c21afaee9bc..f52af01a7eff 100644
--- a/arch/arm64/boot/dts/renesas/rzg3l-smarc-som.dtsi
+++ b/arch/arm64/boot/dts/renesas/rzg3l-smarc-som.dtsi
@@ -8,6 +8,10 @@
 / {
 	compatible = "renesas,rzg3l-smarcm", "renesas,r9a08g046l48", "renesas,r9a08g046";
 
+	aliases {
+		ethernet0 = &eth0;
+	};
+
 	memory@48000000 {
 		device_type = "memory";
 		/* First 128MB is reserved for secure area. */
@@ -15,6 +19,37 @@ memory@48000000 {
 	};
 };
 
+&eth0 {
+	phy-handle = <&phy0>;
+	phy-mode = "rgmii-id";
+
+	status = "okay";
+};
+
+&eth0_rxc_rx_clk {
+	clock-frequency = <125000000>;
+};
+
 &extal_clk {
 	clock-frequency = <24000000>;
 };
+
+&mdio0 {
+	phy0: ethernet-phy@7 {
+		compatible = "ethernet-phy-id0022.1640",
+			     "ethernet-phy-ieee802.3-c22";
+		reg = <7>;
+		rxc-skew-psec = <1400>;
+		txc-skew-psec = <1400>;
+		rxdv-skew-psec = <0>;
+		txdv-skew-psec = <0>;
+		rxd0-skew-psec = <0>;
+		rxd1-skew-psec = <0>;
+		rxd2-skew-psec = <0>;
+		rxd3-skew-psec = <0>;
+		txd0-skew-psec = <0>;
+		txd1-skew-psec = <0>;
+		txd2-skew-psec = <0>;
+		txd3-skew-psec = <0>;
+	};
+};
-- 
2.43.0


