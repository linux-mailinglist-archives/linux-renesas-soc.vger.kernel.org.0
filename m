Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 61C282DB054
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 15 Dec 2020 16:45:36 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730304AbgLOPnZ (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Tue, 15 Dec 2020 10:43:25 -0500
Received: from mail-oi1-f196.google.com ([209.85.167.196]:32978 "EHLO
        mail-oi1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728359AbgLOPnS (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 15 Dec 2020 10:43:18 -0500
Received: by mail-oi1-f196.google.com with SMTP id d203so2598417oia.0
        for <linux-renesas-soc@vger.kernel.org>; Tue, 15 Dec 2020 07:43:03 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=gIZO24TPPjWTsJsVecEgyMhh7DdXvaXL1GWXuFZpwE4=;
        b=QMuDqx0TlJHohK1nZdcqQrNj7lDJSA5o1cPw8ZAv8F8M/dKTOtj9jcsjmdmp0Wjcz3
         5NfBk5+N7OnODw2N5gyjnlGUzx+kCX5r5EszrQAJVN99MFl0epp4bZVUhX2s8W9YA4Iy
         Uv/x2oJFrB+Hs4G2rK4c7pu5mJn7W6KAnmw61kGER2p+4UANqtbjE6qyAy2M+8WajbRz
         0anytC4pxvzTwW/dXDmWrf+ug8HGxx8Sis5flD7qj7t7G3xwANMBrhn7FUG7l7cJLn0i
         6JEHGzqZsaMQNFDnz1XCXQRuIhDs+/WlxRA4bD9A+akWQb8dq+JqKA7z7hGJWt/+i2/b
         lm3Q==
X-Gm-Message-State: AOAM530lGce0ZXnO04WqHUwOuWnm+zmuxYkWq/5I1jiyz5rIGsHVoaBb
        JGZjwdCMBg7IB/yCGs7mPhJoZavstOwiKnlmFaaS8ue4vIU=
X-Google-Smtp-Source: ABdhPJxo5bSpyE8abkGY7WpMfJeGK+a181TSZyiJmBo9NazEbTJJ1d7roy/aDMEWefttB9RvuShC1QqvAoo5BGzS0Sk=
X-Received: by 2002:aca:5c08:: with SMTP id q8mr21993784oib.54.1608046957754;
 Tue, 15 Dec 2020 07:42:37 -0800 (PST)
MIME-Version: 1.0
References: <20201204220139.15272-1-laurent.pinchart+renesas@ideasonboard.com>
 <20201204220139.15272-5-laurent.pinchart+renesas@ideasonboard.com>
 <d1113ad9-ff19-884d-90c4-0074c983f193@ideasonboard.com> <X9eSKM7KXms/4hoU@pendragon.ideasonboard.com>
In-Reply-To: <X9eSKM7KXms/4hoU@pendragon.ideasonboard.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Tue, 15 Dec 2020 16:42:26 +0100
Message-ID: <CAMuHMdVZELrczzVJwt6SRLu4YDJYyR6kWK26aG9NZHWM8bPRAQ@mail.gmail.com>
Subject: Re: [PATCH 4/9] drm: rcar-du: Use DRM-managed allocation for VSP planes
To:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc:     Kieran Bingham <kieran.bingham@ideasonboard.com>,
        Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>,
        DRI Development <dri-devel@lists.freedesktop.org>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi Laurent,

On Mon, Dec 14, 2020 at 5:28 PM Laurent Pinchart
<laurent.pinchart@ideasonboard.com> wrote:
> On Mon, Dec 14, 2020 at 04:20:17PM +0000, Kieran Bingham wrote:
> > On 04/12/2020 22:01, Laurent Pinchart wrote:
> > > devm_kcalloc() is the wrong API to allocate planes, as the lifetime of
> > > the planes is tied to the DRM device, not the device to driver
> > > binding. drmm_kcalloc() isn't a good option either, as it would result
> > > in the planes being freed before being unregistered during the managed
> > > cleanup of the DRM objects. Use a plain kcalloc(), and cleanup the
> > > planes and free the memory in the existing rcar_du_vsp_cleanup()
> > > handler.
> >
> > Managed memory always seems to hurt - which is a shame, because it
> > should be better throughout.
> >
> > It's like we need a way to arbitrarily specify the lifetimes of objects
> > correctly against another object... without being tied to a dev ...
>
> I've been saying for years that devm_kzalloc() is a major regression.
> We've traded a memory leak for a use-after-free. The function has its
> use cases, there are objects that need to match the lifetime of the
> binding between a device and its driver, but that's a small minority.

https://en.wikipedia.org/wiki/The_law_of_conservation_of_misery

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
