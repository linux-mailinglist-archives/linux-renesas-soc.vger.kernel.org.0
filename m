Return-Path: <linux-renesas-soc+bounces-8865-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 4E65B971350
	for <lists+linux-renesas-soc@lfdr.de>; Mon,  9 Sep 2024 11:22:51 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id B7CAFB228C2
	for <lists+linux-renesas-soc@lfdr.de>; Mon,  9 Sep 2024 09:22:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E6DDA1B2EDB;
	Mon,  9 Sep 2024 09:19:36 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from szxga05-in.huawei.com (szxga05-in.huawei.com [45.249.212.191])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EA97A1B372D;
	Mon,  9 Sep 2024 09:19:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=45.249.212.191
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725873576; cv=none; b=GUxdwOkkTWvw3wmk5Ox1qeg/zGiaQMUSV2MlLb43pBo90+DecZV3Rwe9O5FVzrNWCZI/krUlcWHEcv5SZPoBgtrRJNQOOJP0VEpv9GmaISYRxOvt8JhPJ+y2HRSEdmUcR/hHwT/q4FQvCd78ZffhzCWl03fOD7GKk8XyiD0v+w0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725873576; c=relaxed/simple;
	bh=LicYL7LrvVglcjIdHpUhMyshZw8yy0NxwCI3fniCcV8=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=NEfCxCROJx/M8bhjUZYEb7mCafC9h8RPKlVzZa+Mb+A/n82gHUagJlUsQVL3YWLX8KDamFJRj+rEVFW34k3pQHt9pMuRGnTbf/ug2kU3cryCP3jIlRkzAzcl2m4yQUgfwAjLeKNa3DO0NgIntlLDP3knvsPONOcfIivEWLyZlMk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=huawei.com; spf=pass smtp.mailfrom=huawei.com; arc=none smtp.client-ip=45.249.212.191
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=huawei.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=huawei.com
Received: from mail.maildlp.com (unknown [172.19.162.112])
	by szxga05-in.huawei.com (SkyGuard) with ESMTP id 4X2LmF21jLz1HJPf;
	Mon,  9 Sep 2024 17:15:57 +0800 (CST)
Received: from kwepemh500013.china.huawei.com (unknown [7.202.181.146])
	by mail.maildlp.com (Postfix) with ESMTPS id 2CBA31400D4;
	Mon,  9 Sep 2024 17:19:30 +0800 (CST)
Received: from huawei.com (10.90.53.73) by kwepemh500013.china.huawei.com
 (7.202.181.146) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.11; Mon, 9 Sep
 2024 17:19:29 +0800
From: Jinjie Ruan <ruanjinjie@huawei.com>
To: <yoshihiro.shimoda.uh@renesas.com>, <davem@davemloft.net>,
	<edumazet@google.com>, <kuba@kernel.org>, <pabeni@redhat.com>,
	<horms@kernel.org>, <wojciech.drewek@intel.com>,
	<niklas.soderlund+renesas@ragnatech.se>, <netdev@vger.kernel.org>,
	<linux-renesas-soc@vger.kernel.org>, <linux-kernel@vger.kernel.org>
CC: <ruanjinjie@huawei.com>
Subject: [PATCH] net: rswitch: Fix a possible memory leak in rswitch_phy_device_init()
Date: Mon, 9 Sep 2024 17:28:25 +0800
Message-ID: <20240909092825.1117058-1-ruanjinjie@huawei.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: dggems705-chm.china.huawei.com (10.3.19.182) To
 kwepemh500013.china.huawei.com (7.202.181.146)

of_phy_find_device() calls bus_find_device(), which calls get_device()
on the returned struct device * to increment the refcount. The current
implementation does not decrement the refcount, which causes memory leak.

So add the missing phy_device_free() call to decrement the
refcount via put_device() to balance the refcount.

Fixes: 0df024d0f1d3 ("net: renesas: rswitch: Add host_interfaces setting")
Signed-off-by: Jinjie Ruan <ruanjinjie@huawei.com>
---
 drivers/net/ethernet/renesas/rswitch.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/net/ethernet/renesas/rswitch.c b/drivers/net/ethernet/renesas/rswitch.c
index ff50e20856ec..69a67bd75f33 100644
--- a/drivers/net/ethernet/renesas/rswitch.c
+++ b/drivers/net/ethernet/renesas/rswitch.c
@@ -1404,6 +1404,7 @@ static int rswitch_phy_device_init(struct rswitch_device *rdev)
 		goto out;
 	__set_bit(rdev->etha->phy_interface, phydev->host_interfaces);
 	phydev->mac_managed_pm = true;
+	phy_device_free(phydev);
 
 	phydev = of_phy_connect(rdev->ndev, phy, rswitch_adjust_link, 0,
 				rdev->etha->phy_interface);
-- 
2.34.1


