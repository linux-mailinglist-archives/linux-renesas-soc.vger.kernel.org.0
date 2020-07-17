Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7ECDC2238F7
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 17 Jul 2020 12:07:13 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726040AbgGQKHN (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Fri, 17 Jul 2020 06:07:13 -0400
Received: from mail-oi1-f193.google.com ([209.85.167.193]:41366 "EHLO
        mail-oi1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725912AbgGQKHM (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 17 Jul 2020 06:07:12 -0400
Received: by mail-oi1-f193.google.com with SMTP id y22so7550884oie.8
        for <linux-renesas-soc@vger.kernel.org>; Fri, 17 Jul 2020 03:07:12 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=01YsbhwOxv31//ev6f3BWiHOpBKKok2/FsZz30HZwdM=;
        b=eFScn8jAZIakjBGdNK4LYMfHocdlI3N9f3DiRl4LxOD1jTziLDI61Cbpj8ZZF6uvsl
         WMqPPnNvUIu9dBkxe6t8/3ZF17S8563ozng/qInlk+gjt02KDoruwjoF/zWFgPSxX/Dw
         MtKqMfkDiLJ3UTqLDhaRTp4X2ltKQpdW1nZQ4HyBqdK3BzuGjTV0f8vqP7VKxHGTGweW
         iPVC8Jkf5zaWwKqKNKgDG0uA+2ZS24XIQgCPpW0u3WHy2+tLcNsAMtl4zoa5mxL54LEC
         wjHfy8jynHr+8jrVYrko63hkR3QWjawihL5u0PSsTBZAvDuZpyR5D4xVuB71wKp6POJa
         STMA==
X-Gm-Message-State: AOAM531MkGhldHjPV+d30tb/jY2ibe9tOE0vl9GSxJTd0d3EuE4dC8fZ
        tOQrLttqlMiaTku5VPYdn05/kCNQEK9ORTvB5MkMIF1s
X-Google-Smtp-Source: ABdhPJx5VVjAOjbnzK4be0tpDWAeUZo/+qK8Y+x9bhGvRLuIsMLXwSiSkx5oTc1n7RqAYkMtk3dbgm5+bl3J7h1beuI=
X-Received: by 2002:aca:5c41:: with SMTP id q62mr6683415oib.148.1594980431883;
 Fri, 17 Jul 2020 03:07:11 -0700 (PDT)
MIME-Version: 1.0
References: <1594382612-13664-1-git-send-email-yoshihiro.shimoda.uh@renesas.com>
 <CAMuHMdVqFU538syZq2B=An-MA3zo3RT115JmvaVxyt5mb-Wvsg@mail.gmail.com>
 <TY2PR01MB3692CD5627D9848ADDA88BF0D87C0@TY2PR01MB3692.jpnprd01.prod.outlook.com>
 <CAMuHMdVzO=wwTyYhHj2Cg3g_rRQCHQ_97DVH8zXAkg_ki5ZHhw@mail.gmail.com>
 <TY2PR01MB3692646F94A991EB373A8AA3D87C0@TY2PR01MB3692.jpnprd01.prod.outlook.com>
 <CAMuHMdU2R7qxtgmP6CgmN9_3SZeL7DFUs5iCAu2QG+UBay=EBw@mail.gmail.com> <TY2PR01MB36923CD412750CE20F416A45D87C0@TY2PR01MB3692.jpnprd01.prod.outlook.com>
In-Reply-To: <TY2PR01MB36923CD412750CE20F416A45D87C0@TY2PR01MB3692.jpnprd01.prod.outlook.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Fri, 17 Jul 2020 12:07:00 +0200
Message-ID: <CAMuHMdUkzNx2nUrRN+0bny6BG95YVNqUiWN2L+BXsOD_o-=Vfg@mail.gmail.com>
Subject: Re: [PATCH] arm64: dts: renesas: add full-pwr-cycle-in-suspend into
 eMMC nodes
To:     Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
Cc:     Magnus Damm <magnus.damm@gmail.com>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi Shimoda-san,

On Fri, Jul 17, 2020 at 12:02 PM Yoshihiro Shimoda
<yoshihiro.shimoda.uh@renesas.com> wrote:
> > From: Geert Uytterhoeven, Sent: Friday, July 17, 2020 5:35 PM
> > On Fri, Jul 17, 2020 at 10:29 AM Yoshihiro Shimoda
> > <yoshihiro.shimoda.uh@renesas.com> wrote:
> > > > From: Geert Uytterhoeven, Sent: Friday, July 17, 2020 4:13 PM
> > > > On Fri, Jul 17, 2020 at 7:44 AM Yoshihiro Shimoda
> > > > <yoshihiro.shimoda.uh@renesas.com> wrote:
> > > > > > From: Geert Uytterhoeven, Sent: Wednesday, July 15, 2020 6:05 PM
> > > > > > On Fri, Jul 10, 2020 at 2:03 PM Yoshihiro Shimoda
> > > > > > <yoshihiro.shimoda.uh@renesas.com> wrote:
> > > <snip>
> > > > > > >  arch/arm64/boot/dts/renesas/r8a77990-ebisu.dts   | 1 +
> > > > > > >  arch/arm64/boot/dts/renesas/salvator-common.dtsi | 1 +
> > > > > >
> > > > > > I assume we need this on other boards, too?
> > > > > > At least ULCB uses the BD9571 PMIC, and has a similar PSCI s2ram
> > > > > > implementation as Salvator-X(S) and Ebisu.
> > > > >
> > > > > I think so. And, I also thin ULCB+KF should not have this because
> > > > > it doesn't support Suspend-to-RAM. But, what do you think?
> > > >
> > > > How come ULCB+KF doesn't support s2ram?
> > > > Isn't KingFisher just an extension board for ULCB?
> > > > Does it require a firmware upgrade?
> > >
> > > It's related to board design. If ULCB+KF, we must not use 5V AC to ULCB side
> > > and must use 12V AC to KF side. And KF has power switch as SW6 for both ULCB+KF.
> > > https://elinux.org/R-Car/Boards/Kingfisher
> >
> > OK.
> >
> > > However, PMIC on ULCB cannot control the KF power unfortunately.
> > > So, we have no chance to use s2ram on ULCB+KF...
> >
> > Makes sense.
> > BTW, what happens if you try s2ram? I guess the system just wakes up again
> > immediately? Or does it crash?
>
> It's frozen after s2ram. Some LEDs on ULCB is OFF. But, LEDs on KF is still ON.

Oops.

> So, I'm wondering if it's better to add the property on ULCB+KF too
> because it seems ULCB is turned off. But, what do you think?

IMHO, a graceful shutdown is better.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
