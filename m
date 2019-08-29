Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 609EDA1312
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 29 Aug 2019 09:57:48 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726223AbfH2H5r (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Thu, 29 Aug 2019 03:57:47 -0400
Received: from mail-oi1-f195.google.com ([209.85.167.195]:38692 "EHLO
        mail-oi1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726081AbfH2H5r (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 29 Aug 2019 03:57:47 -0400
Received: by mail-oi1-f195.google.com with SMTP id q8so1851822oij.5;
        Thu, 29 Aug 2019 00:57:47 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=QlVHj9x553xnQTEez13oHT9EpyHgH9QecAY7hhhrPAk=;
        b=dibCH4Kpy40T+8ia3cuELqFqfiywro389srcRhrZnlMMsZi9AlPxfEE7PkWfubY//v
         WMlL9RtXqYuBHPTCquTt0mD2702sqwKjG6pB09pn0OYwQwOakSMnRRQc7mxB1Y8EeGGQ
         RETzn5vA14fAHKUm2/DQr7t0zkCCfKFS3cSh13mEUWtitUHdpVCbp3fTIHjCdHOXl+8g
         ZiY0667VCXpJYb2yXZVp3aFPXrtEnm0oBHOrVZsp2/UW+Tll21wtAI8Rm934gT+MsxO7
         H7sHL/PT7hM/YINyQ8PBcIbN1uyNC99XvRCfmz24K2FNoDCox6gjIoFQwNm+0BwHRwAS
         tKZA==
X-Gm-Message-State: APjAAAWc1wLoKdjLdOwI7bkTlPFGp/ETr+DlboS1cdQ+6OmHwKUVbhut
        1XdK1zlFOS8r1RuOinmmujlsr2MyEGOAF42zfrU=
X-Google-Smtp-Source: APXvYqwtm23JqVzDWeBpUT9mVYdLnoyO70OgcXLyNcpsa0xvNS/qCBp951gxuzDuCzJMGWND93w6eQfyvRVEfqxUW4U=
X-Received: by 2002:aca:ea82:: with SMTP id i124mr5313299oih.153.1567065466698;
 Thu, 29 Aug 2019 00:57:46 -0700 (PDT)
MIME-Version: 1.0
References: <1567017402-5895-1-git-send-email-fabrizio.castro@bp.renesas.com> <1567017402-5895-2-git-send-email-fabrizio.castro@bp.renesas.com>
In-Reply-To: <1567017402-5895-2-git-send-email-fabrizio.castro@bp.renesas.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Thu, 29 Aug 2019 09:57:35 +0200
Message-ID: <CAMuHMdVPsT=1R7DAnmui+iaWcnoy52Xrr47zLWbgmUumBZ2sdw@mail.gmail.com>
Subject: Re: [PATCH v3 1/8] dt-bindings: display: Add bindings for LVDS bus-timings
To:     Fabrizio Castro <fabrizio.castro@bp.renesas.com>
Cc:     David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        DRI Development <dri-devel@lists.freedesktop.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Simon Horman <horms@verge.net.au>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Chris Paterson <Chris.Paterson2@renesas.com>,
        Biju Das <biju.das@bp.renesas.com>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
        Jacopo Mondi <jacopo+renesas@jmondi.org>,
        Sam Ravnborg <sam@ravnborg.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi Fabrizio,

On Wed, Aug 28, 2019 at 8:36 PM Fabrizio Castro
<fabrizio.castro@bp.renesas.com> wrote:
> Dual-LVDS connections need markers in the DT, this patch adds
> some common documentation to be referenced by both panels and
> bridges.
>
> Signed-off-by: Fabrizio Castro <fabrizio.castro@bp.renesas.com>

Thanks for your patch!

> --- /dev/null
> +++ b/Documentation/devicetree/bindings/display/bus-timings/lvds.yaml
> @@ -0,0 +1,38 @@
> +# SPDX-License-Identifier: GPL-2.0
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/display/bus-timings/lvds.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Common Properties for bus timings of LVDS interfaces
> +
> +maintainers:
> +  - Thierry Reding <thierry.reding@gmail.com>
> +  - Fabrizio Castro <fabrizio.castro@bp.renesas.com>
> +
> +description: |
> +  This document defines device tree properties common to LVDS and dual-LVDS
> +  interfaces, where a dual-LVDS interface is a dual-link connection with even
> +  pixels traveling on one connection, and with odd pixels traveling on the other
> +  connection.
> +  This document doesn't constitue a device tree binding specification by itself
> +  but is meant to be referenced by device tree bindings.
> +  When referenced from panel or bridge device tree bindings, the properties
> +  defined in this document are defined as follows. The panel and bridge device
> +  tree bindings are responsible for defining whether each property is required
> +  or optional.
> +
> +properties:
> +  dual-lvds-even-pixels:
> +    type: boolean
> +    description:
> +      This property is specific to an input port of a sink device. When
> +      specified, it marks the port as recipient of even-pixels.
> +
> +  dual-lvds-odd-pixels:
> +    type: boolean
> +    description:
> +      This property is specific to an input port of a sink device. When
> +      specified, it marks the port as recipient of odd-pixels.

Do you need the "dual-" prefix? Isn't that implied by even/odd?
Or is it better to keep it, for readability?

I'm also thinking about a possible future extension to triple or quad LVDS.
As I'm not aware of English word equivalents of even/odd for triple/quad,
perhaps this should be specified using a numerical value instead?

If I go too far, please just say so ;-)

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
