Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A2D4640237C
	for <lists+linux-renesas-soc@lfdr.de>; Tue,  7 Sep 2021 08:34:28 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232641AbhIGGfL (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Tue, 7 Sep 2021 02:35:11 -0400
Received: from mail-vs1-f41.google.com ([209.85.217.41]:46905 "EHLO
        mail-vs1-f41.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232556AbhIGGfI (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 7 Sep 2021 02:35:08 -0400
Received: by mail-vs1-f41.google.com with SMTP id s15so7367581vst.13;
        Mon, 06 Sep 2021 23:34:02 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=lAwq8Kz5BJXWbXAWWXg3GICCVqYgfs6fTC+WHIAPs0s=;
        b=PooQILlWg/ikCW6VHq0G/sTI83x+sZyluDoxeJY5zQaX7CKHUQLYeelXTeNUrZsFnL
         tnY2V7bYEoNCJ2RJJjTs3V5+OKlqNKooFH3iU6Dn4XAl+YUf+LYYKzb9TKcwceWI9WOw
         2S2bQiWJH3IPgAVvcO6/2NMQuCZfOjn0zrh+1mbZZm0XVrnEjEe09lbj3KFqOXaVlgLG
         qg5O4KnZrcYqIBXmJGMIIiEWaLqg5uCZPksqrT+2ugZjI9SbC3vKbTDpXlHQd6GGgVwn
         lY1anccQzG7Z3ssSjWYoHd1NBgHcfVDkIsDWOfYjxuWhHxSuI910oSxOZ+kXs6XlGqdf
         kAFA==
X-Gm-Message-State: AOAM5324AUzl/n0mh8Eob9wW3FF6C3dI45fSdlBWHoDLAUfUL0pxS9gq
        TRilDgUVpMwaWpmSMgYF8ROleNVjBvnQ7sAdgdk=
X-Google-Smtp-Source: ABdhPJyhRtaiWCrjRuNpcglvcFY1ZGVwAt5Lheu+GacCJU9O2eHayMbrzMBfznNEFWckfOmf2dCY6YCuoJZHhFeHsWU=
X-Received: by 2002:a67:cb0a:: with SMTP id b10mr8064800vsl.9.1630996442148;
 Mon, 06 Sep 2021 23:34:02 -0700 (PDT)
MIME-Version: 1.0
References: <20210901102705.556093-1-yoshihiro.shimoda.uh@renesas.com>
 <20210901102705.556093-3-yoshihiro.shimoda.uh@renesas.com>
 <CAMuHMdXwf0_+VKfuiFQf6roZErz-JAm06P5RBzD-Jwm1uk=p9A@mail.gmail.com> <TY2PR01MB36928CB43B188D4082829A1FD8D39@TY2PR01MB3692.jpnprd01.prod.outlook.com>
In-Reply-To: <TY2PR01MB36928CB43B188D4082829A1FD8D39@TY2PR01MB3692.jpnprd01.prod.outlook.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Tue, 7 Sep 2021 08:33:50 +0200
Message-ID: <CAMuHMdVmkJqiK3XB3s_ibnqy9SUSUFW6mny+kefOYaWi9Ce-4g@mail.gmail.com>
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

On Tue, Sep 7, 2021 at 2:02 AM Yoshihiro Shimoda
<yoshihiro.shimoda.uh@renesas.com> wrote:
> > From: Geert Uytterhoeven, Sent: Tuesday, September 7, 2021 12:34 AM
> > On Wed, Sep 1, 2021 at 12:27 PM Yoshihiro Shimoda
> > <yoshihiro.shimoda.uh@renesas.com> wrote:
> > > Add support for r8a779a0 (R-Car V3U). The IPMMU hardware design
> > > of this SoC differs than others. So, add a new ipmmu_features for it.
> > >
> > > Signed-off-by: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
> >
> > > --- a/drivers/iommu/ipmmu-vmsa.c
> > > +++ b/drivers/iommu/ipmmu-vmsa.c
> >
> > > @@ -922,6 +922,20 @@ static const struct ipmmu_features ipmmu_features_rcar_gen3 = {
> > >         .utlb_offset_base = 0,
> > >  };
> > >
> > > +static const struct ipmmu_features ipmmu_features_r8a779a0 = {
> > > +       .use_ns_alias_offset = false,
> > > +       .has_cache_leaf_nodes = true,
> > > +       .number_of_contexts = 8,
> >
> > Shouldn't this be 16?
> > Or do you plan to add support for more than 8 contexts later, as that
> > would require increasing IPMMU_CTX_MAX, and updating ipmmu_ctx_reg()
> > to handle the second bank of 8 contexts?
>
> I would like to add support for more than 8 contexts later because
> I realized that ctx_offset_{base,stride} are not suitable for the second bank
> of 8 contexts...

Wouldn't something like below be sufficient?

 static unsigned int ipmmu_ctx_reg(struct ipmmu_vmsa_device *mmu,
                                  unsigned int context_id, unsigned int reg)
 {
-       return mmu->features->ctx_offset_base +
-              context_id * mmu->features->ctx_offset_stride + reg;
+       unsigned int base = mmu->features->ctx_offset_base;
+
+       if (context_id > 7)
+               base += 0x800 - 8 * 0x1040;
+
+       return base + context_id * mmu->features->ctx_offset_stride + reg;
 }

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
