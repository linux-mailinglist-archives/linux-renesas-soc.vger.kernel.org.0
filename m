Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4791B402479
	for <lists+linux-renesas-soc@lfdr.de>; Tue,  7 Sep 2021 09:37:00 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234656AbhIGHhU (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Tue, 7 Sep 2021 03:37:20 -0400
Received: from mail-vs1-f51.google.com ([209.85.217.51]:36501 "EHLO
        mail-vs1-f51.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230261AbhIGHhT (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 7 Sep 2021 03:37:19 -0400
Received: by mail-vs1-f51.google.com with SMTP id f6so7513500vsr.3;
        Tue, 07 Sep 2021 00:36:13 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=gu8ftFQBmy6294PSiMcsspcGVUSc3c2tW9Gp1+2I/Zk=;
        b=oHAdNV6kX8K9G7Gz8/rhHwUzCkyBUXY46GXV+AEGo0eECjRySGzsnz3xkx5GXvWrP6
         ztB6ar9wDA3OKTg4cD/F0kGzXk+WbABGAUvxLuOSqRubZcBD/NpmR6DdHhNBkuDYuXf8
         CLeTdvO005y7HNzkUPWW/4+9YtB49eufXv2GasNNW73Y3j+CxzOUkr4NbCZ29jeZfsUe
         V48kEuRfhBkgwUxlvT7ohv5RGEUzBn4S9NsdO4KFClHojhFLl2HJ7C0BSMNiMdR89Jnf
         ODTRmXGehT95UIH8vGH6i9Fc0C9ZvHBD11lXdebSLCgMHmmB37cU6Eqi/4Z5Hl8mY3I7
         6LeQ==
X-Gm-Message-State: AOAM530DPsdROyRz1VWGt1z5lFb+bQLFU+qTpNIKX649cECZ2FpiUsrv
        r8+OL4Ggy+AGu+BcfMOkFAzDsY0wKkzbdLZ7Ono=
X-Google-Smtp-Source: ABdhPJz1Vb9NsSNDBeLVanlKheSFZ4A6ZkOJQuErr/vdKmi2vpPjRPiEEpL4KWRP6eJ+TUIxe8GtMC5FJy8iQZuSQ+E=
X-Received: by 2002:a67:efd6:: with SMTP id s22mr8284552vsp.50.1631000173016;
 Tue, 07 Sep 2021 00:36:13 -0700 (PDT)
MIME-Version: 1.0
References: <20210901102705.556093-1-yoshihiro.shimoda.uh@renesas.com>
 <20210901102705.556093-3-yoshihiro.shimoda.uh@renesas.com>
 <CAMuHMdXwf0_+VKfuiFQf6roZErz-JAm06P5RBzD-Jwm1uk=p9A@mail.gmail.com>
 <TY2PR01MB36928CB43B188D4082829A1FD8D39@TY2PR01MB3692.jpnprd01.prod.outlook.com>
 <CAMuHMdVmkJqiK3XB3s_ibnqy9SUSUFW6mny+kefOYaWi9Ce-4g@mail.gmail.com> <TY2PR01MB36929B7C850349E2FA9E547BD8D39@TY2PR01MB3692.jpnprd01.prod.outlook.com>
In-Reply-To: <TY2PR01MB36929B7C850349E2FA9E547BD8D39@TY2PR01MB3692.jpnprd01.prod.outlook.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Tue, 7 Sep 2021 09:36:01 +0200
Message-ID: <CAMuHMdUf7nR2r4b7KMhghmSKJWs1jz+SWZmGPJxg_2Wdd2Xqqw@mail.gmail.com>
Subject: Re: [PATCH 2/2] iommu/ipmmu-vmsa: Add support for r8a779a0
To:     Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
Cc:     Joerg Roedel <joro@8bytes.org>, Will Deacon <will@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Linux IOMMU <iommu@lists.linux-foundation.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi Shimoda-san,

On Tue, Sep 7, 2021 at 9:29 AM Yoshihiro Shimoda
<yoshihiro.shimoda.uh@renesas.com> wrote:
> > From: Geert Uytterhoeven, Sent: Tuesday, September 7, 2021 3:34 PM
> > On Tue, Sep 7, 2021 at 2:02 AM Yoshihiro Shimoda
> > <yoshihiro.shimoda.uh@renesas.com> wrote:
> > > > From: Geert Uytterhoeven, Sent: Tuesday, September 7, 2021 12:34 AM
> > > > On Wed, Sep 1, 2021 at 12:27 PM Yoshihiro Shimoda
> > > > <yoshihiro.shimoda.uh@renesas.com> wrote:
> > > > > Add support for r8a779a0 (R-Car V3U). The IPMMU hardware design
> > > > > of this SoC differs than others. So, add a new ipmmu_features for it.
> > > > >
> > > > > Signed-off-by: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
> > > >
> > > > > --- a/drivers/iommu/ipmmu-vmsa.c
> > > > > +++ b/drivers/iommu/ipmmu-vmsa.c
> > > >
> > > > > @@ -922,6 +922,20 @@ static const struct ipmmu_features ipmmu_features_rcar_gen3 = {
> > > > >         .utlb_offset_base = 0,
> > > > >  };
> > > > >
> > > > > +static const struct ipmmu_features ipmmu_features_r8a779a0 = {
> > > > > +       .use_ns_alias_offset = false,
> > > > > +       .has_cache_leaf_nodes = true,
> > > > > +       .number_of_contexts = 8,
> > > >
> > > > Shouldn't this be 16?
> > > > Or do you plan to add support for more than 8 contexts later, as that
> > > > would require increasing IPMMU_CTX_MAX, and updating ipmmu_ctx_reg()
> > > > to handle the second bank of 8 contexts?
> > >
> > > I would like to add support for more than 8 contexts later because
> > > I realized that ctx_offset_{base,stride} are not suitable for the second bank
> > > of 8 contexts...
> >
> > Wouldn't something like below be sufficient?
>
> Thank you for your suggestion!
>
> >  static unsigned int ipmmu_ctx_reg(struct ipmmu_vmsa_device *mmu,
> >                                   unsigned int context_id, unsigned int reg)
> >  {
> > -       return mmu->features->ctx_offset_base +
> > -              context_id * mmu->features->ctx_offset_stride + reg;
> > +       unsigned int base = mmu->features->ctx_offset_base;
> > +
> > +       if (context_id > 7)
> > +               base += 0x800 - 8 * 0x1040;
>
> This should be "base += 0x800 - 8 * 0x40;" because the 8th context address is
> 0x18800, not 0x10800.

Doh, I should have written my first thought ("base += FIXME" ;-)

> I'll send v2 patch to support 16 contexts.
> (I'll change IPMMU_CTX_MAX to 16 too.)

Thanks!

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
