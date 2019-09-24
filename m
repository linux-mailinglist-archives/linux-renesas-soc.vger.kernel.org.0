Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id D9061BC4BB
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 24 Sep 2019 11:22:32 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728811AbfIXJWc (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Tue, 24 Sep 2019 05:22:32 -0400
Received: from kirsty.vergenet.net ([202.4.237.240]:41872 "EHLO
        kirsty.vergenet.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726707AbfIXJWc (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 24 Sep 2019 05:22:32 -0400
Received: from reginn.horms.nl (watermunt.horms.nl [80.127.179.77])
        by kirsty.vergenet.net (Postfix) with ESMTPA id 1C69A25AF19;
        Tue, 24 Sep 2019 19:22:30 +1000 (AEST)
Received: by reginn.horms.nl (Postfix, from userid 7100)
        id 18E71944431; Tue, 24 Sep 2019 11:22:28 +0200 (CEST)
Date:   Tue, 24 Sep 2019 11:22:28 +0200
From:   Simon Horman <horms@verge.net.au>
To:     Rob Herring <robh+dt@kernel.org>
Cc:     Mark Rutland <mark.rutland@arm.com>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Magnus Damm <magnus.damm@gmail.com>,
        Yoshihiro Kaneko <ykaneko0929@gmail.com>,
        devicetree@vger.kernel.org,
        "open list:MEDIA DRIVERS FOR RENESAS - FCP" 
        <linux-renesas-soc@vger.kernel.org>
Subject: Re: [PATCH 1/2] dt-bindings: bus: simple-pm-bus: convert bindings to
 json-schema
Message-ID: <20190924092225.pfqtdp4pd47uxdc7@verge.net.au>
References: <20190916153357.3880-1-horms+renesas@verge.net.au>
 <20190916153357.3880-2-horms+renesas@verge.net.au>
 <CAL_JsqJHiAmH0eeUMLH1q9X6e+88EVZrmMtM33rVWCyBAszY8A@mail.gmail.com>
 <20190919151014.4azdfh2feg5ot6no@verge.net.au>
 <CAL_Jsq+y5o-jBX9emVpW+q7n+Tde2ON0TqHmm9gFj7emUURL7Q@mail.gmail.com>
 <20190923115328.lpb5qeu6poacrb6y@verge.net.au>
 <CAL_JsqLVyuQTZo1CoxoesNM=FfDrXphYK8pfqFrGyeZLEi5pjg@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAL_JsqLVyuQTZo1CoxoesNM=FfDrXphYK8pfqFrGyeZLEi5pjg@mail.gmail.com>
Organisation: Horms Solutions BV
User-Agent: NeoMutt/20170113 (1.7.2)
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

On Mon, Sep 23, 2019 at 07:40:28AM -0500, Rob Herring wrote:
> On Mon, Sep 23, 2019 at 6:53 AM Simon Horman <horms@verge.net.au> wrote:
> >
> > On Thu, Sep 19, 2019 at 02:33:58PM -0500, Rob Herring wrote:
> > > On Thu, Sep 19, 2019 at 10:10 AM Simon Horman <horms@verge.net.au> wrote:
> > > >
> > > > On Tue, Sep 17, 2019 at 07:12:16AM -0500, Rob Herring wrote:
> > > > > On Mon, Sep 16, 2019 at 10:35 AM Simon Horman
> > > > > <horms+renesas@verge.net.au> wrote:
> >
> > ...
> >
> > > > > > +
> > > > > > +  power-domains:
> > > > > > +    # Required if clocks is absent, optional otherwise
> > > > > > +    minItems: 1
> > > > > > +
> > > > > > +required:
> > > > > > +  - compatible
> > > > > > +  - '#address-cells'
> > > > > > +  - '#size-cells'
> > > > > > +  - ranges
> > > > >
> > > > > This will capture what you commented above:
> > > > >
> > > > > oneOf:
> > > > >   - required:
> > > > >       - clocks
> > > > >   - required:
> > > > >       - power-domains
> > > >
> > > > Thanks. Unfortunately dtbs_check does not seem happy
> > > > if both clocks and power-domains are present.
> > >
> > > I was thinking it was either or. Use 'anyOf' instead.
> >
> > Thanks, perhaps the tooling needs updating to handle this.
> 
> Indeed. Now fixed.

Thanks, the above seems to be working nicely now.
