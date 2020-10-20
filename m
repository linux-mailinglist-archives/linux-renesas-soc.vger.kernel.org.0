Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C963A293860
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 20 Oct 2020 11:43:58 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2403797AbgJTJn5 (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Tue, 20 Oct 2020 05:43:57 -0400
Received: from mail-ot1-f65.google.com ([209.85.210.65]:38538 "EHLO
        mail-ot1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2403795AbgJTJn5 (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 20 Oct 2020 05:43:57 -0400
Received: by mail-ot1-f65.google.com with SMTP id i12so1186380ota.5
        for <linux-renesas-soc@vger.kernel.org>; Tue, 20 Oct 2020 02:43:57 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=vjmJglt2xwcPAOj6s6wIPs7tJTEQI0XIzMDh8rDIULM=;
        b=bIM1j6WWxh5WhWxdsNSBlwtRofh5AXEiuB0Lnufhghy75NxRCdzszTqT+jYB6CGIIE
         8O2fWwuk2JeFtnMO+Yv2nqVDSYCqDXUMIX7ZR2C2fYssAQji+fC7bs0EGJFHs+NFKMe2
         W/lH2QuOBMxkNFzySq9kJb272Ab+dfuC8QqHAIloKao+UYB+J03InkYnuLYVjLECxpP8
         SDEDRNdFuk3Cf15s07bcZJqIWkN4376QCOcOKMIenkQGNgdV9A+3jyHocg4TF08CZ8is
         /YZ89ymiuLiP+5ROjRy+b2xQkueIxoNcZ/N8RtWLxwOy74F8A3FxxVQOQlog5WN5V77s
         AYUQ==
X-Gm-Message-State: AOAM533he8YHQcSX7/UWw38MRoVIlW2ThpS923l4LZEqZU+055gA84Ei
        T71i+uiB7er9wjG3ii2+XcDchW5up/VRQFXmZofgY+SO
X-Google-Smtp-Source: ABdhPJx527/uggMsMuYrmv6PN6DgycfjmJpdtNouoy3MQrTD53VKY+Wk2w8JJf3MxTZjNXIfyBikVutFASoATcWsGX8=
X-Received: by 2002:a9d:5e14:: with SMTP id d20mr1061097oti.107.1603187036996;
 Tue, 20 Oct 2020 02:43:56 -0700 (PDT)
MIME-Version: 1.0
References: <20201020093655.3584-1-biju.das.jz@bp.renesas.com>
In-Reply-To: <20201020093655.3584-1-biju.das.jz@bp.renesas.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Tue, 20 Oct 2020 11:43:46 +0200
Message-ID: <CAMuHMdUyWJW2_wzdPaGhUbfhjr-_wm+bF+Ry1CymodnrLc_GJg@mail.gmail.com>
Subject: Re: [PATCH] drm/bridge: lvds-codec: Use dev_err_probe for error handling
To:     Biju Das <biju.das.jz@bp.renesas.com>
Cc:     Andrzej Hajda <a.hajda@samsung.com>,
        Neil Armstrong <narmstrong@baylibre.com>,
        David Airlie <airlied@linux.ie>,
        Sam Ravnborg <sam@ravnborg.org>,
        Daniel Vetter <daniel@ffwll.ch>,
        Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
        Jonas Karlman <jonas@kwiboo.se>,
        Jernej Skrabec <jernej.skrabec@siol.net>,
        DRI Development <dri-devel@lists.freedesktop.org>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Chris Paterson <Chris.Paterson2@renesas.com>,
        Biju Das <biju.das@bp.renesas.com>,
        Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

On Tue, Oct 20, 2020 at 11:37 AM Biju Das <biju.das.jz@bp.renesas.com> wrote:
> dev_err_probe function simplifies error handling. So use the same in probe
> function wherever possible.
>
> Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
