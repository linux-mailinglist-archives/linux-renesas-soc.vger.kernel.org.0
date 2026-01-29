Return-Path: <linux-renesas-soc+bounces-27581-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id oEh0NDwke2nXBgIAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-27581-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 29 Jan 2026 10:11:24 +0100
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id B31E0ADF77
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 29 Jan 2026 10:11:24 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 43CD9300617B
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 29 Jan 2026 09:11:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4BC2037F119;
	Thu, 29 Jan 2026 09:11:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="coz5DDJ9"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3AC4D376BED
	for <linux-renesas-soc@vger.kernel.org>; Thu, 29 Jan 2026 09:11:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769677876; cv=none; b=Z/62LcwWhaEQYeFdAscNe9FJ2tgJCNqJ5tLnxGzaMpY+RQqvFq9w8Vqt8009gH2r9nXvzgwMoseTUWzp33sHpGRA0X9ZbBAtYqg32a5uizBz/AhgDlpZ5//FF3q2w0q6kXQ56PcEHOn70l6/n/N4tuh+NE5Chb/cuwSMlSQcVns=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769677876; c=relaxed/simple;
	bh=xzApL+tOXmpVuGXhCiWBafOpCmGl0cWaKQ4hIdAkSwE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=gR9XBOiw8Sq9TDYdkfbfn4AEGGBNrUAJxTCpJN2bEpAiRibToEnJRiVzSln+nnoVTj2ipWxl5TDyYKdaUQ7Zi/iZhdIbTZCuM6mqBUtAGRyqpHQp/36mJKS+IN7/R7uH3tTaFubXzHW/nRjtBACN9E1p/MLFsMQRWap/btnQyOo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=coz5DDJ9; arc=none smtp.client-ip=209.85.128.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-48068ed1eccso6702715e9.2
        for <linux-renesas-soc@vger.kernel.org>; Thu, 29 Jan 2026 01:11:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1769677872; x=1770282672; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=rLDqQlTrMND5cjb5pp+RmbUOuIdXjH56f5dfNu8LRdI=;
        b=coz5DDJ9PUOn1JBgmMQCW5k9N71Y5elmZUAX0Lrxd8FHlplHfMV1sFTMgTgH4CC8YO
         A+fQnjhFIzeLvPFgGrpovSKz+DGCcPVK2EE3VcLTHnu15i1u0ELKabFuAq14gjHHHefT
         5svHQu80n1GM374cIYC/Clwku8tnJeMnpyZUtYB3Wb8en4zmKlUnelEFD/fKm0IcBa1W
         sqZiwvoj8cdyU5uMFGJj79HeHyC+fYnbuH4zQAsKhtd3BvKYpZwNTH0Ld9TxSZ6r9oIF
         Je2QSd1+qHiHzRrNdrVKzyz/y6+ITImCdIfM+xH5UGersr3rdYBSqoKjdFjV3mfDTVHA
         0afQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769677872; x=1770282672;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=rLDqQlTrMND5cjb5pp+RmbUOuIdXjH56f5dfNu8LRdI=;
        b=JwSdJMIGxqoQCzWC7hjhE+F1QR37SKMIUNoWV0leu/XcNXOvDjV2runmDLwesC6h7y
         sJ/owRIcuOPKukWdCv56s/fQ04mnplhpicLN8r09+NWr7cfUOSkmxVeQBkxvTc5K8iJU
         P/fVXEGIvVstdwKPugxeb1TfxlTX3h3DqfQkJJ+2rV0fwsOk06NAN9tEMdP6tctIDynu
         4op42+FT+/MgfCg9071rbbjq5Hw4X6hzg0AfSYw31iT0NGjcxPsWYQfy+jc94zTaYbJw
         ZIQ9oAfEiMqk5iupRdWjIzpHZjssy4JkAQpBgjmNqLmy9Do6URP1OuYDiN+TlBvuqLiC
         3H0w==
X-Forwarded-Encrypted: i=1; AJvYcCUrHyrV6eZVLR6dH5njrtI5LGd0R2h8sVz8oJYlkWe7H+Cdo5tbrIx/3hBauRQFGITw8JlO6xO7jf6fOVDmaCmmeQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YyZw6u3gY1yVW9Mg761VRiskPRWBsN4lMOnTrHdBi4xi3dpjjaU
	pnePrXQZVS/A1AW/zkjh7aDHtBzwGReKEURFd8rVrzQGnR50YFrlQXbO
X-Gm-Gg: AZuq6aLn+Vnh66t0JfP+00eglDh4WVzIdh4gTvF8EnY2nAspvVK41gc3xv0eKICDP6k
	Wei4CzIuFRL50dSZrKHFgMAc3DTIQ31mmHTHPtK76GnWjMMPKRIbh8wfWEpJWVsIYQCmH4lzl4I
	EQjnx2fFJU7ab6CgOF/OaJOpioAx1iDio8dx1o9JFIk4gzK2t1SAA24eUmiabQTJYTCYiY2n5lc
	LMQs+lcN917xYVqxNz03wP0JxNIxEgApF3x2+d6hJvcECChj5MyA5AWWpheZ5xkJNAJQRgWvtcp
	GG0wOmW1WiDNI3j17i6RunLKMWcsfU+GXvXx0c5UVn0LdS9N0G9ftjW6APHDHnzoAYyxf6MWvmp
	y0EXkPEdHNuEVIjU85v9LKJrXmoe4Ai1DazSnxB8l3K9Oc9VXywg35IRYEvLhUjFsKqiEp567Ss
	HjZhwuxKDRMNlpBa8y
X-Received: by 2002:a05:600c:5395:b0:477:c478:46d7 with SMTP id 5b1f17b1804b1-48069c55751mr102964815e9.22.1769677872353;
        Thu, 29 Jan 2026 01:11:12 -0800 (PST)
Received: from biju.lan ([2a00:23c4:a758:8a01:5792:2065:403:a80b])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48066be77b5sm175338875e9.2.2026.01.29.01.11.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 29 Jan 2026 01:11:12 -0800 (PST)
From: Biju <biju.das.au@gmail.com>
X-Google-Original-From: Biju <biju.das.jz@bp.renesas.com>
To: Geert Uytterhoeven <geert+renesas@glider.be>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>
Cc: Biju Das <biju.das.jz@bp.renesas.com>,
	linux-renesas-soc@vger.kernel.org,
	linux-clk@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>,
	Biju Das <biju.das.au@gmail.com>
Subject: [PATCH 3/9] clk: renesas: r9a08g046: Add GPIO clocks/resets
Date: Thu, 29 Jan 2026 09:10:54 +0000
Message-ID: <20260129091108.95277-4-biju.das.jz@bp.renesas.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260129091108.95277-1-biju.das.jz@bp.renesas.com>
References: <20260129091108.95277-1-biju.das.jz@bp.renesas.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.16 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_MISSING_CHARSET(0.50)[];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20230601];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	TAGGED_FROM(0.00)[bounces-27581-lists,linux-renesas-soc=lfdr.de];
	RCVD_COUNT_FIVE(0.00)[5];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_CC(0.00)[bp.renesas.com,vger.kernel.org,gmail.com];
	TO_DN_SOME(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[bijudasau@gmail.com,linux-renesas-soc@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[9];
	NEURAL_HAM(-0.00)[-1.000];
	DKIM_TRACE(0.00)[gmail.com:+];
	TAGGED_RCPT(0.00)[linux-renesas-soc,renesas];
	FREEMAIL_FROM(0.00)[gmail.com];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns,bp.renesas.com:mid,renesas.com:email]
X-Rspamd-Queue-Id: B31E0ADF77
X-Rspamd-Action: no action

From: Biju Das <biju.das.jz@bp.renesas.com>

Add GPIO clock and reset entries.

Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
---
 drivers/clk/renesas/r9a08g046-cpg.c | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/drivers/clk/renesas/r9a08g046-cpg.c b/drivers/clk/renesas/r9a08g046-cpg.c
index e74bab2df29a..4d1b9c8c524f 100644
--- a/drivers/clk/renesas/r9a08g046-cpg.c
+++ b/drivers/clk/renesas/r9a08g046-cpg.c
@@ -174,6 +174,7 @@ static const struct cpg_core_clk r9a08g046_core_clks[] __initconst = {
 	DEF_FIXED("ETHRM1", R9A08G046_CLK_ETHRM1, CLK_ETH1_RM, 1, 1),
 	DEF_FIXED("ETHTX12", R9A08G046_CLK_ETHTX12, CLK_SEL_ETH1_TX, 1, 1),
 	DEF_FIXED("ETHRX12", R9A08G046_CLK_ETHRX12, CLK_SEL_ETH1_RX, 1, 1),
+	DEF_FIXED("OSCCLK", R9A08G046_OSCCLK, CLK_EXTAL, 1, 1),
 };
 
 static const struct rzg2l_mod_clk r9a08g046_mod_clks[] = {
@@ -221,6 +222,8 @@ static const struct rzg2l_mod_clk r9a08g046_mod_clks[] = {
 					MSTOP(BUS_PERI_COM, BIT(3))),
 	DEF_MOD("scif0_clk_pck",	R9A08G046_SCIF0_CLK_PCK, R9A08G046_CLK_P0, 0x584, 0,
 					MSTOP(BUS_MCPU2, BIT(1))),
+	DEF_MOD("gpio_hclk",		R9A08G046_GPIO_HCLK, R9A08G046_OSCCLK, 0x598, 0,
+					MSTOP(BUS_PERI_CPU, BIT(6))),
 };
 
 static const struct rzg2l_reset r9a08g046_resets[] = {
@@ -232,6 +235,9 @@ static const struct rzg2l_reset r9a08g046_resets[] = {
 	DEF_RST(R9A08G046_ETH0_ARESET_N, 0x87c, 0),
 	DEF_RST(R9A08G046_ETH1_ARESET_N, 0x87c, 1),
 	DEF_RST(R9A08G046_SCIF0_RST_SYSTEM_N, 0x884, 0),
+	DEF_RST(R9A08G046_GPIO_RSTN, 0x898, 0),
+	DEF_RST(R9A08G046_GPIO_PORT_RESETN, 0x898, 1),
+	DEF_RST(R9A08G046_GPIO_SPARE_RESETN, 0x898, 2),
 };
 
 static const unsigned int r9a08g046_crit_mod_clks[] __initconst = {
-- 
2.43.0


