Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 3804937543
	for <lists+linux-renesas-soc@lfdr.de>; Thu,  6 Jun 2019 15:32:56 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727419AbfFFNcv (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Thu, 6 Jun 2019 09:32:51 -0400
Received: from kirsty.vergenet.net ([202.4.237.240]:41744 "EHLO
        kirsty.vergenet.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726924AbfFFNcv (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 6 Jun 2019 09:32:51 -0400
Received: from reginn.horms.nl (watermunt.horms.nl [80.127.179.77])
        by kirsty.vergenet.net (Postfix) with ESMTPA id 359FD25B77A;
        Thu,  6 Jun 2019 23:32:49 +1000 (AEST)
Received: by reginn.horms.nl (Postfix, from userid 7100)
        id D0F1F940356; Thu,  6 Jun 2019 15:32:46 +0200 (CEST)
Date:   Thu, 6 Jun 2019 15:32:46 +0200
From:   Simon Horman <horms@verge.net.au>
To:     Nguyen An Hoan <na-hoan@jinso.co.jp>
Cc:     linux-renesas-soc@vger.kernel.org,
        ramesh.shanmugasundaram@bp.renesas.com,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        kuninori.morimoto.gx@renesas.com, magnus.damm@gmail.com,
        yoshihiro.shimoda.uh@renesas.com, h-inayoshi@jinso.co.jp,
        cv-dong@jinso.co.jp
Subject: Re: [PATCH 1/2] media: dt-bindings: media: Add r8a77965 DRIF bindings
Message-ID: <20190606133244.yso6l5ivaat4jwyo@verge.net.au>
References: <1556014199-12698-1-git-send-email-na-hoan@jinso.co.jp>
 <20190423105046.cshmwghdufaqp4pj@verge.net.au>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20190423105046.cshmwghdufaqp4pj@verge.net.au>
Organisation: Horms Solutions BV
User-Agent: NeoMutt/20170113 (1.7.2)
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

On Tue, Apr 23, 2019 at 12:50:46PM +0200, Simon Horman wrote:
> On Tue, Apr 23, 2019 at 07:09:58PM +0900, Nguyen An Hoan wrote:
> > From: Hoan Nguyen An <na-hoan@jinso.co.jp>
> > 
> > Add r8a77965 DRIF bindings.
> > 
> > Signed-off-by: Hoan Nguyen An <na-hoan@jinso.co.jp>
> 
> According to the User's Manual Hardware, v1.50 Nov 20 2019,
> the DRIF IP block M3-N (r8a77965) has a BITCTR register which
> is not present on the H3 (r8a7795) or M3-W (r8a77995).
> 
> Does the DRIF IP block present on the M3-N (r8a77965) function
> without support for this register in the driver?
> 
> If not then I think that:
> 1) This patch should be updated to note that renesas,rcar-gen3-drif
>    can only be used with H3 (r8a7795) and M3-W (r8a77995).
> 2) A driver patch is required
> 3) The DT patch, 2/2 of this series, should be updated to
>    i) Not use renesas,rcar-gen3-drif
>    ii) Extend the register aperture from 0x64 to 0x84.

Hi,

I'm wondering what the status of this patchset it.

> 
> > ---
> >  Documentation/devicetree/bindings/media/renesas,drif.txt | 1 +
> >  1 file changed, 1 insertion(+)
> > 
> > diff --git a/Documentation/devicetree/bindings/media/renesas,drif.txt b/Documentation/devicetree/bindings/media/renesas,drif.txt
> > index 0d8974a..16cdee3 100644
> > --- a/Documentation/devicetree/bindings/media/renesas,drif.txt
> > +++ b/Documentation/devicetree/bindings/media/renesas,drif.txt
> > @@ -41,6 +41,7 @@ Required properties of an internal channel:
> >  -------------------------------------------
> >  - compatible:	"renesas,r8a7795-drif" if DRIF controller is a part of R8A7795 SoC.
> >  		"renesas,r8a7796-drif" if DRIF controller is a part of R8A7796 SoC.
> > +		"renesas,r8a77965-drif" if DRIF controller is a part of R8A77965 SoC.
> >  		"renesas,rcar-gen3-drif" for a generic R-Car Gen3 compatible device.
> >  
> >  		When compatible with the generic version, nodes must list the
> > -- 
> > 2.7.4
> > 
> 
