Return-Path: <linux-renesas-soc+bounces-21008-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 7FC2AB399F1
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 28 Aug 2025 12:32:01 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id AE8ED1C231FA
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 28 Aug 2025 10:30:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5964130C62E;
	Thu, 28 Aug 2025 10:28:38 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from relmlie5.idc.renesas.com (relmlor1.renesas.com [210.160.252.171])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3DBBD2C21CF;
	Thu, 28 Aug 2025 10:28:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=210.160.252.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756376918; cv=none; b=MMuajv3QZt3DsjpoIud1jHX6MQVulowJHWmAUXF4JmQgRAs1XML/tVDfU1aL6z+CJ0guqyJ6qMtngOD9un6n0DnF1afOFICUXqJnmVrJXp89R+dMoBk2C/kPIrZjGPxCsBb9McmzLtkvkUZm6tOuUIg+Kml2yiIORkYbJhQC/y4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756376918; c=relaxed/simple;
	bh=ejwD9ucnK/Y/oL/CYQ7ZD+4+EHBGgdpsr8hfz+KYG4E=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=fZf5B9wovDUxWL5aypjyMZcI5DwmScyRmxYCqVe0xW1J08C7MLB5FgbXa4Was+L0VpLhlujoiBIKJ3tMYJBsPMtFiGiBzt0/K5ldSX/uxhVpY17VNzDI5Fp2w4TZ3FVLs4xDZB3zaMXblOEfAPH+5g7iJYabNqrezC2Vvxm2gFc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com; spf=pass smtp.mailfrom=renesas.com; arc=none smtp.client-ip=210.160.252.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=renesas.com
X-CSE-ConnectionGUID: I2xqLsntQFmgmL1nK3skEQ==
X-CSE-MsgGUID: OMUNxodERUaumZQEacunOw==
Received: from unknown (HELO relmlir6.idc.renesas.com) ([10.200.68.152])
  by relmlie5.idc.renesas.com with ESMTP; 28 Aug 2025 19:23:28 +0900
Received: from [127.0.1.1] (unknown [10.226.78.19])
	by relmlir6.idc.renesas.com (Postfix) with ESMTP id AA5DE417D5AC;
	Thu, 28 Aug 2025 19:23:24 +0900 (JST)
From: Michael Dege <michael.dege@renesas.com>
Date: Thu, 28 Aug 2025 12:23:12 +0200
Subject: [PATCH net-next v4 1/4] net: renesas: rswitch: rename rswitch.c to
 rswitch_main.c
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20250828-add_l2_switching-v4-1-89d7108c8592@renesas.com>
References: <20250828-add_l2_switching-v4-0-89d7108c8592@renesas.com>
In-Reply-To: <20250828-add_l2_switching-v4-0-89d7108c8592@renesas.com>
To: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>, 
 =?utf-8?q?Niklas_S=C3=B6derlund?= <niklas.soderlund@ragnatech.se>, 
 Paul Barker <paul@pbarker.dev>, Andrew Lunn <andrew+netdev@lunn.ch>, 
 "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, 
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>
Cc: netdev@vger.kernel.org, linux-renesas-soc@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Michael Dege <michael.dege@renesas.com>, 
 Nikita Yushchenko <nikita.yoush@cogentembedded.com>, 
 Andrew Lunn <andrew@lunn.ch>, 
 =?utf-8?q?Niklas_S=C3=B6derlund?= <niklas.soderlund+renesas@ragnatech.se>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1756376599; l=1357;
 i=michael.dege@renesas.com; s=20250523; h=from:subject:message-id;
 bh=ejwD9ucnK/Y/oL/CYQ7ZD+4+EHBGgdpsr8hfz+KYG4E=;
 b=vrjGrj8XuKQ5nqG8y4k5h/Yd63HelX9s1FZs57jVpBi94vSw+CVd22Us6YoU6xh1PZIBawuXd
 H5isfDEaa9wBMfd5K+Kf+6suV0xh5/REnRFCHiLPszXkhkybcy9moKP
X-Developer-Key: i=michael.dege@renesas.com; a=ed25519;
 pk=+gYTlVQ3/MlOju88OuKnXA7MlapP4lYqJn1F81HZGSo=

Adding new functionality to the driver. Therefore splitting into multiple
c files to keep them manageable. New functionality will be added to
separate files.

Reviewed-by: Andrew Lunn <andrew@lunn.ch>
Reviewed-by: Niklas Söderlund <niklas.soderlund+renesas@ragnatech.se>
Reviewed-by: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
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
2.50.1


