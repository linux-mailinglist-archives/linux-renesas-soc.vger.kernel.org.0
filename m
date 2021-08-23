Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 060093F4A9E
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 23 Aug 2021 14:26:12 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235092AbhHWM00 (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Mon, 23 Aug 2021 08:26:26 -0400
Received: from mail-vs1-f52.google.com ([209.85.217.52]:37437 "EHLO
        mail-vs1-f52.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233755AbhHWM00 (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 23 Aug 2021 08:26:26 -0400
Received: by mail-vs1-f52.google.com with SMTP id t7so6244988vsj.4
        for <linux-renesas-soc@vger.kernel.org>; Mon, 23 Aug 2021 05:25:43 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=qXtDlW7T88wjzL8Tweiy71uHxWixjnOanz5gbQbCE/Q=;
        b=ZgJL/KmHyPyTpg00oICtfcf7mMWG0QkQCYJNiISghYiey1FaYm6yj/DGzyBj5G0QFI
         FLw1qlyGpTKTLX9wJ0lV1pAvHmjgeb6gOZCfeApC8YhKKfqloauIOfzESDmLd0sDV3BC
         C8vpqEXckbDbb+JgRKZdQKUTXlaSBr1el4+vsKPEItRSVdPut0lz/f4JId9a6k0FhNdX
         M/pAp97lV5CGJ1c7S1NkoXyj3drfKvCjq3/nSk0zeL7pmo5csIMm3bgQj4GGsbkzWmIW
         D3ek+BF4iF4PWg5muwfXItUTkZnvJRonx3xBRUUsFh8n0x/MRcbw16Nk/h54MWm5pGaa
         1SWw==
X-Gm-Message-State: AOAM532lR80T0OOVs8HALTdFMvz87QHQFdTSK/vWPRHYoasrO78w4IbQ
        8kR8AqwH1PVPOXuQ92oTjST37I8DBGts95k5SYQ=
X-Google-Smtp-Source: ABdhPJznZ+PmuT3gxAgdgrA8kXhuOMnutxvhv88zLvTlR66PqFd1lACaQ9rSF7u0b53nzxL3qVPfHiShIXiesAN96PA=
X-Received: by 2002:a67:cb0a:: with SMTP id b10mr23287378vsl.9.1629721543349;
 Mon, 23 Aug 2021 05:25:43 -0700 (PDT)
MIME-Version: 1.0
References: <20210822003604.6235-1-laurent.pinchart+renesas@ideasonboard.com>
In-Reply-To: <20210822003604.6235-1-laurent.pinchart+renesas@ideasonboard.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Mon, 23 Aug 2021 14:25:32 +0200
Message-ID: <CAMuHMdWSqSb37srBG0XB-vX5ERmjDBia07k_-s2Zg=bUsQCSyA@mail.gmail.com>
Subject: Re: [PATCH] drm: rcar-du: Don't create encoder for unconnected LVDS outputs
To:     Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
Cc:     DRI Development <dri-devel@lists.freedesktop.org>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        Kieran Bingham <kieran.bingham@ideasonboard.com>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi Laurent,

On Sun, Aug 22, 2021 at 2:36 AM Laurent Pinchart
<laurent.pinchart+renesas@ideasonboard.com> wrote:
> On R-Car D3 and E3, the LVDS encoders provide the pixel clock to the DU,
> even when LVDS outputs are not used. For this reason, the rcar-lvds
> driver probes successfully on those platforms even if no further bridge
> or panel is connected to the LVDS output, in order to provide the
> rcar_lvds_clk_enable() and rcar_lvds_clk_disable() functions to the DU
> driver.
>
> If an LVDS output isn't connected, trying to create a DRM connector for
> the output will fail. Fix this by skipping connector creation in that
> case, and also skip creation of the DRM encoder as there's no point in
> an encoder without a connector.
>
> Fixes: e9e056949c92 ("drm: rcar-du: lvds: Convert to DRM panel bridge helper")
> Reported-by: Geert Uytterhoeven <geert@linux-m68k.org>

Can you please change that to
Reported-by: Geert Uytterhoeven <geert+renesas@glider.be>
?

> Signed-off-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>

Thanks, the scary warning on Ebisu-4D is gone, so
Tested-by: Geert Uytterhoeven <geert+renesas@glider.be>

Disclaimer: there are no displays connected to my Ebisu-4D.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
