Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id ABD3DB54C3
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 17 Sep 2019 19:59:15 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727668AbfIQR6i (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Tue, 17 Sep 2019 13:58:38 -0400
Received: from mail-oi1-f194.google.com ([209.85.167.194]:37623 "EHLO
        mail-oi1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726017AbfIQR6h (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 17 Sep 2019 13:58:37 -0400
Received: by mail-oi1-f194.google.com with SMTP id i16so3683757oie.4;
        Tue, 17 Sep 2019 10:58:37 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=7dX3IYhgH+re5ug66qG47rfti7dbGb0gT2E31r+ps6E=;
        b=f8oG1j4rhHbS/tTZSFl2YvWItOWxK08+3xULzjQsHnQTPdGVQgWOwJr+qWTW4DCwpO
         7HVvvg5oUwnjbY1WmEbaLZXmys8HNcnbxjqlB+5PPc1Zuhw7OzquV+vdljC7D38d6AaK
         mJOjcEU6f2GxaHhBNcgj1Zao7PziAEIpUB7INlGQC7yLfMib2f9HYRIXXFJPIRUmizHo
         qMvO/PvCFw414K1mMKntUhKtULzvXf2HMMeakt/VFYyFCqFmgEoNuUNNiq7mEfSqhd3Y
         S79wJ2womXYl2w/PP4ky8wfJrxLrciB0ANC66Xjae270Pte4bCfz3B4cCjOesnbpHFVi
         TjLg==
X-Gm-Message-State: APjAAAWpjLLZr9W3sUzcjyIJl0x8pRDj6e1yicZddHyG8+fW6Bpx3gDk
        lZ6kG4iP1HWunDkyt4mMMw==
X-Google-Smtp-Source: APXvYqz6w6TOJ/O28uXBl30U4/ItHlYTLyX3bChwJpVDFlJIQYgFMGxvKNq5LJV/Lja3JMrrIhJ3sw==
X-Received: by 2002:aca:52cd:: with SMTP id g196mr4827415oib.163.1568743116659;
        Tue, 17 Sep 2019 10:58:36 -0700 (PDT)
Received: from localhost (24-155-109-49.dyn.grandenetworks.net. [24.155.109.49])
        by smtp.gmail.com with ESMTPSA id g4sm850712otj.42.2019.09.17.10.58.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Sep 2019 10:58:35 -0700 (PDT)
Date:   Tue, 17 Sep 2019 12:58:35 -0500
From:   Rob Herring <robh@kernel.org>
To:     Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>
Cc:     Jacopo Mondi <jacopo+renesas@jmondi.org>,
        laurent.pinchart@ideasonboard.com, geert@linux-m68k.org,
        horms@verge.net.au, uli+renesas@fpond.eu,
        VenkataRajesh.Kalakodima@in.bosch.com, airlied@linux.ie,
        daniel@ffwll.ch, koji.matsuoka.xm@renesas.com, muroya@ksk.co.jp,
        Harsha.ManjulaMallikarjun@in.bosch.com,
        linux-renesas-soc@vger.kernel.org, dri-devel@lists.freedesktop.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        mark.rutland@arm.com
Subject: Re: [PATCH v4 2/9] dt-bindings: display, renesas,du: Document cmms
 property
Message-ID: <20190917175835.GA6900@bogus>
References: <20190906135436.10622-1-jacopo+renesas@jmondi.org>
 <20190906135436.10622-3-jacopo+renesas@jmondi.org>
 <2bcbb30c-db36-38a1-dcff-4f4269c11ad6@ideasonboard.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <2bcbb30c-db36-38a1-dcff-4f4269c11ad6@ideasonboard.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

On Wed, Sep 11, 2019 at 05:06:33PM +0100, Kieran Bingham wrote:
> Hi Jacopo,
> 
> On 06/09/2019 14:54, Jacopo Mondi wrote:
> > Document the newly added 'cmms' property which accepts a list of phandle
> > and channel index pairs that point to the CMM units available for each
> > Display Unit output video channel.
> > 
> > Signed-off-by: Jacopo Mondi <jacopo+renesas@jmondi.org>
> > Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> > ---
> >  Documentation/devicetree/bindings/display/renesas,du.txt | 5 +++++
> >  1 file changed, 5 insertions(+)
> > 
> > diff --git a/Documentation/devicetree/bindings/display/renesas,du.txt b/Documentation/devicetree/bindings/display/renesas,du.txt
> > index c97dfacad281..1773b0a2f54f 100644
> > --- a/Documentation/devicetree/bindings/display/renesas,du.txt
> > +++ b/Documentation/devicetree/bindings/display/renesas,du.txt
> > @@ -45,6 +45,10 @@ Required Properties:
> >      instance that serves the DU channel, and the channel index identifies the
> >      LIF instance in that VSP.
> > 
> > +  - renesas,cmms: A list of phandles to the CMM instances present in the SoC,
> > +    one for each available DU channel. The property shall not be specified for
> > +    SoCs that do not provide any CMM (such as V3M and V3H).
> > +
> >  Required nodes:
> > 
> >  The connections to the DU output video ports are modeled using the OF graph
> > @@ -91,6 +95,7 @@ Example: R8A7795 (R-Car H3) ES2.0 DU
> >  			 <&cpg CPG_MOD 721>;
> >  		clock-names = "du.0", "du.1", "du.2", "du.3";
> >  		vsps = <&vspd0 0>, <&vspd1 0>, <&vspd2 0>, <&vspd0 1>;
> > +		renesas,cmms = <&cmm0 &cmm1 &cmm2 &cmm3>;
> 
> Should these be comma separated in the same fashion as the vsps are
> separated?

Yes. Doesn't matter from a dtb standpoint, but the schema are going to 
be stricter here. Bracket each unit.

With that,

Reviewed-by: Rob Herring <robh@kernel.org>

> 
> I don't really mind either way though ...
> 
> Reviewed-by: Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>
> 
> 
> > 
> >  		ports {
> >  			#address-cells = <1>;
> > --
> > 2.23.0
> > 
> 
