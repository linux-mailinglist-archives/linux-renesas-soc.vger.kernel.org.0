Return-Path: <linux-renesas-soc+bounces-30583-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id IOPvFoF9ymlo9QUAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-30583-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 30 Mar 2026 15:41:21 +0200
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 956F335C296
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 30 Mar 2026 15:41:20 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 3C73C3048B14
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 30 Mar 2026 13:24:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 831AA3D47BF;
	Mon, 30 Mar 2026 13:23:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="T95pO3zm"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 129933D410A
	for <linux-renesas-soc@vger.kernel.org>; Mon, 30 Mar 2026 13:23:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774877035; cv=none; b=iGUgqziYUg4XsHgZJkS5SgNIf2ne5KKqLcsqMBG9RlD6qnhRkc0XFtDazh2pFe3tpydfIGNJSSOvMUyh/G0782KqZG8WBG0Zw/BfotHTx9gR17T0Cf+oYK6FuTTD8c/ii7AE5U/ipxUbiVtUGgMHY7ffWYZyZhpGB/ABMwQMa0o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774877035; c=relaxed/simple;
	bh=318rkCOtOIcwyCbPWpmQU7rBPO8pQ3u3Zsk20tNNVWY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Vm2cukECm7e/eZeLv12iNv8nOk7bMHYGBwLX/lhyGj0DetpP/nfg5BRdwgxK9dVBlHttvOiD0RwBwrpQoeHdzLwBhPjhLi/Ia9UsraF1VlhvIFodVp3EpWpZxACqQgTaGjAamO8O0NPy0jX3oVTm80C4BvREF4ezpAWps72G0uw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=T95pO3zm; arc=none smtp.client-ip=209.85.128.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-48700b1ba53so39940395e9.1
        for <linux-renesas-soc@vger.kernel.org>; Mon, 30 Mar 2026 06:23:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1774877032; x=1775481832; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=g7h3LG+LbAv4GOv1xUL9LKPpxkrnSVky+7zMr0jPZb0=;
        b=T95pO3zm+DOkNymM1Ld0vsJrcpAJwoymWvJQSLzHRK3aZ3c2LnoOlChxnWOnLFwxu8
         b/vx1WNs0gPMQrw2UE0Lam5qZ8SCVQp0IT84MyhIFSF449QzZxGcSFVSMuszRLoGwsGZ
         DKnyw3LkRoRIFp9t/w/EB3dTMZ2t6LkDRlAOxhA+y8e4VYjl6Jf2mnbajlLCe5Vm4Hd/
         SlnAIklvZ14VjeamPUFdqqeMBUqKBprG4nOvWyvOEOfrr5uR8Jzy5CNIiHY0oBNm7mej
         rf2sN11Yxp21sextHb2WI73vktoU25C3S5fLdZlOK1KV+La56vnR0pNP5rS1WOWlWTh7
         iiGA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774877032; x=1775481832;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=g7h3LG+LbAv4GOv1xUL9LKPpxkrnSVky+7zMr0jPZb0=;
        b=qEiH/pKZq7yCGXuD3qqO8IfPbpLqdpO0f4DjhwtT+93ADvxEX6QgPQQCGd4QnBTzZf
         hzViZ/w8J3yUwVNdvaZAvkgRh153z3o59Jxv8NbxggDHW7xkKLbzqbfkxrz62+TSfI6/
         7YkHDMUwW2g2Xr1cX85Ev54YRC0um2a6o/8n1OMc2gcqsQjdoYw4toaOb2zRjgp/+11P
         A0f/yQ38+ACe+mI0ofovNB8mE7mpjcHwmz/JP7LTnIHyL3CwoF65hPkg9D4JXdGw8lFr
         Tp+uXzoNFWy3nFHwPe5fcDj4/i497iSOMal9kOhPMk4CCvfYK6HlMLzMCdnvMOMC25RE
         Y6jw==
X-Forwarded-Encrypted: i=1; AJvYcCUsXtudyZVD7p4k57llqUWmBPdyRVUk52+evxXHYYgPxwBqSfo+uR3w5QohAYlI4yk9qfPOTmGwGsodf4hwI/qg5A==@vger.kernel.org
X-Gm-Message-State: AOJu0YyVLJFr5io0ISzQqOTYCPmrgyA/foeiGkNzD7Ux+YmLqRWkLQHI
	LQxLJnJ1PDsoOkyAuQs+w/CFzNsAtCsdPGjvPijWUfq7Fi2pqJxXNW8C
X-Gm-Gg: ATEYQzx2W6uTFh5iarafHCg9dtjaZyEATdvMGcAYVeJWe88HvXfNbZFg6VRI+Bvuew+
	9Gzf4zCFwA1C6fe0OVbmGjNP6dioiLLdewP5rTRxz44VZ7OLjvP2BbJQ+kAXGSPt/k/Lah6K5Es
	I4Ri+1kFn5l7bM/FRkejSLY3MGf22ka9ck2YCAh21J3ODUQjmDU3JVjZFdVMSd80WUvTmpx/BK2
	Y0WNeR7ii4Vu4aDkzhJqx6nysvycNJ5HAa6Fr2yPMLcGzvGtcmbWAML2HTcFnOnPfhAG6u9AGIk
	jPgvQ7l2v+Y6fzRGy+HVHedrVOxa6AT4dkAfb3ve7og51z6pgxoNuHIQb41PxQFPEo72NGFHA2Q
	x0R41s1ptQHk8nC173AE3mj2LjUbHGYEgs1WiXt27ULNUPz+boofVGphuCh/UMb9cXRWX0dtx/0
	RJnW2eH7UXy2CFrOqBWpQtHM8rmcjjfw==
X-Received: by 2002:a05:6000:40c9:b0:43c:fe0e:5bbc with SMTP id ffacd0b85a97d-43cfe0e5e22mr6360429f8f.19.1774877032194;
        Mon, 30 Mar 2026 06:23:52 -0700 (PDT)
Received: from biju.lan ([2a00:23c4:a758:8a01:e60:2c8a:54bb:d692])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43cf21e2628sm20825906f8f.6.2026.03.30.06.23.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 30 Mar 2026 06:23:51 -0700 (PDT)
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
Subject: [PATCH 1/5] clk: renesas: r9a08g046: Add GPIO clocks/resets
Date: Mon, 30 Mar 2026 14:23:38 +0100
Message-ID: <20260330132349.149391-2-biju.das.jz@bp.renesas.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260330132349.149391-1-biju.das.jz@bp.renesas.com>
References: <20260330132349.149391-1-biju.das.jz@bp.renesas.com>
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
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_MISSING_CHARSET(0.50)[];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	TAGGED_FROM(0.00)[bounces-30583-lists,linux-renesas-soc=lfdr.de];
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
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[bp.renesas.com:mid,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,renesas.com:email]
X-Rspamd-Queue-Id: 956F335C296
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

From: Biju Das <biju.das.jz@bp.renesas.com>

Add GPIO clock and reset entries.

Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
---
 drivers/clk/renesas/r9a08g046-cpg.c | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/drivers/clk/renesas/r9a08g046-cpg.c b/drivers/clk/renesas/r9a08g046-cpg.c
index e75781198873..d31572a99f73 100644
--- a/drivers/clk/renesas/r9a08g046-cpg.c
+++ b/drivers/clk/renesas/r9a08g046-cpg.c
@@ -174,6 +174,7 @@ static const struct cpg_core_clk r9a08g046_core_clks[] __initconst = {
 	DEF_FIXED("ETHRM1", R9A08G046_CLK_ETHRM1, CLK_ETH1_RM, 1, 1),
 	DEF_FIXED("ETHTX12", R9A08G046_CLK_ETHTX12, CLK_SEL_ETH1_TX, 1, 1),
 	DEF_FIXED("ETHRX12", R9A08G046_CLK_ETHRX12, CLK_SEL_ETH1_RX, 1, 1),
+	DEF_FIXED("OSCCLK", R9A08G046_OSCCLK, CLK_EXTAL, 1, 1),
 };
 
 static const struct rzg2l_mod_clk r9a08g046_mod_clks[] = {
@@ -233,6 +234,8 @@ static const struct rzg2l_mod_clk r9a08g046_mod_clks[] = {
 					MSTOP(BUS_PERI_COM, BIT(3))),
 	DEF_MOD("scif0_clk_pck",	R9A08G046_SCIF0_CLK_PCK, R9A08G046_CLK_P0, 0x584, 0,
 					MSTOP(BUS_MCPU2, BIT(1))),
+	DEF_MOD("gpio_hclk",		R9A08G046_GPIO_HCLK, R9A08G046_OSCCLK, 0x598, 0,
+					MSTOP(BUS_PERI_CPU, BIT(6))),
 };
 
 static const struct rzg2l_reset r9a08g046_resets[] = {
@@ -244,6 +247,9 @@ static const struct rzg2l_reset r9a08g046_resets[] = {
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


