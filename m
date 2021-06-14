Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id CA2013A6E51
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 14 Jun 2021 20:43:49 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233558AbhFNSpv (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Mon, 14 Jun 2021 14:45:51 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55978 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232992AbhFNSpv (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 14 Jun 2021 14:45:51 -0400
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8BCD9C061574;
        Mon, 14 Jun 2021 11:43:48 -0700 (PDT)
Received: from pendragon.ideasonboard.com (62-78-145-57.bb.dnainternet.fi [62.78.145.57])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 1BCAC8C4;
        Mon, 14 Jun 2021 20:43:47 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1623696227;
        bh=N5hzIew0byxdvMV5YdDSE4MtAEkjm9YI5Z1aBB/TiGE=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=NPSGaH87VDLMznPzriHhRYynKv3ENnQoVVWydR2gGbK8jVHgrhi79qrtoInaH8MAX
         kLT0nrfSnzKjmDM4L4aHo7POlZkHp8Jzmvvd6zRP5Y1IA9gkjmjQH28m0eabllUD8T
         PhOlA96X3dIqK2mI7167zR1wdP8EHcKhVtkPAO44=
Date:   Mon, 14 Jun 2021 21:43:27 +0300
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     Geert Uytterhoeven <geert+renesas@glider.be>
Cc:     Magnus Damm <magnus.damm@gmail.com>,
        Rob Herring <robh+dt@kernel.org>,
        linux-renesas-soc@vger.kernel.org, devicetree@vger.kernel.org
Subject: Re: [PATCH 05/14] arm64: dts: renesas: Add Renesas R8A779M1 SoC
 support
Message-ID: <YMejT7rXT8fp/rR1@pendragon.ideasonboard.com>
References: <cover.1623315732.git.geert+renesas@glider.be>
 <96a1cfd2e8d86e10364fa330c6053b5136e82939.1623315732.git.geert+renesas@glider.be>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <96a1cfd2e8d86e10364fa330c6053b5136e82939.1623315732.git.geert+renesas@glider.be>
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi Geert,

Thank you for the patch.

On Thu, Jun 10, 2021 at 11:37:18AM +0200, Geert Uytterhoeven wrote:
> Add support for the Renesas R-Car H3e-2G (R8A779M1) SoC, which is a
> different grading of the R-Car H3 ES3.0 (R8A77951) SoC.
> 
> Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
> ---
>  arch/arm64/boot/dts/renesas/r8a779m1.dtsi | 12 ++++++++++++
>  1 file changed, 12 insertions(+)
>  create mode 100644 arch/arm64/boot/dts/renesas/r8a779m1.dtsi
> 
> diff --git a/arch/arm64/boot/dts/renesas/r8a779m1.dtsi b/arch/arm64/boot/dts/renesas/r8a779m1.dtsi
> new file mode 100644
> index 0000000000000000..0e9b04469b83c661
> --- /dev/null
> +++ b/arch/arm64/boot/dts/renesas/r8a779m1.dtsi
> @@ -0,0 +1,12 @@
> +// SPDX-License-Identifier: (GPL-2.0 or MIT)
> +/*
> + * Device Tree Source for the R-Car H3e-2G (R8A779M1) SoC
> + *
> + * Copyright (C) 2021 Glider bv
> + */
> +
> +#include "r8a77951.dtsi"
> +
> +/ {
> +	compatible = "renesas,r8a779m1", "renesas,r8a7795";

As commented in a separate patch this will be overridden by the .dts
that includes this file, so we could drop it altogether. I don't care
much though.

Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>

The same applies to 06/14.

> +};

-- 
Regards,

Laurent Pinchart
