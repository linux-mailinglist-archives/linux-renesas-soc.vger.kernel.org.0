Return-Path: <linux-renesas-soc+bounces-21807-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 790E9B54A40
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 12 Sep 2025 12:48:14 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 88483487260
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 12 Sep 2025 10:48:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8AAF12FF14F;
	Fri, 12 Sep 2025 10:47:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="kBgbfLUo"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E1CFA2FD1D7
	for <linux-renesas-soc@vger.kernel.org>; Fri, 12 Sep 2025 10:47:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757674063; cv=none; b=N0crqtqN+b8vuZZcqHN3IAbNQiSLPkDLrwBOHyk5iC0htcFcBEar1VfLAJECmRdJDbanXjVSDwTFlltShQEu0FMG2lfNVdcnq9lVhaSzXzwP7Os51wrIOze58WJ6J6Zp9oeCZQuOMlfp15w9d10IZKa1cm6LcNiVqUd6AOh+dF8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757674063; c=relaxed/simple;
	bh=FLVOM1yiYyuAFtJIVpam2KGFjLS7vml22aG5VkRxxpQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=hodLgAeBtQCkKKHiHafK5go7cjxO1O8ZMWvvAPwGFxM47DJbWLUdSPOGmi9BePaFYGFszviDI19WxgC1QH3IQz8lsSIdz058qtUO0+5GGgPjN+VHh2EFdZKIrNdEco2ZjLyc8YHpzyDZk7WHjp40CkKeve5lYRF/fay/aMEnwHE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=kBgbfLUo; arc=none smtp.client-ip=209.85.128.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-45b9853e630so15599745e9.0
        for <linux-renesas-soc@vger.kernel.org>; Fri, 12 Sep 2025 03:47:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1757674059; x=1758278859; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=XOFjcyob18/q6ECu1uYjWXtT3k120lD6uL6jj6365H0=;
        b=kBgbfLUonxox/sKmbToMx1NBuoJbRMJveK5mp/chObYYlOJLCHWmFEKIgVfWkUYnT8
         DhQqb5Y0gonYGr4mc9uKyNhp9tuSFTABh/Trt9qNShBM1EyhbnTChdltjVNcOn+vfXaa
         MNE6vwEHE/1IgAnLsKdXrdT6gF8+un+aSf92MEsc81Y/shIKN8G+rS6rrAQ5CdoTiN5g
         nX3DNthPHtxBsMuMksjxjwTqo4hxj6R4Yz1e4eGgkTZ1mdQORqiSSD8WqBULJWDl4ZBa
         RgCohY7o6ucSsZ3lA3XG8TLgsBNwxKKR8HT8eOTNxp/fHkWxjRykeK+q2DsEC+PVE7mE
         zNpw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757674059; x=1758278859;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=XOFjcyob18/q6ECu1uYjWXtT3k120lD6uL6jj6365H0=;
        b=vFsdOPiqjMCpMxyNTl5MIIP+0ZBWtxnNFFgfud9oloA1DM5wueVukd/wWy6zWHjo3H
         mroCpRNfow2bmQDltTK9yrnK2KXev5i5gQKvsERCdfW1qqqbZ15kKItKx+hIE/G4lf4j
         /ECwk/ocgnU5lZwy/oPsUP+OQojbb7bKTUDOAoXDjrjlOxJRHoktiaDKuZNx/VmFqC1P
         c4ABylcaWjpuSm+uPjrM6K0lwgYRQSqqX/NWsxXvyZ0Kz+3wNSYE1xDdL27svhkFzioA
         iEQipvtRXPzERG532xAeZTI3DmhfRbGeGF6xbEA606uktsHyiNuXCcEzPpK1FdH9ghQB
         wHhA==
X-Forwarded-Encrypted: i=1; AJvYcCXJI6tG0MnNNmiIuL8cvziHtsxJDKplwfxJPv5+msWEwjGUcaEDiGb5vEtj0MTUtTjdpm48OnrcNnhTc8ZmDMfqMg==@vger.kernel.org
X-Gm-Message-State: AOJu0Yyy3qGnPD10OZBxsTT5ipEDpPJwVWP7SVm8CYPVqXTXJaPilZ8P
	nIEhUY+Vj5UEWqMhi1pTWGHfsnbX3GTAj4WS9XFPuZX8ffa/t9423NWP
X-Gm-Gg: ASbGnctYKad0x6kqSggACJ/NRfalZ0U9EUXB4Zr5waHN6po+SeIRGinXL+QEG8vZjJi
	d/jyDREh1wKJr/X8g98gSCWW+524dgI2kWfQOlnNbr/TJPQIjTcdZi2jgKFEUbcKLqKLPAGVqUO
	y9KrUfXtSIklr7PfgqgdTWY3SwcL9iXkxrmAD6MN8g2/7Jvnr8nTlnKr3OrZR+6sBFJoeYw22nv
	mO7ROrf8uKxRu/aORMcRr8iAs7A35cn9p0PzJGcCJrooGSFQlXyMlw4QziSE261v+03U1UwP/XG
	3wyBdmPBwwX1cg1+gL5cfY+dNLvY94ZSzrN1sakWKkKncgNlMi5mB1dvT6HHnHL0L76GgYRnPcY
	d72bnt6vjtm1D2oEEGLaEwDVtUCdm4Ev+Z/OfMt6eNNH2p0a+DC8GPCWzSLgYNTN1jakmDDxcmh
	/1iQ==
X-Google-Smtp-Source: AGHT+IG+MQ3VtX94CzZfBzHv/ax7NYQ5GX85/Fpluu2HaIVgidvgyUMgFKd0uhvvk9hwI25G0f/Uvw==
X-Received: by 2002:a05:6000:18a4:b0:3e4:f194:288f with SMTP id ffacd0b85a97d-3e765a56cf5mr2172263f8f.62.1757674058849;
        Fri, 12 Sep 2025 03:47:38 -0700 (PDT)
Received: from biju.lan (host86-139-30-37.range86-139.btcentralplus.com. [86.139.30.37])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3e7607cd329sm6197316f8f.31.2025.09.12.03.47.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 12 Sep 2025 03:47:38 -0700 (PDT)
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
	Biju Das <biju.das.au@gmail.com>
Subject: [PATCH v2 6/7] can: rcar_canfd: Convert to DEFINE_SIMPLE_DEV_PM_OPS()
Date: Fri, 12 Sep 2025 11:47:24 +0100
Message-ID: <20250912104733.173281-7-biju.das.jz@bp.renesas.com>
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

Convert the Renesas R-Car CAN-FD driver from SIMPLE_DEV_PM_OPS() to
DEFINE_SIMPLE_DEV_PM_OPS() and pm_sleep_ptr().  This lets us drop the
__maybe_unused annotations from its suspend and resume callbacks, and
reduces kernel size in case CONFIG_PM or CONFIG_PM_SLEEP is disabled.

Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
Reviewed-by: Biju Das <biju.das.jz@bp.renesas.com>
Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
---
v1->v2:
 * Collected tag.
---
 drivers/net/can/rcar/rcar_canfd.c | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/drivers/net/can/rcar/rcar_canfd.c b/drivers/net/can/rcar/rcar_canfd.c
index f0dfab177b98..a0c16a95808c 100644
--- a/drivers/net/can/rcar/rcar_canfd.c
+++ b/drivers/net/can/rcar/rcar_canfd.c
@@ -2255,18 +2255,18 @@ static void rcar_canfd_remove(struct platform_device *pdev)
 	rcar_canfd_global_deinit(gpriv, true);
 }
 
-static int __maybe_unused rcar_canfd_suspend(struct device *dev)
+static int rcar_canfd_suspend(struct device *dev)
 {
 	return 0;
 }
 
-static int __maybe_unused rcar_canfd_resume(struct device *dev)
+static int rcar_canfd_resume(struct device *dev)
 {
 	return 0;
 }
 
-static SIMPLE_DEV_PM_OPS(rcar_canfd_pm_ops, rcar_canfd_suspend,
-			 rcar_canfd_resume);
+static DEFINE_SIMPLE_DEV_PM_OPS(rcar_canfd_pm_ops, rcar_canfd_suspend,
+				rcar_canfd_resume);
 
 static const __maybe_unused struct of_device_id rcar_canfd_of_table[] = {
 	{ .compatible = "renesas,r8a779a0-canfd", .data = &rcar_gen4_hw_info },
@@ -2283,7 +2283,7 @@ static struct platform_driver rcar_canfd_driver = {
 	.driver = {
 		.name = RCANFD_DRV_NAME,
 		.of_match_table = of_match_ptr(rcar_canfd_of_table),
-		.pm = &rcar_canfd_pm_ops,
+		.pm = pm_sleep_ptr(&rcar_canfd_pm_ops),
 	},
 	.probe = rcar_canfd_probe,
 	.remove = rcar_canfd_remove,
-- 
2.43.0


