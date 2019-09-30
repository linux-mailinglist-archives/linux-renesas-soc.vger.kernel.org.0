Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id DFB6DC1FF9
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 30 Sep 2019 13:29:30 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729687AbfI3L33 (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Mon, 30 Sep 2019 07:29:29 -0400
Received: from kirsty.vergenet.net ([202.4.237.240]:38920 "EHLO
        kirsty.vergenet.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726858AbfI3L33 (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 30 Sep 2019 07:29:29 -0400
Received: from reginn.horms.nl (watermunt.horms.nl [80.127.179.77])
        by kirsty.vergenet.net (Postfix) with ESMTPA id A3A7725AD50;
        Mon, 30 Sep 2019 21:29:26 +1000 (AEST)
Received: by reginn.horms.nl (Postfix, from userid 7100)
        id 8A1219413D3; Mon, 30 Sep 2019 13:29:24 +0200 (CEST)
Date:   Mon, 30 Sep 2019 13:29:24 +0200
From:   Simon Horman <horms@verge.net.au>
To:     Geert Uytterhoeven <geert@linux-m68k.org>
Cc:     Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Andy Gross <agross@kernel.org>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Magnus Damm <magnus.damm@gmail.com>,
        Yoshihiro Kaneko <ykaneko0929@gmail.com>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>, linux-arm-msm@vger.kernel.org,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>
Subject: Re: [PATCH v3 3/3] arm64: dts: qcom: msm8996: Update simple-pm-bus
 node name to 'bus'
Message-ID: <20190930112924.uayeet4rogjmelfg@verge.net.au>
References: <20190924093609.22895-1-horms+renesas@verge.net.au>
 <20190924093609.22895-4-horms+renesas@verge.net.au>
 <CAMuHMdU6O-pDRBRXXX1ZU1L4c25POrPcDB_TsbAqA9wzVobtAw@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAMuHMdU6O-pDRBRXXX1ZU1L4c25POrPcDB_TsbAqA9wzVobtAw@mail.gmail.com>
Organisation: Horms Solutions BV
User-Agent: NeoMutt/20170113 (1.7.2)
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

On Thu, Sep 26, 2019 at 01:58:21PM +0200, Geert Uytterhoeven wrote:
> Hi Simon,
> 
> On Tue, Sep 24, 2019 at 11:37 AM Simon Horman
> <horms+renesas@verge.net.au> wrote:
> > Update simple-pm-bus node name from 'agnoc' to 'bus' reflecting the
> > proposed binding description in json-schema which in turn reflects the ePAR
> > standard - "the name of a node should be somewhat generic, reflecting the
> > function of the device and not its precise programming model."
> >
> > Also drop the unit address as there is neither a reg property nor
> > non-empty ranges.
> >
> > Signed-off-by: Simon Horman <horms+renesas@verge.net.au>
> > ---
> > v2
> > * New patch
> > ---
> >  arch/arm64/boot/dts/qcom/msm8996.dtsi | 2 +-
> >  1 file changed, 1 insertion(+), 1 deletion(-)
> >
> > diff --git a/arch/arm64/boot/dts/qcom/msm8996.dtsi b/arch/arm64/boot/dts/qcom/msm8996.dtsi
> > index 96c0a481f454..99f376ebd27e 100644
> > --- a/arch/arm64/boot/dts/qcom/msm8996.dtsi
> > +++ b/arch/arm64/boot/dts/qcom/msm8996.dtsi
> > @@ -1373,7 +1373,7 @@
> >                         clock-names = "iface", "bus";
> >                 };
> >
> > -               agnoc@0 {
> > +               bus {
> >                         power-domains = <&gcc AGGRE0_NOC_GDSC>;
> >                         compatible = "simple-pm-bus";
> >                         #address-cells = <1>;
> 
> This file is included by arch/arm64/boot/dts/qcom/apq8096-db820c.dtsi,
> which references agnoc@0, so you have to update that one as well,
> to avoid introducing silent breakages.

Thanks, will do.
