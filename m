Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 7C05F10E7D6
	for <lists+linux-renesas-soc@lfdr.de>; Mon,  2 Dec 2019 10:42:25 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727312AbfLBJmZ (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Mon, 2 Dec 2019 04:42:25 -0500
Received: from perceval.ideasonboard.com ([213.167.242.64]:55688 "EHLO
        perceval.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726516AbfLBJmZ (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 2 Dec 2019 04:42:25 -0500
Received: from pendragon.ideasonboard.com (81-175-216-236.bb.dnainternet.fi [81.175.216.236])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 81932DD;
        Mon,  2 Dec 2019 10:42:21 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1575279741;
        bh=CJ9EKy9GD3pmgiuuqszs9TmlcNonnvP01gpT9zZMShw=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=V4EK0qUsUWrspiB9A+zbhzHJgijD2tv2xBmg6vK0ZyUTrE55SygjtWGVe9qs1XXPV
         Wr61yGx4Bon9ZNPPhIu9c7vA9UC4eslIyMhDCimsqn/JUewYnOoDvpphYucf4xs+GL
         xMkd2GW6+g3EVAmCpGEEhns8KJ3IY7RItlmXE3fw=
Date:   Mon, 2 Dec 2019 11:42:13 +0200
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     Fabrizio Castro <fabrizio.castro@bp.renesas.com>
Cc:     Geert Uytterhoeven <geert@linux-m68k.org>,
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
Subject: Re: [PATCH v4 12/13] [HACK] drm/bridge: lvds-codec: Enforce device
 specific compatible strings
Message-ID: <20191202094213.GA4929@pendragon.ideasonboard.com>
References: <1573660292-10629-1-git-send-email-fabrizio.castro@bp.renesas.com>
 <1573660292-10629-13-git-send-email-fabrizio.castro@bp.renesas.com>
 <20191119001616.GL5171@pendragon.ideasonboard.com>
 <TY1PR01MB17706CE49FF46891A398C6A6C04C0@TY1PR01MB1770.jpnprd01.prod.outlook.com>
 <20191119215155.GB17590@pendragon.ideasonboard.com>
 <TY1PR01MB1770BF7EE9488A746632E1E0C04E0@TY1PR01MB1770.jpnprd01.prod.outlook.com>
 <CAMuHMdVXu+yXyMbM0RtqAEgZbeu1gz4osjkEPjNQmqwbYM-pOg@mail.gmail.com>
 <TY1PR01MB1770D82E521EBBCBE5F6D572C04A0@TY1PR01MB1770.jpnprd01.prod.outlook.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <TY1PR01MB1770D82E521EBBCBE5F6D572C04A0@TY1PR01MB1770.jpnprd01.prod.outlook.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi Fabrizio,

On Mon, Nov 25, 2019 at 11:17:25AM +0000, Fabrizio Castro wrote:
> On 22 November 2019 08:17 Geert Uytterhoeven wrote:
> > On Thu, Nov 21, 2019 at 5:00 PM Fabrizio Castro wrote:
> >> On 19 November 2019 21:52 Laurent Pinchart wrote:
> >>> On Tue, Nov 19, 2019 at 11:17:34AM +0000, Fabrizio Castro wrote:
> >>>> On 19 November 2019 00:16 Laurent Pinchart wrote:
> >>>>> On Wed, Nov 13, 2019 at 03:51:31PM +0000, Fabrizio Castro wrote:
> >>>>>> The lvds-codec driver is a generic stub for transparent LVDS
> >>>>>> encoders and decoders.
> >>>>>> It's good practice to list a device specific compatible string
> >>>>>> before the generic fallback (if any) in the DT node for the relevant
> >>>>>> LVDS encoder/decoder, and it's also required by the dt-bindings.
> >>>>>> A notable exception to the generic fallback mechanism is the case
> >>>>>> of "thine,thc63lvdm83d", as documented in:
> >>>>>> Documentation/devicetree/bindings/display/bridge/thine,thc63lvdm83d.txt
> >>>>>> This patch enforces the adoption of a device specific compatible
> >>>>>> string (as fist string in the list), by using markers for the
> >>>>>> compatible string we match against and the index of the matching
> >>>>>> compatible string in the list.
> >>>>>>
> >>>>>> Signed-off-by: Fabrizio Castro <fabrizio.castro@bp.renesas.com>
> >>>>>>
> >>>>>> ---
> >>>>>> Hi Laurent,
> >>>>>>
> >>>>>> I don't think we need to do anything in the driver to address your
> >>>>>> comment, as we can "enforce" this with the bindings (please see the
> >>>>>> next patch, as it would help with the "enforcing" of the compatible
> >>>>>> string for the thine device).
> >>>>>> I am sending this patch only so that you can see what a possible
> >>>>>> solution in the driver could look like.
> >>>>>>
> >>>>>> v3->v4:
> >>>>>> * New patch addressing the below comment from Laurent:
> >>>>>> "I think the lvds-decoder driver should error out at probe time if only
> >>>>>> one compatible string is listed."
> >>>>>>
> >>>>>> --- a/drivers/gpu/drm/bridge/lvds-codec.c
> >>>>>> +++ b/drivers/gpu/drm/bridge/lvds-codec.c
> >>>>>>
> >>>>>> @@ -65,7 +70,30 @@ static int lvds_codec_probe(struct platform_device *pdev)
> >>>>>>         if (!lvds_codec)
> >>>>>>                 return -ENOMEM;
> >>>>>>
> >>>>>> -       lvds_codec->connector_type = (u32)of_device_get_match_data(&pdev->dev);
> >>>>>> +       lvds_codec->data = of_device_get_match_data(&pdev->dev);
> >>>>>> +       if (!lvds_codec->data)
> >>>>>> +               return -EINVAL;
> >>>>>> +
> >>>>>> +       /*
> >>>>>> +        * If we haven't matched a device specific compatible string, we need
> >>>>>> +        * to work out if the generic compatible string we matched against was
> >>>>>> +        * listed first in the compatible property.
> >>>>>> +        */
> >>>>>
> >>>>> Can't we do this unconditionally, and thus drop the lvds_codec_data
> >>>>> structure ?
> >>>>
> >>>> I don't think so, and the reason for this is that we have a corner case for
> >>>> thine,thc63lvdm83d. Here is what's allowed (according to the documentation)
> >>>> from what's supported upstream (+ this series):
> >>>> "ti,ds90c185", "lvds-encoder"
> >>>> "ti,ds90c187", "lvds-encoder"
> >>>> "ti,sn75lvds83", "lvds-encoder"
> >>>> "ti,ds90cf384a", "lvds-decoder"
> >>>> "thine,thc63lvdm83d"
> >>>>
> >>>> As you can see from the examples above, in most cases it's enough to say it's
> >>>> all good when we match a compatible string with index > 0, but for the thine
> >>>> device you _have_ to match the string with index 0 as that's what's currently
> >>>> documented (please see thine,thc63lvdm83d.txt) and that's what's supported
> >>>> by device trees already (please see arch/arm/boot/dts/r8a7779-marzen.dts).
> >>>
> >>> How about the following logic ?
> >>>
> >>>       if (match_index("lvds-encoder") == 0 ||
> >>>           match_index("lvds-decoder") == 0)
> >>>               return -EINVAL;
> >>>
> >>>
> >>
> >> Now I see what you mean
> >>
> >>>> This patch "classifies" compatible strings, and it considers a good match
> >>>> device specific compatible strings, or generic compatible strings as long
> >>>> as they are not listed first.
> >>>>
> >>>> These days you can leverage the yaml files to validate the device trees,
> >>>> therefore we should be focusing on writing yaml files in such a way we only
> >>>> pass the checks we mean to, and by checks I mean:
> >>>> make dtbs_check
> >>>>
> >>>> or more specifically, for this series:
> >>>> make dtbs_check  DT_SCHEMA_FILES=Documentation/devicetree/bindings/display/bridge/lvds-codec.yaml
> >>>>
> >>>> and that's of course on top of make dt_binding_check.
> >>>
> >>> Sure, but that doesn't prevent anyone ignoring the validation.
> >>>
> >>>> It's a very common requirement to have a part number specific compatible
> >>>> string first followed by a generic (fallback) compatible string in the device trees,
> >>>> most drivers for Renesas SoCs have similar requirements.
> >>>>
> >>>> If we start doing this here, we'll end up doing it elsewhere as well, and I really
> >>>> think we shouldn't, but others may see things differently, so I'll wait for others
> >>>> (and yourself with further comments) to jump in before doing any more work
> >>>> on this patch.
> >>>
> >>> I agree with this argument, it would set a precedent, and is probably
> >>> not worth duplicating similar code in all drivers. I wonder if this is
> >>> something we could handle with core helpers, but maybe it's overkill.
> >>
> >> I was hoping others would comment as well, but perhaps this topic is not too exciting.
> >>
> >> Geert, what do you think about this? Is this something we should enforce
> >> in drivers?
> > 
> > So IIUIC, you want to enforce the presence of both specific and generic
> > compatible values (in that order) in the driver (except for
> > "thine,thc63lvdm83d", as that predates the introduction of the generic
> > compatible value)?
> 
> Yeah, this is what Laurent would want ideally.
> 
> > However, the driver would not really care about the actual hardware-specific
> > value, as it would still match against the generic one, and the
> > hardware-specific one may not even be listed in the driver's match table?
> 
> Exactly.
> 
> > By definition, you can have one or more compatible values listed in a
> > device node, from most-specific to least-specific.  Typically the driver
> > cannot know if a more specific value is missing, but YAML DT binding
> > validation can.
> > 
> > In this case it is a bit special, as there is a generic one involved, so
> > you can assume there should be a more specific one, too.
> > If you want to handle this in the core, you probably need to add an
> > "is_generic" flag to struct of_device_id.
> 
> That's actually an interesting way of looking at this.
> Laurent?

I like the idea, it's better than doing it in each driver.

> > Rob/Mark?

Ping ?

> >>>>>> +       if (!lvds_codec->data->device_specific) {
> >>>>>> +               const struct of_device_id *match;
> >>>>>> +               int compatible_index;
> >>>>>> +
> >>>>>> +               match = of_match_node(dev->driver->of_match_table,
> >>>>>> +                                     dev->of_node);
> >>>>>> +               compatible_index = of_property_match_string(dev->of_node,
> >>>>>> +                                                           "compatible",
> >>>>>> +                                                           match->compatible);
> >>>>>> +               if (compatible_index == 0) {
> >>>>>> +                       dev_err(dev, "Device specific compatible needed\n");
> >>>>>> +                       return -EINVAL;
> > 
> > -ENODEV?
> > So a "more generic" driver can take over?
> > 
> >>>>>> +               }
> >>>>>> +       }
> >>>>>> +
> >>>>>>         lvds_codec->powerdown_gpio = devm_gpiod_get_optional(dev, "powerdown",
> >>>>>>                                                              GPIOD_OUT_HIGH);
> >>>>>>         if (IS_ERR(lvds_codec->powerdown_gpio)) {
> >>>>>> @@ -92,7 +120,7 @@ static int lvds_codec_probe(struct platform_device *pdev)
> >>>>>>
> >>>>>>         lvds_codec->panel_bridge =
> >>>>>>                 devm_drm_panel_bridge_add_typed(dev, panel,
> >>>>>> -                                               lvds_codec->connector_type);
> >>>>>> +                                       lvds_codec->data->connector_type);
> >>>>>>         if (IS_ERR(lvds_codec->panel_bridge))
> >>>>>>                 return PTR_ERR(lvds_codec->panel_bridge);
> >>>>>>
> >>>>>> @@ -119,18 +147,33 @@ static int lvds_codec_remove(struct platform_device *pdev)
> >>>>>>         return 0;
> >>>>>>  }
> >>>>>>
> >>>>>> +static const struct lvds_codec_data lvds_codec_decoder_data = {
> >>>>>> +       .connector_type = DRM_MODE_CONNECTOR_DPI,
> >>>>>> +       .device_specific = false,
> >>>>>> +};
> >>>>>> +
> >>>>>> +static const struct lvds_codec_data lvds_codec_encoder_data = {
> >>>>>> +       .connector_type = DRM_MODE_CONNECTOR_LVDS,
> >>>>>> +       .device_specific = false,
> >>>>>> +};
> >>>>>> +
> >>>>>> +static const struct lvds_codec_data lvds_codec_thc63lvdm83d_data = {
> >>>>>> +       .connector_type = DRM_MODE_CONNECTOR_LVDS,
> >>>>>> +       .device_specific = true,
> >>>>>> +};
> >>>>>> +
> >>>>>>  static const struct of_device_id lvds_codec_match[] = {
> >>>>>>         {
> >>>>>>                 .compatible = "lvds-decoder",
> >>>>>> -               .data = (void *)DRM_MODE_CONNECTOR_DPI,
> >>>>>> +               .data = &lvds_codec_decoder_data,
> >>>>>>         },
> >>>>>>         {
> >>>>>>                 .compatible = "lvds-encoder",
> >>>>>> -               .data = (void *)DRM_MODE_CONNECTOR_LVDS,
> >>>>>> +               .data = &lvds_codec_encoder_data,
> >>>>>>         },
> >>>>>>         {
> >>>>>>                 .compatible = "thine,thc63lvdm83d",
> >>>>>> -               .data = (void *)DRM_MODE_CONNECTOR_LVDS,
> >>>>>> +               .data = &lvds_codec_thc63lvdm83d_data,
> >>>>>>         },
> >>>>>>         {},
> >>>>>>  };

-- 
Regards,

Laurent Pinchart
