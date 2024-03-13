Return-Path: <linux-renesas-soc+bounces-3749-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 9BFA987B0E8
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 13 Mar 2024 20:04:31 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id CDA961C26E47
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 13 Mar 2024 19:04:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F295D605DE;
	Wed, 13 Mar 2024 18:16:18 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from relmlie5.idc.renesas.com (relmlor1.renesas.com [210.160.252.171])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 26CF160865;
	Wed, 13 Mar 2024 18:16:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=210.160.252.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1710353778; cv=none; b=XWM+t55Fl4pd2ClDb94NcJyKnN1VE3b8jxhHzQFBDyhDHXZws1S95B3F+Os+9T288yQix8hIN97IJjulHXgAe82L6y7NpBtfboghX63Dk40eXkrbczf+nqhMRcmkMUo4vXbkPn8LpFwsbObCVSQXDzRPuO/YhMo5iUwraiSC8Ac=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1710353778; c=relaxed/simple;
	bh=lzi2vczc4AAHVbWf89emNvuWoZEwvhMQPCgn5sNA10w=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=AtZrWqpzPGpxdysjOe2vqnMJrkZIwS00LtSXXxy3+Mr+LXfZ7pfOs2OcyaW2YuVZjeQQ4eXBXOH/bDfzoBKXWCjO/ZqdnHRex5q2/rdUF8W0V5k2adOpRM3pZOZkomHbxDbDmrC8rboHNwmZWUuFRhREiqP6WxiKtQjht0tI/y8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com; spf=pass smtp.mailfrom=bp.renesas.com; arc=none smtp.client-ip=210.160.252.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bp.renesas.com
X-IronPort-AV: E=Sophos;i="6.07,123,1708354800"; 
   d="scan'208";a="197598997"
Received: from unknown (HELO relmlir6.idc.renesas.com) ([10.200.68.152])
  by relmlie5.idc.renesas.com with ESMTP; 14 Mar 2024 03:16:08 +0900
Received: from localhost.localdomain (unknown [10.226.92.104])
	by relmlir6.idc.renesas.com (Postfix) with ESMTP id EA0294045877;
	Thu, 14 Mar 2024 03:16:04 +0900 (JST)
From: Biju Das <biju.das.jz@bp.renesas.com>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Conor Dooley <conor+dt@kernel.org>
Cc: Biju Das <biju.das.jz@bp.renesas.com>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Magnus Damm <magnus.damm@gmail.com>,
	Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>,
	linux-usb@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org,
	Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>,
	Biju Das <biju.das.au@gmail.com>
Subject: [PATCH v2 0/5] Fix USB pipe configuration for RZ/G2L
Date: Wed, 13 Mar 2024 18:15:57 +0000
Message-Id: <20240313181602.156840-1-biju.das.jz@bp.renesas.com>
X-Mailer: git-send-email 2.25.1
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The USBHS IP found on RZ/G2L SoCs only has 10 pipe buffers compared
to 16 pipe buffers on RZ/A2M. Document renesas,rzg2l-usbhs family
compatible to handle this difference for RZ/G2L family SoCs.

This patch series aims to fix the USB pipe configuration for RZ/G2L
family SoCs.

For the backward compatibility SoC specific compatible is used
and will be removed the same after few kernel releases.

v1->v2:
 * Added Ack from Krzysztof Kozlowski for patch#1.
 * Added patch#2 for simplify obtaining device data.
 * Dropped using of_device_is_compatible() in probe.
 * Added usbhs_rzg2l_plat_info and replaced the device data for RZ/G2L
   from usbhs_rza2_plat_info->usbhs_rzg2l_plat_info.
 * Moved usbhsc_rzg2l_pipe table near to the user.
 * Updated commit description in patch#3
 * Added Rb tag from Geert for patch#4.
 * Updated commit description about ABI breakage in patch#5.
 * Updated commit header in patch#5 as it is RZ/G2L specific.

Biju Das (4):
  dt-bindings: usb: renesas,usbhs: Document RZ/G2L family compatible
  usb: renesas_usbhs: Simplify obtaining device data
  usb: renesas_usbhs: Remove trailing comma in the terminator entry for
    OF table
  arm64: dts: renesas: r9a07g0{43,44,54}: Update RZ/G2L family
    compatible

Huy Nguyen (1):
  usb: renesas_usbhs: Update usbhs pipe configuration for RZ/G2L family

 .../bindings/usb/renesas,usbhs.yaml           |  6 ++-
 arch/arm64/boot/dts/renesas/r9a07g043.dtsi    |  2 +-
 arch/arm64/boot/dts/renesas/r9a07g044.dtsi    |  2 +-
 arch/arm64/boot/dts/renesas/r9a07g054.dtsi    |  2 +-
 drivers/usb/renesas_usbhs/common.c            | 40 +++++++++++++------
 drivers/usb/renesas_usbhs/rza.h               |  1 +
 drivers/usb/renesas_usbhs/rza2.c              | 30 ++++++++++++++
 7 files changed, 67 insertions(+), 16 deletions(-)

-- 
2.25.1


