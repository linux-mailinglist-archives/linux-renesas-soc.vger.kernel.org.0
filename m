Return-Path: <linux-renesas-soc+bounces-25694-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 7D245CB367D
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 10 Dec 2025 17:02:51 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 09E26303826C
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 10 Dec 2025 16:02:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 73D9A3002DF;
	Wed, 10 Dec 2025 16:02:12 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from frasgout.his.huawei.com (frasgout.his.huawei.com [185.176.79.56])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EBCAF21CC79
	for <linux-renesas-soc@vger.kernel.org>; Wed, 10 Dec 2025 16:01:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.176.79.56
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765382530; cv=none; b=gJxIR7L4bn28SFqmkimcx/rKXk42oE2Riu3v6/ctn+7KTFmlAhy6wIrP94O+81BvD6mmQKKV8g4YdlmiSm2bk6revwSvAgWARmHfMYrkyfq2kPyYjiyImxuLV7J/+4nZFJBFpJr5X6OiuA9UuZ7SDbK0sOS6CU7mV1JoSnPFy4k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765382530; c=relaxed/simple;
	bh=+i26+HsAZIRoIUVciLZpGSx4MucX9EluDXiw/gKQ0Qk=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=STV7riFb4WR474Ui2Tea2cErOJCIApWPVU1Bgqtl7USuygQZxXeCIGcqsvMHxT/LnBx5XcOBpzXOCVFNDWbskySLIHzSo5J8aqt0VNqzmd4QFCn6dcPdME+RVCmbm59XHJ6P69qY+Oh+NnSRD8UsdR7WsqRYkeav5ees3nA/Qco=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=huawei.com; spf=pass smtp.mailfrom=huawei.com; arc=none smtp.client-ip=185.176.79.56
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=huawei.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=huawei.com
Received: from mail.maildlp.com (unknown [172.18.224.150])
	by frasgout.his.huawei.com (SkyGuard) with ESMTPS id 4dRL7J3HxzzJ46dr;
	Thu, 11 Dec 2025 00:01:32 +0800 (CST)
Received: from dubpeml100005.china.huawei.com (unknown [7.214.146.113])
	by mail.maildlp.com (Postfix) with ESMTPS id 9EF994048B;
	Thu, 11 Dec 2025 00:01:50 +0800 (CST)
Received: from SecurePC-101-06.huawei.com (10.122.19.247) by
 dubpeml100005.china.huawei.com (7.214.146.113) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.36; Wed, 10 Dec 2025 16:01:49 +0000
From: Jonathan Cameron <Jonathan.Cameron@huawei.com>
To: Conor Dooley <conor.dooley@microchip.com>, Geert Uytterhoeven
	<geert+renesas@glider.be>, Magnus Damm <magnus.damm@gmail.com>, Paul Walmsley
	<pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou
	<aou@eecs.berkeley.edu>
CC: Paul Gazzillo <paul@pgazz.com>, Necip Fazil Yildiran
	<fazilyildiran@gmail.com>, <linux-renesas-soc@vger.kernel.org>,
	<linux-riscv@lists.infradead.org>, <linuxarm@huawei.com>, Arnd Bergmann
	<arnd@arndb.de>
Subject: [PATCH 2/2] soc: renesas: Fix missing dependency on new CONFIG_CACHEMAINT_FOR_DMA
Date: Wed, 10 Dec 2025 16:00:47 +0000
Message-ID: <20251210160047.201379-3-Jonathan.Cameron@huawei.com>
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
Closes: https://lore.kernel.org/oe-kbuild-all/202512100411.WxJU2No9-lkp@intel.com/
Signed-off-by: Jonathan Cameron <Jonathan.Cameron@huawei.com>
---
 drivers/soc/renesas/Kconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/soc/renesas/Kconfig b/drivers/soc/renesas/Kconfig
index 340a1ff7e92b..2a8ae79a11af 100644
--- a/drivers/soc/renesas/Kconfig
+++ b/drivers/soc/renesas/Kconfig
@@ -445,6 +445,7 @@ config ARCH_R9A07G043
 	depends on RISCV_SBI
 	select ARCH_RZG2L
 	select AX45MP_L2_CACHE
+	select CACHEMAINT_FOR_DMA
 	select DMA_GLOBAL_POOL
 	select ERRATA_ANDES
 	select ERRATA_ANDES_CMO
-- 
2.48.1


