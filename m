Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id E2945A519E
	for <lists+linux-renesas-soc@lfdr.de>; Mon,  2 Sep 2019 10:32:29 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730155AbfIBIc3 (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Mon, 2 Sep 2019 04:32:29 -0400
Received: from kirsty.vergenet.net ([202.4.237.240]:33686 "EHLO
        kirsty.vergenet.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729680AbfIBIc3 (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 2 Sep 2019 04:32:29 -0400
Received: from reginn.horms.nl (watermunt.horms.nl [80.127.179.77])
        by kirsty.vergenet.net (Postfix) with ESMTPA id E5E6625B75F;
        Mon,  2 Sep 2019 18:32:26 +1000 (AEST)
Received: by reginn.horms.nl (Postfix, from userid 7100)
        id E04B29401E6; Mon,  2 Sep 2019 10:32:24 +0200 (CEST)
Date:   Mon, 2 Sep 2019 10:32:24 +0200
From:   Simon Horman <horms@verge.net.au>
To:     Fabrizio Castro <fabrizio.castro@bp.renesas.com>
Cc:     Geert Uytterhoeven <geert+renesas@glider.be>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Daniel Lezcano <daniel.lezcano@linaro.org>,
        Thomas Gleixner <tglx@linutronix.de>,
        "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
        Chris Paterson <Chris.Paterson2@renesas.com>,
        Biju Das <biju.das@bp.renesas.com>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        "linux-renesas-soc@vger.kernel.org" 
        <linux-renesas-soc@vger.kernel.org>
Subject: Re: [PATCH 5/6] dt-bindings: timer: renesas: tmu: Document r8a774a1
 bindings
Message-ID: <20190902083224.mn5agbxf5akhhoqg@verge.net.au>
References: <1560258401-9517-1-git-send-email-fabrizio.castro@bp.renesas.com>
 <1560258401-9517-6-git-send-email-fabrizio.castro@bp.renesas.com>
 <TY1PR01MB1770BF952221F50BBCDF3765C0BD0@TY1PR01MB1770.jpnprd01.prod.outlook.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <TY1PR01MB1770BF952221F50BBCDF3765C0BD0@TY1PR01MB1770.jpnprd01.prod.outlook.com>
Organisation: Horms Solutions BV
User-Agent: NeoMutt/20170113 (1.7.2)
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

On Fri, Aug 30, 2019 at 10:37:54AM +0000, Fabrizio Castro wrote:
> Dear All,
> 
> This patch has been reviewed by Geert, Simon, and Rob, so I think it's ok to apply.
> Is anybody willing to take this patch?

<2c> I think Geert can take this </2c>

> Thanks,
> Fab
> 
> > From: Fabrizio Castro <fabrizio.castro@bp.renesas.com>
> > Sent: 11 June 2019 14:07
> > Subject: [PATCH 5/6] dt-bindings: timer: renesas: tmu: Document r8a774a1 bindings
> > 
> > Document RZ/G2M (R8A774A1) SoC in the Renesas TMU bindings.
> > 
> > Signed-off-by: Fabrizio Castro <fabrizio.castro@bp.renesas.com>
> > ---
> >  Documentation/devicetree/bindings/timer/renesas,tmu.txt | 1 +
> >  1 file changed, 1 insertion(+)
> > 
> > diff --git a/Documentation/devicetree/bindings/timer/renesas,tmu.txt b/Documentation/devicetree/bindings/timer/renesas,tmu.txt
> > index 13ad074..9dff7e5 100644
> > --- a/Documentation/devicetree/bindings/timer/renesas,tmu.txt
> > +++ b/Documentation/devicetree/bindings/timer/renesas,tmu.txt
> > @@ -10,6 +10,7 @@ Required Properties:
> > 
> >    - compatible: must contain one or more of the following:
> >      - "renesas,tmu-r8a7740" for the r8a7740 TMU
> > +    - "renesas,tmu-r8a774a1" for the r8a774A1 TMU
> >      - "renesas,tmu-r8a774c0" for the r8a774C0 TMU
> >      - "renesas,tmu-r8a7778" for the r8a7778 TMU
> >      - "renesas,tmu-r8a7779" for the r8a7779 TMU
> > --
> > 2.7.4
> 
