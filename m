Return-Path: <linux-renesas-soc+bounces-5661-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id E13088D3B3C
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 29 May 2024 17:42:58 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 5BD5DB26E6D
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 29 May 2024 15:42:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2D63E1B947;
	Wed, 29 May 2024 15:42:08 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from michel.telenet-ops.be (michel.telenet-ops.be [195.130.137.88])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B1521335C7
	for <linux-renesas-soc@vger.kernel.org>; Wed, 29 May 2024 15:42:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.130.137.88
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716997328; cv=none; b=TUmYK5lF1k/iorh86FfojNWkC0iVUf+2H/uryYDypKrkz2EIBxj+kN30kIqHIYzH/exKktpoNE5PTRG5+NNk4YOBhpAZ1hlrhmXwzDGXEcgnyaIpMa/fTQUnoWnQ13H6bjEiWLcvY3NG9Xsh38RXPlZUMuD3zzGRfl5RGWATvEg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716997328; c=relaxed/simple;
	bh=N/ECSfVUD/NB0wLUeDgNmp5HblFEBhUFJhP2/JESiPg=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=O7+ryioqHXYmIFL/yqGCv+UpXztzBBsHEdtCQ3HpizAEucn2rpQlmpo+UwBSkN+NT9K8R+fJwDH4cbqPlCxvziw1hjGBqH4wOstYOYGeLA72ocJm9QDfdos3H5Sy4Li8mZEmzNnYdiV6JCzEDCIDlvQZxooe7r3n6UNUk1okh+w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=glider.be; spf=none smtp.mailfrom=linux-m68k.org; arc=none smtp.client-ip=195.130.137.88
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=glider.be
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux-m68k.org
Received: from ramsan.of.borg ([IPv6:2a02:1810:ac12:ed80:1b01:1838:131c:4de4])
	by michel.telenet-ops.be with bizsmtp
	id V3i22C00H3VPV9V063i23g; Wed, 29 May 2024 17:42:03 +0200
Received: from rox.of.borg ([192.168.97.57])
	by ramsan.of.borg with esmtp (Exim 4.95)
	(envelope-from <geert@linux-m68k.org>)
	id 1sCLQG-00H2xk-BG;
	Wed, 29 May 2024 17:42:02 +0200
Received: from geert by rox.of.borg with local (Exim 4.95)
	(envelope-from <geert@linux-m68k.org>)
	id 1sCLRC-009nPd-O3;
	Wed, 29 May 2024 17:42:02 +0200
From: Geert Uytterhoeven <geert+renesas@glider.be>
To: Magnus Damm <magnus.damm@gmail.com>,
	Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>,
	Wolfram Sang <wsa+renesas@sang-engineering.com>,
	=?UTF-8?q?Niklas=20S=C3=B6derlund?= <niklas.soderlund+renesas@ragnatech.se>
Cc: linux-renesas-soc@vger.kernel.org,
	Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH/LOCAL 2/3] arm64: renesas: defconfig: Enable Marvell 88Q2XXX PHY support
Date: Wed, 29 May 2024 17:41:58 +0200
Message-Id: <009bf9f476fa444d98de22330bde565f0ab8b2d2.1716997002.git.geert+renesas@glider.be>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1716997002.git.geert+renesas@glider.be>
References: <cover.1716997002.git.geert+renesas@glider.be>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Enable support for Marvell 88Q2XXX 100/1000BASE-T1 Automotive Ethernet
PHYs, as found on the Falcon and White-Hawk development boards.

Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
 arch/arm64/configs/renesas_defconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm64/configs/renesas_defconfig b/arch/arm64/configs/renesas_defconfig
index cd40cebd49c21d56..2fc7752fbc433294 100644
--- a/arch/arm64/configs/renesas_defconfig
+++ b/arch/arm64/configs/renesas_defconfig
@@ -141,6 +141,7 @@ CONFIG_SH_ETH=y
 CONFIG_RAVB=y
 CONFIG_RENESAS_ETHER_SWITCH=y
 CONFIG_MARVELL_10G_PHY=y
+CONFIG_MARVELL_88Q2XXX_PHY=y
 CONFIG_MICREL_PHY=y
 CONFIG_REALTEK_PHY=y
 CONFIG_CAN_RCAR=y
-- 
2.34.1


