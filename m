Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E2FEC3A6E4C
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 14 Jun 2021 20:42:29 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232992AbhFNSob (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Mon, 14 Jun 2021 14:44:31 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55682 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232802AbhFNSob (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 14 Jun 2021 14:44:31 -0400
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3D6EFC061574;
        Mon, 14 Jun 2021 11:42:28 -0700 (PDT)
Received: from pendragon.ideasonboard.com (62-78-145-57.bb.dnainternet.fi [62.78.145.57])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id A4D688C4;
        Mon, 14 Jun 2021 20:42:26 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1623696146;
        bh=vXTXwgNbNbgps2ZJCiV0CMC/PJNxKBpcZ7uCg/PsuuY=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=YHlHkxkCd7mpBgpG076osvc7AJ2Q03iHgVWG6iiUzhcQ9FB5DYMGpZ1yjXlJNt6fH
         HlBOFfCFUM6hScbb6RugsWMhrgb7SiP3qu1JKTdQqAWDs6WCTX8PaRvt8/cumXGl9N
         lupR0RgpQC/4DVU76b1PECE6ow/iODbV2eNupRYY=
Date:   Mon, 14 Jun 2021 21:42:06 +0300
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     Geert Uytterhoeven <geert+renesas@glider.be>
Cc:     Magnus Damm <magnus.damm@gmail.com>,
        Rob Herring <robh+dt@kernel.org>,
        linux-renesas-soc@vger.kernel.org, devicetree@vger.kernel.org
Subject: Re: [PATCH 04/14] mmc: renesas_sdhi: Add support for R-Car H3e-2G
 and M3e-2G
Message-ID: <YMei/rKwEyicfx+H@pendragon.ideasonboard.com>
References: <cover.1623315732.git.geert+renesas@glider.be>
 <22b4c393bf5074b53791d2797d8fe74deb8ea9a7.1623315732.git.geert+renesas@glider.be>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <22b4c393bf5074b53791d2797d8fe74deb8ea9a7.1623315732.git.geert+renesas@glider.be>
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi Geert,

Thank you for the patch.

On Thu, Jun 10, 2021 at 11:37:17AM +0200, Geert Uytterhoeven wrote:
> Add support for the R-Car H3e-2G (R8A779M1) and M3e-2G (R8A779M3) SoCs.
> These are different gradings of the R-Car H3 ES3.0 (R8A77951) and M3-W+
> (R8A77961) SoCs, and thus subject to the same quirks.
> 
> Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
> ---
>  drivers/mmc/host/renesas_sdhi_core.c | 2 ++
>  1 file changed, 2 insertions(+)
> 
> diff --git a/drivers/mmc/host/renesas_sdhi_core.c b/drivers/mmc/host/renesas_sdhi_core.c
> index b719eda6b8619453..0478c9d58b965392 100644
> --- a/drivers/mmc/host/renesas_sdhi_core.c
> +++ b/drivers/mmc/host/renesas_sdhi_core.c
> @@ -943,6 +943,8 @@ static const struct soc_device_attribute sdhi_quirks_match[]  = {
>  	{ .soc_id = "r8a77965", .data = &sdhi_quirks_r8a77965 },
>  	{ .soc_id = "r8a77980", .data = &sdhi_quirks_nohs400 },
>  	{ .soc_id = "r8a77990", .data = &sdhi_quirks_r8a77990 },
> +	{ .soc_id = "r8a779m1", .data = &sdhi_quirks_bad_taps2367 },
> +	{ .soc_id = "r8a779m3", .data = &sdhi_quirks_bad_taps1357 },

Could we reuse the entries for H3 and M3 instead, by dropping the
"ES3.*" revision ?

>  	{ /* Sentinel. */ },
>  };
>  

-- 
Regards,

Laurent Pinchart
