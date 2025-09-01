Return-Path: <linux-renesas-soc+bounces-21100-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 85B50B3D867
	for <lists+linux-renesas-soc@lfdr.de>; Mon,  1 Sep 2025 06:58:52 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 24B8C3BB90F
	for <lists+linux-renesas-soc@lfdr.de>; Mon,  1 Sep 2025 04:58:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 15F7F22422F;
	Mon,  1 Sep 2025 04:58:47 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from relmlie6.idc.renesas.com (relmlor2.renesas.com [210.160.252.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2A3E0226863;
	Mon,  1 Sep 2025 04:58:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=210.160.252.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756702726; cv=none; b=lX4jLlZIHOb9ZFeWOXPoQU4176ceEkCg4JWxDkxuvR44Wgr5Bg90jc1Ysz3EBh458GN9AyfnqakHVCtO8Kres2VWVAdgjn/HFDja5hp9f5d8bcxvKMInFzxZn6zY4jGiQv+21g6rlr1oGFVFfhdQMmaFp6Z0s7Uf9SvLiX9gYqU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756702726; c=relaxed/simple;
	bh=SogQWvNqfqMLWW+Sam3+C1XG+3hPYsmEKbe3pwlLWag=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=taB3HmljRBkOMAH5ORbGIB8gVRgkdr7Kpfhc9ONcIMZVN/xRsNurQFVG0YToYfzyogkojZ9t15Taz8/EMg+ebtyEMUOyBDkF1fr+0BwNIbcUralIXd4xX2G8f1rIO9jPPtjkvHU4UWlYUrotZnk3buuQd1Ptgzm5dqo8EijRgZQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com; spf=pass smtp.mailfrom=renesas.com; arc=none smtp.client-ip=210.160.252.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=renesas.com
X-CSE-ConnectionGUID: 0kT3Ze4dSBWctoXSccUIuw==
X-CSE-MsgGUID: 4RpDT+V8SoCFr8KTr7Tx2w==
Received: from unknown (HELO relmlir5.idc.renesas.com) ([10.200.68.151])
  by relmlie6.idc.renesas.com with ESMTP; 01 Sep 2025 13:58:37 +0900
Received: from [127.0.1.1] (unknown [10.226.78.19])
	by relmlir5.idc.renesas.com (Postfix) with ESMTP id 12CB2400EF75;
	Mon,  1 Sep 2025 13:58:32 +0900 (JST)
From: Michael Dege <michael.dege@renesas.com>
Subject: [net-next PATCH v5 0/4] net: renesas: rswitch: R-Car S4 add HW
 offloading for layer 2 switching
Date: Mon, 01 Sep 2025 06:58:04 +0200
Message-Id: <20250901-add_l2_switching-v5-0-5f13e46860d5@renesas.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-B4-Tracking: v=1; b=H4sIANwntWgC/23OwW7CMAyA4VdBOS9T7MSty2nvMSEUkpRGYi1KU
 AGhvvtSdhioPf6W/NkPkUOKIYvt5iFSGGOOQ1+CPjbCdbY/Bhl9aYEKSVVQSev9/oT7fI0X18X
 +KLUhgBoUeeVFWTun0Mbbk/zele5ivgzp/rwwwjz9w2plltgIUsm2ZUZr3QGJv1LoQ7b50w0/Y
 uZGfCV4hcCZaKAloqqC2i4J/UKAWiF0IZyyGlljfTB6SZh/gnHtC1MIbnzx2TE1+E5M0/QLerl
 plnsBAAA=
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1756702712; l=4182;
 i=michael.dege@renesas.com; s=20250523; h=from:subject:message-id;
 bh=SogQWvNqfqMLWW+Sam3+C1XG+3hPYsmEKbe3pwlLWag=;
 b=9eVVB6VFzSuBYpfbRtokLsvpirpubmffCKioSZnf8S+oFFlaHeNnTJ/nky35XVlzkNJuluFX/
 0X+gUZo3vcCB+ZwHISA9oW4H8Pn6KFu+5mAVL16uDsixKK/9pQtXjzk
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

Changes in v5:
- Updated commit messeges [3/4] and [4/4] using iperative mood.
- Fixed incorrect id_len setting in rswitch_get_port_parent_id()
- Removed duplicate initialization of *rdev in 
  rswitch_update_ageing_time()
- Link to v4: https://lore.kernel.org/r/20250828-add_l2_switching-v4-0-89d7108c8592@renesas.com

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
 drivers/net/ethernet/renesas/rswitch_l2.c          | 316 +++++++++++++++++++++
 drivers/net/ethernet/renesas/rswitch_l2.h          |  15 +
 .../ethernet/renesas/{rswitch.c => rswitch_main.c} |  86 +++++-
 5 files changed, 455 insertions(+), 6 deletions(-)
---
base-commit: 19272b37aa4f83ca52bdf9c16d5d81bdd1354494
change-id: 20250616-add_l2_switching-345117105d0d

Best regards,
-- 
Michael Dege <michael.dege@renesas.com>


