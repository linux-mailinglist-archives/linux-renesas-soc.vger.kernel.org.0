Return-Path: <linux-renesas-soc+bounces-17144-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 3C393AB8BF7
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 15 May 2025 18:10:54 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id BBB4517663E
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 15 May 2025 16:10:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4BA0221ADC6;
	Thu, 15 May 2025 16:10:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="UYUZEKxl"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 70A1C2192FD;
	Thu, 15 May 2025 16:10:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747325449; cv=none; b=LeTxEe7NuQ47X6nA6d6Sg2Jv5bIghk5d3RyHrQUDoH2t623NAL8/+LPfdBPqbs34JkxLvnqSKeS0d3e7CZ4GGdVBKsWBZaJJZf8PmOucaxFn9O39wVv9Wd6rPTYjUSVCvhmiYk1/JdZfNN4CjZA4Ki++uNokANoi+yxLNnULYns=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747325449; c=relaxed/simple;
	bh=af9vxyEjUFLXkXblE0fNKzVVCZxvU4UnA/BPCTRi0Ag=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=mPgQB7shBwHo0WmOC7pfs5DaqQLxBF0waBxj+d7/vrDH02An3u3AorLYQImLfMDfK1Jba2+FwkEp96T7Za0xQdx7x23oCAFdn34ij0ckTknzL8Lpas+0yOwd9S4IbNZ+Cqt5eANU/maOD486mfLTor5DHTGNAM9LsdpKIk/IdnA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=UYUZEKxl; arc=none smtp.client-ip=209.85.128.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-442ed8a275fso12831935e9.2;
        Thu, 15 May 2025 09:10:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1747325446; x=1747930246; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=K2RUuqM7j77YiC7O2/E2sWiPYfT3vLPzw6aLspbrJ9A=;
        b=UYUZEKxlSm7LXl+NH3YnZXh3xsPxeboKDDPXMBuwny5F2LMEwcERDhEhOY5ahnjn/a
         J0LPWMJjGmfZ7G6JptCIu/Rpar4Meqdktyt3boOUJooqRtRfCW2upAJxl88vdy2sV44p
         5IHHbmH9Nso+ykZfX6x6tyGafX4QGEBmSjs1pGpPPU5NFB5vnudkgUj1guo+GT44u/oS
         xEgT16HzaEiiS4NyJU9QX000nMO4qHDRHgxxK89dSUZdXyR9ZclK6683aE6dEZnuCbwL
         /5hz1L1Icn30qC79aaApfZD6tfSDGGLr+3HP3IPpXsx8H0ADu99v6A8QtpywaGNbREUe
         /Jxg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747325446; x=1747930246;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=K2RUuqM7j77YiC7O2/E2sWiPYfT3vLPzw6aLspbrJ9A=;
        b=wXc7g98dnVPQpRrLM0h+Hd4zemrTEN9l4mIp32w/HR+CAO1hQuFOJ0mHZ9tcUvx/Ni
         n9zT749Xo6kBFnFaEb0caiAplxBlNX5+x69MAdD8XyC5YNCPujlMCgupZU6f5BbabkSl
         0xIyxQUeuTD/gC+kSvmMmOI+hALKheJYHu369wDcjkF9eUTJHcgHD2Yn6bkZ9aNOfRCJ
         T4YMAg5WERpO2+YNIyiJ7UktIvPxwmMgaspCqj7UBTG7aGU4GqYHLAdeyGaB8pGmOsW4
         IgVc6fxf/PaIbpbkXrKJFwa+cUFUsKkUsnKBsEEUv5YXIw57Mzz4QH+Drn8R5hURviDw
         e40Q==
X-Forwarded-Encrypted: i=1; AJvYcCVXPo6RuCWJ1lpgRmbcH6F1JC6MnzQo3NfI/s/TzEJE0GOBD6Sn5qK5IXInKPuG4N81ZtLB30ebAGhjrzj48e/TC0o=@vger.kernel.org, AJvYcCXDVn9TjXBIwGkLHP1AocUnc8btfbXH9saOzTJ2X7N/Dnxd3hZKF9QPXOyU5pZ/emP8uAu6AJkvbSxB@vger.kernel.org, AJvYcCXW4/H65ZSlVWriCFNRBCjbY34cuwnKijHeTk/qpSfPrbGGTfqVJPrvitTwTiE5pYkVZTq49gpxFMYukgDr@vger.kernel.org
X-Gm-Message-State: AOJu0Ywej/gs+2gj40OssxDG2fxLiH6brrry3okQLSjOIoy/taPZlfFC
	dRj74o+r9fr+P+r9fpnL3/152AfNVWVqYUd8wNjgDSIAG890Vb6UjxpqEJ4fvIxqaXAzgsKehW5
	Uyr2j6mxqShP88rGMWCneRSeUBh3HF/w=
X-Gm-Gg: ASbGncuvA43aTWSPWY2PfD/xZ/K4A0z73XUhlOzs3MKqeNmidaX7VFB8QT8fCRMJrSG
	9fjJ35T6/Z0BcdqBpKAXGdMnnWz8DfgPLDvwukuFvFrxb39OqBtqX07VLjL6RgmcbXaYG/r7aLJ
	qtRn0OHV4D+1WBC703PkzhwC2jSISiVdo=
X-Google-Smtp-Source: AGHT+IFZbUVdPwHyT0Clm2bKqbykU6Hoz0divy6kyYfkhV2fc4IbIeu9yY9VFI6isbO+t3Jgv72E5GlEP9c/n5Vmv4I=
X-Received: by 2002:a05:6000:2dc8:b0:3a0:8325:8090 with SMTP id
 ffacd0b85a97d-3a35c825b99mr373886f8f.18.1747325445358; Thu, 15 May 2025
 09:10:45 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250506103152.109525-3-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <202505151255.rCHp8Bvu-lkp@intel.com> <CAMuHMdUh3oXniR3b_g+SuqXXeB=3YRFSVOONOth7XRNpHC=a8A@mail.gmail.com>
In-Reply-To: <CAMuHMdUh3oXniR3b_g+SuqXXeB=3YRFSVOONOth7XRNpHC=a8A@mail.gmail.com>
From: "Lad, Prabhakar" <prabhakar.csengg@gmail.com>
Date: Thu, 15 May 2025 17:10:19 +0100
X-Gm-Features: AX0GCFutHTsXdF6X-UzPCdROzCLoI3M2MdWC6VhMZtfwaAYxbEp32opOSVRegW4
Message-ID: <CA+V-a8vrLyWDprGMcnbPQ5Skt=+zcRA6nJ6APOQ2V0d17pfMog@mail.gmail.com>
Subject: Re: [PATCH v3 2/2] clocksource/drivers/renesas-ostm: Unconditionally
 enable reprobe support
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: kernel test robot <lkp@intel.com>, Daniel Lezcano <daniel.lezcano@linaro.org>, 
	Thomas Gleixner <tglx@linutronix.de>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Maxime Coquelin <mcoquelin.stm32@gmail.com>, Alexandre Torgue <alexandre.torgue@foss.st.com>, 
	Geert Uytterhoeven <geert+renesas@glider.be>, Magnus Damm <magnus.damm@gmail.com>, 
	Chris Brandt <chris.brandt@renesas.com>, llvm@lists.linux.dev, 
	oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com, 
	linux-arm-kernel@lists.infradead.org, linux-renesas-soc@vger.kernel.org, 
	Biju Das <biju.das.jz@bp.renesas.com>, 
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>, 
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Geert,

On Thu, May 15, 2025 at 6:59=E2=80=AFAM Geert Uytterhoeven <geert@linux-m68=
k.org> wrote:
>
> On Thu, 15 May 2025 at 07:04, kernel test robot <lkp@intel.com> wrote:
> > kernel test robot noticed the following build warnings:
> >
> > [auto build test WARNING on tip/timers/core]
> > [also build test WARNING on robh/for-next linus/master v6.15-rc6 next-2=
0250514]
> > [cannot apply to daniel-lezcano/clockevents/next]
> > [If your patch is applied to the wrong git tree, kindly drop us a note.
> > And when submitting patch, we suggest to use '--base' as documented in
> > https://git-scm.com/docs/git-format-patch#_base_tree_information]
> >
> > url:    https://github.com/intel-lab-lkp/linux/commits/Prabhakar/dt-bin=
dings-timer-renesas-ostm-Document-RZ-V2N-R9A09G056-support/20250506-223636
> > base:   tip/timers/core
> > patch link:    https://lore.kernel.org/r/20250506103152.109525-3-prabha=
kar.mahadev-lad.rj%40bp.renesas.com
> > patch subject: [PATCH v3 2/2] clocksource/drivers/renesas-ostm: Uncondi=
tionally enable reprobe support
> > config: hexagon-randconfig-001-20250513 (https://download.01.org/0day-c=
i/archive/20250515/202505151255.rCHp8Bvu-lkp@intel.com/config)
> > compiler: clang version 21.0.0git (https://github.com/llvm/llvm-project=
 f819f46284f2a79790038e1f6649172789734ae8)
> > reproduce (this is a W=3D1 build): (https://download.01.org/0day-ci/arc=
hive/20250515/202505151255.rCHp8Bvu-lkp@intel.com/reproduce)
> >
> > If you fix the issue in a separate patch/commit (i.e. not just a new ve=
rsion of
> > the same patch/commit), kindly add following tags
> > | Reported-by: kernel test robot <lkp@intel.com>
> > | Closes: https://lore.kernel.org/oe-kbuild-all/202505151255.rCHp8Bvu-l=
kp@intel.com/
> >
> > All warnings (new ones prefixed by >>):
> >
> > >> drivers/clocksource/renesas-ostm.c:235:34: warning: unused variable =
'ostm_of_table' [-Wunused-const-variable]
> >      235 | static const struct of_device_id ostm_of_table[] =3D {
> >          |                                  ^~~~~~~~~~~~~
> >    1 warning generated.
> >
> >
> > vim +/ostm_of_table +235 drivers/clocksource/renesas-ostm.c
> >
> > 3a3e9f23c2cae9 Biju Das 2021-11-12  234
> > 3a3e9f23c2cae9 Biju Das 2021-11-12 @235  static const struct of_device_=
id ostm_of_table[] =3D {
> > 3a3e9f23c2cae9 Biju Das 2021-11-12  236         { .compatible =3D "rene=
sas,ostm", },
> > 3a3e9f23c2cae9 Biju Das 2021-11-12  237         { /* sentinel */ }
> > 3a3e9f23c2cae9 Biju Das 2021-11-12  238  };
> > 3a3e9f23c2cae9 Biju Das 2021-11-12  239
>
> The table is unused if CONFIG_OF=3Dn due to
>
>                 .of_match_table =3D of_match_ptr(ostm_of_table),
>
Thanks for the pointer, I'll add a __maybe_unused compiler attribute
and send a new version.

Cheers,
Prabhakar

> Gr{oetje,eeting}s,
>
>                         Geert
>
> --
> Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m6=
8k.org
>
> In personal conversations with technical people, I call myself a hacker. =
But
> when I'm talking to journalists I just say "programmer" or something like=
 that.
>                                 -- Linus Torvalds

