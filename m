Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 17C16C3F9A
	for <lists+linux-renesas-soc@lfdr.de>; Tue,  1 Oct 2019 20:17:15 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727594AbfJASP7 (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Tue, 1 Oct 2019 14:15:59 -0400
Received: from perceval.ideasonboard.com ([213.167.242.64]:52790 "EHLO
        perceval.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726873AbfJASP7 (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 1 Oct 2019 14:15:59 -0400
Received: from pendragon.ideasonboard.com (modemcable151.96-160-184.mc.videotron.ca [184.160.96.151])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 9760223F;
        Tue,  1 Oct 2019 20:15:56 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1569953757;
        bh=fgF+BtQA+ViY8TlLBn/hIVfLhf63g3McKra74kZlZFg=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=sc5ByyC9t47pzwT2NFdFta5p5rTTZ1VSQ+vS/J3JNMx6wVWbiK1aHh48l70QyH1Uf
         kNWj4SWyv7Pqyn0FfTNodhIrvnGNwY6lCSbKqUwyjduEPJ1JDKIFTdAjtkMlc84uMn
         uZ0Lsz45AMzI4nHL2LC8xR3c+Rvzx7rYfC3CmHWs=
Date:   Tue, 1 Oct 2019 21:15:44 +0300
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     Biju Das <biju.das@bp.renesas.com>
Cc:     Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Simon Horman <horms@verge.net.au>,
        Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Magnus Damm <magnus.damm@gmail.com>,
        linux-renesas-soc@vger.kernel.org, devicetree@vger.kernel.org,
        Chris Paterson <Chris.Paterson2@renesas.com>,
        Fabrizio Castro <fabrizio.castro@bp.renesas.com>
Subject: Re: [PATCH 4/8] arm64: dts: renesas: r8a774b1-hihope-rzg2n: Add
 display clock properties
Message-ID: <20191001181544.GF4735@pendragon.ideasonboard.com>
References: <1569932124-32010-1-git-send-email-biju.das@bp.renesas.com>
 <1569932124-32010-5-git-send-email-biju.das@bp.renesas.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <1569932124-32010-5-git-send-email-biju.das@bp.renesas.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi Biju,

Thank you for the patch.

On Tue, Oct 01, 2019 at 01:15:20PM +0100, Biju Das wrote:
> Add display clock properties for the HiHope RZ/G2N board.
> 
> Signed-off-by: Biju Das <biju.das@bp.renesas.com>

Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>

> ---
>  arch/arm64/boot/dts/renesas/r8a774b1-hihope-rzg2n.dts | 11 +++++++++++
>  1 file changed, 11 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/renesas/r8a774b1-hihope-rzg2n.dts b/arch/arm64/boot/dts/renesas/r8a774b1-hihope-rzg2n.dts
> index c9e2119..9910c1a 100644
> --- a/arch/arm64/boot/dts/renesas/r8a774b1-hihope-rzg2n.dts
> +++ b/arch/arm64/boot/dts/renesas/r8a774b1-hihope-rzg2n.dts
> @@ -25,6 +25,17 @@
>  	};
>  };
>  
> +&du {
> +	clocks = <&cpg CPG_MOD 724>,
> +		 <&cpg CPG_MOD 723>,
> +		 <&cpg CPG_MOD 721>,
> +		 <&versaclock5 1>,
> +		 <&x302_clk>,
> +		 <&versaclock5 2>;
> +	clock-names = "du.0", "du.1", "du.3",
> +		      "dclkin.0", "dclkin.1", "dclkin.3";
> +};
> +
>  &sdhi3 {
>  	mmc-hs400-1_8v;
>  };

-- 
Regards,

Laurent Pinchart
