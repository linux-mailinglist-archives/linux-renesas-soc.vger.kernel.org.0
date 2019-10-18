Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id E209FDCA22
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 18 Oct 2019 18:00:56 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728923AbfJRQA4 (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Fri, 18 Oct 2019 12:00:56 -0400
Received: from mail.kernel.org ([198.145.29.99]:51692 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726506AbfJRQA4 (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 18 Oct 2019 12:00:56 -0400
Content-Type: text/plain; charset="utf-8"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1571414454;
        bh=E7bHklQWY313M+JJk6Yryt9zH7/CTnEfwG/cAFyofwI=;
        h=Subject:From:Date:To:Cc:From;
        b=Kf/jAVJB2suv50o/3SkQk44GWXtWAX9Dxkd8MY2fFmR8YCfB4wb17Vw5/S6bQxNvC
         4evtH5yAz0/VdOjs9In2BoYfn3HE33kq0QfDjsGCPFttORbzggPhJbHziWZ9bnqXG6
         jOw0YZaazRNqZgcpQZenT9AhwwTuDxZik8jAUCCI=
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Patchwork housekeeping for: linux-renesas-soc
From:   patchwork-bot+linux-renesas-soc@kernel.org
Message-Id: <157141445455.10796.1736283998717091538.git-patchwork-housekeeping@kernel.org>
Date:   Fri, 18 Oct 2019 16:00:54 +0000
To:     linux-renesas-soc@vger.kernel.org
Cc:     konstantin@linuxfoundation.org
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Latest series: [v3] R-Car DU: LVDS dual-link mode support (2019-05-28T14:12:24)
  Superseding: [v2] R-Car DU: LVDS dual-link mode support (2019-05-11T21:06:53):
    [v2,01/10] drm: bridge: Add dual_link field to the drm_bridge_timings structure
    [v2,02/10] dt-bindings: display: bridge: thc63lvd1024: Document dual-link operation
    [v2,03/10] drm: bridge: thc63: Report input bus mode through bridge timings
    [v2,04/10] dt-bindings: display: renesas: lvds: Add renesas,companion property
    [v2,05/10] drm: rcar-du: lvds: Remove LVDS double-enable checks
    [v2,06/10] drm: rcar-du: lvds: Add support for dual-link mode
    [v2,07/10] drm: rcar-du: Skip LVDS1 output on Gen3 when using dual-link LVDS mode
    [v2,09/10,HACK] arm64: dts: renesas: draak: Enable LVDS dual-link operation
    [v2,10/10,HACK] arm64: dts: renesas: ebisu: Enable LVDS dual-link operation

Latest series: [v4] dt-bindings: display: renesas,cmm: Add R-Car CMM documentation (2019-09-06T13:54:28)
  Superseding: [v1] dt-bindings: display: renesas,cmm: Add R-Car CMM documentation (2019-06-06T14:22:00):
    [01/20] dt-bindings: display: renesas,cmm: Add R-Car CMM documentation
    [02/20] dt-bindings: display, renesas,du: Document cmms property
    [03/20] dt-bindings: display, renesas,du: Update 'vsps' in example
    [04/20] clk: renesas: r8a7796: Add CMM clocks
    [05/20] clk: renesas: r8a7795: Add CMM clocks
    [06/20] clk: renesas: r8a77965: Add CMM clocks
    [07/20] clk: renesas: r8a77990: Add CMM clocks
    [08/20] clk: renesas: r8a77995: Add CMM clocks
    [09/20] arm64: dts: renesas: r8a7796: Add CMM units
    [10/20] arm64: dts: renesas: r8a7795: Add CMM units
    [11/20] arm64: dts: renesas: r8a77965: Add CMM units
    [12/20] arm64: dts: renesas: r8a77990: Add CMM units
    [13/20] arm64: dts: renesas: r8a77995: Add CMM units
    [14/20] drm: rcar-du: Add support for CMM
    [15/20] drm: rcar-du: Claim CMM support for Gen3 SoCs
    [16/20] drm: rcar-du: kms: Collect CMM instances
    [17/20] drm: rcar-du: crtc: Enable and disable CMMs
    [18/20] drm: rcar-du: group: Enable DU's CMM extension
    [19/20] drm: rcar-du: crtc: Register GAMMA_LUT properties
    [20/20] drm: rcar-du: kms: Update CMM in atomic commit tail

Latest series: [v6] ARM: mach-shmobile: Don't init CNTVOFF/counter if PSCI is available (2019-05-29T16:05:00)
  Superseding: [v4] ARM: mach-shmobile: Don't init CNTVOFF/counter if PSCI is available (2019-05-14T16:06:52):
    [V4] ARM: mach-shmobile: Don't init CNTVOFF/counter if PSCI is available
  Superseding: [v5] ARM: mach-shmobile: Don't init CNTVOFF/counter if PSCI is available (2019-05-17T09:58:13):
    [V5] ARM: mach-shmobile: Don't init CNTVOFF/counter if PSCI is available

Latest series: [v2] drm: rcar_lvds: Fix dual link mode operations (2019-08-05T16:18:37)
  Superseding: [v1] drm: rcar_lvds: Fix dual link mode operations (2019-07-23T16:57:00):
    drm: rcar_lvds: Fix dual link mode operations

Latest series: [v2] dt-bindings: usb: renease_{usbhs,gen3} Rename bindings documentation files (2019-07-03T08:35:12)
  Superseding: [v1] dt-bindings: usb: renease_{usbhs,gen3} Rename bindings documentation files (2019-06-17T09:06:01):
    [1/2] dt-bindings: usb: renesas_usbhs: Rename bindings documentation file
    [2/2] dt-bindings: usb: renesas_gen3: Rename bindings documentation file

Latest series: [v2] ARM: dts: r8a779x: Configure PMIC IRQ pinmux (2019-05-15T08:23:26)
  Superseding: [v1] ARM: dts: r8a779x: Configure PMIC IRQ pinmux (2019-05-02T14:06:34):
    ARM: dts: r8a779x: Configure PMIC IRQ pinmux

Latest series: [v4] usb: Add host and device support for RZ/A2 (2019-05-15T15:20:43)
  Superseding: [v3] usb: Add host and device support for RZ/A2 (2019-05-14T14:55:54):
    [v3,01/15] ARM: dts: r7s9210: Add USB clock
    [v3,02/15] ARM: dts: rza2mevb: Add 48MHz USB clock

Latest series: [v4] dt-bindings: display: renesas: du: Document optional reset properties (2019-10-16T15:12:15)
  Superseding: [v3] dt-bindings: display: renesas: du: Document optional reset properties (2019-06-12T13:57:23):
    [v3] dt-bindings: display: renesas: du: Document optional reset properties

Latest series: [v3] Add dual-LVDS panel support to EK874 (2019-08-28T18:36:34)
  Superseding: [v1] Add dual-LVDS panel support to EK874 (2019-08-02T07:33:57):
    [PATCH/RFC,01/12] dt-bindings: display: renesas: lvds: RZ/G2E needs renesas,companion too
    [PATCH/RFC,02/12] dt-bindings: display: renesas: lvds: Document renesas,swap-data
    [PATCH/RFC,03/12] dt-bindings: panel: lvds: Add dual-link LVDS display support
    [PATCH/RFC,04/12] dt-bindings: display: Add bindings for Advantech IDK-2121WR
    [PATCH/RFC,05/12] drm: rcar-du: lvds: Add data swap support
    [PATCH/RFC,06/12] drm: rcar-du: lvds: Do not look at ports for identifying bridges
    [PATCH/RFC,07/12] drm: rcar-du: lvds: Add support for dual link panels
    [PATCH/RFC,08/12] drm: rcar-du: lvds: Fix bridge_to_rcar_lvds
    [PATCH/RFC,09/12] drm: rcar-du: lvds: Fix companion's mode
    [PATCH/RFC,10/12] arm64: dts: renesas: r8a774c0: Point LVDS0 to its companion LVDS1
    [PATCH/RFC,11/12] arm64: dts: renesas: cat874: Add definition for 12V regulator
  Superseding: [v2] Add dual-LVDS panel support to EK874 (2019-08-15T11:04:24):
    [v2,1/9] dt-bindings: panel: lvds: Add dual-link LVDS display support
    [v2,2/9] dt-bindings: display: Add bindings for Advantech IDK-2121WR
    [v2,3/9] drm: Rename drm_bridge_timings to drm_timings
    [v2,4/9] drm/timings: Add link flags
    [v2,5/9] drm/panel: Add timings field to drm_panel
    [v2,6/9] drm: rcar-du: lvds: Fix companion's mode
    [v2,7/9] drm: rcar-du: lvds: Add dual-LVDS panels support
    [v2,8/9] drm/panel: lvds: Add support for the IDK-2121WR

Latest series: [v1] Add WLAN/BT support (2019-07-05T10:15:17)
  Superseding: [v1] Add WLAN/BT support (2019-05-16T08:59:24):
    [1/2] arm64: dts: renesas: r8a774c0-cat874: Add WLAN support
    [2/2] arm64: dts: renesas: r8a774c0-cat874: Add BT support

Latest series: [v4] dmaengine: rcar-dmac: use of_data and add dma-channel-mask support (2019-10-03T03:58:03)
  Superseding: [v2] dmaengine: rcar-dmac: use of_data and add dma-channel-mask support (2019-09-04T08:24:35):
    [v2,1/3] dmaengine: rcar-dmac: Use of_data values instead of a macro
    [v2,2/3] dmaengine: rcar-dmac: Use devm_platform_ioremap_resource()
    [v2,3/3] dmaengine: rcar-dmac: Add dma-channel-mask property support
  Superseding: [v3] dmaengine: rcar-dmac: use of_data and add dma-channel-mask support (2019-09-09T06:34:48):
    [v3,1/4] dmaengine: rcar-dmac: Fix DMACHCLR handling if iommu is mapped

Latest series: [v3] ravb: implement MTU change while device is up (2019-08-20T19:01:26)
  Superseding: [v2] ravb: implement MTU change while device is up (2019-06-05T15:14:20):
    [v2] ravb: implement MTU change while device is up

Latest series: [v2] dt-bindings: clk: emev2: Rename bindings documentation file (2019-08-21T09:15:16)
  Superseding: [v1] dt-bindings: clk: emev2: Rename bindings documentation file (2019-08-19T13:56:30):
    dt-bindings: clk: emev2: Rename bindings documentation file

Latest series: [v2] v4l: rcar-fcp: Read IP version register at probe time (2019-08-14T14:54:17)
  Superseding: [v1] v4l: rcar-fcp: Read IP version register at probe time (2019-06-08T12:53:31):
    v4l: rcar-fcp: Read IP version register at probe time

Latest series: [v2] dt-bindings: i2c: renesas: Rename bindings documentation files (2019-08-09T21:30:02)
  Superseding: [v1] dt-bindings: i2c: renesas: Rename bindings documentation files (2019-07-24T12:15:56):
    [1/4] dt-bindings: i2c: sh_mobile: Rename bindings documentation file
    [2/4] dt-bindings: i2c: rcar: Rename bindings documentation file
    [3/4] dt-bindings: i2c: riic: Rename bindings documentation file
    [4/4] dt-bindings: i2c: riic: Rename bindings documentation file

Latest series: [v3] tick: broadcast-hrtimer: Fix a race in bc_set_next (2019-09-26T13:51:01)
  Superseding: [v2] tick: broadcast-hrtimer: Fix a race in bc_set_next (2019-09-25T14:20:29):
    [V2,1/1] tick: broadcast-hrtimer: Fix a race in bc_set_next

Latest series: [v2] Add LVDS panel support to HiHope RZ/G2M (2019-08-29T11:38:31)
  Superseding: [v1] Add LVDS panel support to HiHope RZ/G2M (2019-08-29T10:21:45):
    [1/2] dt-bindings: display: Add idk-1110wr binding

Latest series: [v6] drm: rcar-du: Add Color Management Module (CMM) (2019-10-16T08:55:40)
  Superseding: [v3] drm: rcar-du: Add Color Management Module (CMM) (2019-08-25T13:51:40):
    [v3,01/14] dt-bindings: display: renesas,cmm: Add R-Car CMM documentation
    [v3,02/14] dt-bindings: display, renesas,du: Document cmms property
    [v3,03/14] arm64: dts: renesas: r8a7796: Add CMM units
    [v3,04/14] arm64: dts: renesas: r8a7795: Add CMM units
    [v3,05/14] arm64: dts: renesas: r8a77965: Add CMM units
    [v3,06/14] arm64: dts: renesas: r8a77990: Add CMM units
    [v3,07/14] arm64: dts: renesas: r8a77995: Add CMM units
    [v3,08/14] drm: rcar-du: Add support for CMM
    [v3,09/14] drm: rcar-du: Claim CMM support for Gen3 SoCs
    [v3,10/14] drm: rcar-du: kms: Collect CMM instances
    [v3,11/14] drm: rcar-du: crtc: Enable and disable CMMs
    [v3,12/14] drm: rcar-du: crtc: Register GAMMA_LUT properties
    [v3,13/14] drm: rcar-du: kms: Update CMM in atomic commit tail
    [v3,14/14] drm: rcar-du: Force CMM enablement when resuming
  Superseding: [v5] drm: rcar-du: Add Color Management Module (CMM) (2019-10-15T10:46:13):
    [v5,1/8] dt-bindings: display: renesas,cmm: Add R-Car CMM documentation
    [v5,2/8] dt-bindings: display, renesas,du: Document cmms property
    [v5,3/8] drm: rcar-du: Add support for CMM
    [v5,4/8] drm: rcar-du: kms: Initialize CMM instances
    [v5,5/8] drm: rcar-du: crtc: Control CMM operations
    [v5,6/8] drm: rcar-du: crtc: Register GAMMA_LUT properties
    [v5,8/8] drm: rcar-du: kms: Expand comment in vsps parsing routine


-- 
Deet-doot-dot, I am a bot.
https://korg.wiki.kernel.org/userdoc/pwbot
