Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id D1B56424C0
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 12 Jun 2019 13:51:03 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730282AbfFLLun (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Wed, 12 Jun 2019 07:50:43 -0400
Received: from kirsty.vergenet.net ([202.4.237.240]:38396 "EHLO
        kirsty.vergenet.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726004AbfFLLun (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 12 Jun 2019 07:50:43 -0400
Received: from penelope.horms.nl (ip4dab7138.direct-adsl.nl [77.171.113.56])
        by kirsty.vergenet.net (Postfix) with ESMTPA id 3316425AD60;
        Wed, 12 Jun 2019 21:50:41 +1000 (AEST)
Received: by penelope.horms.nl (Postfix, from userid 7100)
        id 1F8A9E21FE5; Wed, 12 Jun 2019 13:50:39 +0200 (CEST)
Date:   Wed, 12 Jun 2019 13:50:39 +0200
From:   Simon Horman <horms@verge.net.au>
To:     Biju Das <biju.das@bp.renesas.com>
Cc:     Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Magnus Damm <magnus.damm@gmail.com>,
        linux-renesas-soc@vger.kernel.org, devicetree@vger.kernel.org,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Chris Paterson <Chris.Paterson2@renesas.com>,
        Fabrizio Castro <fabrizio.castro@bp.renesas.com>
Subject: Re: [PATCH 3/3] arm64: dts: renesas: hihope-rzg2-ex: Enable PCIe
 support
Message-ID: <20190612115038.yo5ecpixqd6plkjm@verge.net.au>
References: <1559891639-62529-1-git-send-email-biju.das@bp.renesas.com>
 <1559891639-62529-4-git-send-email-biju.das@bp.renesas.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1559891639-62529-4-git-send-email-biju.das@bp.renesas.com>
Organisation: Horms Solutions BV
User-Agent: NeoMutt/20170113 (1.7.2)
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

On Fri, Jun 07, 2019 at 08:13:59AM +0100, Biju Das wrote:
> This patch enables PCIEC[01] PCI express controller on the sub board.
> 
> Signed-off-by: Biju Das <biju.das@bp.renesas.com>

Thanks, applied for inclusion in v5.3.

> ---
>  arch/arm64/boot/dts/renesas/hihope-rzg2-ex.dtsi | 8 ++++++++
>  1 file changed, 8 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/renesas/hihope-rzg2-ex.dtsi b/arch/arm64/boot/dts/renesas/hihope-rzg2-ex.dtsi
> index b1e45944..07a6eea 100644
> --- a/arch/arm64/boot/dts/renesas/hihope-rzg2-ex.dtsi
> +++ b/arch/arm64/boot/dts/renesas/hihope-rzg2-ex.dtsi
> @@ -31,6 +31,14 @@
>  	};
>  };
>  
> +&pciec0 {
> +	status = "okay";
> +};
> +
> +&pciec1 {
> +	status = "okay";
> +};
> +
>  &pfc {
>  	pinctrl-0 = <&scif_clk_pins>;
>  	pinctrl-names = "default";
> -- 
> 2.7.4
> 
