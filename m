Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6D85B260A91
	for <lists+linux-renesas-soc@lfdr.de>; Tue,  8 Sep 2020 08:07:27 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728680AbgIHGH1 (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Tue, 8 Sep 2020 02:07:27 -0400
Received: from perceval.ideasonboard.com ([213.167.242.64]:46108 "EHLO
        perceval.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728474AbgIHGH0 (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 8 Sep 2020 02:07:26 -0400
Received: from pendragon.ideasonboard.com (62-78-145-57.bb.dnainternet.fi [62.78.145.57])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id AA16C3B;
        Tue,  8 Sep 2020 08:07:22 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1599545242;
        bh=rLcOKNFolAeqHFmi606DjXA9kF2Yb9XrI87axxyQmgQ=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=NnXDB66pnPwI4gcASIS5HJbDfv3i4Pz30eckTT08bs0SDb0LRUcBj2ZiPth9Dk9qr
         hb9hcDmU2CspRj92QOmka3tgCIc5LCdc6BdZyu/d5lFbpAsuL2Wm4ERorkLUr5EPCu
         h4o+Dk3zUCNol3L0D+L0HgenCuH1O/Y2ZbWfhDI0=
Date:   Tue, 8 Sep 2020 09:06:57 +0300
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Cc:     Rob Herring <robh+dt@kernel.org>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>,
        Magnus <magnus.damm@gmail.com>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        Linux-DT <devicetree@vger.kernel.org>,
        Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
        shimoda <yoshihiro.shimoda.uh@renesas.com>,
        dri-devel@lists.freedesktop.org
Subject: Re: [PATCH v2 10/10] arm64: dts: renesas: r8a77961-salvator-xs: add
 HDMI Sound support
Message-ID: <20200908060657.GU6047@pendragon.ideasonboard.com>
References: <87o8mhrtxo.wl-kuninori.morimoto.gx@renesas.com>
 <87a6y1rtun.wl-kuninori.morimoto.gx@renesas.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <87a6y1rtun.wl-kuninori.morimoto.gx@renesas.com>
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi Morimoto-san,

Thank you for the patch.

On Tue, Sep 08, 2020 at 09:35:25AM +0900, Kuninori Morimoto wrote:
> From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
> 
> This patch enables HDMI Sound on R-Car M3-W+ Salvator-XS board.
> 
> This reverts commit b997613fad58a03588f0f64a3d86db6c5bd76dd2.

Which tree can this commit be found in ?

> Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
> ---
>  .../boot/dts/renesas/r8a77961-salvator-xs.dts | 29 +++++++++++++++++++
>  1 file changed, 29 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/renesas/r8a77961-salvator-xs.dts b/arch/arm64/boot/dts/renesas/r8a77961-salvator-xs.dts
> index ca21a702db54..1e7603365106 100644
> --- a/arch/arm64/boot/dts/renesas/r8a77961-salvator-xs.dts
> +++ b/arch/arm64/boot/dts/renesas/r8a77961-salvator-xs.dts
> @@ -51,9 +51,38 @@ rcar_dw_hdmi0_out: endpoint {
>  				remote-endpoint = <&hdmi0_con>;
>  			};
>  		};
> +		port@2 {
> +			reg = <2>;
> +			dw_hdmi0_snd_in: endpoint {
> +				remote-endpoint = <&rsnd_endpoint1>;
> +			};
> +		};
>  	};
>  };
>  
>  &hdmi0_con {
>  	remote-endpoint = <&rcar_dw_hdmi0_out>;
>  };
> +
> +&rcar_sound {
> +	ports {
> +		/* rsnd_port0 is on salvator-common */
> +		rsnd_port1: port@1 {
> +			reg = <1>;
> +			rsnd_endpoint1: endpoint {
> +				remote-endpoint = <&dw_hdmi0_snd_in>;
> +
> +				dai-format = "i2s";
> +				bitclock-master = <&rsnd_endpoint1>;
> +				frame-master = <&rsnd_endpoint1>;
> +
> +				playback = <&ssi2>;
> +			};
> +		};
> +	};
> +};
> +
> +&sound_card {
> +	dais = <&rsnd_port0	/* ak4613 */
> +		&rsnd_port1>;	/* HDMI0  */
> +};

-- 
Regards,

Laurent Pinchart
