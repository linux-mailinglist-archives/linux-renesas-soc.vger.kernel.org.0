Return-Path: <linux-renesas-soc+bounces-16767-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id A9E02AAE681
	for <lists+linux-renesas-soc@lfdr.de>; Wed,  7 May 2025 18:24:42 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 31084984B51
	for <lists+linux-renesas-soc@lfdr.de>; Wed,  7 May 2025 16:23:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5372728BA8C;
	Wed,  7 May 2025 16:21:55 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from relmlie6.idc.renesas.com (relmlor2.renesas.com [210.160.252.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AA15D1D63EF
	for <linux-renesas-soc@vger.kernel.org>; Wed,  7 May 2025 16:21:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=210.160.252.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746634915; cv=none; b=rZ7r5Bkv8DD9LzyKS127mZHXTFQ3g955TVjxYCPcLQqKmIhbfQTklJK5XAkCT6+hWP5c5Kgeu+NdTpxrXDOCDfxG+llRfpitwiNdnVF8e4vw35Mw2MCElEpuX+aH6vih0m00AMvt8jN1ivcUGcjC+U94qrvaClZ7xkBeiTc9nZE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746634915; c=relaxed/simple;
	bh=uIMYOORDY5nGHFFZTIooIAXwxr3i7cSgauAioCCiuWw=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=o+UFOJshi5eYGQNSy42KJ1OkzjjeA5mvVyFCqMmn834fUKoYNaJJbqsoYMkebSI+O2BnOXMxMH8dMRV9y04EcbVesGaE9rgp8QvNafFLArS+ZJNVzCWTNFvoINKKk4KVp4gPelyiEvqMJVMFCz/xB9nRiJkaGqZUcG2etc3ZmAY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com; spf=pass smtp.mailfrom=bp.renesas.com; arc=none smtp.client-ip=210.160.252.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bp.renesas.com
X-CSE-ConnectionGUID: 1cT+V/6xTXOM/Mu0dAK5nA==
X-CSE-MsgGUID: GFbAHcnRS+CiAMwguhMkEg==
Received: from unknown (HELO relmlir5.idc.renesas.com) ([10.200.68.151])
  by relmlie6.idc.renesas.com with ESMTP; 08 May 2025 01:21:51 +0900
Received: from localhost.localdomain (unknown [10.226.92.73])
	by relmlir5.idc.renesas.com (Postfix) with ESMTP id EA5AF4019C71;
	Thu,  8 May 2025 01:21:48 +0900 (JST)
From: Biju Das <biju.das.jz@bp.renesas.com>
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Biju Das <biju.das.jz@bp.renesas.com>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>,
	Biju Das <biju.das.au@gmail.com>,
	linux-renesas-soc@vger.kernel.org,
	kernel test robot <lkp@intel.com>
Subject: [PATCH] memory: renesas-rpc-if: Add missing static keyword
Date: Wed,  7 May 2025 17:21:44 +0100
Message-ID: <20250507162146.140494-1-biju.das.jz@bp.renesas.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Fix the below sparse warnings:
 symbol 'rpcif_impl' was not declared. Should it be static?
 symbol 'xspi_impl' was not declared. Should it be static?

Reported-by: kernel test robot <lkp@intel.com>
Closes: https://lore.kernel.org/oe-kbuild-all/202505072013.1EqwjtaR-lkp@intel.com/
Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
---
 drivers/memory/renesas-rpc-if.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/memory/renesas-rpc-if.c b/drivers/memory/renesas-rpc-if.c
index 4b2e903f2b0d..4a417b693080 100644
--- a/drivers/memory/renesas-rpc-if.c
+++ b/drivers/memory/renesas-rpc-if.c
@@ -1063,7 +1063,7 @@ static void rpcif_remove(struct platform_device *pdev)
 	platform_device_unregister(rpc->vdev);
 }
 
-struct rpcif_impl rpcif_impl = {
+static const struct rpcif_impl rpcif_impl = {
 	.hw_init = rpcif_hw_init_impl,
 	.prepare = rpcif_prepare_impl,
 	.manual_xfer = rpcif_manual_xfer_impl,
@@ -1072,7 +1072,7 @@ struct rpcif_impl rpcif_impl = {
 	.status_mask = RPCIF_CMNSR_TEND,
 };
 
-struct rpcif_impl xspi_impl = {
+static const struct rpcif_impl xspi_impl = {
 	.hw_init = xspi_hw_init_impl,
 	.prepare = xspi_prepare_impl,
 	.manual_xfer = xspi_manual_xfer_impl,
-- 
2.43.0


