Return-Path: <linux-renesas-soc+bounces-19182-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 08FDDAF8767
	for <lists+linux-renesas-soc@lfdr.de>; Fri,  4 Jul 2025 07:51:40 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 46CF23A5509
	for <lists+linux-renesas-soc@lfdr.de>; Fri,  4 Jul 2025 05:51:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 48FCB20DD42;
	Fri,  4 Jul 2025 05:51:36 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from relmlie6.idc.renesas.com (relmlor2.renesas.com [210.160.252.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AE29A205E02;
	Fri,  4 Jul 2025 05:51:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=210.160.252.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751608296; cv=none; b=rp11rtQfYrwNbrIgDC56rl+6g8pFBdP9O4k/gfzVlD9qhtigyN2q++iVT47ojI8g4cNy8Cgc33o4+WdOcTVerNcUe2Px+eVUkJt8TlHdgRaYqyvd4hGeQToskweuP44ODVnHxPQkhLrlW21EUp5wDl/E4tc1WZOXnmmsJD7S/6I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751608296; c=relaxed/simple;
	bh=fB+FQaLeKQCqcyQ3cf1/iOclesosPJUHqJkKrxwT/tU=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=Scjiwt5TN2UZSmOk2wocdRpMWkwICNdNQYt5VVUo6EyvgMrfUiwQHsRixB81DtelTduJjbSr4PlNb+FXyG+6C/3T/3sVTnBgC9rAonLafLPM52uUCjCdOGeB7wqAgS3T8dO5OxKHhzOy35DOHQ9pDvF5yY87AyCD/b2WIWb7xcw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com; spf=pass smtp.mailfrom=renesas.com; arc=none smtp.client-ip=210.160.252.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=renesas.com
X-CSE-ConnectionGUID: g1AZybX6R5qI5qLyChaz/A==
X-CSE-MsgGUID: H4CsqKgeTgOTKPKnnf1UCQ==
Received: from unknown (HELO relmlir6.idc.renesas.com) ([10.200.68.152])
  by relmlie6.idc.renesas.com with ESMTP; 04 Jul 2025 14:51:32 +0900
Received: from [127.0.1.1] (unknown [10.226.78.19])
	by relmlir6.idc.renesas.com (Postfix) with ESMTP id D785941566DC;
	Fri,  4 Jul 2025 14:51:28 +0900 (JST)
From: Michael Dege <michael.dege@renesas.com>
Subject: [PATCH 0/3] net: renesas: rswitch: R-Car S4 add HW offloading for
 layer 2 switching
Date: Fri, 04 Jul 2025 07:51:14 +0200
Message-Id: <20250704-add_l2_switching-v1-0-ff882aacb258@renesas.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIANJrZ2gC/x3MQQqAIBBA0avErBMcS4OuEhHRTDkQFhoVRHdPW
 r7F/w8kjsIJ2uKByKck2UIGlgVMfgwLK6FsMNpY7dCpkWhYzZAuOSYvYVFVbREb1JY0Qc72yLP
 c/7Lr3/cDNTQpFGIAAAA=
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1751608288; l=1696;
 i=michael.dege@renesas.com; s=20250523; h=from:subject:message-id;
 bh=fB+FQaLeKQCqcyQ3cf1/iOclesosPJUHqJkKrxwT/tU=;
 b=9eG/9Tow82L7TUDK6gPh8F9s8z+spio+oYe9J32Vnm7cje21J80TmwW8oV86vTrIT0+pJrGes
 Bs/pOO/Y/yeDYod713GMj9V6JGgJ7+ExKulhOD1YLkDblD/VT0lF13h
X-Developer-Key: i=michael.dege@renesas.com; a=ed25519;
 pk=+gYTlVQ3/MlOju88OuKnXA7MlapP4lYqJn1F81HZGSo=

Hello!

The current R-Car S4 rswitch driver only supports port based fowarding.
This patch set adds HW offloading for L2 switching/bridgeing. The driver
hooks into switchdev.

1. Rename the base driver file to keep the driver name (rswitch.ko)

2. Add the L2 driver extension in a separate file. The HW offloading
is automatically configured when a port is added to the bridge device.

Ussage example:
ip link add name br type bridge
ip link set dev tsn0 master br
ip link set dev tsn1 master br
ip link set dev br up
ip link set dev tsn0 up
ip link set dev tsn1 up

Layer 2 traffic is now fowarded by HW from port TSN0 to port TSN1.

3. Provides the functionality to set the MAC table ageing time in the
Rswitch.

Usage example:
brctl setageing br 300

Thanks,

Michael

Signed-off-by: Michael Dege <michael.dege@renesas.com>
Signed-off-by: Nikita Yushchenko <nikita.yoush@cogentembedded.com>
---
Michael Dege (3):
      net: renesas: rswitch: rename rswitch.c to rswitch_main.c
      net: renesas: rswitch: add offloading for L2 switching
      net: renesas: rswitch: add modifiable ageing time

 drivers/net/ethernet/renesas/Makefile              |   1 +
 drivers/net/ethernet/renesas/rswitch.h             |  43 ++-
 drivers/net/ethernet/renesas/rswitch_l2.c          | 344 +++++++++++++++++++++
 drivers/net/ethernet/renesas/rswitch_l2.h          |  15 +
 .../ethernet/renesas/{rswitch.c => rswitch_main.c} |  88 +++++-
 5 files changed, 485 insertions(+), 6 deletions(-)
---
base-commit: 19272b37aa4f83ca52bdf9c16d5d81bdd1354494
change-id: 20250616-add_l2_switching-345117105d0d

Best regards,
-- 
Michael Dege <michael.dege@renesas.com>


