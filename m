Return-Path: <linux-renesas-soc+bounces-19368-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 49494AFC700
	for <lists+linux-renesas-soc@lfdr.de>; Tue,  8 Jul 2025 11:28:02 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 65DFC3AC9AD
	for <lists+linux-renesas-soc@lfdr.de>; Tue,  8 Jul 2025 09:27:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9F3D022A4E5;
	Tue,  8 Jul 2025 09:28:00 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from relmlie5.idc.renesas.com (relmlor1.renesas.com [210.160.252.171])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B5E5718A6DB;
	Tue,  8 Jul 2025 09:27:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=210.160.252.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751966880; cv=none; b=kbzD6dqJpRoXoq+++a0AWem1FI//zahE1PvfVUvOR3E+V7JfKqW/ctDmiUXXE2SQ7XyU4mZklnUnw8aoNmSlfixW2kdPFuDIVIBb2eJAoFNZlkm5beQxcz/CfCVMV4EBRxIi+lLvfVgatjYNEqcTapQXW1g2npKj6RLvZp6pQ84=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751966880; c=relaxed/simple;
	bh=C99uMKHenzxbuGkCQo56LwfHOevcoSU5d+ZLJw7xICo=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=ieGhD4kaZOqGok7QLrP+7iyK39S5yCxSRzc6VPJd4/0kOcL+uDj3VYmQWdRwQZuQBchUPQkriSXsU5Q5nba5c41Q2HWnrq5ICktVqo0R9W3yoK1UeYBA8kzXQ87XSyUCUkMrA/A+aJYOhurzwQDOX1kkKqOzq3UWnHtIu1aqxes=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com; spf=pass smtp.mailfrom=renesas.com; arc=none smtp.client-ip=210.160.252.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=renesas.com
X-CSE-ConnectionGUID: hyF2CXbtTtS2p5D+tWXBgQ==
X-CSE-MsgGUID: kEqNHHyzQ2yr+MOnLnZfDw==
Received: from unknown (HELO relmlir5.idc.renesas.com) ([10.200.68.151])
  by relmlie5.idc.renesas.com with ESMTP; 08 Jul 2025 18:27:50 +0900
Received: from [127.0.1.1] (unknown [10.226.78.19])
	by relmlir5.idc.renesas.com (Postfix) with ESMTP id A95D0400A8AD;
	Tue,  8 Jul 2025 18:27:46 +0900 (JST)
From: Michael Dege <michael.dege@renesas.com>
Subject: [PATCH v2 0/4] net: renesas: rswitch: R-Car S4 add HW offloading
 for layer 2 switching
Date: Tue, 08 Jul 2025 11:27:36 +0200
Message-Id: <20250708-add_l2_switching-v2-0-f91f5556617a@renesas.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-B4-Tracking: v=1; b=H4sIAIjkbGgC/2WNQQ6CMBBFr0JmbU1bKRBX3sMQUtsBJtGWdAhqC
 He34tLle8l/fwXGRMhwLlZIuBBTDBn0oQA32jCgIJ8ZtNRGVqoS1vvurjt+0uxGCoM4lUapWkn
 jpYc8mxL29NqT1zbzSDzH9N4fFvW1v1gty//YooQUfd802lp306a5JAzIlo8uPqDdtu0DiWUhA
 7IAAAA=
X-Change-ID: 20250616-add_l2_switching-345117105d0d
To: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>, 
 =?utf-8?q?Niklas_S=C3=B6derlund?= <niklas.soderlund@ragnatech.se>, 
 Paul Barker <paul@pbarker.dev>, Andrew Lunn <andrew+netdev@lunn.ch>, 
 "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, 
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>
Cc: netdev@vger.kernel.org, linux-renesas-soc@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Michael Dege <michael.dege@renesas.com>, 
 Nikita Yushchenko <nikita.yoush@cogentembedded.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1751966866; l=2788;
 i=michael.dege@renesas.com; s=20250523; h=from:subject:message-id;
 bh=C99uMKHenzxbuGkCQo56LwfHOevcoSU5d+ZLJw7xICo=;
 b=H0titr0CI8KQiJxXWfyU8c15NQRip6oqY3fpRxnKPMTGS4r6ufUBuvJsF3gO+LR/VDUQ+9DqS
 XAt4s8NkILTDKxfVvRwoIEQdn3sj/hHMHSiI14AowZxhQlQFV2PD7Dm
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
 drivers/net/ethernet/renesas/rswitch.h             |  42 ++-
 drivers/net/ethernet/renesas/rswitch_l2.c          | 339 +++++++++++++++++++++
 drivers/net/ethernet/renesas/rswitch_l2.h          |  15 +
 .../ethernet/renesas/{rswitch.c => rswitch_main.c} |  88 +++++-
 5 files changed, 479 insertions(+), 6 deletions(-)
---
base-commit: 19272b37aa4f83ca52bdf9c16d5d81bdd1354494
change-id: 20250616-add_l2_switching-345117105d0d

Best regards,
-- 
Michael Dege <michael.dege@renesas.com>


