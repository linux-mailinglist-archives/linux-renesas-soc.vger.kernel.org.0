Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 9ED696226A1
	for <lists+linux-renesas-soc@lfdr.de>; Wed,  9 Nov 2022 10:17:28 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229775AbiKIJR1 (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Wed, 9 Nov 2022 04:17:27 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49640 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230448AbiKIJRL (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 9 Nov 2022 04:17:11 -0500
Received: from mail-ed1-x52a.google.com (mail-ed1-x52a.google.com [IPv6:2a00:1450:4864:20::52a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 266FDFD0B;
        Wed,  9 Nov 2022 01:17:03 -0800 (PST)
Received: by mail-ed1-x52a.google.com with SMTP id a67so26229348edf.12;
        Wed, 09 Nov 2022 01:17:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=I1zyBcnmnvpRBfGlxFnRX4M70p2ogoa1GyrlPIeTzdw=;
        b=BjpEbmaoJDNc4n7cpaEjbJmuPNCYnGUspWa3NzYItOh4f0HPEmBap23DjiEmOFJU5/
         FtMVTOcs7n560e1YQjyBknvvsJRvnyEePjSi738SsGAt/YLOk2msL/Nkn+jdRnNyVGJm
         Dtg81dL29fTK86N0pb2x4ajgntrerHFsZ8To4yFWh0rNFvPmmiO+xpqdaPA3K4jg6rf7
         US2+GV1wgs5vzeO8ha4pU5mkyfspmnIFwkNtsh6ozqaMYQY2xVaIGoJOCohIOn/uAxmp
         snrsOq6O2QjuCRC+epuIkzYlFhYg8kDljK2XCOUt/FeWhBlE2RuVHEOan5P9+HyiG9Hv
         R3qQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=I1zyBcnmnvpRBfGlxFnRX4M70p2ogoa1GyrlPIeTzdw=;
        b=X+mCQjey7pdpsFlX7yLTe9VSa3CeNEiZdvkyVtpT2zKpDR+dxQlj/DhFNrtF7/oxaI
         4FafgJJjxuAjPTK6w9MfvVJPb3R5Kpl4uuoc8kGURLyfMQARgznUx7AFbLQI1JdSrY2L
         MHhQFbfBf45NO9rw/YgVtpNsmpFQZNn2II58uX4BhayIy2TKL8hBGfp9AyALVNxjIV3g
         geMxz4GWe6e86cb92/TSgsq+N1FMAwWL+H+SDv+/bZSY7IaX54tU/gYFm9jOoKVAqcFf
         BGOXtloyDV2xWgG3leBEzMs0H12zNlG7r67327fh+FmwxYgFP5E3XPNF4SVFBNy4qns5
         gpng==
X-Gm-Message-State: ACrzQf3ecTb5tfhLpuw4DyjwRJyv0uyK1WOuXoSCOCMzZnhEMUVqRcuU
        mzl41Bb9W6u1OCD6azBOH4gK+YwLUAM8g+5SAww=
X-Google-Smtp-Source: AMsMyM5JTh8OBKn6CyUVPAMPhk00DiERy1AvRNJugn7Gkoi+/k4oghom5cpUyQ4DeRimiTJAJ9q/O2K34KO8p/0rT6Q=
X-Received: by 2002:a05:6402:1219:b0:462:e788:723f with SMTP id
 c25-20020a056402121900b00462e788723fmr59327500edw.319.1667985421580; Wed, 09
 Nov 2022 01:17:01 -0800 (PST)
MIME-Version: 1.0
References: <20221028165921.94487-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <20221028165921.94487-8-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <CAMuHMdUKVxO24Qgyx37tbs5+m0Us0VF3eTZCC2KV=AC8z2JneQ@mail.gmail.com>
 <CA+V-a8t5Qah3MNm2m__xnmgK-52=HC9QBPPudnB+1j4-FYJ_NA@mail.gmail.com>
 <CAMuHMdWTJf24XR+KR8yVJOnfpgs-PkUf9b8B=PX9Dd4mfawD5Q@mail.gmail.com>
 <CA+V-a8vCGDHL1SUTEnD-WvoUGKSVL=xzDeQxy77=1vFJdk+fYg@mail.gmail.com>
 <CAMuHMdU=K0o6KHVPUdfEu0tkH8kDMBg-WaRFcYS7r=azWEnfTQ@mail.gmail.com>
 <CA+V-a8s6Amvb35wRE7pbwXHxwzk8znT8OWsbA9DRpX76E8Uh+w@mail.gmail.com> <CAMuHMdU2cQ_9a6HcXzMQPNUoJ78i4y04oAkZ0HnRLzyYq2MsuA@mail.gmail.com>
In-Reply-To: <CAMuHMdU2cQ_9a6HcXzMQPNUoJ78i4y04oAkZ0HnRLzyYq2MsuA@mail.gmail.com>
From:   "Lad, Prabhakar" <prabhakar.csengg@gmail.com>
Date:   Wed, 9 Nov 2022 09:16:35 +0000
Message-ID: <CA+V-a8v1HR2vL433ZwKy-pTUeSXuiqp1+yAj1arC=t4SCDQ=vg@mail.gmail.com>
Subject: Re: [PATCH v5 7/7] riscv: configs: defconfig: Enable Renesas RZ/Five SoC
To:     Geert Uytterhoeven <geert@linux-m68k.org>
Cc:     Paul Walmsley <paul.walmsley@sifive.com>,
        Palmer Dabbelt <palmer@dabbelt.com>,
        Albert Ou <aou@eecs.berkeley.edu>,
        Magnus Damm <magnus.damm@gmail.com>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Heiko Stuebner <heiko@sntech.de>,
        Conor Dooley <conor.dooley@microchip.com>,
        Guo Ren <guoren@kernel.org>, Anup Patel <anup@brainfault.org>,
        Atish Patra <atishp@rivosinc.com>,
        Heinrich Schuchardt <heinrich.schuchardt@canonical.com>,
        devicetree@vger.kernel.org, linux-riscv@lists.infradead.org,
        linux-kernel@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
        Biju Das <biju.das.jz@bp.renesas.com>,
        Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,
        RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi Geert,

On Wed, Nov 9, 2022 at 7:48 AM Geert Uytterhoeven <geert@linux-m68k.org> wrote:
>
> Hi Prabhakar,
>
> On Tue, Nov 8, 2022 at 11:05 PM Lad, Prabhakar
> <prabhakar.csengg@gmail.com> wrote:
> > On Tue, Nov 8, 2022 at 7:20 PM Geert Uytterhoeven <geert@linux-m68k.org> wrote:
> > > On Tue, Nov 8, 2022 at 6:23 PM Lad, Prabhakar
> > > <prabhakar.csengg@gmail.com> wrote:
> > > > On Tue, Nov 8, 2022 at 4:12 PM Geert Uytterhoeven <geert@linux-m68k.org> wrote:
> > > > > On Tue, Nov 8, 2022 at 5:07 PM Lad, Prabhakar
> > > > > <prabhakar.csengg@gmail.com> wrote:
> > > > > > On Tue, Nov 8, 2022 at 3:52 PM Geert Uytterhoeven <geert@linux-m68k.org> wrote:
> > > > > > > On Fri, Oct 28, 2022 at 6:59 PM Prabhakar <prabhakar.csengg@gmail.com> wrote:
> > > > > > > > From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> > > > > > > >
> > > > > > > > Enable Renesas RZ/Five SoC config in defconfig. It allows the default
> > > > > > > > upstream kernel to boot on RZ/Five SMARC EVK board.
> > > > > > > >
> > > > > > > > Alongside enable SERIAL_SH_SCI config so that the serial driver used by
> > > > > > > > RZ/Five SoC is built-in.
> > > > > > > >
> > > > > > > > Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> > > > > > > > Reviewed-by: Conor Dooley <conor.dooley@microchip.com>
> > > > > > > > Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
> > > > > > > > ---
> > > > > > > > v4 -> v5
> > > > > > > > * No change
> > > > > > > >
> > > > > > > > v3 -> v4
> > > > > > > > * Explicitly enabled ARCH_R9A07G043 config (note I have restored the RB
> > > > > > > >   tags with this change)
> > > > > > > > * Used riscv instead of RISC-V in subject line
> > > > > > >
> > > > > > > Thanks for the update!
> > > > > > >
> > > > > > > > --- a/arch/riscv/configs/defconfig
> > > > > > > > +++ b/arch/riscv/configs/defconfig
> > > > > > > > @@ -29,6 +29,8 @@ CONFIG_SOC_MICROCHIP_POLARFIRE=y
> > > > > > > >  CONFIG_SOC_SIFIVE=y
> > > > > > > >  CONFIG_SOC_STARFIVE=y
> > > > > > > >  CONFIG_SOC_VIRT=y
> > > > > > > > +CONFIG_ARCH_RENESAS=y
> > > > > > > > +CONFIG_ARCH_R9A07G043=y
> > > > > > >
> > > > > > > You forgot to refresh after moving ARCH_RENESAS in v5 of "riscv:
> > > > > > > Kconfig.socs: Add ARCH_RENESAS kconfig option", and after relying on
> > > > > > > ARCH_R9A07G043 in drivers/soc/renesas/Kconfig.
> > > > > > >
> > > > > > Sorry I missed your point here, could you please elaborate.
> > > > >
> > > > > I mean that the options have moved, so you should update
> > > > > your patch like this:
> > > > >
> > > > Ouch got that.
> > > >
> > > > >     --- a/arch/riscv/configs/defconfig
> > > > >     +++ b/arch/riscv/configs/defconfig
> > > > >     @@ -26,11 +26,10 @@ CONFIG_EXPERT=y
> > > > >      # CONFIG_SYSFS_SYSCALL is not set
> > > > >      CONFIG_PROFILING=y
> > > > >      CONFIG_SOC_MICROCHIP_POLARFIRE=y
> > > > >     +CONFIG_ARCH_RENESAS=y
> > > > >      CONFIG_SOC_SIFIVE=y
> > > > >      CONFIG_SOC_STARFIVE=y
> > > > >      CONFIG_SOC_VIRT=y
> > > > >     -CONFIG_ARCH_RENESAS=y
> > > > >     -CONFIG_ARCH_R9A07G043=y
> > > > >      CONFIG_SMP=y
> > > > >      CONFIG_HOTPLUG_CPU=y
> > > > >      CONFIG_PM=y
> > > > >     @@ -163,6 +159,7 @@ CONFIG_MAILBOX=y
> > > > >      CONFIG_RPMSG_CHAR=y
> > > > >      CONFIG_RPMSG_CTRL=y
> > > > >      CONFIG_RPMSG_VIRTIO=y
> > > > >     +CONFIG_ARCH_R9A07G043=y
> > > > >      CONFIG_EXT4_FS=y
> > > > >      CONFIG_EXT4_FS_POSIX_ACL=y
> > > > >      CONFIG_EXT4_FS_SECURITY=y
> > > > >
> > > > > > > >  CONFIG_SMP=y
> > > > > > > >  CONFIG_HOTPLUG_CPU=y
> > > > > > > >  CONFIG_PM=y
> > > > > > >
> > > > > > > PM and GPIOLIB are auto-selected by ARCH_R9A07G043 (through ARCH_RZG2L)
> > > > > > > resp. SOC_RENESAS, so they can be dropped.  But it's better to do this
> > > > > > > after the release of v6.2-rc1, when all pieces have fallen together.
> > > > > > >
> > > > > > Are you suggesting dropping it from defconfig?
> > > > >
> > > > > Yes, but not right now, as that would make it depend on my
> > > > > renesas-drivers-for-v6.2 branch to keep them enabled.
> > > > >
> > ^^^
> > > > I was wondering if that's required by other platforms though.
> > > > CONFIG_PM was added for VIRT machine and GPIOLIB for HiFive.
> > >
> > > Does that matter? They would still get it, as long as they use the
> > > defconfig.
> > >
> > Confused, didnt you say about dropping it from defconfig...
>
> Yes, I did, but not right now, only after v6.2-rc1.
>
>   - Once the defconfig has CONFIG_ARCH_R9A07G043=y, ARCH_RZG2L will
>     be auto-selected (commit ebd0e06f3063cc2e ("soc: renesas: Identify
>     RZ/Five SoC") is already upstream), and CONFIG_PM as well. So there
>     is no longer a need for the defconfig to enable it explicitly.
>   - Once the defconfig has CONFIG_ARCH_RENESAS=y, SOC_RENESAS will
>     be auto-selected, but auto-selecting CONFIG_GPIOLIB depends on commit
>     b3acbca3c80e6124 ("soc: renesas: Kconfig: Explicitly select GPIOLIB and
>     PINCTRL config under SOC_RENESAS") is only in renesas-drivers-for-v6.2.
>
> Please run "make savedefconfig", and compare the generated defconfig
> with arch/riscv/configs/defconfig.
>
Thanks for the detailed explanation, I got you now :)

Cheers,
Prabhakar
