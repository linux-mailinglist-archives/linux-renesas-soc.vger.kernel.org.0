Return-Path: <linux-renesas-soc+bounces-24114-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 704A6C34224
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 05 Nov 2025 08:05:37 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id F3551189F847
	for <lists+linux-renesas-soc@lfdr.de>; Wed,  5 Nov 2025 07:06:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 497192D0617;
	Wed,  5 Nov 2025 07:05:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b="DgCzKiSc"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5B28128934F
	for <linux-renesas-soc@vger.kernel.org>; Wed,  5 Nov 2025 07:05:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762326334; cv=none; b=DhXgRchu6niijNLjxQcTDAWJX9tpMwmUnrRDrXv4rQs1bNZBIUZG4qFMjwWek/A1lsBJJLjAmW6m/vBGKRi7x6tqbXJG7r+P+93MeSwQ7nymAGf/i8DsEGQl1cl55BiCjto7ZTLSjhwthmLZnYhY9L4pdZzTJVubsbmJgQRgK1E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762326334; c=relaxed/simple;
	bh=1QQSsgCx0pgNxfx266TB1Ixb7FQzknNZWiWyH5+V+II=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=bQ4UJE7zrzSoy6jxnBGXhC2CsTl5iuub/sZFy3vnw70wBoo3/uYZ9RNm9Hal1rTBtybGlRwlVJnKmF92N2XCNOI++jYlVNh/2nwhJyVVrvJ2fQgqU3yNfHTgvK6o6drJWGMz9W/5Y41EUlI7kDgXJ5Twe1Ehsa96ZDB2U/UqZCM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev; spf=pass smtp.mailfrom=tuxon.dev; dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b=DgCzKiSc; arc=none smtp.client-ip=209.85.128.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=tuxon.dev
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-47118259fd8so45958475e9.3
        for <linux-renesas-soc@vger.kernel.org>; Tue, 04 Nov 2025 23:05:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tuxon.dev; s=google; t=1762326331; x=1762931131; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=bWgmb5rLDQozO3OkIX7jSbLmOOz2Qk2T5UHmoC6vWl0=;
        b=DgCzKiSc542Tw6r83Wsu0mmw4me6T6sZQ75tOsUv+A5DA7X3OgVAKivI8Yd898lWZr
         zl2xo+OXCghL1NFi3n7Q4gnpseYofTAnYJywUI/6dZEJHAvmvfqzvHFJFswbQIrQDc1B
         I+ImacKiTIQ9Jt59tK20yf4R15MSS5q4pX/e6GtHNeSzh8oLkpgdLA/T9v2GBgJ0A5hS
         +AOEIHN1cKh9YXtT94DHHh/5yWIZdX07w/qbIQU9pB4ElYMhfRZ3QWYFuZxC/DKG1rnZ
         amSrsScGeNSNb/z3pvFSQSP1sjzLMhYyN7RH8RN2gq1bY+VUc7VQj627JWQlIxCPZRXM
         HmuQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762326331; x=1762931131;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=bWgmb5rLDQozO3OkIX7jSbLmOOz2Qk2T5UHmoC6vWl0=;
        b=JjJjK4ViuO57Uy2kI2jr0yZIl4hRnbE+Ns13l3g65IGcEDAvl0/q08soBvqMBfxtqA
         xD2U7no87b72k5HrAsDbMZcMc1K5MHNecy0tZMLWOxMQEK1M94VTmphXrlZyIdG7J4u9
         dorjRvIIzwgWSeA5iSfvx70O/1nOB8KZdXtJ1ae2bu0/P0UGqeiP9P2tTAn0h5d7gxrH
         Nq8f6yrp+l/5YSUq6rz2bxOewO+KOtkAbzQZwI1YBQ4KJ0fWRYIygQNgdt2jX2C+lGp5
         fPUAQ4XSf4iYbZHiG5xbewfOiXzfv59ODkGqpdc104bJYBaEDpwuu9ppsEQBf76FfUBx
         I8Gg==
X-Forwarded-Encrypted: i=1; AJvYcCXJ9j2A2P9mW8QqggqqBEAk62MoQQfrbfXETq4E0Savc0ZG02XDXAIN4BXOmm7wSj960p+Wx1uSm2SunMIOVbQc2w==@vger.kernel.org
X-Gm-Message-State: AOJu0Yxun5sjq6MsIVTZtxUSXupe/Ez7xiaIu83RQ36ZIQ6Evrcf6RED
	q1k/cSTGNIu5HbnYcscGuZFbEvh8rVKWY3X0QXmydmvoPRkRgu0a4Ids4qjOdLW2R4Q=
X-Gm-Gg: ASbGncsJ4DwznBVTb9fUhBi/7zvHUMtb4lU78gD9ewk8MtE9hPio/emO9/0R6A5tc1Z
	s0QFebX12ps3uO9Vlt/SWhNjeLaXpGRKCq6f5wR46pL2OtDdZDbQZZeyiAiXIn69VgrWoHcroWa
	cTRSQrKM0veK/bnlnN/q920PAHBiNUO1u3fO5MBVIsDZ97LyOjnKo2IaORZy9Xr4DwtpMy88h/c
	4F89kSHb2LiPY03az3RwnKUOTL0u/0kWU5WAFKDJA/7Chx16TEQbS2K3LCRNxeL99BWlRQnhcK9
	295aJ3S9ygA2+HdOTIzXE4kR0Z9FkwtqRloKufuQoDQroQMKWmNtncPkXWCXrQJOstHgFgTFlm7
	s/LIEqOogN8A7/ajC0ixaOgjYknfjKRYT8yI5ycM6RmwFBhj7PRKiDbcJYAH4jUKEvhM3HweUk9
	Q5NzLxkhP5xVidEyHcaykYA/eleGm+OQ==
X-Google-Smtp-Source: AGHT+IGHtHJyD2g6rt0y70oaDzsqfUtCB6NnQuYuLGZE0oGBZ7h1WadLlOHXsB5m7u2aTePpukReqg==
X-Received: by 2002:a05:600c:4e88:b0:475:de14:db1f with SMTP id 5b1f17b1804b1-4775ce19f93mr16644565e9.30.1762326330668;
        Tue, 04 Nov 2025 23:05:30 -0800 (PST)
Received: from claudiu-X670E-Pro-RS.. ([82.78.167.134])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4775cdc96edsm30520685e9.6.2025.11.04.23.05.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 04 Nov 2025 23:05:30 -0800 (PST)
From: Claudiu <claudiu.beznea@tuxon.dev>
X-Google-Original-From: Claudiu <claudiu.beznea.uj@bp.renesas.com>
To: geert+renesas@glider.be,
	magnus.damm@gmail.com,
	john.madieu.xa@bp.renesas.com
Cc: claudiu.beznea@tuxon.dev,
	linux-renesas-soc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
Subject: [PATCH 1/2] soc: renesas: r9a09g056-sys: Populate max_register
Date: Wed,  5 Nov 2025 09:05:25 +0200
Message-ID: <20251105070526.264445-2-claudiu.beznea.uj@bp.renesas.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20251105070526.264445-1-claudiu.beznea.uj@bp.renesas.com>
References: <20251105070526.264445-1-claudiu.beznea.uj@bp.renesas.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>

Populate max_register to avoid external aborts.

Fixes: 2da2740fb9c8 ("soc: renesas: rz-sysc: Add syscon/regmap support")
Signed-off-by: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
---

Changes in v2:
- none; this patch is new

 drivers/soc/renesas/r9a09g056-sys.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/soc/renesas/r9a09g056-sys.c b/drivers/soc/renesas/r9a09g056-sys.c
index 3ad1422eba36..16b4e433c337 100644
--- a/drivers/soc/renesas/r9a09g056-sys.c
+++ b/drivers/soc/renesas/r9a09g056-sys.c
@@ -72,4 +72,5 @@ static const struct rz_sysc_soc_id_init_data rzv2n_sys_soc_id_init_data __initco
 
 const struct rz_sysc_init_data rzv2n_sys_init_data = {
 	.soc_id_init_data = &rzv2n_sys_soc_id_init_data,
+	.max_register = 0x170c,
 };
-- 
2.43.0


