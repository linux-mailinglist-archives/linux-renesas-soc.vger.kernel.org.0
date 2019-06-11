Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 1EFDA3CDE0
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 11 Jun 2019 16:04:55 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2389510AbfFKODJ (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Tue, 11 Jun 2019 10:03:09 -0400
Received: from perceval.ideasonboard.com ([213.167.242.64]:32776 "EHLO
        perceval.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2387447AbfFKODJ (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 11 Jun 2019 10:03:09 -0400
Received: from pendragon.ideasonboard.com (dfj612yhrgyx302h3jwwy-3.rev.dnainternet.fi [IPv6:2001:14ba:21f5:5b00:ce28:277f:58d7:3ca4])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id F1BD0FA0;
        Tue, 11 Jun 2019 16:03:07 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1560261788;
        bh=3BvB84hfEouUM2qCyFA1C21WzDxy+FKCZeu7WHZsPfQ=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=OETh46C8Jts9gnoaub9GkBJ1/ikcePUj6ucwaXsO2qUYXRLQNmpK9D4H38/elqEK0
         zk5PFZ6E1QxcsJEIHKvjJKF0n8I4tbuZ0+UtYkacET86eSXVBYUbUgd+tT9WATwYXu
         cDwEGpBVDmKxAKNxZux1kCahP+vmCZoOtGEH9mBQ=
Date:   Tue, 11 Jun 2019 17:02:52 +0300
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     Simon Horman <horms@verge.net.au>
Cc:     Yoshihiro Kaneko <ykaneko0929@gmail.com>,
        linux-renesas-soc@vger.kernel.org,
        Geert Uytterhoeven <geert@linux-m68k.org>,
        Magnus Damm <magnus.damm@gmail.com>,
        linux-arm-kernel@lists.infradead.org,
        Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
Subject: Re: [PATCH/RFT] arm64: dts: renesas: r8a77990: Fix register range of
 display node
Message-ID: <20190611140252.GL5016@pendragon.ideasonboard.com>
References: <1560084198-2930-1-git-send-email-ykaneko0929@gmail.com>
 <20190611123022.oo4arh76w72vlkg5@verge.net.au>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20190611123022.oo4arh76w72vlkg5@verge.net.au>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hello,

On Tue, Jun 11, 2019 at 02:30:27PM +0200, Simon Horman wrote:
> + Laurent
> 
> On Sun, Jun 09, 2019 at 09:43:18PM +0900, Yoshihiro Kaneko wrote:
> > From: Takeshi Kihara <takeshi.kihara.df@renesas.com>
> > 
> > Since the R8A77990 SoC uses DU{0,1}, the range from the base address to
> > the 0x4000 address is used.
> > This patch fixed it.
> > 
> > Fixes: 13ee2bfc5444 ("arm64: dts: renesas: r8a77990: Add display output support")
> > Signed-off-by: Takeshi Kihara <takeshi.kihara.df@renesas.com>
> > Signed-off-by: Yoshihiro Kaneko <ykaneko0929@gmail.com>
> 
> Thanks,
> 
> This looks fine to me but I will wait to see if there are other reviews
> before applying.
> 
> Reviewed-by: Simon Horman <horms+renesas@verge.net.au>

Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>

> Is a similar fix also appropriate for D3 (r8a77995)

Yes it is.

> And a variant that reduces the register size to 0x5000
> for M3-W (r8a77965).

M3-W has registers at 0xfeb60000. You could reduce the size from
0x80000 to 0x70000 but I don't think it's worth it.

> > ---
> > 
> > This patch is based on the devel branch of Simon Horman's renesas tree.
> > 
> >  arch/arm64/boot/dts/renesas/r8a77990.dtsi | 2 +-
> >  1 file changed, 1 insertion(+), 1 deletion(-)
> > 
> > diff --git a/arch/arm64/boot/dts/renesas/r8a77990.dtsi b/arch/arm64/boot/dts/renesas/r8a77990.dtsi
> > index 547e970..9b15da1 100644
> > --- a/arch/arm64/boot/dts/renesas/r8a77990.dtsi
> > +++ b/arch/arm64/boot/dts/renesas/r8a77990.dtsi
> > @@ -1760,7 +1760,7 @@
> >  
> >  		du: display@feb00000 {
> >  			compatible = "renesas,du-r8a77990";
> > -			reg = <0 0xfeb00000 0 0x80000>;
> > +			reg = <0 0xfeb00000 0 0x40000>;
> >  			interrupts = <GIC_SPI 256 IRQ_TYPE_LEVEL_HIGH>,
> >  				     <GIC_SPI 268 IRQ_TYPE_LEVEL_HIGH>;
> >  			clocks = <&cpg CPG_MOD 724>,

-- 
Regards,

Laurent Pinchart
