Return-Path: <linux-renesas-soc+bounces-31879-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id UBTfFrBK9mk2TgIAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-31879-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Sat, 02 May 2026 21:04:16 +0200
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id B7A844B3409
	for <lists+linux-renesas-soc@lfdr.de>; Sat, 02 May 2026 21:04:15 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 7DD853007952
	for <lists+linux-renesas-soc@lfdr.de>; Sat,  2 May 2026 19:04:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 70BAB3845C1;
	Sat,  2 May 2026 19:04:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b="I6PbfftY";
	dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b="fek1d4Ke"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mout-p-201.mailbox.org (mout-p-201.mailbox.org [80.241.56.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DE8321F4634;
	Sat,  2 May 2026 19:04:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=80.241.56.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777748653; cv=none; b=oxI+Ho19lXyn+vxDqXW9K6ropgyth0s9kDs4JOkaPayCXmSUEtI+Qzj8TBxrXZJxzQOM4Q5s/x7y0vqVHvgdKi8fv/AMNlTgb5yXVDe5CO9VLu1YPJq8caisCSddeerzMTx9gLeTZMBiMq9SDmmfcRylxedyf0jMeSkAqr4R2OE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777748653; c=relaxed/simple;
	bh=Eb6ogzDClg1Kmig7EjwNXoSkwdoaI/Yw30ibPgD/02o=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=uqZvjreiqev4iJQYHYqmPUH1yfQshwOcY1q53mbDYM2IeALXqfwNsndKrVJzuM6GZKkoKhT2x31lmv+AF7T3tIjLcCgKwrtXwmwzxhYNPtm6RpaJFU1RoFSdAn3bQ5v2IOvzAmJ6GERM02/0u0VKL6bsUnWlZLTtw5xhr6dBvII=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mailbox.org; spf=pass smtp.mailfrom=mailbox.org; dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b=I6PbfftY; dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b=fek1d4Ke; arc=none smtp.client-ip=80.241.56.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mailbox.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mailbox.org
Received: from smtp2.mailbox.org (smtp2.mailbox.org [10.196.197.2])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mout-p-201.mailbox.org (Postfix) with ESMTPS id 4g7HDy42yRz9tr1;
	Sat,  2 May 2026 20:56:18 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org; s=mail20150812;
	t=1777748178;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=EQud8duE45gdEVIRYljbYGN30HcxQZI9q+r/Ft9Q8x4=;
	b=I6PbfftYTIew0NXgeoJjRTHKthuLgqAP/ypOVkHLDVQzlN5pRGRt31fi4jz3GPFRMnZ/b3
	J+5FhU1Re9nAxe0FL11DfRegKSka58EWGWEYZEH1REfi85Cq/mAsb0UDdyAexq7l9ALUDS
	ivuEtk1Ut7y977Fp1Sb5NQ0Cte64G9GPhcjxi8natUnRDyHVVfyaUi5PFDpU4V/qjTl4ZQ
	DvNxOz38nioBFkGIXe+8OyD1EXAr5QDdCxUzTpbuhqNailVO/LM8js0lwnNfgd34wGFu3c
	Qu+Af6h+nAwBDFlwggeYdnZNAyMOwSPJD3V62n52o7ONHI+D0oIU38O6ovk8EQ==
From: Marek Vasut <marek.vasut+renesas@mailbox.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org; s=mail20150812;
	t=1777748177;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=EQud8duE45gdEVIRYljbYGN30HcxQZI9q+r/Ft9Q8x4=;
	b=fek1d4KenZU82Ii02M3nNlVEsNTUMvwepA9uwZXxs3UiniDotsvPPcZnPXl+5NkD9RvL0r
	Neeot22zsTbN+86hrdg4URWj39TTefdtBFrRCKF/jCGqXrcM1kDTaswVu9+CPKdGiJWbYo
	QQkFbMKpzbrjHNM3aishHXwgPCI7+iR6RVWElEDzRhpczxS0hOYcHzedZlQXa78567aiom
	qOg3rhclvHaO5CWJpaKHisJTK+7xQzn8/I9ftRs30zSqjrx/Q1Gc3CvOhhZ7AeTzZVYB3I
	BbvJQKozCLJBH4ipZYFMOYnR+RCoBJD8NGODjMJXtWFStN+a4vJ7pwzELtTVlw==
To: linux-arm-kernel@lists.infradead.org
Cc: Marek Vasut <marek.vasut+renesas@mailbox.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Magnus Damm <magnus.damm@gmail.com>,
	Michael Turquette <mturquette@baylibre.com>,
	Rob Herring <robh@kernel.org>,
	Stephen Boyd <sboyd@kernel.org>,
	devicetree@vger.kernel.org,
	linux-clk@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org
Subject: [PATCH 3/4] ARM: dts: renesas: r8a73a4: Add ZT/ZTR trace clock on R-Mobile APE6
Date: Sat,  2 May 2026 20:55:44 +0200
Message-ID: <20260502185557.93061-4-marek.vasut+renesas@mailbox.org>
In-Reply-To: <20260502185557.93061-1-marek.vasut+renesas@mailbox.org>
References: <20260502185557.93061-1-marek.vasut+renesas@mailbox.org>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-MBO-RS-META: g64dm3jh6snd6k7ae94xoc9je766hq9j
X-MBO-RS-ID: 642e1cc61f6edc127f4
X-Rspamd-Queue-Id: B7A844B3409
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.16 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[mailbox.org,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64];
	R_DKIM_ALLOW(-0.20)[mailbox.org:s=mail20150812];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-31879-lists,linux-renesas-soc=lfdr.de,renesas];
	RCPT_COUNT_TWELVE(0.00)[13];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_CC(0.00)[mailbox.org,kernel.org,glider.be,gmail.com,baylibre.com,vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[marek.vasut@mailbox.org,linux-renesas-soc@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[mailbox.org:+];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-renesas-soc,renesas,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	TO_DN_SOME(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[baylibre.com:email,glider.be:email,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns]

Add ZT trace bus and ZTR trace clock on the R-Mobile APE6.
These clock supply the coresight tracing modules, PTM, TPIU,
ETB and replicator. Without these clock, the coresight tracing
can not be operated.

Signed-off-by: Marek Vasut <marek.vasut+renesas@mailbox.org>
---
Cc: Conor Dooley <conor+dt@kernel.org>
Cc: Geert Uytterhoeven <geert+renesas@glider.be>
Cc: Krzysztof Kozlowski <krzk+dt@kernel.org>
Cc: Magnus Damm <magnus.damm@gmail.com>
Cc: Michael Turquette <mturquette@baylibre.com>
Cc: Rob Herring <robh@kernel.org>
Cc: Stephen Boyd <sboyd@kernel.org>
Cc: devicetree@vger.kernel.org
Cc: linux-clk@vger.kernel.org
Cc: linux-kernel@vger.kernel.org
Cc: linux-renesas-soc@vger.kernel.org
---
 arch/arm/boot/dts/renesas/r8a73a4.dtsi | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm/boot/dts/renesas/r8a73a4.dtsi b/arch/arm/boot/dts/renesas/r8a73a4.dtsi
index 2e19ebf9e2ba8..a70a0dc402a5f 100644
--- a/arch/arm/boot/dts/renesas/r8a73a4.dtsi
+++ b/arch/arm/boot/dts/renesas/r8a73a4.dtsi
@@ -512,7 +512,7 @@ cpg_clocks: cpg_clocks@e6150000 {
 			clock-output-names = "main", "pll0", "pll1", "pll2",
 					     "pll2s", "pll2h", "z", "z2",
 					     "i", "m3", "b", "m1", "m2",
-					     "zx", "zs", "hp";
+					     "zx", "zs", "hp", "ztr", "zt";
 		};
 
 		/* Variable factor clocks (DIV6) */
-- 
2.53.0


