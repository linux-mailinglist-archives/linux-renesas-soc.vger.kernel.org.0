Return-Path: <linux-renesas-soc+bounces-28740-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 0EwgGNFvp2kFhgAAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-28740-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 04 Mar 2026 00:33:37 +0100
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 1FB7F1F8655
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 04 Mar 2026 00:33:37 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id ADB93305C3D8
	for <lists+linux-renesas-soc@lfdr.de>; Tue,  3 Mar 2026 23:33:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 00DEE35F5F3;
	Tue,  3 Mar 2026 23:33:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="fl7sf4gf"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 21D103537CA
	for <linux-renesas-soc@vger.kernel.org>; Tue,  3 Mar 2026 23:33:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772580806; cv=none; b=D9h2mLYlYas00GDX6du7Pup/IuOLRR3i8HIjig8NlPh2roEKZJcnK0v4Kg2TQLa0bsRvcCDWItu/xZLQrecTSPDpcR/kiPQSFHaJFhpRtrEk5scN7WHtKlAI/nCDsSw0tTJGa9LU6lYAnxxRReeTgNWXWicgm8Svzk7st87XhdM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772580806; c=relaxed/simple;
	bh=DzxA5HOVJC1lWCS3Zn0b5fckp0DX81RLCALuVVhdd2Y=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=r78/Rkm0J5FlFSyTdEoLGXmNypXJrlnbXeMm4ngESUQnv6ZgGwFn5fauhL4Dsc90o+5UAGtpxLx6V0be4qNgAKgx4Oc7clQoUjWXJDbVbWjTRiJ5D0sNyYMUK4S3c5mxTy4VTioHBJS2/VO2FqKEmeQ3gTeoCdxYWmTa889ZXZA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=fl7sf4gf; arc=none smtp.client-ip=209.85.128.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-48329eb96a7so42087595e9.3
        for <linux-renesas-soc@vger.kernel.org>; Tue, 03 Mar 2026 15:33:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1772580802; x=1773185602; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Oh+3G+7bH2ZmJrkS0IlH5a5mfzrOQ8n1ijjIvSM2a30=;
        b=fl7sf4gfmMkMmZe//KyLQrSqbW4su5lIw+ufBneTtFMlfJ3aYg5yIJI9Nim5l1xWAT
         KQGT1px4ayROHBRA+JYqlQLeOfQWcRo6SIWFsCFaE1eIklhmIkerX+pHYUqslqyARybD
         0ANx6AE7smadoZQscWm0Ka4mjQj6xHa4wxGaCqHYHoolvbKZdHMH5Fuw/nQ14Sej6c0c
         u7Taz01FLvWyKzFge7/DdWOPp/VxFq9SQiZImKvryP8oStwyB3ObAeLWVkJJO52LDrvG
         Wdffu2412GqzeYib8m4ffatNCxbuiYOZMSWunrbS/h1/hnvL4WCHMxtQTgpvjiKvS1/v
         MdmA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772580802; x=1773185602;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=Oh+3G+7bH2ZmJrkS0IlH5a5mfzrOQ8n1ijjIvSM2a30=;
        b=neYqpdrRarJgW8CsawU8rNBrFNi/wSd+SUuwo4tiAs6OiFt3yHTJSiHq0qQ7mmbsXA
         GFbB6oPD5QqCnvEl0XEZZC9aJtpXQu3WkzLVBJOAsQgOwrxe709vEVDOza+ROMHfzMm2
         1USAXIfJrBimyvnqIY3bNeYIa6l44+kzQYvrgG0ci9yD0TwDJwc6ViRUEF3KvZSPV9dh
         gIfAJpNCtVZWeumc7Su9Y45XSb2Om58zsIx/YRTMPYRbZ6WdY57dJSSPdiabe0jQFaje
         cgi1v1hljDZNY0amFRBxDNubRpPw6POFV0dQsDCAJOar7869Go47PQNhafp+eiXwkoh6
         Iv0g==
X-Gm-Message-State: AOJu0YyS0GndTYngvUPjLahpYwJzRo8TJV3EB4GRu4c2eswR7FOIueQm
	jQEcqQ51lSTxWPeCvPU4WpY3/CgSr3igl6jjZKeQR8dt9wzwJdyd4RD4zSTYoGjmFKU=
X-Gm-Gg: ATEYQzypmQiSDnz8muaVds7bO+PZGv48hgX5YRhLrcUuJQtBRR0C80ntnHEcpfq8Zed
	mLBtMr473oPFRiOcmFL1/WvJUsWSSjzN8DJPQC2zTYRctrVHp2WhMx0r37+i799y8mQuFreXBlm
	4+s3tEnP70ag6S1pOLOkb54A9dslCCq/0VkjlDFMgadkSRcVqDwge85r3e9OT74BLXcBJPcYwcz
	etO8U4ksdcBktp7icimXIaaQTrdjrjt1TYcDXEdF5y3nPjhGbfrPep/WkHsZxxH01Lbr1C7RV0G
	rWoCAZ5qxhNCSZnyVZKmL/aiN6iRNQ7xfP9cDV076jC7v7FaJxTPl2QOZLvJKj6ELSA3PwdCw39
	lr2E5bWinCnEuwsOyJQE3QaiXQKTDENXhsCvpQJ7hDPxs8WD/2RU4AWJzo9YTIr5wRhcCnrlnqV
	gYbphXH6Q9bJcTP+kryy9OaMMgmEWgtA/f/b8LUyNuAKlXxgFDtUx9TpI5cCCDmiMxJpWGgRyKs
	nfmfVewpHk+OKYd7hJHekEqtrx9YHH5xRYGqg==
X-Received: by 2002:a05:600c:8b25:b0:480:1b1a:5526 with SMTP id 5b1f17b1804b1-48519874e40mr789395e9.16.1772580802470;
        Tue, 03 Mar 2026 15:33:22 -0800 (PST)
Received: from iku.Home ([2a06:5906:61b:2d00:30fa:3523:429c:2894])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-485126705e5sm26188185e9.5.2026.03.03.15.33.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Mar 2026 15:33:22 -0800 (PST)
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
Subject: [PATCH v2 1/2] arm64: dts: renesas: r9a09g056: Add DMA support for RSPI channels
Date: Tue,  3 Mar 2026 23:33:13 +0000
Message-ID: <20260303233314.2928711-2-prabhakar.mahadev-lad.rj@bp.renesas.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260303233314.2928711-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
References: <20260303233314.2928711-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Queue-Id: 1FB7F1F8655
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20230601];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-28740-lists,linux-renesas-soc=lfdr.de];
	FREEMAIL_FROM(0.00)[gmail.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_TO(0.00)[glider.be,gmail.com,kernel.org];
	RCPT_COUNT_TWELVE(0.00)[12];
	FREEMAIL_CC(0.00)[vger.kernel.org,gmail.com,bp.renesas.com,renesas.com];
	MIME_TRACE(0.00)[0:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[renesas.com:email,bp.renesas.com:mid,0.195.81.144:email,0.195.80.0:email,0.195.83.32:email,tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo]
X-Rspamd-Action: no action

From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>

Enable DMA support for RSPI channels.

Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
---
v1->v2:
- Added all the possible DMA channels
---
 arch/arm64/boot/dts/renesas/r9a09g056.dtsi | 21 +++++++++++++++++++++
 1 file changed, 21 insertions(+)

diff --git a/arch/arm64/boot/dts/renesas/r9a09g056.dtsi b/arch/arm64/boot/dts/renesas/r9a09g056.dtsi
index 494f0e5a83ab..9192c5bf7e59 100644
--- a/arch/arm64/boot/dts/renesas/r9a09g056.dtsi
+++ b/arch/arm64/boot/dts/renesas/r9a09g056.dtsi
@@ -784,6 +784,13 @@ rspi0: spi@12800000 {
 			clock-names = "pclk", "pclk_sfr", "tclk";
 			resets = <&cpg 0x7b>, <&cpg 0x7c>;
 			reset-names = "presetn", "tresetn";
+			dmas = <&dmac0 0x448c>, <&dmac0 0x448d>,
+			       <&dmac1 0x448c>, <&dmac1 0x448d>,
+			       <&dmac2 0x448c>, <&dmac2 0x448d>,
+			       <&dmac3 0x448c>, <&dmac3 0x448d>,
+			       <&dmac4 0x448c>, <&dmac4 0x448d>;
+			dma-names = "rx", "tx", "rx", "tx", "rx",
+				    "tx", "rx", "tx", "rx", "tx";
 			power-domains = <&cpg>;
 			#address-cells = <1>;
 			#size-cells = <0>;
@@ -805,6 +812,13 @@ rspi1: spi@12800400 {
 			clock-names = "pclk", "pclk_sfr", "tclk";
 			resets = <&cpg 0x7d>, <&cpg 0x7e>;
 			reset-names = "presetn", "tresetn";
+			dmas = <&dmac0 0x448e>, <&dmac0 0x448f>,
+			       <&dmac1 0x448e>, <&dmac1 0x448f>,
+			       <&dmac2 0x448e>, <&dmac2 0x448f>,
+			       <&dmac3 0x448e>, <&dmac3 0x448f>,
+			       <&dmac4 0x448e>, <&dmac4 0x448f>;
+			dma-names = "rx", "tx", "rx", "tx", "rx",
+				    "tx", "rx", "tx", "rx", "tx";
 			power-domains = <&cpg>;
 			#address-cells = <1>;
 			#size-cells = <0>;
@@ -826,6 +840,13 @@ rspi2: spi@12800800 {
 			clock-names = "pclk", "pclk_sfr", "tclk";
 			resets = <&cpg 0x7f>, <&cpg 0x80>;
 			reset-names = "presetn", "tresetn";
+			dmas = <&dmac0 0x4490>, <&dmac0 0x4491>,
+			       <&dmac1 0x4490>, <&dmac1 0x4491>,
+			       <&dmac2 0x4490>, <&dmac2 0x4491>,
+			       <&dmac3 0x4490>, <&dmac3 0x4491>,
+			       <&dmac4 0x4490>, <&dmac4 0x4491>;
+			dma-names = "rx", "tx", "rx", "tx", "rx",
+				    "tx", "rx", "tx", "rx", "tx";
 			power-domains = <&cpg>;
 			#address-cells = <1>;
 			#size-cells = <0>;
-- 
2.53.0


