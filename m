Return-Path: <linux-renesas-soc+bounces-32804-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 2LbbDRVIDGprdAUAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-32804-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 19 May 2026 13:23:01 +0200
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id EF43757D7E4
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 19 May 2026 13:23:00 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id B10393028B4D
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 19 May 2026 11:20:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4BDCF3C4B81;
	Tue, 19 May 2026 11:20:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="S7Y7qjkj"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BE29849218B
	for <linux-renesas-soc@vger.kernel.org>; Tue, 19 May 2026 11:20:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779189606; cv=none; b=jZ3kWTDNf8qxR3PESkGey4ljq2PbYAx+ADVCup7Fgpiwmi99jo0z/DGApXZI+0faB1X9kG2EmF89nHK3g0Zf9I9UTqSe6s2eN/RbPepKPkv63N6+eEMt/RPRDL0/xFJn38wWq/7ReSepKNltO6gYuf8oposmNk2EK1/Pxa9K+64=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779189606; c=relaxed/simple;
	bh=Dl7uP6sMy4Y5E1aSHV8CCjm79ZIYkee/mZXdcp84aTE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=eqNk7JkokRnib2V76h6f+shNlpBr+9CmSKNIsbsU1bpBPCVi68ZUuPQjp8qhzYNulLH7eaJy2kMZZw1FVsJFxphMELzjCEgqxTbN8KQXW62nv8YHtqvH8Lu9timsvP6m2cqPkxmHl7HAQErQy1m/Wh/Sc4EVMs55vrJIy7a66yA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=S7Y7qjkj; arc=none smtp.client-ip=209.85.128.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-48909558b3aso36241135e9.0
        for <linux-renesas-soc@vger.kernel.org>; Tue, 19 May 2026 04:20:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779189603; x=1779794403; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=7r1fGlnqMtLmqRZgghcpUpURLRsPg5qGSam8KHLk6Zc=;
        b=S7Y7qjkjFUq0uJLeluu2jGVBJlIBkiOQx1o79eRLG6vwluGsQU44ceAT5zKGL+BUtv
         0RTY2Tzi9jFLru/GbTZ3td0n64uXgyEZviWG/Rcl+R3NBZWQ3IXnef361U1OsWZ7YJf8
         hRedSDxs3Y/g8sOSWWhAPB2+DIfq6zWGOVdQTfb9aSCORSaPN7Mlf4JBzx9VbstmG5tV
         GGps3oK3bkA2xR8Dy8JtFsoul8A2aynRN4CKBFUE74OvW4goavTjKlirQeQzKpSs/shL
         qgJOAcLNMkhsh9mSjTLaFsyV/ItuK5RTUUHItb7b2qrLAv2wyWq8NXYPzoz02PbgFvjs
         b9hg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779189603; x=1779794403;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=7r1fGlnqMtLmqRZgghcpUpURLRsPg5qGSam8KHLk6Zc=;
        b=g8R3pnWUXiY2VL3RaMfcK0ht87E2ZZWZ+AoTgQs4s6qIdPSz/k74icI6Fn58ubURxS
         YHsrSFKr/zSE79yUFUDf0xRgvthbWjx4Igs5cqlhbbtGDH3eP+o2QTHz4dnuk+ZGcFNK
         B4GBKF4/jBhaSisuvPn00Tu2IdoUJ1FSfjb5g2v6F2tCUGuPS65IlO3ya0O537XTvFhU
         q1fwbsLShqChWlE/XMH8wkuYDGRzt79XbQKhG3k0BaUiNUmOwCUTY8Rbk9ASwDukKS7v
         ZUerzn+V7JFs9pgsMFm9Ufzg4XY2af2yq5kEnCULPxgnPlRkZDbM153rgqc7hIUTsG/o
         XuJA==
X-Forwarded-Encrypted: i=1; AFNElJ+Kbl8BIhsJSL8Uvt9tKbi0t79HQWRCGzwzHWP6vUFFvW4332cp75Q3dRwUdHilgr7b+V+m241oVLAFf8aFRku5WQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YwSYI0X8xGtXGF2fN8E1edLCC2CjOIec6cxX85bTbkMyCO4WrgX
	cJ8ZDIxAkc6xSVklvwMXrzmOu4HjSVDPB0XZClVpBV6c5k1XTNyGXD7n
X-Gm-Gg: Acq92OFDcGJsEjz+1QcIEsqQhSJxatU1BnlnNSOGCTKEs9BcXkDiuYk6szE2o57RzmI
	jkN/Eft7C86jUlAvTALiUknBvuqIcXFatVUqbA6lRRf/IHWc3pWhOg6RAuY4/L3OXXrop03BhJE
	JepRfG4Isbuiz8OSCpCYPyPHLpDSCr6ge5S3aw295GsK/TVZKNFCcqxo5EMO4asuy0642np2dR9
	wgb0cQZz6TzwUflBTDQdBpavndkoZwyv5nnDzz5ho3UVf5/u4fJePhQz2rnMfnk1DbK3kCr6qpd
	zl7tRbB9ZN/UJwQG1acrBz+2sC8Bn89XHBpUbN1M483zHe8BR5BAphxNQ/bp9+z1dhIXAN81aUG
	G59nwTUKSKWA/aGHzi0Ut1UgjohoD3YjaRY1ClrtkBSuilD3+mqAPC0N42T6ia/0ERl+pEyeHQS
	OkhpL/VzLKDtJt7rFvOI1XT2wH40U555uCkEynjEK2v5zXNtHy
X-Received: by 2002:a05:600c:c087:b0:48d:c0a:3813 with SMTP id 5b1f17b1804b1-48fe60de6a7mr236756825e9.3.1779189602901;
        Tue, 19 May 2026 04:20:02 -0700 (PDT)
Received: from localhost.localdomain ([2a00:23c4:a700:7301:4abf:a82a:41d5:6663])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-45da15a6454sm46066323f8f.34.2026.05.19.04.20.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 19 May 2026 04:20:02 -0700 (PDT)
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
Subject: [PATCH 2/2] arm64: dts: renesas: r9a08g046l48-smarc: Enable RSPI2
Date: Tue, 19 May 2026 12:19:54 +0100
Message-ID: <20260519111958.233194-3-biju.das.jz@bp.renesas.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260519111958.233194-1-biju.das.jz@bp.renesas.com>
References: <20260519111958.233194-1-biju.das.jz@bp.renesas.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-32804-lists,linux-renesas-soc=lfdr.de];
	FREEMAIL_CC(0.00)[bp.renesas.com,vger.kernel.org,gmail.com];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_TO(0.00)[glider.be,gmail.com,kernel.org];
	DKIM_TRACE(0.00)[gmail.com:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	FREEMAIL_FROM(0.00)[gmail.com];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[bijudasau@gmail.com,linux-renesas-soc@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	TAGGED_RCPT(0.00)[linux-renesas-soc,renesas,dt];
	RCPT_COUNT_SEVEN(0.00)[11];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:rdns,sto.lore.kernel.org:helo,bp.renesas.com:mid,renesas.com:email]
X-Rspamd-Queue-Id: EF43757D7E4
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

From: Biju Das <biju.das.jz@bp.renesas.com>

Enable RSPI2 on the RZ/G3L SMARC EVK board by adding pin control
configuration and activating the rspi2 node.

The RSPI2 pins are shared with the DPI display interface and the
two cannot be used simultaneously and it is controlled by a switch
SW_DPI_EN.

Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
---
 .../boot/dts/renesas/r9a08g046l48-smarc.dts   | 19 +++++++++++++++++++
 1 file changed, 19 insertions(+)

diff --git a/arch/arm64/boot/dts/renesas/r9a08g046l48-smarc.dts b/arch/arm64/boot/dts/renesas/r9a08g046l48-smarc.dts
index ccc0decd89ab..3e3028b88f22 100644
--- a/arch/arm64/boot/dts/renesas/r9a08g046l48-smarc.dts
+++ b/arch/arm64/boot/dts/renesas/r9a08g046l48-smarc.dts
@@ -162,6 +162,14 @@ rsci3_pins: rsci3 {
 		power-source = <1800>;
 	};
 
+	rspi2_pins: rspi2 {
+		pinmux = <RZG3L_PORT_PINMUX(6, 0, 2)>, /* RSPI2_MISO */
+			 <RZG3L_PORT_PINMUX(6, 1, 2)>, /* RSPI2_MOSI */
+			 <RZG3L_PORT_PINMUX(6, 2, 2)>, /* RSPI2_SCK */
+			 <RZG3L_PORT_PINMUX(6, 3, 2)>; /* RSPI2_SSLA */
+			 power-source = <1800>;
+	};
+
 	scif0_pins: scif0 {
 		pins = "SCIF0_TXD", "SCIF0_RXD";
 		power-source = <1800>;
@@ -222,3 +230,14 @@ &ssi0 {
 	status = "okay";
 };
 #endif
+
+#if !SW_DPI_EN
+&rspi2 {
+	pinctrl-0 = <&rspi2_pins>;
+	pinctrl-names = "default";
+	#address-cells = <1>;
+	#size-cells = <0>;
+
+	status = "okay";
+};
+#endif
-- 
2.43.0


