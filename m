Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3203F3D3D0B
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 23 Jul 2021 18:00:49 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235672AbhGWPUO (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Fri, 23 Jul 2021 11:20:14 -0400
Received: from mail-vk1-f170.google.com ([209.85.221.170]:44605 "EHLO
        mail-vk1-f170.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235568AbhGWPUO (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 23 Jul 2021 11:20:14 -0400
Received: by mail-vk1-f170.google.com with SMTP id r2so480183vkl.11;
        Fri, 23 Jul 2021 09:00:47 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=kz2EBjCsAE8kTLJ6Qp7R/EqU9Ne3qJlpSL4T+4ntcao=;
        b=L6hMlTeXaCjY9BDauADwH8o51jFv2xmoMxaJlV5/TubRqJcExNB07PyskSk7BXzgLv
         s3RKvak8lbQkl8YiLAEVMBQgVAZ30kGu8kEBUN4VUQvUEkTSWeaWqzNw9+X3usjpjZDD
         rFMGiA9t5ogmqf4UtuJmu6jjPG78lDitYqW8i8/OKnjaXRecf15dusLP2AjTFSFxPmFz
         K3puSa/vCTPz9/sJw4rlHpUUmDu7nxRx5h9xis6OcECVpAozDge3A+34KShRyf+q7rjD
         SuHg9AHeruaHSquzfDDn1+l6NSziasDIPzCXOUB2g3thYnMNfQwCX4Elaxc+ud7L0cjV
         KBTQ==
X-Gm-Message-State: AOAM530hPCi2nQ2zJfMEChNDktqvU8lka+DbLkR8AW28Zq1Bofg/Pzyv
        ZuwkzaHD2ONdWI4DtiGu77P5HqDiCJwFoeKW6cI=
X-Google-Smtp-Source: ABdhPJzzCeJFrifuGMRv6snVWW4e8W2J0sU+bXmUq86k1NPE6cgq9iw44JF/maccCCXJQiLTdAsbEjflVDMBQUDevYg=
X-Received: by 2002:a05:6122:a12:: with SMTP id 18mr4351968vkn.1.1627056046954;
 Fri, 23 Jul 2021 09:00:46 -0700 (PDT)
MIME-Version: 1.0
References: <20210721180632.15080-1-biju.das.jz@bp.renesas.com>
 <CAMuHMdWMB8o=GuvOtzBg6w6m3C030wu7-btT+FJ-dAZgNK3xsQ@mail.gmail.com> <OS0PR01MB592299E2554B073C582F29BE86E59@OS0PR01MB5922.jpnprd01.prod.outlook.com>
In-Reply-To: <OS0PR01MB592299E2554B073C582F29BE86E59@OS0PR01MB5922.jpnprd01.prod.outlook.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Fri, 23 Jul 2021 18:00:35 +0200
Message-ID: <CAMuHMdVD41xHG+4msRm1F8FScLraJJ7EFaadczvx3nXKtq3XVg@mail.gmail.com>
Subject: Re: [PATCH] arm64: dts: renesas: rzg2: Add internal rx delay
To:     Biju Das <biju.das.jz@bp.renesas.com>
Cc:     Rob Herring <robh+dt@kernel.org>,
        Magnus Damm <magnus.damm@gmail.com>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>,
        Chris Paterson <Chris.Paterson2@renesas.com>,
        Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi Biju,

On Fri, Jul 23, 2021 at 5:52 PM Biju Das <biju.das.jz@bp.renesas.com> wrote:
> > Subject: Re: [PATCH] arm64: dts: renesas: rzg2: Add internal rx delay
> > On Wed, Jul 21, 2021 at 8:06 PM Biju Das <biju.das.jz@bp.renesas.com>
> > wrote:
> > > Hihope boards use Realtek PHY. From the very beginning it use only tx
> > > delays. However the phy driver commit bbc4d71d63549bcd003
> > > ("net: phy: realtek: fix rtl8211e rx/tx delay config") introduced NFS
> > > mount failure. Now it needs rx delay inaddition to tx delay for NFS
> > > mount to work. This patch fixes NFS mount failure issue by adding MAC
> > > internal rx delay.
> > >
> > > Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
> >
> > Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be> i.e. will queue
> > in renesas-devel for v5.15.
> >
> > Do you want a Fixes: tag?
>
> It is a tricky situation. The phy patch is introduced in 5.9 and is backported to 5.8.
> But we don't have MaC internal delays on those kernels. So Fixes for 5.10+ will be ok I guess,
> So that at least this fix will land on cip 5.10 kernel.

Fixes: bbc4d71d63549bcd ("net: phy: realtek: fix rtl8211e rx/tx delay config")

Then the stable people are at least aware that backporting the PHY
commit can cause issues.

So after it has hit upstream, you can send the patch to stable with the
following added:

Cc: stable@vger.kernel.org # 5.10.x: a6f51f2efa742df0 ravb: Add
support for explicit internal clock delay configuration

I hope I got the syntax right. And there may be dependencies to backport,
too.

As this doesn't fix an issue introduced in v5.13 or v5.14-rc1, I'll queue
this for v5.15. CIP can still take it.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
