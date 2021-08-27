Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 83C8B3F9F5B
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 27 Aug 2021 20:59:10 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230446AbhH0S6u (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Fri, 27 Aug 2021 14:58:50 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54772 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230284AbhH0S6t (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 27 Aug 2021 14:58:49 -0400
Received: from mail-ej1-x636.google.com (mail-ej1-x636.google.com [IPv6:2a00:1450:4864:20::636])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9D4F8C061757;
        Fri, 27 Aug 2021 11:58:00 -0700 (PDT)
Received: by mail-ej1-x636.google.com with SMTP id x11so16038008ejv.0;
        Fri, 27 Aug 2021 11:58:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=pFgF/5yzy8h/uQFvUpdFC8Vraw1yd6xUZU7Dag6hLSI=;
        b=oGwTmpZvNFI0ClOuczO7mD72azHgn5pORuZzoy5WZJ5awI1Z8ek+8eziGsqBlsEAzI
         B5c9aXmt9S+RmWrb6i22fwzsCs5S+2UFPetrJ9nfO3usGqRt+HAJTzY0jCPi42x4nuQd
         gXPKjW84VACZ7QymK38tiYwJMFW9HCwsbKc9RDjzCvY5P6tRRwBSaicIJq2bXgdfdU5v
         +CImNQ5JpHS0uZ4gjdKe0mJzs6adzchFLAQJwHvCzJjiBdSzY0ZYoA8RXvGn28Klaxit
         xIS5aaLfzDTuhUkunysnhRQ3u0rwHCJI2dUNv9hM7Teq5XdjV8B2LtWrBq8uIe5qYY3w
         5E0Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=pFgF/5yzy8h/uQFvUpdFC8Vraw1yd6xUZU7Dag6hLSI=;
        b=eZKFWJ9FmKTWOXbEL+LhOLS8jkydqfzw496GoLY+pBPgx0JOz2HLFRb+315e8DosCU
         fiOGO4/uLmHXc8oSvUnbBRRRJ69JnN/mDVA5mI1kAEBq2UHnKWvy4YOAQOQuMw+JUl2A
         g9qmU4xfZ1gzuwKR5bsdf5g+vQsV7rmR4e/bb88vwPWVy2C8kLDB8kCGOgGihQJWZ/Ff
         xbYhmjvvcoum/dae725sABHDlxNBBxJDgrcFKZRtEQ06GSGbFW1ir33OYBDDFIshDThp
         kr0pP+g8X0fydriDKS7qXOsMaVZTO1yCXgbtDsIXHHWnSAiNJGVY+Tc7G3D8dA9UIYTL
         lztg==
X-Gm-Message-State: AOAM532lqwFNdW9MmZ/vnrk/HJskcJ8UDd6b+LN5YEK2eTJfsZnGDGS8
        1NG+6owDnahhmPd7FW7aW3JOOIpBjKJ2CaOJp4J9voiK3DcWnw==
X-Google-Smtp-Source: ABdhPJz6iozh/3D2nGo2kcbEHGLGPEI5fUuzht04Z7PM9AgJzjkjGN+KjfBctNQzrCntj3g3cO59qg+X5JPu+zUt2zI=
X-Received: by 2002:a17:906:93ef:: with SMTP id yl15mr11692083ejb.229.1630090678983;
 Fri, 27 Aug 2021 11:57:58 -0700 (PDT)
MIME-Version: 1.0
References: <20210630173042.186394-1-aford173@gmail.com> <20210630173042.186394-2-aford173@gmail.com>
 <CAMuHMdXoWZMj8+LhUPSpqa4t-G1WrW-wfOy3XzEDe0ihSKQkCw@mail.gmail.com> <TY2PR01MB3692DA5F92178F1ECC31BACDD8009@TY2PR01MB3692.jpnprd01.prod.outlook.com>
In-Reply-To: <TY2PR01MB3692DA5F92178F1ECC31BACDD8009@TY2PR01MB3692.jpnprd01.prod.outlook.com>
From:   Adam Ford <aford173@gmail.com>
Date:   Fri, 27 Aug 2021 13:57:48 -0500
Message-ID: <CAHCN7xJrP9Aug6jQzWqdSZ3Tr1_A9qhssc6SYW0rS-VE9Yg9PA@mail.gmail.com>
Subject: Re: [PATCH 2/3] usb: renesas_usbhs: Enable support for more than two clks
To:     Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
Cc:     Geert Uytterhoeven <geert@linux-m68k.org>,
        USB list <linux-usb@vger.kernel.org>,
        Adam Ford-BE <aford@beaconembedded.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Rob Herring <robh+dt@kernel.org>,
        Magnus Damm <magnus.damm@gmail.com>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

On Thu, Jul 1, 2021 at 6:34 AM Yoshihiro Shimoda
<yoshihiro.shimoda.uh@renesas.com> wrote:
>
> Hi Adam, Geert-san,
>
> > From: Geert Uytterhoeven, Sent: Thursday, July 1, 2021 6:07 PM
> <snip>
> > To: Adam Ford <aford173@gmail.com>
> > Cc: USB list <linux-usb@vger.kernel.org>; Adam Ford-BE <aford@beaconembedded.com>; Greg Kroah-Hartman
> > <gregkh@linuxfoundation.org>; Rob Herring <robh+dt@kernel.org>; Magnus Damm <magnus.damm@gmail.com>; Yoshihiro Shimoda
> > <yoshihiro.shimoda.uh@renesas.com>; open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS
> > <devicetree@vger.kernel.org>; Linux Kernel Mailing List <linux-kernel@vger.kernel.org>; Linux-Renesas
> > <linux-renesas-soc@vger.kernel.org>
> > Subject: Re: [PATCH 2/3] usb: renesas_usbhs: Enable support for more than two clks
> >
> > Hi Adam,
> >
> > Thanks for your patch!
> >
> > On Wed, Jun 30, 2021 at 7:30 PM Adam Ford wrote:
> <snip>
> > > diff --git a/drivers/usb/renesas_usbhs/common.c b/drivers/usb/renesas_usbhs/common.c
> > > index 3af91b2b8f76..255e4bd68ed3 100644
> > > --- a/drivers/usb/renesas_usbhs/common.c
> > > +++ b/drivers/usb/renesas_usbhs/common.c
> <snip>
> > > @@ -309,11 +311,13 @@ static int usbhsc_clk_get(struct device *dev, struct usbhs_priv *priv)
> > >          * To backward compatibility with old DT, this driver checks the return
> > >          * value if it's -ENOENT or not.
> > >          */
> > > -       priv->clks[1] = of_clk_get(dev_of_node(dev), 1);
> > > -       if (PTR_ERR(priv->clks[1]) == -ENOENT)
> > > -               priv->clks[1] = NULL;
> > > -       else if (IS_ERR(priv->clks[1]))
> > > -               return PTR_ERR(priv->clks[1]);
> > > +       for (i = 1; i < ARRAY_SIZE(priv->clks); i++) {
> > > +               priv->clks[1] = of_clk_get(dev->of_node, i);
>
> s/clks[1]/[i]/
>
> > > +               if (PTR_ERR(priv->clks[i]) == -ENOENT)
> > > +                       priv->clks[i] = NULL;
> > > +               else if (IS_ERR(priv->clks[i]))
> > > +                       return PTR_ERR(priv->clks[i]);
> > > +       }
> >
> > This is identical to the current code, as ARRAY_SIZE(priv->clks) == 2.
> > Probably you wanted to increase usbhs_priv.clks[], too?

Thanks for the review.  Sorry for my delayed response.  I broke my
wrist on the evening on June 30, and I was on medical leave for 6
weeks.  I am now trying to get caught up to where I was.
>
> I think so.
> # I realized the clks array is only 2, so that this driver cannot
> # enable usb2_clksel...
>
> > Does it make sense to start using the clk_bulk*() API?
>
> clk_bulk*() API seems to need clock-names property.
> Is my understanding correct? However, the hsusb nodes doesn't
> have the property for now...

The usb2_clksel has the names "ehci_ohci" and "hs-usb-if" for <&cpg
CPG_MOD 703> and <&cpg CPG_MOD 704>, respectively.

What if I add the clock-names property, then switch to the clk_bulk
IO?  I think we can just turn them all on together if that's
acceptable

adam


>
> Best regards,
> Yoshihiro Shimoda
>
