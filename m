Return-Path: <linux-renesas-soc+bounces-23480-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [IPv6:2605:f480:58:1:0:1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id AEA60C004B4
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 23 Oct 2025 11:38:45 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 844CD4E512B
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 23 Oct 2025 09:38:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 39C9C309DC4;
	Thu, 23 Oct 2025 09:38:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="t77gdKo6"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-lf1-f52.google.com (mail-lf1-f52.google.com [209.85.167.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6E3B03093A6
	for <linux-renesas-soc@vger.kernel.org>; Thu, 23 Oct 2025 09:38:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761212296; cv=none; b=M6z19nFc4Q6LB3HkiMoG7YJumbu4QKjvl1+gYEQEftbLPpouK9AWSonAmakhNgpYEg29AoP934a5lUxiLE7r3o9HskCIJ754nCSqx9p2okc2YfMW/ES1T9dylkrDe3hK/19hHyiUBfhxa5mVIzTGDAFsv141p+tp8mIMtYmjgZc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761212296; c=relaxed/simple;
	bh=FVhPIuwvuLptQuHFQTFgTVKX2ix+VKy8esMcqqCSasw=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=TkoQv7QOWSu1Fnff/65OrKSp47p1IZYGv0HuZ2gtzvpkQjGSm4zErBZMLteegTCoFoosfgCftDr9jN762OLqOOVrBrHBRmBdmqt3LJlClQVPN0zQ9InmRNl+QoGyqPtgH/0qVxztsx2e0d9nP7pGLwx008KnuPOTSg/Q9UFSDi0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=t77gdKo6; arc=none smtp.client-ip=209.85.167.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-lf1-f52.google.com with SMTP id 2adb3069b0e04-58d29830058so300375e87.0
        for <linux-renesas-soc@vger.kernel.org>; Thu, 23 Oct 2025 02:38:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1761212291; x=1761817091; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=FVhPIuwvuLptQuHFQTFgTVKX2ix+VKy8esMcqqCSasw=;
        b=t77gdKo67//NOrQqDbGYp8NOnxu+I1AawdX2YqbKMd4yYAjUpLVqP8MCfHVx4T+Uv4
         KDSzsw6D2HU5ad/XJjxlDUhOKeg/0SKqCz9w8Fme5sZbMz1uTjb989Y8j00uueEpKQCE
         iGBW2VBw+KJROfjHLqLZmxdFvlVi7fd/Isi9dXmGNg8ADJEVPgebitEJtot/AirdlpHN
         hMyxTZHmwRTJ3YyiCaEpYG4AG62f8NdvCerN3cCnKqH5UOG0ZG+9+Md/mmU/PdaaTu7O
         Y98d6M1DHcLxAyO8PiS3xrgSqwQ8V1wSouyizQkn7Cm1yj8R3xDMnYyBVnR36wpHawtM
         QkOg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761212291; x=1761817091;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=FVhPIuwvuLptQuHFQTFgTVKX2ix+VKy8esMcqqCSasw=;
        b=UAsaJwNfcSatE+7Hr3DmfRi6N0ViSfZMo8ktoB+ElXYtQdBBeUCzGin0Od1GLn5jfr
         4eo+7xipR+tzPz/YOAQjaNoWBqzkREV23GTdsmkkWTkmqCpHWwE9LRhBbbFZmf4gy5rj
         UeCGrRsOe6iLahDusyD3YnkEpsT/daioPBevYXEtlN3eMtBxqIMSl3FggVZHFSy+fGVG
         Fc/SfETUiQQZZdxWZYGKgLRe4WaVF/cJAPPbOvKKF/GxHct8RiqWrFmMnU8rj0n+2j70
         2tMDw4fB6Z6eNvUw/OgBWnq0jJxq7p8/Z90/lSSSVUjG4WASjyIsDY2UnOLIy7tACFsH
         X7lw==
X-Forwarded-Encrypted: i=1; AJvYcCW/DF6K4BhEdK7TCsBc036/QhjMRY6OhY/j16pIXSABhRE/UOsf7qfk3VZ+pCGoPppDIOIE2vIPw5nt66NnR5TY/w==@vger.kernel.org
X-Gm-Message-State: AOJu0Ywl8NzTm3XAZMUohsdABxuFM2X/RVG70NWRis2XVPZv6+ahlYQt
	4FC5V5bQXasi+JpmQnVid2Vbh+lViLoX/s2gweM48onwM8KIsnOkiAJ3YkXrovWR71lMBmtjzvK
	fqywhFiFlWyJtvCrwprDg/QIRwuyxY8MuDzN3o1Rpkg51T3HHw5Z7Bvk=
X-Gm-Gg: ASbGncvP9vxh7f0PFsfDl9o3iJg7qV+aVttEG+FgoBb2C/xgP4o2VD6yFg0tvMUPoYV
	oMURYMycWzOigeW1z6L+JumkI+JAK1/hPU8Yn0GPpwstV4CUZ49jnE90Ss2bn9Ko6ZlmTLL8KTi
	uVLtQWqD+RxOJsLWqKIaT3UAS8/GSm2Tv/kHGbIit10skbbDHCjrIxOFvjoW9yTWXriI7nKsAcW
	XaOONhHZICyiqymakFmeif7RjiNzEjshOCEwHqh26EFWIkx2/VcLWQm+X/krMBzhHsenH8Zt+CX
	4cZViKdGZOsE+8A1KMxVbOem9w==
X-Google-Smtp-Source: AGHT+IHvued6APKHSuhZW+U5ogxN76QdmgJk0+xSehag34epjDmyx7iYvyVhmHhVufJMQ4zetnHzORBL85OdiThnUlk=
X-Received: by 2002:a05:6512:3085:b0:57b:5794:ccd9 with SMTP id
 2adb3069b0e04-591d84eb75amr7545365e87.9.1761212291492; Thu, 23 Oct 2025
 02:38:11 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20251015205919.12678-4-wsa+renesas@sang-engineering.com>
 <20251015205919.12678-6-wsa+renesas@sang-engineering.com> <CAMuHMdXqHncXxBZ00mxV=pzdgQEU4ju2F9XMejnibbu=QnLfDg@mail.gmail.com>
 <aPEAx8ZGHBcWZKJF@shikoro> <CAMRc=McsbAirEYjoo455mbKU495VEvPmMEqBmZCq2hw113YHOg@mail.gmail.com>
 <aPIfF-3SgzW5V_gs@shikoro> <CAMRc=MfVPO292xmnXBWJzWuhNADA_u1yvpJ4kkK8TgZyQgaP+A@mail.gmail.com>
 <aPInv9NELU7N9QDn@shikoro> <CAMRc=MdWS2OSeJAkTRnAFMtXcVukwQ=JAWwJ3OHxogmgZnan6g@mail.gmail.com>
 <5c9761d5a6a14d4c250df6cc4201bca72d963133.camel@pengutronix.de> <aPnz6U-fcodRoobU@shikoro>
In-Reply-To: <aPnz6U-fcodRoobU@shikoro>
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Thu, 23 Oct 2025 11:37:59 +0200
X-Gm-Features: AS18NWBd32y6WQwlZDUB-bYljhxAaJsH-bovfKz7DtPPPXHzv_tRrFcKoye_mtE
Message-ID: <CAMRc=MejA6DsnOW3hS+aFtecXn38UypJU2TUrAWPoo9Ly341uw@mail.gmail.com>
Subject: Re: [PATCH v2 2/2] reset: always include RESET_GPIO driver if possible
To: Wolfram Sang <wsa+renesas@sang-engineering.com>
Cc: Philipp Zabel <p.zabel@pengutronix.de>, Geert Uytterhoeven <geert@linux-m68k.org>, 
	linux-renesas-soc@vger.kernel.org, 
	Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>, 
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Oct 23, 2025 at 11:22=E2=80=AFAM Wolfram Sang
<wsa+renesas@sang-engineering.com> wrote:
>
> Hi Philipp,
>
> > > > I dunno for how many drivers this is really applicable, but I reall=
y
> > > > liked the cleanup of the pca954x driver.
> >
> > That cleanup might have been a little premature, given that the reset-
> > gpio driver currently only works on OF-based platforms, and even there
> > only with gpio controllers with #gpio-cells =3D <2>.
>
> I see. That kind of spoils my assumption that it is a fallback supported
> by the core. Darn, I would still like to have it, but it seems more
> complicated than I have time for it :(
>

As soon as my two other reset series land in next, I will finish my
work on converting the reset core to fwnode which should help.

Bart

