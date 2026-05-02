Return-Path: <linux-renesas-soc+bounces-31877-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id mGjNIvFI9mneTQIAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-31877-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Sat, 02 May 2026 20:56:49 +0200
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id A97044B33D2
	for <lists+linux-renesas-soc@lfdr.de>; Sat, 02 May 2026 20:56:48 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id C67F8300462E
	for <lists+linux-renesas-soc@lfdr.de>; Sat,  2 May 2026 18:56:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 334C53859D3;
	Sat,  2 May 2026 18:56:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b="YVdQrB+o";
	dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b="ZzJzH2az"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mout-p-102.mailbox.org (mout-p-102.mailbox.org [80.241.56.152])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 42B552FB084;
	Sat,  2 May 2026 18:56:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=80.241.56.152
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777748185; cv=none; b=miubHIrXV+5diVmmtSQXxTwl05+19tiyG8T3ok6566ohu5A3js/jA9jr0MJvCrogIMUEPJhgG7mIDsEWEAiTTAeeOR0D4dJVT/tXAlas71tQjjZ2JWFkemHVbvh26ZH6BImdbxZrLKapDdznVQ4kat0zftoUhg6SzdiSdBV9Kh0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777748185; c=relaxed/simple;
	bh=biy276O/ZJqnNqtbtb40lWHS06x+LEbCOesxNsxzQOc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=QcV4oXmpUr3D9GKnqgo8bX1bfJDuT+O4p6vx7+Uk/uaobDPMqlWL0PaFDDXyQXQhSYpCRn83CP3gDwNNpbTp5wRevbXXcyvl8soGCeBsyIo7LTjucHMfYBwHzOjzN79xD8Kd4xne24ym627cJ+RsYOUnyelMTTbVxV9J5Nz+zoo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mailbox.org; spf=pass smtp.mailfrom=mailbox.org; dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b=YVdQrB+o; dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b=ZzJzH2az; arc=none smtp.client-ip=80.241.56.152
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mailbox.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mailbox.org
Received: from smtp2.mailbox.org (smtp2.mailbox.org [IPv6:2001:67c:2050:b231:465::2])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mout-p-102.mailbox.org (Postfix) with ESMTPS id 4g7HDv4nwqz9v9S;
	Sat,  2 May 2026 20:56:15 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org; s=mail20150812;
	t=1777748175;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=ZWPyxXiCkwOnhKHSaSoDoMa/Yg5EsjWRX7PpMHjDx1A=;
	b=YVdQrB+om9uC2e3vVJd2BjX+OF/PMUiXZHTD8jmdXRjyBTczm/M8bKdFDxryGiXTu1t+56
	l4TWIhP1ahgw3xOJKKj317CICpCIScuRmjFb9Ao8t8t26GfbFf6s5zo3V17BHp/q/yaVsP
	hsLfT/52ntjbVSVVDD6fbgk0MzJm9Xz0lkFN935OBP89qaYtS90hfmZ1+5SVz6eN63wkgD
	axl4p4pJJRoTGmUgyqbeZMIdWriI6XsbU5+WIsAeCNnWsr1exf0b9FPZJBMb/kIX+A9v2h
	2R7PyL7Otr7ZGdsGHJ8XiU8tmNx1USarNqQEKhbgs7NuEcvgbhg7w5FoMlBRWA==
Authentication-Results: outgoing_mbo_mout;
	dkim=pass header.d=mailbox.org header.s=mail20150812 header.b=ZzJzH2az;
	spf=pass (outgoing_mbo_mout: domain of marek.vasut+renesas@mailbox.org designates 2001:67c:2050:b231:465::2 as permitted sender) smtp.mailfrom=marek.vasut+renesas@mailbox.org
From: Marek Vasut <marek.vasut+renesas@mailbox.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org; s=mail20150812;
	t=1777748174;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=ZWPyxXiCkwOnhKHSaSoDoMa/Yg5EsjWRX7PpMHjDx1A=;
	b=ZzJzH2azs3XePVSz0TiOtm96vSCQdPFdxDJQHVi4kaIkcAWp0TJsa9WI4rNPPrPP51wEre
	g0JD46ucn1DyDZLEkyTcsYRqXsjo1OfW+koLLJTJ7Tur2gygM5s0y3Ec1KBMHyx7CcVw+u
	3F2yVFgbSQWGTd9Vv2/ctTfrAfkMXbriVZLnvNm8bb5eG4N5gEn+W1mE8hGLXfb9zw6wtF
	SEPpaRVsjQ3q9z3hSBF/Td4nS1XlgNBhbzgONzV+rqi5hvUpnvDRFIH6lmgA/Hwt/5z/1N
	cpwdYrur+6sUxAvslN27sOPkmhn6UXZg/0V2KAOIn7AElpvGZ2zMBTEKLBICAg==
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
Subject: [PATCH 2/4] clk: renesas: r8a73a4: Implement ZT/ZTR trace clock on R-Mobile APE6
Date: Sat,  2 May 2026 20:55:43 +0200
Message-ID: <20260502185557.93061-3-marek.vasut+renesas@mailbox.org>
In-Reply-To: <20260502185557.93061-1-marek.vasut+renesas@mailbox.org>
References: <20260502185557.93061-1-marek.vasut+renesas@mailbox.org>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-MBO-RS-META: mtfzoxzo5jjun9hht8drgf8qwto6dswn
X-MBO-RS-ID: 6efcc919c2efcb2ece2
X-Rspamd-Queue-Id: A97044B33D2
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.16 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[mailbox.org,reject];
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	R_DKIM_ALLOW(-0.20)[mailbox.org:s=mail20150812];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-31877-lists,linux-renesas-soc=lfdr.de,renesas];
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
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[baylibre.com:email,sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns,mailbox.org:email,mailbox.org:dkim,mailbox.org:mid,glider.be:email]

Implement ZT trace bus and ZTR trace clock on the R-Mobile APE6.

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
 drivers/clk/renesas/clk-r8a73a4.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/clk/renesas/clk-r8a73a4.c b/drivers/clk/renesas/clk-r8a73a4.c
index 7f47644396e6c..11b387f1ab30a 100644
--- a/drivers/clk/renesas/clk-r8a73a4.c
+++ b/drivers/clk/renesas/clk-r8a73a4.c
@@ -43,6 +43,8 @@ static struct div4_clk div4_clks[] = {
 	{ "m1", CPG_FRQCRA,  4 },
 	{ "m2", CPG_FRQCRA,  0 },
 	{ "zx", CPG_FRQCRB, 12 },
+	{ "ztr", CPG_FRQCRB, 16 },
+	{ "zt", CPG_FRQCRB, 12 },
 	{ "zs", CPG_FRQCRB,  8 },
 	{ "hp", CPG_FRQCRB,  4 },
 	{ NULL, 0, 0 },
-- 
2.53.0


