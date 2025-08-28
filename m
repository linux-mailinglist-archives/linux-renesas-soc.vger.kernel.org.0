Return-Path: <linux-renesas-soc+bounces-21007-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 97112B399EA
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 28 Aug 2025 12:31:08 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 564027C267A
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 28 Aug 2025 10:30:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CA8FF30BF7E;
	Thu, 28 Aug 2025 10:28:36 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from relmlie5.idc.renesas.com (relmlor1.renesas.com [210.160.252.171])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1C67B30AD1B;
	Thu, 28 Aug 2025 10:28:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=210.160.252.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756376916; cv=none; b=ev+W2ifJ+fxI87mNUOM95JPbDRRhxTREIF7lpp3Tsb2dllbJzM+gBWBFMzZ2/5ou+fDQwL2ms76shBjLeF88Q67kYza2WOmolL0oZnmNemwKrhGWDzk9JfaTNaHKccbO7C2sJY8ZMpxirQXw3GyEUyJGePAG9fMmT3NO3mhRIg8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756376916; c=relaxed/simple;
	bh=q1Klpjwv/WnXJATJN/W7Z/cWbQNEimJhGYE1d/lZ/Qk=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=d/uOUBgkPU6/Y2tQKfrN5cR5hc5kHk3Jtpk92FRpPKUgHokGU4Gl/+i7eEHlqsBcSo8kfsbX6qnxgfg1Zvd3Z7Xl77jlnUtvT9LUp63mQrSrhIiPSLvxR6y54A4Lfm2CuaSc+j3M2xOtN6ecvg8gfx4Yc46BJ0KCUF/ucoeFljo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com; spf=pass smtp.mailfrom=renesas.com; arc=none smtp.client-ip=210.160.252.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=renesas.com
X-CSE-ConnectionGUID: WPSssH9bSzu9vfYLfgaPPg==
X-CSE-MsgGUID: emr7/kHSTwGdJnRrpRCXoQ==
Received: from unknown (HELO relmlir6.idc.renesas.com) ([10.200.68.152])
  by relmlie5.idc.renesas.com with ESMTP; 28 Aug 2025 19:23:24 +0900
Received: from [127.0.1.1] (unknown [10.226.78.19])
	by relmlir6.idc.renesas.com (Postfix) with ESMTP id 3C7ED417D5AC;
	Thu, 28 Aug 2025 19:23:20 +0900 (JST)
From: Michael Dege <michael.dege@renesas.com>
Subject: [net-next PATCH v4 0/4] net: renesas: rswitch: R-Car S4 add HW
 offloading for layer 2 switching
Date: Thu, 28 Aug 2025 12:23:11 +0200
Message-Id: <20250828-add_l2_switching-v4-0-89d7108c8592@renesas.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-B4-Tracking: v=1; b=H4sIAA8usGgC/23NQQ6CMBCF4auQrq3pTClUV97DGFLaAk0UTEtQQ
 7i7BTcYWP4vmW9GEqx3NpBzMhJvBxdc18ZIDwnRjWprS52JTZChYBlkVBlT3LEIL9frxrU15ak
 AyIEJwwyJZ09vK/deyOstduNC3/nP8mGAef1hOUu32ACU0aqSEpXSJQp58ba1QYWj7h5k5gZcE
 3KHwJk4QSWEyDLI1ZbgKwLYDsEjoZniKDnmZcr/iWmavlpGxGo4AQAA
X-Change-ID: 20250616-add_l2_switching-345117105d0d
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1756376599; l=3855;
 i=michael.dege@renesas.com; s=20250523; h=from:subject:message-id;
 bh=q1Klpjwv/WnXJATJN/W7Z/cWbQNEimJhGYE1d/lZ/Qk=;
 b=Ukyt9Am6bv1y1r6saelj5rEnny8d+QkgPg3Jdx3B04brn3XkeU5xyAnjA/xvQ3V7mKigofY9J
 h3IIRAPN4IrAY33Kq+VRafswAQNJY1gBveHF7wUHMEWrWrwvjEG28bm
X-Developer-Key: i=michael.dege@renesas.com; a=ed25519;
 pk=+gYTlVQ3/MlOju88OuKnXA7MlapP4lYqJn1F81HZGSo=

Hello!

The current R-Car S4 rswitch driver only supports port based fowarding.
This patch set adds HW offloading for L2 switching/bridgeing. The driver
hooks into switchdev.

1. Rename the base driver file to keep the driver name (rswitch.ko)

2. Add setting of default MAC ageing time in hardware.

3. Add the L2 driver extension in a separate file. The HW offloading
is automatically configured when a port is added to the bridge device.

Usage example:
ip link add name br0 type bridge
ip link set dev tsn0 master br0
ip link set dev tsn1 master br0
ip link set dev br0 up
ip link set dev tsn0 up
ip link set dev tsn1 up

Layer 2 traffic is now fowarded by HW from port TSN0 to port TSN1.

4. Provides the functionality to set the MAC table ageing time in the
Rswitch.

Usage example:
ip link change dev br0 type bridge ageing 100

Changes in v4:
- Added target tree to subject prefix.
- refactored rswitch_update_l2_hw_learning() and
  rswitch_update_l2_hw_forwarding() to remove duplicate code. 
- In function rswitch_update_offload_brdev() removed unused
  force_update_l2_offload parameter.
- Link to v3: https://lore.kernel.org/r/20250710-add_l2_switching-v3-0-c0a328327b43@renesas.com

Changes in v3:
- Split void rswitch_update_l2_offload(struct rswitch_private *priv) 
  into two functions to reduce the complexity.
- In rswitch_switchdev_blocking_event() returning -EOPNOTSUPP directly
  for unsupported events intead of calling function which returned
  -EOPNOTSUPP.
- Retuning result from rswitch_reg_wait() directly instead of using
  local variable at end of function.
- Restructured rswitch_update_offload_brdev() to fix smatch
  false-positive report.  
- Fixed reviewed-by tags in [1/4]
- Fixed oder of signed-off-by tags in [2/4]
- Removed magic number in [2/4]
- Link to v2: https://lore.kernel.org/r/20250708-add_l2_switching-v2-0-f91f5556617a@renesas.com

Changes in v2:
- Pulled default ageing setting into separate patch.
- Changed logging priority from info to dbg.
- Updated usage examples.
- Fixed passing of ageing parameter. Parameter is already in seconds
  no need to convert. Parameter checking improved.
- Updated commit message of [3/4] to point out that the switch hardware
  only supports the offloading of one bridge device. 
- Link to v1: https://lore.kernel.org/r/20250704-add_l2_switching-v1-0-ff882aacb258@renesas.com

Thanks,

Michael

Signed-off-by: Michael Dege <michael.dege@renesas.com>
Signed-off-by: Nikita Yushchenko <nikita.yoush@cogentembedded.com>
---
To: Niklas Söderlund <niklas.soderlund@ragnatech.se>
To: Paul Barker <paul@pbarker.dev>
To: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
To: Andrew Lunn <andrew+netdev@lunn.ch>
To: David S. Miller <davem@davemloft.net>
To: Eric Dumazet <edumazet@google.com>
To: Jakub Kicinski <kuba@kernel.org>
To: Paolo Abeni <pabeni@redhat.com>
Cc: netdev@vger.kernel.org
Cc: linux-renesas-soc@vger.kernel.org
Cc: linux-kernel@vger.kernel.org

---
Michael Dege (4):
      net: renesas: rswitch: rename rswitch.c to rswitch_main.c
      net: renesas: rswitch: configure default ageing time
      net: renesas: rswitch: add offloading for L2 switching
      net: renesas: rswitch: add modifiable ageing time

 drivers/net/ethernet/renesas/Makefile              |   1 +
 drivers/net/ethernet/renesas/rswitch.h             |  43 ++-
 drivers/net/ethernet/renesas/rswitch_l2.c          | 317 +++++++++++++++++++++
 drivers/net/ethernet/renesas/rswitch_l2.h          |  15 +
 .../ethernet/renesas/{rswitch.c => rswitch_main.c} |  86 +++++-
 5 files changed, 456 insertions(+), 6 deletions(-)
---
base-commit: 19272b37aa4f83ca52bdf9c16d5d81bdd1354494
change-id: 20250616-add_l2_switching-345117105d0d

Best regards,
-- 
Michael Dege <michael.dege@renesas.com>


