Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 2EB8D162C5
	for <lists+linux-renesas-soc@lfdr.de>; Tue,  7 May 2019 13:26:58 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725859AbfEGL05 (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Tue, 7 May 2019 07:26:57 -0400
Received: from mail-ua1-f65.google.com ([209.85.222.65]:45883 "EHLO
        mail-ua1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725843AbfEGL05 (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 7 May 2019 07:26:57 -0400
Received: by mail-ua1-f65.google.com with SMTP id o33so5853169uae.12;
        Tue, 07 May 2019 04:26:56 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=GzIbaBNYhvg73WNlQRNk3CzE4k84hRDE8fYSBPKxE40=;
        b=GVgN56dBDlnFf/BdrtJmS0ZJONzE+aycMAePNyliE70cc02SHz5+WVKTsQDtNDBi1I
         QL1daimOdvsoDh2xYNfrkvlMMS0OtBUAW0vW4OzakRmL9eWsrMXrZ/TXU1PCcrwxFuFd
         ELbdCvuiXLqsP1IItGQtc6DBTEDDOWdTq+10FU+uiBGDGYEP5wT4EtAMorQ288AGcyDQ
         SV+oGeVRTXu4kUT0hCVlDrv+OqTYwjB89o1nahIoTLXRDidn+s5cAjWNqvo1RJnV7LFA
         HMXY28B4jlk9JmqslG0Su8xXHP9/74t6woVvCsW7bFyjsAUvG/rbysY9NhhY5mU/+5pB
         /b7Q==
X-Gm-Message-State: APjAAAVKAj8ZrX0q9g6Enx5HoRDoBL64aRMgXKeKnnVJT/JBiJXTdgzy
        H40auGKIu84AKquJuE0zQDjNSKSpq+bDGDwdL+4=
X-Google-Smtp-Source: APXvYqxTyUhJ/Hdo8EsC8xxMOq+d9o8jfyQHdB8O8C1WedZ2N/j7SQlvc68hbfmmLxXJgjTyJEb3+QqWuoJvl2277Ws=
X-Received: by 2002:ab0:1646:: with SMTP id l6mr437972uae.75.1557228415873;
 Tue, 07 May 2019 04:26:55 -0700 (PDT)
MIME-Version: 1.0
References: <20190506234631.113226-1-chris.brandt@renesas.com>
 <20190506234631.113226-2-chris.brandt@renesas.com> <CAMuHMdV3yW44Y1D2Vn1mNJK8pNF3db20An9Sde8=18r8y7m9LQ@mail.gmail.com>
 <TY1PR01MB1562D08E4F5A6C635024BE718A310@TY1PR01MB1562.jpnprd01.prod.outlook.com>
In-Reply-To: <TY1PR01MB1562D08E4F5A6C635024BE718A310@TY1PR01MB1562.jpnprd01.prod.outlook.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Tue, 7 May 2019 13:26:44 +0200
Message-ID: <CAMuHMdX0KyLcftYp9bP=SBr1KRncUAh1Ua=OmvpFjaTFy=gbOw@mail.gmail.com>
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

On Tue, May 7, 2019 at 1:00 PM Chris Brandt <Chris.Brandt@renesas.com> wrote:
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
> Good point. I've done that for other drivers before and it worked well.
>
> I'll take this out...one less property to set :)
>
> Question: Since the driver depends on this, should I mention this in the
> dt-bindings documentation ?

Yes, this should be described in the section about the clocks property.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
