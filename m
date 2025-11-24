Return-Path: <linux-renesas-soc+bounces-25056-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [142.0.200.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 7AB03C7FE14
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 24 Nov 2025 11:28:53 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 5F3654E4106
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 24 Nov 2025 10:28:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8B4542F9C39;
	Mon, 24 Nov 2025 10:28:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="CD9x6lvU"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E7C612BE7C0
	for <linux-renesas-soc@vger.kernel.org>; Mon, 24 Nov 2025 10:28:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763980125; cv=none; b=naf68Pb113GyvIewKrM/k8xjv3Ta+ElmaiqBtnYrB2jWWx+WvfStA3KOwdDpr7AKxuRleUC5nba43WMswSTDsbzcxNjX7+pHwPEcNqcpBbvzRO6C3HpbVC5e18z4f0W4DN/qd3VH4m5bhYsA0EB2nJwpKY/7P9xqBdGDtXc++hE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763980125; c=relaxed/simple;
	bh=Gv1p1qFtgqVq/hlWSzsyiuvBbNBS6q1HICEEW1Sy8N8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=ZaSlTecxhqpgyXTKGezu4QKy2FhUI7cEPSzcZ5q6drP9OZ8wQ1dx5vGFgwDSY9/iqF2KPN9td8jCiAtI0yysWj7qlqjyyE9n9L6u8Q0aUN7suUL6w7z6IOQ8F9dxOUP8RegtBGOoCZX/Dx0SvSxE3pqLHERMyoK+Elux2qxwe+k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=CD9x6lvU; arc=none smtp.client-ip=209.85.128.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-47775fb6cb4so26428985e9.0
        for <linux-renesas-soc@vger.kernel.org>; Mon, 24 Nov 2025 02:28:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1763980121; x=1764584921; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=v/lCM7b3NP2vHVQh7B6VQTEtsXsCikhEIHSatdbk53Y=;
        b=CD9x6lvUw8kaqIDKsdL2KzZKgmvzxjQ7UGqmqjh8/RxmR924iF+A1+bVxPd3KMsfyU
         513uTCqCQuyH63UTx1rW914FRxMXmmZzL54AMFk6vy6NDk5zOvQw0DGniTn0xV+y6R4P
         acC+fAzv72vPEiEIXwyN/bR6ftHtShj4wiWpkSyURKuAgLw3voMbxMlHE3njlUE3FnMG
         dBxPBZIB+5Ax8iegaOoJXDMDNFA002deW/L8k1+Y2Xx7cPF+v+k6FVY1ERYt35oHZl3k
         gUj+JWxKMycGnLtxAO0ngCKK25/lvEd1qpUmFvjb68LOqHSq/wGIJA7mLqakwtd7Jlzx
         Upyw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763980121; x=1764584921;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=v/lCM7b3NP2vHVQh7B6VQTEtsXsCikhEIHSatdbk53Y=;
        b=TxV/dYLuoBw/78MOG+Q8c3cnW3Iowjx5rd3OOC9pFH7hd2iIjr5jCUllrXdtMRAUo8
         0Zp8BrOmSsSib4/rhPWlD0wcrAQJebYFaPyvDKLRXgjnyB63EMVM4bCzAUcp9gn7FxHR
         n6kXP/cCfHRvh8x34b6Onvyaw3T3YRzCEN+K3UoX98unNav0tmG0EttfHwOquIRiKtGa
         kq3e7JKKCssPqiIG3/ge42eIqCTLRhmAFBEAabgJLYNOvNXeMk42Y47vhCRBPH+V+x2e
         rqHc2qg2T7RBefZyckwlF1CD8EoTw7OdXY7DmvE8vbLB2x/F/YqomUhb5F+zCMMxKpkj
         FnRw==
X-Forwarded-Encrypted: i=1; AJvYcCV1JCRfzMV2ulkyDQUDQVBJERS/AIbdykC+ESv7hqJ2ZAaZaQUDwV4aGs5fDCieV/xJsbSDWIhK2tubuPanrEg2ng==@vger.kernel.org
X-Gm-Message-State: AOJu0YwUc7DD9mdXi3tNfqHOWikq7+3wS4T0tAXoqcKVsb6QTOxZhJnI
	d/zHDDaM8lC8+9v591mZs3gVsxlw+jCdUWKmAb7QY1ARy1ImslYTw2jE
X-Gm-Gg: ASbGncuuAV1MjTLRbwe+AoK6uuaXs6NGpoQAlIjlee/wgS+UW3TFwOpWwegVDIwAeFU
	PgUY5kI5KUu/adKewZWBCkQu27Kw92LcL4dg70tE6CgyAtKO1BiqIpgU0vWVSCrrshu8Th/l/eA
	UD83gC4FsnQi3Nc8QXjrUKHxnbwtDigWXYOfUGrA3zEhCJaQech1/iaAr0UFVU7b9k85fDFCI1Y
	cPbqYGuUo8qgtax0ys9OuF3taTqsZFZHOK4XE/jlM6T6/gRr8eU0KgHCtGPHF2Z9l6lG/N/HAnQ
	6SdbUAiYTHh5NzWxeftER5k6DXEB3V16ZO77zBaY8xrZ/LUw5aNuHGUnAnf8WndOMbLda+WCX75
	CRk+VM1PmUKQwxG9ffOIJGS00pgJaHlwFcXx0F90ejN8lH7/iiwn42vIierE8rc1TpzKHoq/NWK
	2i69EPVKbghBG8IJAvCAMf84zCfPEhTSh7sUnKSZl+kr2weOVj6waL6ncKVofkwpgQna3mJ6QYG
	thPB6pHByoRD+Ip
X-Google-Smtp-Source: AGHT+IE1Wu4cnnS2yubMRh/9JOsB11KmbzSedpxoYaakH7zmTVKVbY5LsdGtqPUlk4li0q4DKBmVVQ==
X-Received: by 2002:a05:600c:3511:b0:476:d494:41d2 with SMTP id 5b1f17b1804b1-477c112f7b1mr104835185e9.29.1763980120947;
        Mon, 24 Nov 2025 02:28:40 -0800 (PST)
Received: from localhost.localdomain (host86-162-200-138.range86-162.btcentralplus.com. [86.162.200.138])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-477bf1df334sm186753945e9.3.2025.11.24.02.28.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 24 Nov 2025 02:28:40 -0800 (PST)
From: Biju <biju.das.au@gmail.com>
X-Google-Original-From: Biju <biju.das.jz@bp.renesas.com>
To: Marc Kleine-Budde <mkl@pengutronix.de>,
	Vincent Mailhol <mailhol@kernel.org>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Magnus Damm <magnus.damm@gmail.com>,
	Philipp Zabel <p.zabel@pengutronix.de>
Cc: Biju Das <biju.das.jz@bp.renesas.com>,
	linux-can@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>,
	Biju Das <biju.das.au@gmail.com>
Subject: [PATCH v3 1/7] can: rcar_canfd: Invert reset assert order
Date: Mon, 24 Nov 2025 10:28:26 +0000
Message-ID: <20251124102837.106973-2-biju.das.jz@bp.renesas.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20251124102837.106973-1-biju.das.jz@bp.renesas.com>
References: <20251124102837.106973-1-biju.das.jz@bp.renesas.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Geert Uytterhoeven <geert+renesas@glider.be>

The two resets are asserted during cleanup in the same order as they
were deasserted during probe.  Invert the order to restore symmetry.

Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
Reviewed-by: Vincent Mailhol <mailhol@kernel.org>
Reviewed-by: Biju Das <biju.das.jz@bp.renesas.com>
Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
---
v2->v3:
 * No change.
v1->v2:
 * Collected tags.
---
 drivers/net/can/rcar/rcar_canfd.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/net/can/rcar/rcar_canfd.c b/drivers/net/can/rcar/rcar_canfd.c
index 00c3462fc975..6098a3eebc43 100644
--- a/drivers/net/can/rcar/rcar_canfd.c
+++ b/drivers/net/can/rcar/rcar_canfd.c
@@ -2213,8 +2213,8 @@ static int rcar_canfd_probe(struct platform_device *pdev)
 fail_clk:
 	clk_disable_unprepare(gpriv->clkp);
 fail_reset:
-	reset_control_assert(gpriv->rstc1);
 	reset_control_assert(gpriv->rstc2);
+	reset_control_assert(gpriv->rstc1);
 fail_dev:
 	return err;
 }
@@ -2235,8 +2235,8 @@ static void rcar_canfd_remove(struct platform_device *pdev)
 	/* Enter global sleep mode */
 	rcar_canfd_set_bit(gpriv->base, RCANFD_GCTR, RCANFD_GCTR_GSLPR);
 	clk_disable_unprepare(gpriv->clkp);
-	reset_control_assert(gpriv->rstc1);
 	reset_control_assert(gpriv->rstc2);
+	reset_control_assert(gpriv->rstc1);
 }
 
 static int __maybe_unused rcar_canfd_suspend(struct device *dev)
-- 
2.43.0


