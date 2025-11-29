Return-Path: <linux-renesas-soc+bounces-25382-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [213.196.21.55])
	by mail.lfdr.de (Postfix) with ESMTPS id A3A71C943D4
	for <lists+linux-renesas-soc@lfdr.de>; Sat, 29 Nov 2025 17:44:35 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id 830C734577E
	for <lists+linux-renesas-soc@lfdr.de>; Sat, 29 Nov 2025 16:44:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6A8E4311C06;
	Sat, 29 Nov 2025 16:43:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="XDyg1B5W"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A385130F804
	for <linux-renesas-soc@vger.kernel.org>; Sat, 29 Nov 2025 16:43:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764434621; cv=none; b=DClkvNHUwuftVEbCEAs+FpShbAaWidLrLEBZOuVyBk9TSaVT3UpxtdzoULv//XSbgnFZLptJKXyZhuwRGT3kINUiXjBIy7q2WvneanRVIww3IelcYO2Wnx+HiWugLaXAxBeEfQEh4RJWkupCyu5obZw0pqiIrHMJXOWkf5HBf9A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764434621; c=relaxed/simple;
	bh=Si3eRxLMBsIUtypstPKo4gg4caXALQjMtjyFcUYFaPc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=oV4uBYTQGqw7arbLdAb5T3Nb9y1ZCarIJ+6oNMYDnZAXazZEhVM1Lw89+O8zU8vREgMqMkxC7GmMmbpxvz4Man62tbYoRRrAIeoWchL3uc2HoZEq3SR4quSxRGpsZaULFIHifLwzdTz4p4aEpiaj60rth2ebXLBs2CvAMYY7p8g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=XDyg1B5W; arc=none smtp.client-ip=209.85.128.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-47789cd2083so14372095e9.2
        for <linux-renesas-soc@vger.kernel.org>; Sat, 29 Nov 2025 08:43:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1764434614; x=1765039414; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=c8llTcmCK9a6FD/g9xdGfc5pfkCOk7WP/ST+c7y3cC8=;
        b=XDyg1B5WK3oxrcct80mVABe/Lmbb1VwZzyOlDdErvRQeg/F4R2UCfWWO5cQ9rNVbQv
         9XQRBnYqn6u0/xSO8NSwJBs5z+RTBXt3ZDM7m3wgg+x4+fzJ/4CoPE71u9WmSUXV0LDz
         jed5WUXD+Rqqx7G8MctI/KlgMdDc6P60+CJk5zvj4epWa/pm3ylKMg6rVpE3kxbYIm4d
         qkTFT9Fo8zAkHyOaofO6kMHfqlWgz8ywIONqEOk3NDC8YA6k+D3Mrr2Ae15Au2/sVp/D
         ffI72kdSSLTYm8vsI31jh90UJ+DZY87RhdUSpseZHwROxLfHb+ewaH32KK5B+hTKv9Fx
         P+Cg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764434614; x=1765039414;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=c8llTcmCK9a6FD/g9xdGfc5pfkCOk7WP/ST+c7y3cC8=;
        b=IzE+BhhvkMAtaIWAt/aqk54nMSVa4xFuFktjiMu+ULg93PZ/cThkufaE8kJsLUeUGB
         dX49tQTMrL5EfxDvLwrfsTo639DgSF1YC/UsVdJGEDHy18lwy86l5BVofYm66pvzKzKk
         9uunopHqnkArSq77/vVv16JdZEh3vVIedU9OgYrycsNFDs8cjxcCdaoRnD7cbY318Ev0
         3+BH558OgIcHGF7hqj1GQTFxx+2Hyx5EBW6+svjpKCCHNBWQEH4wx04NvIxfrf61cOIb
         OgISq/fr6t3MElNRP2w4tlfEf244yeRMFy+lCXpTHcVlOF93SSlsL1IV+Q2ES4aWXUh/
         GNvQ==
X-Forwarded-Encrypted: i=1; AJvYcCXsUFygn01c7P3mdM+bV4byjeEEScHeOvBF7knz3cFYFCCI1EAKWv2N+eoVH1RnW8PM/UbiCFvuu/KzaSXeMFILKg==@vger.kernel.org
X-Gm-Message-State: AOJu0Yy5xuouqrKPRWpeAmFTCAyby3sTBlKFRD+qwwnILDZFYO90q1yL
	w6YTZp9A6UkQa10A/5dermK9LvakRXW2LybLJ3+650RMMLQr9J7t3SNy
X-Gm-Gg: ASbGnctBKNeODPGooXFZyqR2095VWEYSN8TDMhVgDnaXgfc1pfEnDmDZxy0HmcUTWaB
	6utfNyKLhcdSIcrXHaRI7spNp3CCp5z9wd6iMi4uL1zf6hPJyXlCaoV/w4+LrWMpCnxdomFgvbv
	nYzncA5sxsOhiQRAK4GS42a65yBezgkTvCIn/vUEqmIVCzsKUyTwEfvA2yFAgsKhPHjPIYzLgSu
	ecbv2WaDMAxZZFBUVw/JI0B8v6eq23oawwiQfYLbH1s8dr3zojRacqiu3HwMe1jsWAJqSbkI0Gb
	GPRUMm2rUC+7IKDyvvPiyvDTP6ysq/Yahn1PL1aC4IssKozmXg2MELIhpwxV3CP2+OkKUCynE7I
	GOPe5TPUWkdDtq+8swS4iGo68mahjS0bhCrHxxEv16WBvK4IaIfd4Of+n+Q/gy1TCgZHlqD1EAr
	sAAuFgAyxLaLgckOw66HouN4wni+sBRoNVwQJ0a/xDxHbN96JHu6IZieTv/x9s78ITkbq3pNZ3h
	4EhknRhL5ZQBsVo
X-Google-Smtp-Source: AGHT+IHTGtxytaH7ZoRJ5GETUyYKLGtKoivIoyHmUivB/QIKqPw3rHB30Mk+K3Ls9v43O/H2Ao805Q==
X-Received: by 2002:a5d:5d12:0:b0:42b:2e39:6d45 with SMTP id ffacd0b85a97d-42cc1cbd047mr35853301f8f.15.1764434613887;
        Sat, 29 Nov 2025 08:43:33 -0800 (PST)
Received: from localhost.localdomain (host86-162-200-138.range86-162.btcentralplus.com. [86.162.200.138])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-42e1ca4078csm15970060f8f.29.2025.11.29.08.43.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 29 Nov 2025 08:43:33 -0800 (PST)
From: Biju <biju.das.au@gmail.com>
X-Google-Original-From: Biju <biju.das.jz@bp.renesas.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Jiri Slaby <jirislaby@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Magnus Damm <magnus.damm@gmail.com>
Cc: Biju Das <biju.das.jz@bp.renesas.com>,
	Wolfram Sang <wsa+renesas@sang-engineering.com>,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>,
	linux-kernel@vger.kernel.org,
	linux-serial@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org,
	Biju Das <biju.das.au@gmail.com>
Subject: [PATCH v5 08/17] serial: rsci: Drop unused TDR register
Date: Sat, 29 Nov 2025 16:43:04 +0000
Message-ID: <20251129164325.209213-9-biju.das.jz@bp.renesas.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20251129164325.209213-1-biju.das.jz@bp.renesas.com>
References: <20251129164325.209213-1-biju.das.jz@bp.renesas.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Biju Das <biju.das.jz@bp.renesas.com>

Drop the unused TDR register-related macros.

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
---
v4->v5:
 * No change.
v3->v4:
 * Collected tag.
v2->v3:
 * No change.
v1->v2:
 * No change.
---
 drivers/tty/serial/rsci.c | 6 ------
 1 file changed, 6 deletions(-)

diff --git a/drivers/tty/serial/rsci.c b/drivers/tty/serial/rsci.c
index 15ed6cf5c6c5..5a58c783fe8c 100644
--- a/drivers/tty/serial/rsci.c
+++ b/drivers/tty/serial/rsci.c
@@ -35,12 +35,6 @@ MODULE_IMPORT_NS("SH_SCI");
 #define RDR_FPER		BIT(11) /* FIFO Parity Error */
 #define RDR_RDAT_MSK		GENMASK(8, 0)
 
-/* TDR (Transmit Data Register) */
-#define TDR_MPBT		BIT(9)	/* Multiprocessor Transfer */
-#define TDR_TDAT_9BIT_LSHIFT	0
-#define TDR_TDAT_9BIT_VAL	0x1FF
-#define TDR_TDAT_9BIT_MSK	(TDR_TDAT_9BIT_VAL << TDR_TDAT_9BIT_LSHIFT)
-
 /* CCR0 (Common Control Register 0) */
 #define CCR0_SSE		BIT(24)	/* SSn# Pin Function Enable */
 #define CCR0_TEIE		BIT(21)	/* Transmit End Interrupt Enable */
-- 
2.43.0


