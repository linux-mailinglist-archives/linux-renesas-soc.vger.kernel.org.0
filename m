Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B558D42D854
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 14 Oct 2021 13:39:41 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231190AbhJNLlp (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Thu, 14 Oct 2021 07:41:45 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57396 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231183AbhJNLlo (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 14 Oct 2021 07:41:44 -0400
Received: from mail-lf1-x12a.google.com (mail-lf1-x12a.google.com [IPv6:2a00:1450:4864:20::12a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8AC2BC061570
        for <linux-renesas-soc@vger.kernel.org>; Thu, 14 Oct 2021 04:39:39 -0700 (PDT)
Received: by mail-lf1-x12a.google.com with SMTP id n8so25503766lfk.6
        for <linux-renesas-soc@vger.kernel.org>; Thu, 14 Oct 2021 04:39:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ragnatech-se.20210112.gappssmtp.com; s=20210112;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:content-transfer-encoding:in-reply-to;
        bh=0dmeydzjhaUi1kEyRO+tb4cDfJwd9a/eF0Dg2+vEquw=;
        b=2AueeCKKy9ILP/UiZl+F8fvvaaVmLXBx/d4uZ6k98hdUJIVBfA5QWLLkSNdx6RYdr+
         jmMs4hbEAA+zDBy5zNRriTNaQaTIdgg1FFQIiV/bBj2pO1WWZHw4EwC78D/uBB71FTjp
         DrS63xLNcpD9lxKqNt6J4U7r+KznQLRuBtA+fd0t/i2N1f7Ic4ZcGV6a0C9pyD8IxBt4
         ZEK5Yb372dYpgGhSzgI5domlkoqHIEPdNsRKszt8MWCFlY2teqPjUTwszoJtMpuMyrRU
         bo0YB8DbswvqXB4AToZIMJ9nU6DMgd/rveJsLUpcyxUmN6uLVlmes+b99Pr7UQ5bDeMl
         uw8w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to;
        bh=0dmeydzjhaUi1kEyRO+tb4cDfJwd9a/eF0Dg2+vEquw=;
        b=aHN2hs+G6kUJAwWAbOcp6gX1o8dtGYI2CtpWmfUQrTd179oTUcMEkrooplIoecJ1Zm
         AFHYzMd8ZVX8CN2jsk5peuuVGnABGYgDAwGB5OwTbAZHEV3ltNHAix0sbc4X44bTA/dk
         +X0AhLTH4i963sV/6W1xSkODIaVmLYNTS9aDKs453/f7Bl2KAGo0Rr/011zfsOd00+oN
         KPKl7wpX5+0tJze1ePl2ZPafzLBVMeLD/76aQbQKqceRvCUG8NYaPpQCtw95+f3TtFse
         4W83wV4iM2ddEh9R8xDHguWkNA3B1r+Oe2rk1HDnTbdtMMSaXszWKMQKkyvX+S99xTyA
         F7pA==
X-Gm-Message-State: AOAM530QwI2snN2M1bmX+XAmcEVmxNd3w0ijOLOpsxSfsDFzPrUwoGUT
        7oYtX/mV3QyWFp0LfgA3nnBWfQ==
X-Google-Smtp-Source: ABdhPJxepoSD617Qvj7aawKidSUQxI0Uz5yaRoelAIbImt2LucJ3idusCV/Mtxdzuim+F8F/+Y/lsw==
X-Received: by 2002:a05:6512:3b7:: with SMTP id v23mr4774988lfp.127.1634211577829;
        Thu, 14 Oct 2021 04:39:37 -0700 (PDT)
Received: from localhost (h-46-59-88-219.A463.priv.bahnhof.se. [46.59.88.219])
        by smtp.gmail.com with ESMTPSA id r14sm206650lfe.13.2021.10.14.04.39.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 14 Oct 2021 04:39:37 -0700 (PDT)
Date:   Thu, 14 Oct 2021 13:39:36 +0200
From:   Niklas =?iso-8859-1?Q?S=F6derlund?= 
        <niklas.soderlund+renesas@ragnatech.se>
To:     Geert Uytterhoeven <geert@linux-m68k.org>
Cc:     Rob Herring <robh+dt@kernel.org>,
        Kieran Bingham <kieran.bingham@ideasonboard.com>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>,
        Linux Media Mailing List <linux-media@vger.kernel.org>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>
Subject: Re: [PATCH] dt-bindings: adv748x: Convert bindings to json-schema
Message-ID: <YWgW+ArZ48NeHr5F@oden.dyn.berto.se>
References: <20211012183324.717975-1-niklas.soderlund+renesas@ragnatech.se>
 <CAMuHMdX8LzmksfB85iSMX4+RYq=SYTamw5C3GNgbAV+9f1uAyQ@mail.gmail.com>
 <YWgK3c+8wHWw8IYM@oden.dyn.berto.se>
 <CAMuHMdWsLzLqVNdt2EGD20fMXxb3R70Hx3EyPHwLsFc82qAG8A@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAMuHMdWsLzLqVNdt2EGD20fMXxb3R70Hx3EyPHwLsFc82qAG8A@mail.gmail.com>
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi Geert,

On 2021-10-14 13:07:30 +0200, Geert Uytterhoeven wrote:
> Hi Niklas,
> 
> On Thu, Oct 14, 2021 at 12:48 PM Niklas S�derlund
> <niklas.soderlund+renesas@ragnatech.se> wrote:
> > On 2021-10-13 17:08:44 +0200, Geert Uytterhoeven wrote:
> > > On Tue, Oct 12, 2021 at 8:48 PM Niklas S�derlund
> > > <niklas.soderlund+renesas@ragnatech.se> wrote:
> > > > Convert ADV748X analog video decoder documentation to json-schema.
> 
> > > > --- /dev/null
> > > > +++ b/Documentation/devicetree/bindings/media/i2c/adv748x.yaml
> 
> > > > +allOf:
> > > > +  - if:
> > > > +      properties:
> > > > +        compatible:
> > > > +          contains:
> > > > +            const: adi,adv7481
> > > > +    then:
> > > > +      properties:
> > > > +        interrupts:
> > > > +          minItems: 1
> > > > +          maxItems: 3
> > > > +
> > > > +        interrupt-names:
> > > > +          minItems: 1
> > > > +          items:
> > > > +            - enum: [ intrq1, intrq2, intrq3 ]
> > > > +            - enum: [ intrq1, intrq2, intrq3 ]
> > > > +            - enum: [ intrq1, intrq2, intrq3 ]
> > >
> > > They can really appear in any order?
> >
> > Yes, as not all interrupt lines may be wired up. It would be nice to
> > enforce that intrq2 must come before intrq3 if both are wired but I'm
> > not sure how to express that.
> 
> You mean
> 
>     items:
>       - const: intrq1
>       - const: intrq2
>       - const: intrq3

Will this not enforce that if intrq2 is present intrq1 must be too?

> 
> ?
> 
> If the first two might be exchanged, you can still fix the last one:
> 
>     items:
>       - const: [ intrq1, intrq2 ]
>       - const: [ intrq1, intrq2 ]
>       - const: intrq3

Same here, will this not fail if only intrq3 is given?

> 
> Gr{oetje,eeting}s,
> 
>                         Geert
> 
> -- 
> Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org
> 
> In personal conversations with technical people, I call myself a hacker. But
> when I'm talking to journalists I just say "programmer" or something like that.
>                                 -- Linus Torvalds

-- 
Regards,
Niklas S�derlund
