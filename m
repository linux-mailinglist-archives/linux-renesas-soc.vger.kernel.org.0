Return-Path: <linux-renesas-soc+bounces-19482-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 09436B00212
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 10 Jul 2025 14:35:26 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 0B5C5482E46
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 10 Jul 2025 12:33:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 42F4325DB0B;
	Thu, 10 Jul 2025 12:31:42 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from relmlie5.idc.renesas.com (relmlor1.renesas.com [210.160.252.171])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4588C25D20D;
	Thu, 10 Jul 2025 12:31:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=210.160.252.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752150702; cv=none; b=gDRC9YmU7+4/Uk48Utz8ckn4gMcFhpS8pqY1WVpk6BsBHH6gZfKATtb0IK7F28Y4oUZ9EwonDgytkXiMea9EHNiM7Jrot+3sbKfLkaogIfQiYMjVTjA3kDt4wVqNKz6zX4kzZDPGuOXL7xf3mR8iB89bX77R0RGHgL2Knz5dau8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752150702; c=relaxed/simple;
	bh=M9Hxi/rWHhCUVQo8Kh4FQnmVGx3F+X0DzPGvf8IGSFg=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=NfY19ZsNv1KrhGUOAdrl6c23ulZTO4zZRiNWdELaMoGV/PqCruNUu/vfmuR7nQhoSLX0xQk/+bRy22HXa0K32ijIhrTZzbmYk4qeS2q7WWRgBzzMw1lV+A1DLN9KLtR8R7isS5VHEY65Jtnqz2OJh6q+ZeQbQBrIDNbnBPJ/mzw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com; spf=pass smtp.mailfrom=renesas.com; arc=none smtp.client-ip=210.160.252.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=renesas.com
X-CSE-ConnectionGUID: Ajhg7MxQT+uFBHipeA6GRQ==
X-CSE-MsgGUID: CtcF/ts8T6qXhkQnGqwPWg==
Received: from unknown (HELO relmlir6.idc.renesas.com) ([10.200.68.152])
  by relmlie5.idc.renesas.com with ESMTP; 10 Jul 2025 21:31:36 +0900
Received: from [127.0.1.1] (unknown [10.226.78.19])
	by relmlir6.idc.renesas.com (Postfix) with ESMTP id CCD0D424F40F;
	Thu, 10 Jul 2025 21:31:32 +0900 (JST)
From: Michael Dege <michael.dege@renesas.com>
Subject: [PATCH v3 0/4] net: renesas: rswitch: R-Car S4 add HW offloading
 for layer 2 switching
Date: Thu, 10 Jul 2025 14:31:08 +0200
Message-Id: <20250710-add_l2_switching-v3-0-c0a328327b43@renesas.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-B4-Tracking: v=1; b=H4sIAIyyb2gC/23NQQ7CIBCF4as0rMUwtFB05T2MaRBoO4lSAw1qm
 t5dWjcaXf4vmW8mEl1AF8m+mEhwCSMOPke5KYjpte8cRZubcMYFkyCptra58CbecTQ9+o6WlQC
 ogQnLLMlnt+BafKzk8ZS7xzgO4bl+SLCsb6xm1S+WgDLatkpxrc2ZC3UIzruo49YMV7JwiX8S6
 g/BF2IHrRBCSqj1NzHP8wvSZU+j9QAAAA==
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1752150692; l=3487;
 i=michael.dege@renesas.com; s=20250523; h=from:subject:message-id;
 bh=M9Hxi/rWHhCUVQo8Kh4FQnmVGx3F+X0DzPGvf8IGSFg=;
 b=JTtsrX1xm0wmdIu0aJF3L21AkgobHlgc1Fz1oFJHnuKn1op2Uc9ogf9jR5UVnZT4knkCRD9nX
 f4CZXOWptrZAJU2ArRsNrao2Vp2MtTFegR4zgZHziXi8yXKEnz0R/JX
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
 drivers/net/ethernet/renesas/rswitch_l2.c          | 326 +++++++++++++++++++++
 drivers/net/ethernet/renesas/rswitch_l2.h          |  15 +
 .../ethernet/renesas/{rswitch.c => rswitch_main.c} |  86 +++++-
 5 files changed, 465 insertions(+), 6 deletions(-)
---
base-commit: 19272b37aa4f83ca52bdf9c16d5d81bdd1354494
change-id: 20250616-add_l2_switching-345117105d0d

Best regards,
-- 
Michael Dege <michael.dege@renesas.com>


