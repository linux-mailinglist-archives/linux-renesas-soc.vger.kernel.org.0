Return-Path: <linux-renesas-soc+bounces-27994-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id YAp3I1HRhWmOGwQAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-27994-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 06 Feb 2026 12:32:33 +0100
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id F14B0FD460
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 06 Feb 2026 12:32:32 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id DAC4D306055A
	for <lists+linux-renesas-soc@lfdr.de>; Fri,  6 Feb 2026 11:30:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 96D6E3A1A5D;
	Fri,  6 Feb 2026 11:30:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="GTGu7rBp"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-wr1-f41.google.com (mail-wr1-f41.google.com [209.85.221.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 42A813A0E8F
	for <linux-renesas-soc@vger.kernel.org>; Fri,  6 Feb 2026 11:30:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770377419; cv=none; b=ViMtTlNciFrilJiBGbDrE7VtZpcdEVydo/QOn9bZ88R+vql+H6Vh0VdhdA1e+rwgyz7KUItba8gefA7GKPOqN5/m3MI/SqJkxW04tlJBZxtEVzBAnOWzLBYKcmGmYK5cLsYV5yh6NNvq5q/FhkJIi7o31aQE1RyYmXeev5jWLeQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770377419; c=relaxed/simple;
	bh=BTx4WOXMeHUHVYxoavX4wm/her8LbKRpDgkVrU+FqEc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=uOkaDkIf9o6bEaC5PtJX+oRE1KUrxI5nH71MsRHqNMPIyrQz6VPw9V6iUSWgHKiBOxxwDd0+rdPaoXWbmV7cq1HI+EcvSOuiuOh9m5SgXV31RQOgISE5wP6UOFAKSr9Fyo2U1W8nUDYlf+9DWonZxASu7pHPG1ExKoDEVqi8UFs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=GTGu7rBp; arc=none smtp.client-ip=209.85.221.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wr1-f41.google.com with SMTP id ffacd0b85a97d-43628a01c32so441346f8f.0
        for <linux-renesas-soc@vger.kernel.org>; Fri, 06 Feb 2026 03:30:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1770377418; x=1770982218; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=EKwmbBUyV+FUkyuhoc4dTbfXs9M5ae9G0YS2ltMaFQ4=;
        b=GTGu7rBp21eAe3rqO6i9EdkXhQ5EszVZXvr62yyPLrgyZR7XRY1aAZ7wH8aiS5JNOJ
         HKGFUWsZhCuLko4dih6v0LUGm6gW2WGiQ1aIwHJmPsmGpczAfHgEUY1+WevKE18n/rwA
         Y4WufG1vro1W153TipsUr4tzLy9g4ji9aT/t3zUbS6NKcFWmRvLJqlq++OMKrwAAZPqN
         07+FQAJakCIoAkAhxxhjikQ7jNCEWRKzdz4tCGmAkgd6IvR/lMRpgsF0pcQPiy7nOfLV
         iuqi6dWVdYCNtwsu7pJ63DbpD3lEB7iK9YAF/C6ok3lkjteamD0EKp/qmyOlUbQdORVS
         GkYQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770377418; x=1770982218;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=EKwmbBUyV+FUkyuhoc4dTbfXs9M5ae9G0YS2ltMaFQ4=;
        b=DcyufXSTMrv2BfQIHQJym5Yiyxe38aLihMnboCfmyeoJ82wPK3mwhD3DhEKa3vREJN
         BuB+7RAsjpbYkWTfyhqTk0f4bCgHyxFC5y1djd7oqQgsBD5QL1t5Bz/UxfLtNbr3qLy2
         dUJWt9QjaLp+jVMuyG55a94M9DQcx23xOqmHuFmOSEKTze9gFLupYdqDnbNDXX/X208F
         rnYilnlQ5F2VEJgU105uoyFpNhxkmRic3+srtejYkVDJVWUUqoL/9RwK/HwvDL3tNj26
         FCnY75mEmogijSGwecQRYmdFQpfC104tARfh4sN/hf6+wWDrZOB0gxt0VANxxfqxBTYj
         GkZA==
X-Forwarded-Encrypted: i=1; AJvYcCVlizwhlOIjZgvtNBVuKb1D4eVCrSGEBqq48s1HiZndiwl5QpvotE9dKGbojwfR/xvLuig04ot6ax7D6b16IgpENg==@vger.kernel.org
X-Gm-Message-State: AOJu0YzTlVqDQEzGnYDTUItgx8gNyxBX0cf7vczvv+KGPPhmLCmMU5Cu
	MqUz2H66rYw2Dg8jH+De6WU5rhOejM+ZCK/yYXyQIg4pwcUUD9nebrTw
X-Gm-Gg: AZuq6aLaYgjQs9YlmpKn5ddqZfe9LSXQhh+EmSiSf/rZSpuIlXlDkL8SOVsMizOzTNt
	xN03HCHuGRGi0Af3+5Mungy1Qst1P5hc6Ndth093Bkkp9CtRTLd7F7E51cTVybfgROXKCjlZkIc
	Pm1gYyfIPUXFQMsdXEZUia4xUhLDiYtr0MoWvefWs0U9xaWvwQ6J37SEB/DTquglGl1v+NPlnTS
	A2Fuw0L6PR8k7apVEHtIODc9ojgj28sQIHBKIglAt70xkyHKa05emNoEwVu3aQiOmdIzgXdSG25
	+YjRFtqFU3Qode//tiAng+mxu4VSueab5+abYud9kMq3JyLDXkfJwh63ILo1vkA92g2Oxb+OVoT
	L9GfGtcshw431TiSg7irDoaj5jU6mkEU43O4GqpdLILa8fIO8jAg6sX1g/lfVyZpiLwrvWpL5NU
	EGNaruixK586xhOF7NTA==
X-Received: by 2002:a05:6000:2909:b0:435:6c8d:d017 with SMTP id ffacd0b85a97d-436293b38f3mr3781165f8f.32.1770377417469;
        Fri, 06 Feb 2026 03:30:17 -0800 (PST)
Received: from biju.lan ([2a00:23c4:a758:8a01:1e64:f8d5:9d7a:19d4])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4362972fc1bsm5309670f8f.28.2026.02.06.03.30.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 06 Feb 2026 03:30:17 -0800 (PST)
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
Subject: [PATCH 2/2] clk: renesas: r9a08g046: Add WDT clocks/reset
Date: Fri,  6 Feb 2026 11:30:08 +0000
Message-ID: <20260206113013.233432-3-biju.das.jz@bp.renesas.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260206113013.233432-1-biju.das.jz@bp.renesas.com>
References: <20260206113013.233432-1-biju.das.jz@bp.renesas.com>
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
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	TAGGED_FROM(0.00)[bounces-27994-lists,linux-renesas-soc=lfdr.de];
	RCVD_COUNT_FIVE(0.00)[5];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_CC(0.00)[bp.renesas.com,vger.kernel.org,gmail.com];
	TO_DN_SOME(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[bijudasau@gmail.com,linux-renesas-soc@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[9];
	NEURAL_HAM(-0.00)[-0.999];
	DKIM_TRACE(0.00)[gmail.com:+];
	TAGGED_RCPT(0.00)[linux-renesas-soc,renesas];
	FREEMAIL_FROM(0.00)[gmail.com];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,renesas.com:email]
X-Rspamd-Queue-Id: F14B0FD460
X-Rspamd-Action: no action

From: Biju Das <biju.das.jz@bp.renesas.com>

Add WDT clock and reset entries.

Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
---
 drivers/clk/renesas/r9a08g046-cpg.c | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/drivers/clk/renesas/r9a08g046-cpg.c b/drivers/clk/renesas/r9a08g046-cpg.c
index 6cb3991cfeb6..4deaa60dbc23 100644
--- a/drivers/clk/renesas/r9a08g046-cpg.c
+++ b/drivers/clk/renesas/r9a08g046-cpg.c
@@ -219,6 +219,10 @@ static const struct rzg2l_mod_clk r9a08g046_mod_clks[] = {
 					MSTOP(BUS_REG1, BIT(2))),
 	DEF_MOD("dmac_pclk",		R9A08G046_DMAC_PCLK, R9A08G046_CLK_P3, 0x52c, 1,
 					MSTOP(BUS_REG1, BIT(3))),
+	DEF_MOD("wdt0_pclk",		R9A08G046_WDT0_PCLK, R9A08G046_CLK_P0, 0x548, 0,
+					MSTOP(BUS_REG0, BIT(0))),
+	DEF_MOD("wdt0_clk",		R9A08G046_WDT0_CLK, R9A08G046_OSCCLK, 0x548, 1,
+					MSTOP(BUS_REG0, BIT(0))),
 	DEF_MOD("eth0_clk_axi",		R9A08G046_ETH0_CLK_AXI, R9A08G046_CLK_P1, 0x57c, 0,
 					MSTOP(BUS_PERI_COM, BIT(2))),
 	DEF_MOD("eth1_clk_axi",		R9A08G046_ETH1_CLK_AXI, R9A08G046_CLK_P1, 0x57c, 1,
@@ -275,6 +279,7 @@ static const struct rzg2l_reset r9a08g046_resets[] = {
 	DEF_RST(R9A08G046_IA55_RESETN, 0x818, 0),
 	DEF_RST(R9A08G046_DMAC_ARESETN, 0x82c, 0),
 	DEF_RST(R9A08G046_DMAC_RST_ASYNC, 0x82c, 1),
+	DEF_RST(R9A08G046_WDT0_PRESETN, 0x848, 0),
 	DEF_RST(R9A08G046_ETH0_ARESET_N, 0x87c, 0),
 	DEF_RST(R9A08G046_ETH1_ARESET_N, 0x87c, 1),
 	DEF_RST(R9A08G046_SCIF0_RST_SYSTEM_N, 0x884, 0),
-- 
2.43.0


