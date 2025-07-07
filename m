Return-Path: <linux-renesas-soc+bounces-19301-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 47FFAAFAEC2
	for <lists+linux-renesas-soc@lfdr.de>; Mon,  7 Jul 2025 10:41:13 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id D84B91AA09EE
	for <lists+linux-renesas-soc@lfdr.de>; Mon,  7 Jul 2025 08:41:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2C1C228A3F3;
	Mon,  7 Jul 2025 08:41:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="vFtvqEFJ"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-lf1-f46.google.com (mail-lf1-f46.google.com [209.85.167.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5C48F27702E
	for <linux-renesas-soc@vger.kernel.org>; Mon,  7 Jul 2025 08:41:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751877670; cv=none; b=jxEIM2rL67MIRzl7gHGMuEiodqXAp86mHYYiEbuIGixckjfGKNAqDu+DyzB7Dig7tnf2ySuCdNB3CpP8B2ey3qGHZOYp49qJMB8tL6k/ZsUIw7nDY4bGYPhJoOAybuMBjt+8WR3mNss03mFix/fmuMI8u6nr0TghbRQzn4MFn+0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751877670; c=relaxed/simple;
	bh=HKns79cZKbgw1Ijaw8npP7c4PLViVmBrtOVBmRo3pDk=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Hevf5YKchpEvmZYre/dnYSLyfr0Ysc6wRevqzfyJoV++tZZoVwpihwpOkRBA5l2H2zGiW8+6uf0MXwaWbUazvtXlBf8GuqGgX4SuqBRVpBHn44kcH/5jh1QYczltnTrH+i+qKJIPzmYG/FcbLWvr1heDyFWUG7wm2xSnkHtB5ms=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=vFtvqEFJ; arc=none smtp.client-ip=209.85.167.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-lf1-f46.google.com with SMTP id 2adb3069b0e04-553d52cb80dso2531763e87.1
        for <linux-renesas-soc@vger.kernel.org>; Mon, 07 Jul 2025 01:41:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1751877666; x=1752482466; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=M2ty42UaDUqlMkiP5xE2a1tdArjdzwbm7ssbtaWE4oU=;
        b=vFtvqEFJzcZEReFV3StKrJWMyFTySw8qEAF8K3rGcKFJ0iKpKv5weHgXfN4kdQGivc
         80h1pSpUGgWD5EWnQO/0jYACMi1I+XUIbaqzwKB72OitSicVwaPc4KfhUFj0Ocl4zvft
         0QhPGD3OyI9544xzLxIST1Lh/kDymloAH1zLMP89furWUlKaz4WmnkhD7VhDPMXNoqtV
         oCDadgIpSYCPNWASbDlK3ejR6VA/yu/hWOXAM3OdJ2YFvc7WRPoUoSRvWeZNtZrVslNH
         kv4wWgtXx/2ZumLswYPeWjvh/h+1+2d5J73zWufxi++0g6ud40Q9miAbzaBLaZ48S4hP
         LQjg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751877666; x=1752482466;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=M2ty42UaDUqlMkiP5xE2a1tdArjdzwbm7ssbtaWE4oU=;
        b=hT4XWRUZ0kum2RJsWgaK0/M/z8qA2/YQGcz/SHPZagRodJc81PS5z4Kow/R67f0c4e
         fnFwWKMmgFWcvmsIUnkmu6GiJWdesetBXwXwZNnmWJs0lbUDCexjxLmMW9qcyci7yQ/J
         B2ZU8FVSfAHseL7y6akxSENCqiYMEVw2dgigkRfzumOchcsUdKp0Fbiv8z2Db2VdoDls
         /vxJB6px0ALZtQLTaIXOf3tfjnDvefEMPkJBqGRsKw9eEPPj/d3ipWXTeR/Pe2ZFQrUV
         maDvHjRq6SOceCBtnD/hSj86tpj733hS2JndkjgXn/N3q8w7ePeCB2DacyxXBXMXiAh1
         19XA==
X-Forwarded-Encrypted: i=1; AJvYcCVQwbSxRHuY0xjSb+yBU5i5pd52KgTnj5Hfp4vDGVheVmzbK3MYSWWQCzrXmjayo04QEmdFDeZVuILHpL+RYVpf7A==@vger.kernel.org
X-Gm-Message-State: AOJu0Yws6VO+7l17pu1OYclimizN3o/C25y2/v/hmhyTAlqw7wpQa5bA
	RkyHUAmfK2RmkgIfTGqBjSUdjwXKxKhNtWLpNkZF4czMchYeYOsM54c5p0Rc/gxg1p6pdZlx/k8
	+d9yO5aB6pG0mxyeLsmlfBG9qK+tenc8bbCsozNKeCA==
X-Gm-Gg: ASbGncu/xOSxNMsw9zrtS8mBPekNw9NiRPLh7sFZ4FpFuA8wL8YexoZ8olGIACeCa1m
	Rm99RIdrWl2/F7chzGLxLxcUNJrFNOqRJjKE7VZYMNfjPW757KJy8275j6CFNaAXhfwZQwgO6ZC
	6IPYXy4UQNOQe8Kqf3PKycFo4sZ6mgvuSOj0jXe5ECXorI4mIOsvfGuWYGnrfWr9PT8dUU3VVtz
	pw=
X-Google-Smtp-Source: AGHT+IEBQJMgjjxGPUxNMZyf6ChFNk5EekGKfeAHU3z/3d2roa2tlgeHgq/aGpK6K+cYyFTqaK6iHRGTmDCxnni6ogY=
X-Received: by 2002:a05:6512:b24:b0:554:f82f:181a with SMTP id
 2adb3069b0e04-55658402866mr3009050e87.2.1751877666314; Mon, 07 Jul 2025
 01:41:06 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250610-gpiochip-set-rv-soc-v1-0-1a0c36c9deed@linaro.org>
 <CAMRc=McVV=VBw0DRiz-4tTjh7ZtRLWg=N_LQ2-7O1sKyW30rxw@mail.gmail.com>
 <c6eece57-8767-4435-beda-c9f399e3fa80@csgroup.eu> <CAMRc=MdYuk_O3P1QtepvF-6m01jn3xpDP4YxttQSp1-J-J2GvA@mail.gmail.com>
 <f527c6a8-faf2-45b8-81f5-03def802e485@csgroup.eu>
In-Reply-To: <f527c6a8-faf2-45b8-81f5-03def802e485@csgroup.eu>
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Mon, 7 Jul 2025 10:40:55 +0200
X-Gm-Features: Ac12FXzfvvERymQK11WeRhKmee48-1A3WRn820qRFk7sl4RxseqyIge4xppkQTw
Message-ID: <CAMRc=McCu=VdHAEaYwdD5OLTy9MrFO=Mqq-drU1Dnr=-KfJHJw@mail.gmail.com>
Subject: Re: [PATCH 0/2] soc: use new GPIO line value setter callbacks
To: Christophe Leroy <christophe.leroy@csgroup.eu>
Cc: Qiang Zhao <qiang.zhao@nxp.com>, Linus Walleij <linus.walleij@linaro.org>, 
	Geert Uytterhoeven <geert+renesas@glider.be>, Magnus Damm <magnus.damm@gmail.com>, 
	linuxppc-dev@lists.ozlabs.org, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org, 
	linux-renesas-soc@vger.kernel.org, 
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Jun 23, 2025 at 12:05=E2=80=AFPM Christophe Leroy
<christophe.leroy@csgroup.eu> wrote:
>
>
>
> Le 23/06/2025 =C3=A0 11:55, Bartosz Golaszewski a =C3=A9crit :
> > On Mon, Jun 23, 2025 at 11:54=E2=80=AFAM Christophe Leroy
> > <christophe.leroy@csgroup.eu> wrote:
> >>
> >> Hi,
> >>
> >>
> >> Le 23/06/2025 =C3=A0 09:33, Bartosz Golaszewski a =C3=A9crit :
> >>> On Tue, Jun 10, 2025 at 2:38=E2=80=AFPM Bartosz Golaszewski <brgl@bgd=
ev.pl> wrote:
> >>>>
> >>>> Commit 98ce1eb1fd87e ("gpiolib: introduce gpio_chip setters that ret=
urn
> >>>> values") added new line setter callbacks to struct gpio_chip. They a=
llow
> >>>> to indicate failures to callers. We're in the process of converting =
all
> >>>> GPIO controllers to using them before removing the old ones. This se=
ries
> >>>> converts all GPIO chips implemented under drivers/soc/.
> >>>>
> >>>> Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
> >>>> ---
> >>>> Bartosz Golaszewski (2):
> >>>>         soc: fsl: qe: use new GPIO line value setter callbacks
> >>>>         soc: renesas: pwc-rzv2m: use new GPIO line value setter call=
backs
> >>>>
> >>>>    drivers/soc/fsl/qe/gpio.c       | 6 ++++--
> >>>>    drivers/soc/renesas/pwc-rzv2m.c | 8 +++++---
> >>>>    2 files changed, 9 insertions(+), 5 deletions(-)
> >>>> ---
> >>>> base-commit: 19272b37aa4f83ca52bdf9c16d5d81bdd1354494
> >>>> change-id: 20250523-gpiochip-set-rv-soc-14e1d9414f70
> >>>>
> >>>> Best regards,
> >>>> --
> >>>> Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
> >>>>
> >>>
> >>> I see Geert queued patch 2/2, who would take patch 1/2?
> >>
> >>
> >> It is in my pipe for v6.17 but if someone else wants to take it I can
> >> Ack it instead.
> >>
> >> Christophe
> >
> > No, that's alright, I just didn't get any notification nor is it in
> > linux-next yet.
>
> Don't worry, it is not lost, see
> https://patchwork.ozlabs.org/project/linuxppc-dev/list/?series=3D&submitt=
er=3D&state=3D&q=3D&archive=3D&delegate=3D61610

Hi,

This is still not in linux-next and the status on patchwork didn't
change. This will be the last remaining patch not under drivers/gpio/
that's needed to complete this rework by the next cycle. Would you
mind just Acking it and I can take it through the GPIO tree?

Bart

