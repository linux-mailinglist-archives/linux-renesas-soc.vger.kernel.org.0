Return-Path: <linux-renesas-soc+bounces-23904-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 1F03DC1FEE2
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 30 Oct 2025 13:06:39 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id F029D425A2E
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 30 Oct 2025 12:05:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 38651314B7A;
	Thu, 30 Oct 2025 12:05:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="H+c0wQjG"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3A8532FDC29
	for <linux-renesas-soc@vger.kernel.org>; Thu, 30 Oct 2025 12:05:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761825914; cv=none; b=fUU0avSjDtfhiad/cCtnRNz62zcTDxcMB9sNBIHsVRrmNkK5d6k2XJxfv9N1OPSPR/bqLRp8k4QgWnEsJ3IlYAyR8GUljkJ8gJmmfaXbevw+9umBKwM0u5x2ihu7rFaHnyVMi5eM02Jb0ULye9CBzipIT4d9dUx9ThQK4K8Hce8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761825914; c=relaxed/simple;
	bh=Nnmy/nhRXy1Jb2EolZDFX082PZeZ22LYX0yNSq8ROCg=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=Cu3iCzEL+byHQ4s3OQuSuEYtu/JZI1enNl+wEn8Gb1mbw8916Bma+6Vn6TDXXWAMAVOjHcQf22rGTK+WFQfhp8yTWKkkH9EOfYeDX5VVuAYmoREcSI3WVCUAUSSx4xs7kAabeaDnvkm7QnXOj+BHlOlL8aTGpcom/tQsM0MUMDU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=H+c0wQjG; arc=none smtp.client-ip=209.85.128.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-471b80b994bso12187925e9.3
        for <linux-renesas-soc@vger.kernel.org>; Thu, 30 Oct 2025 05:05:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1761825910; x=1762430710; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=OCpWVCeFoXMs1/EyJIuFGqtdg2vmYZ9/7tM7s70z/qU=;
        b=H+c0wQjGAMRqI3BM58JSCWRYsnmL6RELy9aBlGdO+v9a2eUJku4z08/XkbAGVY26j+
         8JVFUQ7Z9qOncEzCGwXN/tYAv0vhW28YkqFGNBwbqBYmlpo+3UNIxlEFn95diBkGnKfU
         IjmIFasmTsktL++A+MamH8kynWkPEu4Orp6colEwN10japUSkzvYYXyq4WHk1hQABosL
         4ZU7dgNI6kxuUVjsTPm2qwLOMtCPBteJ7/gIH1Z9AbXtHBaoqPkagiPgfPni2BjycveW
         8KwFFJxfNeToyWvhJa9IMSj2tUQ2xzRkKum1OJg20BBfdN/SkJBPWTewzBKLkZeCwn2e
         49vg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761825910; x=1762430710;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=OCpWVCeFoXMs1/EyJIuFGqtdg2vmYZ9/7tM7s70z/qU=;
        b=Bdi89ZqMMK0X5uVW1v8EuB+wLap7NIi/sP7u6Thfb2FAOzLTjpCODcdZJjkIN1+vHC
         GqtozrdEE9bidOvua9/4DleCX+2QmMYJNdwKYjxNSzVtAu47lkUnauVJHFVpuz6hPq9A
         IBJK5m1SaFr6F5IU35cEFQKM3llNnZTHO7wPQL8IV3DXqYNb4fcAJDK1/Mtg10wurPmN
         nS2n/EEBq/zZ5pq73rGwlmn+UvGFFNtn9BIUjDNa0ma9HiYRlInt+0uctagXzOzGIUZr
         m5u7aRCGMSoNe+amaZQ07IbFpav1L7FKWsPkRt3uCwbshUa3/NuCB4KqDvV6kqK1JwcE
         5hbQ==
X-Forwarded-Encrypted: i=1; AJvYcCU6izSbktkm65s5vPX42vHxlmwyR2EX4IxnU8iI90m2fN8dIAeDRRWRkUHgsgX52R9xAo8YsUE1O38GEPEYiWkqGw==@vger.kernel.org
X-Gm-Message-State: AOJu0YzdQw6jN6FxruilNmzkamZOwXKBq10KXkMzB8NlOYJj8iUYsPnT
	SbT2hpIjM7cdg+/hG91QiYc/aNAm9sEB73Z2bRJHX+OQSRzIBd5OYa79
X-Gm-Gg: ASbGncsuHiE1lHVodVNZ87Z4DL7dR9OAXGH3VusjC3mfMsanbHtwyV9DFWKDwSMUaPL
	qv5w365NVQwIpSszG+baVtVWJR0FDRwBXZTQSmezRa0rRljYs9p3pEBALft1KX2tW80CDOXLl3e
	kWcwehsnRm5sNj09PI1SGWrb40Hrs03smHqjASwcJMyMIqcQMhld6zc0XA24EhD7D3lB0GQYu5N
	QvjG3swY0bic5XNQqAKNXG7yzlAhx9jWy442W2r8HHSY49XOztR1E5X4FP6fPYkAy6A9x5qem68
	CFX5mrZ8r6ZmBe8iHVFeIsYsWCjueaSLis43dRekwcfrcz+2wB+x1IMa9F6P8FuVDKQkX70Ghww
	31C/Pc2RfbgglvdMszd/2Ya+Wf83SbraBGhQ4SXKYCWmSYFrlh9p08WydA5oOpBOC1yI3BOV7ne
	TBzMS84KZjxhmI/zrRMEI7Ag9gyGgT+baYyImJoY+FY3Uib88zb0Qc++AVvwy9
X-Google-Smtp-Source: AGHT+IFu0rRxNzi3BvOKL1lXRDq2cHd03YnzoBoOPePE4rUTNG1zrE1V3xFacaBHpTSekptbKXeGkw==
X-Received: by 2002:a05:600d:6355:b0:477:28c1:26ce with SMTP id 5b1f17b1804b1-47728c12b10mr14305245e9.7.1761825910183;
        Thu, 30 Oct 2025 05:05:10 -0700 (PDT)
Received: from biju.lan (host86-162-200-138.range86-162.btcentralplus.com. [86.162.200.138])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-429952ca569sm31018677f8f.12.2025.10.30.05.05.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 30 Oct 2025 05:05:09 -0700 (PDT)
From: Biju <biju.das.au@gmail.com>
X-Google-Original-From: Biju <biju.das.jz@bp.renesas.com>
To: Marc Kleine-Budde <mkl@pengutronix.de>,
	Vincent Mailhol <mailhol@kernel.org>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Magnus Damm <magnus.damm@gmail.com>
Cc: Biju Das <biju.das.jz@bp.renesas.com>,
	Tranh Ha <tranh.ha.xb@renesas.com>,
	Duy Nguyen <duy.nguyen.rh@renesas.com>,
	linux-can@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>,
	Biju Das <biju.das.au@gmail.com>,
	stable@vger.kernel.org
Subject: [PATCH] can: rcar_canfd: Fix controller mode setting for RZ/G2L SoCs
Date: Thu, 30 Oct 2025 12:05:04 +0000
Message-ID: <20251030120508.420377-1-biju.das.jz@bp.renesas.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

From: Biju Das <biju.das.jz@bp.renesas.com>

The commit 5cff263606a1 ("can: rcar_canfd: Fix controller mode setting")
applies to all SoCs except the RZ/G2L family of SoCs. As per RZ/G2L
hardware manual "Figure 28.16 CAN Setting Procedure after the MCU is
Reset" CAN mode needs to be set before channel reset. Add the
mode_before_ch_rst variable to struct rcar_canfd_hw_info to handle
this difference.

The above commit also breaks CANFD functionality on RZ/G3E. Adapt this
change to RZ/G3E, as well as it works ok by following the initialisation
sequence of RZ/G2L.

Fixes: 5cff263606a1 ("can: rcar_canfd: Fix controller mode setting")
Cc: stable@vger.kernel.org
Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
---
 drivers/net/can/rcar/rcar_canfd.c | 12 +++++++++++-
 1 file changed, 11 insertions(+), 1 deletion(-)

diff --git a/drivers/net/can/rcar/rcar_canfd.c b/drivers/net/can/rcar/rcar_canfd.c
index 49ab65274b51..1724fa5dace6 100644
--- a/drivers/net/can/rcar/rcar_canfd.c
+++ b/drivers/net/can/rcar/rcar_canfd.c
@@ -444,6 +444,7 @@ struct rcar_canfd_hw_info {
 	unsigned ch_interface_mode:1;	/* Has channel interface mode */
 	unsigned shared_can_regs:1;	/* Has shared classical can registers */
 	unsigned external_clk:1;	/* Has external clock */
+	unsigned mode_before_ch_rst:1;	/* Has set mode before channel reset */
 };
 
 /* Channel priv data */
@@ -615,6 +616,7 @@ static const struct rcar_canfd_hw_info rcar_gen3_hw_info = {
 	.ch_interface_mode = 0,
 	.shared_can_regs = 0,
 	.external_clk = 1,
+	.mode_before_ch_rst = 0,
 };
 
 static const struct rcar_canfd_hw_info rcar_gen4_hw_info = {
@@ -632,6 +634,7 @@ static const struct rcar_canfd_hw_info rcar_gen4_hw_info = {
 	.ch_interface_mode = 1,
 	.shared_can_regs = 1,
 	.external_clk = 1,
+	.mode_before_ch_rst = 0,
 };
 
 static const struct rcar_canfd_hw_info rzg2l_hw_info = {
@@ -649,6 +652,7 @@ static const struct rcar_canfd_hw_info rzg2l_hw_info = {
 	.ch_interface_mode = 0,
 	.shared_can_regs = 0,
 	.external_clk = 1,
+	.mode_before_ch_rst = 1,
 };
 
 static const struct rcar_canfd_hw_info r9a09g047_hw_info = {
@@ -666,6 +670,7 @@ static const struct rcar_canfd_hw_info r9a09g047_hw_info = {
 	.ch_interface_mode = 1,
 	.shared_can_regs = 1,
 	.external_clk = 0,
+	.mode_before_ch_rst = 1,
 };
 
 /* Helper functions */
@@ -806,6 +811,10 @@ static int rcar_canfd_reset_controller(struct rcar_canfd_global *gpriv)
 	/* Reset Global error flags */
 	rcar_canfd_write(gpriv->base, RCANFD_GERFL, 0x0);
 
+	/* RZ/G2L SoC needs setting the mode before channel reset */
+	if (gpriv->info->mode_before_ch_rst)
+		rcar_canfd_set_mode(gpriv);
+
 	/* Transition all Channels to reset mode */
 	for_each_set_bit(ch, &gpriv->channels_mask, gpriv->info->max_channels) {
 		rcar_canfd_clear_bit(gpriv->base,
@@ -826,7 +835,8 @@ static int rcar_canfd_reset_controller(struct rcar_canfd_global *gpriv)
 	}
 
 	/* Set the controller into appropriate mode */
-	rcar_canfd_set_mode(gpriv);
+	if (!gpriv->info->mode_before_ch_rst)
+		rcar_canfd_set_mode(gpriv);
 
 	return 0;
 }
-- 
2.43.0


