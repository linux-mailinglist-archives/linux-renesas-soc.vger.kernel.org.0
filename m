Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 4386ED394C
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 11 Oct 2019 08:24:21 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726508AbfJKGYU (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Fri, 11 Oct 2019 02:24:20 -0400
Received: from mail-ot1-f66.google.com ([209.85.210.66]:38586 "EHLO
        mail-ot1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726401AbfJKGYU (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 11 Oct 2019 02:24:20 -0400
Received: by mail-ot1-f66.google.com with SMTP id e11so7031722otl.5;
        Thu, 10 Oct 2019 23:24:19 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=wqH28Wgy5XWdZC93SRfUsKq/9YOvOsGCUjreqzk83Gk=;
        b=SJjqbeKRZWQlUkXWH70iUjsZ0E1wBNX1Lbm3s9Rc2b+Ur7N9ZyNHjtA8iYFny8tkpD
         j12pMHt413P5RXs1yNirV2iOjyNX/wMQqw+n8OCLBwvmiq6LLzz1uOhTItff30ifjP+z
         GdEmp3P+03h2S9YusjstKG4MR8I2T1BYFfB0/d1ZdpGYIASRo5zHPb0ky+vgysYT3ryh
         mOkdvHaGLy9lETLOrjRve9Ae3S0xXhTGAsaETwKeevMwzPORGMljvrkl3FxrmLoQZATa
         QcKRHtjweBoC9U+31Z8lIrISNElQ0NNWsGP3Fa2EwzU/WAuli5JCOUXQHbZKp0opQuau
         +i6A==
X-Gm-Message-State: APjAAAUfeW8oI9cUOT1pnlY5N8pHu9hhBdox4v6+rmXthqlkGC4hSSEw
        6GQKvbR7cgb4ostmlwFDvPnLmT02m60DrDXzp48=
X-Google-Smtp-Source: APXvYqwxOor4RfihqgN3JVbtlFkewd5BTf8h1xQOCtR1ReSQo5uAggV1fh25p047jHcSVf4NgTkIHSsDZwiQ7Gum/WI=
X-Received: by 2002:a05:6830:1b75:: with SMTP id d21mr11190915ote.145.1570775059475;
 Thu, 10 Oct 2019 23:24:19 -0700 (PDT)
MIME-Version: 1.0
References: <20191010123046.15291-1-geert+renesas@glider.be> <20191011073515.2933918c@canb.auug.org.au>
In-Reply-To: <20191011073515.2933918c@canb.auug.org.au>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Fri, 11 Oct 2019 08:24:06 +0200
Message-ID: <CAMuHMdXNQtSzGMyxF18A_yxNJt9k28M82u4TUXHS9kXOcgoMYA@mail.gmail.com>
Subject: Re: [PATCH] MAINTAINERS: Remove Simon as Renesas SoC Co-Maintainer
To:     Stephen Rothwell <sfr@canb.auug.org.au>
Cc:     Geert Uytterhoeven <geert+renesas@glider.be>,
        Linus Torvalds <torvalds@linux-foundation.org>,
        Simon Horman <horms@verge.net.au>,
        Magnus Damm <magnus.damm@gmail.com>,
        Arnd Bergmann <arnd@arndb.de>,
        Kevin Hilman <khilman@kernel.org>,
        Olof Johansson <olof@lixom.net>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        Linux ARM <linux-arm-kernel@lists.infradead.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi Stephen,

On Thu, Oct 10, 2019 at 10:35 PM Stephen Rothwell <sfr@canb.auug.org.au> wrote:
> On Thu, 10 Oct 2019 14:30:46 +0200 Geert Uytterhoeven <geert+renesas@glider.be> wrote:
> > At the end of the v5.3 upstream kernel development cycle, Simon stepped
> > down from his role as Renesas SoC maintainer.
> >
> > Remove his maintainership, git repository, and branch from the
> > MAINTAINERS file, and add an entry to the CREDITS file to honor his
> > work.
> >
> > Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
>
> So, I will remove Simon's Renesas tree from linux-next and rename the
> renesas-geert tree to be renesas, OK?

Thanks, that's exactly what I intended to happen ;-)

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
