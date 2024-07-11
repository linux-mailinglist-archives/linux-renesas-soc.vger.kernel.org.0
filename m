Return-Path: <linux-renesas-soc+bounces-7277-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id E9E2D92EAEF
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 11 Jul 2024 16:40:27 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 25E011C2143C
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 11 Jul 2024 14:40:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 60B92167271;
	Thu, 11 Jul 2024 14:40:23 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-yb1-f175.google.com (mail-yb1-f175.google.com [209.85.219.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1E5658479;
	Thu, 11 Jul 2024 14:40:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720708823; cv=none; b=HjkR02Y5hP0lgtQCFzShG3XUc5gfytJyNw/SY4YTchydllFU3ojVLsGndE9WiEynX66+CkIELqgrW/Htq+TGt/5G7jtss3sn6I2SRawIkvt8Vx8TrHqKlPuE0Ng7eCxXCZHEe3mDA9h66yqDQ4xqJszCKFiUYyNPKxXT/tZoVBs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720708823; c=relaxed/simple;
	bh=Sky3Rq4GEoaMq3zTjqiruAw7uR4MXgaAjM9ZpP+LfKQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=g7chZAuSkGOGxBSSqNKH7gOusTpnXrhZgHJkWxL6mLo4yquIrJb+564MyCi9E0eXHlvy9SyGbnzl/hqn7jqWHja8PwSex1aEDWY4NWcKoaE4a49Vg5RO+KF+/RGaSNeMyK6kGudUpc6TDpWDMJXwUWceORJPD+fLeNBvsLe3NpI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.219.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-yb1-f175.google.com with SMTP id 3f1490d57ef6-e0365588ab8so917769276.1;
        Thu, 11 Jul 2024 07:40:20 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1720708819; x=1721313619;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=B0dzyKqHqO0/d9+D3hn6zGXqfLpmzgD1JydtbOq1+9w=;
        b=RwrhrwOl6yd4u1Tx7SF/ufXKaW/o5I98YIg+Wb7geEyY6MoLW1obbEDybhBldLaHYC
         l91cvZ2vUUtkrA+UOUqUZHrbwLn9Pe1B1CVnfkRy46KEbD+i1Nos4D7vE240vXXwe2Sr
         churfS6BLKg5fQDfJxgUGiqVif8F5FHWQzSecfzkJPWLEM69oxkAMU8CPEBoajwWVfuM
         xn7asbmowD0aI/1cN5dcdQ3flOHles52GkO5PdOMpwubRVHFy5aNWdFopNEs83LpC7jm
         pOXwyTQB4DLGNmbWAyOhtIXS5En3pLYQqtOTaathlcB7yiKY09b83bDy3ljypiYHj7R9
         CxgQ==
X-Forwarded-Encrypted: i=1; AJvYcCVeWO+i/NDzJ2fcix/CGixOyz648u8lZfbr4P49jPiPF2yejpPzQbBvzXBshIprk6FYL2VbHGRH74tkCYCXPuaWxjTmMzXLZZEQnRF4VHThTKB2rhYxypZ9GnKlgOuKLcrsEHgXgXwiBMFw/Cka
X-Gm-Message-State: AOJu0YxwfS6VoNac7049OAYvIOYsDNjDMolvineOg/9Eft+4jJShNMwe
	XVh6Um1pKInJ/ob0dByCg+PhcCrmdt6uLSZsy2U9Q3FLuPSjB4BTuySDs3hG
X-Google-Smtp-Source: AGHT+IEG2Hd643WQhqYGtVBuFzfiwv+pBO2/m+FHoN8ktWUT3/L6eXQovYk0SjwFHZRmAcgewt8Qgw==
X-Received: by 2002:a25:a341:0:b0:e03:4ee5:8c0e with SMTP id 3f1490d57ef6-e041b17827fmr8294203276.63.1720708818929;
        Thu, 11 Jul 2024 07:40:18 -0700 (PDT)
Received: from mail-yw1-f178.google.com (mail-yw1-f178.google.com. [209.85.128.178])
        by smtp.gmail.com with ESMTPSA id 3f1490d57ef6-e041a99b68asm1012096276.55.2024.07.11.07.40.18
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 11 Jul 2024 07:40:18 -0700 (PDT)
Received: by mail-yw1-f178.google.com with SMTP id 00721157ae682-6512866fa87so10223447b3.2;
        Thu, 11 Jul 2024 07:40:18 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCU6GN3FaVMheUDmmcOf1ZcF35vxHWriqiV5FkbienPyqHPo2makFMnjkEHsZG5/QDwyHgnpExuSJqLhj0TpbwbP7f6fG3CyKGiav6RWjK9QdpeJCxco1RbYJlE8BeUst/mU3MlaB49n37mKIjNJ
X-Received: by 2002:a0d:f981:0:b0:64a:f40d:5fd2 with SMTP id
 00721157ae682-658eed5debcmr93730157b3.12.1720708818086; Thu, 11 Jul 2024
 07:40:18 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240616105402.45211-1-biju.das.jz@bp.renesas.com> <20240616105402.45211-5-biju.das.jz@bp.renesas.com>
In-Reply-To: <20240616105402.45211-5-biju.das.jz@bp.renesas.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Thu, 11 Jul 2024 16:40:04 +0200
X-Gmail-Original-Message-ID: <CAMuHMdX5ayWbLEEa6nAipECVB6H9eCpRg21pu3zYrTdiER0F+Q@mail.gmail.com>
Message-ID: <CAMuHMdX5ayWbLEEa6nAipECVB6H9eCpRg21pu3zYrTdiER0F+Q@mail.gmail.com>
Subject: Re: [PATCH v4 4/6] regulator: Add Renesas RZ/G2L USB VBUS regulator driver
To: Biju Das <biju.das.jz@bp.renesas.com>
Cc: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
	Philipp Zabel <p.zabel@pengutronix.de>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Magnus Damm <magnus.damm@gmail.com>, devicetree@vger.kernel.org, 
	linux-renesas-soc@vger.kernel.org, 
	Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>, Biju Das <biju.das.au@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Biju,

On Sun, Jun 16, 2024 at 12:54=E2=80=AFPM Biju Das <biju.das.jz@bp.renesas.c=
om> wrote:
> As per the RZ/G2L HW manual, VBUSEN can be controlled by the VBOUT
> bit of the VBUS Control Register. This register is mapped in the reset
> framework. The reset driver expose this register as regmap and instantiat=
es
> this driver. The consumer will use the regulator API to control the VBOUT
> bit as the control need to be done in the atomic context.
>
> Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>

Thanks for your patch, which is now commit 84fbd6198766336f
("regulator: Add Renesas RZ/G2L USB VBUS regulator driver")
in regulator/for-next.

> --- a/drivers/regulator/Kconfig
> +++ b/drivers/regulator/Kconfig
> @@ -1634,6 +1634,15 @@ config REGULATOR_UNIPHIER
>         help
>           Support for regulators implemented on Socionext UniPhier SoCs.
>
> +config REGULATOR_RZG2L_VBCTRL
> +       tristate "Renesas RZ/G2L USB VBUS regulator driver"
> +       depends on ARCH_RZG2L || COMPILE_TEST
> +       depends on OF
> +       select REGMAP_MMIO
> +       default ARCH_RZG2L

As the "rzg2l-usb-vbus-regulator" platform device is only created by
drivers/reset/reset-rzg2l-usbphy-ctrl.c, perhaps this should be made
stricter by using "default RESET_RZG2L_USBPHY_CTRL"?

Alternatively, RESET_RZG2L_USBPHY_CTRL could select
RESET_RZG2L_USBPHY_CTRL if REGULATOR.  Can RESET_RZG2L_USBPHY_CTRL
work without REGULATOR_RZG2L_VBCTRL?  If not, RESET_RZG2L_USBPHY_CTRL
should depend on REGULATOR, too.

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

