Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id B60C661E4F
	for <lists+linux-renesas-soc@lfdr.de>; Mon,  8 Jul 2019 14:22:51 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728972AbfGHMWv (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Mon, 8 Jul 2019 08:22:51 -0400
Received: from mail-ot1-f66.google.com ([209.85.210.66]:41935 "EHLO
        mail-ot1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726222AbfGHMWu (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 8 Jul 2019 08:22:50 -0400
Received: by mail-ot1-f66.google.com with SMTP id o101so15955741ota.8
        for <linux-renesas-soc@vger.kernel.org>; Mon, 08 Jul 2019 05:22:50 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=Fymmc7VXjVwYrdafzjIwbAvmkqxBJnXVHB/h8KpLj/I=;
        b=UawT+PBiClpcxlHOs4ihJ54Z4kr/86cU6dRM+6TyhWxzgM+yNuIc+8Lfz2dNCPlVRA
         NfiaIYNLA137GAGhWaEyA8Wy0HV4U0Dy9VT+WpZdlgz7BrIb2DGewjjpCyRL8/nbbti4
         xNXqxGdeKCl8DiQ9VzWLjtINJRoNmNPkDrBtiwWpvRF1tKZyLkSjtmV92SNYRfwftreY
         V3CZqNRIlrfQXWDPizx6vJp7GlaTU1qAeMFwm+G5fSBt1hJQIWRJTZ8jsPeITj/Aqh8c
         JqrJWQezTAIHAvEnrwBQ2OQlZSinpQB2rfHwgOhpGBE/9pY5RBNkn7bsuteYz1o+gpcD
         rY4Q==
X-Gm-Message-State: APjAAAWs0gDKjr5NJSwYT4Zj8nsPxPBcXPx2yWyweiEaZh+IqYCMWiNb
        JHE+PMFVsmTym9KanMlKEl4mnGBjCKl5AwTPoOg=
X-Google-Smtp-Source: APXvYqyWr278IrSO4CnX6pFZ9Wl58MUYedOnyvk8pxM6SrePBmi5hi7cVoqmaPrJeZcTErFTwf2ZX5IvS9UtcYaQ0xM=
X-Received: by 2002:a9d:5c11:: with SMTP id o17mr13554485otk.107.1562588570194;
 Mon, 08 Jul 2019 05:22:50 -0700 (PDT)
MIME-Version: 1.0
References: <1560802696-19042-1-git-send-email-ykaneko0929@gmail.com>
In-Reply-To: <1560802696-19042-1-git-send-email-ykaneko0929@gmail.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Mon, 8 Jul 2019 14:22:39 +0200
Message-ID: <CAMuHMdWsixXYoyL-LR8TLhBJJWmO+KCxPG7fSarer7=sCpzOSQ@mail.gmail.com>
Subject: Re: [PATCH/RFT] arm64: dts: renesas: r8a77995: Fix register range of
 display node
To:     Yoshihiro Kaneko <ykaneko0929@gmail.com>
Cc:     Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        Simon Horman <horms@verge.net.au>,
        Magnus Damm <magnus.damm@gmail.com>,
        Linux ARM <linux-arm-kernel@lists.infradead.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

On Mon, Jun 17, 2019 at 10:18 PM Yoshihiro Kaneko <ykaneko0929@gmail.com> wrote:
> Since the R8A77995 SoC uses DU{0,1}, the range from the base address to
> the 0x4000 address is used.
> This patch fixed it.
>
> Fixes: 18f1a773e3f9 ("arm64: dts: renesas: r8a77995: add DU support")
>
> Signed-off-by: Yoshihiro Kaneko <ykaneko0929@gmail.com>

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
I.e., applied and queued for v5.4.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
