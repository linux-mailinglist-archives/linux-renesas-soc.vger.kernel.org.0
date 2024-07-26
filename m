Return-Path: <linux-renesas-soc+bounces-7546-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 2111193D3BE
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 26 Jul 2024 15:09:47 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id CF0EB283247
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 26 Jul 2024 13:09:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D787742070;
	Fri, 26 Jul 2024 13:09:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="aoUrbR2o"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B37C723A8
	for <linux-renesas-soc@vger.kernel.org>; Fri, 26 Jul 2024 13:09:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1721999383; cv=none; b=mp0KIu5A8smxSkOm831EgQkfRXz9liNa13qmOoeHIwJ5zort5XMEtuVjrdazPdNYdege5hSAu9PQ01yUZ0Gat8izdydUDCBvKoHFNJ/oaSCuPH0KnQeLONacm+9PgoYcw/An6oKP3lF+bB1JUMzDtNJamR5RBqvLrUUBzcvsVd4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1721999383; c=relaxed/simple;
	bh=6zB3xALpd+65f/7QUrTrxeBQ9KTEQEZESLucIZ3B/bA=;
	h=Date:Content-Type:MIME-Version:From:To:Cc:In-Reply-To:References:
	 Message-Id:Subject; b=Rw/ux1f09sUAoIJZEaa5b0MuEDADUvV827pAbYc7s2idYC0jW+Z57RlB2M++havZk5Kk1UYy72FrFYGEzw71/kcQEdWR4zqiQCPH7WDLObx8ar4L6MGDKwA+oQ523z7MirXk6lj2fW34Uhy8Q0DN5m5q7vJuwSDNRoEFKfHWN9o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=aoUrbR2o; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 13F9AC32782;
	Fri, 26 Jul 2024 13:09:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1721999383;
	bh=6zB3xALpd+65f/7QUrTrxeBQ9KTEQEZESLucIZ3B/bA=;
	h=Date:From:To:Cc:In-Reply-To:References:Subject:From;
	b=aoUrbR2oBkVOF/FGFwRdXHrtjxBtlOOk/V+9oCEgyGazAcES/tii3qx5KZTcI/WqR
	 p4dMdHBo83ufCpbesNxJk72U0JMsZzIPNm8BkD+vSoKfV0KhQPLGN79ACYx6+lUJky
	 2jr9shSP/8jSfaVprVOqkoAJVZtKKxChiJ1Ue2XmHAewzt0NEO8KlfrRjQZlEYnbeP
	 AHCKXnzyw37qC+psvPS2/1u1IeLUvROC5+1Tksa9Op+v4E8vMvEP+pOJ9Qt67OiRIW
	 wEeXNJ6chX09rzYp3wceHvlXmt8Y8tqW9TVzU946d3BAR44oID7OMmW9XnwEG9IPqf
	 Mx8H5wtdPuQHA==
Date: Fri, 26 Jul 2024 08:09:41 -0500
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Wolfram Sang <wsa+renesas@sang-engineering.com>
Cc: linux-renesas-soc@vger.kernel.org, 
 Geert Uytterhoeven <geert+renesas@glider.be>
In-Reply-To: <20240725194906.14644-8-wsa+renesas@sang-engineering.com>
References: <20240725194906.14644-8-wsa+renesas@sang-engineering.com>
Message-Id: <172199921274.1507144.4419581037256552879.robh@kernel.org>
Subject: Re: [PATCH RFT 0/6] PWM & TPU patches for V4M


On Thu, 25 Jul 2024 21:49:07 +0200, Wolfram Sang wrote:
> Here are the patches I prepared to enable PWM and TPU on the R-Car V4M
> SoC. Only patches 1-4 are for upstream, the rest are convenience patches
> for testers. They are based on linus-git as of today.
> 
> As discussed privately, Geert wants to have a try testing these. I
> cannot because testing needs physical access to HW which I don't have.
> Thanks, Geert!
> 
> 
> Cong Dang (2):
>   clk: renesas: r8a779h0: Add PWM clock
>   clk: renesas: r8a779h0: Add TPU clock
> 
> Khanh Le (1):
>   arm64: dts: renesas: r8a779h0: Add PWM device node
> 
> Wolfram Sang (3):
>   arm64: dts: renesas: r8a779h0: Add TPU device node
>   arm64: dts: r8a779h0-gray-hawk-single: Add PWM support
>   arm64: dts: r8a779h0-gray-hawk-single: Add TPU support
> 
>  .../dts/renesas/r8a779h0-gray-hawk-single.dts | 36 +++++++++++
>  arch/arm64/boot/dts/renesas/r8a779h0.dtsi     | 61 +++++++++++++++++++
>  drivers/clk/renesas/r8a779h0-cpg-mssr.c       |  2 +
>  3 files changed, 99 insertions(+)
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


New warnings running 'make CHECK_DTBS=y renesas/r8a779h0-gray-hawk-single.dtb' for 20240725194906.14644-8-wsa+renesas@sang-engineering.com:

arch/arm64/boot/dts/renesas/r8a779h0-gray-hawk-single.dtb: pwm@e6e30000: compatible:0: 'renesas,pwm-r8a779h0' is not one of ['renesas,pwm-r8a7742', 'renesas,pwm-r8a7743', 'renesas,pwm-r8a7744', 'renesas,pwm-r8a7745', 'renesas,pwm-r8a77470', 'renesas,pwm-r8a774a1', 'renesas,pwm-r8a774b1', 'renesas,pwm-r8a774c0', 'renesas,pwm-r8a774e1', 'renesas,pwm-r8a7778', 'renesas,pwm-r8a7779', 'renesas,pwm-r8a7790', 'renesas,pwm-r8a7791', 'renesas,pwm-r8a7794', 'renesas,pwm-r8a7795', 'renesas,pwm-r8a7796', 'renesas,pwm-r8a77961', 'renesas,pwm-r8a77965', 'renesas,pwm-r8a77970', 'renesas,pwm-r8a77980', 'renesas,pwm-r8a77990', 'renesas,pwm-r8a77995', 'renesas,pwm-r8a779a0', 'renesas,pwm-r8a779g0']
	from schema $id: http://devicetree.org/schemas/pwm/renesas,pwm-rcar.yaml#
arch/arm64/boot/dts/renesas/r8a779h0-gray-hawk-single.dtb: pwm@e6e31000: compatible:0: 'renesas,pwm-r8a779h0' is not one of ['renesas,pwm-r8a7742', 'renesas,pwm-r8a7743', 'renesas,pwm-r8a7744', 'renesas,pwm-r8a7745', 'renesas,pwm-r8a77470', 'renesas,pwm-r8a774a1', 'renesas,pwm-r8a774b1', 'renesas,pwm-r8a774c0', 'renesas,pwm-r8a774e1', 'renesas,pwm-r8a7778', 'renesas,pwm-r8a7779', 'renesas,pwm-r8a7790', 'renesas,pwm-r8a7791', 'renesas,pwm-r8a7794', 'renesas,pwm-r8a7795', 'renesas,pwm-r8a7796', 'renesas,pwm-r8a77961', 'renesas,pwm-r8a77965', 'renesas,pwm-r8a77970', 'renesas,pwm-r8a77980', 'renesas,pwm-r8a77990', 'renesas,pwm-r8a77995', 'renesas,pwm-r8a779a0', 'renesas,pwm-r8a779g0']
	from schema $id: http://devicetree.org/schemas/pwm/renesas,pwm-rcar.yaml#
arch/arm64/boot/dts/renesas/r8a779h0-gray-hawk-single.dtb: pwm@e6e32000: compatible:0: 'renesas,pwm-r8a779h0' is not one of ['renesas,pwm-r8a7742', 'renesas,pwm-r8a7743', 'renesas,pwm-r8a7744', 'renesas,pwm-r8a7745', 'renesas,pwm-r8a77470', 'renesas,pwm-r8a774a1', 'renesas,pwm-r8a774b1', 'renesas,pwm-r8a774c0', 'renesas,pwm-r8a774e1', 'renesas,pwm-r8a7778', 'renesas,pwm-r8a7779', 'renesas,pwm-r8a7790', 'renesas,pwm-r8a7791', 'renesas,pwm-r8a7794', 'renesas,pwm-r8a7795', 'renesas,pwm-r8a7796', 'renesas,pwm-r8a77961', 'renesas,pwm-r8a77965', 'renesas,pwm-r8a77970', 'renesas,pwm-r8a77980', 'renesas,pwm-r8a77990', 'renesas,pwm-r8a77995', 'renesas,pwm-r8a779a0', 'renesas,pwm-r8a779g0']
	from schema $id: http://devicetree.org/schemas/pwm/renesas,pwm-rcar.yaml#
arch/arm64/boot/dts/renesas/r8a779h0-gray-hawk-single.dtb: pwm@e6e33000: compatible:0: 'renesas,pwm-r8a779h0' is not one of ['renesas,pwm-r8a7742', 'renesas,pwm-r8a7743', 'renesas,pwm-r8a7744', 'renesas,pwm-r8a7745', 'renesas,pwm-r8a77470', 'renesas,pwm-r8a774a1', 'renesas,pwm-r8a774b1', 'renesas,pwm-r8a774c0', 'renesas,pwm-r8a774e1', 'renesas,pwm-r8a7778', 'renesas,pwm-r8a7779', 'renesas,pwm-r8a7790', 'renesas,pwm-r8a7791', 'renesas,pwm-r8a7794', 'renesas,pwm-r8a7795', 'renesas,pwm-r8a7796', 'renesas,pwm-r8a77961', 'renesas,pwm-r8a77965', 'renesas,pwm-r8a77970', 'renesas,pwm-r8a77980', 'renesas,pwm-r8a77990', 'renesas,pwm-r8a77995', 'renesas,pwm-r8a779a0', 'renesas,pwm-r8a779g0']
	from schema $id: http://devicetree.org/schemas/pwm/renesas,pwm-rcar.yaml#
arch/arm64/boot/dts/renesas/r8a779h0-gray-hawk-single.dtb: pwm@e6e34000: compatible:0: 'renesas,pwm-r8a779h0' is not one of ['renesas,pwm-r8a7742', 'renesas,pwm-r8a7743', 'renesas,pwm-r8a7744', 'renesas,pwm-r8a7745', 'renesas,pwm-r8a77470', 'renesas,pwm-r8a774a1', 'renesas,pwm-r8a774b1', 'renesas,pwm-r8a774c0', 'renesas,pwm-r8a774e1', 'renesas,pwm-r8a7778', 'renesas,pwm-r8a7779', 'renesas,pwm-r8a7790', 'renesas,pwm-r8a7791', 'renesas,pwm-r8a7794', 'renesas,pwm-r8a7795', 'renesas,pwm-r8a7796', 'renesas,pwm-r8a77961', 'renesas,pwm-r8a77965', 'renesas,pwm-r8a77970', 'renesas,pwm-r8a77980', 'renesas,pwm-r8a77990', 'renesas,pwm-r8a77995', 'renesas,pwm-r8a779a0', 'renesas,pwm-r8a779g0']
	from schema $id: http://devicetree.org/schemas/pwm/renesas,pwm-rcar.yaml#
arch/arm64/boot/dts/renesas/r8a779h0-gray-hawk-single.dtb: pwm@e6e80000: compatible:0: 'renesas,tpu-r8a779h0' is not one of ['renesas,tpu-r8a73a4', 'renesas,tpu-r8a7740', 'renesas,tpu-r8a7742', 'renesas,tpu-r8a7743', 'renesas,tpu-r8a7744', 'renesas,tpu-r8a7745', 'renesas,tpu-r8a7790', 'renesas,tpu-r8a7791', 'renesas,tpu-r8a7792', 'renesas,tpu-r8a7793', 'renesas,tpu-r8a7794', 'renesas,tpu-r8a7795', 'renesas,tpu-r8a7796', 'renesas,tpu-r8a77961', 'renesas,tpu-r8a77965', 'renesas,tpu-r8a77970', 'renesas,tpu-r8a77980', 'renesas,tpu-r8a779a0', 'renesas,tpu-r8a779g0']
	from schema $id: http://devicetree.org/schemas/pwm/renesas,tpu-pwm.yaml#






