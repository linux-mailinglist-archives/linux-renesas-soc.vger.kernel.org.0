Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A9649327C2D
	for <lists+linux-renesas-soc@lfdr.de>; Mon,  1 Mar 2021 11:31:26 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234468AbhCAKbP (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Mon, 1 Mar 2021 05:31:15 -0500
Received: from mail-oi1-f181.google.com ([209.85.167.181]:40226 "EHLO
        mail-oi1-f181.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234445AbhCAKbL (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 1 Mar 2021 05:31:11 -0500
Received: by mail-oi1-f181.google.com with SMTP id 21so7929010oiq.7
        for <linux-renesas-soc@vger.kernel.org>; Mon, 01 Mar 2021 02:30:55 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=/Rz2v/U2nVOok1bv0Vmx4Yapjfx0RV8rEkl36cbA/54=;
        b=cbGc/CQXFl+6NK/clf+Ij02dldLAdzeyi4Bh55T8PNhf8BtJGapjv6RJgWjEXlaH8A
         RKdgRxPBl0QNSIWfI5pfHXqKWBV5ppiIXyJPQQBrmBSPluTvdGt8ZcvJBnvbJ1O5SXT4
         1vWwWAMZM4VCI4weZM6bIXGLKHnxk2maDCUim25TZBkeD3ppzqjq3OwMJJXs1vKMA1Fk
         fQREFgLMJThpp88McvUwE06cCFolMIBBf2HOQa0q51AcLLxeuFpGCtjCNtLsKCFtIJw2
         ER2aA6JwaT0XzeeJB79d6Rzq4GbMype5ljsVRJOpUsaCOXLvZH2MwK8Ey1mcWjKMIJHf
         DsJw==
X-Gm-Message-State: AOAM533RQBEcBNQw4heTJo55+14Vd48T23+IEsKZJqTvMnxnEewzLOvt
        PWGu5w59vqJJr6HPCi0+sn4NRfmFgildfVNxTHY=
X-Google-Smtp-Source: ABdhPJxps7w7g2gNnNEepZQYsGT0MTyaHe2etwgYRDOpqOEje9uRa9Qlj9u/ysUYg1TXeKSDqi3xSFEtTeipfl3g3IQ=
X-Received: by 2002:a54:4007:: with SMTP id x7mr11367286oie.87.1614594630547;
 Mon, 01 Mar 2021 02:30:30 -0800 (PST)
MIME-Version: 1.0
References: <20210113170253.443820-1-kieran.bingham+renesas@ideasonboard.com> <CAMuHMdVwjWwcWR45BTAjL5Lp66s5coc_Jp1EcBF1ad7MJpY0Og@mail.gmail.com>
In-Reply-To: <CAMuHMdVwjWwcWR45BTAjL5Lp66s5coc_Jp1EcBF1ad7MJpY0Og@mail.gmail.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Mon, 1 Mar 2021 11:30:18 +0100
Message-ID: <CAMuHMdV0fEsDWUok=MaxnTXxngMWa5PCEHHCUoBYrqurUEf=1Q@mail.gmail.com>
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

On Thu, Jan 14, 2021 at 11:00 AM Geert Uytterhoeven
<geert@linux-m68k.org> wrote:
> On Wed, Jan 13, 2021 at 6:02 PM Kieran Bingham
> <kieran.bingham+renesas@ideasonboard.com> wrote:
> > The encoder allocation was converted to a DRM managed resource at the
> > same time as the addition of a new helper drmm_encoder_alloc() which
> > simplifies the same process.
> >
> > Convert the custom drm managed resource allocation of the encoder
> > with the helper to simplify the implementation, and prevent hitting a
> > WARN_ON() due to the handling the drm_encoder_init() call directly
> > without registering a .destroy() function op.
> >
> > Fixes: f5f16725edbc ("drm: rcar-du: Use DRM-managed allocation for encoders")
> > Reported-by: Geert Uytterhoeven <geert+renesas@glider.be>
> > Signed-off-by: Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>
>
> Tested-by: Geert Uytterhoeven <geert+renesas@glider.be>
> As in "the WARNING from drm_encoder_init() is gone".

JFYI, the WARNING is now in v5.12-rc1, the fix isn't.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
