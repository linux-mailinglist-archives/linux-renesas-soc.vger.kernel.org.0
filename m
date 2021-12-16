Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E0033477504
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 16 Dec 2021 15:53:03 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234988AbhLPOxD (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Thu, 16 Dec 2021 09:53:03 -0500
Received: from perceval.ideasonboard.com ([213.167.242.64]:38756 "EHLO
        perceval.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234948AbhLPOxC (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 16 Dec 2021 09:53:02 -0500
Received: from pendragon.ideasonboard.com (62-78-145-57.bb.dnainternet.fi [62.78.145.57])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 44B9C3F6;
        Thu, 16 Dec 2021 15:53:01 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1639666381;
        bh=VLX0xaVZa/hiaGGAk3greverWGlYz6+uneCr03lWoMo=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=irfkcyA04LcfEymUfHF2hBnZg9+dCtmOmzvkVzLKTgaoXI/JDuOXTWSlbfkpKqZvG
         JS9ggX76JGcdVzM+hYMogKGBxOFVrxOTak31NdnMKqjQLTsKm/EL/BrK1xaPMVN/ZZ
         1Ucc9kQPud1perp4wC8Zfast2FnSdBRTfGEIWrpU=
Date:   Thu, 16 Dec 2021 16:52:59 +0200
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     Geert Uytterhoeven <geert+renesas@glider.be>
Cc:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Jiri Slaby <jirislaby@kernel.org>,
        Wolfram Sang <wsa+renesas@sang-engineering.com>,
        Ulrich Hecht <uli+renesas@fpond.eu>,
        linux-serial@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
        linux-sh@vger.kernel.org, uclinux-h8-devel@lists.sourceforge.jp
Subject: Re: [PATCH 1/3] serial: sh-sci: Drop support for "sci_ick" clock
Message-ID: <YbtSy9lkAQB7B3EX@pendragon.ideasonboard.com>
References: <cover.1639663832.git.geert+renesas@glider.be>
 <b4103e44d6ac46b6c1c264e2aeac80b39941fe74.1639663832.git.geert+renesas@glider.be>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <b4103e44d6ac46b6c1c264e2aeac80b39941fe74.1639663832.git.geert+renesas@glider.be>
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi Geert,

Thank you for the patch.

On Thu, Dec 16, 2021 at 03:17:32PM +0100, Geert Uytterhoeven wrote:
> Since commit 1b463bd51042927e ("ARM: dts: r8a7794: Rename the serial
> port clock to fck") in v4.6, all upstream DTS files call the SCIF
> functional clock "fck".
> 
> Hence the time is ripe to drop backward-compatibility with old DTBs that
> use the old "sci_ick" name.
> 
> Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>

Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>

> ---
> Note that such old DTBs have stopped working anyway since commit
> 58256143cff7c2e0 ("clk: renesas: Remove R-Car Gen2 legacy DT clock
> support") in v5.5.
> ---
>  drivers/tty/serial/sh-sci.c | 11 -----------
>  1 file changed, 11 deletions(-)
> 
> diff --git a/drivers/tty/serial/sh-sci.c b/drivers/tty/serial/sh-sci.c
> index 88005d2fc2a00b0b..686ca1777222b1d4 100644
> --- a/drivers/tty/serial/sh-sci.c
> +++ b/drivers/tty/serial/sh-sci.c
> @@ -2784,17 +2784,6 @@ static int sci_init_clocks(struct sci_port *sci_port, struct device *dev)
>  			return -EPROBE_DEFER;
>  
>  		if (IS_ERR(clk) && i == SCI_FCK) {
> -			/*
> -			 * "fck" used to be called "sci_ick", and we need to
> -			 * maintain DT backward compatibility.
> -			 */
> -			clk = devm_clk_get(dev, "sci_ick");
> -			if (PTR_ERR(clk) == -EPROBE_DEFER)
> -				return -EPROBE_DEFER;
> -
> -			if (!IS_ERR(clk))
> -				goto found;
> -
>  			/*
>  			 * Not all SH platforms declare a clock lookup entry
>  			 * for SCI devices, in which case we need to get the

-- 
Regards,

Laurent Pinchart
