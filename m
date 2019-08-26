Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 625689CA72
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 26 Aug 2019 09:31:15 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726896AbfHZHbO (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Mon, 26 Aug 2019 03:31:14 -0400
Received: from mail-ot1-f66.google.com ([209.85.210.66]:41825 "EHLO
        mail-ot1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726719AbfHZHbO (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 26 Aug 2019 03:31:14 -0400
Received: by mail-ot1-f66.google.com with SMTP id o101so14273620ota.8;
        Mon, 26 Aug 2019 00:31:13 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=abhvVaOTv7qdR2buENiROg9GGD/qAIGiemfdRCUDpVc=;
        b=lqH006BCEkX6+z6YENIn73QMRP3M2lnLTwoxVZdUJQhLWIwR3lUFTQg0VITMb13lTz
         5N0sl8CnbEQu3kExrW0GSFtxjnTpqZVrhkS0l/wxNLBgDo+oiE6TxQ59Flr/5BdkPbce
         N/4oI+lRekJRQC9h8Bhgs4ImlkixkSMastqcAfwkUewJYcwLycyQhJ4YYy0S6jttw8Zk
         1fNPFw+P4hmgrXICLx09pfwTdODktj2bfyMneQlpMJJe0wvn/x1rGzJdQsZ5orhVaJ7T
         DxmNrqP5U9EB9qlO+msUtVPD6+Nxf/pWPEgTzQG3r0gzlMWHQ6JJeCOLdTQ2Oa7b+dyx
         9Uxg==
X-Gm-Message-State: APjAAAWq0MWh+ySDwjezNrXuVYTJ0yX1mCnp5KKHCGT7aKp0S/pxmugg
        uD9BZAxYtTz2uhOBwrgOa+tJLlx4AkoVXCILCsc=
X-Google-Smtp-Source: APXvYqwGSUko7fTyH6xUMnz8XMOWCsDcFWz2SrtHpmTycrnO0UU8UJwbJdJqLrNcjjb1kJDssLKXYH7hlHP//EIu2Kk=
X-Received: by 2002:a9d:7a90:: with SMTP id l16mr14310466otn.297.1566804673402;
 Mon, 26 Aug 2019 00:31:13 -0700 (PDT)
MIME-Version: 1.0
References: <20190825135154.11488-1-jacopo+renesas@jmondi.org> <20190825135154.11488-9-jacopo+renesas@jmondi.org>
In-Reply-To: <20190825135154.11488-9-jacopo+renesas@jmondi.org>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Mon, 26 Aug 2019 09:31:02 +0200
Message-ID: <CAMuHMdUuWFGSTUcAR2aV6cg4hpfzMs5EQBJTNM+ym2k8Ht-bVA@mail.gmail.com>
Subject: Re: [PATCH v3 08/14] drm: rcar-du: Add support for CMM
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
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi Jacopo,

On Sun, Aug 25, 2019 at 3:51 PM Jacopo Mondi <jacopo+renesas@jmondi.org> wrote:
> Add a driver for the R-Car Display Unit Color Correction Module.
> In most of Gen3 SoCs, each DU output channel is provided with a CMM unit
> to perform image enhancement and color correction.
>
> Add support for CMM through a driver that supports configuration of
> the 1-dimensional LUT table. More advanced CMM feature will be
> implemented on top of this basic one.
>
> Signed-off-by: Jacopo Mondi <jacopo+renesas@jmondi.org>

Thanks for your patch!

> --- /dev/null
> +++ b/drivers/gpu/drm/rcar-du/rcar_cmm.c

> +static const struct of_device_id rcar_cmm_of_table[] = {
> +       { .compatible = "renesas,cmm-r8a7795", },
> +       { .compatible = "renesas,cmm-r8a7796", },
> +       { .compatible = "renesas,cmm-r8a77965", },
> +       { .compatible = "renesas,cmm-r8a77990", },
> +       { .compatible = "renesas,cmm-r8a77995", },
> +       { .compatible = "renesas,rcar-gen3-cmm", },

As they're all handled the same, you can drop the SoC-specific values
from the driver's match table.

> +       { .compatible = "renesas,rcar-gen2-cmm", },

Just wondering: has this been tested on R-Car Gen2?

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
