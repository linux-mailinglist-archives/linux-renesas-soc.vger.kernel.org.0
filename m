Return-Path: <linux-renesas-soc+bounces-13746-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 230E6A46E87
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 26 Feb 2025 23:28:18 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 985473B0A64
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 26 Feb 2025 22:27:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A34C925D90A;
	Wed, 26 Feb 2025 22:27:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="nb4KdYqa"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7EB5E25D8E6
	for <linux-renesas-soc@vger.kernel.org>; Wed, 26 Feb 2025 22:27:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740608852; cv=none; b=RCXyWYxMzouPspn12zVxZfjJZg6ktB48M4TIEsqD3Z3ATSHuByhBBCSSHv7Fqj0tu9J0YQ9ixPGUmxD4Vr9/DpmTKHGPBjQlF5jqDmcTd3qxxk5RluZymRHDWCXsytiUAQ5E38YuLnl4qbLeLCjAqYCLUbOPmWpf/RCpnQUYAy0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740608852; c=relaxed/simple;
	bh=lpQ/9amqyj7RiWDKcK283gtw+aX89siGLl4PNy8VLZE=;
	h=Date:Content-Type:MIME-Version:From:Cc:To:In-Reply-To:References:
	 Message-Id:Subject; b=i3FhHhbiuFom/G+sF34hxB448Uen3Hi2fSx8Bkdbe2jjfzR+wpkBlSmCZg9ukWZe9YIGVCWNa5UdKvoZ7r/pFU2BR6qpN3H6xV1Jdeb1ajKPLKNmpBiWe604zm0DM9zOqOHWpbLw9MJtj5XyzQ2xbI/nwc3hTJ1hY/wDNCIkYUo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=nb4KdYqa; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D2374C4CED6;
	Wed, 26 Feb 2025 22:27:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1740608852;
	bh=lpQ/9amqyj7RiWDKcK283gtw+aX89siGLl4PNy8VLZE=;
	h=Date:From:Cc:To:In-Reply-To:References:Subject:From;
	b=nb4KdYqa0HBD1pumWammDVXHa5Ft0gKFt9j7W3Tqz2yozB8w+1rDsXAwRPAMPXs/1
	 ziQrqJ/reeBT4vv17H1Jk6TgIyM/sj7iluIp0Cw+stVpFh9waFXnkoKn4lTW2wF+IY
	 jXP70F0PX6Ql1MTya4qZzs5lnpwAlxrwyCTXoGSpk8smqq8N5Ng19Oc47+U275jvi7
	 IIu9T/uA7qRFgxOGKdgzXiWNo3WPxJJpb+nSiNg+4IwYh2RG/D8k0E4kqLBNjbOrff
	 lCZyfmCOVQ6GfOj+QH96JZZEuDnjXeCeXCD+BkOBYn0vucU3CzsP6vvtn/vqf28O84
	 /EXE6Kqkol3QA==
Date: Wed, 26 Feb 2025 16:27:29 -0600
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
From: "Rob Herring (Arm)" <robh@kernel.org>
Cc: geert@linux-m68k.org, thierry.bultel@linatsea.fr, 
 linux-renesas-soc@vger.kernel.org, paul.barker.ct@bp.renesas.com
To: Thierry Bultel <thierry.bultel.yh@bp.renesas.com>
In-Reply-To: <20250226130935.3029927-1-thierry.bultel.yh@bp.renesas.com>
References: <20250226130935.3029927-1-thierry.bultel.yh@bp.renesas.com>
Message-Id: <174060863352.3856919.17644733024265204774.robh@kernel.org>
Subject: Re: [PATCH v3 00/13] Add initial support for Renesas RZ/T2H SoC


On Wed, 26 Feb 2025 14:09:19 +0100, Thierry Bultel wrote:
> 
> This patchset brings basic support for Renesas RZ/T2H SoC and
> its evaluation board. The 4 CPUs are enabled, only the serial
> console is available and the board must boot on a ramdisk.
> earlycon is supported, though.
> 
> The RZ/T2H serial controller (SCI) is quite different from the
> other RZ SoCs, one of the big differences (but not the only) being
> the 32 bits registers. In order to not modify the existing sh-sci
> driver too much, a new set of 'ops' function pointer is introduced,
> allowing to code the specifics of RZ/T2H in a separate file.
> Termios setting is not supported yet, the default 115200 baudrate
> being kept by default.
> 
> Clock support for RZ/T2H is added to the existing renesas-cpg-mssr
> driver, with some little modifications so that more parameters are
> passed to the device-specific registration callback.
> At this stage, the assumption is made that most of the initialization
> is done earlier by the bootloader. Module clock enable/disable is
> not supported, because quite hard to test when the only available
> peripheral is the serial console, and will come in a future patchset.
> 
> There is an underway discussion on how to group the user selectable
> Renesas SoC option into bigger families, but such a change is out of
> scope for this patchset.
> 
> This patch series is based on master + patch [1]
> 
> [1]: https://lore.kernel.org/all/20250207113313.545432-1-claudiu.beznea.uj@bp.renesas.com/
> 
> Thierry Bultel (13):
>   dt-bindings: soc: Add Renesas RZ/T2H (R9A09G077) SoC
>   dt-bindings: clock: Add cpg for the Renesas RZ/T2H SoC
>   dt-bindings: serial: Add compatible for Renesas RZ/T2H SoC in sci
>   soc: renesas: Add RZ/T2H (R9A09G077) config option
>   clk: renesas: Pass sub struct of cpg_mssr_priv to cpg_clk_register
>   clk: renesas: Add support for R9A09G077 SoC
>   serial: sh-sci: Fix a comment about SCIFA
>   serial: sh-sci: Introduced function pointers
>   serial: sh-sci: Introduced sci_of_data
>   serial: sh-sci: Add support for RZ/T2H SCI
>   arm64: dts: renesas: Add initial support for renesas RZ/T2H SoC
>   arm64: dts: renesas: Add initial support for renesas RZ/T2H eval board
>   arm64: defconfig: Enable Renesas RZ/T2H SoC option
> 
>  .../bindings/clock/renesas,cpg-mssr.yaml      |   4 +-
>  .../bindings/serial/renesas,sci.yaml          |  64 +-
>  .../bindings/soc/renesas/renesas.yaml         |  10 +
>  arch/arm64/boot/dts/renesas/Makefile          |   1 +
>  arch/arm64/boot/dts/renesas/r9a09g077.dtsi    | 129 ++++
>  .../dts/renesas/r9a09g077m44-rzt2h-evk.dts    |  35 +
>  arch/arm64/boot/dts/renesas/r9a09g077m44.dtsi |  13 +
>  arch/arm64/configs/defconfig                  |   2 +
>  drivers/clk/renesas/Kconfig                   |   5 +
>  drivers/clk/renesas/Makefile                  |   1 +
>  drivers/clk/renesas/r7s9210-cpg-mssr.c        |   7 +-
>  drivers/clk/renesas/r8a77970-cpg-mssr.c       |  11 +-
>  drivers/clk/renesas/r9a09g077-cpg-mssr.c      | 237 +++++++
>  drivers/clk/renesas/rcar-gen2-cpg.c           |   5 +-
>  drivers/clk/renesas/rcar-gen2-cpg.h           |   3 +-
>  drivers/clk/renesas/rcar-gen3-cpg.c           |   6 +-
>  drivers/clk/renesas/rcar-gen3-cpg.h           |   6 +-
>  drivers/clk/renesas/rcar-gen4-cpg.c           |   8 +-
>  drivers/clk/renesas/rcar-gen4-cpg.h           |   3 +-
>  drivers/clk/renesas/renesas-cpg-mssr.c        | 153 +++--
>  drivers/clk/renesas/renesas-cpg-mssr.h        |  43 +-
>  drivers/soc/renesas/Kconfig                   |   5 +
>  drivers/tty/serial/Kconfig                    |   7 +
>  drivers/tty/serial/Makefile                   |   1 +
>  drivers/tty/serial/rzsci.c                    | 465 ++++++++++++++
>  drivers/tty/serial/rzsci.h                    |  12 +
>  drivers/tty/serial/sh-sci-common.h            | 171 +++++
>  drivers/tty/serial/sh-sci.c                   | 603 ++++++++++--------
>  drivers/tty/serial/sh-sci.h                   |   2 -
>  .../clock/renesas,r9a09g077-cpg-mssr.h        |  49 ++
>  include/linux/serial_sci.h                    |   3 +-
>  include/uapi/linux/serial_core.h              |   3 +
>  32 files changed, 1713 insertions(+), 354 deletions(-)
>  create mode 100644 arch/arm64/boot/dts/renesas/r9a09g077.dtsi
>  create mode 100644 arch/arm64/boot/dts/renesas/r9a09g077m44-rzt2h-evk.dts
>  create mode 100644 arch/arm64/boot/dts/renesas/r9a09g077m44.dtsi
>  create mode 100644 drivers/clk/renesas/r9a09g077-cpg-mssr.c
>  create mode 100644 drivers/tty/serial/rzsci.c
>  create mode 100644 drivers/tty/serial/rzsci.h
>  create mode 100644 drivers/tty/serial/sh-sci-common.h
>  create mode 100644 include/dt-bindings/clock/renesas,r9a09g077-cpg-mssr.h
> 
> --
> 2.43.0
> 
> 
> 


My bot found new DTB warnings on the .dts files added or changed in this
series.

Some warnings may be from an existing SoC .dtsi. Or perhaps the warnings
are fixed by another series. Ultimately, it is up to the platform
maintainer whether these warnings are acceptable or not. No need to reply
unless the platform maintainer has comments.

If you already ran DT checks and didn't see these error(s), then
make sure dt-schema is up to date:

  pip3 install dtschema --upgrade


New warnings running 'make CHECK_DTBS=y for arch/arm64/boot/dts/renesas/' for 20250226130935.3029927-1-thierry.bultel.yh@bp.renesas.com:

arch/arm64/boot/dts/renesas/r8a77980a-condor-i.dtb: clock-controller@e6150000: reg: [[0, 3860135936, 0, 4096]] is too short
	from schema $id: http://devicetree.org/schemas/clock/renesas,cpg-mssr.yaml#
arch/arm64/boot/dts/renesas/r8a774c0-ek874-idk-2121wr.dtb: clock-controller@e6150000: reg: [[0, 3860135936, 0, 4096]] is too short
	from schema $id: http://devicetree.org/schemas/clock/renesas,cpg-mssr.yaml#
arch/arm64/boot/dts/renesas/r8a77965-ulcb.dtb: clock-controller@e6150000: reg: [[0, 3860135936, 0, 4096]] is too short
	from schema $id: http://devicetree.org/schemas/clock/renesas,cpg-mssr.yaml#
arch/arm64/boot/dts/renesas/r8a779m1-ulcb.dtb: clock-controller@e6150000: reg: [[0, 3860135936, 0, 4096]] is too short
	from schema $id: http://devicetree.org/schemas/clock/renesas,cpg-mssr.yaml#
arch/arm64/boot/dts/renesas/r8a77961-ulcb-kf.dtb: clock-controller@e6150000: reg: [[0, 3860135936, 0, 4096]] is too short
	from schema $id: http://devicetree.org/schemas/clock/renesas,cpg-mssr.yaml#
arch/arm64/boot/dts/renesas/r8a77960-ulcb-kf.dtb: clock-controller@e6150000: reg: [[0, 3860135936, 0, 4096]] is too short
	from schema $id: http://devicetree.org/schemas/clock/renesas,cpg-mssr.yaml#
arch/arm64/boot/dts/renesas/r8a77965-ulcb-kf.dtb: clock-controller@e6150000: reg: [[0, 3860135936, 0, 4096]] is too short
	from schema $id: http://devicetree.org/schemas/clock/renesas,cpg-mssr.yaml#
arch/arm64/boot/dts/renesas/r8a774c0-ek874.dtb: clock-controller@e6150000: reg: [[0, 3860135936, 0, 4096]] is too short
	from schema $id: http://devicetree.org/schemas/clock/renesas,cpg-mssr.yaml#
arch/arm64/boot/dts/renesas/r8a774a1-hihope-rzg2m-rev2.dtb: clock-controller@e6150000: reg: [[0, 3860135936, 0, 2992]] is too short
	from schema $id: http://devicetree.org/schemas/clock/renesas,cpg-mssr.yaml#
arch/arm64/boot/dts/renesas/r8a774b1-hihope-rzg2n-rev2-ex.dtb: clock-controller@e6150000: reg: [[0, 3860135936, 0, 4096]] is too short
	from schema $id: http://devicetree.org/schemas/clock/renesas,cpg-mssr.yaml#
arch/arm64/boot/dts/renesas/r8a779g0-white-hawk.dtb: clock-controller@e6150000: reg: [[0, 3860135936, 0, 16384]] is too short
	from schema $id: http://devicetree.org/schemas/clock/renesas,cpg-mssr.yaml#
arch/arm64/boot/dts/renesas/r8a779g2-white-hawk-single.dtb: clock-controller@e6150000: reg: [[0, 3860135936, 0, 16384]] is too short
	from schema $id: http://devicetree.org/schemas/clock/renesas,cpg-mssr.yaml#
arch/arm64/boot/dts/renesas/r8a774e1-hihope-rzg2h-ex-idk-1110wr.dtb: clock-controller@e6150000: reg: [[0, 3860135936, 0, 4096]] is too short
	from schema $id: http://devicetree.org/schemas/clock/renesas,cpg-mssr.yaml#
arch/arm64/boot/dts/renesas/r8a774c0-ek874-mipi-2.1.dtb: clock-controller@e6150000: reg: [[0, 3860135936, 0, 4096]] is too short
	from schema $id: http://devicetree.org/schemas/clock/renesas,cpg-mssr.yaml#
arch/arm64/boot/dts/renesas/r8a774b1-hihope-rzg2n-rev2-ex-idk-1110wr.dtb: clock-controller@e6150000: reg: [[0, 3860135936, 0, 4096]] is too short
	from schema $id: http://devicetree.org/schemas/clock/renesas,cpg-mssr.yaml#
arch/arm64/boot/dts/renesas/r8a774e1-hihope-rzg2h-ex-mipi-2.1.dtb: clock-controller@e6150000: reg: [[0, 3860135936, 0, 4096]] is too short
	from schema $id: http://devicetree.org/schemas/clock/renesas,cpg-mssr.yaml#
arch/arm64/boot/dts/renesas/r8a77970-eagle.dtb: clock-controller@e6150000: reg: [[0, 3860135936, 0, 4096]] is too short
	from schema $id: http://devicetree.org/schemas/clock/renesas,cpg-mssr.yaml#
arch/arm64/boot/dts/renesas/r8a774a1-hihope-rzg2m-ex-mipi-2.1.dtb: clock-controller@e6150000: reg: [[0, 3860135936, 0, 2992]] is too short
	from schema $id: http://devicetree.org/schemas/clock/renesas,cpg-mssr.yaml#
arch/arm64/boot/dts/renesas/r8a779m5-salvator-xs.dtb: clock-controller@e6150000: reg: [[0, 3860135936, 0, 4096]] is too short
	from schema $id: http://devicetree.org/schemas/clock/renesas,cpg-mssr.yaml#
arch/arm64/boot/dts/renesas/r8a77980-v3hsk.dtb: clock-controller@e6150000: reg: [[0, 3860135936, 0, 4096]] is too short
	from schema $id: http://devicetree.org/schemas/clock/renesas,cpg-mssr.yaml#
arch/arm64/boot/dts/renesas/r8a77951-salvator-xs.dtb: clock-controller@e6150000: reg: [[0, 3860135936, 0, 4096]] is too short
	from schema $id: http://devicetree.org/schemas/clock/renesas,cpg-mssr.yaml#
arch/arm64/boot/dts/renesas/r8a77965-salvator-xs.dtb: clock-controller@e6150000: reg: [[0, 3860135936, 0, 4096]] is too short
	from schema $id: http://devicetree.org/schemas/clock/renesas,cpg-mssr.yaml#
arch/arm64/boot/dts/renesas/r8a779f4-s4sk.dtb: clock-controller@e6150000: reg: [[0, 3860135936, 0, 16384]] is too short
	from schema $id: http://devicetree.org/schemas/clock/renesas,cpg-mssr.yaml#
arch/arm64/boot/dts/renesas/r8a774b1-hihope-rzg2n-ex-mipi-2.1.dtb: clock-controller@e6150000: reg: [[0, 3860135936, 0, 4096]] is too short
	from schema $id: http://devicetree.org/schemas/clock/renesas,cpg-mssr.yaml#
arch/arm64/boot/dts/renesas/r8a774b1-hihope-rzg2n-ex.dtb: clock-controller@e6150000: reg: [[0, 3860135936, 0, 4096]] is too short
	from schema $id: http://devicetree.org/schemas/clock/renesas,cpg-mssr.yaml#
arch/arm64/boot/dts/renesas/r8a774c0-cat874.dtb: clock-controller@e6150000: reg: [[0, 3860135936, 0, 4096]] is too short
	from schema $id: http://devicetree.org/schemas/clock/renesas,cpg-mssr.yaml#
arch/arm64/boot/dts/renesas/r8a77951-ulcb-kf.dtb: clock-controller@e6150000: reg: [[0, 3860135936, 0, 4096]] is too short
	from schema $id: http://devicetree.org/schemas/clock/renesas,cpg-mssr.yaml#
arch/arm64/boot/dts/renesas/r8a77960-ulcb.dtb: clock-controller@e6150000: reg: [[0, 3860135936, 0, 4096]] is too short
	from schema $id: http://devicetree.org/schemas/clock/renesas,cpg-mssr.yaml#
arch/arm64/boot/dts/renesas/r8a779h0-gray-hawk-single.dtb: clock-controller@e6150000: reg: [[0, 3860135936, 0, 16384]] is too short
	from schema $id: http://devicetree.org/schemas/clock/renesas,cpg-mssr.yaml#
arch/arm64/boot/dts/renesas/r8a77951-ulcb.dtb: clock-controller@e6150000: reg: [[0, 3860135936, 0, 4096]] is too short
	from schema $id: http://devicetree.org/schemas/clock/renesas,cpg-mssr.yaml#
arch/arm64/boot/dts/renesas/r8a774a1-hihope-rzg2m-rev2-ex-idk-1110wr.dtb: clock-controller@e6150000: reg: [[0, 3860135936, 0, 2992]] is too short
	from schema $id: http://devicetree.org/schemas/clock/renesas,cpg-mssr.yaml#
arch/arm64/boot/dts/renesas/r8a774b1-hihope-rzg2n-rev2.dtb: clock-controller@e6150000: reg: [[0, 3860135936, 0, 4096]] is too short
	from schema $id: http://devicetree.org/schemas/clock/renesas,cpg-mssr.yaml#
arch/arm64/boot/dts/renesas/r8a77970-v3msk.dtb: clock-controller@e6150000: reg: [[0, 3860135936, 0, 4096]] is too short
	from schema $id: http://devicetree.org/schemas/clock/renesas,cpg-mssr.yaml#
arch/arm64/boot/dts/renesas/r8a779m1-ulcb-kf.dtb: clock-controller@e6150000: reg: [[0, 3860135936, 0, 4096]] is too short
	from schema $id: http://devicetree.org/schemas/clock/renesas,cpg-mssr.yaml#
arch/arm64/boot/dts/renesas/r8a779m1-salvator-xs.dtb: clock-controller@e6150000: reg: [[0, 3860135936, 0, 4096]] is too short
	from schema $id: http://devicetree.org/schemas/clock/renesas,cpg-mssr.yaml#
arch/arm64/boot/dts/renesas/r8a779m3-ulcb-kf.dtb: clock-controller@e6150000: reg: [[0, 3860135936, 0, 4096]] is too short
	from schema $id: http://devicetree.org/schemas/clock/renesas,cpg-mssr.yaml#
arch/arm64/boot/dts/renesas/r8a774e1-beacon-rzg2h-kit.dtb: clock-controller@e6150000: reg: [[0, 3860135936, 0, 4096]] is too short
	from schema $id: http://devicetree.org/schemas/clock/renesas,cpg-mssr.yaml#
arch/arm64/boot/dts/renesas/r8a77961-salvator-xs.dtb: clock-controller@e6150000: reg: [[0, 3860135936, 0, 4096]] is too short
	from schema $id: http://devicetree.org/schemas/clock/renesas,cpg-mssr.yaml#
arch/arm64/boot/dts/renesas/r8a77990-ebisu.dtb: clock-controller@e6150000: reg: [[0, 3860135936, 0, 4096]] is too short
	from schema $id: http://devicetree.org/schemas/clock/renesas,cpg-mssr.yaml#
arch/arm64/boot/dts/renesas/r8a774b1-hihope-rzg2n-ex-idk-1110wr.dtb: clock-controller@e6150000: reg: [[0, 3860135936, 0, 4096]] is too short
	from schema $id: http://devicetree.org/schemas/clock/renesas,cpg-mssr.yaml#
arch/arm64/boot/dts/renesas/r8a77960-salvator-x.dtb: clock-controller@e6150000: reg: [[0, 3860135936, 0, 4096]] is too short
	from schema $id: http://devicetree.org/schemas/clock/renesas,cpg-mssr.yaml#
arch/arm64/boot/dts/renesas/r8a77980-condor.dtb: clock-controller@e6150000: reg: [[0, 3860135936, 0, 4096]] is too short
	from schema $id: http://devicetree.org/schemas/clock/renesas,cpg-mssr.yaml#
arch/arm64/boot/dts/renesas/r8a77960-salvator-xs.dtb: clock-controller@e6150000: reg: [[0, 3860135936, 0, 4096]] is too short
	from schema $id: http://devicetree.org/schemas/clock/renesas,cpg-mssr.yaml#
arch/arm64/boot/dts/renesas/r8a779g3-white-hawk-single.dtb: clock-controller@e6150000: reg: [[0, 3860135936, 0, 16384]] is too short
	from schema $id: http://devicetree.org/schemas/clock/renesas,cpg-mssr.yaml#
arch/arm64/boot/dts/renesas/r8a774e1-hihope-rzg2h-ex.dtb: clock-controller@e6150000: reg: [[0, 3860135936, 0, 4096]] is too short
	from schema $id: http://devicetree.org/schemas/clock/renesas,cpg-mssr.yaml#
arch/arm64/boot/dts/renesas/r8a779a0-falcon.dtb: clock-controller@e6150000: reg: [[0, 3860135936, 0, 16384]] is too short
	from schema $id: http://devicetree.org/schemas/clock/renesas,cpg-mssr.yaml#
arch/arm64/boot/dts/renesas/r8a77965-salvator-x.dtb: clock-controller@e6150000: reg: [[0, 3860135936, 0, 4096]] is too short
	from schema $id: http://devicetree.org/schemas/clock/renesas,cpg-mssr.yaml#
arch/arm64/boot/dts/renesas/r8a779f0-spider.dtb: clock-controller@e6150000: reg: [[0, 3860135936, 0, 16384]] is too short
	from schema $id: http://devicetree.org/schemas/clock/renesas,cpg-mssr.yaml#
arch/arm64/boot/dts/renesas/r8a774e1-hihope-rzg2h.dtb: clock-controller@e6150000: reg: [[0, 3860135936, 0, 4096]] is too short
	from schema $id: http://devicetree.org/schemas/clock/renesas,cpg-mssr.yaml#
arch/arm64/boot/dts/renesas/r8a77951-salvator-x.dtb: clock-controller@e6150000: reg: [[0, 3860135936, 0, 4096]] is too short
	from schema $id: http://devicetree.org/schemas/clock/renesas,cpg-mssr.yaml#
arch/arm64/boot/dts/renesas/r8a774b1-hihope-rzg2n.dtb: clock-controller@e6150000: reg: [[0, 3860135936, 0, 4096]] is too short
	from schema $id: http://devicetree.org/schemas/clock/renesas,cpg-mssr.yaml#
arch/arm64/boot/dts/renesas/r8a77961-ulcb.dtb: clock-controller@e6150000: reg: [[0, 3860135936, 0, 4096]] is too short
	from schema $id: http://devicetree.org/schemas/clock/renesas,cpg-mssr.yaml#
arch/arm64/boot/dts/renesas/r8a774a1-hihope-rzg2m.dtb: clock-controller@e6150000: reg: [[0, 3860135936, 0, 2992]] is too short
	from schema $id: http://devicetree.org/schemas/clock/renesas,cpg-mssr.yaml#
arch/arm64/boot/dts/renesas/r8a77995-draak.dtb: clock-controller@e6150000: reg: [[0, 3860135936, 0, 4096]] is too short
	from schema $id: http://devicetree.org/schemas/clock/renesas,cpg-mssr.yaml#
arch/arm64/boot/dts/renesas/r8a774b1-beacon-rzg2n-kit.dtb: clock-controller@e6150000: reg: [[0, 3860135936, 0, 4096]] is too short
	from schema $id: http://devicetree.org/schemas/clock/renesas,cpg-mssr.yaml#
arch/arm64/boot/dts/renesas/r8a774a1-hihope-rzg2m-ex.dtb: clock-controller@e6150000: reg: [[0, 3860135936, 0, 2992]] is too short
	from schema $id: http://devicetree.org/schemas/clock/renesas,cpg-mssr.yaml#
arch/arm64/boot/dts/renesas/r8a779m3-ulcb.dtb: clock-controller@e6150000: reg: [[0, 3860135936, 0, 4096]] is too short
	from schema $id: http://devicetree.org/schemas/clock/renesas,cpg-mssr.yaml#
arch/arm64/boot/dts/renesas/r8a774a1-hihope-rzg2m-ex-idk-1110wr.dtb: clock-controller@e6150000: reg: [[0, 3860135936, 0, 2992]] is too short
	from schema $id: http://devicetree.org/schemas/clock/renesas,cpg-mssr.yaml#
arch/arm64/boot/dts/renesas/r8a779m3-salvator-xs.dtb: clock-controller@e6150000: reg: [[0, 3860135936, 0, 4096]] is too short
	from schema $id: http://devicetree.org/schemas/clock/renesas,cpg-mssr.yaml#
arch/arm64/boot/dts/renesas/r8a779g0-white-hawk-cpu.dtb: clock-controller@e6150000: reg: [[0, 3860135936, 0, 16384]] is too short
	from schema $id: http://devicetree.org/schemas/clock/renesas,cpg-mssr.yaml#
arch/arm64/boot/dts/renesas/r8a774a1-hihope-rzg2m-rev2-ex.dtb: clock-controller@e6150000: reg: [[0, 3860135936, 0, 2992]] is too short
	from schema $id: http://devicetree.org/schemas/clock/renesas,cpg-mssr.yaml#
arch/arm64/boot/dts/renesas/r8a774a1-beacon-rzg2m-kit.dtb: clock-controller@e6150000: reg: [[0, 3860135936, 0, 2992]] is too short
	from schema $id: http://devicetree.org/schemas/clock/renesas,cpg-mssr.yaml#






