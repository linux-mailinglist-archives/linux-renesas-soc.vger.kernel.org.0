Return-Path: <linux-renesas-soc+bounces-30969-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id sBA1FAAY1mnwAwgAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-30969-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 08 Apr 2026 10:55:28 +0200
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 042163B95FA
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 08 Apr 2026 10:55:27 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id A987A3040947
	for <lists+linux-renesas-soc@lfdr.de>; Wed,  8 Apr 2026 08:54:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3F8E5346FCF;
	Wed,  8 Apr 2026 08:54:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="eHkZq67Q"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-wr1-f42.google.com (mail-wr1-f42.google.com [209.85.221.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 56D221A9F93
	for <linux-renesas-soc@vger.kernel.org>; Wed,  8 Apr 2026 08:54:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775638470; cv=none; b=VHtSs4DJZOaZuBzMjo/hjjlI9t9fWQfLv0P6q5BVF2mZmYgquu1u5880+ItTdztdbr2l/viqvv1s9sWu2vuUVCibvGThxccpZfhtXWbNN/HQ037dG4Wg0Ji8a/acLRP/EQ9bIbPJccHs6kZR1geK5mj7lUvJvxtO40xJmHQZoUM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775638470; c=relaxed/simple;
	bh=ItXq+HAy83MrT9YuVxBtXwsKZX0gmYnvMfWPNgwL+54=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=sRYARAeKSkrTC4OJtBzKKvXY4KK2wM55h/EgFFHDE2cN/M4l349pt3ZHuidpQa4yvd5jMyeSQa21ceE3iiAW66Y6fA85k/IR76WX8hl+Tnh3+B8Yd53gM/Tof30lxWB9xx6hoS7jlKfBG+wXWb+fHegb99xh3Vt9S3tIbtknhhI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=eHkZq67Q; arc=none smtp.client-ip=209.85.221.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wr1-f42.google.com with SMTP id ffacd0b85a97d-43b8982c2f4so3538057f8f.2
        for <linux-renesas-soc@vger.kernel.org>; Wed, 08 Apr 2026 01:54:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1775638465; x=1776243265; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Bdtaovd8xWj3rm7rGudho5NKYAJRSZ9GWAIfd8UFaAU=;
        b=eHkZq67QU3eWh1vV3hRqUE6mWy5uR9rRq/Z9WJBLL/wJnNmh2ojJQA20XDou4O85W3
         B+SGpkEYtTati+4MbjYWGd4wWy/Ccy72CXaV6PZN+WJTAoC/wOgzW6asCNMaAN+iNChY
         pCGa3nJZdGzC4Qi1oHtbigoM3cLT0ufTdqKoeh8JHVrEdErQwX9K5n5glwR1Caf/XGRh
         442GHYBuY4b69Vo+QvjJFH9Cj2pmnuD5TRMDDTidqBtY0FLHB9oSjBBrbk51MBmncB+G
         EhkMet4PhbzjDcYGCx5jAPg2DUGtWHNY///VeHEerV4Jl8T2smKQoUjsdSDYWSqxo/Q0
         J/OA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775638465; x=1776243265;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=Bdtaovd8xWj3rm7rGudho5NKYAJRSZ9GWAIfd8UFaAU=;
        b=SuBAFXjkewYLm0I3rUAsD1GKzEWzdMYvFBYKoXcLs1pHO5tIBd4e3qMo+0u/Ao71TK
         WPg6Z/J3y7Vqhef+fwcmGdY4pJtO8miT0mgGGR+wiAw8Mi0QYejFL3hqXi7e6s+zDX2q
         oi0AmYv78g9Cuk53UMX9kgNLBpvpmvXmSBmZAb3hODHHq88BNP367wT2Wrg0QqUTIvAl
         7f08Hl7DjgqL1RrjLZkRqpYjpW7IAOUoWvvPXjfJWFeABeQxuq6rUD3kJVL9sxMFD0cV
         k1AKg7d6SFMUIBR2gD2AuDJ1cxGr/vqdnGk/WlWXFq+TuZ0l+5uB7XrWvofr/3txwbPd
         d+Tg==
X-Forwarded-Encrypted: i=1; AJvYcCVUqQ1QYxM3y6u/g+6ycwDohI6+NRSNfwcYYM5OEy9j/jFY7hawo00C/ngoiLr+2qb2TzY41A0d25D086TAZ3DLvQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YxSQfQt4DSG3WowwIB/KQBFwpMzX12jUuZwTibYHHEXaXpT+jW5
	uc/Is70zO4L3aRE6h5sMwo/jaAHdvOVzYk6hlBBFgbKTAR4n7kGi4BiP
X-Gm-Gg: AeBDieukE6vLbUtDR1JmlZpBlLDNkMC9zgwEJlLSKowrIn4g8hRBQuIpru8wzd2p8z7
	35p5jIn+r7fUg0CybLkxt3hgOHrqfsRzbfFcYcZK+ui9EYhSz+dQBgJr6/YWcAN1j0mfL4m/N9V
	WEmTi4FFSycV3UYOi8fbbXoQ7LNo2Gx2WDTv9fejSt65IDPS9W4NCzx7yK1WvpGh2tTQzn+cdCx
	nJCa4nn2cAcIkw8/m1QKdXfwV3mlKOCSXJoFIrxus0KB+90j1Bt4oVAByhwgrjcuW6LwVN3Aulp
	8GennLMLoRH0FVwYK/xfqcFz/QVsZbTE1q1lJkUniapltx+/MDFGxa9az30VSVQ41LvcOnHOZcQ
	IOZ6uhn4txWrLAaIi94RaXzP4cR5X87+GaggkfkW4rz1axeLZpj5n5Y93Mw5XB65p2tKySGf4jz
	T3YuXHoKCgq11XM07bTDWWsRI2BxY3G8yJfAdqCtypQWWLQWs=
X-Received: by 2002:a5d:5847:0:b0:43c:f8b4:e58 with SMTP id ffacd0b85a97d-43d292e2a9emr30949101f8f.41.1775638464585;
        Wed, 08 Apr 2026 01:54:24 -0700 (PDT)
Received: from localhost.localdomain ([2a00:23c4:a758:8a01:f65c:8080:131a:202])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43d1e2c50a7sm56437678f8f.15.2026.04.08.01.54.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 08 Apr 2026 01:54:23 -0700 (PDT)
From: Biju <biju.das.au@gmail.com>
X-Google-Original-From: Biju <biju.das.jz@bp.renesas.com>
To: Fabrizio Castro <fabrizio.castro.jz@renesas.com>,
	Mark Brown <broonie@kernel.org>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Magnus Damm <magnus.damm@gmail.com>
Cc: Biju Das <biju.das.jz@bp.renesas.com>,
	linux-spi@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>,
	Biju Das <biju.das.au@gmail.com>
Subject: [PATCH v4 2/2] spi: rzv2h-rspi: Add support for RZ/G3L (R9A08G046)
Date: Wed,  8 Apr 2026 09:54:15 +0100
Message-ID: <20260408085418.18770-3-biju.das.jz@bp.renesas.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260408085418.18770-1-biju.das.jz@bp.renesas.com>
References: <20260408085418.18770-1-biju.das.jz@bp.renesas.com>
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
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_CC(0.00)[bp.renesas.com,vger.kernel.org,gmail.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-30969-lists,linux-renesas-soc=lfdr.de];
	FREEMAIL_TO(0.00)[renesas.com,kernel.org,glider.be,gmail.com];
	DKIM_TRACE(0.00)[gmail.com:+];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	FREEMAIL_FROM(0.00)[gmail.com];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[bijudasau@gmail.com,linux-renesas-soc@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	RCPT_COUNT_SEVEN(0.00)[10];
	NEURAL_HAM(-0.00)[-0.995];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-renesas-soc,renesas];
	DBL_BLOCKED_OPENRESOLVER(0.00)[glider.be:email,bp.renesas.com:mid,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,renesas.com:email]
X-Rspamd-Queue-Id: 042163B95FA
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

From: Biju Das <biju.das.jz@bp.renesas.com>

Add support for RZ/G3L RSPI. The RZ/G3L variant requires only
2 clocks (pclk + tclk), unlike the RZ/V2H which needs 3.

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
---
v3->v4:
 * No change.
v2->v3:
 * No change.
v1->v2:
 * Collected tag.
---
 drivers/spi/spi-rzv2h-rspi.c | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/drivers/spi/spi-rzv2h-rspi.c b/drivers/spi/spi-rzv2h-rspi.c
index 23f0e92ae208..38ee09e389c9 100644
--- a/drivers/spi/spi-rzv2h-rspi.c
+++ b/drivers/spi/spi-rzv2h-rspi.c
@@ -811,6 +811,13 @@ static const struct rzv2h_rspi_info rzv2h_info = {
 	.num_clks = 3,
 };
 
+static const struct rzv2h_rspi_info rzg3l_info = {
+	.find_tclk_rate = rzv2h_rspi_find_rate_fixed,
+	.tclk_name = "tclk",
+	.fifo_size = 16,
+	.num_clks = 2,
+};
+
 static const struct rzv2h_rspi_info rzt2h_info = {
 	.find_tclk_rate = rzv2h_rspi_find_rate_variable,
 	.find_pclk_rate = rzv2h_rspi_find_rate_fixed,
@@ -820,6 +827,7 @@ static const struct rzv2h_rspi_info rzt2h_info = {
 };
 
 static const struct of_device_id rzv2h_rspi_match[] = {
+	{ .compatible = "renesas,r9a08g046-rspi", &rzg3l_info },
 	{ .compatible = "renesas,r9a09g057-rspi", &rzv2h_info },
 	{ .compatible = "renesas,r9a09g077-rspi", &rzt2h_info },
 	{ /* sentinel */ }
-- 
2.43.0


