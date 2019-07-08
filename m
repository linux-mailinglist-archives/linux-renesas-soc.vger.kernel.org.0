Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 4FFFD61B7C
	for <lists+linux-renesas-soc@lfdr.de>; Mon,  8 Jul 2019 09:58:42 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728723AbfGHH6k (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Mon, 8 Jul 2019 03:58:40 -0400
Received: from mail-ot1-f66.google.com ([209.85.210.66]:33899 "EHLO
        mail-ot1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725836AbfGHH6j (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 8 Jul 2019 03:58:39 -0400
Received: by mail-ot1-f66.google.com with SMTP id n5so15293207otk.1;
        Mon, 08 Jul 2019 00:58:39 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=StnBZ5X9IU3YfBiysdeAUKuuUOczu/xn5Tp1Ip5xjbA=;
        b=hpAyFmuJunqfuuxjK/crmrEZIjoht/cOoswSDwolGMNwu6KQTRzcQCR+7V/KPPP3px
         qpE6Mf4GYoXVh3z3CU5Rrd4Twr1NvHHIGrO0bIG5qXn5K7dowdk4l67CcNpecRIWwWWL
         ppMOk+bl6pL95Kx6x7CUAvHt/0pjN+FBLk9JjzHIUN4DkUBxcS+z/uLESBN7P+LnvqrN
         u427DsGjW7HEgAHqsphKQkHuSTIwFyMgImLjbKRnkDhaK1KubWtgIN3PcE+/izi1QykI
         xsWhfx2YOi7ht1sEU3lZeUVwHf4gFnqn01G8wbuVKR7Q0IBNtblEliTK5eDEd0e7j7ip
         hj0Q==
X-Gm-Message-State: APjAAAU52DMG/CCw2uyMNwEtcYG2gIqOA7BATkxdNNetH3uFUF9Jb9dA
        dNeqBE2ZnVvGLfjq+G29UwSF5iFqs50FHiVkfdQ=
X-Google-Smtp-Source: APXvYqzUPRCgrUBw97eCjHFCwkgqypz9WTte0c3NlDtkB2BijxQNV9v4lF/EwkMmVsOxNeMUvOg3BbZciubIJ9wch0I=
X-Received: by 2002:a9d:7a90:: with SMTP id l16mr1458564otn.297.1562572719133;
 Mon, 08 Jul 2019 00:58:39 -0700 (PDT)
MIME-Version: 1.0
References: <20190706140746.29132-1-jacopo+renesas@jmondi.org> <20190706140746.29132-2-jacopo+renesas@jmondi.org>
In-Reply-To: <20190706140746.29132-2-jacopo+renesas@jmondi.org>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Mon, 8 Jul 2019 09:58:27 +0200
Message-ID: <CAMuHMdWVzm8yoZSoKZh3MJsaX4jCRXQCbn2x2LAu4UWtb1yYjw@mail.gmail.com>
Subject: Re: [PATCH v2 01/19] dt-bindings: display: renesas,cmm: Add R-Car CMM documentation
To:     Jacopo Mondi <jacopo+renesas@jmondi.org>
Cc:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
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

On Sat, Jul 6, 2019 at 4:07 PM Jacopo Mondi <jacopo+renesas@jmondi.org> wrote:
> Add device tree bindings documentation for the Renesas R-Car Display
> Unit Color Management Module.
>
> CMM is the image enhancement module available on each R-Car DU video
> channel on R-Car Gen2 and Gen3 SoCs (V3H and V3M excluded).
>
> Signed-off-by: Jacopo Mondi <jacopo+renesas@jmondi.org>
> Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>

Thanks for your patch!

> --- /dev/null
> +++ b/Documentation/devicetree/bindings/display/renesas,cmm.txt
> @@ -0,0 +1,25 @@
> +* Renesas R-Car Color Management Module (CMM)
> +
> +Renesas R-Car image enhancement module connected to R-Car DU video channels.
> +
> +Required properties:
> + - compatible: shall be one of:
> +   - "renesas,rcar-gen3-cmm"
> +   - "renesas,rcar-gen2-cmm"

Why do you think you do not need SoC-specific compatible values?
What if you discover a different across the R-Car Gen3 line tomorrow?
Does the IP block have a version register?

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
