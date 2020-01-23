Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 82E831462CC
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 23 Jan 2020 08:43:51 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725991AbgAWHnv (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Thu, 23 Jan 2020 02:43:51 -0500
Received: from mail-ot1-f66.google.com ([209.85.210.66]:38398 "EHLO
        mail-ot1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725785AbgAWHnu (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 23 Jan 2020 02:43:50 -0500
Received: by mail-ot1-f66.google.com with SMTP id z9so1891770oth.5;
        Wed, 22 Jan 2020 23:43:50 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=vLGlAAGiegO0GysYxYun8pWcF7YLYXC3rdiJuuUaflk=;
        b=ToNyC02e/IocvhJQBdDU3gKFpgquvqOUiiQFuOVoaFNb1Xn/4G9ej7JGqIqYi1//kV
         6QrNbkPrLO6xRKsv8Ly0GM5NCPIWA6v8WC20ZCCSv3YLazdQsnQND/zU+nDk0CWRFf3g
         c6zpvX9JqOSkZ12cZ1fAHQvkpV+K2ElVxzmzaLnQ81f2SY2U7za8ukmXSxg7qotkXZbM
         YDrkpfYhyuyp1exqojm1PaJVTcG5CBcJUn0VGaY4RM2YP3kUhQYlQEyQLptZunMLzz/3
         ZFBb1HMZTa51Okd7gd3CT98f/R40Nru3AKCZ+8ehkltBQ1Tu9wAJpe1JxaWw+4L4FNm4
         2bxA==
X-Gm-Message-State: APjAAAXSDXE+A3c5CwW/Lf7wUG0FDODvyll+n1pmZ7hilWyzI9RdegyU
        z24kwA8qxQlkAb0xhT0cxwpcFCr5uiU9HeT5vWc=
X-Google-Smtp-Source: APXvYqzGxT2Jtu940TL4l2TiU5FOZBq7t2LMHQVChF947mfbvyVwZosKQjz0+xvORbuInNBHdiuc+1exNEHQYrNmoss=
X-Received: by 2002:a9d:7984:: with SMTP id h4mr10595289otm.297.1579765430323;
 Wed, 22 Jan 2020 23:43:50 -0800 (PST)
MIME-Version: 1.0
References: <20200115124548.3951-1-geert+renesas@glider.be>
 <20200115124548.3951-2-geert+renesas@glider.be> <ba21d2c8-ccc6-2704-fa1f-d28239700547@lechnology.com>
 <20200120190249.GA9619@ravnborg.org>
In-Reply-To: <20200120190249.GA9619@ravnborg.org>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Thu, 23 Jan 2020 08:43:39 +0100
Message-ID: <CAMuHMdV4QtKTBvM+8U=BgDV7zzQfO50Z_pnwpNWLhh6Gioe+=A@mail.gmail.com>
Subject: Re: [PATCH] dt-bindings: restrict properties for sitronix,st7735r
To:     Sam Ravnborg <sam@ravnborg.org>
Cc:     David Lechner <david@lechnology.com>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        =?UTF-8?Q?Noralf_Tr=C3=B8nnes?= <noralf@tronnes.org>,
        David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Chris Brandt <chris.brandt@renesas.com>,
        Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
        DRI Development <dri-devel@lists.freedesktop.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Rob Herring <robh@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi Sam,

On Mon, Jan 20, 2020 at 8:02 PM Sam Ravnborg <sam@ravnborg.org> wrote:
> From 6b54fb0a071c0732cd4bd5b88f456b5a85bcf4f2 Mon Sep 17 00:00:00 2001
> From: Sam Ravnborg <sam@ravnborg.org>
> Date: Mon, 20 Jan 2020 19:55:04 +0100
> Subject: [PATCH] dt-bindings: restrict properties for sitronix,st7735r
>
> David Lechner noticed (paraphrased):
> - not all properties from panel-common are applicable.
> - missing optional rotation and backlight properties
>
> Fix this by listing all allowed properties, and do not allow other properties.
>
> Fixes: abdd9e3705c8 ("dt-bindings: display: sitronix,st7735r: Convert to DT schema")
> Reported-by: David Lechner <david@lechnology.com>
> Signed-off-by: Sam Ravnborg <sam@ravnborg.org>

I'm far from a DT yaml expert, but LGTM, so:
Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
