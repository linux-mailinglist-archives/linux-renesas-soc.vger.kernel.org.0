Return-Path: <linux-renesas-soc+bounces-3862-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id EEC9487EEEE
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 18 Mar 2024 18:35:55 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 8E2A51F2101E
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 18 Mar 2024 17:35:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 383165647A;
	Mon, 18 Mar 2024 17:33:34 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from relmlie5.idc.renesas.com (relmlor1.renesas.com [210.160.252.171])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 15D7C55C04;
	Mon, 18 Mar 2024 17:33:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=210.160.252.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1710783214; cv=none; b=jJvVNcCSBvHME4gZmCV/cmyjEVGzhqvL9FE4n4T/eq9OfFX+Eyru8Vxo9VQQb7Ap6f50yJgmmLppb/ghtp04VB9BFQtYD7UNY4fy9bhZKuVjnSPKZfVpT2QTXZ7/N9NgFSaqJFPb/OXrgv1JEh1m6ZrAkiTFwZTqLNAogwlKyBE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1710783214; c=relaxed/simple;
	bh=pkhKpxpft/xtkFnEhD1ehUAl7sy49h8RDYhhWIDUOs8=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=GzxHcfoqmtrXfgJEUahI/9IBWPGSky/EDo768rMq/SXMh4k3/JCwPO73a1BKxZvbSF+jgb/E33TMR2HHde+OTJRNuJcz+oV7wALfn3LygDUrVVr3FPEq9Rszj9pKJdsflgmxtZkX+1AMLAi04qmxsgBCksTaWjHCq8yKcEXiCIA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com; spf=pass smtp.mailfrom=bp.renesas.com; arc=none smtp.client-ip=210.160.252.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bp.renesas.com
X-IronPort-AV: E=Sophos;i="6.07,134,1708354800"; 
   d="scan'208";a="198216079"
Received: from unknown (HELO relmlir6.idc.renesas.com) ([10.200.68.152])
  by relmlie5.idc.renesas.com with ESMTP; 19 Mar 2024 02:33:26 +0900
Received: from localhost.localdomain (unknown [10.226.93.20])
	by relmlir6.idc.renesas.com (Postfix) with ESMTP id 8D30040359E5;
	Tue, 19 Mar 2024 02:33:22 +0900 (JST)
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
Subject: [PATCH v4 0/6] Fix USB pipe configuration for RZ/G2L
Date: Mon, 18 Mar 2024 17:33:13 +0000
Message-Id: <20240318173319.201799-1-biju.das.jz@bp.renesas.com>
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

As the DTS update has a hard dependency on the driver fix, Got ack
from Geert for patch#6 to apply the DTS update together with the driver
fix.

v3->v4:
 * Added Rbtag from Geert for patch#3.
 * Dropped patch#4
 * Credit  Huy Nguyen's work in the commit message for patch#4 and dropped
   his name from Signed-off-by tag.
 * Selection of usbhsc_rzg2l_default_pipe[] by setting the variable
   has_new_pipe_configs to zero.
 * Updated commit description for patch#4.
 * Dropped the check 'priv->dparam.pipe_configs' as it is same as
   checking !has_new_pipe_configs.
v2->v3:
 * Added Rb tag from Geert for patch#1,#2 and #7
 * Added Ack tag from Geert for patch#7.
 * Added patch#3 for improving usbhsc_default_pipe[] for isochronous
   transfers
 * Added patch#4 for dropping has_new_pipe_configs from struct
   renesas_usbhs_driver_param
 * Updated commit description for patch#5
 * Dropped usbhsc_rzg2l_pipe[] and reusing the default_pipe[].
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

Biju Das (6):
  dt-bindings: usb: renesas,usbhs: Document RZ/G2L family compatible
  usb: renesas_usbhs: Simplify obtaining device data
  usb: renesas_usbhs: Improve usbhsc_default_pipe[] for isochronous
    transfers
  usb: renesas_usbhs: Update usbhs pipe configuration for RZ/G2L family
  usb: renesas_usbhs: Remove trailing comma in the terminator entry for
    OF table
  arm64: dts: renesas: r9a07g0{43,44,54}: Update RZ/G2L family
    compatible

 .../bindings/usb/renesas,usbhs.yaml           |  6 ++-
 arch/arm64/boot/dts/renesas/r9a07g043.dtsi    |  2 +-
 arch/arm64/boot/dts/renesas/r9a07g044.dtsi    |  2 +-
 arch/arm64/boot/dts/renesas/r9a07g054.dtsi    |  2 +-
 drivers/usb/renesas_usbhs/common.c            | 43 ++++++++++++-------
 drivers/usb/renesas_usbhs/rza.h               |  1 +
 drivers/usb/renesas_usbhs/rza2.c              | 13 ++++++
 7 files changed, 49 insertions(+), 20 deletions(-)

-- 
2.25.1


