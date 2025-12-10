Return-Path: <linux-renesas-soc+bounces-25693-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id DE2FCCB3685
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 10 Dec 2025 17:03:06 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id DF6CF3033697
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 10 Dec 2025 16:01:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A14582FE59F;
	Wed, 10 Dec 2025 16:01:30 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from frasgout.his.huawei.com (frasgout.his.huawei.com [185.176.79.56])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7F9802FAC0C
	for <linux-renesas-soc@vger.kernel.org>; Wed, 10 Dec 2025 16:01:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.176.79.56
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765382489; cv=none; b=hr5TKkJJYqgJ+jFbr7+h4owo/fLgolLq11TetdtvyWDdg8D+Einhukrmxphq7enzyvHojMYQSdv74GZq3fXKHHO0qTlbKSMXZf732FVa5TecQDnlqwwsJSE+EhCG5mKypSLp8kQUKMjOxT2M5x3EpgFmNEu41RoUyqK/T/zUQYA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765382489; c=relaxed/simple;
	bh=sTotzHizBcRCZ++zDF5iEleHnzQBfXcyklnvvCi0cPM=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=EzpSq5pN4jnr4Vv0KnS3bfLnnPIPZAeBy7kiNIfZjwN8JLRg0QVvknT4rNgpOpuReGATFCUMaUhjPtakWOMdZAtnAsmS6u9o+EQUUn+/4SKUbA+3G0cR4tapQNKikcn+jpZWzorNmgswmpFECjtQUvQM3HMPuqNUpTgJOtgORVc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=huawei.com; spf=pass smtp.mailfrom=huawei.com; arc=none smtp.client-ip=185.176.79.56
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=huawei.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=huawei.com
Received: from mail.maildlp.com (unknown [172.18.224.107])
	by frasgout.his.huawei.com (SkyGuard) with ESMTPS id 4dRL6j3NQyzJ46cJ;
	Thu, 11 Dec 2025 00:01:01 +0800 (CST)
Received: from dubpeml100005.china.huawei.com (unknown [7.214.146.113])
	by mail.maildlp.com (Postfix) with ESMTPS id A19994056B;
	Thu, 11 Dec 2025 00:01:19 +0800 (CST)
Received: from SecurePC-101-06.huawei.com (10.122.19.247) by
 dubpeml100005.china.huawei.com (7.214.146.113) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.36; Wed, 10 Dec 2025 16:01:18 +0000
From: Jonathan Cameron <Jonathan.Cameron@huawei.com>
To: Conor Dooley <conor.dooley@microchip.com>, Geert Uytterhoeven
	<geert+renesas@glider.be>, Magnus Damm <magnus.damm@gmail.com>, Paul Walmsley
	<pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou
	<aou@eecs.berkeley.edu>
CC: Paul Gazzillo <paul@pgazz.com>, Necip Fazil Yildiran
	<fazilyildiran@gmail.com>, <linux-renesas-soc@vger.kernel.org>,
	<linux-riscv@lists.infradead.org>, <linuxarm@huawei.com>, Arnd Bergmann
	<arnd@arndb.de>
Subject: [PATCH 1/2] riscv: ERRATA_STARFIVE_JH7100: Fix missing dependency on new CONFIG_CACHEMAINT_FOR_DMA
Date: Wed, 10 Dec 2025 16:00:46 +0000
Message-ID: <20251210160047.201379-2-Jonathan.Cameron@huawei.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20251210160047.201379-1-Jonathan.Cameron@huawei.com>
References: <20251210160047.201379-1-Jonathan.Cameron@huawei.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: lhrpeml500009.china.huawei.com (7.191.174.84) To
 dubpeml100005.china.huawei.com (7.214.146.113)

The Kconfig menu entry was converted to a menuconfig to allow it to be
hidden for !CONFIG_RISCV. The drivers under this new option were selected
by some other Kconfig symbols and so an extra select CACHEMAINT_FOR_DMA is
needed.

Fixes: 4d1608d0ab33 ("cache: Make top level Kconfig menu a boolean dependent on RISCV")
Reported-by: kernel test robot <lkp@intel.com>
Closes: https://lore.kernel.org/oe-kbuild-all/202512100509.g6llkMMr-lkp@intel.com/
Signed-off-by: Jonathan Cameron <jonathan.cameron@huawei.com>
---
 arch/riscv/Kconfig.errata | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/riscv/Kconfig.errata b/arch/riscv/Kconfig.errata
index aca9b0cfcfec..3c945d086c7d 100644
--- a/arch/riscv/Kconfig.errata
+++ b/arch/riscv/Kconfig.errata
@@ -84,6 +84,7 @@ config ERRATA_STARFIVE_JH7100
 	select DMA_GLOBAL_POOL
 	select RISCV_DMA_NONCOHERENT
 	select RISCV_NONSTANDARD_CACHE_OPS
+	select CACHEMAINT_FOR_DMA
 	select SIFIVE_CCACHE
 	default n
 	help
-- 
2.48.1


