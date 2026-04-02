Return-Path: <linux-renesas-soc+bounces-30752-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id IC1yIrNszmmpngYAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-30752-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 02 Apr 2026 15:18:43 +0200
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id ED8E0389897
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 02 Apr 2026 15:18:42 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 324D531DE6E6
	for <lists+linux-renesas-soc@lfdr.de>; Thu,  2 Apr 2026 13:10:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 694493E7141;
	Thu,  2 Apr 2026 13:10:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ZmUFXiU8"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-wr1-f43.google.com (mail-wr1-f43.google.com [209.85.221.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2CF523E1204
	for <linux-renesas-soc@vger.kernel.org>; Thu,  2 Apr 2026 13:10:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775135433; cv=none; b=QtPjre2yYa7hc0XLUFqjFyn4NMdtdAa9IroULVXLF5om8h79+E90njbeay8sGLDQBRiIfqC5dzdcSItA3gSU0q3n1J7hnjLF8rPN8C4IpWhSXdzVnSXLjApK2WDuHqaAiELrmgPdH/KZtXhEaQhLqumKlcXkSaN5c2LCSsTXKd0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775135433; c=relaxed/simple;
	bh=U4PLVNmitmFk0IAzfLOjKlCSu5Fm4qOHd5/vnDMdH+Y=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=gONw5L+0dAH3AN4TwdLtpce/sBflPSzi/pKtU0iHPBGeXQHaTgQECRKV6GDgo4YFXsBBscMXlIrM92LiYun377WqpRwwDAjar9KZRKWkrCzq6hz/EYrnMGRKYha+5cIEUdCaKEQOh21L4f1eQeeI1MayvUyQZ3ymOtpEZwGmvLo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ZmUFXiU8; arc=none smtp.client-ip=209.85.221.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wr1-f43.google.com with SMTP id ffacd0b85a97d-43cf73bbfbdso576853f8f.1
        for <linux-renesas-soc@vger.kernel.org>; Thu, 02 Apr 2026 06:10:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1775135426; x=1775740226; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=QlmD1kbg6mKeZNYx7OKw0AzuVS9sA1logO6t/+1LGUE=;
        b=ZmUFXiU8kwhfSGUyqisuuCQ2bVsLrPTw2yc9TR5k9u11zYPfk5beikptV4Ad9XrFGX
         RhOyUIORtvBjG5RRk2Bv3QL3JcADrXKGDcVtn1/yc4j/hPQo5q3e5MYfTuQ/EbTny+n3
         I5FOs/xpYcHTKdw/5gayHub9BWdvXKgRXLoHhmvdDYudjU8LGkEYDRcZYogGgjV0Kxdw
         /bg/KF1lF7V7aSw1SkGt3/U2xZwL3h4i2IHDPiR9sZpa09LHoPd1yoQfsZwI5NdkbA1I
         uPVQI1KIm6F/FRwx9g4O1wwZvyzfViiy5M+Ulroag7GxFiHEifIYzpEP6qEgKAET4ngM
         R5Ig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775135426; x=1775740226;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=QlmD1kbg6mKeZNYx7OKw0AzuVS9sA1logO6t/+1LGUE=;
        b=WoZLu/4QFrWNbmXdtRTBboOaumm13nZn+GQW50eAUGE9gRynMbM5D+D0F3KmDu0Tgu
         NdhHNj2vF95OHIDG4D1ExNI44KrqI6+neC1azbOWX/RxrL1kdPHoAT7goNc/J4YNiNFQ
         Mt5mxCgEiKxQWO0NfYJek0nsfehfePK32TOzUWhLtB955pcbLBzr9DuCyvI8t+WmVBNV
         lOZ/8syBtbwJR6O/8hXGwns8Z4QZU3YmoKR9o+YiwHZBgQN80ezrRUkfbJ5I3BGDfihX
         iHRBT1LR1F48oYTlLhh6ReWWAoc8PifG6KPePZy71TwLExujB7FReBSGwVOv6HMpWbEF
         Z1xg==
X-Forwarded-Encrypted: i=1; AJvYcCXg3jQQTJSXw4bu4Qhbzv/7h3L3jw8M8hmBew+QqznG7seH5a/3yZMeugCahaFosVjMQ5kfmMNwk1P3FsR915OslQ==@vger.kernel.org
X-Gm-Message-State: AOJu0Yx/c48mjTXFXDBdGeQg0a3FQcNCq9iQwg1+FvBNXiO7OPPgsqJQ
	26DsyRyRcfsX1vlxd/r4gOLjAA6VgsO/vKWCFKhDgJPgfPVVdKCDXFvG
X-Gm-Gg: AeBDies6DkjqZYVIGJ+4CAx2H9FNZmJtq65idjwzv4E6dVwyl3qgwaz+XTMDNVP4yVX
	FUGu8/yxDRCIJeSxW0NKa8tINe/tGpDwDhDAbYj0/4cx+Ez41p+JeVknfZ7Q0/x5w1JJywmEx7X
	AfoJFqU5QSB2MOkyfEChxofuokRjbCDUM+NGnDep9ESQ+/op9bXx4CS1OCqn2r4pmv3HHbhhsG1
	j6OIwEyTZMY+cAWLKZX/IKDQ81zn8zmmprrTJ8IyfoiDOcBwwXFGkjfWpprNmyxZcnto3BF1Azw
	MH29p/WxgP0Txvi07Z8qY+4w00C/Qm4gGUC6E/g3ak9dQMYJZy0MTchkfAzSaBRT7QDdRw92w3x
	wI+3NjcPX9PFsL1JrQXlVTQkU87k6leJ/+Bwy9zOLGSkOAmd2zQyUT9wHN2lIdcqCFXKjwe1AeT
	UFU9PKDRoM8Su5DN8MTCY/d6UIUad0PdQ6qbSAXoVjbWMaqC5GJ8w6KmQ+NMA=
X-Received: by 2002:a5d:61cb:0:b0:43d:1c21:ead3 with SMTP id ffacd0b85a97d-43d1c21eb20mr6902373f8f.16.1775135425685;
        Thu, 02 Apr 2026 06:10:25 -0700 (PDT)
Received: from localhost.localdomain ([2a00:23c4:a758:8a01:1526:47aa:5ab6:5a85])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43d1e2a720dsm8040753f8f.4.2026.04.02.06.10.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 02 Apr 2026 06:10:25 -0700 (PDT)
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
Subject: [PATCH v2 2/2] spi: rzv2h-rspi: Add support for RZ/G3L (R9A08G046)
Date: Thu,  2 Apr 2026 14:10:17 +0100
Message-ID: <20260402131020.143123-3-biju.das.jz@bp.renesas.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260402131020.143123-1-biju.das.jz@bp.renesas.com>
References: <20260402131020.143123-1-biju.das.jz@bp.renesas.com>
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
	TAGGED_FROM(0.00)[bounces-30752-lists,linux-renesas-soc=lfdr.de];
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
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-renesas-soc,renesas];
	DBL_BLOCKED_OPENRESOLVER(0.00)[renesas.com:email,bp.renesas.com:mid,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,glider.be:email]
X-Rspamd-Queue-Id: ED8E0389897
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

From: Biju Das <biju.das.jz@bp.renesas.com>

Add support for RZ/G3L RSPI. The RZ/G3L variant requires only
2 clocks (pclk + tclk), unlike the RZ/V2H which needs 3.

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
---
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


