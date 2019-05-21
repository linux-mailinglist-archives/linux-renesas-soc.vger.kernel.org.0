Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 1DFBA24AF2
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 21 May 2019 10:57:35 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726347AbfEUI5e (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Tue, 21 May 2019 04:57:34 -0400
Received: from mail-vs1-f65.google.com ([209.85.217.65]:39016 "EHLO
        mail-vs1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726242AbfEUI5e (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 21 May 2019 04:57:34 -0400
Received: by mail-vs1-f65.google.com with SMTP id m1so10657421vsr.6;
        Tue, 21 May 2019 01:57:33 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=MWFrnsjcMZzOTmITsHfZDdO5f966+UMJICUhzqvq5h0=;
        b=EHJYHbmfJ/Ce9Bofif58B++QmpKjWb1asJFeRpictQME4umq1MXbqwyOrPN2A8O0WU
         dS1Q5yXnVeEpd17XFKVHJTVKtd7zFjqjxGVqHrfSS5vOjY29R3pe7bydOmCw9vuzp+ld
         uTa/mrdHUcJJifa1DqLQVpoItWiy8Fac8ULwZ14XMgEKMs0rrXbD2I0lcSHB9ruM4BnE
         ycTFdcRIZBj2pSO9I1RQl0fWUM6dXFfSbspL7bok0hvr/rjBLp7BVuXF49GsF/Y+rA9x
         eCpu8u8YIGkq0iTLyfxD/roA80N1tK724nbuF8fqMX1SRkZn6ZY7VaZH07cKTFymN6XD
         dtNQ==
X-Gm-Message-State: APjAAAWJfjfkAZ+S4N0RSHizqUNWjah5QCJeuSTiGiK7bbYTaOzkVDdQ
        /AQEZJS03x2aE80bONm1rY8EfteEk/kuLfZIQGg=
X-Google-Smtp-Source: APXvYqyKZ9voK/cBbfTTXNvd4b2tLuD8JGb4aR0X6oA2nKaW2C6ZwK0EDtOV6rN+FFV/9oMnPctGM0nmJDs2gCaq+BU=
X-Received: by 2002:a67:770f:: with SMTP id s15mr30405388vsc.11.1558429053082;
 Tue, 21 May 2019 01:57:33 -0700 (PDT)
MIME-Version: 1.0
References: <20190514153341.22540-1-chris.paterson2@renesas.com>
 <155786877257.14659.6751252865489860937@swboyd.mtv.corp.google.com>
 <CAMuHMdWPSyrhYx5Z5mgmKrR68cHL6owcRT=B3+DD3GhhxuG4zw@mail.gmail.com> <20190516215406.75E5D2082E@mail.kernel.org>
In-Reply-To: <20190516215406.75E5D2082E@mail.kernel.org>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Tue, 21 May 2019 10:57:20 +0200
Message-ID: <CAMuHMdVOKDRYjzmyRq-KXW8d+dYmAxnM+=y2yOh85YDcCEDMuw@mail.gmail.com>
Subject: Re: [PATCH] scripts/spelling.txt: Add spelling fix for prohibited
To:     Stephen Boyd <sboyd@kernel.org>
Cc:     Andrew Morton <akpm@linux-foundation.org>,
        Chris Paterson <chris.paterson2@renesas.com>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Biju Das <biju.das@bp.renesas.com>,
        linux-clk <linux-clk@vger.kernel.org>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi Stephen, Andrew,

On Thu, May 16, 2019 at 11:54 PM Stephen Boyd <sboyd@kernel.org> wrote:
> Quoting Geert Uytterhoeven (2019-05-15 00:32:46)
> > On Tue, May 14, 2019 at 11:19 PM Stephen Boyd <sboyd@kernel.org> wrote:
> > > Quoting Chris Paterson (2019-05-14 08:33:41)
> > > > Misspelling 'prohibited' is quite common in the real world, although
> > > > surprisingly not so much in the Linux Kernel. In addition to fixing the
> > > > typo we may as well add it to the spelling checker.
> > > >
> > > > Also adding the present participle (prohibiting).
> > > >
> > > > Fixes: 5bf2fbbef50c ("clk: renesas: cpg-mssr: Add r8a77470 support")
> > > >
> > > > Signed-off-by: Chris Paterson <chris.paterson2@renesas.com>
> >
> > Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
> >
> > > Acked-by: Stephen Boyd <sboyd@kernel.org>
> >
> > Thanks!
> >
> > So I guess I'll queue this in clk-renesas-for-v5.3?
> >
>
> Guess so! Or Andrew does it.

Given the change to scripts/spelling.txt conflicts with b937856a5db2cb7a
("scripts/spelling.txt: add more typos to spelling.txt and sort") in
linux-next, and the risk of conflict with future changes to
drivers/clk/renesas/r8a77470-cpg-mssr.c is slim, I'd like to defer this
to Andrew.

Acked-by: Geert Uytterhoeven <geert+renesas@glider.be>

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
