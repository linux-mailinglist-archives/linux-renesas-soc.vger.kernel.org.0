Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id CCEC122353D
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 17 Jul 2020 09:13:24 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726234AbgGQHNB (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Fri, 17 Jul 2020 03:13:01 -0400
Received: from mail-oo1-f65.google.com ([209.85.161.65]:42273 "EHLO
        mail-oo1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726201AbgGQHNA (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 17 Jul 2020 03:13:00 -0400
Received: by mail-oo1-f65.google.com with SMTP id y9so1679768oot.9
        for <linux-renesas-soc@vger.kernel.org>; Fri, 17 Jul 2020 00:13:00 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=aFoMkl6GTaIMZpODLQW2vB+naukLWDmCTw4VMdk5//I=;
        b=sPoQO3lqLNjnXaLHDmE8urHBgKCWFhrwV94z+4xmh9IZO3AqhMpdr01wm5ZDIO+zJ8
         4pmU8sxQ64ZccPCkds/36XQz04//Qx76NoQs1PMYASM+Z0WrZ2Esh0D2QTDx01f/3Nf2
         CZv1TYarr19OMZHudjpB3+WJ9CTcOf03l9l+KZ6DdcXhr3xqE68tbOTr5jynXI7d+W9g
         CNLiyIF5G8gDKr1L5YkiS3BaoKvQ/4pkM79pnAPqqAEPWwyvZehck8aHsD7/FeCgByGY
         nqPIn92yHhLjDVR6LX7HJqxk8Mm5nsT4JBoyeCUNUxEvUyiNF1IPiFDT3e4Btgp225FD
         2PGA==
X-Gm-Message-State: AOAM530aKw778dW91kuI7TRV61Mnia6zM5UHlqnIFRdJDiz0i5qOxykv
        PY79zUosMSLVw9XHF/vbrW3Su+OSKZGihRT3H4Y=
X-Google-Smtp-Source: ABdhPJwvRwjGCRG8cYSKyR9WCGWfaqoJXPVYbM/PD/HXjK1JVEl3aylB3uJt/AftSNZdOihIo7CQRO9dtEfKBkpi+vA=
X-Received: by 2002:a4a:5209:: with SMTP id d9mr7485920oob.40.1594969979564;
 Fri, 17 Jul 2020 00:12:59 -0700 (PDT)
MIME-Version: 1.0
References: <1594382612-13664-1-git-send-email-yoshihiro.shimoda.uh@renesas.com>
 <CAMuHMdVqFU538syZq2B=An-MA3zo3RT115JmvaVxyt5mb-Wvsg@mail.gmail.com> <TY2PR01MB3692CD5627D9848ADDA88BF0D87C0@TY2PR01MB3692.jpnprd01.prod.outlook.com>
In-Reply-To: <TY2PR01MB3692CD5627D9848ADDA88BF0D87C0@TY2PR01MB3692.jpnprd01.prod.outlook.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Fri, 17 Jul 2020 09:12:48 +0200
Message-ID: <CAMuHMdVzO=wwTyYhHj2Cg3g_rRQCHQ_97DVH8zXAkg_ki5ZHhw@mail.gmail.com>
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

On Fri, Jul 17, 2020 at 7:44 AM Yoshihiro Shimoda
<yoshihiro.shimoda.uh@renesas.com> wrote:
> > From: Geert Uytterhoeven, Sent: Wednesday, July 15, 2020 6:05 PM
> > On Fri, Jul 10, 2020 at 2:03 PM Yoshihiro Shimoda
> > <yoshihiro.shimoda.uh@renesas.com> wrote:
> > > Add full-pwr-cycle-in-suspend property to do a graceful shutdown of
> > > the eMMC device in system suspend.
> > >
> > > Signed-off-by: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
> >
> > Thanks for your patch!
> >
> > Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
> > i.e. will queue in renesas-devel for v5.9.
>
> Thanks!
>
> > >  arch/arm64/boot/dts/renesas/r8a77990-ebisu.dts   | 1 +
> > >  arch/arm64/boot/dts/renesas/salvator-common.dtsi | 1 +
> >
> > I assume we need this on other boards, too?
> > At least ULCB uses the BD9571 PMIC, and has a similar PSCI s2ram
> > implementation as Salvator-X(S) and Ebisu.
>
> I think so. And, I also thin ULCB+KF should not have this because
> it doesn't support Suspend-to-RAM. But, what do you think?

How come ULCB+KF doesn't support s2ram?
Isn't KingFisher just an extension board for ULCB?
Does it require a firmware upgrade?

> JFYI, I could such environment if I added the property into ulcb.dtsi
> and added "/delete-property/" into ulcb-kf.dtsi.

Iff that's the case, that's a valid solution.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
