Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1D6A52FC187
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 19 Jan 2021 21:49:14 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728623AbhASUs0 (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Tue, 19 Jan 2021 15:48:26 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49700 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2392053AbhASUrV (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 19 Jan 2021 15:47:21 -0500
Received: from mail-ej1-x62a.google.com (mail-ej1-x62a.google.com [IPv6:2a00:1450:4864:20::62a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0D446C061757
        for <linux-renesas-soc@vger.kernel.org>; Tue, 19 Jan 2021 12:46:37 -0800 (PST)
Received: by mail-ej1-x62a.google.com with SMTP id g12so30460651ejf.8
        for <linux-renesas-soc@vger.kernel.org>; Tue, 19 Jan 2021 12:46:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=9FLTjygwFi+n7PjOSwkn7MSIo9iFXRW1Ns3VTNaUNoc=;
        b=TwhuWpNc0mOpczLNerRso8YjIWA6kjhlyf6pnsOUSAcXbMagPUMNCcfCk9OAKSGTb1
         FfF2VH+oD21qyTZ0CszTudxU/AZW/w3JuTpOPQ1AtvYn0uRywZJ7pfSCh0g5AD2mWKUQ
         Kt3fqvrviTfEsuu1Qk2pgWHwc5bJblt1pjVKORMyFJINnIPZnHiuAoyel6lCvpUDc4Ty
         HkUkAq1Nv5bTW2Kd5095sWPyzzWjwUfqtSgsjCM4UcICC3AmiJj6LC/xIcErKPV3Y3cH
         I3mNvU1haraZzAvCMqUox+wwWu/iryUXtjxtN1IcgynzC+GssDuXQ91/ccRMguX7eNtC
         NaIw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=9FLTjygwFi+n7PjOSwkn7MSIo9iFXRW1Ns3VTNaUNoc=;
        b=h4FMpgUBP4M8uo4Cl9nifx+5rUebReA3paKoHiqHhny3iRJT9UGepgyRkcUpqOU8UI
         WvAsDm7B5cceVcHprS0nXKH377TWqaaRxcfVhe9A2WcTqHMBze/NNfDOjGajfg0j5UnA
         gra4r/k+EeCqlRvrS+sKVHnFZEWSPsjKGSib8RlPRYw+A37q0YcV3+lsLvbpNTY/c/iw
         ITICsRenQB5eFOlu7lmDBVx2148ElEpcWqG8UiHRlIjTSP1BZJkLI7qMh7NPFAWAm+vD
         SiG2S69mXWiizA2kUYipS77mUOZRsI5xB9taqotjRIG7g9PkY2tKmy9Kyej5dYQqwpps
         ahWA==
X-Gm-Message-State: AOAM533lz4QUQYxtfsu+npFSzUNzHWr4/YQNmpeOyO2ldrbDHnfYP6Su
        zMYx0rBv/mM8U31lWCIwSEHxdDcuDXawkN7SUbKSa+93l8g=
X-Google-Smtp-Source: ABdhPJxIxaX7IgWoSPLqg09nbLl5Tg7ZKP4mMBz4hHqpsgKgg5l5yDcupin36xPzgWfRCiWG/1a+6mmimNZm3F+ns+U=
X-Received: by 2002:a17:906:f0d7:: with SMTP id dk23mr4098171ejb.131.1611089195666;
 Tue, 19 Jan 2021 12:46:35 -0800 (PST)
MIME-Version: 1.0
References: <20210119133322.87289-1-wsa+renesas@sang-engineering.com>
 <CAHCN7xLcqh0efDuMS96Tot2Wek736VTbSbYm-rQgJf=ghZ0sBA@mail.gmail.com> <CAMuHMdVLwcQ6WpEhybxwCjJ2S-tuOoWqSiQCmB2-=Bunw4fX4A@mail.gmail.com>
In-Reply-To: <CAMuHMdVLwcQ6WpEhybxwCjJ2S-tuOoWqSiQCmB2-=Bunw4fX4A@mail.gmail.com>
From:   Adam Ford <aford173@gmail.com>
Date:   Tue, 19 Jan 2021 14:46:24 -0600
Message-ID: <CAHCN7x+_h00tG4jw_NQ+kx7eW=ZOcrDJ1PAVgMWK-rq53TyoiQ@mail.gmail.com>
Subject: Re: [PATCH] arm64: dts: renesas: disable SD functions for plain eMMC
To:     Geert Uytterhoeven <geert@linux-m68k.org>
Cc:     Wolfram Sang <wsa+renesas@sang-engineering.com>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

On Tue, Jan 19, 2021 at 2:35 PM Geert Uytterhoeven <geert@linux-m68k.org> wrote:
>
> Hi Adam,
>
> On Tue, Jan 19, 2021 at 7:43 PM Adam Ford <aford173@gmail.com> wrote:
> > On Tue, Jan 19, 2021 at 8:48 AM Wolfram Sang
> > <wsa+renesas@sang-engineering.com> wrote:
> > >
> > > Some SDHI instances are solely used for eMMC. Disable SD and SDIO
> > > for faster initialization.
> > >
> > > Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
>
> > > --- a/arch/arm64/boot/dts/renesas/beacon-renesom-som.dtsi
> > > +++ b/arch/arm64/boot/dts/renesas/beacon-renesom-som.dtsi
> > > @@ -312,6 +312,8 @@ &sdhi3 {
> > >         vqmmc-supply = <&reg_1p8v>;
> > >         bus-width = <8>;
> > >         mmc-hs200-1_8v;
> > > +       no-sd;
> > > +       no-sdio;
> >
> > No objections on the Beacon board.   I cannot speak for the rest.
>
> Does this mean I can add your
>
>     Acked-by: Adam Ford <aford173@gmail.com> [beacon]
>

Yes.  I wasn't sure what the appropriate response sould be. (Review-by
or Acked-by)

adam
> ?
>
> Thanks!
>
> Gr{oetje,eeting}s,
>
>                         Geert
>
> --
> Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org
>
> In personal conversations with technical people, I call myself a hacker. But
> when I'm talking to journalists I just say "programmer" or something like that.
>                                 -- Linus Torvalds
