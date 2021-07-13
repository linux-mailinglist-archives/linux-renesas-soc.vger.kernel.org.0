Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6C7513C6BF3
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 13 Jul 2021 10:22:32 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234305AbhGMIZU (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Tue, 13 Jul 2021 04:25:20 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44388 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234157AbhGMIZU (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 13 Jul 2021 04:25:20 -0400
Received: from mail-yb1-xb35.google.com (mail-yb1-xb35.google.com [IPv6:2607:f8b0:4864:20::b35])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 24DD1C0613DD;
        Tue, 13 Jul 2021 01:22:31 -0700 (PDT)
Received: by mail-yb1-xb35.google.com with SMTP id g5so33427328ybu.10;
        Tue, 13 Jul 2021 01:22:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=0BCqHMaAx2kOi6ab1rjdKAgYu6O9OVQh5PAF7ii/zbU=;
        b=lZf26XMyXMl1ZZiq5hdP8xfFXM4dCEL0j3yWFj3xmFNcuptk5xaaNxiNwvSp3MjSng
         6h+aaowOlIfuKNhu28lnNUmfvko79N9GJdte8M2s6Wr+rOexaE9gJE6Ze6CaxMzvT4Aa
         +Hd8fqWphG8WHvi3+WOnjMileCGVTpvdhwt3BcPSxIueWDVYbfUlI5SLVkrs7umJ25kn
         ASjpEO7RVcwo7V0XqaAe9A4g+hiXxGfwbxSEFfduCXaxUUTUvS5d/YBQpmhRaPWyY01u
         wYnJHDtKWPB7WPzOf7rD0BGw/2e1Xw7zuZ0T1rK1R0LAYo2vVIcJCqEGVmFLBKNl8zz/
         LaCA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=0BCqHMaAx2kOi6ab1rjdKAgYu6O9OVQh5PAF7ii/zbU=;
        b=msdFdYJ2RUBjd1gjg3G4ML9bjS+tRd4v3juSa12/QciddylDL82K2J0AFpYNwvkzhQ
         WbHFLvpzhyFU35Sifd/YOG7p29qui2MjPF/QGGFnnd7ZPmTQIfeAEgfslhEt3xN2wKNV
         uDzBeURAVeRjGXX/4i2EyEo4kG5jAqajugmOJkbFQHSlQhzkay6kQyjzR90KBJAdE1Rn
         qVk/NuiYcjdRrqosBvkRgrnqru6RSwbX8tU9oIpOXHKBRAM3pM6wUV4tCpSdBO23fibG
         2KvPovUBpOvKqMpbeB08idNkuBdhVQCAaIHPjI21dDNzgHpA66sdaa6T0QQab8aAZcPE
         AadQ==
X-Gm-Message-State: AOAM530ROLmXOOW517xpBU6OE6s5s3413X0lvO/XGll0SL+JGd35covK
        VjvjWRRMJXuHQ+arS9u9/Dkuw3BPDe1Jot0LbiLz1Uuap/Y=
X-Google-Smtp-Source: ABdhPJw/pXvo2SkSCWmvtTPGorKpwdMqPoV8O4Tf08cQNkkhaZxjx4+oljmnFNXmeswnh6b7d2jilrnJyyM/pymv+II=
X-Received: by 2002:a25:b9d0:: with SMTP id y16mr4276628ybj.62.1626164550386;
 Tue, 13 Jul 2021 01:22:30 -0700 (PDT)
MIME-Version: 1.0
References: <20210611152108.6785-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <CAMuHMdWJQESFmhV+c-QmivXCWPx21QcB-HSzjxf8KsXh_DAvfw@mail.gmail.com> <CAMuHMdXG9H_mOtA_a9t0K8BVaR4p0DcWgNeL0786YvybV2Hqgw@mail.gmail.com>
In-Reply-To: <CAMuHMdXG9H_mOtA_a9t0K8BVaR4p0DcWgNeL0786YvybV2Hqgw@mail.gmail.com>
From:   "Lad, Prabhakar" <prabhakar.csengg@gmail.com>
Date:   Tue, 13 Jul 2021 09:22:04 +0100
Message-ID: <CA+V-a8tk6uCeRwmiTh=Ds+8DYVUqCYs64nX_9ksDXXdSd-rxNA@mail.gmail.com>
Subject: Re: [PATCH] arm64: dts: renesas: r9a07g044: Add missing GICv3 node properties
To:     Geert Uytterhoeven <geert@linux-m68k.org>,
        Sudeep Holla <sudeep.holla@arm.com>
Cc:     Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>,
        Rob Herring <robh+dt@kernel.org>,
        Magnus Damm <magnus.damm@gmail.com>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        Biju Das <biju.das.jz@bp.renesas.com>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi Geert,

On Tue, Jul 13, 2021 at 9:08 AM Geert Uytterhoeven <geert@linux-m68k.org> wrote:
>
> Hi Prabhakar,
>
> On Mon, Jun 14, 2021 at 2:48 PM Geert Uytterhoeven <geert@linux-m68k.org> wrote:
> > On Fri, Jun 11, 2021 at 5:21 PM Lad Prabhakar
> > <prabhakar.mahadev-lad.rj@bp.renesas.com> wrote:
> > > Add the below missing properties into GIC node,
> > > - clocks
> > > - clock-names
> > > - power-domains
> > > - resets
> > >
> > > Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> > > Reviewed-by: Biju Das <biju.das.jz@bp.renesas.com>
> >
> > Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
> >
> > Queueing pending on[1].
> >
> > > [1] https://lore.kernel.org/linux-devicetree/
> > >     20210609155108.16590-1-prabhakar.mahadev-lad.rj@bp.renesas.com/
>
> The dependency has been accepted, but this patch needs a respin
> for the changed clocks.
>
Thank you for pointing this out. wrt resets the GIC has two signals
(which I learnt lately when the dependency path was accepted). Earlier
discussion in irc with Sudeep pointed out that there wouldn't be any
use case of having GIC resets in DTSI, so either we drop the resets
property in DT binding doc or correct it.

Let me know your thoughts on this and how we proceed further.

Cheers,
Prabhakar
