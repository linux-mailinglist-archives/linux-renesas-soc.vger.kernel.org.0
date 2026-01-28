Return-Path: <linux-renesas-soc+bounces-27528-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id aKKuCkYIemkK2AEAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-27528-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 28 Jan 2026 13:59:50 +0100
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id B7D7BA1B75
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 28 Jan 2026 13:59:48 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 7A8E4300E19B
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 28 Jan 2026 12:59:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C4B37353EE5;
	Wed, 28 Jan 2026 12:59:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Q5hIsRVY"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-ej1-f45.google.com (mail-ej1-f45.google.com [209.85.218.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4AD7D352F82
	for <linux-renesas-soc@vger.kernel.org>; Wed, 28 Jan 2026 12:59:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769605144; cv=none; b=eP32pSW+cvLzizcffGYXwjAsSn4NJvJ7k52m34Tn6AfTnPKyYMwuYNB7LIa3q1opnVB+/lMwFfRfXTU02f5nUiDjE6WBLzYe65ndxfN0yf98F5UM1bBtI/vaSvlu4FUrJ6nwf2vCOGz9oZocr0XaHqYnO1tdX3p070sjooQpEDI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769605144; c=relaxed/simple;
	bh=mPHNzkdxhQ0WZ5DkwNm0IQdgUJMl+Fmoru7kIZpRwNE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Mr2ytxkoskNu2fT2VbuNmQNIh0QLhv9AVSt/HNP5Tx9pOmNy6VLhzlpLm8raQ+wdqmet3sabw9HHzSh18nUZp6fIF5wzjdTczNnIfsfoYhpIfkbNAw8CfIv59lgyZBMfb55WZdzaBLwcps40Yh5ocAcwvQdzPVlR/okAn5NuYs0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Q5hIsRVY; arc=none smtp.client-ip=209.85.218.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ej1-f45.google.com with SMTP id a640c23a62f3a-b8871718b05so877272566b.2
        for <linux-renesas-soc@vger.kernel.org>; Wed, 28 Jan 2026 04:59:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1769605140; x=1770209940; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=XThvwv1ifJ0OiZooeSbPvbfs+lFNOOjD5GuZJh0mNdM=;
        b=Q5hIsRVYfsbZoJ01FRZ8o4bE097UIsi8llSjTXyEkk8VYtSHgEwAJR9aGwN2QmlctS
         eNTIh9+aySbCfWOC3kg2C7bfl1McgX7+YHgSPWaKdj747oZ7Zv1U8lQZFfTbO/rG/H5q
         reSCj5Jb6ZO2VW9NYhnUl/9lRdRtt9zOHJdDiK5kP8U1qcrfK5iT1Cgr34N5YtayIMua
         T+uY728PfFShuq37neWL/Mr5x/KAHny6vRalxBLDqtWOhbaI+wXyVoFWK8UmevIRKm/l
         1NB+/55Jen9QeXyJZDZeaQc2iKipWW7/gh649LUBUGrMzS3KCYex9+D5fDNcYvTT0pQy
         fbxw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769605140; x=1770209940;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=XThvwv1ifJ0OiZooeSbPvbfs+lFNOOjD5GuZJh0mNdM=;
        b=DG8vJIDCZq3P9/4C0qY5cfD68gvutKYmm8bMvzOSvUKimkkb8NVJBaXI3YUItZn1BT
         a2htWGTb8N3YK0AZTJjW0wvq1ETqcxIwVlCD404LeZ59TgA+LrIpFM9rY0/ACTsjqiiB
         u/GMomwGQp/tiSxA41QnaySA6tm9pq5js4Vj2xDfDKIqrl5cchlraGycDeQs/hHb69N3
         MhCvczJTIBlaktHIkD14CUs5AuuYnpjq4FT/tESNGjwzvrlgBHpAdYJGgxf3KBVwpPjl
         kYCh2uJaDmgrL9qh0vEYkC2pCTrFbnh/wsQErMjgr17JG/Ri2gwZf/CoYf2ehO9QTz8l
         M/Uw==
X-Forwarded-Encrypted: i=1; AJvYcCUySh0HlIXiVVmJRBR/AH3rPGZjZdN7Qhcmcy3J4W6WP2E+C3Qr16PLWwxX84PZljHMZvm6maPiUchUg6EgDH7kVQ==@vger.kernel.org
X-Gm-Message-State: AOJu0Yy3P7Z0lIcFkHKq5GtdiOJVOfNU2bo7rD3Nc3OWk0TYjmLDdzJY
	V2hJGIjlQcfrh8huzfGyjSJ0WJhOaZmzjJdXc8QA27VeoN9vfnKYqqul
X-Gm-Gg: AZuq6aJQr5qWKbPyWL39uM0sSRJQLeU9JGQnc5viYucfLRXuvRiyUBjVo2VvCHyYp/x
	iASpLNlQBeza/hzMRFo8MiDEGc0XknIMaQ8oUul0UxVmmJO/InnQpC7hiTTGHPYCO44VM4KARe6
	Wd2ie4fw7Gtk3A3GLk+AJSRjiDuq7GDCq1qZXVyOZR7SLWTBl9uFjl2u3oh4djh1RenSj8zlIzl
	zukDVRQiWbXwZQ378mdzH0xTos9TckAqylfAEux9pXr0KraXAFQDeRFge8QlUaSDZVrlVnkcefr
	wEd+iWHIULjhgIfaixIevFj67dYpBa78mop+8BtellFyOGVzE2v8V/aExWP1TaVUDc1sYa0u5OR
	V9VSw3w6lJ56WHz5bR1x4j0Zxt8t2gCm9bTWHppEcqMDsCsUh2G+6g90YYJBOLHCMhsof6Vgapb
	QF9Qta3p7QNNiHwMZEEGFPwp9KJs3ad4MEiX8=
X-Received: by 2002:a17:907:3f93:b0:b7c:f5b6:bb52 with SMTP id a640c23a62f3a-b8dab4455ddmr378624766b.43.1769605140120;
        Wed, 28 Jan 2026 04:59:00 -0800 (PST)
Received: from localhost.localdomain ([2a00:23c4:a758:8a01:e29d:6e0e:72c1:d15d])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b8dbf2f3e26sm123344966b.67.2026.01.28.04.58.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 28 Jan 2026 04:58:59 -0800 (PST)
From: Biju <biju.das.au@gmail.com>
X-Google-Original-From: Biju <biju.das.jz@bp.renesas.com>
To: Geert Uytterhoeven <geert+renesas@glider.be>,
	Magnus Damm <magnus.damm@gmail.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Richard Cochran <richardcochran@gmail.com>
Cc: Biju Das <biju.das.jz@bp.renesas.com>,
	linux-renesas-soc@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	netdev@vger.kernel.org,
	Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>,
	Biju Das <biju.das.au@gmail.com>
Subject: [PATCH net-next 8/8] arm64: dts: renesas: rzg3l-smarc-som: Enable eth0 (GBETH) interface
Date: Wed, 28 Jan 2026 12:58:45 +0000
Message-ID: <20260128125850.425264-9-biju.das.jz@bp.renesas.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260128125850.425264-1-biju.das.jz@bp.renesas.com>
References: <20260128125850.425264-1-biju.das.jz@bp.renesas.com>
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
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20230601];
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-27528-lists,linux-renesas-soc=lfdr.de];
	FREEMAIL_FROM(0.00)[gmail.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_TO(0.00)[glider.be,gmail.com,kernel.org];
	RCPT_COUNT_TWELVE(0.00)[13];
	FREEMAIL_CC(0.00)[bp.renesas.com,vger.kernel.org,gmail.com];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[bijudasau@gmail.com,linux-renesas-soc@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[gmail.com:+];
	RCVD_COUNT_FIVE(0.00)[5];
	TAGGED_RCPT(0.00)[linux-renesas-soc,renesas,dt];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns,bp.renesas.com:mid,2.220.108.0:email,0.0.0.7:email]
X-Rspamd-Queue-Id: B7D7BA1B75
X-Rspamd-Action: no action

From: Biju Das <biju.das.jz@bp.renesas.com>

Enable the Gigabit Ethernet Interfaces (GBETH) populated on the RZ/G3L
SMARC EVK. The eth1, pincontrol definitions and hotplug support will be
added later.

Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
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


