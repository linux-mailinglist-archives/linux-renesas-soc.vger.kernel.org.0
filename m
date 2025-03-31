Return-Path: <linux-renesas-soc+bounces-15202-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 31531A76AE1
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 31 Mar 2025 17:42:15 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 9E97D167A80
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 31 Mar 2025 15:37:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 345B9224248;
	Mon, 31 Mar 2025 15:30:09 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-ua1-f54.google.com (mail-ua1-f54.google.com [209.85.222.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6C4B52222B6
	for <linux-renesas-soc@vger.kernel.org>; Mon, 31 Mar 2025 15:30:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743435009; cv=none; b=ffcP193KzUGwrZ0IrKKhW/+R5/3RRKyFjOUVACREVN/q/SnGDT3zG3La47awMhzeXl/v5GxzU5nVa22gyvRkVg3kTtgjiYJomtrZOkZjFOfKYVMr34QBy8kdSxAUr1M8Xi97Gwu4TZaNy+ozF4nTJTV/fFQ2N8Q7C4Y7U4G9gsc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743435009; c=relaxed/simple;
	bh=TwD64q2vbAGsQVyRZKaGyP+nmdsChL7+rKNo5ohevV0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=bqWjjfST81UzFaE6zzpjOTQWUep9CpsrlCWfwm0esWokZHHlVJWbctGTks3w01l4Mch5CYVo2WiX53bGNP3ZncNs2Ncf3LukSdthDVsCvePFEPrax/Ouea0p13NIHYat3g7ELIFL025xDtTN0crTGnPyBf2Tiuf8N92zyzrAfvQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.222.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ua1-f54.google.com with SMTP id a1e0cc1a2514c-86feb848764so2035271241.0
        for <linux-renesas-soc@vger.kernel.org>; Mon, 31 Mar 2025 08:30:07 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743435005; x=1744039805;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=GUXOYabVIv/vEqnKOv3Nanvl0LoIfDRtvx9JDuP7eck=;
        b=wT5P5DF6EjxjPlNmkC7R4MMBzt77HGe9Bz/Qn20+4fi5SgjpIUx2OqY50WtjfRlXqX
         Nz6/HzOrj9qWzuPXPk7AR0ONt6tT2IyPpIumttv2RRJzkb/wVIno5k5srsOXepkmTLMe
         666afT5DldLvGSG7z3BtIw4q89OXgrZVTEh1aNYzsl9aN3bbA02qjjp7+iE2o25SIdjQ
         XS7edXFKwmIA1aKhPe9OH30QGsw2YbmjGobSYFVweKZVl44ExoF0FCKbCGBZtMfOQakh
         s1Ew8Rrj1BEqtgiI/gh3UlBSDewpCHTMXHLkCU1WHzOlddG1/C0ZuVdB7TTgFv3LH/dl
         8++A==
X-Forwarded-Encrypted: i=1; AJvYcCVJp5ib64W57Lpp4fQvkEUCT49oyGK3Kdkx76DTJcsTJOGRfwG3GUFqDnYAQSvx/5F6th0yOkFkcxtLqMhA99MfVg==@vger.kernel.org
X-Gm-Message-State: AOJu0YwZfqn8rVzjf8zI4fTPe18J+cAL8igH8ISwYu2B+zUxUv6A/jCI
	yTslgS8jI+/fyX25/nDxrCt2/swPtDZj+OzBuJTCKajcu3WEkcib6g4kWWIc
X-Gm-Gg: ASbGncsn2ZPVJXdAYnijBPCZcNK2YtA01FtsCnQ1DKBwMUjNvOFoz+9qfufO74bdBcz
	ED8nqm+Z3dPYXMyLNeX4789heyVVowon03KAyQFkaMZwNxUKlSTavjlOlK7VqMM8qV45YHuGHoS
	jDYkWfpzkL1sbZqWYCd3kuT3icDasJE0WAsqUyMmPUNY8xrC0nImxbBL26qxpFu3b4X8+lpfQfP
	CpOXg//NZh3pdTH7uwURWDgtvk5hFQNpw9pqIWR8aJsLP8Vs0mgJNViORA/Hcs1bcazi+5ZxAoP
	JPAHUTGsup5Dgdb0XACy9JZheT+bTRtZqlD26WO51cF4z47vW9A87hll756yYe2AlDh3Lw6SoSk
	M7qbJ40FTKgqsr/j+Tg==
X-Google-Smtp-Source: AGHT+IFt0gqZOnNzi/jjrWPH6wj7qVkSGfwQXORD5nOxqBCfyezccArO2iUf9VZsmlrLOawS51pTdA==
X-Received: by 2002:a05:6102:2c8d:b0:4bb:d062:420 with SMTP id ada2fe7eead31-4c6d37ffa64mr5832873137.1.1743435005521;
        Mon, 31 Mar 2025 08:30:05 -0700 (PDT)
Received: from mail-ua1-f49.google.com (mail-ua1-f49.google.com. [209.85.222.49])
        by smtp.gmail.com with ESMTPSA id ada2fe7eead31-4c6bfc847fesm1644284137.5.2025.03.31.08.30.05
        for <linux-renesas-soc@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 31 Mar 2025 08:30:05 -0700 (PDT)
Received: by mail-ua1-f49.google.com with SMTP id a1e0cc1a2514c-86fbb48fc7fso1691964241.2
        for <linux-renesas-soc@vger.kernel.org>; Mon, 31 Mar 2025 08:30:05 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCUiXc/1T7DvwVlGS23WeN0biWmbJlvStkqwkHQQY2Ux4n94dus2537pZPhdkX/09gtnqLuTPqJxoITD5GpsL+Z7pg==@vger.kernel.org
X-Received: by 2002:a05:6102:8029:b0:4c3:6c4:e177 with SMTP id
 ada2fe7eead31-4c6d399b558mr5930978137.22.1743435005010; Mon, 31 Mar 2025
 08:30:05 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250327193318.344444-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <20250327193318.344444-2-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <TYCPR01MB11332B9F7292BEFFA29547F2586A02@TYCPR01MB11332.jpnprd01.prod.outlook.com>
 <CAMuHMdXyb=iKoRBicAf4J8a3Zk=ciRNTtB_+k60xjciReMuv5Q@mail.gmail.com> <TY3PR01MB1134616BE4AEEE7C252BCB2DE86AD2@TY3PR01MB11346.jpnprd01.prod.outlook.com>
In-Reply-To: <TY3PR01MB1134616BE4AEEE7C252BCB2DE86AD2@TY3PR01MB11346.jpnprd01.prod.outlook.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Mon, 31 Mar 2025 17:29:53 +0200
X-Gmail-Original-Message-ID: <CAMuHMdVcN6HfJ5H1aFLYprOeW+24+LJz5BUay2-8Onszjwd92g@mail.gmail.com>
X-Gm-Features: AQ5f1Jph0kEAsj5QCMFNfK0mmkX5wylIm36op8v4vkMSB085VCcx753lbcK1gSg
Message-ID: <CAMuHMdVcN6HfJ5H1aFLYprOeW+24+LJz5BUay2-8Onszjwd92g@mail.gmail.com>
Subject: Re: [PATCH RFC INTERNAL v2 1/4] soc: renesas: Kconfig: Enable SoCs by
 default when ARCH_RENESAS is set
To: Biju Das <biju.das.jz@bp.renesas.com>
Cc: Prabhakar <prabhakar.csengg@gmail.com>, 
	Wolfram Sang <wsa+renesas@sang-engineering.com>, 
	"linux-renesas-soc@vger.kernel.org" <linux-renesas-soc@vger.kernel.org>, 
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>, 
	Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>
Content-Type: text/plain; charset="UTF-8"

Hi Biju,

On Mon, 31 Mar 2025 at 17:26, Biju Das <biju.das.jz@bp.renesas.com> wrote:
> > From: Geert Uytterhoeven <geert@linux-m68k.org>
> > On Fri, 28 Mar 2025 at 08:15, Biju Das <biju.das.jz@bp.renesas.com> wrote:
> > > > From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> > > >
> > > > Enable various Renesas SoCs by default when ARCH_RENESAS is selected.
> > > > Adding default y if ARCH_RENESAS to the relevant configurations
> > > > removes the need to manually enable individual SoCs in defconfig files.
> > > >
> > > > Signed-off-by: Lad Prabhakar
> > > > <prabhakar.mahadev-lad.rj@bp.renesas.com>
> >
> > > Can we add this changes to newer devices for eg:RZ/T2H, RZ/V2N?
> > >
> > > So that previous devices, they don't need to patch this file:
> > >
> > > 1) If they want to do a standalone build for Image size optimization,
> > > just remove the unwanted SoCs from defconfig.
> > >
> > > 2) Debug some issues, some people just use defconfig from
> > >    different kernel version to try it out.
> >
> > While defconfig files need an update, config files do not:
> > running "make oldconfig" does not enable support for extra SoCs.
>
> Thanks for the info. I haven't used oldconfig much.

I always use:

    make oldconfig
    make savedefconfig
    diff arch/$ARCH/configs/$DEFCONFIG defconfig

to make sure nothing gets disabled by accident (e.g. when a select
statement is dropped from a Kconfig file).

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

