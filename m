Return-Path: <linux-renesas-soc+bounces-34266-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id n/u8HPNRN2oaMgcAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-34266-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Sun, 21 Jun 2026 04:52:35 +0200
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 21BB96AA0A9
	for <lists+linux-renesas-soc@lfdr.de>; Sun, 21 Jun 2026 04:52:35 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=mailbox.org header.s=mail20150812 header.b=LxTPpyhx;
	dkim=pass header.d=mailbox.org header.s=mail20150812 header.b="pnbsHj5/";
	spf=pass (mail.lfdr.de: domain of "linux-renesas-soc+bounces-34266-lists+linux-renesas-soc=lfdr.de@vger.kernel.org" designates 172.105.105.114 as permitted sender) smtp.mailfrom="linux-renesas-soc+bounces-34266-lists+linux-renesas-soc=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=mailbox.org;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 59C6530285F4
	for <lists+linux-renesas-soc@lfdr.de>; Sun, 21 Jun 2026 02:51:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B9AFC25783A;
	Sun, 21 Jun 2026 02:51:13 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mout-p-101.mailbox.org (mout-p-101.mailbox.org [80.241.56.151])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 678C825333F;
	Sun, 21 Jun 2026 02:51:12 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782010273; cv=none; b=WKeAxEArDk2104+c6UOvDK3FbJn1+ByO+XVwTQrpDn+mlj5AZsipqy6gbwbansL6d6T69+jmmaRm1/pbVpCQDWwOPQn++MU1yWdgWXsJwZWF2b2SJ/LMtUySxrfbuOXHXbGEx4xlGgkXf4xPTdC+OMBgvLwmxvkUrV7Rczp9oRY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782010273; c=relaxed/simple;
	bh=HT/UyuFe0m1swESqSx7UzX+Ocq/zoLs+adliznF0HX8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=HW8DoX48df+gv43huOtWRZYJ1//2xPCWEeKPATqdLSrVwAy/NDX7JXkWk5Fs21fvmqa/ba/PRF8kN4JG2Xt73bMQM8PV2k+g0UqxtlY6hrqJ+VaybOImVnyRV36Fh84hO0ZOjW+V4I4ahRrOY0MhEY6scT+bYOsjRfCvyCeyPjg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mailbox.org; spf=pass smtp.mailfrom=mailbox.org; dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b=LxTPpyhx; dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b=pnbsHj5/; arc=none smtp.client-ip=80.241.56.151
Received: from smtp2.mailbox.org (smtp2.mailbox.org [IPv6:2001:67c:2050:b231:465::2])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mout-p-101.mailbox.org (Postfix) with ESMTPS id 4gjbSG5YfSz9swL;
	Sun, 21 Jun 2026 04:51:10 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org; s=mail20150812;
	t=1782010270;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=DA836GG3Gp9DG+JH2qQuPWlTVdunQMIMbho/NL94fPo=;
	b=LxTPpyhxSEhyUDh9XXrjXijpn5y0zMBn8bqWmRwvzMQMIBdzAjt55slEx43Cr1BeeKyJqp
	YdBRsEO/J17cNpNGZup+WNkfhZm7p3+iRNeYwH/Uctp3I4zUtcy3k+JtXzfdqVSOYkjU+M
	8BMmjJsjePXDqnmmzI59c2DENaAuF91vTYeP5Kg8NyqqCY8PmfE4qeGpVnVBliPpk0CbBR
	sjsSKLk8JO/k+tiu7SIDxPcfkt6hzoc26LzcIR9Ek2oj7M8nWorgeQTNn6dTSOhT1RX/lX
	Bds2Xojk9p1xlxf6GDXFqDeqA6o1+xnJ49Rb94E70X0Xm9hUn+EEsBNSNaPEIw==
From: Marek Vasut <marek.vasut+renesas@mailbox.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org; s=mail20150812;
	t=1782010269;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=DA836GG3Gp9DG+JH2qQuPWlTVdunQMIMbho/NL94fPo=;
	b=pnbsHj5/yfg17Peesxnr4zdVwFDdF2vuCRMmGDQspPK42A4UTeEjMB+8rWRy+F+1zzjEm8
	zOiqaS9szgH/tCGBml0AuG16ZAxqNE6kTrYnqgmPLleO8Gs9hIXJ8cRL/0JonFIIukAd++
	BygLz+RSDE2+Kt4D/t6FPs9g54+IDkK5lGVPPRVyRlnhrB9i/IpD4lCyjrgpiWLry6Iecy
	jR7algMsL2czM2bP3ixstBrC0UjgEqSttH+kIynMXKkQEd7FP4p17cf5KknGTGOP5GT1OO
	/3D9kcvHzU1aPTVbcs/I7XTDx8SWCvvjvUzMo914Xex1iGJ+bw5PHSyPEIWNkQ==
To: linux-arm-kernel@lists.infradead.org
Cc: Marek Vasut <marek.vasut+renesas@mailbox.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Rob Herring <robh@kernel.org>,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org
Subject: [PATCH 6/9] arm64: dts: renesas: r8a77965: Add soc: label to soc node
Date: Sun, 21 Jun 2026 04:50:26 +0200
Message-ID: <20260621025052.406507-6-marek.vasut+renesas@mailbox.org>
In-Reply-To: <20260621025052.406507-1-marek.vasut+renesas@mailbox.org>
References: <20260621025052.406507-1-marek.vasut+renesas@mailbox.org>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-MBO-RS-META: u53zm4f18y64rbosu99e7d1zqwkeujtj
X-MBO-RS-ID: 11d28805152e4a8dabe
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[mailbox.org,reject];
	R_MISSING_CHARSET(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	R_DKIM_ALLOW(-0.20)[mailbox.org:s=mail20150812];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-34266-lists,linux-renesas-soc=lfdr.de,renesas];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER(0.00)[marek.vasut@mailbox.org,linux-renesas-soc@vger.kernel.org];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS(0.00)[m:linux-arm-kernel@lists.infradead.org,m:marek.vasut+renesas@mailbox.org,m:conor+dt@kernel.org,m:geert+renesas@glider.be,m:krzk+dt@kernel.org,m:robh@kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linux-renesas-soc@vger.kernel.org,m:marek.vasut@mailbox.org,m:conor@kernel.org,m:geert@glider.be,m:krzk@kernel.org,s:lists@lfdr.de];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[mailbox.org:+];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[marek.vasut@mailbox.org,linux-renesas-soc@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[9];
	TAGGED_RCPT(0.00)[linux-renesas-soc,renesas,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	TO_DN_SOME(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	FROM_HAS_DN(0.00)[]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 21BB96AA0A9

Add soc: label to the /soc {} node to align the DT with r8a77951.dtsi
which already has that soc: label. The soc: label is useful in U-Boot
where it is used in U-Boot extras DT fragments.

Signed-off-by: Marek Vasut <marek.vasut+renesas@mailbox.org>
---
Cc: Conor Dooley <conor+dt@kernel.org>
Cc: Geert Uytterhoeven <geert+renesas@glider.be>
Cc: Krzysztof Kozlowski <krzk+dt@kernel.org>
Cc: Rob Herring <robh@kernel.org>
Cc: devicetree@vger.kernel.org
Cc: linux-kernel@vger.kernel.org
Cc: linux-renesas-soc@vger.kernel.org
---
 arch/arm64/boot/dts/renesas/r8a77965.dtsi | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/renesas/r8a77965.dtsi b/arch/arm64/boot/dts/renesas/r8a77965.dtsi
index 611a9335c63ad..70708f5cf7467 100644
--- a/arch/arm64/boot/dts/renesas/r8a77965.dtsi
+++ b/arch/arm64/boot/dts/renesas/r8a77965.dtsi
@@ -182,7 +182,7 @@ scif_clk: scif {
 		clock-frequency = <0>;
 	};
 
-	soc {
+	soc: soc {
 		compatible = "simple-bus";
 		bootph-all;
 
-- 
2.53.0


