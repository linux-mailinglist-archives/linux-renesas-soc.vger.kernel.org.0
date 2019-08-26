Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 421929CAAB
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 26 Aug 2019 09:35:07 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730124AbfHZHex (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Mon, 26 Aug 2019 03:34:53 -0400
Received: from mail-ot1-f66.google.com ([209.85.210.66]:37439 "EHLO
        mail-ot1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728168AbfHZHex (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 26 Aug 2019 03:34:53 -0400
Received: by mail-ot1-f66.google.com with SMTP id f17so14330723otq.4;
        Mon, 26 Aug 2019 00:34:52 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=ay8N/faohD0Lm5RaNx+jFCWBPDb56qWI9o+yg7jXEF4=;
        b=Jv/Ub004BZFrh7fjZp83Iz8iCkuXfEdYVNJXtbqKpeqNrJj9jNvQyIhjzzbGlU7P9x
         Gph5BpHm5Kfr/5JQf1n9pvVFsG9OVr25kgtVHt2nWJqfD8IT6AH6T0sHc+vrtElaC4JB
         EmPrp/vFwxoAVarjqpCcXr94BUJcP1w4d3BzuFINaB23FBnda1EnIedBSJpk6dA+k3r4
         Lw+Bsbyyg6AgiPlWrIlqiWUdLFqyFzgMGnNH68jLTw8keDiFsgRu6Q1C4S01mRhjV3VZ
         6p5EBCSu4OZGmoIIEFI4iDerr1Fw3AJtZSqye0E/pkDvSRrpTFfwUmkRCbnD0mOVVYY/
         J2IA==
X-Gm-Message-State: APjAAAVjVpG/gqSPt3fIcqV9oQfMdDUSlmDuPK0Vl37Fr9w4pZHog+Vo
        kOr83vFMYL21sT6iJSiMJnv1QeinfMEu72Zew+k=
X-Google-Smtp-Source: APXvYqzy1veDPd3iL/NVpS6ZbZGKhvD5DPUadhwD8wnxhM0EWUPvpHpdeCesQKBpWxzo5eBHxKlovNB9O0GVLTmCxSE=
X-Received: by 2002:a9d:68c5:: with SMTP id i5mr14294327oto.250.1566804892097;
 Mon, 26 Aug 2019 00:34:52 -0700 (PDT)
MIME-Version: 1.0
References: <20190825135154.11488-1-jacopo+renesas@jmondi.org> <20190825135154.11488-2-jacopo+renesas@jmondi.org>
In-Reply-To: <20190825135154.11488-2-jacopo+renesas@jmondi.org>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Mon, 26 Aug 2019 09:34:41 +0200
Message-ID: <CAMuHMdVvjrMXap5CQ-grNYpJfOG6QeN26EW4tR_YE=VFv5ozqw@mail.gmail.com>
Subject: Re: [PATCH v3 01/14] dt-bindings: display: renesas,cmm: Add R-Car CMM documentation
To:     Jacopo Mondi <jacopo+renesas@jmondi.org>
Cc:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
        Simon Horman <horms@verge.net.au>, Ulrich Hecht <uli@fpond.eu>,
        David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>,
        Koji Matsuoka <koji.matsuoka.xm@renesas.com>, muroya@ksk.co.jp,
        VenkataRajesh.Kalakodima@in.bosch.com,
        Harsha.ManjulaMallikarjun@in.bosch.com,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        DRI Development <dri-devel@lists.freedesktop.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>, Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi Jacopo,

On Sun, Aug 25, 2019 at 3:50 PM Jacopo Mondi <jacopo+renesas@jmondi.org> wrote:
> Add device tree bindings documentation for the Renesas R-Car Display
> Unit Color Management Module.
>
> CMM is the image enhancement module available on each R-Car DU video
> channel on R-Car Gen2 and Gen3 SoCs (V3H and V3M excluded).
>
> Signed-off-by: Jacopo Mondi <jacopo+renesas@jmondi.org>

Thanks for your patch!

> --- /dev/null
> +++ b/Documentation/devicetree/bindings/display/renesas,cmm.txt
> @@ -0,0 +1,33 @@
> +* Renesas R-Car Color Management Module (CMM)
> +
> +Renesas R-Car image enhancement module connected to R-Car DU video channels.
> +
> +Required properties:
> + - compatible: shall be one or more of the following:
> +   - "renesas,cmm-r8a7795": for R8A7795 (R-Car H3) compatible CMM.
> +   - "renesas,cmm-r8a7796": for R8A7796 (R-Car M3-W) compatible CMM.
> +   - "renesas,cmm-r8a77965": for R8A77965 (R-Car M3-N) compatible CMM.
> +   - "renesas,cmm-r8a77990": for R8A77990 (R-Car E3) compatible CMM.
> +   - "renesas,cmm-r8a77995": for R8A77995 (R-Car D3) compatible CMM.

Please use "renesas,<socype->-cmm" instead of "renesas,cmm-<soctype>".

> +   - "renesas,rcar-gen3-cmm": for a generic R-Car Gen3 compatible CMM.
> +   - "renesas,rcar-gen2-cmm": for a generic R-Car Gen2 compatible CMM.
> +
> +   When the generic compatible string is specified, the SoC-specific
> +   version corresponding to the platform should be listed first.
> +
> + - reg: the address base and length of the memory area where CMM control
> +   registers are mapped to.
> +
> + - clocks: phandle and clock-specifier pair to the CMM functional clock
> +   supplier.

Thinking about yaml validation:

power-domains?
resets?

> +Example:
> +--------
> +
> +       cmm0: cmm@fea40000 {
> +               compatible = "renesas,cmm-r8a7796";
> +               reg = <0 0xfea40000 0 0x1000>;
> +               power-domains = <&sysc R8A7796_PD_ALWAYS_ON>;
> +               clocks = <&cpg CPG_MOD 711>;
> +               resets = <&cpg 711>;
> +       };

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
