Return-Path: <linux-renesas-soc+bounces-21802-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 2B2DEB54A37
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 12 Sep 2025 12:47:59 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 7F108586D53
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 12 Sep 2025 10:47:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1125D2FD7D8;
	Fri, 12 Sep 2025 10:47:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="NWmFk/hT"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7FD6E2FDC58
	for <linux-renesas-soc@vger.kernel.org>; Fri, 12 Sep 2025 10:47:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757674060; cv=none; b=FUMALgBX/ZsbDw6Lb9VMYhAK14r2kcJsgCXwc7a5t/vEsUOYMwY72sU51VpFivk0SO2gVG+SI26qnVeKQVbRGnBHZzg96aAQltU/VUUYUrD7+93N1ZOfpoN0hlkhK70HWyuhtD4hMdVr76Us33fb5Rg1muyDMpsMCuIo5YXqLP8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757674060; c=relaxed/simple;
	bh=jEe+LssdJuX0Sol/ICpsmWzbrOJwv26l/qHv6esdx/k=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=QDLkphZbb9q6YcLUzMG16wE+Iw/2+ckfr2ZBciqLPl1/FmH6oT/O1icZRVITJHgYeUWjP3INJy3jPacQ2qGJRGsUq/jcfa4wb2QAFzIerhbodRUCJcHwh/RCU2vb865Ta2ZPoKEB01u/GqPZB+m8R1a0fka8Bd+jSzv49wILaDk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=NWmFk/hT; arc=none smtp.client-ip=209.85.128.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-45b9c35bc0aso14909485e9.2
        for <linux-renesas-soc@vger.kernel.org>; Fri, 12 Sep 2025 03:47:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1757674057; x=1758278857; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=1S7AuUlSi67Znb0Wq+XUSupvk0GbKEmlDvc8tRj0Jnw=;
        b=NWmFk/hTtB4O9nB5UxL237V6ljbhej4rW+y9tBWLMRssjN77rUPuqY1RauCmtper8z
         w9YoEbOJqnr0l9QCm4v+S4wo375Ey7PGWtEA+Djt72YMhb/dGB/uH5xAdtzMn9k4eA/o
         G7NwHn2HFGGIfktOE0JQLjklzQrv6FyN2v6gA0sDxP452u9uGT9rGz3Ken6SqfEOFI6z
         MCsKv2aN1I4pXrHa63B1/rOHksF81RXzGLamOYrtbZfb72jgI6KJQW93vt9Ifm2ns9+L
         PwVzG+bsb5pqZbQqXUBWDxqniV944gzgVDJMRpPLCt+EOV6Q9NCysjvGdFNtf55QnFwX
         djXQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757674057; x=1758278857;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=1S7AuUlSi67Znb0Wq+XUSupvk0GbKEmlDvc8tRj0Jnw=;
        b=VxuD1lSHN6uz71QKzFbflRNOamQwRQQe0MU6beh/xRehugvNidsf/9N9zCxomC8n12
         jvP1kUKig9TQVMJv/vOQ7rw8wH1GOd4SsYK4HSE1rZKRIYTQdsvTMXZK4sZWQJ1G8EUI
         YvSolqgb5AHDCXWytvy307IxK8Gfs9HQCGlUn86cNeSZmmBV6ldLRb7Rt4eqB9ZL7nRw
         H2knAVa9sNRJchbS+ktJfTDGFhjdMwUoaHYExkr2E5l2ZnvVTe/OMNt298NJWuGjbcxI
         zr1E1aPeuvUMZwUZsIPopBbAAngC93lbFuF9Mfaf2skUAnhXpqYS8tL5wdrzviQ8f7bL
         vqpA==
X-Forwarded-Encrypted: i=1; AJvYcCUCkP+9wuywUcb6de4u7XpAj3XRJAaw+s7Ma76S6h6ylDOkLwzY8t8e0bAJikdf8ZyIXJpCvy9xA/xvGNl0s3z3mA==@vger.kernel.org
X-Gm-Message-State: AOJu0Yy9wQtc0dd+2xE/B4DqAuZTNfATfoNGQ0HIPMrd3chwdjS87KlM
	cdeB7tx1jYoM8k44i7qWLCLPvkXnQXW7mjbI062BI3AcXbPC5qnLmQ8J
X-Gm-Gg: ASbGncv0vVzE7TrdX05buWzgsOWcv7g3yBOjkflGT9P2iBs7tIUtnbW8hSClgeoU5sY
	gGPAUSQRDLafGIomS+p5pTlWhEBqjdz6En+nV2/lbr1PN9s6avUy7KZEKD3/dgmIMPx8smBHTby
	L09JNOXJWGPtPUWU5/S8a2TjWbdKR+J0uZnWAU0FOKYCSo2VRnyOo12b5rXdhtUQbDKpqYDH+ip
	Ggk/XAFUsJgjgWWhXLBhhnBpJ/tNNa1Px1ElRTV9ehd5rXmAVJ4399vHk9JhlIgrkr9/GDMZdQy
	ragp+oy8Gm6r31+wKmNU1ndc6/fMIDY8t5Iz/Ht+zaq8yjaglCgFVW6kViY62CuB976+CjWk4O3
	fA6OzUI5P7qHF/GrUvOD7kRH8UFEnk248/Pr8VUMwcdQg6UmfshLsUQQ3ZJBxSGyoavsf+f8jjZ
	0p2w==
X-Google-Smtp-Source: AGHT+IGGQn4z6FJczqoIOf8FijkX45T6VbvuIudJ+ZXc3G02iFJUUELPhSpYW2NzZxdr0hLI4woaSg==
X-Received: by 2002:a7b:cc91:0:b0:45b:8039:6196 with SMTP id 5b1f17b1804b1-45f211cce4fmr18730275e9.4.1757674056487;
        Fri, 12 Sep 2025 03:47:36 -0700 (PDT)
Received: from biju.lan (host86-139-30-37.range86-139.btcentralplus.com. [86.139.30.37])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3e7607cd329sm6197316f8f.31.2025.09.12.03.47.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 12 Sep 2025 03:47:36 -0700 (PDT)
From: Biju <biju.das.au@gmail.com>
X-Google-Original-From: Biju <biju.das.jz@bp.renesas.com>
To: Marc Kleine-Budde <mkl@pengutronix.de>,
	Vincent Mailhol <mailhol.vincent@wanadoo.fr>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Magnus Damm <magnus.damm@gmail.com>
Cc: Biju Das <biju.das.jz@bp.renesas.com>,
	linux-can@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>,
	Biju Das <biju.das.au@gmail.com>,
	Vincent Mailhol <mailhol@kernel.org>
Subject: [PATCH v2 2/7] can: rcar_canfd: Invert global vs. channel teardown
Date: Fri, 12 Sep 2025 11:47:20 +0100
Message-ID: <20250912104733.173281-3-biju.das.jz@bp.renesas.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250912104733.173281-1-biju.das.jz@bp.renesas.com>
References: <20250912104733.173281-1-biju.das.jz@bp.renesas.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Geert Uytterhoeven <geert+renesas@glider.be>

Global state is initialized and torn down before per-channel state.
Invert the order to restore symmetry.

Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
Reviewed-by: Vincent Mailhol <mailhol@kernel.org>
Reviewed-by: Biju Das <biju.das.jz@bp.renesas.com>
Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
---
v1->v2:
 * Collected tags.
---
 drivers/net/can/rcar/rcar_canfd.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/net/can/rcar/rcar_canfd.c b/drivers/net/can/rcar/rcar_canfd.c
index cf70029968ad..460bb62bbd08 100644
--- a/drivers/net/can/rcar/rcar_canfd.c
+++ b/drivers/net/can/rcar/rcar_canfd.c
@@ -2203,14 +2203,14 @@ static void rcar_canfd_remove(struct platform_device *pdev)
 	struct rcar_canfd_global *gpriv = platform_get_drvdata(pdev);
 	u32 ch;
 
-	rcar_canfd_reset_controller(gpriv);
-	rcar_canfd_disable_global_interrupts(gpriv);
-
 	for_each_set_bit(ch, &gpriv->channels_mask, gpriv->info->max_channels) {
 		rcar_canfd_disable_channel_interrupts(gpriv->ch[ch]);
 		rcar_canfd_channel_remove(gpriv, ch);
 	}
 
+	rcar_canfd_disable_global_interrupts(gpriv);
+	rcar_canfd_reset_controller(gpriv);
+
 	/* Enter global sleep mode */
 	rcar_canfd_set_bit(gpriv->base, RCANFD_GCTR, RCANFD_GCTR_GSLPR);
 	clk_disable_unprepare(gpriv->clkp);
-- 
2.43.0


