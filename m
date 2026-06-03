Return-Path: <linux-renesas-soc+bounces-33539-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id va6LM3c/IGrlzAAAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-33539-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 03 Jun 2026 16:51:35 +0200
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 2DD23638CA8
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 03 Jun 2026 16:51:35 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=gmail.com header.s=20251104 header.b=c6elcTAg;
	spf=pass (mail.lfdr.de: domain of "linux-renesas-soc+bounces-33539-lists+linux-renesas-soc=lfdr.de@vger.kernel.org" designates 2600:3c0a:e001:db::12fc:5321 as permitted sender) smtp.mailfrom="linux-renesas-soc+bounces-33539-lists+linux-renesas-soc=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=none) header.from=gmail.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id F2E67319AABF
	for <lists+linux-renesas-soc@lfdr.de>; Wed,  3 Jun 2026 14:33:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 72F4B331222;
	Wed,  3 Jun 2026 14:33:47 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F2D1834D90C
	for <linux-renesas-soc@vger.kernel.org>; Wed,  3 Jun 2026 14:33:45 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780497227; cv=none; b=NqtJFx9cXYqdyW6xm3KdaV1ScquFouHgPF6HKfuGFjW5WvKtclZaMBb0NQo2Da8UqYi/qcf6lJXeuTxjkPh3FBjnzHgV2tPKa18ZKxeQ3FJpCW2BMv8k2JQD1v1w+tCic/SKvu4a8oay3Rhp4WIBg3EBwGLo/h95bJr0HyMPwIw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780497227; c=relaxed/simple;
	bh=DYaktsBqOc25DaPSr846Lq7CCic5W7A90K1koGLeUdk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=r+mVOBuAVm+Lg3q6rxITGop0qa54X3ZhTl96ouZoMUt3TxS2f0nEeSxsn6TzicIHnB+8jRf245/7J7Qweb3aRlBO9nsdWezDXtbz63rnrRENNOB0h8d6KlQJgDNDtBRMvbGneymuyw2DrKmetEdVSehfie8I/gi4V4Bc3cQmdAA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=c6elcTAg; arc=none smtp.client-ip=209.85.128.49
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-490b4a8e28bso11237075e9.1
        for <linux-renesas-soc@vger.kernel.org>; Wed, 03 Jun 2026 07:33:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780497224; x=1781102024; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=uhBI88HcMxiu/qVRbd3Bgg5S6TL2Bjx/bQArdCqGIeA=;
        b=c6elcTAgtmW2qCEz/5fF5QjKN6h8fUTlJjx8ETql1g6pvznAhcrHcNOVmnSNWNOrgO
         mHAxgsikJN6EGZdTrHCz38vCakUdnPA83hHw2yFxo3rMULg54KpVT2ADUUP3MnLXvFgL
         rurHwK9vkb0yBsdQDAZH5oMDp8zZBiyRJJA4Isf0CiwGYPZzoMqQ8vKGbL4vVh1xbmcH
         0sFocROk16hcVYKtYA5mhrStWZ1aJ0KWDB7SY919K6U6zf0mDvkZTylW2U/ONJufzoPg
         7Vrb11xSTV3Nb7P9Hr5p1xgr8yeRt1oZBo1mmn7crADROt5gcwAGtS0IlS++lNIP+PNQ
         JaXA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780497224; x=1781102024;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=uhBI88HcMxiu/qVRbd3Bgg5S6TL2Bjx/bQArdCqGIeA=;
        b=D+yoEL/+TGJEu/mWPtKzWSZTRV3mHt5bqVh4TSYc+88TrZyTA2ReNiaZD4lOUstxon
         h+N4lY6MOg2s28yJz1SnUAEmwrrNFOez6yPV1YSsM3GQN46cvJorbCGT51bO40xw8o/h
         r65LJwuasiCvs47NjmBzthDrgcqeb8r/Aj3ct6MWnDyj6s3gTA95if/ffC5fgFnSd9u1
         PLxEJwe7e4zVO1h83VLBT3mkaINQ1w+10uDaHTkq26VgiCDmu4DLogYVrojEbFPY3z6B
         lCFDFSP8JL02olKc8EZ9SonDMCKazaaqaS/JAiyfaYwsdxzQp8oGlKQfO5/TbEmXDbfD
         ZmyA==
X-Forwarded-Encrypted: i=1; AFNElJ8MOnA0k/1R/FXVAqabriw938VKa4jf2i/RZCn6/MJImUt1n6OKRS1eZjDM+0iIOWwGXJxnQ0CVMD7ItMOv1arB0w==@vger.kernel.org
X-Gm-Message-State: AOJu0YxPj1XtZllzK00ivGmdz2jpzc1OAtb87+arMUhknbKI88+gwYBI
	Uu5w5ODFxpG4z7WN4oK/jrlqS+AeyFfcn/0bl2cF+Oh0vacqfFWj2gYb
X-Gm-Gg: Acq92OGb/vpaRjY4C8TrJY8xMjw+MAy4n49EyP1nk+fMBEytNjV2iWkQmjc3KFNahoX
	mnGfbDFwzfUKERNGDkcqlSNVitWGMt+3tBoGTa/i8P7h0eiCyxU/gyBSFqQv9l2APzeSkSCEJra
	MV9/HjUHa8s/3A42UHV4VxVEt7vF5G18beoT1G+opNMk/a3Iv3zZZRY8MrUUoM9Qhv2zpf/k5Q+
	e6EK7SjTvChV2RH+3Q5QJa5GBT+XYIraEvJ1n0sAzcGUPFd2vtg/YYkSeA13vNI0TZU6be191fD
	PMQ/Q7opSGJ1GSrBGKIFsmmME0TgQKqEIqgkFILxhLmSdf28utVk/zJyzXazj5g5m7e71gXajIW
	7udvcsbqepkWn2OuyJHySZXkRmfe3LfSKWG/h1FhT2Bo4JQk7jDka6AgEa2Ygk/VLR18k5anjOs
	hNBJQKT2++a6c7POkJqQKtMOvGfKuN4lmL4DY4dRvSLU6Enbdswr99ivZXcz4=
X-Received: by 2002:a05:600c:810c:b0:490:afc5:f95d with SMTP id 5b1f17b1804b1-490b5e82e89mr65586495e9.29.1780497224451;
        Wed, 03 Jun 2026 07:33:44 -0700 (PDT)
Received: from localhost.localdomain ([2a00:23c4:a700:7301:179c:89ab:19f6:9ba4])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-490b0e823f7sm160147395e9.13.2026.06.03.07.33.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 03 Jun 2026 07:33:44 -0700 (PDT)
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
Subject: [PATCH 2/2] arm64: dts: renesas: r9a09g047: Add max-frequency for SDHI controllers
Date: Wed,  3 Jun 2026 15:33:36 +0100
Message-ID: <20260603143340.162457-3-biju.das.jz@bp.renesas.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260603143340.162457-1-biju.das.jz@bp.renesas.com>
References: <20260603143340.162457-1-biju.das.jz@bp.renesas.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-33539-lists,linux-renesas-soc=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	TO_DN_SOME(0.00)[];
	FREEMAIL_CC(0.00)[bp.renesas.com,vger.kernel.org,gmail.com];
	FORGED_SENDER(0.00)[bijudasau@gmail.com,linux-renesas-soc@vger.kernel.org];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:geert+renesas@glider.be,m:magnus.damm@gmail.com,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:biju.das.jz@bp.renesas.com,m:linux-renesas-soc@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:prabhakar.mahadev-lad.rj@bp.renesas.com,m:biju.das.au@gmail.com,m:geert@glider.be,m:magnusdamm@gmail.com,m:krzk@kernel.org,m:conor@kernel.org,m:bijudasau@gmail.com,s:lists@lfdr.de];
	FORWARDED(0.00)[lists@lfdr.de];
	FREEMAIL_TO(0.00)[glider.be,gmail.com,kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[gmail.com:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	FREEMAIL_FROM(0.00)[gmail.com];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[bijudasau@gmail.com,linux-renesas-soc@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	RCPT_COUNT_SEVEN(0.00)[11];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	TAGGED_RCPT(0.00)[linux-renesas-soc,renesas,dt];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[bp.renesas.com:mid,renesas.com:email,vger.kernel.org:from_smtp,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 2DD23638CA8

From: Biju Das <biju.das.jz@bp.renesas.com>

Add max-frequency property of 200MHz to the sdhi0, sdhi1, and sdhi2
MMC controllers in the R9A09G047 SoC DTSI to define the maximum
supported bus frequency.

Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
---
 arch/arm64/boot/dts/renesas/r9a09g047.dtsi | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/arch/arm64/boot/dts/renesas/r9a09g047.dtsi b/arch/arm64/boot/dts/renesas/r9a09g047.dtsi
index b48da8534a3d..760099697278 100644
--- a/arch/arm64/boot/dts/renesas/r9a09g047.dtsi
+++ b/arch/arm64/boot/dts/renesas/r9a09g047.dtsi
@@ -1265,6 +1265,7 @@ sdhi0: mmc@15c00000  {
 			clocks = <&cpg CPG_MOD 0xa3>, <&cpg CPG_MOD 0xa5>,
 				 <&cpg CPG_MOD 0xa4>, <&cpg CPG_MOD 0xa6>;
 			clock-names = "core", "clkh", "cd", "aclk";
+			max-frequency = <200000000>;
 			resets = <&cpg 0xa7>;
 			power-domains = <&cpg>;
 			status = "disabled";
@@ -1285,6 +1286,7 @@ sdhi1: mmc@15c10000 {
 			clocks = <&cpg CPG_MOD 0xa7>, <&cpg CPG_MOD 0xa9>,
 				 <&cpg CPG_MOD 0xa8>, <&cpg CPG_MOD 0xaa>;
 			clock-names = "core", "clkh", "cd", "aclk";
+			max-frequency = <200000000>;
 			resets = <&cpg 0xa8>;
 			power-domains = <&cpg>;
 			status = "disabled";
@@ -1305,6 +1307,7 @@ sdhi2: mmc@15c20000 {
 			clocks = <&cpg CPG_MOD 0xab>, <&cpg CPG_MOD 0xad>,
 				 <&cpg CPG_MOD 0xac>, <&cpg CPG_MOD 0xae>;
 			clock-names = "core", "clkh", "cd", "aclk";
+			max-frequency = <200000000>;
 			resets = <&cpg 0xa9>;
 			power-domains = <&cpg>;
 			status = "disabled";
-- 
2.43.0


