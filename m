Return-Path: <linux-renesas-soc+bounces-18221-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 24DFCAD7B04
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 12 Jun 2025 21:23:35 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 2D7811892B07
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 12 Jun 2025 19:23:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BE8D32D29DB;
	Thu, 12 Jun 2025 19:23:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="hzLyUXfb"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-wr1-f43.google.com (mail-wr1-f43.google.com [209.85.221.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0258B7263C;
	Thu, 12 Jun 2025 19:23:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749756210; cv=none; b=j8ABJZacf3YUHRTA/rUhpcdVxs86NKCm16OcCivroScIx6KLKAx8Z2hB9hxo9sJ4MNPCLsYcRJ03CMpBBwibmE0R30h6olB/fUMye8VoTs/+zsWZ/8qg7EkcvV6Nau97G3M5VGEPOXNt6bIQs6AXy31Mvx3lFGb6Jh8S4uh6/Hg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749756210; c=relaxed/simple;
	bh=GkPBp+7Ial7d53RxPCtqZeK0KnBSV3Bsd5uihrpVM4g=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=LP6T0tz73M5IA8ys53GLTih/H0DBvDjVsr3g5RoMJo0y1dzraC8vXYQBOtLOQsuim0T1e6uwSeDKs3ud5bgNNANaNoliUArpXkSKr5Iut7lItzqVQ8OICJiRSnwzKjwSuLPmUJi5bt6MUgIeO5lXWxd6WfagoP2Do0NtifXlDz0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=hzLyUXfb; arc=none smtp.client-ip=209.85.221.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wr1-f43.google.com with SMTP id ffacd0b85a97d-3a54690d369so1355008f8f.3;
        Thu, 12 Jun 2025 12:23:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1749756207; x=1750361007; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=GkPBp+7Ial7d53RxPCtqZeK0KnBSV3Bsd5uihrpVM4g=;
        b=hzLyUXfbNcen+ZGzXIOk+NlfDDLdU+x55iROrBxzYqKcbkMMO9ICLXwUE+RKlKVNdr
         ylxKZxq662MnLtDsxJZeSnBLQmEuPuUQQaQulUajXn6Z+1Htoz+WiL0Bc6pQuICTbHvU
         16Q+/Q3bWXS+zo3s3pIcwgqZvFzzygSPsddn04wuIs+WOuzyYr/VkWBIUy9zvFTVWGGL
         ochr1lfLWdblaHBlrXw7IredgqqS16379uccCKtSf5HNIvXrhu0M+hMONeDZdE0RABil
         77gI+02QxEc3BjGxxglfaVYk6dAXorzqOwqmTdGWq5wgFoeJM5oeaFVcvwxVj1/umxGw
         95PQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749756207; x=1750361007;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=GkPBp+7Ial7d53RxPCtqZeK0KnBSV3Bsd5uihrpVM4g=;
        b=ObmOE4Y+wyk9iGuBzy+YJH7zVPgo8gIu4eC3qzf27+KOpTewg7OStEAg9BkzX+blJz
         smGJpIS2/PefpslfK3yYdXhJ86eaI7nFW4DhrLP9npIR+S+MAc/5nQvE0TrK9+60YVOC
         apJrGTOIw8acelz2tUjPFvwEFTENEdUODZcYT3yWMFWIkLuAcm8mzwn4bNFVHPCKqAg8
         8TeH36w1velw+V5DACwh9g3G6dKiaNSEpDTqLIOjFGyTtVNIG15SxhHDM1emw/3J7tdG
         lNGc8QIjU53AFfCEL4x1+Z8AJ3ZBJXUWUR6UGg4tdO/V82o1RTaLKLEsxigUJi7vxBSJ
         ZNQw==
X-Forwarded-Encrypted: i=1; AJvYcCUQ33ZBNAf/xve9Yxynd9VxtOmOhfyzRerg+Vp1XyRhuKN3fI131CEUal2UMQM18dtVzl6kM1uyvcKvUNx2lcOS89Q=@vger.kernel.org, AJvYcCXH7JljQeLGJVLxs6CUixnETcllRxO5DSkT5nceqnF42HtvdHq/DKxJ+HHTQPKWYjF6ppPqu0NaoEM=@vger.kernel.org, AJvYcCXZrFeO1lg34F9YOlxr3t6Dgz5zzjwNIG5+XwFPpUN9Ih3jLZN5Pi8jqvm4t+xqnvrRpVqNfSBG4Kic6Spc@vger.kernel.org
X-Gm-Message-State: AOJu0Yxqma+2TThXy9x99ZWgclTyv9c4RHICAD/D+ISgtqG6NyhyuqIv
	Lr+gTvuntkNK247lpYD83n1IFDY81l9I+vmbP79grK8remqnsyFPy3KyeP+QaptyZOz5qS4NkV8
	Ktlt4libgFxP35ABLrD5jWHhikX6b0Ko=
X-Gm-Gg: ASbGnctuFBpcpkxRDrpw5M/Mi7mmPsk0q0isi50WI9TdILSe1wDarnO5b7uo0BjrzrP
	2tRFHoF41GGyiPScOlj79BwfTUNs0CgFLuCf8GIraIxp+AIRt6RvclEZCd4pDE+l+OniRZHetRO
	tyrfQOl2oyOSAvHOFz5Klbc2uhbP9W7QPNuOuyess=
X-Google-Smtp-Source: AGHT+IHtoPBVDF/R4sDnO9FlA7UYFZnsO4VsOLLeMyoiPH63nrB90tosqR1qLC+dU9DNdlnFMWP2xMJMmd5fVc7jzkE=
X-Received: by 2002:a05:6000:4305:b0:3a5:1c0d:85e8 with SMTP id
 ffacd0b85a97d-3a568717033mr369001f8f.22.1749756207155; Thu, 12 Jun 2025
 12:23:27 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250609140341.235919-1-prabhakar.mahadev-lad.rj@bp.renesas.com> <CAMuHMdU5YyfQ6KwQyVaeZaEk7buNv56H_gPrWt_yb85SSF5aEQ@mail.gmail.com>
In-Reply-To: <CAMuHMdU5YyfQ6KwQyVaeZaEk7buNv56H_gPrWt_yb85SSF5aEQ@mail.gmail.com>
From: "Lad, Prabhakar" <prabhakar.csengg@gmail.com>
Date: Thu, 12 Jun 2025 20:23:01 +0100
X-Gm-Features: AX0GCFskKlFUqeby_aTJsr7JlgqSU7Uig7f0wPEKjZT2QS0ncUPc16QYVQtZSIw
Message-ID: <CA+V-a8sgqzs_7RKN1SdKTWMrzg2xE7JbmKxkQSD0Tn4YDawAmg@mail.gmail.com>
Subject: Re: [PATCH] clk: renesas: rzv2h-cpg: Fix missing CLK_SET_RATE_PARENT
 flag for ddiv clocks
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, 
	linux-renesas-soc@vger.kernel.org, linux-clk@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Biju Das <biju.das.jz@bp.renesas.com>, 
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>, 
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Geert,

Thank you for the review.

On Thu, Jun 12, 2025 at 2:48=E2=80=AFPM Geert Uytterhoeven <geert@linux-m68=
k.org> wrote:
>
> Hi Prabhakar,
>
> On Mon, 9 Jun 2025 at 16:03, Prabhakar <prabhakar.csengg@gmail.com> wrote=
:
> > From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> >
> > Commit bc4d25fdfadf ("clk: renesas: rzv2h: Add support for dynamic
> > switching divider clocks") missed setting the `CLK_SET_RATE_PARENT`
> > flag when registering ddiv clocks.
> >
> > Without this flag, rate changes to the divider clock do not propagate
> > to its parent, potentially resulting in incorrect clock configurations.
> >
> > Fix this by setting `CLK_SET_RATE_PARENT` in the clock init data.
> >
> > Fixes: bc4d25fdfadfa ("clk: renesas: rzv2h: Add support for dynamic swi=
tching divider clocks")
> > Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
>
> Thanks for your patch!
>
> Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
> i.e. will queue in renesas-clk for v6.17, unless you think it deserves
> to be fast-tracked as a fix (issue present since v6.12).
>
I think we can live with this being applied to v6.17. I noticed this
only when adding XSPI support.

Cheers,
Prabhakar

