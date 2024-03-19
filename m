Return-Path: <linux-renesas-soc+bounces-3883-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 3966987FC35
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 19 Mar 2024 11:54:19 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 6B0DE1C221E8
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 19 Mar 2024 10:54:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 82B8857889;
	Tue, 19 Mar 2024 10:54:13 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from relmlie6.idc.renesas.com (relmlor2.renesas.com [210.160.252.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 586CF2A8D7;
	Tue, 19 Mar 2024 10:54:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=210.160.252.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1710845653; cv=none; b=any4BqAbN6ul4ihV+ElChnopn9pTY+7YFRdxJfJ5bPPn0GYXY5O8RppGfNBRh66J8O/Ao6DA1DZtUuhp1BEFq6LHZWHNzust25ALkDHTlG+XsDECDQo3unSLa7wUHv67Rr4penejgoI3DKS9CbCArcgT1QPCR3rbOF9fMQSPfrw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1710845653; c=relaxed/simple;
	bh=ZS5nhtTtRPjj1W3fF3ceyO7tg6di5jiVNSnWrHN7yLg=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=sIeQ5Ln6P5UzSCOiCOEv72xM2TMdsMXGDBSWbwteu9WCxVJHKSpqZM6dhp8gs94YHmPC/hqFw/X4wgq2qEUXrMg8Xjehkxes04qwnkZM7t3exPZkxpk7vOAWVb2yFqK2uJ2aj+b9uu6tyeAF7EUbOaRm6nKIT9DgX9irtymXE9s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com; spf=pass smtp.mailfrom=bp.renesas.com; arc=none smtp.client-ip=210.160.252.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bp.renesas.com
X-IronPort-AV: E=Sophos;i="6.07,136,1708354800"; 
   d="scan'208";a="202296486"
Received: from unknown (HELO relmlir5.idc.renesas.com) ([10.200.68.151])
  by relmlie6.idc.renesas.com with ESMTP; 19 Mar 2024 19:54:02 +0900
Received: from localhost.localdomain (unknown [10.226.92.214])
	by relmlir5.idc.renesas.com (Postfix) with ESMTP id 08CAF4006DFB;
	Tue, 19 Mar 2024 19:53:58 +0900 (JST)
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
Subject: [PATCH v5 0/6] Fix USB pipe configuration for RZ/G2L
Date: Tue, 19 Mar 2024 10:53:50 +0000
Message-Id: <20240319105356.87287-1-biju.das.jz@bp.renesas.com>
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

v4->v5:
 * Restored the else path for has_new_pipe_configs check in usbhs_probe().
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
 drivers/usb/renesas_usbhs/common.c            | 41 ++++++++++++-------
 drivers/usb/renesas_usbhs/rza.h               |  1 +
 drivers/usb/renesas_usbhs/rza2.c              | 13 ++++++
 7 files changed, 48 insertions(+), 19 deletions(-)

-- 
2.25.1


