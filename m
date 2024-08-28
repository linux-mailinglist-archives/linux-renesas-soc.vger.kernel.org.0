Return-Path: <linux-renesas-soc+bounces-8454-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 0248A9628D9
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 28 Aug 2024 15:39:35 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id ADBC6282342
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 28 Aug 2024 13:39:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D35D5186E4B;
	Wed, 28 Aug 2024 13:39:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="cNP0VlAP"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-lj1-f172.google.com (mail-lj1-f172.google.com [209.85.208.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C2C82175D21;
	Wed, 28 Aug 2024 13:39:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724852369; cv=none; b=RU5TXMmBJWNGzGq8th1xD2EDmXhu6Mf+ctXqGdTlPHhkIiC/uDo7nvCiqk6e1IPzr/hDjccmjsE+6kyoIj8gzdBAePNfiNG97bMVxJfl+cp6Fs3G7j34B1RCO4bGkrrnTeiOy9WCzQRBP420BAEi/iU+GDMFwdZCCti6j2nWgT4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724852369; c=relaxed/simple;
	bh=/SjiK6kdS2WruYI9nPtpxdjpibw2Gl0lFiDJZ6Hz1cM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=RQWl3/cui2pbrpuZdLY6w9z7/xcipxQjL4kCxiQKOE1qI66O/owmcAEjSoCF2nnEFBOKtQ6fZpMm3ZZhBX0iDfz4EHdH+iK0UIR9n1XVdaYJGjcZh3vwD3YwkCMc5g2CiTJAI8k2crI0nGkmPQVo1smxrMySrjYzcRwwnmD0bho=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=cNP0VlAP; arc=none smtp.client-ip=209.85.208.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-lj1-f172.google.com with SMTP id 38308e7fff4ca-2f5064816edso44947511fa.3;
        Wed, 28 Aug 2024 06:39:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1724852366; x=1725457166; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=SejgfaziBvf3ywT/hXGpHO0SD6lU2CgDcFAnpPmIkyk=;
        b=cNP0VlAPnxD45hoM34NLE2WN2mH2mqmmcjPDPo/4I6a2x504VvIqxhdo2OqTCCyKvU
         CLdXa0xI19XpRADkjUtUolifxBzTPhC5Nqt0halTmixoZsfeRGLN72ZcIlQ/FesTwU9v
         ZOodgfiysm4ztfXGPvxA7qNpIHakUkUWF+ObDw2uX1sGz2sQ1yG1EWtfh5Fg2yb1k5EG
         WL+Gz+0/OZCONUINKc1++ujRB8FiZNUYbRwIiBylyh2V7tPvVTA489iTbLrFrD4SVNM3
         9fO8dlO5b5Do+Q7Yd3k+MiwH+OX/H5EHn7AE9aIR40JIgZM6JxYxFgeBduJr69ONMdcb
         jBXw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724852366; x=1725457166;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=SejgfaziBvf3ywT/hXGpHO0SD6lU2CgDcFAnpPmIkyk=;
        b=thrVd8X3+jaRZeHC3MqXNTqrFmBacwuBwPpcdE3mDFXZ67GSIIIrzI0mE3t+Hd59AL
         HHDqZMH41WHEhmVHHVhNm4KpzB92hXXxFq58CFa3hgsHSQ9StUdhOD4HvLXXMq9SpOAh
         BLq/TX+pfJNbenfO0EtQnFHpo3iXojcYX+A5y6ab0sAt9q5RYSDZzWKJ7bFtQ3Yrj5Ak
         i7nYZFKdAy/3Q+/y3tE1+NFLfBtFA6vnPCLxu0etG2qx6HfySzVxeWFh00rAkC9UyI9M
         gmLgBvJscr8hnhLInTIsyBSalXmCsiqh7nuXEXiOTx7hSlOMm7C3/O9TGx7BdPV7PFFC
         gUcA==
X-Forwarded-Encrypted: i=1; AJvYcCUKqRvoqdutQSXDTRPArBbA5T0etwPBbKLwy0LKVKfYXwFCBSJ2HMV8WN1/dxLa8E9aLne1gzkcl8ZNYZA=@vger.kernel.org, AJvYcCXAoq7gnrlhdwqgCgKQGh1hVgzg0w6MOhZHoBjbklH5Vt+dkWHZ55thHzbk079I7upiYv1lyic1@vger.kernel.org, AJvYcCXnjwRluxBW8deUYrefgjwO4b4moEtU9V9z2aDXf8Gn2+mle6KdzqESUAn8Rjm6uvXshGRvsAbC3dcS/Duixk947Ew=@vger.kernel.org
X-Gm-Message-State: AOJu0YwKcH2cxl98OggVwLGI3tYMdfxZSO7vZeroYze3qL8YMBsk9Uuw
	/VsM0myiK/iMk43kz8U4+Tffc03pe3120LbJaPMGat6elZVk5mikF71lrBX4h3aT8RmbT9yP3XZ
	SRzrvCQ+k+ScrQXRTLacAp1lw7uRixEEo
X-Google-Smtp-Source: AGHT+IF1j0/XuSeyS+V+F50Lkv+7c66HDqI+QdyGb4khqrR99cm5DXDpfLXKjxX83aGJMgsh01nC63Kz0qOxDSlRja8=
X-Received: by 2002:a2e:be8b:0:b0:2ef:296d:1dd5 with SMTP id
 38308e7fff4ca-2f549f6759emr16112381fa.0.1724852365280; Wed, 28 Aug 2024
 06:39:25 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240827095712.2672820-1-frank.li@vivo.com> <20240827095712.2672820-9-frank.li@vivo.com>
 <20240827120953.00005450@Huawei.com> <CAHzn2R0r9Jziex+7fyhPGaPf12ckwqZwO40bshDBGdq_Tyenqg@mail.gmail.com>
 <CAMuHMdVSz32c6qXYSX4YSfO5mo-30Jku3kgPyR3-PXBoQqex3g@mail.gmail.com>
In-Reply-To: <CAMuHMdVSz32c6qXYSX4YSfO5mo-30Jku3kgPyR3-PXBoQqex3g@mail.gmail.com>
From: Marcin Wojtas <marcin.s.wojtas@gmail.com>
Date: Wed, 28 Aug 2024 15:39:13 +0200
Message-ID: <CAHzn2R2kCdetAu248LeDdWtOnsRVUL05kNwWbbshp8U=QPumaA@mail.gmail.com>
Subject: Re: [net-next v3 8/9] net: mvpp2: Convert to devm_clk_get_enabled()
 and devm_clk_get_optional_enabled()
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: Jonathan Cameron <Jonathan.Cameron@huawei.com>, Yangtao Li <frank.li@vivo.com>, 
	clement.leger@bootlin.com, andrew@lunn.ch, f.fainelli@gmail.com, 
	olteanv@gmail.com, davem@davemloft.net, edumazet@google.com, kuba@kernel.org, 
	pabeni@redhat.com, ulli.kroll@googlemail.com, linus.walleij@linaro.org, 
	linux@armlinux.org.uk, alexandre.torgue@foss.st.com, joabreu@synopsys.com, 
	mcoquelin.stm32@gmail.com, hkallweit1@gmail.com, 
	u.kleine-koenig@pengutronix.de, jacob.e.keller@intel.com, 
	justinstitt@google.com, sd@queasysnail.net, horms@kernel.org, 
	linux-renesas-soc@vger.kernel.org, netdev@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-stm32@st-md-mailman.stormreply.com, 
	Maxime Chevallier <maxime.chevallier@bootlin.com>, 
	Christophe JAILLET <christophe.jaillet@wanadoo.fr>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

=C5=9Br., 28 sie 2024 o 09:13 Geert Uytterhoeven <geert@linux-m68k.org> nap=
isa=C5=82(a):
>
> Hi Marcin,
>
> On Wed, Aug 28, 2024 at 8:26=E2=80=AFAM Marcin Wojtas <marcin.s.wojtas@gm=
ail.com> wrote:
> > wt., 27 sie 2024 o 13:09 Jonathan Cameron
> > <Jonathan.Cameron@huawei.com> napisa=C5=82(a):
> > > On Tue, 27 Aug 2024 03:57:11 -0600
> > > Yangtao Li <frank.li@vivo.com> wrote:
> > > > Use devm_clk_get_enabled() and devm_clk_get_optional_enabled()
> > > > to simplify code.
> > > >
> > > > Signed-off-by: Yangtao Li <frank.li@vivo.com>
> > > > Reviewed-by: Maxime Chevallier <maxime.chevallier@bootlin.com>
> > > > Tested-by: Maxime Chevallier <maxime.chevallier@bootlin.com>
> > > > Suggested-by: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
> > > > Reviewed-by: Marcin Wojtas <marcin.s.wojtas@gmail.com>
> > >
> > > >
> > > > @@ -7745,12 +7710,6 @@ static void mvpp2_remove(struct platform_dev=
ice *pdev)
> > > >
> > > >       if (!dev_of_node(&pdev->dev))
> > > >               return;
> > >
> > > Given this makes no difference any more, drop the above dev_of_node()=
 check.
> >
> > This check is to not execute the clk-related code when booting with
> > ACPI. It should remain as-is, unless the new devm_clk_get* api is
> > capable of not exploding in non-DT case. Can you confirm?
>
> As per the removals below, there is no code left in this function after
> the check (i.e. the "else" part became empty).
>
> > > > -
> > > > -     clk_disable_unprepare(priv->axi_clk);
> > > > -     clk_disable_unprepare(priv->mg_core_clk);
> > > > -     clk_disable_unprepare(priv->mg_clk);
> > > > -     clk_disable_unprepare(priv->pp_clk);
> > > > -     clk_disable_unprepare(priv->gop_clk);
> > > >  }
>
> Gr{oetje,eeting}s,
>
>                         Geert
>

You are right, I misread that it was mvpp2_probe :) I confirm, we can
remove in mvpp2_remove.

Best regards,
Marcin

