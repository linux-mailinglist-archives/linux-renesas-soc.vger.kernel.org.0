Return-Path: <linux-renesas-soc+bounces-18356-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 7F9D1ADAF0A
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 16 Jun 2025 13:47:52 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 8C64C3AFBD7
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 16 Jun 2025 11:47:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6A3992D9EE1;
	Mon, 16 Jun 2025 11:47:27 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4CDA92C08CB
	for <linux-renesas-soc@vger.kernel.org>; Mon, 16 Jun 2025 11:47:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750074447; cv=none; b=aRVZIkavSzpZcWh3hyZsKkqjqzQSOMI8DU++NqQ6u5+xqh7RKCrnQnNZtm6ncW6vejj8MfNxtYjh1cS+kMBa+KG1u0iX7gsoB62a2fiPrMBuRyoaaoUqPr2hjIxMF218H/QdI36l2UmMfM94m4+sLOaOgm/rU2SxvcatS8zn7Ig=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750074447; c=relaxed/simple;
	bh=761iOjugLkxq8qt1bbg72FOUCt0i/JpN8lxDIt7TL+w=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=RLnyB3ID8OgEhjyQEP4NpnJPBzMRRgl5dTL8zMvodV8WJyrH3VXRKpka/kl+TSubBPj299AzIkdhQXwPXtZjghoOwY3OuJ1CaYdV237XRBx0IGU1VlP5sEtgeI2h/NmvT/6Rq+5r8/e7sgC+eEhh3lLAFTXpAIdgj1Ckx0MgiOo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D2D6CC4CEEA;
	Mon, 16 Jun 2025 11:47:25 +0000 (UTC)
From: Geert Uytterhoeven <geert+renesas@glider.be>
To: Magnus Damm <magnus.damm@gmail.com>
Cc: linux-renesas-soc@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH] ARM: shmobile: defconfig: Refresh for v6.16-rc2
Date: Mon, 16 Jun 2025 13:47:18 +0200
Message-ID: <f04a2b0e2c9128b4fa644850270b55493358be39.1750074375.git.geert+renesas@glider.be>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Refresh the defconfig for Renesas ARM systems:
  - Disable CONFIG_DWMAC_RENESAS_GBETH, which defaults to yes since
    commit 461f6529e5946d98 ("net: stmmac: Add DWMAC glue layer for
    Renesas GBETH"), but is only used on Renesas ARM64 SoCs.

Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
To be queued in renesas-devel for v6.17.

 arch/arm/configs/shmobile_defconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm/configs/shmobile_defconfig b/arch/arm/configs/shmobile_defconfig
index 7c3d6a8f0038c5e2..e4cb33b2bcee2215 100644
--- a/arch/arm/configs/shmobile_defconfig
+++ b/arch/arm/configs/shmobile_defconfig
@@ -58,6 +58,7 @@ CONFIG_SH_ETH=y
 CONFIG_RAVB=y
 CONFIG_SMSC911X=y
 CONFIG_STMMAC_ETH=y
+# CONFIG_DWMAC_RENESAS_GBETH is not set
 CONFIG_MICREL_PHY=y
 CONFIG_SMSC_PHY=y
 CONFIG_CAN_RCAR=y
-- 
2.43.0


