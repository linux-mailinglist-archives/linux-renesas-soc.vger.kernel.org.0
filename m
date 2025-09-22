Return-Path: <linux-renesas-soc+bounces-22186-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id B7811B92C51
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 22 Sep 2025 21:26:46 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 7C68F1688EC
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 22 Sep 2025 19:26:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5CD1C3148A1;
	Mon, 22 Sep 2025 19:26:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="iHTDm6ki"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3173D26E711;
	Mon, 22 Sep 2025 19:26:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758569202; cv=none; b=cwYgVCBOxyGBoaYuWgmfrgYhiU7MQLDMUL1IgKPza/8yudfE029EK0/aTbrrC83nKB7oe5wtTl7OBKanb4RyqO/G5hUwRY3k/aGM7w2cCbd+qiIGZu45vU4pGhzj80/HVmrqd/1mmcGb7Rx0jt3+vR4PhlbBcMgL6GQFNpXrL9c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758569202; c=relaxed/simple;
	bh=upj4qQnegJPBP6IU+iQ3qZuAwuV5GgFt4jHCz7IbfrY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ANcGYTqRx2c07YBCexx5ooohUsBJu0j/TG5WJPma7E9ICMh2Set9Gq54qu9U49yOZ2KN+I4qk9el/3DgnLm2WHSz1oF4enJRxUxVJ1ogew8Xn/xeX/Rf39jJhCmFEqF6ue4uR3M0g8MyoW5/0zOSdQq6A3xQswnkTv6DivfAO3Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=iHTDm6ki; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 42F50C4CEF0;
	Mon, 22 Sep 2025 19:26:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1758569201;
	bh=upj4qQnegJPBP6IU+iQ3qZuAwuV5GgFt4jHCz7IbfrY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=iHTDm6ki+Znj5QJhMnKNcuMgPKzKrGrNCytmqYIdxYiQMMF/WDyqrgEz38Ij+uia3
	 fghV5oWPj07UsrbXfDwkQggml2gkT8+4qmhtQvhU3B7yogjJNkBfJwMuMzYcfp3xj0
	 X6JTN01vgnXKiFCQONR1XE621SPMITr2OSUJSyXZNxZ9ug7aeR0SpiIlI0quraKqbC
	 9ovf6GwRsYvKLFi4bY6aX7a/6PvuJv03WVeaNXHwLNviPKVoTtnNBhOrozUXE10XeC
	 lJ4WVMWyo9A99IiGX30y1cHH0XG5NQ6/36qz3fZCM/7iMGKI10Dn0o+GxtcW/QPjev
	 sxjhe0G4Q5/zg==
Date: Mon, 22 Sep 2025 14:26:40 -0500
From: Rob Herring <robh@kernel.org>
To: Wolfram Sang <wsa+renesas@sang-engineering.com>
Cc: linux-renesas-soc@vger.kernel.org,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Magnus Damm <magnus.damm@gmail.com>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, devicetree@vger.kernel.org
Subject: Re: [RFC PATCH] ARM: dts: renesas: r9a06g032-rzn1d400-eb: describe
 LEDs
Message-ID: <20250922192640.GA841738-robh@kernel.org>
References: <20250919100740.28429-1-wsa+renesas@sang-engineering.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250919100740.28429-1-wsa+renesas@sang-engineering.com>

On Fri, Sep 19, 2025 at 12:07:20PM +0200, Wolfram Sang wrote:
> To be able to use the LEDs, a configuration switch has to be set to a
> non-default value. So, infrastructure to support these switches (which
> modify signal routing via the CPLD on the demo board (DB)) is added as
> well.
> 
> Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
> ---
> 
> This patch depends on "[PATCH v3 5/8] ARM: dts: r9a06g032: Add GPIO
> controllers" which is still in-flight. I send this out as RFC already,
> so we can discuss the introduction of the switch dependant settings. I
> copied this approach form RZ/G3S.
>  
> 
>  .../renesas/r9a06g032-rzn1d400-db-switches.h  | 22 ++++++++++++++
>  .../dts/renesas/r9a06g032-rzn1d400-db.dts     | 30 +++++++++++++++++++
>  .../dts/renesas/r9a06g032-rzn1d400-eb.dts     | 19 ++++++++++++
>  3 files changed, 71 insertions(+)
>  create mode 100644 arch/arm/boot/dts/renesas/r9a06g032-rzn1d400-db-switches.h
> 
> diff --git a/arch/arm/boot/dts/renesas/r9a06g032-rzn1d400-db-switches.h b/arch/arm/boot/dts/renesas/r9a06g032-rzn1d400-db-switches.h
> new file mode 100644
> index 000000000000..4560d16e7c60
> --- /dev/null
> +++ b/arch/arm/boot/dts/renesas/r9a06g032-rzn1d400-db-switches.h
> @@ -0,0 +1,22 @@
> +/* SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause) */
> +/*
> + * On-board switches for the Renesas RZ/N1D demo board (DB) and extension
> + * board (EB)
> + *
> + * Copyright (C) 2025 Renesas Electronics Corp.
> + */
> +
> +#ifndef __N1D_DB_EB_SWITCHES_H__
> +#define __N1D_DB_EB_SWITCHES_H__
> +
> +#define SW_OFF         0
> +#define SW_ON          1
> +
> +/*
> + * SW_2-2:
> + *     SW_OFF - enable PMOD1-3+LEDs on the extension board
> + *     SW_ON  - enable CAT/S3 (default)
> + */
> +#define SW_2_2 SW_ON
> +
> +#endif
> diff --git a/arch/arm/boot/dts/renesas/r9a06g032-rzn1d400-db.dts b/arch/arm/boot/dts/renesas/r9a06g032-rzn1d400-db.dts
> index 3258b2e27434..849b5ad9c79d 100644
> --- a/arch/arm/boot/dts/renesas/r9a06g032-rzn1d400-db.dts
> +++ b/arch/arm/boot/dts/renesas/r9a06g032-rzn1d400-db.dts
> @@ -15,6 +15,7 @@
>  #include <dt-bindings/pinctrl/rzn1-pinctrl.h>
>  
>  #include "r9a06g032.dtsi"
> +#include "r9a06g032-rzn1d400-db-switches.h"
>  
>  / {
>  	model = "RZN1D-DB Board";
> @@ -185,6 +186,14 @@ fixed-link {
>  	};
>  };
>  
> +#if SW2_2 == SW_OFF

The "rule" for DT headers is #defines for numbers only.

If the switches are s/w readable, then I'd say firmware should read them 
and enable/disable the LEDs as appropriate. If not, then maybe the DT 
should have a property reflecting the switch state and firmware uses 
that to enable/disable.

Rob

