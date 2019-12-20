Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 66AD9128066
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 20 Dec 2019 17:13:27 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727413AbfLTQNT (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Fri, 20 Dec 2019 11:13:19 -0500
Received: from mail-ot1-f67.google.com ([209.85.210.67]:37979 "EHLO
        mail-ot1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727181AbfLTQNT (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 20 Dec 2019 11:13:19 -0500
Received: by mail-ot1-f67.google.com with SMTP id d7so8046795otf.5;
        Fri, 20 Dec 2019 08:13:18 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=BEyJkL5nJjdN0xBLrqIKs638OAVTma/KQjSXpanBYC0=;
        b=b31w2Mk7mNSPj32SGqZKZDTdo+/1pl8/tKcWc2+QvmriQmXgqs1jXebtZQgdT+n7M0
         /cTUlxs3LgOuZnQisbLs47pPOvuuTuImjiQ5y0kaSZx9eNxSxrr5pfA71LGONbr6RPZ3
         qjhqUVElcnXVLZSxuyOex+rlbIzqqBimmEwVVfojAD/k9mBc9AxB1sNQ6aC9XDSLkM6Z
         2Rz9JiNVW3jwj2bq4tBm2hck/Z5GsdKTZcNHsZBNW/O8iZc+nTwLs3A9bF7ugGonoW1v
         GeBjS3Gq0ThEaMcHaL1NX1CAVsR2CdY4hq8eMUyLIOaKaby7wbz8egCd2nhIhEmATWrl
         zi2w==
X-Gm-Message-State: APjAAAURGjH3GSkl50CdhvPc2y4UtcZIU8OGYJEPqtiadrgBJPucR0is
        Fo1dsMtViy6uqBkdaEkbIGHoXQ7M+/RvDP5Y/aqp22JK
X-Google-Smtp-Source: APXvYqw2edjR1mdY9qcPfm42FIvOAjdlNrhZq3ZMLOJGE/Ujtj9AfteAIggoEIn8QqzEsgg0qFFoNnGcOZZJD9Z5O7c=
X-Received: by 2002:a9d:2073:: with SMTP id n106mr5985808ota.145.1576858398139;
 Fri, 20 Dec 2019 08:13:18 -0800 (PST)
MIME-Version: 1.0
References: <20191218135230.2610161-1-ben.dooks@codethink.co.uk>
In-Reply-To: <20191218135230.2610161-1-ben.dooks@codethink.co.uk>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Fri, 20 Dec 2019 17:13:07 +0100
Message-ID: <CAMuHMdWgtOh=MN3wEgTcnQFTBjUwxXUaBvRknxhzQk2DYzN7gA@mail.gmail.com>
Subject: Re: [PATCH] soc: renesas: rcar-rst: fix __iomem on configure call
To:     "Ben Dooks (Codethink)" <ben.dooks@codethink.co.uk>
Cc:     Geert Uytterhoeven <geert+renesas@glider.be>,
        Magnus Damm <magnus.damm@gmail.com>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi Ben,

On Wed, Dec 18, 2019 at 2:52 PM Ben Dooks (Codethink)
<ben.dooks@codethink.co.uk> wrote:
> The configure call back takes a register pointer, so should
> have been marked with __iomem. Add this to silence the
> following sparse warnings:
>
> rivers/soc/renesas/rcar-rst.c:33:22: warning: incorrect type in initializer (incompatible argument 1 (different address spaces))

d

> drivers/soc/renesas/rcar-rst.c:33:22:    expected int ( *configure )( ... )
> drivers/soc/renesas/rcar-rst.c:33:22:    got int ( * )( ... )
> drivers/soc/renesas/rcar-rst.c:97:40: warning: incorrect type in argument 1 (different address spaces)
> drivers/soc/renesas/rcar-rst.c:97:40:    expected void *base
> drivers/soc/renesas/rcar-rst.c:97:40:    got void [noderef] <asn:2> *[assigned] base
>
> Signed-off-by: Ben Dooks (Codethink) <ben.dooks@codethink.co.uk>

Thanks!

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
i.e. will queue in renesas-devel for v5.6...

> --- a/drivers/soc/renesas/rcar-rst.c
> +++ b/drivers/soc/renesas/rcar-rst.c
> @@ -21,7 +21,7 @@ static int rcar_rst_enable_wdt_reset(void __iomem *base)
>
>  struct rst_config {
>         unsigned int modemr;            /* Mode Monitoring Register Offset */
> -       int (*configure)(void *base);   /* Platform specific configuration */
> +       int (*configure)(void __iomem *base);   /* Platform specific configuration */

... with s/configuration/config/ to conform to the 80-char line limit.

>  };
>
>  static const struct rst_config rcar_rst_gen1 __initconst = {

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
