Return-Path: <linux-renesas-soc+bounces-23915-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id AB247C21930
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 30 Oct 2025 18:56:00 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 4C98F3BEBA9
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 30 Oct 2025 17:55:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DC87E36CE1B;
	Thu, 30 Oct 2025 17:55:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="JJxsvXJy"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-wr1-f52.google.com (mail-wr1-f52.google.com [209.85.221.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E3D8436C252
	for <linux-renesas-soc@vger.kernel.org>; Thu, 30 Oct 2025 17:55:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761846936; cv=none; b=peq57N64XVpGQW2HuQKUjPoi8Z/oEf7s2kKrcadYyxh+pKjTL0f0h+cKB8Ach4Krpogft8MttZOWQWeop7QV3GeilwBuXx3cpl1mcUpgiO6fPJlMbp1lFEXIvu8CNvHRDal7Gq4ySE2CRHhCVEJSkiNKeXmnfSYhb9jcxW9pjd4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761846936; c=relaxed/simple;
	bh=KXgzGd6gNo09gi0VZSrUZARuDuGxlTCFI7gHi/TqNjw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=lNM8CnbZfda1lJxmv4tm2sCmjfxjmIkHRXG2RG8GQAYKvKM5nUs2X1Ni4nz37ziGKQy1GmF3ORlNheU7njyZjPdFEjpFPSbOar2Pi8bNs7hAEcPRcDwVUBQIw7Z01q9+/vBmCuf/KLR+MVaLb3TCXYS7Fd8EimwXzFHXWcD0f5I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=JJxsvXJy; arc=none smtp.client-ip=209.85.221.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wr1-f52.google.com with SMTP id ffacd0b85a97d-429be5d31c9so18938f8f.1
        for <linux-renesas-soc@vger.kernel.org>; Thu, 30 Oct 2025 10:55:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1761846931; x=1762451731; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=NV2npGkfv500PmnI9y9LBiyb4UX94aZHfGA0F6aPZeM=;
        b=JJxsvXJy8xGyi60rXx7saWafLF4CUHIy0MhtDrZxYJWXUbS3oekbNu01FzAOzQld47
         FMX7j4GMcj90L07+YyRQ4kGHznI6/O0lj8a+lA3muhDCHTMR07QvVdOkkAAaI7ebMKkn
         F80hlCO8RufaMl9A9UEpyzEGlWmwacZNhbqzm8NxBcoOOEdfl1WHOqgaNtiMuD9HrgQ3
         o7CsC4ckQ7Dm2SZu0mohcdpJt9AtwYmxxppYM+Byfb8Gl2Yg+WKn8ZeC2F4SKCjapOnB
         An5Oni7TdMwpFxD+blL1yqigB+OoCZWRjQmIvr0qo0AmseCr8XY05chIbSrAPQaRRiXq
         1a0Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761846931; x=1762451731;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=NV2npGkfv500PmnI9y9LBiyb4UX94aZHfGA0F6aPZeM=;
        b=uyBQNwIp9VhonCAKQrVvNt+U6UCzTzXN7s4i2a7yF+Yqhfb8PfqBZC5UMCNJvLluZx
         5N78ockufmOlmKKkl39ncB2E60kzgu4CiCB5Wi3nZDEn+TprKpxqzcvwS7OTav4AreoT
         c/mwpXbF49x4HZ70Pba07IiG10ci8zj+YwY6LyIjA1VvqnseIHPvL3KJYJo7OMI/juwt
         +PixXoHR4wixNLJQ1ziF8BCzwVl2v8HjOtYyUJ6nNd4cI2jcAV9beBVo+SzLY2voCcYR
         whLs/ndtB9g3VIv2jpWRhvwE7/4/P3gpz+hV2e757f+DGr7ffd4jpDQ139u4EknD22xs
         tgkA==
X-Forwarded-Encrypted: i=1; AJvYcCV18Z3IxHGbhXvfBJDy8ToHhpLzLePt05Xc07urZ8+sZDu1QsDjCU+RHLrNA3Yb0a+4DmAgdzWA6LnG7FSgE0sJ7A==@vger.kernel.org
X-Gm-Message-State: AOJu0YxCR78QSIKauRdfMuafyxne/r8PAoaiQ1dgOdP/CosiALy3Mts5
	WXeB5t9CeU0OPwKDRgx8XoKZTN5DGg8N4CXlWJiI9d6uYtUkkZN4pGZ5
X-Gm-Gg: ASbGncsZaESXmo6IQLXm9JaBSFj4lrfySz/x/7Ed7pTLWyrNkoPipsBEIXGQqPEBVXa
	oFhrOR0C+HJ7jKZIMtIu0kAIsonymW5DAWXeCeSIa3xcZi/BVRPFUbL2cplS5fRZU8Et4t3USVV
	dOd45BOQRSBfTHRKE/2gUCC5LILdcMzKOVe2Uk+vCYMKNJf4yTiteiFV2YQ7PMZPxIIfu1dIGra
	4UKlR0VMZyVfpryAdh1TNizA7evwrKymd/dCjL6OhA0cPFIffd/ANvrPza3KemHucznmFtHbsdq
	m1mZPMQEiOTsUkVoBom+1QsJ9+nG4L+6jX6wgH1aF40nCpyNGARlJeK8QjQ0OY4+gKu73v4NXCT
	nFFCSl5zt8dgUQzGm7fcYYPT89HONSVM2LPf1s3O3760IUrn46p0SOi6zaPatYoMXfSVSiQtUwW
	6qVj8/nXXJzDfrfnNT1jAarEXNhlENyjQ7qCFo1JeCL6XnzHb9uqsc2loy2gLqPxDbpjVSync=
X-Google-Smtp-Source: AGHT+IHMkjvLfmwalDhCBBe8OAxHC/LlNBETUVjK4U+fGTxaXOKW/TVcRRYQUO/q05YhnrUanlIZGQ==
X-Received: by 2002:a05:6000:2306:b0:427:5eb:d82d with SMTP id ffacd0b85a97d-429bd68d047mr428378f8f.17.1761846930766;
        Thu, 30 Oct 2025 10:55:30 -0700 (PDT)
Received: from biju.lan (host86-162-200-138.range86-162.btcentralplus.com. [86.162.200.138])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-429952de5f9sm33384041f8f.38.2025.10.30.10.55.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 30 Oct 2025 10:55:30 -0700 (PDT)
From: Biju <biju.das.au@gmail.com>
X-Google-Original-From: Biju <biju.das.jz@bp.renesas.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Jiri Slaby <jirislaby@kernel.org>
Cc: Biju Das <biju.das.jz@bp.renesas.com>,
	Wolfram Sang <wsa+renesas@sang-engineering.com>,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	linux-kernel@vger.kernel.org,
	linux-serial@vger.kernel.org,
	Biju Das <biju.das.au@gmail.com>,
	linux-renesas-soc@vger.kernel.org
Subject: [PATCH v2 04/13] serial: rsci: Drop unused macro DCR
Date: Thu, 30 Oct 2025 17:55:08 +0000
Message-ID: <20251030175526.607006-5-biju.das.jz@bp.renesas.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20251030175526.607006-1-biju.das.jz@bp.renesas.com>
References: <20251030175526.607006-1-biju.das.jz@bp.renesas.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Biju Das <biju.das.jz@bp.renesas.com>

Drop unused macro DCR and its bit definition.

Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
---
v1->v2:
 * No change.
---
 drivers/tty/serial/rsci.c | 3 ---
 1 file changed, 3 deletions(-)

diff --git a/drivers/tty/serial/rsci.c b/drivers/tty/serial/rsci.c
index 504361ed5ecc..470b5701cd67 100644
--- a/drivers/tty/serial/rsci.c
+++ b/drivers/tty/serial/rsci.c
@@ -24,7 +24,6 @@ MODULE_IMPORT_NS("SH_SCI");
 #define CCR3	0x14
 #define CCR4	0x18
 #define FCR	0x24
-#define DCR	0x30
 #define CSR	0x48
 #define FRSR	0x50
 #define FTSR	0x54
@@ -119,8 +118,6 @@ MODULE_IMPORT_NS("SH_SCI");
 /* FFCLR (FIFO Flag CLear Register) */
 #define FFCLR_DRC		BIT(0)	/* DR Clear */
 
-#define DCR_DEPOL		BIT(0)
-
 static u32 rsci_serial_in(struct uart_port *p, int offset)
 {
 	return readl(p->membase + offset);
-- 
2.43.0


