Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8505E42D930
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 14 Oct 2021 14:20:56 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230431AbhJNMXA (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Thu, 14 Oct 2021 08:23:00 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38606 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230017AbhJNMW7 (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 14 Oct 2021 08:22:59 -0400
Received: from mail-lf1-x12a.google.com (mail-lf1-x12a.google.com [IPv6:2a00:1450:4864:20::12a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7813AC06174E
        for <linux-renesas-soc@vger.kernel.org>; Thu, 14 Oct 2021 05:20:54 -0700 (PDT)
Received: by mail-lf1-x12a.google.com with SMTP id r19so25631662lfe.10
        for <linux-renesas-soc@vger.kernel.org>; Thu, 14 Oct 2021 05:20:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ragnatech-se.20210112.gappssmtp.com; s=20210112;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:content-transfer-encoding:in-reply-to;
        bh=aEg5x4AVkWpua15/HSCgkbo2+YEZ1rQlTpXQmJEzzuo=;
        b=169eSdO2ZH1niKCmx2JEK+4FxPMfk1BlEb+fxhvErDgCejprPiohxLRmtExi1iv8W5
         SSY0zQHMhxqCLpfqSm4YP/lobwjh/PvroFgWWss9FXQvO0OqMebfsv5KV5Usl99LT+jT
         ZoZFCw139Vb0/lZYd3yYDZJuAPCfdRQEFbkzjQQ4ySs7HoLlJpVvQ+w+UzDEqBIihFmF
         bBgdbKHh/U/VTJJ+zL/5S75kyz/u19ih8pSkkEfUerTbE4Cpo7lsuLnin64k9tZJSZJ0
         oMp01NQmzpKCT2iUv9KYw4ICBsfYzrkuiiyG+5HcBuiY/z7ktNy/7g+BhlwpjOUt/o3X
         w55g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to;
        bh=aEg5x4AVkWpua15/HSCgkbo2+YEZ1rQlTpXQmJEzzuo=;
        b=fKm9BV6XDWSWJHjM5pEMYb+L7ulfbmNSh6K+o1MSu3WphC4OtjArtIbQ4QwyjGcijW
         O6NGcdRrlTc/IuI2CYPFdsXpao9zu/aqmY9i0KQdGcSRgIvRKNJ3Y9s28SaMDavGtTht
         yjaVgPHKUfekExm5l23lOllxlcNrVBZDTMuvrlwJATsnXfwa+O/8F3G6iRU3RFW95FNR
         hSaHvOl7PpiucSxsaZhZTNllAr0xS7LJmJAtMqiwpQUJnwIUYuX0LvzYWbsAaFcJotw/
         eLDhPa/Moud+W2BIuyk1QVTjWoYBOAhOg0JjtVLXtpeQPHbN6blJUuk0iHMeikm9F9qy
         qKcw==
X-Gm-Message-State: AOAM5313wOqhLGPllVRODzRvYjUoWzMg29bXaUZOeK43EAxvFLk+OPnG
        rarG4bK5dGUhND+KdK4LCultWg==
X-Google-Smtp-Source: ABdhPJzS8EfDArwZogyF4P6S9I0/5GID66hJd/miHaaK9jNkML45rZ5jFB3XImQRDX0iIXoGmm/qNw==
X-Received: by 2002:ac2:5d4b:: with SMTP id w11mr4649427lfd.676.1634214048937;
        Thu, 14 Oct 2021 05:20:48 -0700 (PDT)
Received: from localhost (h-46-59-88-219.A463.priv.bahnhof.se. [46.59.88.219])
        by smtp.gmail.com with ESMTPSA id p9sm215447lfe.3.2021.10.14.05.20.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 14 Oct 2021 05:20:48 -0700 (PDT)
Date:   Thu, 14 Oct 2021 14:20:47 +0200
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
Message-ID: <YWggnyImaPBf3IG8@oden.dyn.berto.se>
References: <20211012183324.717975-1-niklas.soderlund+renesas@ragnatech.se>
 <CAMuHMdX8LzmksfB85iSMX4+RYq=SYTamw5C3GNgbAV+9f1uAyQ@mail.gmail.com>
 <YWgK3c+8wHWw8IYM@oden.dyn.berto.se>
 <CAMuHMdWsLzLqVNdt2EGD20fMXxb3R70Hx3EyPHwLsFc82qAG8A@mail.gmail.com>
 <YWgW+ArZ48NeHr5F@oden.dyn.berto.se>
 <CAMuHMdVBVUvyVkjc80fJwuo+-XoEerhOx3QX3w2XtFYf-YY5=g@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAMuHMdVBVUvyVkjc80fJwuo+-XoEerhOx3QX3w2XtFYf-YY5=g@mail.gmail.com>
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi Geert,

On 2021-10-14 14:14:26 +0200, Geert Uytterhoeven wrote:
> Hi Niklas,
> 
> On Thu, Oct 14, 2021 at 1:39 PM Niklas S�derlund
> <niklas.soderlund+renesas@ragnatech.se> wrote:
> > On 2021-10-14 13:07:30 +0200, Geert Uytterhoeven wrote:
> > > On Thu, Oct 14, 2021 at 12:48 PM Niklas S�derlund
> > > <niklas.soderlund+renesas@ragnatech.se> wrote:
> > > > On 2021-10-13 17:08:44 +0200, Geert Uytterhoeven wrote:
> > > > > On Tue, Oct 12, 2021 at 8:48 PM Niklas S�derlund
> > > > > <niklas.soderlund+renesas@ragnatech.se> wrote:
> > > > > > Convert ADV748X analog video decoder documentation to json-schema.
> > >
> > > > > > --- /dev/null
> > > > > > +++ b/Documentation/devicetree/bindings/media/i2c/adv748x.yaml
> > >
> > > > > > +allOf:
> > > > > > +  - if:
> > > > > > +      properties:
> > > > > > +        compatible:
> > > > > > +          contains:
> > > > > > +            const: adi,adv7481
> > > > > > +    then:
> > > > > > +      properties:
> > > > > > +        interrupts:
> > > > > > +          minItems: 1
> > > > > > +          maxItems: 3
> > > > > > +
> > > > > > +        interrupt-names:
> > > > > > +          minItems: 1
> > > > > > +          items:
> > > > > > +            - enum: [ intrq1, intrq2, intrq3 ]
> > > > > > +            - enum: [ intrq1, intrq2, intrq3 ]
> > > > > > +            - enum: [ intrq1, intrq2, intrq3 ]
> > > > >
> > > > > They can really appear in any order?
> > > >
> > > > Yes, as not all interrupt lines may be wired up. It would be nice to
> > > > enforce that intrq2 must come before intrq3 if both are wired but I'm
> > > > not sure how to express that.
> > >
> > > You mean
> > >
> > >     items:
> > >       - const: intrq1
> > >       - const: intrq2
> > >       - const: intrq3
> >
> > Will this not enforce that if intrq2 is present intrq1 must be too?
> >
> > >
> > > ?
> > >
> > > If the first two might be exchanged, you can still fix the last one:
> > >
> > >     items:
> > >       - const: [ intrq1, intrq2 ]
> > >       - const: [ intrq1, intrq2 ]
> > >       - const: intrq3
> >
> > Same here, will this not fail if only intrq3 is given?
> 
> Right. And these combinations are all valid?

Yes, there is two or three depending on model irq pins on the device 
itself and all, none or any combination of them could be wired up.

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
