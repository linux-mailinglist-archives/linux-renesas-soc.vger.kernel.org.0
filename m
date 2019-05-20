Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id D61C123313
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 20 May 2019 13:55:31 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731282AbfETLzb (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Mon, 20 May 2019 07:55:31 -0400
Received: from kirsty.vergenet.net ([202.4.237.240]:36588 "EHLO
        kirsty.vergenet.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730773AbfETLza (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 20 May 2019 07:55:30 -0400
Received: from reginn.horms.nl (watermunt.horms.nl [80.127.179.77])
        by kirsty.vergenet.net (Postfix) with ESMTPA id BB41725AEBF;
        Mon, 20 May 2019 21:55:28 +1000 (AEST)
Received: by reginn.horms.nl (Postfix, from userid 7100)
        id B6D159404D4; Mon, 20 May 2019 13:55:26 +0200 (CEST)
Date:   Mon, 20 May 2019 13:55:26 +0200
From:   Simon Horman <horms@verge.net.au>
To:     Rob Herring <robh+dt@kernel.org>
Cc:     Fabrizio Castro <fabrizio.castro@bp.renesas.com>,
        Mark Rutland <mark.rutland@arm.com>,
        Magnus Damm <magnus.damm@gmail.com>,
        Thierry Reding <treding@nvidia.com>,
        Andreas =?utf-8?Q?F=C3=A4rber?= <afaerber@suse.de>,
        Jonathan Cameron <Jonathan.Cameron@huawei.com>,
        Kevin Hilman <khilman@baylibre.com>,
        Jagan Teki <jagan@amarulasolutions.com>,
        Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>,
        Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
        "open list:MEDIA DRIVERS FOR RENESAS - FCP" 
        <linux-renesas-soc@vger.kernel.org>, devicetree@vger.kernel.org,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Chris Paterson <Chris.Paterson2@renesas.com>,
        Biju Das <biju.das@bp.renesas.com>, xu_shunji@hoperun.com
Subject: Re: [PATCH v3 1/2] dt-bindings: Add vendor prefix for HopeRun
Message-ID: <20190520115526.zhhinfb52szptrtl@verge.net.au>
References: <1558085189-22061-1-git-send-email-fabrizio.castro@bp.renesas.com>
 <1558085189-22061-2-git-send-email-fabrizio.castro@bp.renesas.com>
 <CAL_JsqJCJyRBX+08UriNeYZ01ow0yLv=VjK3sNbjVi1GB5=MQA@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAL_JsqJCJyRBX+08UriNeYZ01ow0yLv=VjK3sNbjVi1GB5=MQA@mail.gmail.com>
Organisation: Horms Solutions BV
User-Agent: NeoMutt/20170113 (1.7.2)
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

On Fri, May 17, 2019 at 08:38:14AM -0500, Rob Herring wrote:
> On Fri, May 17, 2019 at 4:27 AM Fabrizio Castro
> <fabrizio.castro@bp.renesas.com> wrote:
> >
> > Add "Jiangsu HopeRun Software Co., Ltd." to the list of devicetree
> > vendor prefixes as "hoperun".
> >
> > Website: http://www.hoperun.com/en
> >
> > Signed-off-by: Fabrizio Castro <fabrizio.castro@bp.renesas.com>
> > Reviewed-by: Chris Paterson <Chris.Paterson2@renesas.com>
> >
> > ---
> > v2->v3:
> > * Moved to vendor-prefixes.yaml
> > * Dropped Reviewed-by Simon as this is a completely new patch and as
> >   such it needs a brand new review
> > v1->v2:
> > * No change
> > ---
> >  Documentation/devicetree/bindings/vendor-prefixes.yaml | 2 ++
> >  1 file changed, 2 insertions(+)
> 
> Reviewed-by: Rob Herring <robh@kernel.org>

Thanks, applied for inclusion in v5.3 via the renesas tree.
