Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id BB335C3F83
	for <lists+linux-renesas-soc@lfdr.de>; Tue,  1 Oct 2019 20:11:50 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731461AbfJASLu (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Tue, 1 Oct 2019 14:11:50 -0400
Received: from perceval.ideasonboard.com ([213.167.242.64]:52690 "EHLO
        perceval.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727345AbfJASLt (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 1 Oct 2019 14:11:49 -0400
Received: from pendragon.ideasonboard.com (modemcable151.96-160-184.mc.videotron.ca [184.160.96.151])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 8240C23F;
        Tue,  1 Oct 2019 20:11:46 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1569953507;
        bh=1HV+NKrply/jtpF9YUXpvlwczOCbNiRqingnW6DmXkE=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=BdFgBDBfQUWJNUepRw6g5fwqDpP3L/BSm3b4MoCzb9m2HQd43DtCX2HH4lPLVmizP
         Ir39CNZt9oyD5FEfjwjxbmcdnQw8sAAIEMf60o7IGHLSa1olUSNPsDs/yTPRUPEB6q
         R0v4+qIrUVk3FoA2SZL7AvyPFuHobcKZ94QFDHWA=
Date:   Tue, 1 Oct 2019 21:11:34 +0300
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
Subject: Re: [PATCH 1/8] arm64: dts: renesas: hihope-common: Move du clk
 properties out of common dtsi
Message-ID: <20191001181134.GC4735@pendragon.ideasonboard.com>
References: <1569932124-32010-1-git-send-email-biju.das@bp.renesas.com>
 <1569932124-32010-2-git-send-email-biju.das@bp.renesas.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <1569932124-32010-2-git-send-email-biju.das@bp.renesas.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi Biju,

Thank you for the patch.

On Tue, Oct 01, 2019 at 01:15:17PM +0100, Biju Das wrote:
> RZ/G2N board is pin compatible with RZ/G2M board. However on the SoC
> side RZ/G2N uses DU3 where as RZ/G2M uses DU2 for the DPAD. In order to
> reuse the common dtsi for both the boards, it is required to move du clock
> properties from common dtsi to board specific dts.
> 
> Signed-off-by: Biju Das <biju.das@bp.renesas.com>

It would be nice if DT had a syntax that allowed extending an existing
property. It would allow us to write

&du {
	clocks += <&versaclock5 1>,
		  <&x302_clk>,
		  <&versaclock5 2>;
	clock-names += "dclkin.0", "dclkin.1", "dclkin.2";
};

in hihope-common.dtsi and be done with it.

Rob, do you think that's something worth adding ?

In any case, until we have that, this patch looks good to me.

Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>

> ---
>  arch/arm64/boot/dts/renesas/hihope-common.dtsi        |  8 --------
>  arch/arm64/boot/dts/renesas/r8a774a1-hihope-rzg2m.dts | 11 +++++++++++
>  2 files changed, 11 insertions(+), 8 deletions(-)
> 
> diff --git a/arch/arm64/boot/dts/renesas/hihope-common.dtsi b/arch/arm64/boot/dts/renesas/hihope-common.dtsi
> index 3e376d2..355d0a2 100644
> --- a/arch/arm64/boot/dts/renesas/hihope-common.dtsi
> +++ b/arch/arm64/boot/dts/renesas/hihope-common.dtsi
> @@ -142,14 +142,6 @@
>  };
>  
>  &du {
> -	clocks = <&cpg CPG_MOD 724>,
> -		 <&cpg CPG_MOD 723>,
> -		 <&cpg CPG_MOD 722>,
> -		 <&versaclock5 1>,
> -		 <&x302_clk>,
> -		 <&versaclock5 2>;
> -	clock-names = "du.0", "du.1", "du.2",
> -		      "dclkin.0", "dclkin.1", "dclkin.2";
>  	status = "okay";
>  };
>  
> diff --git a/arch/arm64/boot/dts/renesas/r8a774a1-hihope-rzg2m.dts b/arch/arm64/boot/dts/renesas/r8a774a1-hihope-rzg2m.dts
> index 93ca973..96f2fb0 100644
> --- a/arch/arm64/boot/dts/renesas/r8a774a1-hihope-rzg2m.dts
> +++ b/arch/arm64/boot/dts/renesas/r8a774a1-hihope-rzg2m.dts
> @@ -24,3 +24,14 @@
>  		reg = <0x6 0x00000000 0x0 0x80000000>;
>  	};
>  };
> +
> +&du {
> +	clocks = <&cpg CPG_MOD 724>,
> +		 <&cpg CPG_MOD 723>,
> +		 <&cpg CPG_MOD 722>,
> +		 <&versaclock5 1>,
> +		 <&x302_clk>,
> +		 <&versaclock5 2>;
> +	clock-names = "du.0", "du.1", "du.2",
> +		      "dclkin.0", "dclkin.1", "dclkin.2";
> +};

-- 
Regards,

Laurent Pinchart
