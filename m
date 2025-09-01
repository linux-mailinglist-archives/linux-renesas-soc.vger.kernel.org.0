Return-Path: <linux-renesas-soc+bounces-21101-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id AA9EFB3D869
	for <lists+linux-renesas-soc@lfdr.de>; Mon,  1 Sep 2025 06:59:07 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 3185A1899828
	for <lists+linux-renesas-soc@lfdr.de>; Mon,  1 Sep 2025 04:59:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8010123C8A1;
	Mon,  1 Sep 2025 04:58:50 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from relmlie5.idc.renesas.com (relmlor1.renesas.com [210.160.252.171])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3B18F239E63;
	Mon,  1 Sep 2025 04:58:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=210.160.252.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756702730; cv=none; b=mwybmBIAuI69r3fGXZemorRLtnAmBo6iBCJ90qUx5q05UTaUrEgbmtOQZo4BAdVrxyVtitWmqNjr+HMmFm6NFwCDxF6BrMiziukxPJ5SiMDeaSrjouYLRZGGmYPFO7K9EcbDDBv1xm98O+EfNUboyAZWyjwmZA2RSiRuUSP0xLY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756702730; c=relaxed/simple;
	bh=ejwD9ucnK/Y/oL/CYQ7ZD+4+EHBGgdpsr8hfz+KYG4E=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Cs0ZzAWXTA0DDdtFrlQ20mJCT6AZPc4UANyMJHGiV7XC8XjD/uFJfzplbKkJOOmOwJ/CaXxNx9mvOLbcpkVlzd4lpUvefP3YaQcnM2f9PiMeMJW9Nlz4+IqfzYQT4aJbWlibH9OxKuL/4nOeEJMot7ZL73ZvyjT9UB4DzNPeGYw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com; spf=pass smtp.mailfrom=renesas.com; arc=none smtp.client-ip=210.160.252.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=renesas.com
X-CSE-ConnectionGUID: O0m0v2i3Snubt5uPse35jg==
X-CSE-MsgGUID: CYNz6TuWStePCpiRVol0Ag==
Received: from unknown (HELO relmlir5.idc.renesas.com) ([10.200.68.151])
  by relmlie5.idc.renesas.com with ESMTP; 01 Sep 2025 13:58:41 +0900
Received: from [127.0.1.1] (unknown [10.226.78.19])
	by relmlir5.idc.renesas.com (Postfix) with ESMTP id 7F64F400F309;
	Mon,  1 Sep 2025 13:58:37 +0900 (JST)
From: Michael Dege <michael.dege@renesas.com>
Date: Mon, 01 Sep 2025 06:58:05 +0200
Subject: [PATCH net-next v5 1/4] net: renesas: rswitch: rename rswitch.c to
 rswitch_main.c
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20250901-add_l2_switching-v5-1-5f13e46860d5@renesas.com>
References: <20250901-add_l2_switching-v5-0-5f13e46860d5@renesas.com>
In-Reply-To: <20250901-add_l2_switching-v5-0-5f13e46860d5@renesas.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1756702712; l=1357;
 i=michael.dege@renesas.com; s=20250523; h=from:subject:message-id;
 bh=ejwD9ucnK/Y/oL/CYQ7ZD+4+EHBGgdpsr8hfz+KYG4E=;
 b=sF1gEi0kvCAcp9RTs1TpcQqYWF7GNqnCQq+RIhIvUb09OTEKlMSVqvCti+xEaMczfknti5yge
 f3Q/pov3tqmDdGDBvZoqMtgQHce9BTvg9R1bBdq5TfslhmztqmdfSmM
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


