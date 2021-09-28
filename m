Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id F371E41AB44
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 28 Sep 2021 10:56:10 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239683AbhI1I5t (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Tue, 28 Sep 2021 04:57:49 -0400
Received: from mail-vk1-f177.google.com ([209.85.221.177]:45699 "EHLO
        mail-vk1-f177.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S239254AbhI1I5s (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 28 Sep 2021 04:57:48 -0400
Received: by mail-vk1-f177.google.com with SMTP id y74so8108625vky.12
        for <linux-renesas-soc@vger.kernel.org>; Tue, 28 Sep 2021 01:56:09 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=m1SPxBXviVX+IXuXEsuQBsXdtNvtJMC8mWkf4HXlhYI=;
        b=JxdH9c12F9IJaBHp3/fxMdR2Eay+kZeAisIErD18x1ENr/fN76tgCKq1u9fodgISVB
         B91c4eltBBHyvnPsy/bSPNyWXPg7XiNuuElBm/Qlv57LKD5gjdmBmXDGceOnBq2nKgOo
         nVVE3AGXLhGYWwXvy4KIA79FMRH8J9lxyvHOq6rdjBJ+V9Woouo1QmtPrHwY7WFgGpgv
         glL1ge1NmlTFRvL8zW3gtUcEy+udQt/aIisjyhYfKTw/kTaa+l4mog1jznUcSym9rF9y
         jEGboq7qwDpLBaTokztu4b78YWtTlOesuBoLA8XqmcFNrkosMS0j/a5paMFju2El6cgQ
         3lbQ==
X-Gm-Message-State: AOAM531LTMqcwdYIvHQbGsPc2YMaNLn7gtCedzZoHWzCzywN53IhusgN
        ru8+AxuGPOBU4DFbwMj4wqS1ZhuHa6UY3LnkOZSf3Blt
X-Google-Smtp-Source: ABdhPJy+pindMxBWVfaLcKOdBKp/zvSFAEW3vww4iRWQPHAR7B+Og0y4TRu4t/Zeus+2ltvVleJSy9AemEXcjC6o324=
X-Received: by 2002:a1f:230c:: with SMTP id j12mr3610861vkj.11.1632819369174;
 Tue, 28 Sep 2021 01:56:09 -0700 (PDT)
MIME-Version: 1.0
References: <20210822003604.6235-1-laurent.pinchart+renesas@ideasonboard.com>
 <CAMuHMdWSqSb37srBG0XB-vX5ERmjDBia07k_-s2Zg=bUsQCSyA@mail.gmail.com> <YSO2h40mJN17FGvd@pendragon.ideasonboard.com>
In-Reply-To: <YSO2h40mJN17FGvd@pendragon.ideasonboard.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Tue, 28 Sep 2021 10:55:57 +0200
Message-ID: <CAMuHMdW6Y4rhcH4EfjnzkPvWhm2ok=7E_3Cswe=5bnozGzpmGA@mail.gmail.com>
Subject: Re: [PATCH] drm: rcar-du: Don't create encoder for unconnected LVDS outputs
To:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc:     DRI Development <dri-devel@lists.freedesktop.org>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        Kieran Bingham <kieran.bingham@ideasonboard.com>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi Laurent,

On Mon, Aug 23, 2021 at 4:54 PM Laurent Pinchart
<laurent.pinchart@ideasonboard.com> wrote:
> On Mon, Aug 23, 2021 at 02:25:32PM +0200, Geert Uytterhoeven wrote:
> > On Sun, Aug 22, 2021 at 2:36 AM Laurent Pinchart wrote:
> > > On R-Car D3 and E3, the LVDS encoders provide the pixel clock to the DU,
> > > even when LVDS outputs are not used. For this reason, the rcar-lvds
> > > driver probes successfully on those platforms even if no further bridge
> > > or panel is connected to the LVDS output, in order to provide the
> > > rcar_lvds_clk_enable() and rcar_lvds_clk_disable() functions to the DU
> > > driver.
> > >
> > > If an LVDS output isn't connected, trying to create a DRM connector for
> > > the output will fail. Fix this by skipping connector creation in that
> > > case, and also skip creation of the DRM encoder as there's no point in
> > > an encoder without a connector.
> > >
> > > Fixes: e9e056949c92 ("drm: rcar-du: lvds: Convert to DRM panel bridge helper")
> > > Reported-by: Geert Uytterhoeven <geert@linux-m68k.org>
> >
> > Can you please change that to
> > Reported-by: Geert Uytterhoeven <geert+renesas@glider.be>
> > ?
>
> Sure thing.

Thanks!

> > > Signed-off-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
> >
> > Thanks, the scary warning on Ebisu-4D is gone, so
> > Tested-by: Geert Uytterhoeven <geert+renesas@glider.be>
> >
> > Disclaimer: there are no displays connected to my Ebisu-4D.
>
> That's the best way to ensure the absence of display issues. It works
> great for camera testing too, if you also remove networking and storage
> :-)

Any chance this fix can make it upstream?
The fix was created before the issue entered upstream in v5.15-rc1.

Thanks!

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
