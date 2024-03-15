Return-Path: <linux-renesas-soc+bounces-3812-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 9D52C87D3B8
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 15 Mar 2024 19:39:36 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 633EC28495A
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 15 Mar 2024 18:39:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CF31D11198;
	Fri, 15 Mar 2024 18:39:33 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from relmlie5.idc.renesas.com (relmlor1.renesas.com [210.160.252.171])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8F1A7101C3;
	Fri, 15 Mar 2024 18:39:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=210.160.252.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1710527973; cv=none; b=P+EYTN3Evws+w5t6uVQTvr773Ngbo4bXCA9nHBIsiCvZ+BXsaY/HF4sGZR14T/Pp+MkkpcFUiJ3d6KdzHwxfzj98ownTprANCGq5heriM3CZQVbBkFxIyGPX2gzmPw9y4KwB7q32wGO3TvKHqxjFMe8XtJfcsVWjxXWRPsU4a5g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1710527973; c=relaxed/simple;
	bh=hoh/2+vzwYIx9KsYANVNZjytU3Bo9jAFTSZd0TaBsfE=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=SBUF59EFsq4VXvfTPP+1kr5PUAi9RzWZ4a0CEw5h0HpmTIix6nL5csPP5XVR2br1bkIfYq1S9GiLfHqtBLIlsB5/Ofls8kbk29nf//ddQraX9+QY5pDqN66OU8GvSh3JPEB+d5hAYzP9YpZr9c1TtWP4jE62orpCA7uNTQ9wO98=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com; spf=pass smtp.mailfrom=bp.renesas.com; arc=none smtp.client-ip=210.160.252.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bp.renesas.com
X-IronPort-AV: E=Sophos;i="6.07,129,1708354800"; 
   d="scan'208";a="197917675"
Received: from unknown (HELO relmlir6.idc.renesas.com) ([10.200.68.152])
  by relmlie5.idc.renesas.com with ESMTP; 16 Mar 2024 03:39:29 +0900
Received: from localhost.localdomain (unknown [10.226.93.102])
	by relmlir6.idc.renesas.com (Postfix) with ESMTP id 20ADD4066236;
	Sat, 16 Mar 2024 03:39:24 +0900 (JST)
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
Subject: [PATCH v3 0/7] Fix USB pipe configuration for RZ/G2L
Date: Fri, 15 Mar 2024 18:39:14 +0000
Message-Id: <20240315183921.375751-1-biju.das.jz@bp.renesas.com>
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
from Geert for patch#7 to apply the DTS update together with the driver
fix.

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

Biju Das (7):
  dt-bindings: usb: renesas,usbhs: Document RZ/G2L family compatible
  usb: renesas_usbhs: Simplify obtaining device data
  usb: renesas_usbhs: Improve usbhsc_default_pipe[] for isochronous
    transfers
  usb: renesas_usbhs: Drop has_new_pipe_configs from struct
    renesas_usbhs_driver_param
  usb: renesas_usbhs: Update usbhs pipe configuration for RZ/G2L family
  usb: renesas_usbhs: Remove trailing comma in the terminator entry for
    OF table
  arm64: dts: renesas: r9a07g0{43,44,54}: Update RZ/G2L family
    compatible

 .../bindings/usb/renesas,usbhs.yaml           |  6 +-
 arch/arm64/boot/dts/renesas/r9a07g043.dtsi    |  2 +-
 arch/arm64/boot/dts/renesas/r9a07g044.dtsi    |  2 +-
 arch/arm64/boot/dts/renesas/r9a07g054.dtsi    |  2 +-
 drivers/usb/renesas_usbhs/common.c            | 56 +++++++++++--------
 drivers/usb/renesas_usbhs/common.h            |  3 +
 drivers/usb/renesas_usbhs/rcar2.c             |  3 +-
 drivers/usb/renesas_usbhs/rcar3.c             |  6 +-
 drivers/usb/renesas_usbhs/rza.c               |  3 +-
 drivers/usb/renesas_usbhs/rza.h               |  1 +
 drivers/usb/renesas_usbhs/rza2.c              | 18 +++++-
 include/linux/usb/renesas_usbhs.h             |  1 -
 12 files changed, 70 insertions(+), 33 deletions(-)

-- 
2.25.1


