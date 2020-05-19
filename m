Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4C8991D9547
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 19 May 2020 13:28:53 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728633AbgESL2q (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Tue, 19 May 2020 07:28:46 -0400
Received: from mout.kundenserver.de ([212.227.126.134]:43685 "EHLO
        mout.kundenserver.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726157AbgESL2q (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 19 May 2020 07:28:46 -0400
Received: from mail-qv1-f53.google.com ([209.85.219.53]) by
 mrelayeu.kundenserver.de (mreue009 [212.227.15.129]) with ESMTPSA (Nemesis)
 id 1MD9Kj-1jjZ873ugj-009A98; Tue, 19 May 2020 13:28:43 +0200
Received: by mail-qv1-f53.google.com with SMTP id g20so6254437qvb.9;
        Tue, 19 May 2020 04:28:42 -0700 (PDT)
X-Gm-Message-State: AOAM53169dBAgh8P3wFfy5W3dx7yLlAqSWDOnnio9wJY4xoZEtukxaP9
        VvoLWZolSj1GxVRlpScsb9ssXo/c0WappXN01Ag=
X-Google-Smtp-Source: ABdhPJx+Ipnp1De8u1nx4B4U7GgZtHcjTeorwfefYcSy2qSkv9jr1bxjHK/e2HLBvFYfYy1Fq3XFH9dyxPrnUgH7uP8=
X-Received: by 2002:a05:6214:1392:: with SMTP id g18mr19411615qvz.210.1589887721612;
 Tue, 19 May 2020 04:28:41 -0700 (PDT)
MIME-Version: 1.0
References: <CGME20200429082134eucas1p2415c5269202529e6b019f2d70c1b5572@eucas1p2.samsung.com>
 <20200429082120.16259-1-geert+renesas@glider.be> <dleftjmu645mqn.fsf%l.stelmach@samsung.com>
 <CAMuHMdXxq6m6gebQbWvxDynDcZ7dLyZzKC_QroK63L8FGeac1Q@mail.gmail.com>
 <20200519094637.GZ1551@shell.armlinux.org.uk> <CAMuHMdU5DG06G4H=+PH+OONMT_9oE==KS=wP+bLgY9xVCez6Ww@mail.gmail.com>
In-Reply-To: <CAMuHMdU5DG06G4H=+PH+OONMT_9oE==KS=wP+bLgY9xVCez6Ww@mail.gmail.com>
From:   Arnd Bergmann <arnd@arndb.de>
Date:   Tue, 19 May 2020 13:28:24 +0200
X-Gmail-Original-Message-ID: <CAK8P3a3H=7qx+Rz9sScTVCSMKWGwQ_ROnyoyK73A5yUd+_jbTw@mail.gmail.com>
Message-ID: <CAK8P3a3H=7qx+Rz9sScTVCSMKWGwQ_ROnyoyK73A5yUd+_jbTw@mail.gmail.com>
Subject: Re: [PATCH v6] ARM: boot: Obtain start of physical memory from DTB
To:     Geert Uytterhoeven <geert@linux-m68k.org>
Cc:     Russell King - ARM Linux admin <linux@armlinux.org.uk>,
        Lukasz Stelmach <l.stelmach@samsung.com>,
        Dmitry Osipenko <digetx@gmail.com>,
        Nicolas Pitre <nico@fluxnic.net>,
        Eric Miao <eric.miao@nvidia.com>,
        =?UTF-8?Q?Uwe_Kleine=2DK=C3=B6nig?= 
        <u.kleine-koenig@pengutronix.de>,
        Masahiro Yamada <masahiroy@kernel.org>,
        Ard Biesheuvel <ardb@kernel.org>,
        Marek Szyprowski <m.szyprowski@samsung.com>,
        Chris Brandt <chris.brandt@renesas.com>,
        Linux ARM <linux-arm-kernel@lists.infradead.org>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>, Rob Herring <robh+dt@kernel.org>,
        Grant Likely <grant.likely@arm.com>
Content-Type: text/plain; charset="UTF-8"
X-Provags-ID: V03:K1:CNVN5I2QxgwLHtGhj2XIlWHhA95Ln5IQ59NqTrneFm7uuYeJZ/d
 UXEYTD0Yz/hqn+uAYntGDrQmvtCB4QsBO9Jif4coYjmud+2+T/QnlKXOPYV7NQmuSOw7+FD
 lAtNH/7To3qRwMuf7HhGyrDio/xsfkWTHsFoW1PrfNkzbvyi5GC4RaupDdimwTg100a2bWR
 r3NQcEAF7c/t9uQxmPCtQ==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:l871HVkBlvM=:zHTVIOTzNjei48LbTdIcX/
 TrSj/+8R6dSKCZlzmqH3864ZfgKmGcOYDYcQB9p69p38pkzdzTVdBWT/eEJa82qJWm2sg35vE
 LurmOIZfHUxKtpVwK6CidDrOWZeENaxqtLxNVFvFkPATp0kgP9rKBY3/6Q0WNTLISx0DGf4Yl
 q/7hJVbk5uJuDdEYdFVSBAEhZoHyCniedaa9XW50XHe7tNzICbAoCO/YUzKqo/zrs7k6olayT
 4UMut0Diqte95Cc9Ml973Gew1NJLCybZBQkDYC4IbzbZ2DOmubW2tsY/RrCVPm/0QuYThJJwu
 ReuU/cAh3GSgviy0bd2xuyWdvEhke6EYlt9OkvH9y8hE7bTfnWrFsvA6p8eIzYotef+34HgzW
 L0JqS8ELWFSp+RCeTaDeEBL3qVN5iuoWkoU9ZSsBV4UyXcU74IWqP7W86swJQLUqRqnR+y2Yc
 S0sOiQhhfw5xzz4H3CtCCoEtHlLfQuj70zFfsQd8hDA/wdMZcm0P56vRbt+Tt9xhyz3AxvjTs
 FKJTm2zbvNGmSMuXKFV+LpRqml392FIPtLfGRiC3s0HSmloqlDQm2n9AaeDeb+W1psYnIPz+r
 L+cOrh2++ep6obIbe01o3DfYoYcmrU6St94x0TVnHLfm8q4FbVB8/9G3OFs9Hgd9gllWRW5DZ
 686tid+owAchEhOurHWyAyR9gfPullL8b32xP2Qgj1sWPu5oyXQRRV83Er5UqbGX/pSM1Ogil
 OAnD3x8eQmjWF7bUFnDt/QYc4BnxfGRYvCLj9DWm/RxEYBClmm49Xwk4DMVoBwhC2oH1JYkm+
 rVoHTqEIlLBbCiEYO/O3FP+1PbbgajOar0xaov3SQYsrHIpPyg=
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

On Tue, May 19, 2020 at 1:21 PM Geert Uytterhoeven <geert@linux-m68k.org> wrote:
> On Tue, May 19, 2020 at 11:46 AM Russell King - ARM Linux admin
> <linux@armlinux.org.uk> wrote:

> >
> > > However, something under /chosen should work.
> >
> > Yet another sticky plaster...
>
> IMHO the old masking technique is the hacky solution covered by
> plasters.
>
> DT describes the hardware.  In general, where to put the kernel is a
> software policy, and thus doesn't belong in DT, except perhaps under
> /chosen.  But that would open another can of worms, as people usually
> have no business in specifying where the kernel should be located.
> In the crashkernel case, there is a clear separation between memory to
> be used by the crashkernel, and memory to be solely inspected by the
> crashkernel.
>
> Devicetree Specification, Release v0.3, Section 3.4 "/memory node" says:
>
>     "The client program may access memory not covered by any memory
>      reservations (see section 5.3)"
>
> (Section 5.3 "Memory Reservation Block" only talks about structures in
> the FDT, not about DTS)
>
> Hence according to the above, the crashkernel is rightfully allowed to
> do whatever it wants with all memory under the /memory node.
> However, there is also
> Documentation/devicetree/bindings/reserved-memory/reserved-memory.txt.
> This suggests the crashkernel should be passed a DTB that contains a
> /reserved-memory node, describing which memory cannot be used freely.
> Then the decompressor needs to take this into account when deciding
> where the put the kernel.
>
> Yes, the above requires changing code. But at least it provides a
> path forward, getting rid of the fragile old masking technique.

There is an existing "linux,usable-memory-range" property documented
in Documentation/devicetree/bindings/chosen.txt, which as I understand
is exactly what you are looking for, except that it is currently only
documented for arm64.

Would extending this to arm work?

      Arnd
