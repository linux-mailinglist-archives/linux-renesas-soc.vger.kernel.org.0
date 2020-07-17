Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 76E67223707
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 17 Jul 2020 10:30:58 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726569AbgGQIa5 (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Fri, 17 Jul 2020 04:30:57 -0400
Received: from mail-ot1-f65.google.com ([209.85.210.65]:35954 "EHLO
        mail-ot1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725864AbgGQIa4 (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 17 Jul 2020 04:30:56 -0400
Received: by mail-ot1-f65.google.com with SMTP id 72so6326077otc.3;
        Fri, 17 Jul 2020 01:30:55 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=SaPmcDUg77LU2p28w1+XxvJM/pkYFA+OmeunTanH6NM=;
        b=Op9uWwA9+uHBLKuFz/y/xTKj3USv53KLaLcX15rGFX98ghtNG7DcDG264YbKRjBnwb
         poGbj/mhMK+uhhd82hP+2XF12SULaufFoErAmB4+fck8tk3dpxN1MeyKjiREyhEZVwiO
         9meINp//qifOnbvB5mgzAByMPIKRgr/D+SrTzbyso8OqjQ0YdevQV2JyG3MT/hrWCZlZ
         8fQhnkmmLdPZXiQERZMTjqTDA6bnrSqwY2DcLVneiGh0S+ptu/UiAXLKzUt4Mu5L1snl
         RcJKX840HCM+sGuMcI2n4si5prP5TeklOzGtOoIRLo9Y0Swr1Uqk2SrRnthiM/oCaCn2
         OIDg==
X-Gm-Message-State: AOAM533zV5Q7lU0SKA03vYU0rJVD5kIl7gnoeydLhjYe3uEabxjrN7er
        D3ppYmt5oqpXRSlYHbp1c3vaH7NCdM+E8BlQdMQ=
X-Google-Smtp-Source: ABdhPJwBR4fz/v72KgD7+7gM2P5Tmqx8wLWOng1tBACwKN4gtmWwLhUzgHZdq7TTGK9C+gXsTQ9SgDG6nK730RSLp4E=
X-Received: by 2002:a9d:1b0d:: with SMTP id l13mr7734447otl.145.1594974655311;
 Fri, 17 Jul 2020 01:30:55 -0700 (PDT)
MIME-Version: 1.0
References: <1594971274-48027-1-git-send-email-biju.das.jz@bp.renesas.com>
 <20200717075452.GD68629@google.com> <TYBPR01MB5309AED7152585BD238DD013867C0@TYBPR01MB5309.jpnprd01.prod.outlook.com>
In-Reply-To: <TYBPR01MB5309AED7152585BD238DD013867C0@TYBPR01MB5309.jpnprd01.prod.outlook.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Fri, 17 Jul 2020 10:30:44 +0200
Message-ID: <CAMuHMdVvOa6GhVi8CZ6QNdY02KU6sOL4s0BS=vDM+u3a+7CaQw@mail.gmail.com>
Subject: Re: [PATCH 1/2] dt-bindings: update usb-c-connector required property
To:     Biju Das <biju.das.jz@bp.renesas.com>
Cc:     Prashant Malani <pmalani@chromium.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Brown <broonie@kernel.org>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>,
        Maxime Ripard <mripard@kernel.org>,
        Lee Jones <lee.jones@linaro.org>,
        Thierry Reding <treding@nvidia.com>,
        "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>,
        "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
        Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>,
        Heikki Krogerus <heikki.krogerus@linux.intel.com>,
        Felipe Balbi <balbi@kernel.org>,
        Chris Paterson <Chris.Paterson2@renesas.com>,
        Biju Das <biju.das@bp.renesas.com>,
        Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>,
        "linux-renesas-soc@vger.kernel.org" 
        <linux-renesas-soc@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi Biju,

On Fri, Jul 17, 2020 at 10:09 AM Biju Das <biju.das.jz@bp.renesas.com> wrote:
> > On Fri, Jul 17, 2020 at 08:34:33AM +0100, Biju Das wrote:
> > > Some boards have a single SS capable connector. Update usb-c-connector
> > > bindings to list port@1 as at least one of the required property.
> > >
> > > Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
> > > Signed-off-by: Lad Prabhakar <prabhakar.mahadev-
> > lad.rj@bp.renesas.com>
> > > ---
> > >  Ref: https://patchwork.kernel.org/patch/11129567/
> > > ---
> > >  Documentation/devicetree/bindings/connector/usb-connector.yaml | 7
> > > +++++--
> > >  1 file changed, 5 insertions(+), 2 deletions(-)
> > >
> > > diff --git
> > > a/Documentation/devicetree/bindings/connector/usb-connector.yaml
> > > b/Documentation/devicetree/bindings/connector/usb-connector.yaml
> > > index 9bd52e6..41e0685 100644
> > > --- a/Documentation/devicetree/bindings/connector/usb-connector.yaml
> > > +++ b/Documentation/devicetree/bindings/connector/usb-
> > connector.yaml
> > > @@ -139,8 +139,11 @@ properties:
> > >          description: Sideband Use (SBU), present in USB-C. This describes the
> > >            alternate mode connection of which SBU is a part.
> > >
> > > -    required:
> > > -      - port@0
> > > +    anyOf:
> > > +      - required:
> > > +        - port@0
> > > +      - required:
> > > +        - port@1
> >
> > So the connector[1] doesn't have any High Speed (D+/D-) lanes? Those are
> > supposed to be present on all Type C connectors.
>
> Yes , USB-TypeC connector has  USB3HS0_DP and USB3HS0_DM signals apart from USB3S0_CLK_P, USB3S0_CLK_M,USB3S0_RX_P,USB3S0_RX_M,USB3S0_TX_P,USB3S0_TX_M,
> USB3HS0_DP,USB3HS0_DM, USB30_PWEN and USB30_OVC.
>
> But the Connector is a SS Capable connector which supports UFP/DFP and DRP.

The SS lanes of the connector are tied to the HD3SS3220.
The D+/D- lanes of the connector are tied to the R-Car SoC directly.

Perhaps modelling the C connector as a child of the HD3SS3220 is the
issue?  If the C connector was a separate node, it could have port@1
point to the HD3SS3220, and port@0 to the SoC?
That means there needs to be a different way to link the HD3SS3220 and
the on-SoC usb3_peri0.  The current link between usb3_peri0 and
hd3ss3220_ep looks a bit strange to me, as the latter label points to
the C connector, not to the HD3SS3220 itself[2].

> > [1] : https://patchwork.kernel.org/patch/11129567/

[2] https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/arch/arm64/boot/dts/renesas/r8a774c0-cat874.dts

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
