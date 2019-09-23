Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 558EBBB401
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 23 Sep 2019 14:40:42 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2404757AbfIWMkl (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Mon, 23 Sep 2019 08:40:41 -0400
Received: from mail.kernel.org ([198.145.29.99]:36482 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S2404312AbfIWMkl (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 23 Sep 2019 08:40:41 -0400
Received: from mail-qk1-f180.google.com (mail-qk1-f180.google.com [209.85.222.180])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 7696120835;
        Mon, 23 Sep 2019 12:40:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1569242440;
        bh=l8vQZJIUvgkbP7LvWo9qwqFBsXsB44W0ABkn+VKhM9I=;
        h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
        b=J6kcKYiTgnK4nzc8sAa0nnjlvXAPOaM/O0PtmhjWxEKUCCsJvqjuFyB/lw9anHQf9
         SgsK9KsGX4I0xgHnmVdIMIFTUUxAnjxrbS0DmCJV4pQKYxINqTNJWZ0PcfNFDFVtRn
         9LsB6vvCQv/kmH81olflVKNpXGK57MrW/1J81WB8=
Received: by mail-qk1-f180.google.com with SMTP id 4so15164110qki.6;
        Mon, 23 Sep 2019 05:40:40 -0700 (PDT)
X-Gm-Message-State: APjAAAVMhn5/TwS91b0LE/GqqrcYR8AQGW14/8SeJHyrgjCa6VNBGKWT
        wGgv0rVxSYD4c/Og4B/YNpKp/WIob1cM/2SVGA==
X-Google-Smtp-Source: APXvYqz1pRqdLHsZJ6v7adCjiCuwEUNtG/aVqx8Kf1vfsRAqll0GVsbffAMnKewWt9yYsxHCla7JrcE26Y0aCEoDskw=
X-Received: by 2002:a05:620a:549:: with SMTP id o9mr17340620qko.223.1569242439684;
 Mon, 23 Sep 2019 05:40:39 -0700 (PDT)
MIME-Version: 1.0
References: <20190916153357.3880-1-horms+renesas@verge.net.au>
 <20190916153357.3880-2-horms+renesas@verge.net.au> <CAL_JsqJHiAmH0eeUMLH1q9X6e+88EVZrmMtM33rVWCyBAszY8A@mail.gmail.com>
 <20190919151014.4azdfh2feg5ot6no@verge.net.au> <CAL_Jsq+y5o-jBX9emVpW+q7n+Tde2ON0TqHmm9gFj7emUURL7Q@mail.gmail.com>
 <20190923115328.lpb5qeu6poacrb6y@verge.net.au>
In-Reply-To: <20190923115328.lpb5qeu6poacrb6y@verge.net.au>
From:   Rob Herring <robh+dt@kernel.org>
Date:   Mon, 23 Sep 2019 07:40:28 -0500
X-Gmail-Original-Message-ID: <CAL_JsqLVyuQTZo1CoxoesNM=FfDrXphYK8pfqFrGyeZLEi5pjg@mail.gmail.com>
Message-ID: <CAL_JsqLVyuQTZo1CoxoesNM=FfDrXphYK8pfqFrGyeZLEi5pjg@mail.gmail.com>
Subject: Re: [PATCH 1/2] dt-bindings: bus: simple-pm-bus: convert bindings to json-schema
To:     Simon Horman <horms@verge.net.au>
Cc:     Mark Rutland <mark.rutland@arm.com>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Magnus Damm <magnus.damm@gmail.com>,
        Yoshihiro Kaneko <ykaneko0929@gmail.com>,
        devicetree@vger.kernel.org,
        "open list:MEDIA DRIVERS FOR RENESAS - FCP" 
        <linux-renesas-soc@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

On Mon, Sep 23, 2019 at 6:53 AM Simon Horman <horms@verge.net.au> wrote:
>
> On Thu, Sep 19, 2019 at 02:33:58PM -0500, Rob Herring wrote:
> > On Thu, Sep 19, 2019 at 10:10 AM Simon Horman <horms@verge.net.au> wrote:
> > >
> > > On Tue, Sep 17, 2019 at 07:12:16AM -0500, Rob Herring wrote:
> > > > On Mon, Sep 16, 2019 at 10:35 AM Simon Horman
> > > > <horms+renesas@verge.net.au> wrote:
>
> ...
>
> > > > > +
> > > > > +  power-domains:
> > > > > +    # Required if clocks is absent, optional otherwise
> > > > > +    minItems: 1
> > > > > +
> > > > > +required:
> > > > > +  - compatible
> > > > > +  - '#address-cells'
> > > > > +  - '#size-cells'
> > > > > +  - ranges
> > > >
> > > > This will capture what you commented above:
> > > >
> > > > oneOf:
> > > >   - required:
> > > >       - clocks
> > > >   - required:
> > > >       - power-domains
> > >
> > > Thanks. Unfortunately dtbs_check does not seem happy
> > > if both clocks and power-domains are present.
> >
> > I was thinking it was either or. Use 'anyOf' instead.
>
> Thanks, perhaps the tooling needs updating to handle this.

Indeed. Now fixed.

Rob
