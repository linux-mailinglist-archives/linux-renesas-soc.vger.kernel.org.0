Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 2BE1942556
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 12 Jun 2019 14:16:42 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2438742AbfFLMQl (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Wed, 12 Jun 2019 08:16:41 -0400
Received: from kirsty.vergenet.net ([202.4.237.240]:39612 "EHLO
        kirsty.vergenet.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2436570AbfFLMQl (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 12 Jun 2019 08:16:41 -0400
Received: from penelope.horms.nl (ip4dab7138.direct-adsl.nl [77.171.113.56])
        by kirsty.vergenet.net (Postfix) with ESMTPA id 0D3FE25AEA9;
        Wed, 12 Jun 2019 22:16:39 +1000 (AEST)
Received: by penelope.horms.nl (Postfix, from userid 7100)
        id F26E7E21FE5; Wed, 12 Jun 2019 14:16:36 +0200 (CEST)
Date:   Wed, 12 Jun 2019 14:16:36 +0200
From:   Simon Horman <horms@verge.net.au>
To:     Geert Uytterhoeven <geert@linux-m68k.org>
Cc:     Fabrizio Castro <fabrizio.castro@bp.renesas.com>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Magnus Damm <magnus.damm@gmail.com>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>,
        Chris Paterson <Chris.Paterson2@renesas.com>,
        Biju Das <biju.das@bp.renesas.com>, xu_shunji@hoperun.com,
        Wolfram Sang <wsa+renesas@sang-engineering.com>
Subject: Re: [PATCH] arm64: dts: renesas: hihope-common: Add uSD and eMMC
Message-ID: <20190612121636.qwktrxb3e3je5nd3@verge.net.au>
References: <1559895251-13931-1-git-send-email-fabrizio.castro@bp.renesas.com>
 <CAMuHMdXv91Tt+78zLJj6pHFj9XrEJJbWOf-kzBPRbcw=h+iDHg@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAMuHMdXv91Tt+78zLJj6pHFj9XrEJJbWOf-kzBPRbcw=h+iDHg@mail.gmail.com>
Organisation: Horms Solutions BV
User-Agent: NeoMutt/20170113 (1.7.2)
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

On Wed, Jun 12, 2019 at 10:27:56AM +0200, Geert Uytterhoeven wrote:
> Hi Fabrizio,
> 
> On Fri, Jun 7, 2019 at 10:14 AM Fabrizio Castro
> <fabrizio.castro@bp.renesas.com> wrote:
> > This patch adds uSD and eMMC support to the HiHope RZ/G2M
> > board.
> >
> > Signed-off-by: Fabrizio Castro <fabrizio.castro@bp.renesas.com>
> 
> Thanks for your patch!
> 
> > --- a/arch/arm64/boot/dts/renesas/hihope-common.dtsi
> > +++ b/arch/arm64/boot/dts/renesas/hihope-common.dtsi
> 
> > +&sdhi3 {
> > +       pinctrl-0 = <&sdhi3_pins>;
> > +       pinctrl-1 = <&sdhi3_pins>;
> > +       pinctrl-names = "default", "state_uhs";
> > +
> > +       vmmc-supply = <&reg_3p3v>;
> > +       vqmmc-supply = <&reg_1p8v>;
> > +       bus-width = <8>;
> > +       mmc-hs200-1_8v;
> 
> Does the eMMC support HS400, too?
> 
> > +       non-removable;
> > +       fixed-emmc-driver-type = <1>;
> > +       status = "okay";
> > +};
> 
> Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>

Thanks,

applied for inclusion in v5.3.
