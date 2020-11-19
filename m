Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A48C62B97BA
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 19 Nov 2020 17:23:11 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727734AbgKSQWu (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Thu, 19 Nov 2020 11:22:50 -0500
Received: from mail.kernel.org ([198.145.29.99]:39670 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725877AbgKSQWt (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 19 Nov 2020 11:22:49 -0500
Received: from mail-ot1-f52.google.com (mail-ot1-f52.google.com [209.85.210.52])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id C6552246DE
        for <linux-renesas-soc@vger.kernel.org>; Thu, 19 Nov 2020 16:22:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1605802968;
        bh=bS0qzUjM1H6wIT94SR8QTlx4YXd8oxB6wsHYfxpqnc8=;
        h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
        b=XgdVReSdJ3jRMbmJIdoZJeiQFGP40Ow6P/PQuzwCXCagwUSemIME1sFLaEiMxBXRK
         Z+Kn9OXu/HFMHn6uDg7wz6n+XrWThw5Sx2Kn3HhMbY37NtPcLkb8XyxTPI2SUhsIf6
         cLeXZ9EnYXCljFLtBaTBFqLg6AnLx4T7cXv3W0hk=
Received: by mail-ot1-f52.google.com with SMTP id o3so5810814ota.8
        for <linux-renesas-soc@vger.kernel.org>; Thu, 19 Nov 2020 08:22:48 -0800 (PST)
X-Gm-Message-State: AOAM530C5JQoN9kFuwCD9MyYHbJU34nNMSZmqDFAZCWcXHhevseOj91J
        mlWJc4lzvr7K76Qa2SEpXrE4XOmHQkoaU7TS0hw=
X-Google-Smtp-Source: ABdhPJxe14qa9ET78RDEvJPyPuc5zOrgkvxgZBTpYMYuAHlamwN2dRJXiIke9P3+XrMB/P0WqR21F8wpPDxh/ZqgrvE=
X-Received: by 2002:a05:6830:22d2:: with SMTP id q18mr9659872otc.305.1605802967944;
 Thu, 19 Nov 2020 08:22:47 -0800 (PST)
MIME-Version: 1.0
References: <20201119125318.4066097-1-geert+renesas@glider.be>
 <CAK8P3a0mHYgOYLBO1MHw1CUVgdnOQk4aRf5XTBj+jR-yEtzcoA@mail.gmail.com> <CAMuHMdXmHOo+6TgYOsAuSC7-iHEyBnLvqX=MCN3qYybUi5M-hw@mail.gmail.com>
In-Reply-To: <CAMuHMdXmHOo+6TgYOsAuSC7-iHEyBnLvqX=MCN3qYybUi5M-hw@mail.gmail.com>
From:   Arnd Bergmann <arnd@kernel.org>
Date:   Thu, 19 Nov 2020 17:22:32 +0100
X-Gmail-Original-Message-ID: <CAK8P3a17rA4N7TyiwrTdS_=4AAyDXrAi7W8k45BPuTLL1xU4Gg@mail.gmail.com>
Message-ID: <CAK8P3a17rA4N7TyiwrTdS_=4AAyDXrAi7W8k45BPuTLL1xU4Gg@mail.gmail.com>
Subject: Re: [PATCH] ASoC: fsi: Stop using __raw_*() I/O accessors
To:     Geert Uytterhoeven <geert@linux-m68k.org>
Cc:     Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
        Liam Girdwood <lgirdwood@gmail.com>,
        Mark Brown <broonie@kernel.org>,
        Jaroslav Kysela <perex@perex.cz>,
        Takashi Iwai <tiwai@suse.com>,
        ALSA Development Mailing List <alsa-devel@alsa-project.org>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

On Thu, Nov 19, 2020 at 5:13 PM Geert Uytterhoeven <geert@linux-m68k.org> wrote:
> On Thu, Nov 19, 2020 at 4:54 PM Arnd Bergmann <arnd@kernel.org> wrote:
> > On Thu, Nov 19, 2020 at 1:53 PM Geert Uytterhoeven
> > <geert+renesas@glider.be> wrote:
> >
> > I'm also not sure whether changing this breaks big-endian SuperH,
> > which defines the accessors differently from Arm and most other
> > architectures.
>
> On SH, this driver is only used on SH7724 systems.
> Compiling an ecovec24_defconfig kernel with CONFIG_CPU_BIG_ENDIAN=y
> shows that the same code (native 32-bit access) is generated for
> big-endian as for little-endian, which means that it indeed must be
> broken for one of them. But this is not changed by my patch.

Not necessarily: I think superh is more like the old 'BE32' variant of Arm
big-endian, in that on-chip registers are accessed in CPU-endian byte order,
while access to external RAM is byte-swapped.

> > Maybe better just mark the driver as 'depends on SH || !CPU_BIG_ENDIAN'
> > as it is clearly broken on big-endian Arm.
>
> "depends on !CPU_BIG_ENDIAN"?

I think I'd just leave it as it is. Unless someone wants to try out this
board in both big-endian and little-endian configurations and also
listen to the audio output, it's impossible to know whether it is actually
broken. sound/soc/sh/dma-sh7760.c does have a comment from 2007
saying "// FIXME: little-endian only for now".

      Arnd
