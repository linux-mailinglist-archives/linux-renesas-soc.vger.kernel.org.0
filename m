Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 8AF18E44C7
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 25 Oct 2019 09:45:38 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2437123AbfJYHpi (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Fri, 25 Oct 2019 03:45:38 -0400
Received: from mail-oi1-f194.google.com ([209.85.167.194]:36340 "EHLO
        mail-oi1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1731944AbfJYHpi (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 25 Oct 2019 03:45:38 -0400
Received: by mail-oi1-f194.google.com with SMTP id j7so940312oib.3;
        Fri, 25 Oct 2019 00:45:37 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=s6ZC++eR+Anvq5w5y2toT3ro/1GmNiaawbRNGBDM50Y=;
        b=qA1zxFah6vxcYrisH/RrG6cgK8CCAmUSxV1MbwNJZ6DqB0ADmpsM2/nk8sh+BSL0rh
         gael0Q7PdkHAsbvnDgapS5oevlHLfP0lBTBEt+Lt1DVhR6RqzX9irHSkyqnc9lNe8qR7
         Etj5NwIzebhRVP38HZeKTuxq5d+9rK6xIQ8W/r9zHv+QWpjNBkO05Cw/LLZ87QYHE9au
         IE9hd/wQ0XE4RbJFdPESazny1NnS3dBYmKfc2WRnBk7dKzZY+THZfMHAxix8RDu4oGrT
         nIAAOa61l37Ljy/rrLb0aHp8KoiOflOYuWJ1NjIXWBb803+NCHMtHGeyusXiy8N21ozx
         E/vQ==
X-Gm-Message-State: APjAAAUFiQOJ7PhFCkkC9SI00kHY7u3SpMh+P0IHCjDJe2km6E0WBat7
        KdWscS6oBN7goquFrKyje3fII3m0LtLK7/e7Plw=
X-Google-Smtp-Source: APXvYqwrJVHLeRWEm8u0/pVLScO1RueLURI19t5fuFsx6fFs9yX3/eVfltzcs95hGJA2rxAlGpZXVbs1xyVphVRpSQs=
X-Received: by 2002:a05:6808:3b4:: with SMTP id n20mr1684536oie.131.1571989537298;
 Fri, 25 Oct 2019 00:45:37 -0700 (PDT)
MIME-Version: 1.0
References: <1571915821-1620-1-git-send-email-yoshihiro.shimoda.uh@renesas.com>
 <1571915821-1620-2-git-send-email-yoshihiro.shimoda.uh@renesas.com>
 <CAMuHMdXLOh3j-CFb3008DkXVAmq2MWCSW0SqzPoBBeq5v1qwoA@mail.gmail.com> <TYAPR01MB45447511CC1DE9D16E031927D8650@TYAPR01MB4544.jpnprd01.prod.outlook.com>
In-Reply-To: <TYAPR01MB45447511CC1DE9D16E031927D8650@TYAPR01MB4544.jpnprd01.prod.outlook.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Fri, 25 Oct 2019 09:45:26 +0200
Message-ID: <CAMuHMdVCOCCy1MUiP04FGr9zVLbKDby-owbcMMwUNa7-MfcJgA@mail.gmail.com>
Subject: Re: [PATCH 1/3] dt-bindings: clock: renesas: rcar-usb2-clock-sel: Fix
 clock[-name]s properties
To:     Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
Cc:     Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        linux-clk <linux-clk@vger.kernel.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi Shimoda-san,

On Fri, Oct 25, 2019 at 3:29 AM Yoshihiro Shimoda
<yoshihiro.shimoda.uh@renesas.com> wrote:
> > From: Geert Uytterhoeven, Sent: Thursday, October 24, 2019 8:46 PM
> > On Thu, Oct 24, 2019 at 1:17 PM Yoshihiro Shimoda
> > <yoshihiro.shimoda.uh@renesas.com> wrote:
> > > Since the hardware requires to enable both USB 2.0 host and peripheral
> > > functional clock, this patch fixes the documentation.
> > > Fortunately, no one has this device node for now, so that we don't
> > > need to think of backward compatibility.
> > >
> > > Fixes: 311accb64570 ("clk: renesas: rcar-usb2-clock-sel: Add R-Car USB 2.0 clock selector PHY")
> > > Signed-off-by: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
> >
> > Thanks four your patch!
> >
> > Looks good to me, so
> > Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
>
> Thank you for your review!
>
> > I'm just wondering about the inconsistent use of "_" and "-" in clock
> > names, but I don't have a better suggestion ("hs-usb-if", "usb_extal",
> > and "usb_xtal" do match the datasheet), so let's ignore my OCD ;-)
>
> I intended to match the names with the datasheet, but "ehci_ohci" doesn't match though...
> So, should I change the "ehci_ohci" to "ehci/ohci"?

I think that's up to you.  Both are fine to me.
Given this is USB2, using "ehci" only may be fine, too.

Note that
  - the only other clock with a slash in its name in the datasheet is
    "ths/thc", which we call "thermal" in the clock drivers,
  - the "ehci/ohci" clocks are called "ehciN" or "usb-ehci" in the clock
    drivers.
Nothing relies on those names, though, and they're not part of any ABI,
unlike the ehci/ohci clock input in this binding.

> > > --- a/Documentation/devicetree/bindings/clock/renesas,rcar-usb2-clock-sel.txt
> > > +++ b/Documentation/devicetree/bindings/clock/renesas,rcar-usb2-clock-sel.txt
> > > @@ -38,7 +38,8 @@ Required properties:
> > >  - reg: offset and length of the USB 2.0 clock selector register block.
> > >  - clocks: A list of phandles and specifier pairs.
> > >  - clock-names: Name of the clocks.
> > > - - The functional clock must be "ehci_ohci"
> > > + - The functional clock of USB 2.0 host side must be "ehci_ohci"
> >
> > "_" means "and".
> >
> > > + - The functional clock of HS-USB side must be "hs-usb-if"
> >
> > "-" means concatenation of terms.
> >
> > >   - The USB_EXTAL clock pin must be "usb_extal"
> > >   - The USB_XTAL clock pin must be "usb_xtal"
> >
> > "_" means concatenation of terms.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
