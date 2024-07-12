Return-Path: <linux-renesas-soc+bounces-7294-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 9154B92FB31
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 12 Jul 2024 15:21:04 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 202A1B23671
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 12 Jul 2024 13:21:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9E67B16F85D;
	Fri, 12 Jul 2024 13:19:17 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-yw1-f175.google.com (mail-yw1-f175.google.com [209.85.128.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5B3D7172BCA;
	Fri, 12 Jul 2024 13:19:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720790357; cv=none; b=lkFTKCz4+abUc59ivDI/RENX0LloR7+NjIsfJ2ny8MUgnWiBMlqD8sDWj/c2UsJQJI0Mc38l1yTDma+HbEh40X5QeCA3d9FJjS9OLt6Qib3HFNmF9hk1vEZXBqO5QNfHcK99MiMoDhwyGuTUa++i26B9cvELxXvHTKT0iXis1e0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720790357; c=relaxed/simple;
	bh=mXGw4Pyo/ielLaWf8Gb5/Yt58SdNsOJV5cA8yoYd0VI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=YXe/r4dWoqQ1UaXLjra4YXh7CZqoq6Xa6IjEr8P5hwG0KPZYDbUtANtGhvs00RnkNwVFxhQAxQz9YyQzu8nGPoYbck5Z2vVAY2M1B8++K1dOZEqCs6rtJNbYbw2DbyG5tVlKLz9GhZMRpzHuAKZNMShEyLeNkvSYzFJ4gWk/f4Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.128.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-yw1-f175.google.com with SMTP id 00721157ae682-64b5617ba47so19034177b3.3;
        Fri, 12 Jul 2024 06:19:15 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1720790353; x=1721395153;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=5m8Dv6cTOGGwM6bmhOvskwBBfCg05bDh2a7ctEmgVw0=;
        b=NwmtDhVQWmPgSmhC9HAz4nminKs03wIgi8oeAm/yL8CuLeF+4KMGX+a52CsNpmfIor
         +WzIrI3uK5xN1dKzQPQ/iFdywYsHuyTemd2k5ZZHp9MzTRUzMwpyE8Vt/pHDpEYTDcZn
         RdaZHOknwWOVW0GRypf2U9yxulJ1eF3XkEvd8J5OXNwsAvUZmVk97KMPQquCcsA0Ed6f
         ixvdR5kiSyX/DnNOPHeelA3KF2K4bDz/qNAx+J/V8ZcSnQXdV5TxRTAsCH7paOXnQXwY
         iCr287w3NZUuGrt9SKjHC/z5hHdx6jujil3JpgEOsDODhnC6sD8W/dVJ0+kX9U8GkdNq
         WR1w==
X-Forwarded-Encrypted: i=1; AJvYcCVgjzw8CxCT8cI8DguwoyMPLsaxunLYW20DXp3Z68Dsavq+mmNgRo39qEPMXAn+F/FwH1AuS3uZraCfvDJRPtbTU6co31IFxO9vyojiwog6YkbPnhUffc5BUHfxE7iCAnHVySMIkMDUdrb2tyZGq4ejXN3ZAJkk0uJbrJGU1QxKZAmsPLddM20R
X-Gm-Message-State: AOJu0YxEAqsOTp0c0jOAgVQeUvexxS26636WRU1S8CS0SwOAA2yo5w9a
	E4G5cO+Ks6PmRnTanm29zoXAjpYMUwtyZgPvqMWxsAjQqPK/5ekI2p8/SKmm
X-Google-Smtp-Source: AGHT+IFk/F5gymxwuzUvdh9yEDcaYMvqnfaxwg3qXR2mQLlRYrxQGm8NAJHWoh8TIBdlKyMKcU7m1Q==
X-Received: by 2002:a81:fe0e:0:b0:648:857c:1530 with SMTP id 00721157ae682-658f07d74camr126481647b3.34.1720790353539;
        Fri, 12 Jul 2024 06:19:13 -0700 (PDT)
Received: from mail-yb1-f177.google.com (mail-yb1-f177.google.com. [209.85.219.177])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-658e5317d85sm14701247b3.63.2024.07.12.06.19.13
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 12 Jul 2024 06:19:13 -0700 (PDT)
Received: by mail-yb1-f177.google.com with SMTP id 3f1490d57ef6-e03d49ff259so1793415276.2;
        Fri, 12 Jul 2024 06:19:13 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCUUgdkSlZ2TcK8XkP1HwlJs4sMDvmbIFREPVs53rt+bjmmHw8xlmkw46Vp1VBaGu2mAVxHgDpmOr8lf2nIn2dugufcMDaAag+3ex8a9U2c5RbUNcpBf9R86OSs2/OS5iaG5hAiBPIhX0S/d6/Ec7JCnWlj525hq08x+WRZ4BhJsTQvGbUnV19E9
X-Received: by 2002:a25:d38e:0:b0:e02:c6fe:aea2 with SMTP id
 3f1490d57ef6-e041b03fe9fmr13773034276.7.1720790352960; Fri, 12 Jul 2024
 06:19:12 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <d4abb688d666be35e99577a25b16958cbb4c3c98.1718796005.git.geert+renesas@glider.be>
 <20240619-explain-sip-97568f8ac726@spud> <43a57696-eb4f-4ae3-970a-cee0640baa17@mailbox.org>
 <CAMuHMdV2M6zKwy=Qqv4XR1Zjz4yRGWcp_EYO2d68DUyLp2O1Cw@mail.gmail.com> <20240620-paver-fidgeting-70946d975eac@wendy>
In-Reply-To: <20240620-paver-fidgeting-70946d975eac@wendy>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Fri, 12 Jul 2024 15:19:00 +0200
X-Gmail-Original-Message-ID: <CAMuHMdWO9hqyktvkB96qjOdN6zBro-Yi0EF8qVxX8eEA8Oyv0w@mail.gmail.com>
Message-ID: <CAMuHMdWO9hqyktvkB96qjOdN6zBro-Yi0EF8qVxX8eEA8Oyv0w@mail.gmail.com>
Subject: Re: [PATCH] dt-bindings: clock: rcar-gen2: Remove obsolete header files
To: Conor Dooley <conor.dooley@microchip.com>
Cc: Marek Vasut <marek.vasut@mailbox.org>, Conor Dooley <conor@kernel.org>, 
	Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, linux-clk@vger.kernel.org, 
	linux-renesas-soc@vger.kernel.org, devicetree@vger.kernel.org, 
	marek.vasut+renesas@mailbox.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Conor,

On Thu, Jun 20, 2024 at 11:06=E2=80=AFAM Conor Dooley
<conor.dooley@microchip.com> wrote:
> On Thu, Jun 20, 2024 at 10:30:25AM +0200, Geert Uytterhoeven wrote:
> > On Wed, Jun 19, 2024 at 9:17=E2=80=AFPM Marek Vasut <marek.vasut@mailbo=
x.org> wrote:
> > > On 6/19/24 7:48 PM, Conor Dooley wrote:
> > > > On Wed, Jun 19, 2024 at 01:22:46PM +0200, Geert Uytterhoeven wrote:
> > > >> The clock definitions in <dt-bindings/clock/r8a779?-clock.h> were
> > > >> superseded by those in <dt-bindings/clock/r8a779?-cpg-mssr.h> a lo=
ng
> > > >> time ago.
> > > >>
> > > >> The last DTS user of these files was removed in commit 362b334b179=
43d84
> > > >> ("ARM: dts: r8a7791: Convert to new CPG/MSSR bindings") in v4.15.
> > > >> Driver support for the old bindings was removed in commit
> > > >> 58256143cff7c2e0 ("clk: renesas: Remove R-Car Gen2 legacy DT clock
> > > >> support") in v5.5, so there is no point to keep on carrying these.
> > > >>
> > > >> Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
> > > >
> > > > If U-Boot is not using them,
> > > > Acked-by: Conor Dooley <conor.dooley@microchip.com>
> > > > (and if it is, another task for Marek I guess!)
> >
> > Good point!
> >
> > U-Boot does have include/dt-bindings/clock/r8a779?-clock.h, despite
> > never having used them.  The unused headers and the corresponding
> > r8a779?.dtsi files were introduced together, in the various "ARM: dts:
> > rmobile: Import R8A779[0-4] DTS from Linux 4.15-rc8") commits in U-Boot
> > v2018.03, i.e. after the conversion to the CPG/MSSR DT bindings.
> >
> > > U-Boot is using upstream DTs on R-Car via OF_UPSTREAM, so whatever
> > > happens in Linux also happens in U-Boot since 2024.07 ... with slight
> > > sync delay . I don't expect much breakage.
> >
> > So the obsolete headers will be removed automatically from U-Boot
> > soon, too?
>
> Not if it is is include/dt-bindings/, only if it is in
> dts/upstream/include/dt-bindings AFAIU.

OK, U-Boot patch sent
https://lore.kernel.org/linux-renesas-soc/6355fbaa5e3c40d6790cb5aa6ffc1c573=
c1f08ed.1720790104.git.geert+renesas@glider.be

Gr{oetje,eeting}s,

                        Geert

--=20
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k=
.org

In personal conversations with technical people, I call myself a hacker. Bu=
t
when I'm talking to journalists I just say "programmer" or something like t=
hat.
                                -- Linus Torvalds

