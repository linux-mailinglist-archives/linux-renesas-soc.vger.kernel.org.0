Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 01908167EF
	for <lists+linux-renesas-soc@lfdr.de>; Tue,  7 May 2019 18:32:59 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726265AbfEGQc6 (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Tue, 7 May 2019 12:32:58 -0400
Received: from mail-vs1-f68.google.com ([209.85.217.68]:32893 "EHLO
        mail-vs1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726197AbfEGQc6 (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 7 May 2019 12:32:58 -0400
Received: by mail-vs1-f68.google.com with SMTP id z145so10797982vsc.0;
        Tue, 07 May 2019 09:32:57 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=xfZ+nPfJalivsFUof8XfkbfxeRXadcob2dPu22J78FE=;
        b=fXgkkodcnkRkgqOKPo7Lo23rHK9gmlTUyDkeg8WbYvjt/AmJJTseE8R446j9Ibxr3K
         eTv9g9c2TMbp8916ViJXf8vs0VKRiVXjkzkrdii+/HiFcoxWsnlohQh0re3RcIpKxeb5
         SfX8F9KBw0whfZMsDqbazwNBBaN7HYIfFDgd0qj26zZw3hY1sg+pY/D4xdVovmWyvg85
         oHhrpXFw3wOBVmWPWGgs3r/7IHhWaPiX4jkBCJpgflDhXakQcKaoHAkgGnVmxQeYy7kA
         /sn79S8T02Cu65B2f5ZhCF5B/mREmgHsRLie3fLPE+giL5HseVMmapLi3oVNaHmt4E2V
         R+Fw==
X-Gm-Message-State: APjAAAUqlm+y6FuIXWwdFJbO+TdYYepo7tdk/hNchdZ9DPiwzA8y1mkW
        VCTNWYoQNWshLoRxaq6zK/Elo8r65jA7que6tME=
X-Google-Smtp-Source: APXvYqwnBOm/31+1n0uOIej23iQ7zEwFHV7MPPxuNGseA0JkCWZ9jKf5bC8Pf3dai9+n75aDdCcSS3EpAwX0z+b1ukA=
X-Received: by 2002:a67:ba07:: with SMTP id l7mr16617093vsn.11.1557246776403;
 Tue, 07 May 2019 09:32:56 -0700 (PDT)
MIME-Version: 1.0
References: <20190506234631.113226-1-chris.brandt@renesas.com>
 <20190506234631.113226-2-chris.brandt@renesas.com> <CAMuHMdV3yW44Y1D2Vn1mNJK8pNF3db20An9Sde8=18r8y7m9LQ@mail.gmail.com>
 <TY1PR01MB15621F21D3A3F1F550D85CD68A310@TY1PR01MB1562.jpnprd01.prod.outlook.com>
In-Reply-To: <TY1PR01MB15621F21D3A3F1F550D85CD68A310@TY1PR01MB1562.jpnprd01.prod.outlook.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Tue, 7 May 2019 18:32:44 +0200
Message-ID: <CAMuHMdWBR-069LJZ12pe1azystGp7egzYjKYFVkuRwMoukvzrQ@mail.gmail.com>
Subject: Re: [PATCH 01/10] phy: renesas: rcar-gen3-usb2: Add uses_usb_x1 option
To:     Chris Brandt <Chris.Brandt@renesas.com>
Cc:     Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Simon Horman <horms@verge.net.au>,
        Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>,
        USB list <linux-usb@vger.kernel.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi Chris,

On Tue, May 7, 2019 at 5:43 PM Chris Brandt <Chris.Brandt@renesas.com> wrote:
> On Tue, May 07, 2019, Geert Uytterhoeven wrote:
> > > +       if (of_property_read_bool(dev->of_node, "renesas,uses_usb_x1"))
> > > +               channel->uses_usb_x1 = true;
> > > +
> >
> > Perhaps this can be checked some other way (e.g. by checking for a non-
> > zero
> > clock rate of the USB_X1 clock referenced from DT), thus removing the need
> > for
> > adding a custom property?
>
> Currently, there is no USB_X1 in DT like there is for RZ/A1.
>
> For RZ/A2, those are dedicated pins that belong to the USB HW block
> itself. They do not feed into the system CPG or any dividers, so I
> never included it in the .dtsi.

Like pcie_bus_clk on R-Car?
We do have that in DT, with a "clock" link to it from the PCIe device node.
After all, it is provided by an external clock crystal, and consumed by the
PCIe device.

> So with that said, does a uses-usb-x1 property make more sense?

No ;-)

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
