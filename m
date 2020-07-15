Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id CEE56221148
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 15 Jul 2020 17:37:51 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725770AbgGOPhv (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Wed, 15 Jul 2020 11:37:51 -0400
Received: from mail-oi1-f196.google.com ([209.85.167.196]:38362 "EHLO
        mail-oi1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726776AbgGOPhv (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 15 Jul 2020 11:37:51 -0400
Received: by mail-oi1-f196.google.com with SMTP id r8so2528421oij.5;
        Wed, 15 Jul 2020 08:37:50 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=I8Y+iMIBLic68sY07uOSY3D6Exe00WfEOasrAyuGf+s=;
        b=R5R4eTBNNnULPKEihChFTlXSD6YrdiulPQmVnRnj+vWhmeMXYrXRqEG+ELNrSjgPoy
         1Hp3uPM0zE8cB68YNXTGuXSNqAKSZU7HMuJZVk2Z1CPKlCnLEtLegMP69Z84h+/M6tTO
         LupIF3AkeWCDUL2jdYK2HxrOIpzoZ7wJs5D9LJhjv8ES9++UoWv8c7UEwj+YgKHefVsA
         14Gwvsku/EnHZpRd1kn0HJUS/pjinvX0cBb/upw+JJ6K12Y1h9n+FOELkqNuLFYk25cD
         MeFWDsxzpXBKWhLXLdGNqo6rNkOGpKbp4vuggxv2sSYyyVaI44Tp/YYf1W+FVFx6xZ63
         wtwA==
X-Gm-Message-State: AOAM530dVXiYHHcQy0jetW+CBrXdCULVZ8xJEm1EmASjyZQw0ENZl8AH
        HZYKBWbNuSZnOwBniSEMjd1tGNuqrk/W879Pcqz+h6/C
X-Google-Smtp-Source: ABdhPJwtSILuH3tg5zL3hnRRNwNcfF1BCTz0ZqeqvqknIQPVE78txAnKpBzVTonE0yDuNLifqFhnvTOvFPe5ntBqUoc=
X-Received: by 2002:aca:ac10:: with SMTP id v16mr217670oie.153.1594827469906;
 Wed, 15 Jul 2020 08:37:49 -0700 (PDT)
MIME-Version: 1.0
References: <1567584941-13690-1-git-send-email-biju.das@bp.renesas.com>
 <1567584941-13690-2-git-send-email-biju.das@bp.renesas.com>
 <CAMuHMdVZkjGDFmeQ9XkOqq-ogfSZz99hd0=N-OYLai4UEzKwAQ@mail.gmail.com> <TYBPR01MB5309C98CD8BD3706394E4784867E0@TYBPR01MB5309.jpnprd01.prod.outlook.com>
In-Reply-To: <TYBPR01MB5309C98CD8BD3706394E4784867E0@TYBPR01MB5309.jpnprd01.prod.outlook.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Wed, 15 Jul 2020 17:37:38 +0200
Message-ID: <CAMuHMdWHqjuDFFrjK6C72fyFQPsvYy2qhZ5=RfPNXsG-_FXHyQ@mail.gmail.com>
Subject: Re: [PATCH RESEND v7 1/3] dt-bindings: usb: hd3ss3220 device tree
 binding document
To:     Biju Das <biju.das.jz@bp.renesas.com>
Cc:     Biju Das <biju.das@bp.renesas.com>,
        Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Heikki Krogerus <heikki.krogerus@linux.intel.com>,
        Felipe Balbi <balbi@kernel.org>,
        USB list <linux-usb@vger.kernel.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>, Simon Horman <horms@verge.net.au>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Chris Paterson <Chris.Paterson2@renesas.com>,
        Fabrizio Castro <fabrizio.castro@bp.renesas.com>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi Biju,

On Wed, Jul 15, 2020 at 1:42 PM Biju Das <biju.das.jz@bp.renesas.com> wrote:
> > Subject: Re: [PATCH RESEND v7 1/3] dt-bindings: usb: hd3ss3220 device tree
> > binding document
> >
> > On Wed, Sep 4, 2019 at 10:22 AM Biju Das <biju.das@bp.renesas.com>
> > wrote:
> > > Add device tree binding document for TI HD3SS3220 Type-C DRP port
> > > controller driver.
> > >
> > > Signed-off-by: Biju Das <biju.das@bp.renesas.com>
> > > Reviewed-by: Rob Herring <robh@kernel.org>
> >
> > > --- /dev/null
> > > +++ b/Documentation/devicetree/bindings/usb/ti,hd3ss3220.txt
> > > @@ -0,0 +1,38 @@
> > > +TI HD3SS3220 TypeC DRP Port Controller.
> > > +
> > > +Required properties:
> > > + - compatible: Must be "ti,hd3ss3220".
> > > + - reg: I2C slave address, must be 0x47 or 0x67 based on ADDR pin.
> > > + - interrupts: An interrupt specifier.
> > > +
> > > +Required sub-node:
> > > + - connector: The "usb-c-connector" attached to the hd3ss3220 chip. The
> > > +   bindings of the connector node are specified in:
> > > +
> > > +       Documentation/devicetree/bindings/connector/usb-connector.txt
> > > +
> > > +Example:
> > > +hd3ss3220@47 {
> > > +       compatible = "ti,hd3ss3220";
> > > +       reg = <0x47>;
> > > +       interrupt-parent = <&gpio6>;
> > > +       interrupts = <3 IRQ_TYPE_LEVEL_LOW>;
> > > +
> > > +       connector {
> > > +               compatible = "usb-c-connector";
> > > +               label = "USB-C";
> > > +               data-role = "dual";
> > > +
> > > +               ports {
> > > +                       #address-cells = <1>;
> > > +                       #size-cells = <0>;
> > > +
> > > +                       port@1 {
> >
> > This does not comply with
> > Documentation/devicetree/bindings/connector/usb-connector.yaml:
> >
> >     connector: ports: 'port@0' is a required property
>
> But in RZ/G2E case, the connector is a SS capable connector.  May be we need to update required property
> as port@0 or port@1? Please let me know
>
>  -    required:
>  -      - port@0
>  +    anyOf:
>  +      - required:
>  +          - port@0
>  +      - required:
>  +          - port@1

May make sense.
I'd like to defer to the USB experts, though.

> > > +                               reg = <1>;
> > > +                               hd3ss3220_ep: endpoint {
> > > +                                       remote-endpoint = <&usb3_role_switch>;
> > > +                               };
> > > +                       };
> > > +               };
> > > +       };
> > > +};

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
