Return-Path: <linux-renesas-soc+bounces-19183-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id F0F1DAF876D
	for <lists+linux-renesas-soc@lfdr.de>; Fri,  4 Jul 2025 07:52:14 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 9E1B63A7B1B
	for <lists+linux-renesas-soc@lfdr.de>; Fri,  4 Jul 2025 05:51:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EDFCF2139B5;
	Fri,  4 Jul 2025 05:51:38 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from relmlie6.idc.renesas.com (relmlor2.renesas.com [210.160.252.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8215D20E030;
	Fri,  4 Jul 2025 05:51:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=210.160.252.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751608298; cv=none; b=dEq4GG9jKcD194030pQU4NHH175Wt3tRUqwObqy1Hg1mW8oFVUCZybIuOFVpfBJn6o2UCMp3ukLa5TGfAfg6Ev40kvrewaUIDcljCzfc9JtRTAvIxUa8bmKaT7icRhOV63GrXz3UlNWqLPPd/DT8eQB8Ov+9iPN4/Bv8IuNzOtI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751608298; c=relaxed/simple;
	bh=l4w4ScuC6+kKDFL0zv62ICBhy98vqkkl4tddPQXmdeU=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=jD1FtaHoGJ3LaMvHSiBmNo5MtlOhd9+8vp37swAc7VXDcr2Iu7TWycodXbP59WuPvSiiTK4QF+HoYV6xiEL85BDIoF22NaXcJC6ZfNarpQI5vpt3bgQmk4jnCq2PCnFZnimNsbm+3KgD8sSR9uUVEJPkEC1TeaulST8nG3DGi+M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com; spf=pass smtp.mailfrom=renesas.com; arc=none smtp.client-ip=210.160.252.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=renesas.com
X-CSE-ConnectionGUID: goUBGLARRFqd3Uz3HLRZsQ==
X-CSE-MsgGUID: O1KvNXh+RrqlDZHwcRQ6Wg==
Received: from unknown (HELO relmlir6.idc.renesas.com) ([10.200.68.152])
  by relmlie6.idc.renesas.com with ESMTP; 04 Jul 2025 14:51:36 +0900
Received: from [127.0.1.1] (unknown [10.226.78.19])
	by relmlir6.idc.renesas.com (Postfix) with ESMTP id ADE5F41566DC;
	Fri,  4 Jul 2025 14:51:32 +0900 (JST)
From: Michael Dege <michael.dege@renesas.com>
Date: Fri, 04 Jul 2025 07:51:15 +0200
Subject: [PATCH 1/3] net: renesas: rswitch: rename rswitch.c to
 rswitch_main.c
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250704-add_l2_switching-v1-1-ff882aacb258@renesas.com>
References: <20250704-add_l2_switching-v1-0-ff882aacb258@renesas.com>
In-Reply-To: <20250704-add_l2_switching-v1-0-ff882aacb258@renesas.com>
To: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>, 
 =?utf-8?q?Niklas_S=C3=B6derlund?= <niklas.soderlund@ragnatech.se>, 
 Paul Barker <paul@pbarker.dev>, Andrew Lunn <andrew+netdev@lunn.ch>, 
 "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, 
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>
Cc: netdev@vger.kernel.org, linux-renesas-soc@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Michael Dege <michael.dege@renesas.com>, 
 Nikita Yushchenko <nikita.yoush@cogentembedded.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1751608288; l=1175;
 i=michael.dege@renesas.com; s=20250523; h=from:subject:message-id;
 bh=l4w4ScuC6+kKDFL0zv62ICBhy98vqkkl4tddPQXmdeU=;
 b=W5ViUsfkGSWf7NJwK1bZE7IAO0ERStN6t/54VfNN6UbjCL0f87bkGKKCuOumy3rcRGRWba2DV
 oJypbMvmSvNDIO3j3ppU3AxZjlsAsuoTJzTGCMl+WBPvQyQumRNYuLf
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


