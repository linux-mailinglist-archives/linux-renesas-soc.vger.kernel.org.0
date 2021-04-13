Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A175635E6AB
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 13 Apr 2021 20:49:15 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S242666AbhDMSte (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Tue, 13 Apr 2021 14:49:34 -0400
Received: from vsp-unauthed02.binero.net ([195.74.38.227]:26238 "EHLO
        vsp-unauthed02.binero.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1347747AbhDMSt3 (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 13 Apr 2021 14:49:29 -0400
X-Halon-ID: e47c9132-9c88-11eb-b966-005056917a89
Authorized-sender: niklas.soderlund@fsdn.se
Received: from bismarck.berto.se (p54ac5521.dip0.t-ipconnect.de [84.172.85.33])
        by bin-vsp-out-01.atm.binero.net (Halon) with ESMTPA
        id e47c9132-9c88-11eb-b966-005056917a89;
        Tue, 13 Apr 2021 20:49:04 +0200 (CEST)
From:   =?UTF-8?q?Niklas=20S=C3=B6derlund?= 
        <niklas.soderlund+renesas@ragnatech.se>
To:     Geert Uytterhoeven <geert+renesas@glider.be>
Cc:     linux-renesas-soc@vger.kernel.org,
        =?UTF-8?q?Niklas=20S=C3=B6derlund?= 
        <niklas.soderlund+renesas@ragnatech.se>
Subject: [PATCH 0/2] arm64: dts: renesas: falcon: Wire up MAX96712
Date:   Tue, 13 Apr 2021 20:48:42 +0200
Message-Id: <20210413184844.2606086-1-niklas.soderlund+renesas@ragnatech.se>
X-Mailer: git-send-email 2.31.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hello Geert,

This series is the final peace of my video capture enablement of the 
V3U. Unfortunately it depends on dt-bindings not yet available upstream 
and [1] the GPIO expanders patch [2] before it can be integrated.

The good news is that with this series, it dependencies and the related 
driver changes [3] I can operate and capture frames at 1080p @ 30fps 
from all 3 MAX96712 on the falcon-csi-dsi board.

A simple test procedure,

	# Configure media graph
	media-ctl -d /dev/media0 -V "'rcar_csi2 feaa0000.csi2':0 [fmt:RGB888_1X24/1920x1080 field:none]"
	media-ctl -d /dev/media0 -V "'rcar_isp fed00000.isp':0 [fmt:RGB888_1X24/1920x1080 field:none]"
	yavta -s 1920x1080 /dev/video0
	v4l2-ctl -v pixelformat=AR24

	# Capture checkerboard pattern
	yavta -c10 --file=frame-#.bin /dev/video0

	# Switch pattern and capture gradients
	yavta --set-control '0x009f0903 1' /dev/v4l-subdev6
	yavta -c10 --file=frame-#.bin /dev/video0

This series is based and tested on the latest available renesas-drivers.  
renesas-drivers-2021-04-13-v5.12-rc7.

1.
[PATCH] media: dt-bindings: media: renesas,csi2: Add r8a779a0 support
[PATCH] media: dt-bindings: media: renesas,isp: Add bindings for ISP Channel Selector
[PATCH] media: dt-bindings: media: renesas,vin: Add r8a779a0 support

2. [PATCH] arm64: dts: renesas: falcon-csi-dsi: Add GPIO extenders

3.
[PATCH] media: staging: max96712: Add basic support for MAX96712 GMSL2 deserializer 
[PATCH] rcar-csi2: Add r8a779a0 support
[PATCH] media: rcar-isp: Add Renesas R-Car Image Signal Processor driver
[PATCH 00/11] rcar-vin: Add r8a779a0 support

Niklas Söderlund (2):
  arm64: dts: renesas: r8a779a0: Add and connect all CSI-2, ISP and VIN
    nodes
  arm64: dts: renesas: falcon-csi-dsi: Add and connect MAX96712

 .../dts/renesas/r8a779a0-falcon-csi-dsi.dtsi  |  229 +++
 arch/arm64/boot/dts/renesas/r8a779a0.dtsi     | 1273 +++++++++++++++++
 2 files changed, 1502 insertions(+)

-- 
2.31.1

