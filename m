Return-Path: <linux-renesas-soc+bounces-6557-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id D63EA9108F8
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 20 Jun 2024 16:52:30 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 1378F1C209B7
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 20 Jun 2024 14:52:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6BAE21AE871;
	Thu, 20 Jun 2024 14:52:28 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-yb1-f171.google.com (mail-yb1-f171.google.com [209.85.219.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 32BEA1AE84E;
	Thu, 20 Jun 2024 14:52:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718895148; cv=none; b=ZHugzqmokr+hZXysotWWZ/CL/tk5p9c2P4nESMgEnXPzbcE9j57+phoXkpvdwywnHfldFK2XgSfcbNgZCC5UINJhveUi7dRO64A6Oo8F26IHIThNoNziyAf2RKZCEOki7QRtTsv0k1mIYphkywafZ41Tch/fnqKlNzO19VNPLvg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718895148; c=relaxed/simple;
	bh=quHvdMGXD+OF+Vmvo6ZchqeF+v17FJP9dNrIZBXrvGc=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=sMvQz3V37yeUl5LLHfleUR5r8uMdLy30IAYK5WAYiBVI1fUobedpHpH8yS6KTf+fHlY96Iz8slKJ32dT2YSyKQ6JKcAQY59JgQKX88sZ3XZHDhJ4q4Tmb5ZdoBLLfLe/8Faye0o5Xa3p13gnalRCh7oHYNc/xBRPPVmfNhfGzM8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.219.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-yb1-f171.google.com with SMTP id 3f1490d57ef6-dfe81d54db9so973713276.2;
        Thu, 20 Jun 2024 07:52:26 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718895144; x=1719499944;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=qicnrKvU4izSAdjyf++mWnVsSY0UBkYb5drVYCcA5wY=;
        b=cdeJnu6fScTZbDDJ5VBiclJX/d3DAxzRVw1+ZUziR2PktI4AezKkSWoXDLIZEJLPol
         DZRNiOTkKhrWktzkK5ws/uvmoqnn771pNsuAOA2GmkNUwT/9QqA7Y18epbeCFeG1Gd5s
         6eGSBJtSpNWqNQMFySRx3linrkSsPkoyTG2ktwX+AhEuhey3i6kR0vZOmb3xZej2t4/R
         Rmg9HRUaf7hVvBnF7RSHN4MDSXEc4zb+68MuRRFezoeMYyzqjmUvx0BhnEXrLUDUK28U
         PSuiCdTtEGZqSNMfsxKhHpvxop5CzFriNQpM4gr8T6jV/0L6l4FaBrOcR9sU16fYPtJN
         If8g==
X-Forwarded-Encrypted: i=1; AJvYcCV7e4QvIb6nn+VQV5HyGYRxivCCbSVrA2r5DiUkuVJPXOFdPiYoTOfoqaAy5zGar+K4TdZj+rhv1Fg5E4wv9Js4Xa1COSKRxxBD+7/edyVcrqhi9zICXo+75imgtf5AsU7YM9POLMTOL3tNbv6moj260D2FFp0N10MO0ETTQfuJK7Fhk1OZCSx+DFKcP/dkpFJ4B7WqTdtYPwvNUoHJ1jiUd2iy+F8Q
X-Gm-Message-State: AOJu0Yw9Uav9DpyxEIi3k4BSYPlQK2l3YgRfjFGv0994QCuYVM+wPujX
	/kgfNGoBbHMxXv2z7t2G8ADchrJxSWYAOtevkrnIOvjEbO/paEwt6Pw+jVmF
X-Google-Smtp-Source: AGHT+IHa726p4LBUgJ4pKzqdMzHgOlyRn0z7kg86RymTqqoueBuhne4yq1OJUzSFpV67LGh1zg0C2A==
X-Received: by 2002:a25:d653:0:b0:dff:745:2303 with SMTP id 3f1490d57ef6-e02be225ddemr4959097276.57.1718895144153;
        Thu, 20 Jun 2024 07:52:24 -0700 (PDT)
Received: from mail-yb1-f171.google.com (mail-yb1-f171.google.com. [209.85.219.171])
        by smtp.gmail.com with ESMTPSA id 3f1490d57ef6-e02ce311570sm987321276.15.2024.06.20.07.52.23
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 20 Jun 2024 07:52:23 -0700 (PDT)
Received: by mail-yb1-f171.google.com with SMTP id 3f1490d57ef6-dfe81d54db9so973676276.2;
        Thu, 20 Jun 2024 07:52:23 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCW8Jv9p9FcgyzdRMxyQg94hd8/iEvpkOQYFU9ir04GVpGuNBboPAeVyCFaBAjkEXnBFckDFQqpCd1biv/VRksTFljKHglTDAplzpIyqr0bcpE9HJUpcSiThl5VLfDFi8RZE9KWrC2M4W8AHJeVpoAl+bTgGgPxPNwHz9K1ekVFQKlQF+ARxO3d9+cF/sRdxv4uBkq2AXV32mgC4vLxgmWX42YBYmgEa
X-Received: by 2002:a25:8403:0:b0:e02:b7ee:5354 with SMTP id
 3f1490d57ef6-e02be138271mr5993985276.20.1718895143516; Thu, 20 Jun 2024
 07:52:23 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240605074936.578687-1-prabhakar.mahadev-lad.rj@bp.renesas.com> <20240605074936.578687-3-prabhakar.mahadev-lad.rj@bp.renesas.com>
In-Reply-To: <20240605074936.578687-3-prabhakar.mahadev-lad.rj@bp.renesas.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Thu, 20 Jun 2024 16:52:11 +0200
X-Gmail-Original-Message-ID: <CAMuHMdW5J087M=xD95R87XsP-xTqiaenzJ9WVq8x_d2_+67J1A@mail.gmail.com>
Message-ID: <CAMuHMdW5J087M=xD95R87XsP-xTqiaenzJ9WVq8x_d2_+67J1A@mail.gmail.com>
Subject: Re: [RFC PATCH 2/4] regulator: core: Add regulator_map_voltage_descend()
 API
To: Prabhakar <prabhakar.csengg@gmail.com>
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

Hi Prabhakar,

On Wed, Jun 5, 2024 at 9:49=E2=80=AFAM Prabhakar <prabhakar.csengg@gmail.co=
m> wrote:
> From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
>
> Similarly to regulator_map_voltage_ascend() api add
> regulator_map_voltage_descend() api and export it.
>
> Drivers that have descendant voltage list can use this as their
> map_voltage() operation.
>
> Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>

Thanks for your patch!

> --- a/drivers/regulator/helpers.c
> +++ b/drivers/regulator/helpers.c
> @@ -368,6 +368,37 @@ int regulator_map_voltage_ascend(struct regulator_de=
v *rdev,
>  }
>  EXPORT_SYMBOL_GPL(regulator_map_voltage_ascend);
>
> +/**
> + * regulator_map_voltage_descend - map_voltage() for descendant voltage =
list
> + *
> + * @rdev: Regulator to operate on
> + * @min_uV: Lower bound for voltage
> + * @max_uV: Upper bound for voltage
> + *
> + * Drivers that have descendant voltage list can use this as their
> + * map_voltage() operation.
> + */
> +int regulator_map_voltage_descend(struct regulator_dev *rdev,
> +                                 int min_uV, int max_uV)
> +{
> +       int i, ret;
> +
> +       for (i =3D rdev->desc->n_voltages - 1; i >=3D 0 ; i--) {
> +               ret =3D rdev->desc->ops->list_voltage(rdev, i);
> +               if (ret < 0)
> +                       continue;
> +
> +               if (ret > min_uV)

I know this patch is superseded, but shouldn't this be "<"?

> +                       break;
> +
> +               if (ret >=3D min_uV && ret <=3D max_uV)
> +                       return i;
> +       }
> +
> +       return -EINVAL;
> +}
> +EXPORT_SYMBOL_GPL(regulator_map_voltage_descend);
> +
>  /**
>   * regulator_map_voltage_linear - map_voltage() for simple linear mappin=
gs
>   *

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

