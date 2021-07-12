Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8E79D3C5B85
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 12 Jul 2021 13:44:52 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234358AbhGLLjv (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Mon, 12 Jul 2021 07:39:51 -0400
Received: from mail-vs1-f54.google.com ([209.85.217.54]:41905 "EHLO
        mail-vs1-f54.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232912AbhGLLjV (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 12 Jul 2021 07:39:21 -0400
Received: by mail-vs1-f54.google.com with SMTP id u14so1459078vsc.8
        for <linux-renesas-soc@vger.kernel.org>; Mon, 12 Jul 2021 04:36:30 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=qbeR15QfSfVPmHqslTtHa/+I0z0Qi3SjnZFzfgV/pv8=;
        b=GmCYvRRaa+GIm9CseEZ8Qr9JDTmO5RDKx6YjOHcE1eZxx/LTBX2nVWA01D3VWczuET
         evtx52s5yZoaAXpcTmgJ691Th5rMr46N2EjAmCZDV5wgCvZCe0MpLVaEm66t/HK5Qpd7
         ZsRu3qLRbDUETsu60XrP1HjQhOoLvp1383ASN0b4AH9qQilDEshUjP2qsHuYSdSJyGUJ
         obfbJ2r1Z4yaxBV/fRPEOvaf82EP9Ex0xASKBwzAg1LkzpIiwfFbGVpuKiK68Hyjz+06
         /OdEY0ibC6SBtblzmFP9RmzA9O8TIwI9eKEL/U9RtA62CD+dlBkMR+sTYJoReD6kEg8o
         JGfA==
X-Gm-Message-State: AOAM532478lu/Xe0pk8Q9Py0AJoDJebKFx7I732v5nXk6klmkt26K1Oo
        uMlzaEKn5IiUNZy45KQ368TWhK7Nt+bswVweOR0=
X-Google-Smtp-Source: ABdhPJwXMijAGlhNXvrBsArMDdwRVj7GlmsxJ2zKanlMTZ+KUOyTa9mcE1rcxe4warJSDbq176uV4RM0k8uaQibhEgI=
X-Received: by 2002:a67:8702:: with SMTP id j2mr7280621vsd.3.1626089790153;
 Mon, 12 Jul 2021 04:36:30 -0700 (PDT)
MIME-Version: 1.0
References: <4a671ef00b3469f8b7ffd42309c3dfb1ccb8eb8a.1626085156.git.geert+renesas@glider.be>
 <YOwlv26H1pYVCny0@pendragon.ideasonboard.com>
In-Reply-To: <YOwlv26H1pYVCny0@pendragon.ideasonboard.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Mon, 12 Jul 2021 13:36:19 +0200
Message-ID: <CAMuHMdUsM0EhTbsVPuxuMi5Pm3OctWJ7uwJxAzB1Q_RuKaZcjw@mail.gmail.com>
Subject: Re: [PATCH LOCAL] arm64: renesas: defconfig: Restore graphical consoles
To:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc:     Magnus Damm <magnus.damm@gmail.com>,
        Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi Laurent,

On Mon, Jul 12, 2021 at 1:22 PM Laurent Pinchart
<laurent.pinchart@ideasonboard.com> wrote:
> On Mon, Jul 12, 2021 at 12:19:33PM +0200, Geert Uytterhoeven wrote:
> > As of commit f611b1e7624ccdbd ("drm: Avoid circular dependencies for
> > CONFIG_FB"), CONFIG_FB is no longer auto-enabled.
> >
> > Restore support for graphical consoles by enabling it explicitly in the
> > defconfig for Renesas R-Car Gen3 and RZ/G2 systems.
> >
> > Fixes: f611b1e7624ccdbd ("drm: Avoid circular dependencies for CONFIG_FB")
> > Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
> > ---
> > Not intended for upstream merge.
>
> Why not ? We have no KMS console driver yet, FB is currently the only
> option.

Because there is no renesas-defconfig in upstream.

> > To be queued in topic/renesas-defconfig, unless the rcar-du experts
> > consider CONFIG_FB to be no longer needed nor wanted on systems where
> > graphics are provided by a DRM driver.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
