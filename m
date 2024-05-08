Return-Path: <linux-renesas-soc+bounces-5234-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id C2ECF8C00F8
	for <lists+linux-renesas-soc@lfdr.de>; Wed,  8 May 2024 17:29:47 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id F42041C2180A
	for <lists+linux-renesas-soc@lfdr.de>; Wed,  8 May 2024 15:29:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4862D127E22;
	Wed,  8 May 2024 15:29:34 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-yb1-f178.google.com (mail-yb1-f178.google.com [209.85.219.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B243B54FA3;
	Wed,  8 May 2024 15:29:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715182174; cv=none; b=cCAGI4aZCg7DpnATexw6c5Us9mEcFjbbWnQnokLc4DyjvtB6PcBEzFoWaL//4USBNKP2tS1L7ETRUEg7rM5MNhgMtOfs/AimRhN8MO5xgZZmHPWk1ZxbF5O22K5WKPxkH4ua1Wp9dcKJEeXpbh+u/fD53B82RghSZ2rVULZ4GGY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715182174; c=relaxed/simple;
	bh=GBJkFeQe6vggMmh/wGQ/oQj7gSXlaIhZsvEKv7nxXKY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=PhkulVuxDKAmN2iNGKywn3zNaZFLQLvhUSLdtXrVWjSKGJIrRDztVMJrat30RdcvKX/s2YExOn3Tox+K/EtKB+EtzbpURPjAKlT6ZL3Y31YOMMfMmAbi+pqXi9aPBrqo0pMsts8Ec12FbqcX2a1ZGulfoYmGEVzBlJWOE7s4sQs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.219.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-yb1-f178.google.com with SMTP id 3f1490d57ef6-de45385a1b4so4327645276.3;
        Wed, 08 May 2024 08:29:31 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1715182170; x=1715786970;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=J4DUS+OhoDBKqPn5Tdi/9zNn8y5w+Vi2v3m0muQ6N9k=;
        b=RkvRbmYdIb2KO4XZzCecQk1tIV/NryuMqCZ06QBdKJIDon3YElreXo2aIYjJocDoz6
         Swze4xlCbEUFk4ozMj83ssAM1Z9IiMLqqqAHymekOtGC9EqrU+dLav3w49BXl6/gEwJf
         8h7KrWVJxbksdvKJyAsG3wpvsrpJYo33/31/aQtNFO7FdhOGd+x7ocrGHTa4mk8we/iy
         s9VeslxQu4AXR6vtKlSxKK51ikmWRZplD/QDnxP61rjKJit0lnLJxtCQdlS/D29SGfgy
         iSPqs6Kfj8CsW4BEQmNwgZ1C3ItllgeBJOijpoRRoIAAFahWdgSqdMLIzL0g+ogZ1PFO
         aubg==
X-Forwarded-Encrypted: i=1; AJvYcCUmrtfwn9o0iS+D9SiL0SCBG4LrviUKWr3EwOBhSllumro3MMpBI+hb74EmHi12fRIU3Da94MhGNY6Z1CPePdCjGFVfi6/9TpuRrCuiIlPcexnsG04dYWY8BMhfh/ksj8Ynvk3fTDdBsZc=
X-Gm-Message-State: AOJu0Yw3B6wL9GPYVgx691HoeEEaVARGQiQUD/KPQF0k87I9BUz6J/X4
	KYTYsMj+SGNp8lqVobJ4XcKQ0Zf7bmwZszlqHhy75Nu3Cf9MtHmaOgmoafYeqQU=
X-Google-Smtp-Source: AGHT+IHFtbQuNxDgOqc4nswz/SgSXX/Ou3LbR173cBSRznxp8MRUNFKDbv2Yt0vyAprm6IfMCnDMqA==
X-Received: by 2002:a25:a467:0:b0:de5:50a7:bc9a with SMTP id 3f1490d57ef6-debb9d701f7mr3408437276.5.1715182169996;
        Wed, 08 May 2024 08:29:29 -0700 (PDT)
Received: from mail-yb1-f180.google.com (mail-yb1-f180.google.com. [209.85.219.180])
        by smtp.gmail.com with ESMTPSA id w12-20020a25c70c000000b00de6163b9492sm3250171ybe.52.2024.05.08.08.29.28
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 08 May 2024 08:29:28 -0700 (PDT)
Received: by mail-yb1-f180.google.com with SMTP id 3f1490d57ef6-de5ea7edb90so4617750276.1;
        Wed, 08 May 2024 08:29:28 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCWgZJ7IirJ5izY2JNhVeVnLEiQLuWZBPRqjA/8ftTXLV3Xz21mdkbIe6LS4eNR7X73kNWicGuQ28cc5uFuZ1uVq2S3xa7D111P39Bn7LpipdlRimLuJ/GU+i2JdLL9BDl8LgrNFGCCmHEc=
X-Received: by 2002:a25:a467:0:b0:de5:50a7:bc9a with SMTP id
 3f1490d57ef6-debb9d701f7mr3408340276.5.1715182168457; Wed, 08 May 2024
 08:29:28 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240507201839.1763338-1-niklas.soderlund+renesas@ragnatech.se>
 <4970fd77-504c-4fb3-9c47-e4185d03e74a@lunn.ch> <20240508105831.GB1385281@ragnatech.se>
 <ba35173c-eaba-4f13-a2ed-011f6f7a48d1@lunn.ch> <20240508125557.GG1385281@ragnatech.se>
 <51b6a4f8-ef48-400f-acb6-fd20e661802d@lunn.ch> <20240508151043.GH1385281@ragnatech.se>
In-Reply-To: <20240508151043.GH1385281@ragnatech.se>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Wed, 8 May 2024 17:29:15 +0200
X-Gmail-Original-Message-ID: <CAMuHMdWQNQWtofKqAcdWurk5eV+gKaG3b-pWNd+Fjpg89BLkWA@mail.gmail.com>
Message-ID: <CAMuHMdWQNQWtofKqAcdWurk5eV+gKaG3b-pWNd+Fjpg89BLkWA@mail.gmail.com>
Subject: Re: [net-next,v2] net: ethernet: rtsn: Add support for Renesas Ethernet-TSN
To: =?UTF-8?Q?Niklas_S=C3=B6derlund?= <niklas.soderlund+renesas@ragnatech.se>
Cc: Andrew Lunn <andrew@lunn.ch>, Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>, 
	"David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, 
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, netdev@vger.kernel.org, 
	linux-renesas-soc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Niklas,

On Wed, May 8, 2024 at 5:11=E2=80=AFPM Niklas S=C3=B6derlund
<niklas.soderlund+renesas@ragnatech.se> wrote:
> On 2024-05-08 16:00:21 +0200, Andrew Lunn wrote:
> > > I agree it's odd and I will try to find out.
> > >
> > > If I remove all pm_ calls and the include of pm_runtime.h register re=
ads
> > > from the device do no longer works, so operating the device fails. Ev=
en
> > > if I dig out the root cause for this, is there any harm in keeping th=
e
> > > pm_ operations in the initial entablement?
> >
> > It suggests something is broken. Do we want to merge broken code?
>
> Of course I do not want broken code merged. I was curious if you knew of
> any harmful side effect of of using pm_ functions I was unaware of.
>
> > Once we understand the root cause maybe then we can decide it is O.K.
>
> The root cause is that the module clock is not enabled without some
> action. If I remove all pm_ calls as well as the inclusion of
> linux/pm_runtime.h. The tsn module clock is left disabled after probe
> completes.

> As the clock is disabled trying to operate the device is not possible.

Which is perfectly normal...

> The clock can either be enabled by the pm_ calls as show or be replaced
> by an explicit clk_enable(), like this (the other pm_ related
> calls/includes are of course also removed).
>
>     -       pm_runtime_enable(&pdev->dev);
>     -       pm_runtime_get_sync(&pdev->dev);
>     +       clk_enable(priv->clk);
>
> Either of the two methods leaves the module clock running and the driver
> can operate the device.

> I would prefer to keep the pm_ operations, but if you prefer I can
> switch to using clk_enable().

While explicit clock management works, please use pm_runtime_*()
instead, as the device is part of a Clock Domain.  Also, the TSN
block may be reused on a different SoC, where it is part of a real
power domain, and manual clock management won't be sufficient.

BTW, if you need to debug more fine-grained Runtime PM handling, you
can add a volatile variable that tracks the module clock state
(update it in cpg_mstp_clock_endisable()), and WARN() in rtsn_read()
and friends if the clock is disabled.

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

