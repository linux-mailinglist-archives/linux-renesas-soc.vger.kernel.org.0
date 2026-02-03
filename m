Return-Path: <linux-renesas-soc+bounces-27832-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 0DUDGuvzgWkMNAMAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-27832-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 03 Feb 2026 14:11:07 +0100
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id 071E1D9B5A
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 03 Feb 2026 14:11:06 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id A9352301FEC6
	for <lists+linux-renesas-soc@lfdr.de>; Tue,  3 Feb 2026 13:11:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DA2213502BA;
	Tue,  3 Feb 2026 13:10:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="lgDIrgkU"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A249F34F488
	for <linux-renesas-soc@vger.kernel.org>; Tue,  3 Feb 2026 13:10:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770124257; cv=none; b=RgWicfAYVNB5u3JdrcaV15scFWBEFG682H3mzD7ezzfjmOeY2zlz436K6x8USI6xbp+ZhJq2S3+bbiKXfttnU9PuVq7Df8FapbZWZNuoez9Y2EzxOzuQyOjycD5KLrdyyAddrNJhmgio6coef1FonsrcTz4G+WWytY0yBMkgAjM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770124257; c=relaxed/simple;
	bh=GtD/9l/D42UM8AefeKF0lZttZ6YGxQt4M7P3WCXGqKA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Y9m5XS49sHRH94WWcshedryVe2yvkhRNkGiOkuUF8MmO+3YhJUTbhutTyDpRPl3o8UHiQ+sIYJiqInzMMIr1Kv1kAMsBKMvYrXAYj9yu08XpJqmsFODj+5fE1TqdrLn2n519GOdBBqtMMJWYGxf9Bw8gSRWfuSnjgmF49nXuTEU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=lgDIrgkU; arc=none smtp.client-ip=209.85.128.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-47edd6111b4so59714655e9.1
        for <linux-renesas-soc@vger.kernel.org>; Tue, 03 Feb 2026 05:10:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1770124254; x=1770729054; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=3okOClBXUJoLFyNSUEoNAcCjGRrkRSkTJX+qEfn7Ojg=;
        b=lgDIrgkUIJbruFyH6BvfUTcYDFBSLlbXgLcnk0upCyeMIbGPFRP95jLsVXbl4P+IQ+
         +bIeEI0NTNGrqVqSPSundF5N0td4NorGpquc9hzj7MRAHJxTo38iS5MgVPR9Y1AbnQMS
         SBARfrHo+YqN2JK8UwG/h+0/ywyV91s7rZfMH+COdLx0jQOYwOxDKy+unCAwPUH+9rrr
         q8yvWLi+158qkHR4VhbS1qlvEx7uxtsoivmdfAgX13igeo0V2ph/GaXnzYE9sjjisorE
         ZXdl+a7t87pcDgHOdglhNTd+vV7ZsLxPz64ptrORXF2PMxcINKsec5DA9kmQtrc9ILK3
         nYhw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770124254; x=1770729054;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=3okOClBXUJoLFyNSUEoNAcCjGRrkRSkTJX+qEfn7Ojg=;
        b=CJ3F30Dpu+M06AX8W3XXznHBwJxcTf3Wk1klUcxNudY6GvzCKS1F8x4ChjNlabxkeP
         mDl2tBFk3sXZCfzRcfb6duLfrQNoHXGYAP/TJ0sbdDtix1QUYJzSWtF9gF5xsCYjhV57
         Y46XKD9rJgyCY6lD9PkDe4fzAySr1xSM6Zk1jNNBF6Z4XLPSLAcQ1wl/15DM9HSUwB29
         l63HBRekxST2+X3iYzzO8TepHBdysxCUNTKY+aOkyvgVYWje8wk/wn0/TcyOIvoqSSR5
         K/0v5GqZ9flXvKBYKhbughpG+dAW5PP6uEJjwxrZHktN5axoccg6HPHodEn6hFEIY6Nr
         Hdkg==
X-Forwarded-Encrypted: i=1; AJvYcCXXVkgU3q8z77e72v0PSZB9iY+EWs1EFq2IYvUIO79BRVjjQifuLukoOz7sGaXdojuyPJmtWNRkKm9qvptTcLMMNw==@vger.kernel.org
X-Gm-Message-State: AOJu0YwWLcW/Y67dBlR/t4nrcD1icD4WyYCtlLonnndpVjMk0zXJGdvl
	KD4ocosVFry5llqr5eo4x69Zp6U5J60VEn/8caSKA90sDVBDl/OT3Y6j
X-Gm-Gg: AZuq6aL5N6TUXDRVDbiYGaCh98XpUHcLoSs4amE2CEnNWkxVoQLOXqx2IKXmYQ7GskK
	CxRaAle5AWFe6ojqbNqGQ3FmKYCdKv1qdLBu4EzdHGzEIVACtd2iUv6zVJN8kEsIvB1xD4ZqFu2
	bRQPA0JeslrMdPdC+O3IETIGtEaCwIGZpaoVO0qTwfOIhysrXoluLjv8cIUJPkAhXDMvm5vRkmu
	EvaZ7H95VzRBGSY94J+VxZw/UAroxx9Z1cI0BexN8pq354U+rNT9ZCqKB2xxrF7WmwY7wloEqQr
	Vhy//pc67080DY6dcOM0AgyZUfUQ2FTYZy5qJeas/mhOllvDMlQY9aVD2zS//s2OJgq7O4tj3NQ
	wZ8IWGAiNDBpqY9Ehjt/XeI+upgcY5oR+LsszXquMS6YGSzxYQNKYgBneCF9kbUgpGibaO5gXa5
	lAtTIHbd5ZOWLL6KPIVQ==
X-Received: by 2002:a05:600c:138a:b0:47e:e20e:bbbe with SMTP id 5b1f17b1804b1-482db48e4a7mr232127365e9.25.1770124253800;
        Tue, 03 Feb 2026 05:10:53 -0800 (PST)
Received: from biju.lan ([2a00:23c4:a758:8a01:9cd9:f748:166d:55fc])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4830512ddd0sm63662185e9.9.2026.02.03.05.10.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Feb 2026 05:10:53 -0800 (PST)
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
Subject: [PATCH v2 03/10] clk: renesas: r9a08g046: Add GPIO clocks/resets
Date: Tue,  3 Feb 2026 13:10:26 +0000
Message-ID: <20260203131048.421708-4-biju.das.jz@bp.renesas.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260203131048.421708-1-biju.das.jz@bp.renesas.com>
References: <20260203131048.421708-1-biju.das.jz@bp.renesas.com>
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
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	TAGGED_FROM(0.00)[bounces-27832-lists,linux-renesas-soc=lfdr.de];
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
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns,bp.renesas.com:mid]
X-Rspamd-Queue-Id: 071E1D9B5A
X-Rspamd-Action: no action

From: Biju Das <biju.das.jz@bp.renesas.com>

Add GPIO clock and reset entries.

Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
---
v1->v2:
 * No change
---
 drivers/clk/renesas/r9a08g046-cpg.c | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/drivers/clk/renesas/r9a08g046-cpg.c b/drivers/clk/renesas/r9a08g046-cpg.c
index a2856d8fa95b..795dc700bdaa 100644
--- a/drivers/clk/renesas/r9a08g046-cpg.c
+++ b/drivers/clk/renesas/r9a08g046-cpg.c
@@ -174,6 +174,7 @@ static const struct cpg_core_clk r9a08g046_core_clks[] __initconst = {
 	DEF_FIXED("ETHRM1", R9A08G046_CLK_ETHRM1, CLK_ETH1_RM, 1, 1),
 	DEF_FIXED("ETHTX12", R9A08G046_CLK_ETHTX12, CLK_SEL_ETH1_TX, 1, 1),
 	DEF_FIXED("ETHRX12", R9A08G046_CLK_ETHRX12, CLK_SEL_ETH1_RX, 1, 1),
+	DEF_FIXED("OSCCLK", R9A08G046_OSCCLK, CLK_EXTAL, 1, 1),
 };
 
 static const struct rzg2l_mod_clk r9a08g046_mod_clks[] = {
@@ -229,6 +230,8 @@ static const struct rzg2l_mod_clk r9a08g046_mod_clks[] = {
 					MSTOP(BUS_PERI_COM, BIT(3))),
 	DEF_MOD("scif0_clk_pck",	R9A08G046_SCIF0_CLK_PCK, R9A08G046_CLK_P0, 0x584, 0,
 					MSTOP(BUS_MCPU2, BIT(1))),
+	DEF_MOD("gpio_hclk",		R9A08G046_GPIO_HCLK, R9A08G046_OSCCLK, 0x598, 0,
+					MSTOP(BUS_PERI_CPU, BIT(6))),
 };
 
 static const struct rzg2l_reset r9a08g046_resets[] = {
@@ -240,6 +243,9 @@ static const struct rzg2l_reset r9a08g046_resets[] = {
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


