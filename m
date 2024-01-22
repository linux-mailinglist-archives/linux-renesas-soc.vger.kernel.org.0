Return-Path: <linux-renesas-soc+bounces-1655-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 369BB836BA8
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 22 Jan 2024 17:49:40 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id E349028453E
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 22 Jan 2024 16:49:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 86E075A116;
	Mon, 22 Jan 2024 15:22:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="Tc0AADDk"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-yw1-f173.google.com (mail-yw1-f173.google.com [209.85.128.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 065DF5A10B
	for <linux-renesas-soc@vger.kernel.org>; Mon, 22 Jan 2024 15:22:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1705936941; cv=none; b=FIW8RVxObFUOaKGXxSYONDfaGJjcI2S2fDZ7zl9O032t+FQBKEdx6rE5avxvLY6pXBmEpZ/xiFwd2pnfnNhuLyhYKf1leZ/MfuZ5dGeTg6R8T5cXr4wP9uNN8mgM0J3fTZ4/qjI9e0NQVDaMMXP1KNLU60H/ONDH0Z0RlfD8/vc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1705936941; c=relaxed/simple;
	bh=xET98xyO5AfK++zYqS7vQuHIdWfFSnZtnrHyMtLTfUg=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=cUx5Qt+MMPVlvzzkqctP34zUu2vVkdrYPeJ06QDy9y/H0LZUK/8vfMLetP+wkufKsIKcrNPlK+4moYXkcMhYQPcSOabmY6/ZUKca7Y2vFbrFARxWpKmEzJ+MdkDsa8zsaAvDCWNXXNIputA2tR8eaMngI5FOP1E1BVurZ+r9G0Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=Tc0AADDk; arc=none smtp.client-ip=209.85.128.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-yw1-f173.google.com with SMTP id 00721157ae682-600273605a9so2873487b3.1
        for <linux-renesas-soc@vger.kernel.org>; Mon, 22 Jan 2024 07:22:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1705936939; x=1706541739; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=611cbvx7aFVh2c+U8uY66ZDm4QioyrnbDM6NyJspf9g=;
        b=Tc0AADDkzinLNzbKeJo1bSBVuwC6XkFvZJ8zJs+01R/+WZ79pd0ew/U7YSQgHvKUMn
         8MW3hUYfY5M2nryGNPM6UvAVOxphJ56QLZCBz+H1ShmQJJAjE+gehx/pf71dFfknPZIt
         cBBWiKgtMHI8/apFDVUs2k1JcxZ1xaZmKYHfYGCVHXoH52vazCDN3IQPgpavt4F4VcPY
         dYAHm6CaQKxtwkkH+RiKr07VZ6j2/kgOiolV3Uqsjekjxd+AgHxjf5UY9ARPi6NmFbdF
         dgl6t1dwXxRIjPqPQUwPFuOwpgs9FznCpCllmsyXjPk/KOLUYWUzYkHU6TcRPjOnpveZ
         Nk4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1705936939; x=1706541739;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=611cbvx7aFVh2c+U8uY66ZDm4QioyrnbDM6NyJspf9g=;
        b=BKqpBFCaua6yTXjxMw4jP1xtjj9STLeQhLL3wQGyGjl72CEkWx99I05KM7OY3BvNbI
         XCQtr2qKRiauOyoilPX/SXAO1DJRHGJmWKi/Ge8KswI9ggTK7pvbokLz5gk0UIWt3ljf
         Cng5wH5E7vfFhAhjF22VtVo9zbPuB/z0iFVYGun3pU1rEjZRsuQfIQMo51EgHB6JD85Y
         FlRf6x9KsOqiX1wnICXk2vckTpJ3KHtpGlOM+LsE/lHdeneZY9Mv78SYd7bu3EqFFvqZ
         8BYeEZzJKZbwFKMGML+vKX5OAPQC9LrWkm9ub7yHKCehavnT7rDP6iB7VFapQpoU1yMd
         coFw==
X-Gm-Message-State: AOJu0YxmG4V4rJUusNBQvRf2O5BMvUSfN0HmeraUXHhtI9L9WqlCCvdU
	3gvgjwyrcATA+U/rv4kWNqLGn4fn/tkxCnc5vk9Hp2djkLtvJPwqR8PgQ8p5d8KICwbvSeVwJAc
	GLtnglIovixClZ+QUf+3ZU0I0lBpT30Ujk2j4XQ==
X-Google-Smtp-Source: AGHT+IE4ruib8OKk0WuCYe9QMhVnQQCZ7AyO4rPM75Wx8s4rFAQIwoyk7xQgASc7zK6tOjWQHbfqoIN0vQ5iCK9uMKw=
X-Received: by 2002:a81:a1cc:0:b0:5ff:b07c:9921 with SMTP id
 y195-20020a81a1cc000000b005ffb07c9921mr2992342ywg.50.1705936938952; Mon, 22
 Jan 2024 07:22:18 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <fdad9a86132d53ecddf72b734dac406915c4edc0.1705076735.git.geert+renesas@glider.be>
In-Reply-To: <fdad9a86132d53ecddf72b734dac406915c4edc0.1705076735.git.geert+renesas@glider.be>
From: Ulf Hansson <ulf.hansson@linaro.org>
Date: Mon, 22 Jan 2024 16:21:43 +0100
Message-ID: <CAPDyKFo4Ugy2Z0dtiYGBaGEsW+HoO3HnnLSCQZrS-_6COiJqFw@mail.gmail.com>
Subject: Re: [PATCH] pmdomain: renesas: r8a77980-sysc: CR7 must be always on
To: Geert Uytterhoeven <geert+renesas@glider.be>
Cc: Magnus Damm <magnus.damm@gmail.com>, 
	Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>, linux-renesas-soc@vger.kernel.org, 
	linux-pm@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, 12 Jan 2024 at 17:33, Geert Uytterhoeven
<geert+renesas@glider.be> wrote:
>
> The power domain containing the Cortex-R7 CPU core on the R-Car V3H SoC
> must always be in power-on state, unlike on other SoCs in the R-Car Gen3
> family.  See Table 9.4 "Power domains" in the R-Car Series, 3rd
> Generation Hardware User=E2=80=99s Manual Rev.1.00 and later.
>
> Fix this by marking the domain as a CPU domain without control
> registers, so the driver will not touch it.
>
> Fixes: 41d6d8bd8ae94ca9 ("soc: renesas: rcar-sysc: add R8A77980 support")
> Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>

Applied for fixes and by adding a stable tag, thanks!

Kind regards
Uffe


> ---
>  drivers/pmdomain/renesas/r8a77980-sysc.c | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
>
> diff --git a/drivers/pmdomain/renesas/r8a77980-sysc.c b/drivers/pmdomain/=
renesas/r8a77980-sysc.c
> index 39ca84a67daadd21..621e411fc9991a40 100644
> --- a/drivers/pmdomain/renesas/r8a77980-sysc.c
> +++ b/drivers/pmdomain/renesas/r8a77980-sysc.c
> @@ -25,7 +25,8 @@ static const struct rcar_sysc_area r8a77980_areas[] __i=
nitconst =3D {
>           PD_CPU_NOCR },
>         { "ca53-cpu3",  0x200, 3, R8A77980_PD_CA53_CPU3, R8A77980_PD_CA53=
_SCU,
>           PD_CPU_NOCR },
> -       { "cr7",        0x240, 0, R8A77980_PD_CR7,      R8A77980_PD_ALWAY=
S_ON },
> +       { "cr7",        0x240, 0, R8A77980_PD_CR7,      R8A77980_PD_ALWAY=
S_ON,
> +         PD_CPU_NOCR },
>         { "a3ir",       0x180, 0, R8A77980_PD_A3IR,     R8A77980_PD_ALWAY=
S_ON },
>         { "a2ir0",      0x400, 0, R8A77980_PD_A2IR0,    R8A77980_PD_A3IR =
},
>         { "a2ir1",      0x400, 1, R8A77980_PD_A2IR1,    R8A77980_PD_A3IR =
},
> --
> 2.34.1
>

