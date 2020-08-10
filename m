Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 63B492403C3
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 10 Aug 2020 11:01:06 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726684AbgHJJBD (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Mon, 10 Aug 2020 05:01:03 -0400
Received: from mail-ot1-f68.google.com ([209.85.210.68]:36273 "EHLO
        mail-ot1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726135AbgHJJBC (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 10 Aug 2020 05:01:02 -0400
Received: by mail-ot1-f68.google.com with SMTP id x24so6725285otp.3
        for <linux-renesas-soc@vger.kernel.org>; Mon, 10 Aug 2020 02:01:01 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=kH5dLM3T0ZjBv81zJx0cc/HzMGKg53a3xLeUDaxakxs=;
        b=jL8xfdqLMj+qwWch6V5QbN8pkJ7cnz+pnnF3gqXfhYG1iLoCif22C//ep3UQKfT4Ub
         RXdVEYT3DVX8z/ciF4yawqsew8SBRLJ72vVHICCqpk2PXIJ5xCLq2QyTzxf/od1y4WXr
         b2KHk+FqZrV3pGIiNOxTJQafn/iCfxesztQ8KQhzLbUUPWZZu838rm4crZXqYmPTCqz2
         0ilIsz/O5m5dgLDie+f3mh3phnjqYdgs5E9LvVVWcPgn77sKX/o2Twh2y6t3ZZ6nNLV9
         FmCA7dSu/q76JYBVKXb7VqKojiVrcMePUYQdg/pQl2lZx8pMGP7mvTNHlUz7kCwMRo7d
         Ohaw==
X-Gm-Message-State: AOAM530sKOgGdZV4gFgmcZR+TbW0jiKyMJoP/gHUAFZUPauuwW95BcVj
        r6IV0Waf7LZmm4e+/1jHhl4CkQq4EV7WPEuprSnT7w==
X-Google-Smtp-Source: ABdhPJwHasC1WwA6qEsYupZfJUk9MX4OlC8dDGZYKH8s/1JXzTkCXirrHzHsSV52j66ecce0DQoIUVMHTDoRmDlFP/I=
X-Received: by 2002:a9d:1b62:: with SMTP id l89mr4144otl.145.1597050061323;
 Mon, 10 Aug 2020 02:01:01 -0700 (PDT)
MIME-Version: 1.0
References: <20200807212218.24773-1-laurent.pinchart+renesas@ideasonboard.com>
In-Reply-To: <20200807212218.24773-1-laurent.pinchart+renesas@ideasonboard.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Mon, 10 Aug 2020 11:00:50 +0200
Message-ID: <CAMuHMdXWbbgyELMHqx=7xLLQdmbCNdqfRmW=vqSy-n045VapBg@mail.gmail.com>
Subject: Re: [PATCH] drm: rcar-du: Fix crash when enabling a non-visible plane
To:     Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
Cc:     DRI Development <dri-devel@lists.freedesktop.org>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        Kieran Bingham <kieran.bingham@ideasonboard.com>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

On Fri, Aug 7, 2020 at 11:23 PM Laurent Pinchart
<laurent.pinchart+renesas@ideasonboard.com> wrote:
> The DU driver handles non-visible planes (fully clipped by the display's
> boundaries) by considering them as disabled. It thus disables the plane
> at the hardware level when the plane if moved off-screen. However, if

is moved

> the plane was previously disabled and is non-visible when it gets
> enabled, the attempt to disable it crashes, ad the plane wasn't

as

> previously enabled. Fix it.
>
> Signed-off-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
