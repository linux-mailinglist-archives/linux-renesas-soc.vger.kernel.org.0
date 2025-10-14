Return-Path: <linux-renesas-soc+bounces-23014-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 9B746BDA474
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 14 Oct 2025 17:16:23 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id BFD05583ECC
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 14 Oct 2025 15:08:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 18AA12ED14E;
	Tue, 14 Oct 2025 15:05:38 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-oi1-f174.google.com (mail-oi1-f174.google.com [209.85.167.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9A82C304975
	for <linux-renesas-soc@vger.kernel.org>; Tue, 14 Oct 2025 15:05:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760454338; cv=none; b=Mq2B5hATMtVzfLefbu+s0bZzivx/wttf+NxhNbulQ3vlux0SZBYSPo9xBHMZM9fEDs97H5uB3PRZ3WLecXiC5O69IfIrY8qmZ+lb+l7fIQJaQLPjO1zZdREBWHj6bx6pKepLH4VpHPPbkcTXl15EFdc7O7NAasuv99H+IjCwIcg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760454338; c=relaxed/simple;
	bh=8cdcfvLKZRVy5zVyqP8q5Amc6eLxZmc3401QZxpkFVM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=YTkirbLbABm3mYxpkf/sZqT37A2WN3R5j0jJxH7g5kpRIU12uOQdBfM7NYm4KvQMPQqA3xISbDt8mZ83bm3LWLL25thsy1I6BZ2AaqoooUD7pdtk6d4abJlPWBtrFoocBkJCrwlx24NHq5YNHQcPluHiwvuqU+66SwZHokxIobA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.167.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-oi1-f174.google.com with SMTP id 5614622812f47-43f7e0494ecso3105259b6e.3
        for <linux-renesas-soc@vger.kernel.org>; Tue, 14 Oct 2025 08:05:36 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760454335; x=1761059135;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=bFM6fq+qPomTw5SLmg+mdn/T0EKmVQHgVT/LIsQW4L4=;
        b=X4Mw9341oSVpcCN9Vfm38U4fh4bB/oAEKHleyhgBDnlZu83ps7ie4SZ9CW88zbFWd1
         jIku7FBCQqxuoRLEONFnuc3vCWnYTrEQBOGjdMCrfe+o9664P7biygXSli+zt4gKAgwq
         e+vux3NTTQM9XrUWhOk6GD1se7w3khvdiJFDIUDMHHrUyAZFsisK0f2wGuElMtIaV+zp
         Qn9wFk3lFxcjdmep8TM3yhpA+I+PWfdJTNx/qpp6vJGh94aLMrKH4lqHjdvYO7Y1HSCr
         XARbEN/Ja253KXf3c01+xJK/jbuwp1C4BL8hqeCDs45/rb9uq5f91f/6KUc19R2emv7L
         s14Q==
X-Forwarded-Encrypted: i=1; AJvYcCWOV9sqnOcLwFixD4J1wpfDllD3XicrTs7VuNUIZwp56w24cyl7kTDbjFRbDDINWRsSCuLZBbBnefRUsJdf4Vhdyw==@vger.kernel.org
X-Gm-Message-State: AOJu0YyahVJaJRsvQdE9Wl6nA3ATOlQZxEUUnR+hlcF8EsyZaUiQr1Gl
	K/+0l28NufQ+TCB4Vhng4iAU0RlttsgV7TNN0/RlHtcf64F7yZaGY7Nh1VRG4TMv
X-Gm-Gg: ASbGncsUb8ZA7dlHbL9EXaXzq5w6ohEl19VHG7Hup+E7bqqCp7ArIH6UbougZpY17x9
	sLeKVENZkgCp9HD2xlnD6J1dNL33xY7BcnSyrbDvqquK7H20bXcOMzWedPeiZJzthimCabessmt
	qVZa2qAKqhaeXfuysiZK8cqGju3LqpjlR+I8YIHvuXpVefyLpVmtvHyIYcBbiBZV1nF6yspMJ8L
	xgxgM035ZwVV/gYoGsk+46Mpw6gggRyd8Y9+ulKtA44MpoGRsvm/TfyfvyR0+TqGjV6aT2EgEMT
	cz7b7izFvOFCczkuo1JMo0co9Y4VxlG1uOONnsGwRitXJct+js/7PvIiSTiiYjrTvNXvjiSG4Xy
	BAUfuDk75Hu00iioIr/QOeZlf/bqPCQH5nHFYm1WaUpgb7GvBiM/6pwsm5IeqeB6POrmZ2DWYGD
	GAfkljsp9qONnfhw/SBA==
X-Google-Smtp-Source: AGHT+IF/ViUDrX7XsGm8mEijIUHWtj1ICuW3+gFGmj8T/fnx/jzV/cPf/IkuGJM1f1mzOlZ2fyGJBw==
X-Received: by 2002:a05:6808:350b:b0:441:8f74:f29 with SMTP id 5614622812f47-4418f741f53mr9403141b6e.67.1760454333845;
        Tue, 14 Oct 2025 08:05:33 -0700 (PDT)
Received: from mail-oo1-f49.google.com (mail-oo1-f49.google.com. [209.85.161.49])
        by smtp.gmail.com with ESMTPSA id 5614622812f47-441cc9a25cesm2087168b6e.26.2025.10.14.08.05.33
        for <linux-renesas-soc@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 14 Oct 2025 08:05:33 -0700 (PDT)
Received: by mail-oo1-f49.google.com with SMTP id 006d021491bc7-64e84414cfbso2830772eaf.1
        for <linux-renesas-soc@vger.kernel.org>; Tue, 14 Oct 2025 08:05:33 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCXeQo0AKj4KnBzcTCZv05Cf767co8CbdvvQhp4WimX0zh90OlNLtJM1Me53bz9fovGkN2BYwi3R8cyF2s872PnV0Q==@vger.kernel.org
X-Received: by 2002:a05:6102:b0f:b0:520:a44f:3ddf with SMTP id
 ada2fe7eead31-5d5e224f3f9mr7315982137.10.1760453949213; Tue, 14 Oct 2025
 07:59:09 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250918104009.94754-1-herve.codina@bootlin.com>
 <20250918104009.94754-8-herve.codina@bootlin.com> <CAMuHMdWNErzjfqXXgJZOn2viPYmGeuJekY_WLDeK6vzYZzdJmA@mail.gmail.com>
 <aO5aIoCEL-XbpBTp@shikoro>
In-Reply-To: <aO5aIoCEL-XbpBTp@shikoro>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Tue, 14 Oct 2025 16:58:58 +0200
X-Gmail-Original-Message-ID: <CAMuHMdUkx+qQRDertFmW9nLzGJA+VETWLvaA_VoS17-WhJJvXQ@mail.gmail.com>
X-Gm-Features: AS18NWDaYL53l1nt58YG7qpvuDTebR9eFnGE4nr9xDBH40Jra_ZU6YkKi5yFUO8
Message-ID: <CAMuHMdUkx+qQRDertFmW9nLzGJA+VETWLvaA_VoS17-WhJJvXQ@mail.gmail.com>
Subject: Re: [PATCH v3 7/8] soc: renesas: Add support for Renesas RZ/N1 GPIO
 Interrupt Multiplexer
To: Wolfram Sang <wsa+renesas@sang-engineering.com>
Cc: "Herve Codina (Schneider Electric)" <herve.codina@bootlin.com>, Thomas Gleixner <tglx@linutronix.de>, 
	Hoan Tran <hoan@os.amperecomputing.com>, Linus Walleij <linus.walleij@linaro.org>, 
	Bartosz Golaszewski <brgl@bgdev.pl>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Geert Uytterhoeven <geert+renesas@glider.be>, Magnus Damm <magnus.damm@gmail.com>, 
	Saravana Kannan <saravanak@google.com>, Serge Semin <fancer.lancer@gmail.com>, 
	Phil Edworthy <phil.edworthy@renesas.com>, linux-gpio@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-renesas-soc@vger.kernel.org, Pascal Eberhard <pascal.eberhard@se.com>, 
	Miquel Raynal <miquel.raynal@bootlin.com>, Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: text/plain; charset="UTF-8"

Hi Wolfram,

On Tue, 14 Oct 2025 at 16:11, Wolfram Sang
<wsa+renesas@sang-engineering.com> wrote:
> > > +static const struct of_device_id irqmux_of_match[] = {
> > > +       { .compatible = "renesas,rzn1-gpioirqmux", },
> > > +       { /* sentinel */ }
> > > +};
> > > +MODULE_DEVICE_TABLE(of, irq_mux_of_match);
> >                            ^^^^^^^^^^^^^^^^
> >                            irqmux_of_match
> >
> > Interestingly, this built fine for me before, presumably until commit
> > 5ab23c7923a1d2ae ("modpost: Create modalias for builtin modules")
> > in v6.18-rc1.
>
> This should be fixed in v4 already as a side effect of my request for a
> better namespace prefix.

Thanks! Sorry, I really thought I had the latest version in my tree...

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

