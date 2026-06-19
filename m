Return-Path: <linux-renesas-soc+bounces-34256-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id dC3oC0pxNWr3wQYAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-34256-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 19 Jun 2026 18:41:46 +0200
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id D143E6A7186
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 19 Jun 2026 18:41:45 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=gmail.com header.s=20251104 header.b=qSOCxIlN;
	spf=pass (mail.lfdr.de: domain of "linux-renesas-soc+bounces-34256-lists+linux-renesas-soc=lfdr.de@vger.kernel.org" designates 172.105.105.114 as permitted sender) smtp.mailfrom="linux-renesas-soc+bounces-34256-lists+linux-renesas-soc=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=none) header.from=gmail.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id A2BAD302A7D4
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 19 Jun 2026 16:40:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F0AC33C10B2;
	Fri, 19 Jun 2026 16:40:41 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-wr1-f42.google.com (mail-wr1-f42.google.com [209.85.221.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0F5FB3BFAEE
	for <linux-renesas-soc@vger.kernel.org>; Fri, 19 Jun 2026 16:40:40 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781887241; cv=none; b=bUvQBzElFBnAobQBmFmkPYmERG/C7+jN3J54tQaNIU6drjB30MwOl7q5JoXJnkXv3G/wjMPqmKSqhq13igQQyG2CuEvwb2Pcc+gg4y/qKRoJkn+EPF4c+2PrXj/E/0np6Wf1GgaJKMRlQFMciUynm8ax9oQRi9u0BlyckFpod/4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781887241; c=relaxed/simple;
	bh=0gmxz/Y8S+o2mudhnBl6h9k33D+/sgQi5gZaswPrxek=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=aXJFlLI3u1eU7GxWDk8aaF3N3nTvP06xTGgN1J7BV9NyeHDN5aILHcEL57b6Cq3By1wLTITSTtHAdvS1mhOHkQf49umWG8IX2jb36Au12NumlbvfNrF+hmW12cdvNbyPOsdZidJqDkG1c70L4/R6dpzHIfzxAJn2kTjq6F3ViXQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=qSOCxIlN; arc=none smtp.client-ip=209.85.221.42
Received: by mail-wr1-f42.google.com with SMTP id ffacd0b85a97d-461edb387ddso2266464f8f.3
        for <linux-renesas-soc@vger.kernel.org>; Fri, 19 Jun 2026 09:40:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781887238; x=1782492038; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=8pTb+5+kbbizTuU47bb6+ksFE4ZEvnOopOR0YTizKV0=;
        b=qSOCxIlNCv6SQbkqeBnKzrix6GJHHZ1yY+fyF7/8tLzQPAr3lrEAJczbTb6Yi4aCjl
         fCoOwDktf/saicqfOE4Ea2JJqqXKAPNWV4kbGGJSAG2wLZ/sCf2MZc5k+s//+FzWax/m
         RASuRM3wUC9JCB+jdGvg9DkGCCWngLOrOy4QR1/T7yZCZIqAfjV4WBlVjjPj5qX/5858
         fXPielvAR8LGGDsKUkz9F+pAMrrzyi87BJuv9esm8ypBRc4vEpjsa0RfrB1D3bCou98R
         U5WixDYdJkwCc4TYyXQ8YEKlkCbNw/rx1LzbPZFNJaIIAZJKtcpqnVijZpUdbB6j++3q
         IX/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781887238; x=1782492038;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=8pTb+5+kbbizTuU47bb6+ksFE4ZEvnOopOR0YTizKV0=;
        b=Fcufp6qpB7fvuM70bRR0HNK7vEMDfDFS6tq09YvOpHszedDqTI6KHga7gIBfSp2U/7
         n6HLCJQVdC+mlHepIRjikg+4ZlemxYJDfR9ydO4ql9Esn6Uq7ORcc/G4FmPzzF664ULO
         TsQvo7YzxTFpsekqk0ZzX0GEmaCxY0pGs5Chf99OeNr6U2kvygZ3BIKJzsrtH766uMu4
         UAgmj0La//hYFLo0gjaAzDVDezO6AoY+Fh2OSSw1gb+MUAyzwnPRxVsUltuMVS16M3SZ
         KXaN88bZeF8mpOlL+0bQJWnmm5I1ONENc/D6mI38S1T4F0VAqCDzoMb3jsrKPADoNZlL
         VVwQ==
X-Forwarded-Encrypted: i=1; AFNElJ9/BM0CV1kxFgZcL79sLkvkmXSfUT94HhqqP8J9vi38ejudst9TF5qooLcIcUTu3YNFLC+7XtLCLgIgdbD3rn9dRA==@vger.kernel.org
X-Gm-Message-State: AOJu0YzhlTzI/0bmcPPcyvYqBN8bdhw9AVz7X/JreKy5DiddMOSgmEbf
	EF1gEwah32KEdN4Dw345Z5ByGB2aYFqm7A2uWrl9l6uwUsk9QPKZ68yQ
X-Gm-Gg: AfdE7ck+p6Ka5AMHZGkVLCUlEO4R5/n0bioW2V/4m51sdYMh8uf37/SIPghG03EAQ33
	O4ZgZkDaFpSwpTnor2U3PM/eweMsMXqEe1RCLGbTORS6J/Yw+aVmfo4LJZ+zEgeXGhULC/AaYnI
	Q7VXD04FSGFP39bsygi6CX9V9P61F82C4IRKIQAo+ErpwdYq5njnZAhhlwBeJiZLvS18DBMvunA
	XKm+HIVK4VYcFJy9yhYXF4BNJMoqlWI/wc2H6bBGOCuw+RzRVy8eXLGa4HpC60RcYAFHA1GrB6S
	Mx/C2V5IPJ0JA8KnoqiaFqjtWREACse+CkkvvVQ5j+PZbF3MuH/pz2nqDckw3W/ZYdUYjsASnkl
	ELJ1LXVcx2O2pfPLzxvDGEap+St3t30CJvFAX+vq5ES9St5ij+K8rUQBjPlQ1DVrAYHpvm3dhE7
	kAv9T1OL5b4FcZWCT6SfueZMSjhsb4wVfYQpz4Cg==
X-Received: by 2002:a5d:4d49:0:b0:45e:73b4:85cc with SMTP id ffacd0b85a97d-465091bbde1mr5722144f8f.35.1781887238492;
        Fri, 19 Jun 2026 09:40:38 -0700 (PDT)
Received: from localhost.localdomain ([2a00:23c4:a702:d301:b387:a6c7:e8fd:bca5])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-46667221de7sm261621f8f.33.2026.06.19.09.40.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 19 Jun 2026 09:40:38 -0700 (PDT)
From: Biju <biju.das.au@gmail.com>
X-Google-Original-From: Biju <biju.das.jz@bp.renesas.com>
To: Geert Uytterhoeven <geert+renesas@glider.be>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>
Cc: Biju Das <biju.das.jz@bp.renesas.com>,
	Brian Masney <bmasney@redhat.com>,
	linux-renesas-soc@vger.kernel.org,
	linux-clk@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>,
	Biju Das <biju.das.au@gmail.com>
Subject: [PATCH 6/6] clk: renesas: r9a08g046: Add clock and reset entries for LVDS
Date: Fri, 19 Jun 2026 17:40:26 +0100
Message-ID: <20260619164030.380098-7-biju.das.jz@bp.renesas.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260619164030.380098-1-biju.das.jz@bp.renesas.com>
References: <20260619164030.380098-1-biju.das.jz@bp.renesas.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.16 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORWARDED(0.00)[lists@lfdr.de];
	FREEMAIL_CC(0.00)[bp.renesas.com,redhat.com,vger.kernel.org,gmail.com];
	MIME_TRACE(0.00)[0:+];
	TO_DN_SOME(0.00)[];
	TAGGED_FROM(0.00)[bounces-34256-lists,linux-renesas-soc=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:geert+renesas@glider.be,m:mturquette@baylibre.com,m:sboyd@kernel.org,m:biju.das.jz@bp.renesas.com,m:bmasney@redhat.com,m:linux-renesas-soc@vger.kernel.org,m:linux-clk@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:prabhakar.mahadev-lad.rj@bp.renesas.com,m:biju.das.au@gmail.com,m:geert@glider.be,m:bijudasau@gmail.com,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[bijudasau@gmail.com,linux-renesas-soc@vger.kernel.org];
	DKIM_TRACE(0.00)[gmail.com:+];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	FREEMAIL_FROM(0.00)[gmail.com];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[bijudasau@gmail.com,linux-renesas-soc@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	RCPT_COUNT_SEVEN(0.00)[10];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	TAGGED_RCPT(0.00)[linux-renesas-soc,renesas];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[renesas.com:email,tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo,vger.kernel.org:from_smtp]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: D143E6A7186

From: Biju Das <biju.das.jz@bp.renesas.com>

Add clock and reset entries for LVDS.

Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
---
 drivers/clk/renesas/r9a08g046-cpg.c | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/drivers/clk/renesas/r9a08g046-cpg.c b/drivers/clk/renesas/r9a08g046-cpg.c
index 7cea2c6d2c42..273e147dca7a 100644
--- a/drivers/clk/renesas/r9a08g046-cpg.c
+++ b/drivers/clk/renesas/r9a08g046-cpg.c
@@ -574,6 +574,10 @@ static const struct rzg2l_mod_clk r9a08g046_mod_clks[] = {
 					MSTOP(BUS_MCPU3, BIT(11))),
 	DEF_MOD("rsci3_tclk",		R9A08G046_RSCI3_TCLK, R9A08G046_CLK_P16, 0x618, 11,
 					MSTOP(BUS_MCPU3, BIT(12))),
+	DEF_MOD("lvds_pllclk",		R9A08G046_LVDS_PLLCLK, R9A08G046_CLK_M2, 0x61c, 0,
+					MSTOP(BUS_PERI_VIDEO, BIT(11))),
+	DEF_MOD("lvds_clk_dot0",	R9A08G046_LVDS_CLK_DOT0, R9A08G046_CLK_M3, 0x61c, 1,
+					MSTOP(BUS_PERI_VIDEO, BIT(11))),
 };
 
 static const struct rzg2l_reset r9a08g046_resets[] = {
@@ -637,6 +641,7 @@ static const struct rzg2l_reset r9a08g046_resets[] = {
 	DEF_RST(R9A08G046_RSCI1_TRESETN, 0x918, 9),
 	DEF_RST(R9A08G046_RSCI2_TRESETN, 0x918, 10),
 	DEF_RST(R9A08G046_RSCI3_TRESETN, 0x918, 11),
+	DEF_RST(R9A08G046_LVDS_RESET_N, 0x91c, 0),
 };
 
 static const unsigned int r9a08g046_crit_mod_clks[] __initconst = {
-- 
2.43.0


