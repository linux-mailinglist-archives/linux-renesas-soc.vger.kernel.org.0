Return-Path: <linux-renesas-soc+bounces-20531-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 3176CB26B57
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 14 Aug 2025 17:46:26 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 4DB1D3A4D66
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 14 Aug 2025 15:41:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8803422DA06;
	Thu, 14 Aug 2025 15:40:20 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from relmlie6.idc.renesas.com (relmlor2.renesas.com [210.160.252.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4819032142C;
	Thu, 14 Aug 2025 15:40:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=210.160.252.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755186020; cv=none; b=M8CiGi4EtwNmMpXweBhKHgEWMAzQG/t+xY7710Mp0ydoHLlSS1XNAYu/tl5KqQOqiGRR6OilGg/GsRYZl3xX8jlAM4L29RyWuwFxB6dw+dJJLWi/Q/ym3ayx0K+jxXf3+FTdCtwA43LcucI65RE9sJ/kyOstZbWvWqZKl5AMwMc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755186020; c=relaxed/simple;
	bh=v87uEiXf4U7ju76cX7qrGhUUJZKchnUtgefxkslkRvc=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=r/rvXzb6SEPRaNVeTfHpefAGpahnsoZEokTdk8tJlJpjp17Wln4SzQ/Ko+kayDI4PXh6+xxLZCtgABLEUTFvtwnL6A8YJzTI4CJI5HgW65QAO+1RtnO6oz//sUaaWtixj5JT1Mf3yFoyimCeW74WBztz7Wa4Z9Qo4uPw/PiDBh8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com; spf=pass smtp.mailfrom=bp.renesas.com; arc=none smtp.client-ip=210.160.252.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bp.renesas.com
X-CSE-ConnectionGUID: 0wmdYN4PQSiZtHjtpqHmfw==
X-CSE-MsgGUID: i2nEKtRRSoafTtbsrgPIzw==
Received: from unknown (HELO relmlir5.idc.renesas.com) ([10.200.68.151])
  by relmlie6.idc.renesas.com with ESMTP; 15 Aug 2025 00:35:07 +0900
Received: from ubuntu.adwin.renesas.com (unknown [10.226.93.106])
	by relmlir5.idc.renesas.com (Postfix) with ESMTP id 55E834007547;
	Fri, 15 Aug 2025 00:35:04 +0900 (JST)
From: John Madieu <john.madieu.xa@bp.renesas.com>
To: geert+renesas@glider.be,
	magnus.damm@gmail.com,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org
Cc: linux-renesas-soc@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	biju.das.jz@bp.renesas.com,
	john.madieu@gmail.com,
	John Madieu <john.madieu.xa@bp.renesas.com>
Subject: [PATCH] arm64: dts: renesas: r9a09g047: enable tx coe support
Date: Thu, 14 Aug 2025 17:34:55 +0200
Message-ID: <20250814153456.268208-1-john.madieu.xa@bp.renesas.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The GBETH IPs found on RZ/G3E SoC family are compatible with the stmmac driver.
They have a MAC HW feature register used by this driver to enable respective
features. While the register advertises Tx coe support, it was not enabled by
the driver due to the 'snps,force_thresh_dma_mode' dtsi property.

Switch from 'snps,force_thresh_dma_mode' to 'snps,force_sf_dma_mode' to enable
Tx checksum offload support on both GBETH IPs. While at it, also switch from
'snps,fixed-busrt' to 'nsps,mixed-burst' and remove 'snps,no-pbl-x8' for
optimal DMA configuration. This improvement results in a measurable TCP Tx
performance gains, increasing throughput by 20Mbps.

Signed-off-by: John Madieu <john.madieu.xa@bp.renesas.com>
---
 arch/arm64/boot/dts/renesas/r9a09g047.dtsi | 10 ++++------
 1 file changed, 4 insertions(+), 6 deletions(-)

diff --git a/arch/arm64/boot/dts/renesas/r9a09g047.dtsi b/arch/arm64/boot/dts/renesas/r9a09g047.dtsi
index e4fac7e0d764..b55b113d1f11 100644
--- a/arch/arm64/boot/dts/renesas/r9a09g047.dtsi
+++ b/arch/arm64/boot/dts/renesas/r9a09g047.dtsi
@@ -722,9 +722,8 @@ eth0: ethernet@15c30000 {
 			snps,perfect-filter-entries = <128>;
 			rx-fifo-depth = <8192>;
 			tx-fifo-depth = <8192>;
-			snps,fixed-burst;
-			snps,no-pbl-x8;
-			snps,force_thresh_dma_mode;
+			snps,mixed-burst;
+			snps,force_sf_dma_mode;
 			snps,axi-config = <&stmmac_axi_setup>;
 			snps,mtl-rx-config = <&mtl_rx_setup0>;
 			snps,mtl-tx-config = <&mtl_tx_setup0>;
@@ -823,9 +822,8 @@ eth1: ethernet@15c40000 {
 			snps,perfect-filter-entries = <128>;
 			rx-fifo-depth = <8192>;
 			tx-fifo-depth = <8192>;
-			snps,fixed-burst;
-			snps,no-pbl-x8;
-			snps,force_thresh_dma_mode;
+			snps,mixed-burst;
+			snps,force_sf_dma_mode;
 			snps,axi-config = <&stmmac_axi_setup>;
 			snps,mtl-rx-config = <&mtl_rx_setup1>;
 			snps,mtl-tx-config = <&mtl_tx_setup1>;
-- 
2.25.1


