Return-Path: <linux-renesas-soc+bounces-30939-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 0M6YMScc1Wli0wcAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-30939-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 07 Apr 2026 17:00:55 +0200
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 0BE163B0889
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 07 Apr 2026 17:00:50 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 3BE7D302E729
	for <lists+linux-renesas-soc@lfdr.de>; Tue,  7 Apr 2026 14:58:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 72A6633F591;
	Tue,  7 Apr 2026 14:58:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="qm062XEX"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F0DB233D6DD
	for <linux-renesas-soc@vger.kernel.org>; Tue,  7 Apr 2026 14:58:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775573882; cv=none; b=qrmmbgd8OkF3HZJd4qLaJvk3sgU4YuftyHY3SIo0pqHuNwIBG6fQwhYFPYT0/mUNQuP0lhyHJFrMX8etvdNFaFHW4e/sALxpEjUuhBKFSUO/wxCOz2OFYNVSK4JASRzHYt5M8+q/JadgaM7llguBGI/dggJUFM9P6FOEb0oDwyk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775573882; c=relaxed/simple;
	bh=gGJAVkaqbnWBs6ogKwMwK95d8Tb45CCZHT9puzQJJag=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=GkezzXeQ+H8dtPB/QF/908PCpxJVtZsX+7ln0adrN4VT0GeMx+GosV7hOhN3QbjspjyiMT2LZmcu03vqaQ8gZvExtO3EsCz525MesNbrtKawi8X8lOmmrtON+yRiQLNMNDPwHtsvpDCh0PkpJq/JZLQ0B344Ju2O8dY89goQqTs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=qm062XEX; arc=none smtp.client-ip=209.85.128.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-488af9fdaa7so12824315e9.1
        for <linux-renesas-soc@vger.kernel.org>; Tue, 07 Apr 2026 07:58:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1775573879; x=1776178679; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Uu0Lw+oxbfd6mTQ3wULf7ZlkS7pX6qzycy8VlVzsz/A=;
        b=qm062XEXTTaRcwcyOgdGR41KSqsvB2hZktt8PhfO1+wAwsHYzUY0rGMS5qh8jAMRyT
         ENDeKA3dRTCsJ7bgAV1VVFrrIeBoTEfU/9AYKrh5m7bTUqRd9nqswf/r0eEUk2hPvuVj
         p+23HkiDB2j3EyKMXNQ9rkLW4w8QZW9+fokoaxyeng0TTLl9i2zG+OTJq38KH+hfSAzA
         LxLtv6cNWlpkQLgcba3vffAJrhQOxRMKljY6KAXkVlwJTNpkp9DkNbry3YokFaLpULUD
         LFjxu7ULj1KlbeIWcKh2rV8zebWIkW76nbiIgP6pLJhkk5+scbUTo7qycFsAR7NcaTkS
         gugw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775573879; x=1776178679;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=Uu0Lw+oxbfd6mTQ3wULf7ZlkS7pX6qzycy8VlVzsz/A=;
        b=NCVN2Trc0qnXUE6kWHHuE8LHnRwESJThg6sCIyVcIEtwGFV1tOa21mKvSUukuB67up
         PG7IrzJkfuFnhV/LZ6aGNGqbfFbnvG100dmNciZgTZJvxLZPG6Ku9nRvvqL+K4Q27eto
         UC+IqtpDma80jJTBqsMwJR5KTggl8uhcdQk+2K1nHEOnQo9ONcexD34uH/Po96umki97
         ywCbKvoazT+kmlD5ooTIVpo9qLfuVvYMqecmMHIvdm7IbKZ4hyGg3A2/YCr9fZgo1Sz3
         W5zOX0NOjE7+i6bXJI/tlBf3vXbAjRX9RM81sU0HD60yHr/IQVZXCXJpROvXGiRbBumG
         xKUw==
X-Forwarded-Encrypted: i=1; AJvYcCXptKybmzZitHcMjjYjDf5kHQS/cyi7sJPpG0p7B+6JQE7fu5rZvxVWTejlmkjGi13N9j9ExHeAGpomybQZg3KmkQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YwqMG+XxjOx0g7F3kEFheijiDjAPi4lvDqCBOEHQnX7Fehww40C
	Eq3CxUzh80NaeAaDMWkXEfa7daQPBiCuDUQLT/mYG+Ey3lvPJhtm0njRqvDClg==
X-Gm-Gg: AeBDietJY9xU8yuOlp97drrjJ4IQ0yTOJL07RFaDCMdfZ9RpOJ1nTjZDzzP5/kdeGtr
	eYnGKnzybOE6ZrbkBIFZepwwgLmukn6zYO6IuwjWEy6f2gI/1NKii8E+DxkfYkpW0DAQw9J79iv
	DVqwm3UeF3G93oqQXbsYxaRauTlKIHWYprFO5Y5NHmy1C/i1z0jx7u3XHsp2mYdnbU7EzEaIKl5
	ppF+1luD5iLWI68cWBlYnsazJ5l9gL/51Azcf7c5VwZtSmqqsl0OekX3yhbG3+F7jh7QolnI0q6
	xuzZ5R8S6TWsfmKULCYIPdtmLaVEmuRN+zEqflgPGKU8GORHD0NiGUgn7Ewtk3HnoNp9n3wt1zc
	lHX7IkjkjR1cGq+wStQtEhloYIQGkpCHvvVCeQ+WdjFGHIoF51OcOHCdlcV4FTnEBd40hgmvlYh
	JOXZ2F3zjNnTXKnJH0IuIkrjTNQXu/HbPQ5Rs1zg8+IfqZ8JqwMLC4zUx2k3Q=
X-Received: by 2002:a05:600c:8b2b:b0:485:3a86:6392 with SMTP id 5b1f17b1804b1-4889979a89amr232373375e9.20.1775573879297;
        Tue, 07 Apr 2026 07:57:59 -0700 (PDT)
Received: from localhost.localdomain ([2a00:23c4:a758:8a01:3f9a:11a8:20c3:fe58])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43d1e2c5253sm45207018f8f.9.2026.04.07.07.57.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 07 Apr 2026 07:57:58 -0700 (PDT)
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
Subject: [PATCH v3 2/2] spi: rzv2h-rspi: Add support for RZ/G3L (R9A08G046)
Date: Tue,  7 Apr 2026 15:57:51 +0100
Message-ID: <20260407145753.101840-3-biju.das.jz@bp.renesas.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260407145753.101840-1-biju.das.jz@bp.renesas.com>
References: <20260407145753.101840-1-biju.das.jz@bp.renesas.com>
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
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-30939-lists,linux-renesas-soc=lfdr.de];
	FREEMAIL_CC(0.00)[bp.renesas.com,vger.kernel.org,gmail.com];
	FREEMAIL_TO(0.00)[renesas.com,kernel.org,glider.be,gmail.com];
	RSPAMD_URIBL_FAIL(0.00)[glider.be:query timed out];
	TO_DN_SOME(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[gmail.com:+];
	RSPAMD_EMAILBL_FAIL(0.00)[geert.glider.be:query timed out];
	FREEMAIL_FROM(0.00)[gmail.com];
	PRECEDENCE_BULK(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	FROM_NEQ_ENVFROM(0.00)[bijudasau@gmail.com,linux-renesas-soc@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-0.995];
	TAGGED_RCPT(0.00)[linux-renesas-soc,renesas];
	RCPT_COUNT_SEVEN(0.00)[10];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[glider.be:email,bp.renesas.com:mid,sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns,renesas.com:email]
X-Rspamd-Queue-Id: 0BE163B0889
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

From: Biju Das <biju.das.jz@bp.renesas.com>

Add support for RZ/G3L RSPI. The RZ/G3L variant requires only
2 clocks (pclk + tclk), unlike the RZ/V2H which needs 3.

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
---
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


