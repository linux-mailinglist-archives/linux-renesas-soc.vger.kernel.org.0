Return-Path: <linux-renesas-soc+bounces-7053-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 4EEDE926F63
	for <lists+linux-renesas-soc@lfdr.de>; Thu,  4 Jul 2024 08:17:37 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 807801C22134
	for <lists+linux-renesas-soc@lfdr.de>; Thu,  4 Jul 2024 06:17:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F263E1946B;
	Thu,  4 Jul 2024 06:17:35 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from relmlie6.idc.renesas.com (relmlor2.renesas.com [210.160.252.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 80EDC2F23
	for <linux-renesas-soc@vger.kernel.org>; Thu,  4 Jul 2024 06:17:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=210.160.252.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720073855; cv=none; b=dGYOLGpdeD9JxrJteZqsfP6FR9cmkTN47BVF4pe/SGZBndWVtZmFl4y5NupKZqOt/J1nEEBPTTxyCPqyBVe/ORuv2Us+TCw1nk6zXBwEjRIL52obMuvPKZfSQy3LxuzjqBPz8f0oX0mppI2Lhb1b0hN7vGQO09/8cDR2duqIrys=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720073855; c=relaxed/simple;
	bh=EUpDh4QLkT/QT418ycvY2mcT3d07kmot/YjJI/jz5m8=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=FIwEpKOcYDnpOG9MTTJT+KYijFJZewiqBamXU1S5/Z3yi48wcQtMSblX41TpS8ri03qKtswVsZoI+brEQxba10BWAR8QYo/cQo8gHJH5Zcwvk25NHwmzb3qsGCsLIsqeJSf5W4EJ2OxM/iqH4ElMmY4eKnl43NxR6MTPiDKTtLU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com; spf=pass smtp.mailfrom=renesas.com; arc=none smtp.client-ip=210.160.252.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=renesas.com
X-IronPort-AV: E=Sophos;i="6.09,183,1716217200"; 
   d="scan'208";a="214201900"
Received: from unknown (HELO relmlir5.idc.renesas.com) ([10.200.68.151])
  by relmlie6.idc.renesas.com with ESMTP; 04 Jul 2024 15:17:27 +0900
Received: from localhost.localdomain (unknown [10.166.13.99])
	by relmlir5.idc.renesas.com (Postfix) with ESMTP id 9BD88400F79B;
	Thu,  4 Jul 2024 15:17:27 +0900 (JST)
From: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
To: geert+renesas@glider.be,
	magnus.damm@gmail.com
Cc: linux-renesas-soc@vger.kernel.org,
	Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
Subject: [PATCH] clk: renesas: r8a779h0: Add PCIe clocks
Date: Thu,  4 Jul 2024 15:17:20 +0900
Message-Id: <20240704061720.1444755-1-yoshihiro.shimoda.uh@renesas.com>
X-Mailer: git-send-email 2.25.1
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add the PCIe module clock, which is used by the PCIe modules on the
Renesas R-Car V4M (R8A779H0) SoC.

Signed-off-by: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
---
 drivers/clk/renesas/r8a779h0-cpg-mssr.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/clk/renesas/r8a779h0-cpg-mssr.c b/drivers/clk/renesas/r8a779h0-cpg-mssr.c
index 079b55b30b23..74ef51387635 100644
--- a/drivers/clk/renesas/r8a779h0-cpg-mssr.c
+++ b/drivers/clk/renesas/r8a779h0-cpg-mssr.c
@@ -191,6 +191,7 @@ static const struct mssr_mod_clk r8a779h0_mod_clks[] = {
 	DEF_MOD("msi3",		621,	R8A779H0_CLK_MSO),
 	DEF_MOD("msi4",		622,	R8A779H0_CLK_MSO),
 	DEF_MOD("msi5",		623,	R8A779H0_CLK_MSO),
+	DEF_MOD("pciec0",	624,	R8A779H0_CLK_S0D2_HSC),
 	DEF_MOD("rpc-if",	629,	R8A779H0_CLK_RPCD2),
 	DEF_MOD("scif0",	702,	R8A779H0_CLK_SASYNCPERD4),
 	DEF_MOD("scif1",	703,	R8A779H0_CLK_SASYNCPERD4),
-- 
2.25.1


