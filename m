Return-Path: <linux-renesas-soc+bounces-31231-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id AEEhEdrA3GkaWAkAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-31231-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 13 Apr 2026 12:09:30 +0200
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id 3FD743EA4D7
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 13 Apr 2026 12:09:29 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 5F74B30131BC
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 13 Apr 2026 10:08:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 740903A6EF4;
	Mon, 13 Apr 2026 10:07:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="oWZVwkjW"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-pf1-f171.google.com (mail-pf1-f171.google.com [209.85.210.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0CA89303CAB
	for <linux-renesas-soc@vger.kernel.org>; Mon, 13 Apr 2026 10:07:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776074873; cv=none; b=a+Q921T+ulQz8vDqFFHhVMy+UrjZFN9epSFQFUChmMFaapoS396OMI/SUjtXANUzou3FVFuCcd7wy8+skIRxDGI477rslUcBUVC+ui2/Mgq0J0+pBYPuKdZVXAe+8GvP0+kpLeqZ2tCNDSVq4PthqpZAp+hK94At7YmsifBl//c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776074873; c=relaxed/simple;
	bh=gbzCR/HLA/ONbOES45gBPkfZFyPZ1gKgW0aInfcMl0o=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Pd8riAdmoczKAv5ux61jUDUn8LkW8zan7T85Y7Ek6R8FTQX5BO4ven7y+L+btag4tXG2Fo44gw9rVLT+xiXroNcDiiZfNm/XwhfbVO3N7V0LodvXvOfZdmnz1DptnMiU6v2Fzym3bNYljn+kzIPTjHJHQIEDGKdsflhDAun4DDM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=oWZVwkjW; arc=none smtp.client-ip=209.85.210.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pf1-f171.google.com with SMTP id d2e1a72fcca58-82ce2e2880cso2784987b3a.0
        for <linux-renesas-soc@vger.kernel.org>; Mon, 13 Apr 2026 03:07:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1776074871; x=1776679671; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=L+tmudkXITzJHSYr4BUq79EkgThQNBRhbQCg3njXY7s=;
        b=oWZVwkjWBjynTA7MKyL7Q1FapKZKcnjORbSmOsLe8tcYcpj443RwZysljgLXb0rCQv
         3A9hXoVHXDzhfdFOYJjSAA8YHR+DOQUtltz15gbBorh+tcYpWEAUaJlP5vwruewSK5VA
         9QiKG8AX5hlI/s1VSTFVOwmEwAB7YRhX5gEAPl4DcvPaGTwOjFNdIivLFPaPbp9TacbB
         K/nHMvzvM1nj4aHbQ8coRP2KbUbRL8P0VJpQvEqCBjMead7svh5CfrIE6Jq9c4yUTolY
         AHsTLaiShwTwPc9tDFLmUYTVvMSm/YwD3mJDk3kVSYQ90cEDRel3coYAfoyaBZyi16SB
         u1HQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776074871; x=1776679671;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=L+tmudkXITzJHSYr4BUq79EkgThQNBRhbQCg3njXY7s=;
        b=hWFrJJsKK3R6ZxR0nGZcqUPwpka9neqtaPL3HOE4BF7dD5I5FidkwHaXfWozwBli8D
         PngDMKnsjGcYS+FyQ75UjdsjxXTlgpylRA8f/4TEM5LxflQI7cyRv/UJVxxS1Du7jzPs
         xLjHkY6T3TH97qc0FlMOLJZnVE5URSnuFY+c81DEl78QDDaY7oTh+S4GLJD0+VUCnNoc
         B5nvInLVsZOjCVgjri4UDMqAdZZcF5hp8gjUl06t9aV4WqD20dFSrXdlFhwa9ciBudSG
         nvlc+d4yZldhyOZ4TL0dH+z9bHjdDtJFwg27I31TkjSWApVsIAkYLtrZGqP5ylYEYO7z
         gYeg==
X-Forwarded-Encrypted: i=1; AFNElJ9sbOVlTeXVok5H/Jr7RWP8PqpecgrImgochveXwzPZl6VTqz77/4UH27Jd7xvSs7TDeD4MwA2hMnryLFMhTs43Rw==@vger.kernel.org
X-Gm-Message-State: AOJu0YzJb+s8l28gLQjx8qUqtOc0hdM9Fgsn7m1ZVTzv7lts7l/hfKEd
	0xCytwVAYXjsSuWrKD5xgDmQ4uoMzxI8wv4YaOGVDmLtAhC4me0wFo5k
X-Gm-Gg: AeBDieth9fSCjWYaM2LzKtWxB4P7iMX+cRNd3NAahD1gWnozhuK42kwTLsdOqBghjsQ
	G8eChRMpbbwVD7QqC9LTWyctmgIECxsuQEjhJrjkLinSnvFp6zalownLV3UCfCNPU3feKIbElBM
	+aOPseaDrVhIjheAyTkDWx7MjaOaD+Yr9h/S72QFWo3bxHkiQbd0PkUBCPMu5tCH2pBQB1hX/Pz
	a0weG4Su47T4sDsODBZlrtjBcdes7ErKirej9N1/op3n11PRCkCApGjSF1YFLadoWth1td1EG1h
	qhiUdJz6GNXVMtZvwQWb4KSlPKqCE97gtqoFzo6YsxnFpV8yC1MTcv3zpaabkSMqkbaqHIWQqSh
	T2xys7eCvXHjgs/S/HwCxeVyV8ryAMKgL02v0IHj09OoxO/hQlsgmJz5a3BJ0rxcbcW5S8tj+Rv
	S5P9cvI3XAAQJ18xc+9fP74vO3yVbVExnde64kjT0ejXnDI27YIg5xRNrO3g==
X-Received: by 2002:a05:6a00:1c97:b0:82a:5ef0:210c with SMTP id d2e1a72fcca58-82f0c234924mr12333653b3a.24.1776074871294;
        Mon, 13 Apr 2026 03:07:51 -0700 (PDT)
Received: from phuc-desktop.. ([183.91.15.56])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-82f0c50a8f7sm10232140b3a.56.2026.04.13.03.07.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 13 Apr 2026 03:07:50 -0700 (PDT)
From: phucduc.bui@gmail.com
To: kuninori.morimoto.gx@renesas.com,
	broonie@kernel.org
Cc: lgirdwood@gmail.com,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	geert+renesas@glider.be,
	magnus.damm@gmail.com,
	perex@perex.cz,
	tiwai@suse.com,
	linux-sound@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	bui duc phuc <phucduc.bui@gmail.com>
Subject: [PATCH v2 5/6] arm: dts: renesas: r8a7740: Add clocks for FSI
Date: Mon, 13 Apr 2026 17:06:59 +0700
Message-ID: <20260413100700.30995-6-phucduc.bui@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260413100700.30995-1-phucduc.bui@gmail.com>
References: <20260413100700.30995-1-phucduc.bui@gmail.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spamd-Result: default: False [-0.16 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	URIBL_MULTI_FAIL(0.00)[e6150090:server fail,sin.lore.kernel.org:server fail,fe1f0000:server fail,e6150088:server fail,e615009c:server fail];
	FREEMAIL_FROM(0.00)[gmail.com];
	FREEMAIL_CC(0.00)[gmail.com,kernel.org,glider.be,perex.cz,suse.com,vger.kernel.org];
	RCPT_COUNT_TWELVE(0.00)[15];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-31231-lists,linux-renesas-soc=lfdr.de];
	FROM_NO_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	NEURAL_HAM(-0.00)[-0.983];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[phucducbui@gmail.com,linux-renesas-soc@vger.kernel.org];
	DKIM_TRACE(0.00)[gmail.com:+];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-renesas-soc,dt,renesas];
	TO_DN_SOME(0.00)[];
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns,fe1f0000:email,e6150088:email]
X-Rspamd-Queue-Id: 3FD743EA4D7
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

From: bui duc phuc <phucduc.bui@gmail.com>

Add the SPU clock to the FSI node to ensure it is enabled before register
access, preventing potential system hangs.
Also complete the FSI clock tree by adding:
  - CPG DIV6 clocks (icka/b) as functional parents
  - External clocks (xcka/b) from the board
Define fsib nodes to support the clock hierarchy.

Signed-off-by: bui duc phuc <phucduc.bui@gmail.com>
---

Changes in v2:
 - Rename "fsi" clock to "own" to match driver implementation.
 - Add missing clock names: "icka", "ickb", "xcka", "xckb".

 arch/arm/boot/dts/renesas/r8a7740.dtsi | 12 +++++++++++-
 1 file changed, 11 insertions(+), 1 deletion(-)

diff --git a/arch/arm/boot/dts/renesas/r8a7740.dtsi b/arch/arm/boot/dts/renesas/r8a7740.dtsi
index d13ab86c3ab4..b8d903b711be 100644
--- a/arch/arm/boot/dts/renesas/r8a7740.dtsi
+++ b/arch/arm/boot/dts/renesas/r8a7740.dtsi
@@ -393,7 +393,11 @@ sh_fsi2: sound@fe1f0000 {
 		compatible = "renesas,fsi2-r8a7740", "renesas,sh_fsi2";
 		reg = <0xfe1f0000 0x400>;
 		interrupts = <GIC_SPI 9 0x4>;
-		clocks = <&mstp3_clks R8A7740_CLK_FSI>;
+		clocks = <&mstp3_clks R8A7740_CLK_FSI>, <&spu_clk>,
+			<&fsia_clk>, <&fsib_clk>, <&fsiack_clk>,
+			<&fsibck_clk>;
+		clock-names = "own", "spu", "icka", "ickb", "xcka",
+				"xckb";
 		power-domains = <&pd_a4mp>;
 		status = "disabled";
 	};
@@ -614,6 +618,12 @@ vou_clk: vou@e6150088 {
 				 <0>;
 			#clock-cells = <0>;
 		};
+		fsib_clk: fsib@e6150090 {
+			compatible = "renesas,r8a7740-div6-clock", "renesas,cpg-div6-clock";
+			reg = <0xe6150090 4>;
+			clocks = <&pllc1_div2_clk>, <&fsibck_clk>, <0>, <0>;
+			#clock-cells = <0>;
+		};
 		stpro_clk: stpro@e615009c {
 			compatible = "renesas,r8a7740-div6-clock", "renesas,cpg-div6-clock";
 			reg = <0xe615009c 4>;
-- 
2.43.0


