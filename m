Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id EB13322371E
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 17 Jul 2020 10:35:25 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725864AbgGQIfX (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Fri, 17 Jul 2020 04:35:23 -0400
Received: from mail-ot1-f67.google.com ([209.85.210.67]:36933 "EHLO
        mail-ot1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726930AbgGQIfX (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 17 Jul 2020 04:35:23 -0400
Received: by mail-ot1-f67.google.com with SMTP id w17so6336593otl.4
        for <linux-renesas-soc@vger.kernel.org>; Fri, 17 Jul 2020 01:35:22 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=4ixZQJKDNo9s+VGKAOYB2bOVqaG4WU+w8TctZrkV/YM=;
        b=fzgj9FmQo6Oqv/VC7a0RlFenrij1yAn+gu9RC8riM0Jmuh/wK5c2bEgBcb/aeh/C9Y
         xqUy7GzDLkJpt8h+ZLLwENcGGHVC3WedfRdbM+IbQqOjXIffEJLToc4I28bDSkSU9fR7
         MIVG9T7YvZnt6JkmIFtFX/FJ3riDu4QTUzRlH3QacKZUkxqFRWVnVV8njILoI6cgOprB
         dRu1uJw14L/KsDpXfXRoznAeldy7mZSt0niQkIEjT6f6FtNjVJTKsAHhScXETxYgKwvX
         Sw36AaVr7muXzLiBaPqFShabVCqYTDsifxNaI7e/2mTnPfJSUGAfWLDd7zI+q2Nnuf8S
         I/uw==
X-Gm-Message-State: AOAM533Tk3YVJIkeYB1mGjvRNjuFKmVnN0HVUSqpNTZbo5ua/5vCyFCY
        UzrOECryiKXRRLdd28K91bXpqlryuSwQYVeda6T/lAt+
X-Google-Smtp-Source: ABdhPJzZd8os8HiWg11fTKFLdrfbGb6RIVBiQJ2gvbnbdNPAeKH7Ml6MKYDg1L/54YalWR8H9L6Dmv0WXO3zgM/SYcU=
X-Received: by 2002:a9d:2646:: with SMTP id a64mr7439671otb.107.1594974922193;
 Fri, 17 Jul 2020 01:35:22 -0700 (PDT)
MIME-Version: 1.0
References: <1594382612-13664-1-git-send-email-yoshihiro.shimoda.uh@renesas.com>
 <CAMuHMdVqFU538syZq2B=An-MA3zo3RT115JmvaVxyt5mb-Wvsg@mail.gmail.com>
 <TY2PR01MB3692CD5627D9848ADDA88BF0D87C0@TY2PR01MB3692.jpnprd01.prod.outlook.com>
 <CAMuHMdVzO=wwTyYhHj2Cg3g_rRQCHQ_97DVH8zXAkg_ki5ZHhw@mail.gmail.com> <TY2PR01MB3692646F94A991EB373A8AA3D87C0@TY2PR01MB3692.jpnprd01.prod.outlook.com>
In-Reply-To: <TY2PR01MB3692646F94A991EB373A8AA3D87C0@TY2PR01MB3692.jpnprd01.prod.outlook.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Fri, 17 Jul 2020 10:35:11 +0200
Message-ID: <CAMuHMdU2R7qxtgmP6CgmN9_3SZeL7DFUs5iCAu2QG+UBay=EBw@mail.gmail.com>
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

On Fri, Jul 17, 2020 at 10:29 AM Yoshihiro Shimoda
<yoshihiro.shimoda.uh@renesas.com> wrote:
> > From: Geert Uytterhoeven, Sent: Friday, July 17, 2020 4:13 PM
> > On Fri, Jul 17, 2020 at 7:44 AM Yoshihiro Shimoda
> > <yoshihiro.shimoda.uh@renesas.com> wrote:
> > > > From: Geert Uytterhoeven, Sent: Wednesday, July 15, 2020 6:05 PM
> > > > On Fri, Jul 10, 2020 at 2:03 PM Yoshihiro Shimoda
> > > > <yoshihiro.shimoda.uh@renesas.com> wrote:
> <snip>
> > > > >  arch/arm64/boot/dts/renesas/r8a77990-ebisu.dts   | 1 +
> > > > >  arch/arm64/boot/dts/renesas/salvator-common.dtsi | 1 +
> > > >
> > > > I assume we need this on other boards, too?
> > > > At least ULCB uses the BD9571 PMIC, and has a similar PSCI s2ram
> > > > implementation as Salvator-X(S) and Ebisu.
> > >
> > > I think so. And, I also thin ULCB+KF should not have this because
> > > it doesn't support Suspend-to-RAM. But, what do you think?
> >
> > How come ULCB+KF doesn't support s2ram?
> > Isn't KingFisher just an extension board for ULCB?
> > Does it require a firmware upgrade?
>
> It's related to board design. If ULCB+KF, we must not use 5V AC to ULCB side
> and must use 12V AC to KF side. And KF has power switch as SW6 for both ULCB+KF.
> https://elinux.org/R-Car/Boards/Kingfisher

OK.

> However, PMIC on ULCB cannot control the KF power unfortunately.
> So, we have no chance to use s2ram on ULCB+KF...

Makes sense.
BTW, what happens if you try s2ram? I guess the system just wakes up again
immediately? Or does it crash?

> > > JFYI, I could such environment if I added the property into ulcb.dtsi
> > > and added "/delete-property/" into ulcb-kf.dtsi.
> >
> > Iff that's the case, that's a valid solution.
>
> I think that's a valid solution. But, what do you think?

Thanks, looks good to me.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
