Return-Path: <linux-renesas-soc+bounces-10584-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 110409D2ACA
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 19 Nov 2024 17:24:03 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id CAB57283773
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 19 Nov 2024 16:24:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B4E9D1D04A6;
	Tue, 19 Nov 2024 16:23:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="g6hmRTcs"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7E37B1CF7AE;
	Tue, 19 Nov 2024 16:23:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732033436; cv=none; b=S1H7hiPdAHzzINIyklW+sjjFwul2w/dHXqp9FKwM3JzIUBC6m//aSsf0zDSx6kHs5j8qliyxTTDuK/GPKFZJU31PsZqDTrMqCWhBALex2l5tlcrwnxJK2fsotsmtUtaJbtjks3qfPV/B+2Knjojfoogt/8bUDvJaiZYFsb29aQg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732033436; c=relaxed/simple;
	bh=LSRdOwWVhxFzk1KBx29WAMi60HC/Qo9FvfMm4nhpA9E=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Cc08nKc37h2inneglRG64dAy9nHu/PF9jIkHaAiXm6WDR8tIlBnT6b+FJjlqA5wAazAzdjcH+Me86suVZcU28KfT0GKCw9n3AoJsrjMm/Oolez4OHXl4tcCnD2UmoSybpAtRwVtT9WmuymfHSM7622p/Hs6iuz9JRV3ihg23gmA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=g6hmRTcs; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E1EF4C4CECF;
	Tue, 19 Nov 2024 16:23:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1732033436;
	bh=LSRdOwWVhxFzk1KBx29WAMi60HC/Qo9FvfMm4nhpA9E=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=g6hmRTcsFrfIB7D2y5/mfHljmWKST1y77Hb27hjUnK0eOp7MZaCumycTh8Pq7/he3
	 wtmBk5pO8r79Mv5fNcMqxeZ0Hep+jjNQpNEjOHGvpc52JYPZvCm6eqcmGeKpiiVT76
	 zjbIqXg+vB7AKZOX1XEPG6rrvR1cLqnJbcuEWNFYR5qfvG5mc7NgJYKFmUJBE3mGjK
	 oJdE4daaBrrWceqAW2UHdgqow3ce09w5eAJYRI1lBMjBVBU1bo//zW1qrGh7BUltQQ
	 de5ckQFQai0dicL73v+SUXnpaE1BItxVpaM6qVb54PxJ3g4K0DdT4/dokdh33HvTU4
	 4cEXp2pkWkTXg==
Date: Tue, 19 Nov 2024 10:23:54 -0600
From: Rob Herring <robh@kernel.org>
To: Claudiu <claudiu.beznea@tuxon.dev>
Cc: geert+renesas@glider.be, magnus.damm@gmail.com, krzk+dt@kernel.org,
	conor+dt@kernel.org, mturquette@baylibre.com, sboyd@kernel.org,
	gregkh@linuxfoundation.org, jirislaby@kernel.org,
	p.zabel@pengutronix.de, lethal@linux-sh.org, g.liakhovetski@gmx.de,
	linux-renesas-soc@vger.kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org,
	linux-serial@vger.kernel.org,
	Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
Subject: Re: [PATCH v3 6/8] arm64: dts: renesas: rzg3s-smarc-switches: Add a
 header to describe different switches
Message-ID: <20241119162354.GA1761971-robh@kernel.org>
References: <20241115134401.3893008-1-claudiu.beznea.uj@bp.renesas.com>
 <20241115134401.3893008-7-claudiu.beznea.uj@bp.renesas.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241115134401.3893008-7-claudiu.beznea.uj@bp.renesas.com>

On Fri, Nov 15, 2024 at 03:43:59PM +0200, Claudiu wrote:
> From: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
> 
> There are different switches available on both the RZ/G3S SMARC Module and
> RZ SMARC Carrier II boards. These switches are used to route different SoC
> signals to different parts available on board.
> 
> These switches are described in device trees through macros. These macros
> are set accordingly such that the resulted compiled dtb to describe the
> on-board switches states.
> 
> Based on the SW_CONFIG3 switch state (populated on the module board), the
> SCIF3 SoC interface is routed or not to an U(S)ART pin header available on
> the carrier board. As the SCIF3 is accessible through the carrier board,
> the device tree enables it in the carrier DTS. To be able to cope with
> these type of configurations, add a header file where all the on-board
> switches can be described and shared accordingly between module and carrier
> board.
> 
> Commit prepares the code to enable SCIF3 on the RZ/G3S carrier device
> tree.
> 
> Signed-off-by: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
> ---
> 
> Changes in v3:
> - none
> 
> Changes in v2:
> - none
> 
>  .../boot/dts/renesas/rzg3s-smarc-som.dtsi     | 20 +-----------
>  .../boot/dts/renesas/rzg3s-smarc-switches.h   | 32 +++++++++++++++++++
>  2 files changed, 33 insertions(+), 19 deletions(-)
>  create mode 100644 arch/arm64/boot/dts/renesas/rzg3s-smarc-switches.h
> 
> diff --git a/arch/arm64/boot/dts/renesas/rzg3s-smarc-som.dtsi b/arch/arm64/boot/dts/renesas/rzg3s-smarc-som.dtsi
> index 55c72c8a0735..5c88e130c89e 100644
> --- a/arch/arm64/boot/dts/renesas/rzg3s-smarc-som.dtsi
> +++ b/arch/arm64/boot/dts/renesas/rzg3s-smarc-som.dtsi
> @@ -9,25 +9,7 @@
>  #include <dt-bindings/gpio/gpio.h>
>  #include <dt-bindings/pinctrl/rzg2l-pinctrl.h>
>  
> -/*
> - * On-board switches' states:
> - * @SW_OFF: switch's state is OFF
> - * @SW_ON:  switch's state is ON
> - */
> -#define SW_OFF		0
> -#define SW_ON		1
> -
> -/*
> - * SW_CONFIG[x] switches' states:
> - * @SW_CONFIG2:
> - *	SW_OFF - SD0 is connected to eMMC
> - *	SW_ON  - SD0 is connected to uSD0 card
> - * @SW_CONFIG3:
> - *	SW_OFF - SD2 is connected to SoC
> - *	SW_ON  - SCIF1, SSI0, IRQ0, IRQ1 connected to SoC
> - */
> -#define SW_CONFIG2	SW_OFF
> -#define SW_CONFIG3	SW_ON
> +#include "rzg3s-smarc-switches.h"
>  
>  / {
>  	compatible = "renesas,rzg3s-smarcm", "renesas,r9a08g045s33", "renesas,r9a08g045";
> diff --git a/arch/arm64/boot/dts/renesas/rzg3s-smarc-switches.h b/arch/arm64/boot/dts/renesas/rzg3s-smarc-switches.h
> new file mode 100644
> index 000000000000..e2d9b953f627
> --- /dev/null
> +++ b/arch/arm64/boot/dts/renesas/rzg3s-smarc-switches.h
> @@ -0,0 +1,32 @@
> +/* SPDX-License-Identifier: GPL-2.0 */

Use the same license as the .dtsi file.

> +/*
> + * On-board switches for the Renesas RZ/G3S SMARC Module and RZ SMARC Carrier II
> + * boards.
> + *
> + * Copyright (C) 2024 Renesas Electronics Corp.
> + */
> +
> +#ifndef __RZG3S_SMARC_SWITCHES__
> +#define __RZG3S_SMARC_SWITCHES__
> +
> +/*
> + * On-board switches' states:
> + * @SW_OFF: switch's state is OFF
> + * @SW_ON:  switch's state is ON
> + */
> +#define SW_OFF		0
> +#define SW_ON		1
> +
> +/*
> + * SW_CONFIG[x] switches' states:
> + * @SW_CONFIG2:
> + *	SW_OFF - SD0 is connected to eMMC
> + *	SW_ON  - SD0 is connected to uSD0 card
> + * @SW_CONFIG3:
> + *	SW_OFF - SD2 is connected to SoC
> + *	SW_ON  - SCIF3, SSI3, IRQ0, IRQ1 connected to SoC
> + */
> +#define SW_CONFIG2	SW_OFF
> +#define SW_CONFIG3	SW_ON
> +
> +#endif /* __RZG3S_SMARC_SWITCHES__ */
> -- 
> 2.39.2
> 

