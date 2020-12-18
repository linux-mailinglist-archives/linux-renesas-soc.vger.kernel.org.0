Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id F18192DE34B
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 18 Dec 2020 14:29:57 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725789AbgLRN35 (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Fri, 18 Dec 2020 08:29:57 -0500
Received: from mail-ot1-f50.google.com ([209.85.210.50]:34284 "EHLO
        mail-ot1-f50.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725440AbgLRN35 (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 18 Dec 2020 08:29:57 -0500
Received: by mail-ot1-f50.google.com with SMTP id a109so1898661otc.1;
        Fri, 18 Dec 2020 05:29:41 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=aMRGB449hjz5tfuR0cZWzoGKIVx7fyplgJfzyOfEfhg=;
        b=gDDFz/XJgKSgwSuQr9nmO+kDJ58QntDkXnqWRb/aaZLawyjIEFYXaWckGsyFnqWjls
         DKU74RbFhR25ikO5TdKtmfLhyIXoJJdZ6GDXxAB9zH7lbz1jl4JbV5E3Ue/juTPzKofb
         HDih9RZTImU0VJ/sw2JaeRuBpLPSkFg+PqScOuUO/JbGZWdIhD8xKIQHWLXJbGVLXWyB
         qKh6ZshC4gx+0mo8vipjzvEcoyfwIY8RV3HRvos+nXN8nIcRjWK0XzfUJ4B4sLjUI3yE
         CjCAnLPB3jCs7dGsSxvqDiDDagy4eRht75jpP4bLZqTpd52/NygdC6SFwssPtSNQVelh
         aneg==
X-Gm-Message-State: AOAM531pYJ4z9Jh5zitGRp+IjmuaC/VmCkB1dtq0efUsR+nlMha5eQGv
        Bs3BEUBu7SX2tgVqvsYdUZlufsr4xfPc6ICNw1w=
X-Google-Smtp-Source: ABdhPJw0kFu8R3jrLPsYIAAeOQvwlI0hDakunZDCOY0invsd+TvMd3D7hg33Z1b4fYYABq8651r+PbX/xUjvDi7GQ/c=
X-Received: by 2002:a9d:2203:: with SMTP id o3mr2771790ota.107.1608298156545;
 Fri, 18 Dec 2020 05:29:16 -0800 (PST)
MIME-Version: 1.0
References: <20201216151931.851547-1-kieran.bingham+renesas@ideasonboard.com> <20201216151931.851547-2-kieran.bingham+renesas@ideasonboard.com>
In-Reply-To: <20201216151931.851547-2-kieran.bingham+renesas@ideasonboard.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Fri, 18 Dec 2020 14:29:04 +0100
Message-ID: <CAMuHMdU-qXvV67czohtXm7j0--nmL9iHtED38i1f40guYKDxaA@mail.gmail.com>
Subject: Re: [PATCH 1/3] clk: renesas: r8a779a0: Add FCPVD clock support
To:     Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>
Cc:     Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        linux-clk <linux-clk@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

On Wed, Dec 16, 2020 at 4:19 PM Kieran Bingham
<kieran.bingham+renesas@ideasonboard.com> wrote:
> Add clocks for the FCP for VSP-D module.
>
> Signed-off-by: Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>

Let's trust the BSP on the parent clocks...

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
i.e. will queue in renesas-clk-for-v5.12.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
