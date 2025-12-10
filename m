Return-Path: <linux-renesas-soc+bounces-25692-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 9D0ADCB3673
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 10 Dec 2025 17:01:11 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 9B0D6300DB9E
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 10 Dec 2025 16:01:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EF2DA2F25F5;
	Wed, 10 Dec 2025 16:01:08 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from frasgout.his.huawei.com (frasgout.his.huawei.com [185.176.79.56])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 523432EAD1B
	for <linux-renesas-soc@vger.kernel.org>; Wed, 10 Dec 2025 16:01:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.176.79.56
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765382467; cv=none; b=h4ryFAult0R0mK99lclZB7eshMxweEaxVejop5EekvfEJRY37snEwvFFvkgCj9B3amde30FnT9XS1udvHbWtSlCMnajTubz4yrenQqFGHLPxBwAODfPnVfECaHpCO+MMtgoGLGB5n3Oedv4xbxHOcuPPggLujus8Z++mXG+L0JA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765382467; c=relaxed/simple;
	bh=pp3iFhnNihBInfhSOGHcuyGjFLsS1nVatbBPDuVtvHI=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=dOvGQufK9KiNVUNvWJNFq9yEC4sHeoxS1QpIjjlfXS3GC1VBJhYOH/2u/CvOee0R0ovJI2ozOwQFGH8k2mraXjxp1rzaNl6HbFGjL021P6W07j6jThZjE3T7E8IFo3u4ldD1b8w1mUYOvkeE5ywX5CSQJ/YmgYPt8udS2OkpyW4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=huawei.com; spf=pass smtp.mailfrom=huawei.com; arc=none smtp.client-ip=185.176.79.56
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=huawei.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=huawei.com
Received: from mail.maildlp.com (unknown [172.18.224.150])
	by frasgout.his.huawei.com (SkyGuard) with ESMTPS id 4dRL663K34zJ46cf;
	Thu, 11 Dec 2025 00:00:30 +0800 (CST)
Received: from dubpeml100005.china.huawei.com (unknown [7.214.146.113])
	by mail.maildlp.com (Postfix) with ESMTPS id 9F4254056B;
	Thu, 11 Dec 2025 00:00:48 +0800 (CST)
Received: from SecurePC-101-06.huawei.com (10.122.19.247) by
 dubpeml100005.china.huawei.com (7.214.146.113) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.36; Wed, 10 Dec 2025 16:00:47 +0000
From: Jonathan Cameron <Jonathan.Cameron@huawei.com>
To: Conor Dooley <conor.dooley@microchip.com>, Geert Uytterhoeven
	<geert+renesas@glider.be>, Magnus Damm <magnus.damm@gmail.com>, Paul Walmsley
	<pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou
	<aou@eecs.berkeley.edu>
CC: Paul Gazzillo <paul@pgazz.com>, Necip Fazil Yildiran
	<fazilyildiran@gmail.com>, <linux-renesas-soc@vger.kernel.org>,
	<linux-riscv@lists.infradead.org>, <linuxarm@huawei.com>, Arnd Bergmann
	<arnd@arndb.de>
Subject: [PATCH 0/2] riscv: Fix missing select CACHEMAINT_FOR_DMA
Date: Wed, 10 Dec 2025 16:00:45 +0000
Message-ID: <20251210160047.201379-1-Jonathan.Cameron@huawei.com>
X-Mailer: git-send-email 2.48.1
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

The drivers/cache/Kconfig menu was changed to a menuconfig so as to be able
to hide the menu for non RISCV. The select of drivers under the original
menu were broken as the menuconfig itself could be disabled.  Fix this by
adding SELECT CACHEMAINT_FOR_DMA alongside the driver specific symbol
selects.

Jonathan Cameron (2):
  riscv: ERRATA_STARFIVE_JH7100: Fix missing dependency on new
    CONFIG_CACHEMAINT_FOR_DMA
  soc: renesas: Fix missing dependency on new CONFIG_CACHEMAINT_FOR_DMA

 arch/riscv/Kconfig.errata   | 1 +
 drivers/soc/renesas/Kconfig | 1 +
 2 files changed, 2 insertions(+)

-- 
2.48.1


