Return-Path: <linux-renesas-soc+bounces-19369-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id EAEBAAFC703
	for <lists+linux-renesas-soc@lfdr.de>; Tue,  8 Jul 2025 11:28:16 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id E5EEE3ACB5C
	for <lists+linux-renesas-soc@lfdr.de>; Tue,  8 Jul 2025 09:27:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 467792356A4;
	Tue,  8 Jul 2025 09:28:01 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from relmlie5.idc.renesas.com (relmlor1.renesas.com [210.160.252.171])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1BC592253E4;
	Tue,  8 Jul 2025 09:27:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=210.160.252.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751966881; cv=none; b=C94WKAB1u6nJGEDkvkZCEyxgDT5q1jVO9luuI/pa9xtkEs2qpqOGm5fE0EQkYKtp8pWomRfs7adgW8xsJJt6YBVGOhqu+ArZg/wWzNeQtYTDP4ogrxZqQn7Q/xDHesWJBIV3yxLys1Er00ycMMfc04a0OqK0WKTcD2YV/GiyKtM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751966881; c=relaxed/simple;
	bh=l4w4ScuC6+kKDFL0zv62ICBhy98vqkkl4tddPQXmdeU=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=FMFKb8nBrFZwr8IZpDbMQwn1/RIc/W8BlK6jh2yk/AhzjZsYRUYE9S7e89qaw2Tnvmx0jAsh4xSNn2KaUqVUM8A+xVJLfOkb5DLlu8lShc49KzEBIqmWDXGXiadtigeSywQbAKpWbo3fqj0SOapDxzVi+4bvoHs9p95Zg1cD/To=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com; spf=pass smtp.mailfrom=renesas.com; arc=none smtp.client-ip=210.160.252.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=renesas.com
X-CSE-ConnectionGUID: Nclw74RMR7+LM6awX3QxxQ==
X-CSE-MsgGUID: V2nIMrjjRKis5CxHPKUJyA==
Received: from unknown (HELO relmlir5.idc.renesas.com) ([10.200.68.151])
  by relmlie5.idc.renesas.com with ESMTP; 08 Jul 2025 18:27:53 +0900
Received: from [127.0.1.1] (unknown [10.226.78.19])
	by relmlir5.idc.renesas.com (Postfix) with ESMTP id 82054400A8AD;
	Tue,  8 Jul 2025 18:27:50 +0900 (JST)
From: Michael Dege <michael.dege@renesas.com>
Date: Tue, 08 Jul 2025 11:27:37 +0200
Subject: [PATCH v2 1/4] net: renesas: rswitch: rename rswitch.c to
 rswitch_main.c
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250708-add_l2_switching-v2-1-f91f5556617a@renesas.com>
References: <20250708-add_l2_switching-v2-0-f91f5556617a@renesas.com>
In-Reply-To: <20250708-add_l2_switching-v2-0-f91f5556617a@renesas.com>
To: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>, 
 =?utf-8?q?Niklas_S=C3=B6derlund?= <niklas.soderlund@ragnatech.se>, 
 Paul Barker <paul@pbarker.dev>, Andrew Lunn <andrew+netdev@lunn.ch>, 
 "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, 
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>
Cc: netdev@vger.kernel.org, linux-renesas-soc@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Michael Dege <michael.dege@renesas.com>, 
 Nikita Yushchenko <nikita.yoush@cogentembedded.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1751966866; l=1175;
 i=michael.dege@renesas.com; s=20250523; h=from:subject:message-id;
 bh=l4w4ScuC6+kKDFL0zv62ICBhy98vqkkl4tddPQXmdeU=;
 b=VR3sQ3MOk7Nje9xJ1qdtyJO85uiGyd6rp2iK5sIziDYFO4ZEUOH0yomJMBaN82npDagM8CQFO
 MWbCqCX5eTwCXj33BWc5oyHWaBIrvdcK/J+Spx5ING/rqwXgCGgz10m
X-Developer-Key: i=michael.dege@renesas.com; a=ed25519;
 pk=+gYTlVQ3/MlOju88OuKnXA7MlapP4lYqJn1F81HZGSo=

Adding new functionality to the driver. Therefore splitting into multiple
c files to keep them manageable. New functionality will be added to
separate files.

Signed-off-by: Michael Dege <michael.dege@renesas.com>
---
 drivers/net/ethernet/renesas/Makefile                      | 1 +
 drivers/net/ethernet/renesas/{rswitch.c => rswitch_main.c} | 0
 2 files changed, 1 insertion(+)

diff --git a/drivers/net/ethernet/renesas/Makefile b/drivers/net/ethernet/renesas/Makefile
index f65fc76f8b4df8dd9f24af836b6dc0772965366f..6222298bb5582b7091cf8de76acb83ac7dd39c11 100644
--- a/drivers/net/ethernet/renesas/Makefile
+++ b/drivers/net/ethernet/renesas/Makefile
@@ -8,6 +8,7 @@ obj-$(CONFIG_SH_ETH) += sh_eth.o
 ravb-objs := ravb_main.o ravb_ptp.o
 obj-$(CONFIG_RAVB) += ravb.o
 
+rswitch-objs := rswitch_main.o
 obj-$(CONFIG_RENESAS_ETHER_SWITCH) += rswitch.o
 
 obj-$(CONFIG_RENESAS_GEN4_PTP) += rcar_gen4_ptp.o
diff --git a/drivers/net/ethernet/renesas/rswitch.c b/drivers/net/ethernet/renesas/rswitch_main.c
similarity index 100%
rename from drivers/net/ethernet/renesas/rswitch.c
rename to drivers/net/ethernet/renesas/rswitch_main.c

-- 
2.49.0


