Return-Path: <linux-renesas-soc+bounces-19774-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 24A85B160C1
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 30 Jul 2025 14:54:10 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 2341F16E1A8
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 30 Jul 2025 12:54:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6112B298991;
	Wed, 30 Jul 2025 12:53:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="N/kuqWZ+"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-lf1-f52.google.com (mail-lf1-f52.google.com [209.85.167.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0E86D29614F
	for <linux-renesas-soc@vger.kernel.org>; Wed, 30 Jul 2025 12:53:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753880033; cv=none; b=VI116k4BSx4OtZaFL3LqlRSdkCzQqFtYklSGCvDIMy3E5JWp/9qqZc91Gvb3D9xS33YoOdn1Ax0slZ3j+frhY40LvgsDXpp2z5S5UpFHHJ0a7hrlFHhUSgH5N0qKVsAUamcKGrY5ptWpfIUBO1ML/okbOPhodRL0aoTfzD2Ec6w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753880033; c=relaxed/simple;
	bh=RNeM7UB4fAERU2LPOJtuWeYJSG/9TTk9Yot9abhDF6k=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=QeWWh7lYNl/0gUctfN5l4O+yQW7pHWrw6NDi45ovfAHb3hg4goN0xtZ2l5zfUTPt9zBaPfa/qJHEfVNTdGLbV8bLCHLxP/leJAcFCVWenkL6gudcGgXNhsdoVCX6QIdQIK2icXRcOh85qfiDg6ULgRYCXjOqDDpkG4Ty6KWm2sk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=N/kuqWZ+; arc=none smtp.client-ip=209.85.167.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-lf1-f52.google.com with SMTP id 2adb3069b0e04-55b847a061dso113901e87.1
        for <linux-renesas-soc@vger.kernel.org>; Wed, 30 Jul 2025 05:53:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1753880029; x=1754484829; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=qUTEvgPr5pDo52lKZf6mOXPWs0RWvEkRiwEoyLLTu3o=;
        b=N/kuqWZ+n2E10szoUZ24/6F4JuCqCRJgIiSJ+13vx4RL08ntqRjKnWOUv3CReInxOU
         RHq+XhAf2t/ltRbFuhsbgN6TO4nPzRBRVuYk9xYDQMSzjwBn4vRQklSpSF0n4x13/Akp
         HltCRODxOSbnP3MX3m0jV2K0dfXv6tdEODM+V8GbBhMQAjLnJ4mC448itgqV7a32K2zG
         6huj2nFU0UyK5TCqYfapyzNciidjWGBZEhjUPUxsGrUibrXSt1YcgTE/WVtg8c93RDxU
         cNIJuMLyavB5KXHA8bfnDrlGWvHGd/mWQHprk+vfnlwGskSesPW+AbY6GuMT3nAC2BlH
         1dyA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753880029; x=1754484829;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=qUTEvgPr5pDo52lKZf6mOXPWs0RWvEkRiwEoyLLTu3o=;
        b=ZlIegXnBTd9SfZUONwdp/obf3RwaEYoz6+01r3+IrdXLRQWElTDsP64zFYAP7EMmzf
         wLFy9XYTV8bIexSLOGhkfrzf/U2iNjUp4OiWfhStd3C0eLzCnIo9fNo/rPIaFARs8LYR
         Jgco27TEZJUTnh8dyFW8AEBugNEh8KteMizSBA86QslqgQbHJMFoqGmeXIdBma67/N3L
         U7tsVVkpRx2LnuzrTPx76Npl0fpwOzTUu/KzJuvOu0vpyV/oVflFOeZ4PrO/hXN9iT4p
         JPZCJ19wKzA85pwwUdTPztsqotfODH8sizjWknQirfC55uC7PBu4w/vjW1Cvko/hJxwK
         LxkA==
X-Forwarded-Encrypted: i=1; AJvYcCWXR6ZN1j8Oo+fPmwYz/VpMhafHqcCuHNXVC6aLdlk0GC+7CnL6r2dNvUNeyS8lXaqUZVkfSuHyArLyQtedz6ca0Q==@vger.kernel.org
X-Gm-Message-State: AOJu0YwfNBDLGeOEkGKHAWbF8r6dojFqw8kALgGcBye9BWxZbmJ/ESYr
	RJir+/FdVqnd3TY/hhaCw9R25lG2xhW1w6ppoFnnJKPrbVgfU3uXgLx7/R3HCTa9pG30QWsxDPo
	6/jW4QNZKnIMcp5Qft4MSoo87a+0AGYwHdf6DZ401IA==
X-Gm-Gg: ASbGncsk3MIMwRt7z0txHbU/q/FrxCASco/idkEK4+Pp8LjU/RtrqAoQ6EP8TBy2UwU
	LbGUzMciLM1GlIzxqmNZLQa5kNRwgWywFHXgZUhtbUW/Cii+Mi6OXDnw5JwP2Ki1kOffXD1T1Ej
	wIiX2gwJsbKKsrCzbE+c0rSrQs4teLFSiOOEdjiZSwwJAxRbcGYJn5Q/HLnb6d59Qh+pFRBtPuR
	YfR/ZXGdwXG+lB/6Kfcvl57jbrK4mTPqwSk6JA=
X-Google-Smtp-Source: AGHT+IGSuyPnAInz8gQT37fKK4pgrT4+RIAYI9IrKjK2MWPd45oP6K0zUhD/GSonCiRI3dzBbJ8n7cWJZ+qNt54xgoU=
X-Received: by 2002:a05:6512:ba1:b0:55b:83cf:b260 with SMTP id
 2adb3069b0e04-55b83cfb693mr305928e87.11.1753880028944; Wed, 30 Jul 2025
 05:53:48 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250724-pinctrl-gpio-pinfuncs-v3-0-af4db9302de4@linaro.org>
 <20250724-pinctrl-gpio-pinfuncs-v3-12-af4db9302de4@linaro.org>
 <CAHp75Vc4vsJh_-GbP+YO50veoGoGtfAPL4tjcF+73uophfmnGw@mail.gmail.com>
 <CAMRc=Mc1ophkofB6MmtD4adBAi69C3JyovM-S9YD_y7UA3V1qA@mail.gmail.com> <CAHp75VcV=K-DfOGs0z64==nO+wQNoEB2Ngd2vc+dLYr3WLChjg@mail.gmail.com>
In-Reply-To: <CAHp75VcV=K-DfOGs0z64==nO+wQNoEB2Ngd2vc+dLYr3WLChjg@mail.gmail.com>
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Wed, 30 Jul 2025 14:53:37 +0200
X-Gm-Features: Ac12FXya2mYA_HSI46S7KktzTvTwdWuT-o4vBrrr3z0vtr46fp0gRnU_ZqynDBk
Message-ID: <CAMRc=MeVOEFkdqf+SwQ-a=7ZPvpoerb4G_kn-aZgNLR3aTTUog@mail.gmail.com>
Subject: Re: [PATCH v3 12/15] pinctrl: allow to mark pin functions as
 requestable GPIOs
To: Andy Shevchenko <andy.shevchenko@gmail.com>
Cc: Linus Walleij <linus.walleij@linaro.org>, Bjorn Andersson <andersson@kernel.org>, 
	Konrad Dybcio <konradybcio@kernel.org>, Alexey Klimov <alexey.klimov@linaro.org>, 
	Lorenzo Bianconi <lorenzo@kernel.org>, Sean Wang <sean.wang@kernel.org>, 
	Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
	Paul Cercueil <paul@crapouillou.net>, Kees Cook <kees@kernel.org>, 
	Andy Shevchenko <andy@kernel.org>, Andrew Morton <akpm@linux-foundation.org>, 
	David Hildenbrand <david@redhat.com>, Lorenzo Stoakes <lorenzo.stoakes@oracle.com>, 
	"Liam R. Howlett" <Liam.Howlett@oracle.com>, Vlastimil Babka <vbabka@suse.cz>, 
	Mike Rapoport <rppt@kernel.org>, Suren Baghdasaryan <surenb@google.com>, Michal Hocko <mhocko@suse.com>, 
	Dong Aisheng <aisheng.dong@nxp.com>, Fabio Estevam <festevam@gmail.com>, 
	Shawn Guo <shawnguo@kernel.org>, Jacky Bai <ping.bai@nxp.com>, 
	Pengutronix Kernel Team <kernel@pengutronix.de>, NXP S32 Linux Team <s32@nxp.com>, 
	Sascha Hauer <s.hauer@pengutronix.de>, Tony Lindgren <tony@atomide.com>, 
	Haojian Zhuang <haojian.zhuang@linaro.org>, Geert Uytterhoeven <geert+renesas@glider.be>, 
	linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-arm-msm@vger.kernel.org, linux-mediatek@lists.infradead.org, 
	linux-arm-kernel@lists.infradead.org, linux-mips@vger.kernel.org, 
	linux-hardening@vger.kernel.org, linux-mm@kvack.org, imx@lists.linux.dev, 
	linux-omap@vger.kernel.org, linux-renesas-soc@vger.kernel.org, 
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Jul 30, 2025 at 2:50=E2=80=AFPM Andy Shevchenko
<andy.shevchenko@gmail.com> wrote:
>
> On Wed, Jul 30, 2025 at 11:54=E2=80=AFAM Bartosz Golaszewski <brgl@bgdev.=
pl> wrote:
> >
> > On Thu, Jul 24, 2025 at 2:22=E2=80=AFPM Andy Shevchenko
> > <andy.shevchenko@gmail.com> wrote:
> > >
> > > >  struct pinfunction {
> > > >         const char *name;
> > > >         const char * const *groups;
> > > >         size_t ngroups;
> > > > +       unsigned long flags;
> > >
> > > Not sure we need this. If the function is GPIO, pin control already
> > > knows about this. The pin muxing has gpio request / release callbacks
> > > that change the state. Why do we need an additional flag(s)?
> > >
> >
> > I'm not following, how does the pin controller know that the function
> > is GPIO exactly, other than by the bit set in this field?
>
> AFAICS the gpio_owner !=3D NULL means that. No need to have a duplicate
> of this information.
>

No, that's not at all what this series does... gpio_owner is the
consumer label of a pin used by the GPIOLIB framework. The flag I'm
introducing it telling the pinctrl core - before GPIOLIB is ever
involved - that *this pin can be requested as a GPIO by GPIOLIB*. It's
the other way around - without knowing this, for strict pinmuxers,
GPIOLIB would never be able to request this pin if it was muxed to a
function (even if the function is called "GPIO").

Bart

