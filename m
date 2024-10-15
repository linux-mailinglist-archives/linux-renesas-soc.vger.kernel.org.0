Return-Path: <linux-renesas-soc+bounces-9786-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 41CBF99FA7B
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 15 Oct 2024 23:48:32 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id E1F4D1F21E75
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 15 Oct 2024 21:48:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 228151B0F14;
	Tue, 15 Oct 2024 21:43:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="Ot/bE0Go"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-lj1-f170.google.com (mail-lj1-f170.google.com [209.85.208.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 23EBD1B0F0A
	for <linux-renesas-soc@vger.kernel.org>; Tue, 15 Oct 2024 21:43:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729028610; cv=none; b=t5+6g3N5E2TZn2yinBbCe+O6O0ykLrjyqsg6ynaPqd1I9KqwhyArcNVf81Mrt0gPQ784L/bVNK0LR5QVANZ4nNyQjZK0z9BNum6hIZDlTMrrcamBp8LptOvyv7stAdnEEJ39OgUjq7tXIyccIP7F1YPGCRQ0vLkcVaUAFMK3pUQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729028610; c=relaxed/simple;
	bh=UAocfkXQ1RPqdmiQZbBlkDnEJNGgmKJGrcniPmvnozU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=VRgi0F+er7NCul6/UWIgocqNV/+thRv2FMNlOUJiZ8ya2gagvDoibGnZ8SxVt7T0s+2S9sCGcfaf4/h39B9zUNQx0vg2MSkncsilnNXKSVGVzme/UQiZPKCkKTK3dd4hTvw0F1nsXGL9m3iSYOaLIda0jezR5HY/c4yFYUXm0i4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=Ot/bE0Go; arc=none smtp.client-ip=209.85.208.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lj1-f170.google.com with SMTP id 38308e7fff4ca-2fb501492ccso23620571fa.2
        for <linux-renesas-soc@vger.kernel.org>; Tue, 15 Oct 2024 14:43:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1729028605; x=1729633405; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=UAocfkXQ1RPqdmiQZbBlkDnEJNGgmKJGrcniPmvnozU=;
        b=Ot/bE0Go5eP5XQv3yg5dMccCo4KdHIwNNjOt+uGel3jve6jwnDknml+NR1v9RtQhxr
         7A1c43Z6XKjDsUx8fniAAo64dtcGrBHBAz7wtvA8JSBDnErTYUpQFvD/USolHSqxII3r
         wnbHb4TITh9Wru+WRSJ/1IC51LwKTxqQgAdzgQxKZfj4IUrL7L1tc+rLgsG7/r73UBBB
         CJUJUFfsXNAlzp/u5ySMjZXPQrGLX5JeSB45+KUaPp4O1gyyB/pkybYdRB2aEfBM4TGr
         t0S6QMWNKb17KfoRyA/77Wok6NkmB26eXrt34///DQdz/bMt2w3B/piaFYrWmE5/L/mb
         P/5g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729028605; x=1729633405;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=UAocfkXQ1RPqdmiQZbBlkDnEJNGgmKJGrcniPmvnozU=;
        b=VuK4HudL6gNiJu4FG54RKQzLro/8zdagwSdUat8oi4Z5ADs9SfMhJqgVSJCqWPNuW7
         8HkVSVUH1ObP/2SJtZug5ONjlqUpLEHycYv6ERPEqTZPYQ/PpEaI5Dgvi02JDwrttctj
         2379q+BqfC2E2PvHIocViFpgbL149fwhZNi0hCtQmfk9bljAEUsOzyAGhHEnTHzWAaNt
         vM1BJoego7gnyOvmXYG+2T6nIesSJbBNr6tElJjWDqISy5EleK3jem8SpVyZfbOSwkGF
         lH+Fp9cpGD6oFOGaUGH0tDdkigoddEHwjzct7vdjS0F825kUbUpdjVVSBWHtHDMgYGSl
         DGPQ==
X-Forwarded-Encrypted: i=1; AJvYcCW+xTBXXPivjtVj4iqD0uHN0c+df69hJAPYIIHCZtvPGSDZPc4RmJ/TpTRg/MGB7JLPLo5CavlVza2cm2vorI6YvQ==@vger.kernel.org
X-Gm-Message-State: AOJu0Yy3MEbdyCxbtw7pHgDndjI91ATmdDnqkV3b79IM63Er21sDEs+f
	KOHE1RtAUnutxHTetZguW/dxhqOAJkaTEJvfnPTMiTUgd0AZtliC5YgbuYRnar6UuH+cuLuT8UG
	nsmzd6JEcYljz+NGCTcCaGLRNyogdxLtzRKYsQA==
X-Google-Smtp-Source: AGHT+IHcFZjjWlAFiGgDJy1iCFs9nmgUCYhCnPRRLVYBx8tgkTIO5wjNRXsFMThYHYMpQBvlpgTUbBolK0yS7+ZfOGE=
X-Received: by 2002:a2e:b892:0:b0:2fa:d354:1435 with SMTP id
 38308e7fff4ca-2fb325d4154mr75684441fa.0.1729028605199; Tue, 15 Oct 2024
 14:43:25 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20241015162043.254517-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
In-Reply-To: <20241015162043.254517-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Tue, 15 Oct 2024 23:43:14 +0200
Message-ID: <CACRpkdbYF5WCy7yc3t6VSU8CK-MKpxQnVWmRE-YCSKJ1hJDkug@mail.gmail.com>
Subject: Re: [RFC PATCH] pinctrl: pinmux: Introduce API to check if a pin is requested
To: Prabhakar <prabhakar.csengg@gmail.com>
Cc: Bartosz Golaszewski <brgl@bgdev.pl>, Geert Uytterhoeven <geert+renesas@glider.be>, linux-kernel@vger.kernel.org, 
	linux-gpio@vger.kernel.org, linux-renesas-soc@vger.kernel.org, 
	Biju Das <biju.das.jz@bp.renesas.com>, 
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>, 
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Prabhakar,

thanks for your patch!

On Tue, Oct 15, 2024 at 6:21=E2=80=AFPM Prabhakar <prabhakar.csengg@gmail.c=
om> wrote:


> From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
>
> Introduce `pin_requestesd` API to check if a pin is currently requested.

What kind of function name is this?

Do you mean

pin_requested()?

> This API allows pinctrl drivers to verify whether a pin is requested or
> not by checking if the pin is owned by either `gpio_owner` or `mux_owner`=
.

There is nothing wrong with the patch as such, but it needs to be
illustrated by submitting it together with the first intended user
and show how it is used, we don't add upfront APIs.

Yours,
Linus Walleij

