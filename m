Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 644144856FC
	for <lists+linux-renesas-soc@lfdr.de>; Wed,  5 Jan 2022 18:02:41 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S242098AbiAERCk (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Wed, 5 Jan 2022 12:02:40 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49098 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S242066AbiAERCk (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 5 Jan 2022 12:02:40 -0500
Received: from ams.source.kernel.org (ams.source.kernel.org [IPv6:2604:1380:4601:e00::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C0251C061245;
        Wed,  5 Jan 2022 09:02:39 -0800 (PST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ams.source.kernel.org (Postfix) with ESMTPS id 85A56B81CB8;
        Wed,  5 Jan 2022 17:02:38 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 33F22C36AF3;
        Wed,  5 Jan 2022 17:02:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1641402157;
        bh=agAGFH0HuJNX1dFurn+XgzdOr9v79jF+jFSDsYByp2g=;
        h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
        b=f8X1BmB95VuA6GntisoCzO+HDZ1MD/Q+Pp0J+KCof9JSEJJ9WBcvStZ4tpiDALgMH
         z+DK0bk3WI/fRi8CarP5ohMI1rogq2hZOOG2bp6v4Z9l4ChBS9gW4aLTq2J/1udE0K
         kt7QKZlU38hSVF0wg3sEeqC4w4tN3Puck5DURX+l2Q8ALU1iR0dnaLnX6zKueEMJpj
         IAozcC/DVRNGTCuhfcPnSVztpx6rxCSlqMvReoLqcaqflIQlE4XTdBs7pr4Gsv2Y9i
         0jbp+pXiuv3CMQOfX5GfxiuK/Xl7ep/gIzjUQlc7orN4F4jRjSGXZwjk4ZNcATYvoK
         HK6HamaDC0aaA==
Received: by mail-wr1-f54.google.com with SMTP id o3so26168409wrh.10;
        Wed, 05 Jan 2022 09:02:37 -0800 (PST)
X-Gm-Message-State: AOAM530LkH09/MxmP+lDXaQ3s3VdU86pEUEiUg+a0TguuYKaZzuTx2CX
        ThQqy+V+Ff0Wu2xKBUIuIT+PAOyzX2aJuZMMA3w=
X-Google-Smtp-Source: ABdhPJyIdN7vrQm6ItyKzUVZWpAWOssMuqHPz6++VKuQFZMem72pI+XYNHgwX0j5r7c3iHDljbvK3ge2T46qzMVNjk0=
X-Received: by 2002:a5d:6b8f:: with SMTP id n15mr47099998wrx.189.1641402155495;
 Wed, 05 Jan 2022 09:02:35 -0800 (PST)
MIME-Version: 1.0
References: <20211122092816.2865873-1-ardb@kernel.org> <CGME20211221103854eucas1p2592e38fcc84c1c3506fce87f1dab6739@eucas1p2.samsung.com>
 <20211122092816.2865873-8-ardb@kernel.org> <0ffc858f-27e7-6789-4be1-c4c5ad61eb9d@samsung.com>
 <CAMj1kXG+P5AU-26t_16FL5xfQNd+ByQH_cfBLiwMSdoGPmvCuw@mail.gmail.com>
 <e07a229a-e565-0077-9f8a-a24ffa45f395@samsung.com> <CAMj1kXG3neg0riLAaU32KLvB2PLBNzwqgO0F21nbK1ivS=FwMg@mail.gmail.com>
 <b22077f6-0925-ee00-41ea-3e52241926e2@samsung.com> <CAMj1kXHQrqZSE1kHaQyQyK6R58EV3cUyvJFmM1JYifaMemyUhQ@mail.gmail.com>
 <f469726d-86fb-cf54-2775-d4658d2f3a5d@samsung.com> <CAMj1kXGyL7yTV4+pOs9iBWYuVvVmPTZrV5r=nzqttqpZ6-vYJA@mail.gmail.com>
 <CAMuHMdWNuCVeFiDrhnFmX0F1jxz8Fs4eFx55ojJF3d2ro-udrA@mail.gmail.com>
 <bbb0c788-bd83-833c-9445-87cff525f728@nvidia.com> <CAMj1kXEYjUspxOnvK=3O4pkVtXT+iBPz6mkskn=K6TTUZc+W2g@mail.gmail.com>
 <c0d71f87-1329-205c-c4fb-d82d0f118a7b@nvidia.com>
In-Reply-To: <c0d71f87-1329-205c-c4fb-d82d0f118a7b@nvidia.com>
From:   Ard Biesheuvel <ardb@kernel.org>
Date:   Wed, 5 Jan 2022 18:02:23 +0100
X-Gmail-Original-Message-ID: <CAMj1kXG5+jH9kLLeeArPpDQr8fhKOYYutRqJ4Qusb5+brs+tzg@mail.gmail.com>
Message-ID: <CAMj1kXG5+jH9kLLeeArPpDQr8fhKOYYutRqJ4Qusb5+brs+tzg@mail.gmail.com>
Subject: Re: [PATCH v4 7/7] ARM: implement support for vmap'ed stacks
To:     Jon Hunter <jonathanh@nvidia.com>
Cc:     Geert Uytterhoeven <geert@linux-m68k.org>,
        Marek Szyprowski <m.szyprowski@samsung.com>,
        Linux ARM <linux-arm-kernel@lists.infradead.org>,
        Russell King <linux@armlinux.org.uk>,
        Nicolas Pitre <nico@fluxnic.net>,
        Arnd Bergmann <arnd@arndb.de>,
        Kees Cook <keescook@chromium.org>,
        Keith Packard <keithpac@amazon.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        Nick Desaulniers <ndesaulniers@google.com>,
        Tony Lindgren <tony@atomide.com>,
        Krzysztof Kozlowski <krzk@kernel.org>,
        Linux Samsung SOC <linux-samsung-soc@vger.kernel.org>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        "linux-tegra@vger.kernel.org" <linux-tegra@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

On Wed, 5 Jan 2022 at 17:50, Jon Hunter <jonathanh@nvidia.com> wrote:
>
>
> On 05/01/2022 11:12, Ard Biesheuvel wrote:
>
> ...
>
> > Thanks for the report.
> >
> > It would be helpful if you could provide some more context:
> > - does it happen on a LPAE build too?
>
> Enabling CONFIG_ARM_LPAE does work.
>
> > - does it only happen on SMP capable systems?
> > - does it reproduce on such systems when using only a single CPU?
> > (i.e., pass 'nosmp' on the kernel command line)
>
> Adding 'nosmp' does not help.
>
> > - when passing 'no_console_suspend' on the kernel command line, are
> > any useful diagnostics produced?
>
> Adding 'no_console_suspend' does not produce any interesting logs.
>
> > - is there any way you could tell whether the crash/hang (assuming
> > that is what you are observing) occurs on the suspend path or on
> > resume?
>
> That is not clear. I see it entering suspend, but not clear if it is
> failing on entering suspend or resuming.
>

Thanks a lot for providing this info.

The fact that enabling LPAE makes the issue go away is a fairly strong
hint that one of the CPUs comes up running in an address space that
lacks the stack's vmapping in its copy of the swapper_pg_dir region -
LPAE builds map swapper_pg_dir directly so there it can never go out
of sync.

Given that vmappings are global, and therefore cached in the TLB
across context switches, it is not unlikely that the missing vmapping
of the stack is in a task that runs before suspend, but does not cause
any issues until after the CPU is reset completely (which takes cached
TLB entries down with it)

So in summary, this gives me something to chew on, and hopefully, I
will be able to provide a proper fix shortly.
