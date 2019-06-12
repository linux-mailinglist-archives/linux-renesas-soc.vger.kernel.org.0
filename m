Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id DD879424BE
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 12 Jun 2019 13:51:02 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729607AbfFLLuG (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Wed, 12 Jun 2019 07:50:06 -0400
Received: from kirsty.vergenet.net ([202.4.237.240]:38364 "EHLO
        kirsty.vergenet.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726004AbfFLLuG (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 12 Jun 2019 07:50:06 -0400
Received: from penelope.horms.nl (ip4dab7138.direct-adsl.nl [77.171.113.56])
        by kirsty.vergenet.net (Postfix) with ESMTPA id 2B26325AD60;
        Wed, 12 Jun 2019 21:50:04 +1000 (AEST)
Received: by penelope.horms.nl (Postfix, from userid 7100)
        id 1FDE0E21FE5; Wed, 12 Jun 2019 13:50:02 +0200 (CEST)
Date:   Wed, 12 Jun 2019 13:50:02 +0200
From:   Simon Horman <horms@verge.net.au>
To:     Biju Das <biju.das@bp.renesas.com>
Cc:     Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Magnus Damm <magnus.damm@gmail.com>,
        linux-renesas-soc@vger.kernel.org, devicetree@vger.kernel.org,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Chris Paterson <Chris.Paterson2@renesas.com>,
        Fabrizio Castro <fabrizio.castro@bp.renesas.com>
Subject: Re: [PATCH 2/3] arm64: dts: renesas: hihope-common: Declare pcie bus
 clock
Message-ID: <20190612115001.xmalqxe7m2lasqzs@verge.net.au>
References: <1559891639-62529-1-git-send-email-biju.das@bp.renesas.com>
 <1559891639-62529-3-git-send-email-biju.das@bp.renesas.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1559891639-62529-3-git-send-email-biju.das@bp.renesas.com>
Organisation: Horms Solutions BV
User-Agent: NeoMutt/20170113 (1.7.2)
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

On Fri, Jun 07, 2019 at 08:13:58AM +0100, Biju Das wrote:
> Declare pcie bus clock, since it is generated on the HiHope RZ/G2M main
> board.
> 
> Signed-off-by: Biju Das <biju.das@bp.renesas.com>

Thanks, applied for inclusion in v5.3.

> ---
>  arch/arm64/boot/dts/renesas/hihope-common.dtsi | 4 ++++
>  1 file changed, 4 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/renesas/hihope-common.dtsi b/arch/arm64/boot/dts/renesas/hihope-common.dtsi
> index 4cc924d..95ac6fa 100644
> --- a/arch/arm64/boot/dts/renesas/hihope-common.dtsi
> +++ b/arch/arm64/boot/dts/renesas/hihope-common.dtsi
> @@ -26,6 +26,10 @@
>  	clock-frequency = <32768>;
>  };
>  
> +&pcie_bus_clk {
> +	clock-frequency = <100000000>;
> +};
> +
>  &pfc {
>  	pinctrl-0 = <&scif_clk_pins>;
>  	pinctrl-names = "default";
> -- 
> 2.7.4
> 
