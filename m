Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2648045593E
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 18 Nov 2021 11:39:45 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S244253AbhKRKmm (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Thu, 18 Nov 2021 05:42:42 -0500
Received: from mail-ua1-f41.google.com ([209.85.222.41]:35774 "EHLO
        mail-ua1-f41.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S245732AbhKRKmJ (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 18 Nov 2021 05:42:09 -0500
Received: by mail-ua1-f41.google.com with SMTP id l24so12631179uak.2
        for <linux-renesas-soc@vger.kernel.org>; Thu, 18 Nov 2021 02:39:09 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=++OPng/Csr4Po4OKcH4LWGrGxJVnkSXKhfbGiYkBgrs=;
        b=1rc7rWeqCtaIUssaP1IgnL5vGXhZc7STwKv22AfYsZcRSDo41czXtqknYNvsncK9+R
         2GlmgF5mPr8+676gQd+PCEcEv5te8751dauUl3L7ZveZkWodMjp6JXs5eebqEC1W84uP
         OOmEkDlocT8ZxzZW1w7pZoRouUMXhFfvi/MzKNbVbUiN75spMcQuMR2RBBZ8HxsSblk7
         zmXbIM8ysUJaDzbip6niC8e2jIRSdmoR+yuzlDKZMLk2YaOIDojiZzrnlLGaooupI6ve
         n53wISDypotm0/5o7AW3UcP7HY001Lvz6qYd4XJpJUc0igLhlbaTKSJLzfWYaLBw4S+i
         pmCQ==
X-Gm-Message-State: AOAM532npB3lsV5bijZcllYKHf94jqyNd+sb111KP7C7AKrKDPRw4Ihi
        6+yJZvIYtdlqA+HMFFKiX1F0CA7B4qqMxw==
X-Google-Smtp-Source: ABdhPJyjA4YGoEMkMAs7lQ6IFk26OwWxUFuc0xRSiv68ZvhpmpWd1OXpcySJodK3p8E6x5BmEQ2vaA==
X-Received: by 2002:ab0:3d0d:: with SMTP id f13mr36214335uax.48.1637231948527;
        Thu, 18 Nov 2021 02:39:08 -0800 (PST)
Received: from mail-vk1-f181.google.com (mail-vk1-f181.google.com. [209.85.221.181])
        by smtp.gmail.com with ESMTPSA id f26sm1327746vkl.51.2021.11.18.02.39.07
        for <linux-renesas-soc@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 18 Nov 2021 02:39:08 -0800 (PST)
Received: by mail-vk1-f181.google.com with SMTP id d130so3541568vke.0
        for <linux-renesas-soc@vger.kernel.org>; Thu, 18 Nov 2021 02:39:07 -0800 (PST)
X-Received: by 2002:a05:6122:20ab:: with SMTP id i43mr101727564vkd.19.1637231947789;
 Thu, 18 Nov 2021 02:39:07 -0800 (PST)
MIME-Version: 1.0
References: <20211110084232.652-1-biju.das.jz@bp.renesas.com>
 <20211110084232.652-2-biju.das.jz@bp.renesas.com> <CAMuHMdXqLXiKobS-w3OyK-uUP2z=1Zq2y=rXiJn7SOfyDRoQFw@mail.gmail.com>
 <OS0PR01MB5922983090C977E32DF049DE86959@OS0PR01MB5922.jpnprd01.prod.outlook.com>
In-Reply-To: <OS0PR01MB5922983090C977E32DF049DE86959@OS0PR01MB5922.jpnprd01.prod.outlook.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Thu, 18 Nov 2021 11:38:56 +0100
X-Gmail-Original-Message-ID: <CAMuHMdV3JMakdWF6zokemK1fYrm3fV_=PzafF7J1vFmEvsj73Q@mail.gmail.com>
Message-ID: <CAMuHMdV3JMakdWF6zokemK1fYrm3fV_=PzafF7J1vFmEvsj73Q@mail.gmail.com>
Subject: Re: [PATCH 1/3] drivers: soc: renesas: Enable RENESAS_OSTM
To:     Biju Das <biju.das.jz@bp.renesas.com>
Cc:     Magnus Damm <magnus.damm@gmail.com>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        Chris Paterson <Chris.Paterson2@renesas.com>,
        Biju Das <biju.das@bp.renesas.com>,
        Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi Biju,

On Fri, Nov 12, 2021 at 4:32 PM Biju Das <biju.das.jz@bp.renesas.com> wrote:
> > Subject: Re: [PATCH 1/3] drivers: soc: renesas: Enable RENESAS_OSTM
> > On Wed, Nov 10, 2021 at 9:42 AM Biju Das <biju.das.jz@bp.renesas.com>
> > wrote:
> > > Enable General Timer Module (a.k.a OSTM) driver support for Renesas
> > > RZ/G2L based platforms.
> > >
> > > Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
> > > Reviewed-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> >
> > Thanks for your patch!
> >
> > > --- a/drivers/soc/renesas/Kconfig
> > > +++ b/drivers/soc/renesas/Kconfig
> > > @@ -286,6 +286,7 @@ config ARCH_R8A774B1
> > >
> > >  config ARCH_R9A07G044
> > >         bool "ARM64 Platform support for RZ/G2L"
> > > +       select RENESAS_OSTM
> > >         help
> > >           This enables support for the Renesas RZ/G2L SoC variants.
> >
> > As RZ/G2L uses the ARM Architected Timer as system timer, enabling the
> > OSTM is not mandatory.  Perhaps the RENESAS_OSTM symbol should be made
> > visible instead, so the user can enable it when wanted?
>
> I will do the below change to make RENESAS_OSTM symbol visible.
> Is it ok?
>
> config RENESAS_OSTM
> -       bool "Renesas OSTM timer driver" if COMPILE_TEST
> +       bool "Renesas OSTM timer driver"
> +       depends on ARCH_RENESAS || COMPILE_TEST

LGTM.

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
