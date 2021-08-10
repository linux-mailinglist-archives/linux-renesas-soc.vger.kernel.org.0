Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id ACEC13E7CDB
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 10 Aug 2021 17:52:13 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S242499AbhHJPwc (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Tue, 10 Aug 2021 11:52:32 -0400
Received: from mail-ua1-f50.google.com ([209.85.222.50]:38853 "EHLO
        mail-ua1-f50.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S242463AbhHJPwb (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 10 Aug 2021 11:52:31 -0400
Received: by mail-ua1-f50.google.com with SMTP id ay13so985277uab.5
        for <linux-renesas-soc@vger.kernel.org>; Tue, 10 Aug 2021 08:52:09 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=14LcusME7ZZfpCeACy1bKOoqz1QHnlL2Rh15LgCjnUM=;
        b=MPsWv8Hre6Prunkwj6wReBMLh4whbQY1ZggBuVfIghdkebp+0a35oxLeYerBF7nAou
         tdCbnv21RL4bAO5z8hUhZH4ub/mcY26uLObVZTeQrLs4VbmuVmlqd3af4+IAaKBJ7zgX
         526GTBNkjB3olgjtU8aaC9s6xIMkOr3DZR37F3yE34YLO3Qmooqy44cAKkSsj0zEfvhs
         p2tFTyN3Oa/7SLjcSeIBtnNDBrC3Fe4xeRqWOPf4BfCZMVFmNHTUxn9jG5EHwVMKWaD9
         JJVimQjGSMDI/frc3s+XSl4oDdKCjgvfo76QgsvgJd4zFMtKPa8J1DJWXHp70Q6JfRM6
         0CBw==
X-Gm-Message-State: AOAM533tPtgWAFlmNTUkXOdpubKNHVM+uSndGQGYb5tOnzifoZp+b7+v
        RTmuuMWvldOCFoUQLV0LY1aSAPcLocJHJ7nS8E4w2cOEcobEbg==
X-Google-Smtp-Source: ABdhPJzMiPuuaYmNZzOEPR3m6Kf8XRk4wl132UekAFkhbG+LrgoQfXmV1JRJFkoaLWJGjv5ooMmspv0RafumgJ3SaH4=
X-Received: by 2002:a9f:2341:: with SMTP id 59mr21031577uae.4.1628610728962;
 Tue, 10 Aug 2021 08:52:08 -0700 (PDT)
MIME-Version: 1.0
References: <20210520065046.28978-1-laurent.pinchart+renesas@ideasonboard.com>
 <20210520065046.28978-3-laurent.pinchart+renesas@ideasonboard.com> <CAMuHMdWdbS2tFh9LP8hqUT-3nRqKf_k_8N3ZeiUSiBEgYhjDxQ@mail.gmail.com>
In-Reply-To: <CAMuHMdWdbS2tFh9LP8hqUT-3nRqKf_k_8N3ZeiUSiBEgYhjDxQ@mail.gmail.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Tue, 10 Aug 2021 17:51:57 +0200
Message-ID: <CAMuHMdVd75h7qCxqfQ4MCoUwEiTJktTYykZgnWy7zFgxuHXmAg@mail.gmail.com>
Subject: Re: [PATCH v3 2/4] drm: rcar-du: lvds: Convert to DRM panel bridge helper
To:     Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
Cc:     DRI Development <dri-devel@lists.freedesktop.org>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        Kieran Bingham <kieran.bingham@ideasonboard.com>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi Laurent,

On Tue, Aug 10, 2021 at 5:47 PM Geert Uytterhoeven <geert@linux-m68k.org> wrote:
> On Thu, May 20, 2021 at 8:51 AM Laurent Pinchart
> <laurent.pinchart+renesas@ideasonboard.com> wrote:
> > Replace the manual panel handling with usage of the DRM panel bridge
> > helper. This simplifies the driver, and brings support for
> > DRM_BRIDGE_ATTACH_NO_CONNECTOR as an added bonus.
> >
> > Signed-off-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
>
> Thanks for your patch, which is now commit e9e056949c927e5b ("drm:
> rcar-du: lvds: Convert to DRM panel bridge helper") in drm-next.
>
> This causes the following scary messages in the kernel log on Ebisu-4D:
>
> [drm:drm_bridge_attach] *ERROR* failed to attach bridge

> Reverting this commit fixes the issue.

Oops, that's not true (should not write tentative messages while booting
a test kernel, and press send without checking first ;-)

Reverting the commit doesn't seem to make a difference.
But the parent 5bcc48395b9f35da ("drm: bridge: dw-hdmi: Attach to
next bridge if available") of the bad commit is fine.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
