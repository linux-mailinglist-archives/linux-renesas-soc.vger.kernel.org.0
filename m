Return-Path: <linux-renesas-soc+bounces-24210-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id EA7E7C3B153
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 06 Nov 2025 14:08:07 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 55DD31AA4CAC
	for <lists+linux-renesas-soc@lfdr.de>; Thu,  6 Nov 2025 13:01:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3E07232E6AE;
	Thu,  6 Nov 2025 12:55:52 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from relmlie6.idc.renesas.com (relmlor2.renesas.com [210.160.252.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8C8D3D531;
	Thu,  6 Nov 2025 12:55:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=210.160.252.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762433752; cv=none; b=jMAh+Xg6NENyGu7WFx4iDbwSaBilRDjyrrEi7G+PUhRuKNYVY2ya4XSZ7i8N2QBTAN9h1vYZX2hjgg17rLXTSR4h8CRktIvusJn1Hkse2QNIai3UZzdOpAAzZFcYqA7itN8quA4JzCL88TlAvzvGTcrErkgXw28iwFXORWQSpFo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762433752; c=relaxed/simple;
	bh=a5DxmMNI2XVNr/AqRlc7aOhY9J8wOqbYJMSemWMxVnQ=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=KjMiLtpZ9dnj2yHtH6mUuNfzp7xcaTDeYTRmgrDxC8+gTzuYHb25JvQ3nfTBTNXssJstiGKoKPMySOmZbg14zS781HrWrEEsshIIdIGEkJ8sQdId7ktNjDpCAaV3WeqeqzPuJY+OFungurIbmz5yP1v1/dkDCj3iY18X2wLFEl8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com; spf=pass smtp.mailfrom=renesas.com; arc=none smtp.client-ip=210.160.252.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=renesas.com
X-CSE-ConnectionGUID: ti5EZOSGRJqYe8vvCKlz1A==
X-CSE-MsgGUID: gxQF+k4gT3e854gRsKHPnA==
Received: from unknown (HELO relmlir5.idc.renesas.com) ([10.200.68.151])
  by relmlie6.idc.renesas.com with ESMTP; 06 Nov 2025 21:55:41 +0900
Received: from [127.0.1.1] (unknown [10.226.78.121])
	by relmlir5.idc.renesas.com (Postfix) with ESMTP id E62534007553;
	Thu,  6 Nov 2025 21:55:35 +0900 (JST)
From: Michael Dege <michael.dege@renesas.com>
Subject: [PATCH net-next 00/10] net: renesas: rswitch: R-Car S4 add HW
 offloading for layer 3 routing
Date: Thu, 06 Nov 2025 13:55:24 +0100
Message-Id: <20251106-add_l3_routing-v1-0-dcbb8368ca54@renesas.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIALyaDGkC/x3MQQqAIBBA0avIrBNMc2FXiRBxphoIC60IorsnL
 d/i/wcKZaYCvXgg08WFt1TRNgLiEtJMkrEatNJWOW1lQPSr8Xk7D06zNBFtVDp0zhHUaM808f0
 Ph/F9Pxc30bVgAAAA
To: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>, 
 Andrew Lunn <andrew+netdev@lunn.ch>, 
 "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, 
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
 Richard Cochran <richardcochran@gmail.com>, 
 =?utf-8?q?Niklas_S=C3=B6derlund?= <niklas.soderlund@ragnatech.se>, 
 Paul Barker <paul@pbarker.dev>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Geert Uytterhoeven <geert+renesas@glider.be>, 
 Magnus Damm <magnus.damm@gmail.com>
Cc: netdev@vger.kernel.org, linux-renesas-soc@vger.kernel.org, 
 linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, 
 Nikita Yushchenko <nikita.yoush@cogentembedded.com>, 
 Christophe JAILLET <christophe.jaillet@wanadoo.fr>, 
 Michael Dege <michael.dege@renesas.com>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1762433735; l=2696;
 i=michael.dege@renesas.com; s=20251023; h=from:subject:message-id;
 bh=a5DxmMNI2XVNr/AqRlc7aOhY9J8wOqbYJMSemWMxVnQ=;
 b=ILINZH1IoNbd0LjBVRLf53zGrKix8EWzQFTdFo5WIoR7p1AsARHDVC+x7yky1uzMTRCZJ0wi4
 dUKa3U1f7/nAczqnKKRvdMtQMDUbJt1UjJvsGcGE75l7U+RMiitPICZ
X-Developer-Key: i=michael.dege@renesas.com; a=ed25519;
 pk=gu1rwIcCrAxNMv2I8fIfiQvt51xzZwnQy4Ua/DscQt8=

Hello!

The current R-Car S4 rswitch driver only supports port based fowarding
and L2 switching/bridgeing.
This patch set adds HW offloading for simple L3 routing.

1. Clean up MII settings.

2. enable Phy link status pin

3. renesas,r8a779f0-ether-switch.yaml: add optional property "link-pin"

4. r8a779f4-s4sk.dts add link-pin property

5. r8a779f0-spider-ethernet.dtsi add link-pin property

6. Add MAC address filtering.

7. Fix FWPCx register names in macros

8. Add bit access macros for forwarding engine.

9. Add the L3 driver extension in a separate file. The HW offloading
is automatically configured when a port is configured with an IP
address and set to up state.

10: Update error handling of probe function.

Usage example:
ip addr add 192.168.1.22/24 dev tsn0
ip addr add 192.168.10.22/24 dev tsn1
ip link set tsn0 up
ip link set tsn1 up
echo 1 > /proc/sys/net/ipv4/ip_forward

Layer 3 traffic is now routed by HW from port TSN0 to port TSN1.

Signed-off-by: Nikita Yushchenko <nikita.yoush@cogentembedded.com>
Signed-off-by: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
Signed-off-by: Michael Dege <michael.dege@renesas.com>
---
Christophe JAILLET (1):
      net: renesas: rswitch: update error handling of probe

Michael Dege (9):
      net: renesas: rswitch: cleanup MII settings
      net: renesas: rswitch: enable Phy link status pin
      dt-bindings: net: renesas,r8a779f0-ether-switch.yaml: add optional property link-pin
      arm64: dts: renesas: r8a779f4-s4sk.dts add link-pin property
      arm64: dts: renesas: r8a779f0-spider-ethernet.dtsi add link-pin property
      net: renesas: rswitch: add MAC address filtering
      net: renesas: rswitch: fix FWPCx register names
      net: renesas: rswitch: add bit access macros for forwarding engine
      net: renesas: rswitch: add simple l3 routing

 .../net/renesas,r8a779f0-ether-switch.yaml         |   3 +
 .../boot/dts/renesas/r8a779f0-spider-ethernet.dtsi |   3 +
 arch/arm64/boot/dts/renesas/r8a779f4-s4sk.dts      |   2 +
 drivers/net/ethernet/renesas/Makefile              |   2 +-
 drivers/net/ethernet/renesas/rswitch.h             | 230 ++++++-
 drivers/net/ethernet/renesas/rswitch_l2.c          |   2 +-
 drivers/net/ethernet/renesas/rswitch_l3.c          | 751 +++++++++++++++++++++
 drivers/net/ethernet/renesas/rswitch_l3.h          |  24 +
 drivers/net/ethernet/renesas/rswitch_main.c        | 156 ++++-
 9 files changed, 1124 insertions(+), 49 deletions(-)
---
base-commit: 575742822dceb5c57ef25f5cd715e7d0a7b39e9c
change-id: 20250925-add_l3_routing-3cd5c02a499e

Best regards,
-- 
Michael Dege <michael.dege@renesas.com>


