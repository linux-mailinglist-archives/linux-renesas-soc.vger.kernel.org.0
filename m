Return-Path: <linux-renesas-soc+bounces-6567-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 090DC910A96
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 20 Jun 2024 17:48:42 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 1ECA51C23050
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 20 Jun 2024 15:48:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3BBC81AF6A2;
	Thu, 20 Jun 2024 15:48:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ipJrsXQA"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-ot1-f50.google.com (mail-ot1-f50.google.com [209.85.210.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BA4DE1CAAD;
	Thu, 20 Jun 2024 15:48:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718898519; cv=none; b=tlDBM4c4eM/x8j+XCPgOwYqPaQSGP9V2ynqBaP56smTiRP8kqgJo8cyeBNkQb0BFF+4/KHNiq+C0bq4GdMQEA+4O4FM1PrNf3wdvFseiEdZONTPd9wujFbtnZmJZe7OM4AB0ga1JzAHDws3MLsK2v5x9vYIY5TH1Q8eLniX67JI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718898519; c=relaxed/simple;
	bh=RxreNzPAKM9EmG5k1KGx99pVwWKpDF2lYM34ogxlITc=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=LBRUfiyV3RZzmq3D3l52Nz3JkpfruG2+lucOKTAHX+avJtcENEEc09Z8R3xZicUnhWwxWnXabBnEr66TAGSpS2ur6ZieQem7kKZSjEqv9CV8WQvWiwwuWlRJgYgmsHxUAWqccHZimIpRuWGjs2bV5FmUtApK7oVouD+T/TuFxJ8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ipJrsXQA; arc=none smtp.client-ip=209.85.210.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ot1-f50.google.com with SMTP id 46e09a7af769-6fa11ac8695so543912a34.3;
        Thu, 20 Jun 2024 08:48:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1718898517; x=1719503317; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=UA6pGnafIQ7vZfwbUqHiXH1A2Z0xVER1vnIAqCn43xo=;
        b=ipJrsXQAs0odFxd018dKEoTmjTAdZXWFXA5ZGjfSJ7IenhYgd6iAhnBrdpr+VZjNLG
         xwwFdEs198E7Sr3YyXop8y12ysQhzVp3gJacCoz02/BfD+rU5RNNpHtgs7+FSWq/so60
         84x5Xw1iW3cuWlYU3V7FI6lb2qHbLAI4VoT8zZwbiZ1K+r2YeAByJ5iBSeKAnuIZwBKr
         8b0+Rq2NImJsieztN363OuZYtCUqsovcsshs5VVpDkTINA1518NrU9XjdmRkrJtO5k5Z
         3B7bm3zhw8BEtGGPclwvPCEwxn7xtfEwM5yVts+dQI5frlwyeXp7bWZw2OjElGY51uav
         Cf7w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718898517; x=1719503317;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=UA6pGnafIQ7vZfwbUqHiXH1A2Z0xVER1vnIAqCn43xo=;
        b=Qh+Q762xNbLiv/OccIy5lGJs1ovesH+qK9gwkcNbxZm+chaj+zfWn5HjmAWcRNZY+F
         5LQ1t6r5ZYZ0b7ox2JLU0NpRAQZlLn6Ao662gqWp50YDfSRGAZO6ZzcxevGRr5XO9LX+
         ZZOemJUHemg7TNHPKW9weTvBDQHkIPYMyMuQdFXQfB08BuJEEuJ6itHJJ3JfzkeHlbSS
         F81Mw2rDC1683uYswvYIh2Ex8pYKEVvWl0GWunDELLNMh1UQUFwdM9KuqsmxXHwvrG8t
         g35LK4ULev6AikaLorYO+O8NqgkRflUXtZfkRe0rM6ehfpxzDK30LlcxAtaV/vgxhi4c
         00MQ==
X-Forwarded-Encrypted: i=1; AJvYcCVnBARZkxcgU6KZItxoxYqZDA+MUMBDRsyuC6sGxbf/M0+xBrYRVsmK+lFXgk6Pnsgfhn5o0r0gjdQvZFaPVluEmyEYZYRlInBrFbgrYGYwzzRR+iXBU4gF2PCeP03r9VXXCMgo8gBV6T3mkfYcVcfaGdqmRutvw+1xbKcy91lwUkIKiGfIL6Lg/VbVKFXdQnbXjdKIdQWZYH33lnN65Z3k9HGbB5ho
X-Gm-Message-State: AOJu0Yxq5MeY56NhYnO/elK4wGVePjPBl802bzAng7sN5jNqukG54J8P
	A5Edg4BHpc0lrKkTR9Hl8p96/ldAqqV+ivjhbFcSfEKzZ4GGR0X8NbCCAglYLwNGDMMQ+AmxpIw
	zYY2F7Ag+BjC61ctXdDnxIBdSpRs=
X-Google-Smtp-Source: AGHT+IEYulaKRenjVWnfud7w110K1lqvy/8BfTucRq8K/4N44iEx35/9hxOg1mI/7gMLPbqkiJn5c1dRpwzp9KDr8mE=
X-Received: by 2002:a05:6808:152a:b0:3d2:1b0b:e88f with SMTP id
 5614622812f47-3d51b9e5a57mr6376276b6e.30.1718898516796; Thu, 20 Jun 2024
 08:48:36 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240605074936.578687-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <20240605074936.578687-3-prabhakar.mahadev-lad.rj@bp.renesas.com> <CAMuHMdW5J087M=xD95R87XsP-xTqiaenzJ9WVq8x_d2_+67J1A@mail.gmail.com>
In-Reply-To: <CAMuHMdW5J087M=xD95R87XsP-xTqiaenzJ9WVq8x_d2_+67J1A@mail.gmail.com>
From: "Lad, Prabhakar" <prabhakar.csengg@gmail.com>
Date: Thu, 20 Jun 2024 16:48:10 +0100
Message-ID: <CA+V-a8vnmN2WcfQLJ0GbRU5HxoDYGQx67gmbgGWMHJcoazGMQA@mail.gmail.com>
Subject: Re: [RFC PATCH 2/4] regulator: core: Add regulator_map_voltage_descend()
 API
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: Ulf Hansson <ulf.hansson@linaro.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Wolfram Sang <wsa+renesas@sang-engineering.com>, Liam Girdwood <lgirdwood@gmail.com>, 
	Mark Brown <broonie@kernel.org>, Magnus Damm <magnus.damm@gmail.com>, linux-mmc@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-renesas-soc@vger.kernel.org, 
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>, Biju Das <biju.das.jz@bp.renesas.com>, 
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Geert,

Thank you for the review.

On Thu, Jun 20, 2024 at 3:52=E2=80=AFPM Geert Uytterhoeven <geert@linux-m68=
k.org> wrote:
>
> Hi Prabhakar,
>
> On Wed, Jun 5, 2024 at 9:49=E2=80=AFAM Prabhakar <prabhakar.csengg@gmail.=
com> wrote:
> > From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> >
> > Similarly to regulator_map_voltage_ascend() api add
> > regulator_map_voltage_descend() api and export it.
> >
> > Drivers that have descendant voltage list can use this as their
> > map_voltage() operation.
> >
> > Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
>
> Thanks for your patch!
>
> > --- a/drivers/regulator/helpers.c
> > +++ b/drivers/regulator/helpers.c
> > @@ -368,6 +368,37 @@ int regulator_map_voltage_ascend(struct regulator_=
dev *rdev,
> >  }
> >  EXPORT_SYMBOL_GPL(regulator_map_voltage_ascend);
> >
> > +/**
> > + * regulator_map_voltage_descend - map_voltage() for descendant voltag=
e list
> > + *
> > + * @rdev: Regulator to operate on
> > + * @min_uV: Lower bound for voltage
> > + * @max_uV: Upper bound for voltage
> > + *
> > + * Drivers that have descendant voltage list can use this as their
> > + * map_voltage() operation.
> > + */
> > +int regulator_map_voltage_descend(struct regulator_dev *rdev,
> > +                                 int min_uV, int max_uV)
> > +{
> > +       int i, ret;
> > +
> > +       for (i =3D rdev->desc->n_voltages - 1; i >=3D 0 ; i--) {
> > +               ret =3D rdev->desc->ops->list_voltage(rdev, i);
> > +               if (ret < 0)
> > +                       continue;
> > +
> > +               if (ret > min_uV)
>
> I know this patch is superseded, but shouldn't this be "<"?
>
Agreed, thanks I missed that.

Cheers,
Prabhakar

