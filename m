Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1717D276EA4
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 24 Sep 2020 12:24:35 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727442AbgIXKYd (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Thu, 24 Sep 2020 06:24:33 -0400
Received: from mail-ot1-f67.google.com ([209.85.210.67]:39960 "EHLO
        mail-ot1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727089AbgIXKYc (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 24 Sep 2020 06:24:32 -0400
Received: by mail-ot1-f67.google.com with SMTP id c2so607866otp.7;
        Thu, 24 Sep 2020 03:24:32 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=j6aF1e/PgsLm/et9d4vYdIAT9mmYwtgzzxEyzyGUgsg=;
        b=EavTM1rbVvBVeuTIb+urvHEq+FqKfi2slcKR+BXpB4PzyNCoU+wTDTLgWtFyrkNA5m
         Lksyvvlyfw0MLEvGHvIYNRygH5n7s/quHUYkDgkdlJrDyQRluXVSc4TgqKqatnPhkFbq
         OOYV3HhHpsPdQaFU8VB4UlwHtVan0N42QmYEo0TVCbJmTSMlwcgGgUtuSF9IU8XrwYFV
         DPNtZBjnKhXSLsbYrn6ICieuDcJx9clAIy05bA1R/PK16Mx5RPAfWpSWYzUU3h4DgT35
         pnaxN+dSx47729QwckVWQx9Lkd8Cdm1pUbJu/hQpZlJ8AhTUQRwkcq4EPmo5A4OypgC0
         xs/Q==
X-Gm-Message-State: AOAM5327zG5+zZYcJGP6yRe+Y506FKSkDkW3rwvbaX6GzhjYO2j1UkAa
        PJPeoSZEcFvs/EAxnEV2KvniSh2S169N78mQpJM=
X-Google-Smtp-Source: ABdhPJw57fD7/OM8uEp/PKMXBvSOxUQF1vAdLsacJx8iHl0r1mvXOTDOQ61/SmWSu3pLxi4bIXmCtc9V/rFPAGU1ZF4=
X-Received: by 2002:a9d:3b76:: with SMTP id z109mr2655049otb.250.1600943071845;
 Thu, 24 Sep 2020 03:24:31 -0700 (PDT)
MIME-Version: 1.0
References: <20200924080535.3641-1-biju.das.jz@bp.renesas.com>
 <CAMuHMdV5m3LH9QyX=Gau5UsDz3AZvqNOgCJiHb6Je+7qS0Ltvw@mail.gmail.com> <TYBPR01MB530919C0B122741BF8D25A8B86390@TYBPR01MB5309.jpnprd01.prod.outlook.com>
In-Reply-To: <TYBPR01MB530919C0B122741BF8D25A8B86390@TYBPR01MB5309.jpnprd01.prod.outlook.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Thu, 24 Sep 2020 12:24:20 +0200
Message-ID: <CAMuHMdVtmd8P=di-VSLMOE0zgL7vZw1N=znqhX3C0oPJ9GiwuA@mail.gmail.com>
Subject: Re: [PATCH] ARM: dts: iwg20d-q7-common: Fix touch controller probe failure
To:     Biju Das <biju.das.jz@bp.renesas.com>
Cc:     Rob Herring <robh+dt@kernel.org>,
        Magnus Damm <magnus.damm@gmail.com>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>,
        Chris Paterson <Chris.Paterson2@renesas.com>,
        Biju Das <biju.das@bp.renesas.com>,
        Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi Biju,

On Thu, Sep 24, 2020 at 11:40 AM Biju Das <biju.das.jz@bp.renesas.com> wrote:
> > Subject: Re: [PATCH] ARM: dts: iwg20d-q7-common: Fix touch controller
> > probe failure
> > On Thu, Sep 24, 2020 at 10:05 AM Biju Das <biju.das.jz@bp.renesas.com>
> > wrote:
> > > As per the iWave RZ/G1M schematic, the signal LVDS_PPEN controls
> > > supply voltage for touch panel, LVDS receiver and RGB LCD panel. Add
> > > regulator for these device nodes and remove powerdown-gpios property
> > > from lvds-receiver node as it results in touch controller driver probe failure.
> > >
> > > Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
> > > Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> > > ---
> > > v4->v5 : Restored Laurent's Rb tag, since it is minor change, renaming
> > > v4->vcc-supply to power-supply
> > >
> > > v3->v4 : Incorporated Laurent's review
> > > v3->comments(https://patchwork.kernel.org/patch/11707887/)
> > >          Added Laurent's Reviewed-by tag
> > > v2->v3 : Added the missing part from the patch. removal of powerdown-
> > gpios property.
> > > v1->v2 : Add regulator in touch panel, LVDS receiver and RGB LCD panel
> > > v1->device nodes
> > >            (Ref: https://patchwork.kernel.org/patch/11707559/)
> > > v1 : https://patchwork.kernel.org/patch/11705819/
> >
> > Thanks for the update!
> >
> > As the prerequisites are now in next, I can queue this in renesas-devel for
> > v5.11 after v5.10-rc1 has been released.
> > Or do you think this should be fast-tracked as a fix for v5.10 or v5.9?
>
> I think it should be fast tracked, since it is a regression. Also we need to fast track  the dependency patches as well.

OK.

> Fixes: 6f89dd9e9325 ("ARM: dts: iwg20d-q7-common: Add LCD support")
> [1] https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git/commit/?h=next-20200923&id=946a61ab2d758cc645f6e63f1a5e2731690c3943
> [2] https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git/commit/?h=next-20200923&id=2cd9df2be75766452fef87c37ec37d91f4cbaf6b

Does anything bad (e.g. another regression) happen if this patch is
applied, but the 2 patches above are not?
If not, I will queue this as a fix for v5.9.

> > I.e. is this an actual regression, or just something that never worked before?
> > Note that v1 had a Fixes tag, which was lost in subsequent versions.
>
> I missed to add fixes tag in subsequent versions.
> Fixes: 6f89dd9e9325 ("ARM: dts: iwg20d-q7-common: Add LCD support")

No worries, I can add that while applying.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
