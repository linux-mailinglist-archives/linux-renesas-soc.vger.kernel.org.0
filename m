Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id A8E3EA1F10
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 29 Aug 2019 17:27:23 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727176AbfH2P06 (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Thu, 29 Aug 2019 11:26:58 -0400
Received: from mail.kernel.org ([198.145.29.99]:44718 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726739AbfH2P06 (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 29 Aug 2019 11:26:58 -0400
Received: from mail-qk1-f170.google.com (mail-qk1-f170.google.com [209.85.222.170])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id CA2072342F;
        Thu, 29 Aug 2019 15:26:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1567092416;
        bh=L+4ClaRi9fsykE32xB4xhDmYla9Xiavn1wqCMCMursM=;
        h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
        b=YQI2zazxcGJYwGnMOBrNMMxEPo5oFzhrDk9+MilWCL+KAoP8rKKDgHfufr1foeqeP
         QSCFvW+tV30oJMZ4OWJ7859VnJK4QUc5OXu2QgkA43Vr9CRTGzKR4KESa6U1OeOAye
         5Sy2mg+SEmmRG4WYyimWY/ci+PiF1Z0X6j6cZpLI=
Received: by mail-qk1-f170.google.com with SMTP id m2so3247725qki.12;
        Thu, 29 Aug 2019 08:26:56 -0700 (PDT)
X-Gm-Message-State: APjAAAUTWSWjguGAYuj+oDQ/VGykjE/PvAbm4MYvUx50g3GsNTZGpQOz
        6eDuGW5praTMIT0FJ9K5dq6U2uybYBaiXL1BTQ==
X-Google-Smtp-Source: APXvYqwpfIKijR3krvhxBbOcuXprzAlMFrP7pRI7j1UXKERObZYR+sKPh8ZKFsOblUy4X3oiWnIbSfzV1lql8lzhaiI=
X-Received: by 2002:a37:4941:: with SMTP id w62mr9319300qka.119.1567092415814;
 Thu, 29 Aug 2019 08:26:55 -0700 (PDT)
MIME-Version: 1.0
References: <1567017402-5895-1-git-send-email-fabrizio.castro@bp.renesas.com>
In-Reply-To: <1567017402-5895-1-git-send-email-fabrizio.castro@bp.renesas.com>
From:   Rob Herring <robh+dt@kernel.org>
Date:   Thu, 29 Aug 2019 10:26:43 -0500
X-Gmail-Original-Message-ID: <CAL_Jsq+5FMHK4W4UQU24g+rm3CLjnhRcB29skygRB++GaJyM0A@mail.gmail.com>
Message-ID: <CAL_Jsq+5FMHK4W4UQU24g+rm3CLjnhRcB29skygRB++GaJyM0A@mail.gmail.com>
Subject: Re: [PATCH v3 0/8] Add dual-LVDS panel support to EK874
To:     Fabrizio Castro <fabrizio.castro@bp.renesas.com>
Cc:     Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>,
        Mark Rutland <mark.rutland@arm.com>,
        Thierry Reding <thierry.reding@gmail.com>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <maxime.ripard@bootlin.com>,
        Sean Paul <sean@poorly.run>,
        Andrzej Hajda <a.hajda@samsung.com>,
        Sam Ravnborg <sam@ravnborg.org>,
        Simon Horman <horms@verge.net.au>,
        Magnus Damm <magnus.damm@gmail.com>,
        Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
        dri-devel <dri-devel@lists.freedesktop.org>,
        devicetree@vger.kernel.org,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        "open list:MEDIA DRIVERS FOR RENESAS - FCP" 
        <linux-renesas-soc@vger.kernel.org>,
        Chris Paterson <Chris.Paterson2@renesas.com>,
        Biju Das <biju.das@bp.renesas.com>,
        Jacopo Mondi <jacopo+renesas@jmondi.org>,
        xu_shunji@hoperun.com, ebiharaml@si-linux.co.jp
Content-Type: text/plain; charset="UTF-8"
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

On Wed, Aug 28, 2019 at 1:36 PM Fabrizio Castro
<fabrizio.castro@bp.renesas.com> wrote:
>
> Dear All,
>
> this series adds support for dual-LVDS panel IDK-2121WR
> from Advantech:
> https://buy.advantech.eu/Displays/Embedded-LCD-Kits-High-Brightness/model-IDK-2121WR-K2FHA2E.htm
>
> V3 approaches the problem in a completely different way, we now
> have two new properties to mark the ports in the DT as receiving
> even pixels and odd pixels: dual-lvds-even-pixels and dual-lvds-odd-pixels,
> which means device drivers should not use bridge specific or panel
> specific dual_link flags. Also, in this case the DT describes the
> connection fully.
>
> In order for the solution to be generic, I have exported a new helper
> (drm_of_lvds_get_dual_link_configuration) to walk the device tree,
> and figure out if the connection is dual-LVDS. The same helper gives
> information about the configuration of the connection. If Px is connected
> to a port expecting even pixels and Py is connected to a port expecting
> odd pixels, then the helper returns DRM_LVDS_DUAL_LINK_EVEN_ODD_PIXELS
> (like in the example below), otherwise it returns
> DRM_LVDS_DUAL_LINK_ODD_EVEN_PIXELS.
>
>
>  --------            dual-lvds-even-pixels  --------
> |        |----                         ----|        |
> |        | Px |---------------------->| Pn |        |
> |        |----                         ----|        |
> | SOURCE |           dual-lvds-odd-pixels  |  SINK  |
> |        |----                         ----|        |
> |        | Py |---------------------->| Pm |        |
> |        |----                         ----|        |
>  --------                                   --------
>
> The device driver for the encoder then will work out if with the current
> wiring the pixels need swapping or not.
>
> The same solution works for both panels and bridges.
>
> Since the DT describes the connection fully, driver
> drivers/gpu/drm/panel/panel-lvds.c works out-of-the-box, no changes
> required, however, this implementation opens up a problem with the
> dt-bindings.
> Driver drivers/gpu/drm/panel/panel-lvds.c can still be pleased by
> a port node, but also by a ports node.
> I have created Documentation/devicetree/bindings/display/bus-timings/lvds.yaml
> with the idea of including it from panels and bridges dt-bindings
> supporting dual-LVDS (and of course the dt-bindings for the specific
> devices should say which port should be marked as what), but file
> Documentation/devicetree/bindings/display/panel/lvds.yaml formally
> requires property "port", while with this implementation it should require
> OneOf "port" and "ports", and unfortunately I can't seem to find a neat way
> aroud that, other than creating a new compatible string

Just add 'ports' and drop 'port' from being required in the common
binding. Then it is up to the panel specific bindings to define which
one is required. Or we just leave it to allow either form which the
graph code can handle.

We could have this in the common binding:

oneOf:
 - required: [ports]
 - required: [port]

Rob
