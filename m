Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 0CA3B796D5
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 29 Jul 2019 21:56:44 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2404230AbfG2Tzz (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Mon, 29 Jul 2019 15:55:55 -0400
Received: from mail-lj1-f193.google.com ([209.85.208.193]:43971 "EHLO
        mail-lj1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2404249AbfG2Tzv (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 29 Jul 2019 15:55:51 -0400
Received: by mail-lj1-f193.google.com with SMTP id y17so35206234ljk.10
        for <linux-renesas-soc@vger.kernel.org>; Mon, 29 Jul 2019 12:55:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ragnatech-se.20150623.gappssmtp.com; s=20150623;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:content-transfer-encoding:in-reply-to
         :user-agent;
        bh=5AIV3bhDTMo2KA4dIrmXwLSUtBSIQ7oOV6EAOsD1k0A=;
        b=rwAinQNsrHsXyutJABCo3H9CAJc9UBVAAtCGiQvTGPFVqIK879udYEVtNolfL0F8qI
         D3UAnSrBHg6mVbCcmJQZWFIuDEf3Qbw5h0k7HwmG4Q/+S8xyNODugp/kHHg91vNnmkG7
         ZE5i+WI7TBpu9+0cZrg8rENYgOCj4KYppcxSfBqjhKku1HcOurq7QvW8fhTVgSd9/w6p
         hjLxYkJnXteTIM5pqQ/X+PlJ5+fs6sXxBA3VL4aKdFZe9r/kQLAVb7CLGnNpKjcd23Mi
         9ryExjkHAGOSAPH4RfURTNmND2CsU4oa7S/9gNBqD0Xv3DwG/dUR7PUVX3M8ZbPwQNt+
         mnCw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to:user-agent;
        bh=5AIV3bhDTMo2KA4dIrmXwLSUtBSIQ7oOV6EAOsD1k0A=;
        b=Qe1CGBW0lr396/mmfE3vms/8SpzMUySgmhAwEVPyrfZf/wJFMqJaHmXPRtUJ8fHR6k
         JvU8+Dq3rBXOTGHxvl9f8BzWWD4rlDFZ16HzEmKDLxn9gPCi13+enL5yp1qRSZjgm/ds
         wgCocD+cibiOBz9ZDPIlHhw8Gel08oPGj/idTWTTWluVedwwnF/zPbpcwBfkG3FB3qdY
         dV5cOP0qqTThyBedunrbTPEUrcoWgr9m6yCvXaKKFtR+wCjP8yTxfLMbjsreAzMVDDWL
         DlsDM5WagxX6F0EKnvkFE0DHQC3JuQypW6fPTkOqEhybWo+ZVj4XBPYAkxp3dxd4uUFo
         COJw==
X-Gm-Message-State: APjAAAVflJzgFBj1cxAVj6z7Zd0QayTU2Sd4eiGlfFY6Vl0rqeybhNCZ
        zZWlTM38HGRoTryWfQZPxQVR5DAA
X-Google-Smtp-Source: APXvYqyI4jdiPFxEKXAoJCx+bBq8QVKIIwFJ54C0wjZO0MWQirKCMKXIY7bOlSXh5TMGWEHJITlOeg==
X-Received: by 2002:a2e:9048:: with SMTP id n8mr12238028ljg.37.1564430148831;
        Mon, 29 Jul 2019 12:55:48 -0700 (PDT)
Received: from localhost (customer-145-14-112-32.stosn.net. [145.14.112.32])
        by smtp.gmail.com with ESMTPSA id v17sm14577614ljg.36.2019.07.29.12.55.48
        (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
        Mon, 29 Jul 2019 12:55:48 -0700 (PDT)
Date:   Mon, 29 Jul 2019 21:55:47 +0200
From:   Niklas =?iso-8859-1?Q?S=F6derlund?= 
        <niklas.soderlund+renesas@ragnatech.se>
To:     Simon Horman <horms@verge.net.au>
Cc:     Rob Herring <robh+dt@kernel.org>, devicetree@vger.kernel.org,
        linux-media@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Ulrich Hecht <uli+renesas@fpond.eu>
Subject: Re: [PATCH v2] dt-bindings: rcar-{csi2,vin}: Rename bindings
 documentation files
Message-ID: <20190729195547.GG3186@bigcity.dyn.berto.se>
References: <20190612211241.1455-1-niklas.soderlund+renesas@ragnatech.se>
 <20190712071703.GE9317@wyvern>
 <20190729074355.urlf77ihukgnk6ov@verge.net.au>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20190729074355.urlf77ihukgnk6ov@verge.net.au>
User-Agent: Mutt/1.12.1 (2019-06-15)
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi,

On 2019-07-29 09:43:55 +0200, Simon Horman wrote:
> On Fri, Jul 12, 2019 at 04:17:03PM +0900, Niklas Söderlund wrote:
> > Hi,
> > 
> > A gentle ping on this patch. I assume if it could get a ack from Rob it 
> > could be taken in thru the media-tree?
> 
> Given the lack of interest I think it could also be taken through
> Geert's tree.

I would be happy if that could happen thru Geert's tree.

> 
> > 
> > On 2019-06-12 23:12:41 +0200, Niklas Söderlund wrote:
> > > Renesas media binding documentation files uses a naming schema of
> > > 'renesas,<module>.txt'. Rename VIN and CSI-2 files to match this
> > > pattern.
> > > 
> > > Signed-off-by: Niklas Söderlund <niklas.soderlund+renesas@ragnatech.se>
> > > Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
> > > Reviewed-by: Ulrich Hecht <uli+renesas@fpond.eu>
> > > ---
> > >  .../media/{renesas,rcar-csi2.txt => renesas,csi2.txt}         | 0
> > >  .../bindings/media/{rcar_vin.txt => renesas,vin.txt}          | 0
> > >  MAINTAINERS                                                   | 4 ++--
> > >  3 files changed, 2 insertions(+), 2 deletions(-)
> > >  rename Documentation/devicetree/bindings/media/{renesas,rcar-csi2.txt => renesas,csi2.txt} (100%)
> > >  rename Documentation/devicetree/bindings/media/{rcar_vin.txt => renesas,vin.txt} (100%)
> > > 
> > > diff --git a/Documentation/devicetree/bindings/media/renesas,rcar-csi2.txt b/Documentation/devicetree/bindings/media/renesas,csi2.txt
> > > similarity index 100%
> > > rename from Documentation/devicetree/bindings/media/renesas,rcar-csi2.txt
> > > rename to Documentation/devicetree/bindings/media/renesas,csi2.txt
> > > diff --git a/Documentation/devicetree/bindings/media/rcar_vin.txt b/Documentation/devicetree/bindings/media/renesas,vin.txt
> > > similarity index 100%
> > > rename from Documentation/devicetree/bindings/media/rcar_vin.txt
> > > rename to Documentation/devicetree/bindings/media/renesas,vin.txt
> > > diff --git a/MAINTAINERS b/MAINTAINERS
> > > index 6a3bac28ebb47830..a0d21ff13c8e8989 100644
> > > --- a/MAINTAINERS
> > > +++ b/MAINTAINERS
> > > @@ -9807,8 +9807,8 @@ L:	linux-media@vger.kernel.org
> > >  L:	linux-renesas-soc@vger.kernel.org
> > >  T:	git git://linuxtv.org/media_tree.git
> > >  S:	Supported
> > > -F:	Documentation/devicetree/bindings/media/renesas,rcar-csi2.txt
> > > -F:	Documentation/devicetree/bindings/media/rcar_vin.txt
> > > +F:	Documentation/devicetree/bindings/media/renesas,csi2.txt
> > > +F:	Documentation/devicetree/bindings/media/renesas,vin.txt
> > >  F:	drivers/media/platform/rcar-vin/
> > >  
> > >  MEDIA DRIVERS FOR RENESAS - VSP1
> > > -- 
> > > 2.21.0
> > > 
> > 
> > -- 
> > Regards,
> > Niklas Söderlund
> > 

-- 
Regards,
Niklas Söderlund
