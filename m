Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 796DF64D838
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 15 Dec 2022 10:04:53 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229763AbiLOJEv (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Thu, 15 Dec 2022 04:04:51 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49194 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229788AbiLOJEt (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 15 Dec 2022 04:04:49 -0500
Received: from mail-qt1-f172.google.com (mail-qt1-f172.google.com [209.85.160.172])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 71102442FB
        for <linux-renesas-soc@vger.kernel.org>; Thu, 15 Dec 2022 01:04:47 -0800 (PST)
Received: by mail-qt1-f172.google.com with SMTP id j16so4654278qtv.4
        for <linux-renesas-soc@vger.kernel.org>; Thu, 15 Dec 2022 01:04:47 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=lu90K/ctwOLQV8gWvT0jknM3Lq9BYGH2KzhYwJnHx5A=;
        b=gL06assHfV1gsScd+K8Nre8ni19BPvB7om4Ka24v5/SmNkCTAmMs0OYakwnnRYA+Hv
         mViY5JvtSMh7Dkq9VQtmmg9dNglMzbnWDeoRhE1/oN/od67m2JWhlFp5NP3MRIhW5rhz
         cCQrvBfpe+MddZnSFPnMu5qimC70X2dxdCSOpRZN4eEGzGv2URCH3B8KxtHUaSH4wKFX
         nJr8POzAUxTszzmIl2Li8NCZ0mM13KzUkd+mx7gl7ejd1bQZqjBnTbis7nZ6zfSG27DF
         Ek2CRZALhwv/9FbcRKdzZIQ7bAq+GetskrAWgSED5ZiOrA4oSqIjOcH7V2dGSyPHOyJL
         7fUA==
X-Gm-Message-State: ANoB5pleQlArlwRaifbTzy3z99c/huMlbRYf5QCgw4zzjLWSsfnYJ64i
        6QuVrmZ9zT8r+ijsE7J3InkZotItZvl0Yw==
X-Google-Smtp-Source: AA0mqf6817u92SoGIdKbn1EqI0op2WgxQRudNgR4Coi+9PVivwe22DD8EQjeakyAzr/AgmZS29LSCw==
X-Received: by 2002:a05:622a:1652:b0:3a8:1600:e60f with SMTP id y18-20020a05622a165200b003a81600e60fmr31228289qtj.14.1671095086257;
        Thu, 15 Dec 2022 01:04:46 -0800 (PST)
Received: from mail-yb1-f175.google.com (mail-yb1-f175.google.com. [209.85.219.175])
        by smtp.gmail.com with ESMTPSA id i4-20020ac860c4000000b003a7ee9613a6sm3112445qtm.25.2022.12.15.01.04.45
        for <linux-renesas-soc@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 15 Dec 2022 01:04:46 -0800 (PST)
Received: by mail-yb1-f175.google.com with SMTP id b16so2812952yba.0
        for <linux-renesas-soc@vger.kernel.org>; Thu, 15 Dec 2022 01:04:45 -0800 (PST)
X-Received: by 2002:a25:d655:0:b0:6fc:1c96:c9fe with SMTP id
 n82-20020a25d655000000b006fc1c96c9femr34391603ybg.36.1671095085279; Thu, 15
 Dec 2022 01:04:45 -0800 (PST)
MIME-Version: 1.0
References: <20221214180409.7354-1-palmer@rivosinc.com> <8DACBAC8-F220-4DA7-BCC2-4E2ED9E3E03E@kernel.org>
 <b8665f9d-44cf-5719-c206-5eb622978b1a@arm.com> <OSZPR01MB7019D761845E3AC9E30F2D2DAAE09@OSZPR01MB7019.jpnprd01.prod.outlook.com>
In-Reply-To: <OSZPR01MB7019D761845E3AC9E30F2D2DAAE09@OSZPR01MB7019.jpnprd01.prod.outlook.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Thu, 15 Dec 2022 10:04:34 +0100
X-Gmail-Original-Message-ID: <CAMuHMdUt7coFBx-+mXJcf7E0f5S_Q_Rmb6VVq-4E7_m99GXyRw@mail.gmail.com>
Message-ID: <CAMuHMdUt7coFBx-+mXJcf7E0f5S_Q_Rmb6VVq-4E7_m99GXyRw@mail.gmail.com>
Subject: Re: [PATCH] RISC-V: Disable IPMMU_VMSA on rv32
To:     Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>
Cc:     Robin Murphy <robin.murphy@arm.com>,
        Conor Dooley <conor@kernel.org>,
        "linux-riscv@lists.infradead.org" <linux-riscv@lists.infradead.org>,
        Palmer Dabbelt <palmer@rivosinc.com>,
        "arnd@arndb.de" <arnd@arndb.de>,
        "iommu@lists.linux.dev" <iommu@lists.linux.dev>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-1.6 required=5.0 tests=BAYES_00,
        FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,
        RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_PASS
        autolearn=no autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi Prabhakar,

On Wed, Dec 14, 2022 at 10:40 PM Prabhakar Mahadev Lad
<prabhakar.mahadev-lad.rj@bp.renesas.com> wrote:
> > From: Robin Murphy <robin.murphy@arm.com>
> > On 2022-12-14 19:46, Conor Dooley wrote:
> > > On 14 December 2022 10:04:09 GMT-08:00, Palmer Dabbelt <palmer@rivosinc.com> wrote:
> > >> Without this I get a Kconfig warning and then subsequent build
> > >> failure when building allmodconfig on rv32.
> > >>
> > >> WARNING: unmet direct dependencies detected for IOMMU_IO_PGTABLE_LPAE
> > >>   Depends on [n]: IOMMU_SUPPORT [=y] && (ARM || ARM64 || COMPILE_TEST [=y] && !GENERIC_ATOMIC64
> > [=y])
> > >>   Selected by [y]:
> > >>   - IPMMU_VMSA [=y] && IOMMU_SUPPORT [=y] && (ARCH_RENESAS [=y] ||
> > >> COMPILE_TEST [=y]
> > >
> > > This here is your problem afaict
> > > I got a report from lkp about it yesterday, "blaming" Prabhakar for it:
> > > https://jpn01.safelinks.protection.outlook.com/?url=https%3A%2F%2Flore
> > > .kernel.org%2Fall%2F202212142355.b7vf3Jh0-lkp%40intel.com%2F&amp;data=
> > > 05%7C01%7Cprabhakar.mahadev-lad.rj%40bp.renesas.com%7Ca51ccd27ccda45e7
> > > 53c208dade16c553%7C53d82571da1947e49cb4625a166a4a2a%7C0%7C0%7C63806648
> > > 6632283001%7CUnknown%7CTWFpbGZsb3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzI
> > > iLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C3000%7C%7C%7C&amp;sdata=FshRCpnIoU0b
> > > c38MYnesotcgOV4JT%2FXVOidbDMpAWbc%3D&amp;reserved=0
> > >
> > > I hate selects, just ignores the dependency :(
> > >
> > >   && !GENERIC_ATOMIC64 [=y])
> >
> > I think the existing assumption was that ARCH_RENESAS implied !GENERIC_ATOMIC64. If that is no longer
> > true then please feel free to adjust drivers/iommu/Kconfig to suit.
> >
> IPMMU is not available on Renesas RISCV SoCs, so maybe something like below?
>
> --- a/drivers/iommu/Kconfig
> +++ b/drivers/iommu/Kconfig
> @@ -283,7 +283,7 @@ config EXYNOS_IOMMU_DEBUG
>
>  config IPMMU_VMSA
>         bool "Renesas VMSA-compatible IPMMU"
> -       depends on ARCH_RENESAS || (COMPILE_TEST && !GENERIC_ATOMIC64)
> +       depends on (ARCH_RENESAS && !RISCV) || (COMPILE_TEST && !GENERIC_ATOMIC64)

Negative dependencies on a symbol like that tend to need future
extension.

What about

    depends on ARCH_RENESAS || COMPILE_TEST
    depends on !GENERIC_ATOMIC64

instead?

That does mean the question will show up on RV64, too.
Adding

    depends on ARM || ARM64 || COMPILE_TEST

(like we sort of had before commit 97215a7df4351fdd
("iommu/renesas: Expand COMPILE_TEST coverage")
would fix that.

>         select IOMMU_API
>         select IOMMU_IO_PGTABLE_LPAE
>         select ARM_DMA_USE_IOMMU

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
