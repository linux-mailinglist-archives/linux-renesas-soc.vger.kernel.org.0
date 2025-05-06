Return-Path: <linux-renesas-soc+bounces-16716-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id C033AAAC396
	for <lists+linux-renesas-soc@lfdr.de>; Tue,  6 May 2025 14:13:46 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 335C04A2C39
	for <lists+linux-renesas-soc@lfdr.de>; Tue,  6 May 2025 12:13:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4200327FB24;
	Tue,  6 May 2025 12:13:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="hEy3exEK"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7849027FB19;
	Tue,  6 May 2025 12:13:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746533602; cv=none; b=Ew9f9LaF5DJCq9rfkQLJaf91jJ7EBH/M2HNVrUBDdM5cVW/hKKX0l3G5tzPlS3l0V5lFGUaAa+lpdT8F3DfDIQCatlf9hwAl7024QEn1Hj313kyC9HFp/H7+Q1mb1GDq3jRESBszboyXGtUoY9eXSWu+hVmRHUrOCGOQi1Q4uGw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746533602; c=relaxed/simple;
	bh=nzy/Chg0IFiXBTx0cNdUAZy9azdWdZwr7gQtLM1gOn0=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=MjcIpUcT1J/n1oJi6reGa/CRh3JG6GC91guySBCdL+THzSKkv8NljrP9gmWCk/lxzf4wN4YuB2Bevw7tBEOIbLbRCa3aRD79M2YsvvNafOsZir1qcAsb6TnptAP6zPWBgWVUOArOPkYY2+nCBTtTUuNfjq4mCP/TWt7lCT6T5F4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=hEy3exEK; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from mail.ideasonboard.com (cpc141996-chfd3-2-0-cust928.12-3.cable.virginm.net [86.13.91.161])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 32D24E8A;
	Tue,  6 May 2025 14:12:57 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1746533577;
	bh=nzy/Chg0IFiXBTx0cNdUAZy9azdWdZwr7gQtLM1gOn0=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=hEy3exEK6/w3BeCPrjYtHBuyIRPVQ+hRdJRZYTyWwStHCD+LQX0orIZaDGsaKqvul
	 xPSmDMICjMrTB3nH0xC9tlMSintW0cSz2tdnacZlErss4TtR6eJOfIdYYS6mYxPzTX
	 ZCTuBbh9gbmBVJZ2nmqC6LLKMwTZG92ZMq8BZCO4=
From: Daniel Scally <dan.scally@ideasonboard.com>
To: linux-clk@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org,
	devicetree@vger.kernel.org
Cc: geert+renesas@glider.be,
	mturquette@baylibre.com,
	sboyd@kernel.org,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	magnus.damm@gmail.com,
	prabhakar.mahadev-lad.rj@bp.renesas.com,
	Daniel Scally <dan.scally+renesas@ideasonboard.com>
Subject: [PATCH 4/4] clk: renesas: r9a09g057-cpg: Add reset definitions for RZ/V2H ISP
Date: Tue,  6 May 2025 13:12:52 +0100
Message-Id: <20250506121252.557170-5-dan.scally@ideasonboard.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250506121252.557170-1-dan.scally@ideasonboard.com>
References: <20250506121252.557170-1-dan.scally@ideasonboard.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Daniel Scally <dan.scally+renesas@ideasonboard.com>

Add reset line definitions for the ISP of the RZ/V2H SoC

Signed-off-by: Daniel Scally <dan.scally+renesas@ideasonboard.com>
---
 drivers/clk/renesas/r9a09g057-cpg.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/drivers/clk/renesas/r9a09g057-cpg.c b/drivers/clk/renesas/r9a09g057-cpg.c
index cb001ae5f98b..6537654bbdfb 100644
--- a/drivers/clk/renesas/r9a09g057-cpg.c
+++ b/drivers/clk/renesas/r9a09g057-cpg.c
@@ -298,6 +298,10 @@ static const struct rzv2h_reset r9a09g057_resets[] __initconst = {
 	DEF_RST(12, 14, 5, 31),		/* CRU_3_PRESETN */
 	DEF_RST(12, 15, 6, 0),		/* CRU_3_ARESETN */
 	DEF_RST(13, 0, 6, 1),		/* CRU_3_S_RESETN */
+	DEF_RST(13, 1, 6, 2),		/* ISP_0_VIN_ARESETN */
+	DEF_RST(13, 2, 6, 3),		/* ISP_0_REG_ARESETN */
+	DEF_RST(13, 3, 6, 4),		/* ISP_0_ISP_SRESETN */
+	DEF_RST(13, 4, 6, 5),		/* ISP_0_PRESETN */
 };
 
 const struct rzv2h_cpg_info r9a09g057_cpg_info __initconst = {
-- 
2.34.1


