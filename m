Return-Path: <linux-renesas-soc+bounces-19526-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 6DAC9B02B04
	for <lists+linux-renesas-soc@lfdr.de>; Sat, 12 Jul 2025 15:40:25 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id C3E2DA42F43
	for <lists+linux-renesas-soc@lfdr.de>; Sat, 12 Jul 2025 13:39:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D7A1A277CB8;
	Sat, 12 Jul 2025 13:39:59 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-qt1-f180.google.com (mail-qt1-f180.google.com [209.85.160.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2B616277032;
	Sat, 12 Jul 2025 13:39:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752327599; cv=none; b=CzLt+m8fnb7mM3kuQCq3E7w3aKLigwXEgLU2xet+grZ1JZfhCxudMTuiYPlunccEOCno7tQ2LyxTuRiDyCG5bYNtiGFOkyTS5zatXGv55Epb0W5imWmaBioTdLY0Oxqisr4OYk+bFA71tpI8Gxhvjv54/f2fYO646msQE2jQFxk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752327599; c=relaxed/simple;
	bh=H0pe8JRBsXP0hE4vkYw2Szm21yaKWyqBXJzI0n1yzLI=;
	h=From:To:Cc:Date:Message-Id:In-Reply-To:References:Subject; b=lgz0uzNypX+wcSYaYVuVf/zYoW9JwIuXwW5xj8TdI2ljt2CK0Plh4DmISxl3ZOg7dXsElPZD/xguH9NvFBQUgBPrIUEQoszVLqNqa8uVA/ptMoEnyAAbeaNFaHYmxWuAuIaix0IxZxRLX8RJwGI5fMho44m9ePbUGzc4Yu78CfE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=opensource.se; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.160.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=opensource.se
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-qt1-f180.google.com with SMTP id d75a77b69052e-4ab380b8851so11487411cf.2;
        Sat, 12 Jul 2025 06:39:57 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752327597; x=1752932397;
        h=subject:references:in-reply-to:message-id:date:cc:to:from
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=gsU3/t+xyV3Bj8ocSOEqxfXUsMnRdrdfzXPnIBDbM58=;
        b=kbvaCAPHO2MBpMODoTFcjcmovIbUAkmIf661H2wD+RvV4RdkTOiWBMtlAjRQhOsyJK
         C38MrStaPR+YsMweHl36BwU/StCetbwlj0imlHRQtUbatzJao8ezAxQHfeuz3LMmWUy6
         blQIRqKeLs+9P4mGupKcM+8sMH6kgQmPn6XujKulwUuGX8/K8i736CMpEsyRUAHoFboL
         VYwJUTO1RNJo5YIAyd2MOcc2NUZOtwtG5QVm1NpUp3BunAJ1sz93zA0mptZSFvHY/az2
         Otdky8fWDIF+PsTzdp01zc6qoSV6Lw+m7vGMmsEtaM+cETcvsa337CREPi/J3A698a6f
         V7dw==
X-Forwarded-Encrypted: i=1; AJvYcCVEJOsJn9lGP/UqFiweuG0y9Nz5QNW931YHQmXXUEmsD2XXyHrh22U+jplB1qbMUpQjWTxfaglQDvsz@vger.kernel.org, AJvYcCXo+Stbiy7D+gHW2jvHmNHQxwWR1WIGplz1Ev240yREDj02xGI7x1pTw9HrFHvCgJzM3S2ThCRlr/F50RNC@vger.kernel.org
X-Gm-Message-State: AOJu0YywQlnaKr63HFT10p8NE5lSYISzyMzc8UdkT3ezR2ejaEHm6362
	IlhO6bw9PoMmyVAkfCLV6JA172n6hdUEJVow/BWdbEuv7vPF/wqg+baXbhav3a0c
X-Gm-Gg: ASbGnctVFSlZvTFc/iZLlAtF2zr71RdGD8egAq4wigN6RRNyS+oV9GUdbXjh5gCCZZr
	7my54hwOdbd/vlY455GpbiyNsQ3vahYoHGesj0RjTYhtuUfRhMEHfU4nZ0n7Od+uJoNgxD7b0a+
	Hr48b53T9AUm8UJnq/nmDWZlNYbhSrfqLqtSTuDdK2ByhM27CSMCiJ7AndHz6OfjK+SF3O2MLBi
	PIcujh51hmTKGoXlAmB5Srw3sIX0KT79sfPqdKgXL89IqVq05qQnAJD7emeKqlsteIu931Xd0vq
	CSIlAcAgwBc90qdD4A7wtfVR8BllsK23qWmNx+B/rbfBINkiVESLF6Xbmg0UBOOm73Y9O0a0ulL
	Ulxq9eEGLXBnGugPnnHGhgDXHF7sCFpDiTEK2CXwuTms=
X-Google-Smtp-Source: AGHT+IHNOLOADGCEV/ihlsqKAMtLloOZI/ixZuMAHUyXAcEnVxB2WORUGa2P3OXm/ohfIrSsCrT0/g==
X-Received: by 2002:ac8:7c48:0:b0:4a7:fbd0:79c4 with SMTP id d75a77b69052e-4aa35ca48dbmr108700701cf.11.1752327596565;
        Sat, 12 Jul 2025 06:39:56 -0700 (PDT)
Received: from 1.0.0.127.in-addr.arpa ([167.99.4.198])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-4ab41e37b4asm9183591cf.32.2025.07.12.06.39.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 12 Jul 2025 06:39:56 -0700 (PDT)
From: Magnus Damm <damm@opensource.se>
To: linux-renesas-soc@vger.kernel.org
Cc: robh@kernel.org,Magnus Damm <damm@opensource.se>,geert+renesas@glider.be,devicetree@vger.kernel.org,conor+dt@kernel.org,krzk@kernel.org,linux-kernel@vger.kernel.org,wsa+renesas@sang-engineering.com,sergei.shtylyov@gmail.com,p.zabel@pengutronix.de
Date: Sat, 12 Jul 2025 15:39:53 +0200
Message-Id: <175232759314.19062.13901247607746044271.sendpatchset@1.0.0.127.in-addr.arpa>
In-Reply-To: <175232755943.19062.8739774784256290646.sendpatchset@1.0.0.127.in-addr.arpa>
References: <175232755943.19062.8739774784256290646.sendpatchset@1.0.0.127.in-addr.arpa>
Subject: [PATCH v2 3/4] memory: renesas-rpc-if: Add RZ/A1 and RZ/A2 support
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>

From: Magnus Damm <damm@opensource.se>

Add RZ/A1 and RZ/A2 compat strings to the rpc-if driver. Also make the
reset controller optional. This is because RZ/A1 does not have any reset
bits assigned to the device so there is no reset controller available.

Signed-off-by: Magnus Damm <damm@opensource.se>
---

 Changes since v1:
 - New patch

 Applies to next-20250710

 drivers/memory/renesas-rpc-if.c |   15 ++++++++++++---
 include/memory/renesas-rpc-if.h |    1 +
 2 files changed, 13 insertions(+), 3 deletions(-)

--- 0001/drivers/memory/renesas-rpc-if.c
+++ work/drivers/memory/renesas-rpc-if.c	2025-07-11 03:45:25.605098312 +0900
@@ -234,7 +234,7 @@ static int rpcif_hw_init_impl(struct rpc
 	int ret;
 
 	if (rpc->info->type == RPCIF_RZ_G2L) {
-		ret = reset_control_reset(rpc->rstc);
+		ret = rpc->rstc ? reset_control_reset(rpc->rstc) : 0;
 		if (ret)
 			return ret;
 		usleep_range(200, 300);
@@ -614,7 +614,7 @@ static int rpcif_manual_xfer_impl(struct
 	return ret;
 
 err_out:
-	if (reset_control_reset(rpc->rstc))
+	if (rpc->rstc && reset_control_reset(rpc->rstc))
 		dev_err(rpc->dev, "Failed to reset HW\n");
 	rpcif_hw_init_impl(rpc, rpc->bus_size == 2);
 	return ret;
@@ -1017,7 +1017,7 @@ static int rpcif_probe(struct platform_d
 	rpc->size = resource_size(res);
 	rpc->rstc = devm_reset_control_array_get_exclusive(dev);
 	if (IS_ERR(rpc->rstc))
-		return PTR_ERR(rpc->rstc);
+		rpc->rstc = NULL;
 
 	/*
 	 * The enabling/disabling of spi/spix2 clocks at runtime leading to
@@ -1115,7 +1115,16 @@ static const struct rpcif_info xspi_info
 	.type = XSPI_RZ_G3E,
 };
 
+static const struct rpcif_info rpcif_info_rz_a = {
+	.regmap_config = &rpcif_regmap_config,
+	.impl = &rpcif_impl,
+	.type = RPCIF_RZ_A,
+	.strtim = 7,
+};
+
 static const struct of_device_id rpcif_of_match[] = {
+	{ .compatible = "renesas,r7s72100-rpc-if", .data = &rpcif_info_rz_a },
+	{ .compatible = "renesas,r7s9210-rpc-if", .data = &rpcif_info_rz_a },
 	{ .compatible = "renesas,r8a7796-rpc-if", .data = &rpcif_info_r8a7796 },
 	{ .compatible = "renesas,r9a09g047-xspi", .data = &xspi_info_r9a09g047 },
 	{ .compatible = "renesas,rcar-gen3-rpc-if", .data = &rpcif_info_gen3 },
--- 0001/include/memory/renesas-rpc-if.h
+++ work/include/memory/renesas-rpc-if.h	2025-07-11 03:38:33.472749814 +0900
@@ -62,6 +62,7 @@ enum rpcif_type {
 	RPCIF_RCAR_GEN4,
 	RPCIF_RZ_G2L,
 	XSPI_RZ_G3E,
+	RPCIF_RZ_A,
 };
 
 struct rpcif {

