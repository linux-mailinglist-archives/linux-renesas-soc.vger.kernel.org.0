Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 198EF728FF
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 24 Jul 2019 09:29:13 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725887AbfGXH3M (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Wed, 24 Jul 2019 03:29:12 -0400
Received: from mail-wr1-f67.google.com ([209.85.221.67]:42542 "EHLO
        mail-wr1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725883AbfGXH3M (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 24 Jul 2019 03:29:12 -0400
Received: by mail-wr1-f67.google.com with SMTP id x1so30748281wrr.9;
        Wed, 24 Jul 2019 00:29:11 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=BCmdtnUP7aJRqucr3vaspkGGjkcYN7cm9GbUeSOpXg4=;
        b=f+FVHAWiw5IxkeUeIF0YCKILd2Gvm/wAjG8F2W3gjNa+sf2gkPVXTYFDVyg+dldStX
         KO25obr2KDPbmIGe4fvi4wzwBcqfNP8YPYPAEuxxyFe39LA56JK5EcucpHpRb5uQz14G
         NfWgdildJhzjd/7R/ENzws84x6XVjKjdQ6s30K78sGQIw+RLMSaeqctE3VMeKbhBl5gR
         vlr1/wvbw2LBBR/dnDRuYz3X7XAi7G02EpnxSSDOoGq5Zc0PeygVm0AFL+GTu3384RmV
         8WXvdW/M7mogB9NI1DlHS7+sKRh5352pE3g457vcLyWVx6PPcYMfJRk7e5grQL0ywaz8
         7JYg==
X-Gm-Message-State: APjAAAX4KROIMaH0kKmX++5u7d/QPfdzKcimEEziMP/6qYtpVYiWHPAg
        4nfF5oEut/CJobSD6+D12taBByhqi12jDahH6rg=
X-Google-Smtp-Source: APXvYqzvZJmXGo8K7zyPAWumLL81AOZ5k2RFLEJ80iQmYUwi0sTJbgdZuIX9S087bLR8+VNHitysCdfq+J8rfAU7zb4=
X-Received: by 2002:adf:ab51:: with SMTP id r17mr59437897wrc.95.1563953350570;
 Wed, 24 Jul 2019 00:29:10 -0700 (PDT)
MIME-Version: 1.0
References: <20190723165700.13124-1-jacopo+renesas@jmondi.org>
In-Reply-To: <20190723165700.13124-1-jacopo+renesas@jmondi.org>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Wed, 24 Jul 2019 09:28:58 +0200
Message-ID: <CAMuHMdVKiJp0PsuogMo8FZ6NUxi4j09+A2zDXZr4nrtZY-KHaw@mail.gmail.com>
Subject: Re: [PATCH] drm: rcar_lvds: Fix dual link mode operations
To:     Jacopo Mondi <jacopo+renesas@jmondi.org>
Cc:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
        David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>,
        Fabrizio Castro <fabrizio.castro@bp.renesas.com>,
        "open list:DRM DRIVERS FOR RENESAS" <dri-devel@lists.freedesktop.org>,
        "open list:DRM DRIVERS FOR RENESAS" 
        <linux-renesas-soc@vger.kernel.org>,
        open list <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi Jacopo,

On Wed, Jul 24, 2019 at 3:38 AM Jacopo Mondi <jacopo+renesas@jmondi.org> wrote:
> The R-Car LVDS encoder units support dual-link operations by splitting
> the pixel output between the primary encoder and the companion one.
>
> In order for the primary encoder to succesfully control the companion's
> operations this should not fail at probe time and register itself its
> associated drm bridge so that the primary one can find it.
>
> Currently the companion encoder fails at probe time, causing the
> registration of the primary to fail preventing the whole DU unit to be
> registered correctly.
>
> Fixes: fa440d870358 ("drm: rcar-du: lvds: Add support for dual-link mode")
> Reported-by: Fabrizio Castro <fabrizio.castro@bp.renesas.com>
> Signed-off-by: Jacopo Mondi <jacopo+renesas@jmondi.org>
>
> ---
> The "Fixes" tag refers to a patch currently part of the
> renesas-drivers-2019-07-09-v5.2 branch of Geert's renesas-drivers tree.

The broken commit is also present in v5.3-rc1.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
