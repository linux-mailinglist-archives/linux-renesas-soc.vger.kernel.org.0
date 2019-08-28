Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 255619FB29
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 28 Aug 2019 09:09:11 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726247AbfH1HJK (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Wed, 28 Aug 2019 03:09:10 -0400
Received: from mail-oi1-f196.google.com ([209.85.167.196]:46217 "EHLO
        mail-oi1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726232AbfH1HJK (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 28 Aug 2019 03:09:10 -0400
Received: by mail-oi1-f196.google.com with SMTP id t24so1267145oij.13;
        Wed, 28 Aug 2019 00:09:09 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=9FsThRDcg+k2Dr684L8KVWxW5KjryCyiCqSRb/xOOG0=;
        b=ShnJ961eBW8Va3EUYXWuNM0uizQC3FXvvTdwBPWNNeZZAKQ3GdxBOUkne0fVklwWMq
         qLpMUni74i5wA8syfF82vim7hgKeb/OcvVl1IiFiXV6VZpICXyrstDOEbyShxG6C3c70
         oCsrq8inpEnjIddjc0pD3lYFLa6hEJb0VUTRuDU3qmmnDfxsNZxwP9yp2xH/HVO7erUQ
         yrFOfg3UrKUDXBeUtTcMrOMYIlY0n8obtvzZ1/jq5kHJeRbzBdaZyqLwQnh2x4kbi3d2
         dGcQ97j7/uRWHGIEGJtgTaDEzmin3UZDTo5NBe8QOYff5KCagE7vy3nu87YYO2LvP/OJ
         9FbA==
X-Gm-Message-State: APjAAAU9k+2AiC6lmprIfG+DBmYg10pa99NXZUqtCrt5RrbVRK1lQjhu
        fHOfgxdpJK3o+TXxomcLf66alnoyd3p5otWiROs=
X-Google-Smtp-Source: APXvYqzLJHEnZbEaTY5aM6a+1SHPK7RYxxyirzKGszuPsNqvtii2vK5KF8lGGoBK2OG2DiPNnfnJ5Ch6Jg0b5t3pJi0=
X-Received: by 2002:aca:f4ca:: with SMTP id s193mr1629090oih.131.1566976149085;
 Wed, 28 Aug 2019 00:09:09 -0700 (PDT)
MIME-Version: 1.0
References: <1566900127-11148-1-git-send-email-yoshihiro.shimoda.uh@renesas.com>
 <1566900127-11148-2-git-send-email-yoshihiro.shimoda.uh@renesas.com>
 <CAMuHMdW4xa=RFqUdCEs1v3MuqAFwpXoW=tvcdEocqe3eeCpd=Q@mail.gmail.com> <TYAPR01MB45444BB3119058B6932C98AED8A30@TYAPR01MB4544.jpnprd01.prod.outlook.com>
In-Reply-To: <TYAPR01MB45444BB3119058B6932C98AED8A30@TYAPR01MB4544.jpnprd01.prod.outlook.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Wed, 28 Aug 2019 09:08:58 +0200
Message-ID: <CAMuHMdXpsSmTFrBim3JYQ2wRtjb+FfcY4ds4c1NGfVCjichWxQ@mail.gmail.com>
Subject: Re: [PATCH 1/4] usb: host: xhci-plat: add quirks member into struct xhci_plat_priv
To:     Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
Cc:     Greg KH <gregkh@linuxfoundation.org>,
        Mathias Nyman <mathias.nyman@intel.com>,
        USB list <linux-usb@vger.kernel.org>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi Shimoda-san,

On Wed, Aug 28, 2019 at 6:05 AM Yoshihiro Shimoda
<yoshihiro.shimoda.uh@renesas.com> wrote:
> > From: Geert Uytterhoeven, Sent: Tuesday, August 27, 2019 9:36 PM
> > On Tue, Aug 27, 2019 at 12:05 PM Yoshihiro Shimoda
> > <yoshihiro.shimoda.uh@renesas.com> wrote:
> > > To simplify adding xhci->quirks instead of the .init_quirk()
> > > function, this patch adds a new parameter "quirks" into
> > > the struct xhci_plat_priv.
> > >
> > > Signed-off-by: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
> >
> > Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
>
> Thank you for your review!
>
> > > --- a/drivers/usb/host/xhci-plat.h
> > > +++ b/drivers/usb/host/xhci-plat.h
> > > @@ -12,10 +12,12 @@
> > >
> > >  struct xhci_plat_priv {
> > >         const char *firmware_name;
> > > +       unsigned long long quirks;
> > >         void (*plat_start)(struct usb_hcd *);
> > >         int (*init_quirk)(struct usb_hcd *);
> > >         int (*resume_quirk)(struct usb_hcd *);
> > >  };
> > >
> > >  #define hcd_to_xhci_priv(h) ((struct xhci_plat_priv *)hcd_to_xhci(h)->priv)
> > > +#define xhci_to_priv(x) ((struct xhci_plat_priv *)(x)->priv)
> >
> > Just wondering: is x->priv guaranteed to be of type struct xhci_plat_priv *,
> > also in the future?
> >
> >     struct xhci_hcd {
> >             ...
> >             unsigned long           priv[0] __aligned(sizeof(s64));
>
> It seems so. But, I'm not sure that we can change type of the priv[0] to
> struct xhci_plat_priv *, because this implementation is related to all usb_hcd drivers:
>
> < Details if you are interested in :) >

Thank you! Not being familiar with the usb and xhci subsystem, I couldn't
find where it was used/allocated, hence my question.

This confirms it's always of type struct xhci_plat_priv * iff when dealing with
the xhci-plat driver.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
