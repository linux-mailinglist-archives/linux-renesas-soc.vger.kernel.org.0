Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 03BDC1067A5
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 22 Nov 2019 09:17:12 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726248AbfKVIRL (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Fri, 22 Nov 2019 03:17:11 -0500
Received: from mail-oi1-f193.google.com ([209.85.167.193]:44122 "EHLO
        mail-oi1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726018AbfKVIRL (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 22 Nov 2019 03:17:11 -0500
Received: by mail-oi1-f193.google.com with SMTP id s71so5736069oih.11;
        Fri, 22 Nov 2019 00:17:08 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=DJo4vfxxl1oKIKBoTdQ8ejtdj8PnMHYEMD6i3YuZlAs=;
        b=FNXudrj+IXY17Ruf8MpnZvM14DF6B4V1snhHm+EeclbCvxG/EuzdUQ5/f9Sr1Smdzv
         QLHije+oPSexHYFBcXs5Pwp9FAeSWeJw0XA7gP+6WvF7z1tdEe8+x6kJhfQKE7+9kj6e
         9FASLh4kFvrlP6K11f5k9fcbPvXqN0IkWysXVaZeWq+XDmT2TWQvLj1WXkOlLMlLEtSa
         QxaiOOaUv6qWMztkFHEmNWmVS+wGVqz9dRnEw9cu+0fz6hBI+EcF9OPg/5bQkoe+Dsbu
         oJZspmMvmBpyVpERoiPYgcLVl0e+Aq0224keXdBZDHLde0w9vMY0dN6r+7BWDFB1mxpS
         mtlQ==
X-Gm-Message-State: APjAAAVbEINoaVhyy4OnbEN3i3Xq1wVH9JI3MYVO51p2TZGmmceh22mz
        9wUVZMJJavTtZD3UlNM8jcSca957w6dH0y2EBDE=
X-Google-Smtp-Source: APXvYqyxpSAAgRzK5HVf1Uh7n2CT8QBYeAAhY8rTpl49PZ121SmriIiXqBl94099KvU1Gl3TLM8YIRSXVeR9N7jCw10=
X-Received: by 2002:a05:6808:5d9:: with SMTP id d25mr11249890oij.54.1574410627939;
 Fri, 22 Nov 2019 00:17:07 -0800 (PST)
MIME-Version: 1.0
References: <1573660292-10629-1-git-send-email-fabrizio.castro@bp.renesas.com>
 <1573660292-10629-13-git-send-email-fabrizio.castro@bp.renesas.com>
 <20191119001616.GL5171@pendragon.ideasonboard.com> <TY1PR01MB17706CE49FF46891A398C6A6C04C0@TY1PR01MB1770.jpnprd01.prod.outlook.com>
 <20191119215155.GB17590@pendragon.ideasonboard.com> <TY1PR01MB1770BF7EE9488A746632E1E0C04E0@TY1PR01MB1770.jpnprd01.prod.outlook.com>
In-Reply-To: <TY1PR01MB1770BF7EE9488A746632E1E0C04E0@TY1PR01MB1770.jpnprd01.prod.outlook.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Fri, 22 Nov 2019 09:16:56 +0100
Message-ID: <CAMuHMdVXu+yXyMbM0RtqAEgZbeu1gz4osjkEPjNQmqwbYM-pOg@mail.gmail.com>
Subject: Re: [PATCH v4 12/13] [HACK] drm/bridge: lvds-codec: Enforce device
 specific compatible strings
To:     Fabrizio Castro <fabrizio.castro@bp.renesas.com>
Cc:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Neil Armstrong <narmstrong@baylibre.com>,
        David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Andrzej Hajda <a.hajda@samsung.com>,
        Simon Horman <horms@verge.net.au>,
        Magnus Damm <magnus.damm@gmail.com>,
        Peter Rosin <peda@axentia.se>,
        "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
        "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
        "linux-renesas-soc@vger.kernel.org" 
        <linux-renesas-soc@vger.kernel.org>,
        Chris Paterson <Chris.Paterson2@renesas.com>,
        Biju Das <biju.das@bp.renesas.com>,
        Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
        Jacopo Mondi <jacopo+renesas@jmondi.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi Fabrizio,

On Thu, Nov 21, 2019 at 5:00 PM Fabrizio Castro
<fabrizio.castro@bp.renesas.com> wrote:
> > From: devicetree-owner@vger.kernel.org <devicetree-owner@vger.kernel.org> On Behalf Of Laurent Pinchart
> > Sent: 19 November 2019 21:52
> > Subject: Re: [PATCH v4 12/13] [HACK] drm/bridge: lvds-codec: Enforce device specific compatible strings
> >
> > On Tue, Nov 19, 2019 at 11:17:34AM +0000, Fabrizio Castro wrote:
> > > On 19 November 2019 00:16 Laurent Pinchart wrote:
> > > > On Wed, Nov 13, 2019 at 03:51:31PM +0000, Fabrizio Castro wrote:
> > > > > The lvds-codec driver is a generic stub for transparent LVDS
> > > > > encoders and decoders.
> > > > > It's good practice to list a device specific compatible string
> > > > > before the generic fallback (if any) in the DT node for the relevant
> > > > > LVDS encoder/decoder, and it's also required by the dt-bindings.
> > > > > A notable exception to the generic fallback mechanism is the case
> > > > > of "thine,thc63lvdm83d", as documented in:
> > > > > Documentation/devicetree/bindings/display/bridge/thine,thc63lvdm83d.txt
> > > > > This patch enforces the adoption of a device specific compatible
> > > > > string (as fist string in the list), by using markers for the
> > > > > compatible string we match against and the index of the matching
> > > > > compatible string in the list.
> > > > >
> > > > > Signed-off-by: Fabrizio Castro <fabrizio.castro@bp.renesas.com>
> > > > >
> > > > > ---
> > > > > Hi Laurent,
> > > > >
> > > > > I don't think we need to do anything in the driver to address your
> > > > > comment, as we can "enforce" this with the bindings (please see the
> > > > > next patch, as it would help with the "enforcing" of the compatible
> > > > > string for the thine device).
> > > > > I am sending this patch only so that you can see what a possible
> > > > > solution in the driver could look like.
> > > > >
> > > > > v3->v4:
> > > > > * New patch addressing the below comment from Laurent:
> > > > > "I think the lvds-decoder driver should error out at probe time if only
> > > > > one compatible string is listed."

> > > > > --- a/drivers/gpu/drm/bridge/lvds-codec.c
> > > > > +++ b/drivers/gpu/drm/bridge/lvds-codec.c

> > > > > @@ -65,7 +70,30 @@ static int lvds_codec_probe(struct platform_device *pdev)
> > > > >         if (!lvds_codec)
> > > > >                 return -ENOMEM;
> > > > >
> > > > > -       lvds_codec->connector_type = (u32)of_device_get_match_data(&pdev->dev);
> > > > > +       lvds_codec->data = of_device_get_match_data(&pdev->dev);
> > > > > +       if (!lvds_codec->data)
> > > > > +               return -EINVAL;
> > > > > +
> > > > > +       /*
> > > > > +        * If we haven't matched a device specific compatible string, we need
> > > > > +        * to work out if the generic compatible string we matched against was
> > > > > +        * listed first in the compatible property.
> > > > > +        */
> > > >
> > > > Can't we do this unconditionally, and thus drop the lvds_codec_data
> > > > structure ?
> > >
> > > I don't think so, and the reason for this is that we have a corner case for
> > > thine,thc63lvdm83d. Here is what's allowed (according to the documentation)
> > > from what's supported upstream (+ this series):
> > > "ti,ds90c185", "lvds-encoder"
> > > "ti,ds90c187", "lvds-encoder"
> > > "ti,sn75lvds83", "lvds-encoder"
> > > "ti,ds90cf384a", "lvds-decoder"
> > > "thine,thc63lvdm83d"
> > >
> > > As you can see from the examples above, in most cases it's enough to say it's
> > > all good when we match a compatible string with index > 0, but for the thine
> > > device you _have_ to match the string with index 0 as that's what's currently
> > > documented (please see thine,thc63lvdm83d.txt) and that's what's supported
> > > by device trees already (please see arch/arm/boot/dts/r8a7779-marzen.dts).
> >
> > How about the following logic ?
> >
> >       if (match_index("lvds-encoder") == 0 ||
> >           match_index("lvds-decoder") == 0)
> >               return -EINVAL;
> >
> >
>
> Now I see what you mean
>
> > > This patch "classifies" compatible strings, and it considers a good match
> > > device specific compatible strings, or generic compatible strings as long
> > > as they are not listed first.
> > >
> > > These days you can leverage the yaml files to validate the device trees,
> > > therefore we should be focusing on writing yaml files in such a way we only
> > > pass the checks we mean to, and by checks I mean:
> > > make dtbs_check
> > >
> > > or more specifically, for this series:
> > > make dtbs_check  DT_SCHEMA_FILES=Documentation/devicetree/bindings/display/bridge/lvds-codec.yaml
> > >
> > > and that's of course on top of make dt_binding_check.
> >
> > Sure, but that doesn't prevent anyone ignoring the validation.
> >
> > > It's a very common requirement to have a part number specific compatible
> > > string first followed by a generic (fallback) compatible string in the device trees,
> > > most drivers for Renesas SoCs have similar requirements.
> > >
> > > If we start doing this here, we'll end up doing it elsewhere as well, and I really
> > > think we shouldn't, but others may see things differently, so I'll wait for others
> > > (and yourself with further comments) to jump in before doing any more work
> > > on this patch.
> >
> > I agree with this argument, it would set a precedent, and is probably
> > not worth duplicating similar code in all drivers. I wonder if this is
> > something we could handle with core helpers, but maybe it's overkill.
>
> I was hoping others would comment as well, but perhaps this topic is not too exciting.
>
> Geert, what do you think about this? Is this something we should enforce
> in drivers?

So IIUIC, you want to enforce the presence of both specific and generic
compatible values (in that order) in the driver (except for
"thine,thc63lvdm83d", as that predates the introduction of the generic
compatible value)?
However, the driver would not really care about the actual hardware-specific
value, as it would still match against the generic one, and the
hardware-specific one may not even be listed in the driver's match table?

By definition, you can have one or more compatible values listed in a
device node, from most-specific to least-specific.  Typically the driver
cannot know if a more specific value is missing, but YAML DT binding
validation can.

In this case it is a bit special, as there is a generic one involved, so
you can assume there should be a more specific one, too.
If you want to handle this in the core, you probably need to add an
"is_generic" flag to struct of_device_id.

Rob/Mark?

> > > > > +       if (!lvds_codec->data->device_specific) {
> > > > > +               const struct of_device_id *match;
> > > > > +               int compatible_index;
> > > > > +
> > > > > +               match = of_match_node(dev->driver->of_match_table,
> > > > > +                                     dev->of_node);
> > > > > +               compatible_index = of_property_match_string(dev->of_node,
> > > > > +                                                           "compatible",
> > > > > +                                                           match->compatible);
> > > > > +               if (compatible_index == 0) {
> > > > > +                       dev_err(dev, "Device specific compatible needed\n");
> > > > > +                       return -EINVAL;

-ENODEV?
So a "more generic" driver can take over?

> > > > > +               }
> > > > > +       }
> > > > > +
> > > > >         lvds_codec->powerdown_gpio = devm_gpiod_get_optional(dev, "powerdown",
> > > > >                                                              GPIOD_OUT_HIGH);
> > > > >         if (IS_ERR(lvds_codec->powerdown_gpio)) {
> > > > > @@ -92,7 +120,7 @@ static int lvds_codec_probe(struct platform_device *pdev)
> > > > >
> > > > >         lvds_codec->panel_bridge =
> > > > >                 devm_drm_panel_bridge_add_typed(dev, panel,
> > > > > -                                               lvds_codec->connector_type);
> > > > > +                                       lvds_codec->data->connector_type);
> > > > >         if (IS_ERR(lvds_codec->panel_bridge))
> > > > >                 return PTR_ERR(lvds_codec->panel_bridge);
> > > > >
> > > > > @@ -119,18 +147,33 @@ static int lvds_codec_remove(struct platform_device *pdev)
> > > > >         return 0;
> > > > >  }
> > > > >
> > > > > +static const struct lvds_codec_data lvds_codec_decoder_data = {
> > > > > +       .connector_type = DRM_MODE_CONNECTOR_DPI,
> > > > > +       .device_specific = false,
> > > > > +};
> > > > > +
> > > > > +static const struct lvds_codec_data lvds_codec_encoder_data = {
> > > > > +       .connector_type = DRM_MODE_CONNECTOR_LVDS,
> > > > > +       .device_specific = false,
> > > > > +};
> > > > > +
> > > > > +static const struct lvds_codec_data lvds_codec_thc63lvdm83d_data = {
> > > > > +       .connector_type = DRM_MODE_CONNECTOR_LVDS,
> > > > > +       .device_specific = true,
> > > > > +};
> > > > > +
> > > > >  static const struct of_device_id lvds_codec_match[] = {
> > > > >         {
> > > > >                 .compatible = "lvds-decoder",
> > > > > -               .data = (void *)DRM_MODE_CONNECTOR_DPI,
> > > > > +               .data = &lvds_codec_decoder_data,
> > > > >         },
> > > > >         {
> > > > >                 .compatible = "lvds-encoder",
> > > > > -               .data = (void *)DRM_MODE_CONNECTOR_LVDS,
> > > > > +               .data = &lvds_codec_encoder_data,
> > > > >         },
> > > > >         {
> > > > >                 .compatible = "thine,thc63lvdm83d",
> > > > > -               .data = (void *)DRM_MODE_CONNECTOR_LVDS,
> > > > > +               .data = &lvds_codec_thc63lvdm83d_data,
> > > > >         },
> > > > >         {},
> > > > >  };

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
