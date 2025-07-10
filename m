Return-Path: <linux-renesas-soc+bounces-19483-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 264FCB0021B
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 10 Jul 2025 14:36:00 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 48CC4646102
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 10 Jul 2025 12:33:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 270AC2E7648;
	Thu, 10 Jul 2025 12:31:45 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from relmlie6.idc.renesas.com (relmlor2.renesas.com [210.160.252.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9D89F2D9782;
	Thu, 10 Jul 2025 12:31:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=210.160.252.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752150705; cv=none; b=Zq9f92HmpYFaEkxDRDnO0hor0Os9ETFMeIBj/kGDaII3GlPWSsnaulbmNMTPI79qkk3plo8CyhhwscAOo2M4TfQxCmopZwHAWsmDpdn3ESasL/4vN1nhlvMe4DRi37yHwRBfswJqEwcgwsVU3OEkR7q/YgMQjax7jNMRVf+QiCM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752150705; c=relaxed/simple;
	bh=rb0k5R5W/hYyw350t3by1gONAEeHvCzNaKdoP+P2iXU=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=EX4eHFr37eA0UHOwNS2kCtJnQ1+9h5KpdnPJ+4xxKCLv6w6xb7Ok42PxLOZFeZm+mDWWAJPo1vnDJvp0cuxVfh8nd9VTmO5iN4NRwknN6XE7W7KLUc+5bdZo0iJnbqBM4wd9dVYmrKo5RJ9i2bUUGktcjbMBiCmA3Byv86CWCs0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com; spf=pass smtp.mailfrom=renesas.com; arc=none smtp.client-ip=210.160.252.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=renesas.com
X-CSE-ConnectionGUID: WdEXSt1FS9O5UmXSZZOnfw==
X-CSE-MsgGUID: afynibwVQNqC6VYn32j2rA==
Received: from unknown (HELO relmlir6.idc.renesas.com) ([10.200.68.152])
  by relmlie6.idc.renesas.com with ESMTP; 10 Jul 2025 21:31:41 +0900
Received: from [127.0.1.1] (unknown [10.226.78.19])
	by relmlir6.idc.renesas.com (Postfix) with ESMTP id 352FC424F40F;
	Thu, 10 Jul 2025 21:31:36 +0900 (JST)
From: Michael Dege <michael.dege@renesas.com>
Date: Thu, 10 Jul 2025 14:31:09 +0200
Subject: [PATCH v3 1/4] net: renesas: rswitch: rename rswitch.c to
 rswitch_main.c
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20250710-add_l2_switching-v3-1-c0a328327b43@renesas.com>
References: <20250710-add_l2_switching-v3-0-c0a328327b43@renesas.com>
In-Reply-To: <20250710-add_l2_switching-v3-0-c0a328327b43@renesas.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1752150692; l=1290;
 i=michael.dege@renesas.com; s=20250523; h=from:subject:message-id;
 bh=rb0k5R5W/hYyw350t3by1gONAEeHvCzNaKdoP+P2iXU=;
 b=GHxQzXlWcICqBhwDAywHZGab6gmne9PCbUTAraobNEBWKUxptfB7datqD/17JNkUTYFgtpeqv
 ZIs8pvXmIJgDWk3ZiZ7Voocm9W5SW7YkU+dnkFnGhdPFQ45QxhCbQZg
X-Developer-Key: i=michael.dege@renesas.com; a=ed25519;
 pk=+gYTlVQ3/MlOju88OuKnXA7MlapP4lYqJn1F81HZGSo=

Adding new functionality to the driver. Therefore splitting into multiple
c files to keep them manageable. New functionality will be added to
separate files.

Reviewed-by: Andrew Lunn <andrew@lunn.ch>
Reviewed-by: Niklas Söderlund <niklas.soderlund+renesas@ragnatech.se>
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


