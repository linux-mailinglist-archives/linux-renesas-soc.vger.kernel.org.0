Return-Path: <linux-renesas-soc+bounces-21419-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 0876AB44BA0
	for <lists+linux-renesas-soc@lfdr.de>; Fri,  5 Sep 2025 04:32:52 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id AADE7486CCE
	for <lists+linux-renesas-soc@lfdr.de>; Fri,  5 Sep 2025 02:32:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id ECC6B1E521E;
	Fri,  5 Sep 2025 02:32:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="YvI3YWzj"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B51D93BB44;
	Fri,  5 Sep 2025 02:32:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757039566; cv=none; b=Yh1WeDdmQT4ck17u34g4gFPPS7QoZxadPUFLb5QJAdtFvKhyODucISRFQY9DAxwTRaILxcj+3KbfJbwMOcXVnffMJahrCywpRg54a7eJ6JxZLnVCyXNfrivKc7GW7ISDNHd1u8gv85q+1bsmov1EwLp8p3nEmObtxUAh0chA7KA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757039566; c=relaxed/simple;
	bh=r/GiDLoxoEPeOsRFkLNJjLpOh6aEb7+BENWEot8E3Ts=;
	h=Date:Content-Type:MIME-Version:From:Cc:To:In-Reply-To:References:
	 Message-Id:Subject; b=FLhMVSFdijoGIMLAMEmbQXqZKXLjJHULmXtsYMFJHs+4Wp1tCK2qQ1wNsehIo5dY7q3CfMX94BOopEQJ4VnIFxYVyIbC6DPOgtpDUWLk/6ldphxyOcoo8bxYletgVoZKXMC7py1m1R4qlZm9lPEqvSJDofAheJBB/XbH7qZUWtw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=YvI3YWzj; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1C95FC4CEF0;
	Fri,  5 Sep 2025 02:32:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1757039566;
	bh=r/GiDLoxoEPeOsRFkLNJjLpOh6aEb7+BENWEot8E3Ts=;
	h=Date:From:Cc:To:In-Reply-To:References:Subject:From;
	b=YvI3YWzjMc1vSmCBlfUEyGlY85yBExmoWt6rIAad4CNUd3eb+fNLgc326Yy4W9zMX
	 26VOw4bwOCwyOus+l5MWvp1VoZMiaSTEfw2A/dPEPksAqBFJIdejeLWFRRNl8iaYtg
	 4VxmFDGbTplwGSBtwB2gR9wQt1IWGXPWdm+Xt1Z/+RoUHJ2LNVqWgMgKVG6w23JntX
	 T0+ZZlg/skxehcBbrLvUa1QDGrljffZjIGrWFvmu3hf0s8dsDDR34UsMdw8PDRLR2/
	 PsdNoPnyIfYrlnGxvcy6vAsbd2KPk7ma6eJyrJepKWI15ylrqpNqAkf9GVJK6LOyTu
	 qIbS4QuUMKGkA==
Date: Thu, 04 Sep 2025 21:32:45 -0500
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
From: "Rob Herring (Arm)" <robh@kernel.org>
Cc: devicetree@vger.kernel.org, 
 Wolfram Sang <wsa+renesas@sang-engineering.com>, 
 Geert Uytterhoeven <geert+renesas@glider.be>, 
 Fabrizio Castro <fabrizio.castro.jz@renesas.com>, 
 Magnus Damm <magnus.damm@gmail.com>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, linux-renesas-soc@vger.kernel.org, 
 Conor Dooley <conor+dt@kernel.org>, 
 Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>, 
 Biju Das <biju.das.jz@bp.renesas.com>, linux-kernel@vger.kernel.org
To: Prabhakar <prabhakar.csengg@gmail.com>
In-Reply-To: <20250904165909.281131-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
References: <20250904165909.281131-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
Message-Id: <175703941904.745223.12563008293745270864.robh@kernel.org>
Subject: Re: [PATCH 0/2] Add I3C support to RZ/V2N and RZ/V2H(P) SoCs


On Thu, 04 Sep 2025 17:59:07 +0100, Prabhakar wrote:
> From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> 
> Hi All,
> 
> This series adds I3C node to RZ/V2N and RZ/V2H(P) SoC DTSI files.
> 
> I3C was tested on RZ/V2H(P) and RZ/V2N EVKs using P3T1085UK Arduino
> Shield Evaluation Board [0].
> 
> Disable I2C2 on PMOD connector CN6 and enable I3C.
> 
> Connect EVK TO P3T1085UK Arduino Shield Evaluation Board
> P3T1085UK <-> EVK PMOD CN6
> - J13[1] to CN6[3] (I3C_SCL)
> - J13[2] to CN6[4] (I3C_SDA)
> - J13[4] to CN6[5] (GND)
> - J9[7]  to CN6[11] (GND)
> - J9[9]  to CN6[6] (3.3V)
> 
> On P3T1085UK,
> - JP2 pin1 to pin2 (I3C_SDA)
> - JP3 pin1 to pin2 (I3C_SCL)
> - JP1 pin2 to pin3 (VDD 3V3)
> 
> 
> [0] https://www.nxp.com/design/design-center/development-boards-and-designs/analog-toolbox/arduino-shields-solutions/p3t1085uk-arduino-shield-evaluation-board:P3T1085UK-ARD
> 
> Test Logs:
> --- RZ/V2H(P) ---
> root@rzv2h-evk:~# cat /sys/kernel/debug/clk/clk_summary | grep i3c
>           i3c_0_pclk     1       2        0   100000000   0   0     50000      Y    12400000.i3c     pclk
>           i3c_0_pclkrw   1       2        0   100000000   0   0     50000      Y    12400000.i3c     pclkrw
>           i3c_0_tclk     1       2        0   200000000   0   0     50000      Y    12400000.i3c     tclk
> root@rzv2h-evk:~#
> root@rzv2h-evk:~# cat /sys/class/hwmon/*/temp1_input
> 26687
> 26812
> root@rzv2h-evk:~# cat /proc/interrupts | grep i3c
> 150:         38          0          0          0    GICv3 709 Edge      i3c-resp
> 151:          2          0          0          0    GICv3 712 Edge      i3c-rx
> 152:          0          0          0          0    GICv3 713 Edge      i3c-tx
> 153:          0          0          0          0    GICv3 721 Level     i3c-start
> 154:          0          0          0          0    GICv3 722 Level     i3c-stop
> 155:          0          0          0          0    GICv3 724 Level     i3c-tend
> 156:          0          0          0          0    GICv3 725 Level     i3c-nack
> root@rzv2h-evk:~# cat /sys/class/hwmon/*/temp1_input
> 26687
> 26812
> root@rzv2h-evk:~# cat /proc/interrupts | grep i3c
> 150:         42          0          0          0    GICv3 709 Edge      i3c-resp
> 151:          2          0          0          0    GICv3 712 Edge      i3c-rx
> 152:          0          0          0          0    GICv3 713 Edge      i3c-tx
> 153:          0          0          0          0    GICv3 721 Level     i3c-start
> 154:          0          0          0          0    GICv3 722 Level     i3c-stop
> 155:          0          0          0          0    GICv3 724 Level     i3c-tend
> 156:          0          0          0          0    GICv3 725 Level     i3c-nack
> root@rzv2h-evk:~#
> 
> --- RZ/V2N ---
> root@rzv2n-evk:~# cat /sys/kernel/debug/clk/clk_summary | grep i3c
>           i3c_0_pclk     1       2        0   100000000   0    0     50000      Y   12400000.i3c     pclk
>           i3c_0_pclkrw   1       2        0   100000000   0    0     50000      Y   12400000.i3c     pclkrw
>           i3c_0_tclk     1       2        0   200000000   0    0     50000      Y   12400000.i3c     tclk
> root@rzv2n-evk:~# cat /proc/interrupts | grep i3c
>  65:         22          0          0          0    GICv3 709 Edge      i3c-resp
>  66:          2          0          0          0    GICv3 712 Edge      i3c-rx
>  67:          0          0          0          0    GICv3 713 Edge      i3c-tx
>  68:          0          0          0          0    GICv3 721 Level     i3c-start
>  69:          0          0          0          0    GICv3 722 Level     i3c-stop
>  70:          0          0          0          0    GICv3 724 Level     i3c-tend
>  71:          0          0          0          0    GICv3 725 Level     i3c-nack
> root@rzv2n-evk:~# cat /sys/class/hwmon/*/temp1_input
> 27000
> 27125
> root@rzv2n-evk:~# cat /proc/interrupts | grep i3c
>  65:         26          0          0          0    GICv3 709 Edge      i3c-resp
>  66:          2          0          0          0    GICv3 712 Edge      i3c-rx
>  67:          0          0          0          0    GICv3 713 Edge      i3c-tx
>  68:          0          0          0          0    GICv3 721 Level     i3c-start
>  69:          0          0          0          0    GICv3 722 Level     i3c-stop
>  70:          0          0          0          0    GICv3 724 Level     i3c-tend
>  71:          0          0          0          0    GICv3 725 Level     i3c-nack
> root@rzv2n-evk:~#
> 
> Cheers,
> Prabhakar
> 
> Lad Prabhakar (2):
>   arm64: dts: renesas: r9a09g057: Add I3C node
>   arm64: dts: renesas: r9a09g056: Add I3C node
> 
>  arch/arm64/boot/dts/renesas/r9a09g056.dtsi | 33 ++++++++++++++++++++++
>  arch/arm64/boot/dts/renesas/r9a09g057.dtsi | 33 ++++++++++++++++++++++
>  2 files changed, 66 insertions(+)
> 
> --
> 2.51.0
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


This patch series was applied (using b4) to base:
 Base: attempting to guess base-commit...
 Base: failed to guess base

If this is not the correct base, please add 'base-commit' tag
(or use b4 which does this automatically)

New warnings running 'make CHECK_DTBS=y for arch/arm64/boot/dts/renesas/' for 20250904165909.281131-1-prabhakar.mahadev-lad.rj@bp.renesas.com:

arch/arm64/boot/dts/renesas/r9a09g056n48-rzv2n-evk.dtb: i3c@12400000 (renesas,r9a09g056-i3c): compatible:0: 'renesas,r9a09g056-i3c' is not one of ['renesas,r9a08g045-i3c', 'renesas,r9a09g047-i3c']
	from schema $id: http://devicetree.org/schemas/i3c/renesas,i3c.yaml#
arch/arm64/boot/dts/renesas/r9a09g056n48-rzv2n-evk.dtb: i3c@12400000 (renesas,r9a09g056-i3c): compatible: ['renesas,r9a09g056-i3c', 'renesas,r9a09g047-i3c'] is too long
	from schema $id: http://devicetree.org/schemas/i3c/renesas,i3c.yaml#
arch/arm64/boot/dts/renesas/r9a09g057h48-kakip.dtb: i3c@12400000 (renesas,r9a09g057-i3c): compatible:0: 'renesas,r9a09g057-i3c' is not one of ['renesas,r9a08g045-i3c', 'renesas,r9a09g047-i3c']
	from schema $id: http://devicetree.org/schemas/i3c/renesas,i3c.yaml#
arch/arm64/boot/dts/renesas/r9a09g057h48-kakip.dtb: i3c@12400000 (renesas,r9a09g057-i3c): compatible: ['renesas,r9a09g057-i3c', 'renesas,r9a09g047-i3c'] is too long
	from schema $id: http://devicetree.org/schemas/i3c/renesas,i3c.yaml#
arch/arm64/boot/dts/renesas/r9a09g057h44-rzv2h-evk.dtb: i3c@12400000 (renesas,r9a09g057-i3c): compatible:0: 'renesas,r9a09g057-i3c' is not one of ['renesas,r9a08g045-i3c', 'renesas,r9a09g047-i3c']
	from schema $id: http://devicetree.org/schemas/i3c/renesas,i3c.yaml#
arch/arm64/boot/dts/renesas/r9a09g057h44-rzv2h-evk.dtb: i3c@12400000 (renesas,r9a09g057-i3c): compatible: ['renesas,r9a09g057-i3c', 'renesas,r9a09g047-i3c'] is too long
	from schema $id: http://devicetree.org/schemas/i3c/renesas,i3c.yaml#






