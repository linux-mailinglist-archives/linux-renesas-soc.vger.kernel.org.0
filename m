Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id F3BF3220E49
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 15 Jul 2020 15:39:07 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731855AbgGONiK (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Wed, 15 Jul 2020 09:38:10 -0400
Received: from mail-oi1-f193.google.com ([209.85.167.193]:44854 "EHLO
        mail-oi1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1731790AbgGONiK (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 15 Jul 2020 09:38:10 -0400
Received: by mail-oi1-f193.google.com with SMTP id k6so2190145oij.11;
        Wed, 15 Jul 2020 06:38:09 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=rpk7FoJIXYoDhquzw41W4uL8Bx2a/st8jnaCqpOsLRM=;
        b=k4UPQtKX6p3MdHVQtXU8l4vD6W5kFBkz6h/c4RmYVDEJZ08acL++W+K9QHlYK/dgrk
         vSpIjOdyBfKvflSBF+7gvK3ngVKS2EVwBrhDPzbtqY5Zl2If5Ev9jORm7ZpUPncaEL7u
         +yguhKoSz8DkZxPzRpXKE4P2MoSb7+LcsJ5KV5rZuZPXMJsuMb6G8ymf9sID+ySc2J43
         lmkomHC5lJIt1elyLJuPQQTFL7sesFHsPORVB1AnpxSKU4UsulXhj6A5DNt+5TqNYTfY
         cynhquYOg1BUWjcLy8Ur6NkA5XlIEQzv1+xDvyNj0f0bgZn+ceJ6oiglRQAnRFxWKuYK
         m8KQ==
X-Gm-Message-State: AOAM532u6Z6b+F+qsUEpSgTlTIA/G5StxymzKcjONasrmPYBIElJE2jL
        KuAKg8HD9AfwaBaXflS3uYw4MnIypxCqu29u4Jc=
X-Google-Smtp-Source: ABdhPJx1CUlhcD4Tr/xaysC9VroMO0L/051qAqViZDTkfJwuC4MVmSl9LK3B9crOXglBMXe9jUrp0udBT4APMg+COM8=
X-Received: by 2002:aca:ac10:: with SMTP id v16mr7418357oie.153.1594820289414;
 Wed, 15 Jul 2020 06:38:09 -0700 (PDT)
MIME-Version: 1.0
References: <20200714123419.3390-1-aford173@gmail.com> <20200714123419.3390-2-aford173@gmail.com>
 <CAMuHMdVS6Hf344EbyroGCWR_yxtO3DZh=JUJhauy5OeVG2hajA@mail.gmail.com> <CAHCN7xKpXErWc8Bjji1==8+AL-9oeFn3QsP-qmE4QD2NpGt=3Q@mail.gmail.com>
In-Reply-To: <CAHCN7xKpXErWc8Bjji1==8+AL-9oeFn3QsP-qmE4QD2NpGt=3Q@mail.gmail.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Wed, 15 Jul 2020 15:37:58 +0200
Message-ID: <CAMuHMdUy8KApTe=hKVsqaEhSJzne+ZwcWT8fcLu+2OdNDTLiYw@mail.gmail.com>
Subject: Re: [PATCH V2 2/2] dt-bindings: arm: renesas: Document beacon-rzg2m
To:     Adam Ford <aford173@gmail.com>
Cc:     Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        Adam Ford-BE <aford@beaconembedded.com>,
        Magnus Damm <magnus.damm@gmail.com>,
        Rob Herring <robh+dt@kernel.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi Adam,

On Wed, Jul 15, 2020 at 3:27 PM Adam Ford <aford173@gmail.com> wrote:
> On Wed, Jul 15, 2020 at 3:58 AM Geert Uytterhoeven <geert@linux-m68k.org> wrote:
> > On Tue, Jul 14, 2020 at 2:34 PM Adam Ford <aford173@gmail.com> wrote:
> > > Beacon EmbeddedWorks in introducing a development kit based on the
> > > Renesas RZ/G2M platform.  This patch adds the entry to the bindings
> > > list.
> > >
> > > Signed-off-by: Adam Ford <aford173@gmail.com>
> >
> > Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
> > i.e. will queue in renesas-devel for v5.9, with the typo pointed out
> > by Sergei fixed.
>
> Since you pointed out some stuff I should correct in patch 1/2.
> Should I just re-submit the first patch by itself, or do you want me
> to submit 2/2 with these fixes?

Just resubmitting the first patch is fine for me.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
