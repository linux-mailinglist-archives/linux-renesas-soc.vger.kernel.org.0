Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 33141C8B3D
	for <lists+linux-renesas-soc@lfdr.de>; Wed,  2 Oct 2019 16:30:03 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725747AbfJBOaC (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Wed, 2 Oct 2019 10:30:02 -0400
Received: from perceval.ideasonboard.com ([213.167.242.64]:34970 "EHLO
        perceval.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726374AbfJBOaC (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 2 Oct 2019 10:30:02 -0400
Received: from pendragon.ideasonboard.com (unknown [132.205.230.1])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id AEC6B2BB;
        Wed,  2 Oct 2019 16:29:59 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1570026600;
        bh=mE1KFiVsojBxWZ5npLcuYft5j/qcVmvhvHd8US5qeqU=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=h9isp3WhP02jKR8d0LtisSDMoz1IK19MdU2hKSbiRlA60/GY0nf+dRNFLpaMALydp
         jvNNf/8Cqh60Rsh/lCUmY86/Enlngt+lrCkMvyrE26eZ264GM4jNMtiZvKpd9NwXfV
         4XNSLfc1xtaqrv6Ur8pyUEky7nPyUtg6z6mYMm3A=
Date:   Wed, 2 Oct 2019 17:29:47 +0300
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
Subject: Re: [PATCH v2 9/9] arm64: dts: renesas: Add support for Advantech
 idk-1110wr LVDS panel
Message-ID: <20191002142947.GE5262@pendragon.ideasonboard.com>
References: <1570010906-47486-1-git-send-email-biju.das@bp.renesas.com>
 <1570010906-47486-10-git-send-email-biju.das@bp.renesas.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <1570010906-47486-10-git-send-email-biju.das@bp.renesas.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi Biju,

Thank you for the patch.

On Wed, Oct 02, 2019 at 11:08:26AM +0100, Biju Das wrote:
> This patch adds support for Advantech idk-1110wr LVDS panel.
> The HiHope RZ/G2[MN] is advertised as compatible with panel
> idk-1110wr from Advantech, however the panel isn't sold alongside
> the board.
> 
> Signed-off-by: Biju Das <biju.das@bp.renesas.com>
> ---
>  V1-->V2
>    * Incorporated Laurent's review comments
> ---
>  .../renesas/rzg2-advantech-idk-1110wr-panel.dtsi   | 42 ++++++++++++++++++++++
>  1 file changed, 42 insertions(+)
>  create mode 100644 arch/arm64/boot/dts/renesas/rzg2-advantech-idk-1110wr-panel.dtsi
> 
> diff --git a/arch/arm64/boot/dts/renesas/rzg2-advantech-idk-1110wr-panel.dtsi b/arch/arm64/boot/dts/renesas/rzg2-advantech-idk-1110wr-panel.dtsi
> new file mode 100644
> index 0000000..4f876df
> --- /dev/null
> +++ b/arch/arm64/boot/dts/renesas/rzg2-advantech-idk-1110wr-panel.dtsi
> @@ -0,0 +1,42 @@
> +// SPDX-License-Identifier: GPL-2.0
> +/*
> + * Device Tree Source for the Advantech idk-1110wr LVDS panel connected
> + * to RZ/G2 boards
> + *
> + * Copyright (C) 2019 Renesas Electronics Corp.
> + */
> +
> +/ {
> +

No need for a blank line here. Apart from this,

Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>

> +	panel-lvds {
> +		compatible = "advantech,idk-1110wr", "panel-lvds";
> +
> +		width-mm = <223>;
> +		height-mm = <125>;
> +
> +		data-mapping = "jeida-24";
> +
> +		panel-timing {
> +			/* 1024x600 @60Hz */
> +			clock-frequency = <51200000>;
> +			hactive = <1024>;
> +			vactive = <600>;
> +			hsync-len = <240>;
> +			hfront-porch = <40>;
> +			hback-porch = <40>;
> +			vfront-porch = <15>;
> +			vback-porch = <10>;
> +			vsync-len = <10>;
> +		};
> +
> +		port {
> +			panel_in: endpoint {
> +				remote-endpoint = <&lvds_connector>;
> +			};
> +		};
> +	};
> +};
> +
> +&lvds_connector {
> +	remote-endpoint = <&panel_in>;
> +};

-- 
Regards,

Laurent Pinchart
