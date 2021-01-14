Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9FAB42F5E3F
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 14 Jan 2021 11:03:27 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726822AbhANKBr (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Thu, 14 Jan 2021 05:01:47 -0500
Received: from mail-qt1-f170.google.com ([209.85.160.170]:39226 "EHLO
        mail-qt1-f170.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726661AbhANKBr (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 14 Jan 2021 05:01:47 -0500
Received: by mail-qt1-f170.google.com with SMTP id a6so3092140qtw.6
        for <linux-renesas-soc@vger.kernel.org>; Thu, 14 Jan 2021 02:01:27 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=Fg4c8daHi9IS1OBRtJJqGNfCiSJcKpk93Xq2lJmqBFc=;
        b=T3ndX4+Xpp+eGPfYmPEjwlFFVLpofVjWUcdhn5logAsQt6n2IaIFviwAfR8wr5P79w
         vv7JewORzEL9LmbLEAg+d09tb9rXfU3yI4Stsc0FCvzE8s08yxAhx46DtrT1f3kZhgOk
         jfK61ykj6EBw6pmmp2QKjvovxcpb2hu82NOtTPsX9bnBPNienuGUjM8gNi4AZ1WIEAbD
         5Vo2DZ+HMy4ivVZDX1uVtDXIzgAVB5AQEcNPvBTBdXFPV8JWqBWnFOK7SkIgUFiul+Qm
         voJJR1TGnId8+IKxjB2NI4qX06VXkDMb4lc6gfbEOn5t+ROgF8YnkJluZ8YXyTJpocTM
         A0kw==
X-Gm-Message-State: AOAM532G5brRYAvxWTUe9i1nbAN9BXjKF4VTDefpkcckn4OCsJhwtJQ2
        sG593B2rpdr0haV2bf2Kis2zmVeEUXzqAC6VgVU=
X-Google-Smtp-Source: ABdhPJyR+AhR8sp9G7uVthpCJHpa/v8WxRXJWIRdWVpG1dj+0MuATWJAQ6QiGZVFvalcqmcfeXygNUukuKB0ZZGDYdE=
X-Received: by 2002:ac8:6f07:: with SMTP id g7mr6273597qtv.308.1610618461819;
 Thu, 14 Jan 2021 02:01:01 -0800 (PST)
MIME-Version: 1.0
References: <20210113170253.443820-1-kieran.bingham+renesas@ideasonboard.com>
In-Reply-To: <20210113170253.443820-1-kieran.bingham+renesas@ideasonboard.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Thu, 14 Jan 2021 11:00:50 +0100
Message-ID: <CAMuHMdVwjWwcWR45BTAjL5Lp66s5coc_Jp1EcBF1ad7MJpY0Og@mail.gmail.com>
Subject: Re: [PATCH] drm: rcar-du: Use drmm_encoder_alloc() to manage encoder
To:     Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>
Cc:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>,
        DRI Development <dri-devel@lists.freedesktop.org>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        Geert Uytterhoeven <geert+renesas@glider.be>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

On Wed, Jan 13, 2021 at 6:02 PM Kieran Bingham
<kieran.bingham+renesas@ideasonboard.com> wrote:
> The encoder allocation was converted to a DRM managed resource at the
> same time as the addition of a new helper drmm_encoder_alloc() which
> simplifies the same process.
>
> Convert the custom drm managed resource allocation of the encoder
> with the helper to simplify the implementation, and prevent hitting a
> WARN_ON() due to the handling the drm_encoder_init() call directly
> without registering a .destroy() function op.
>
> Fixes: f5f16725edbc ("drm: rcar-du: Use DRM-managed allocation for encoders")
> Reported-by: Geert Uytterhoeven <geert+renesas@glider.be>
> Signed-off-by: Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>

Tested-by: Geert Uytterhoeven <geert+renesas@glider.be>
As in "the WARNING from drm_encoder_init() is gone".

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
