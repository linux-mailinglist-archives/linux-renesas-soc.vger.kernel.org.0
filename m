Return-Path: <linux-renesas-soc+bounces-9036-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 89A9C9853A5
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 25 Sep 2024 09:19:36 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 8DEADB2235D
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 25 Sep 2024 07:19:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 41572157472;
	Wed, 25 Sep 2024 07:18:18 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-yw1-f170.google.com (mail-yw1-f170.google.com [209.85.128.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 45DD3156F53;
	Wed, 25 Sep 2024 07:18:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727248698; cv=none; b=h0YFnAEX1AduoInvJPmV8CxvJNTfkwFHGXzbRG03vOnsBnRh2zutG43ETZfVW+2vXOuvaE4ZSNDkcTYsw4LCofHSSOk0FuDsrkn1QWVPVXtY8FhuNuWomS09Bbhb8wDyN1d3X2PlAnaJrejIcbKMpQiA2F2T4nAMx9SnZ4huQV0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727248698; c=relaxed/simple;
	bh=ph8tfjUNDdXZsNIdbM+KxFw06gMgLaqBai/94PU6DoM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=TPIAJR4l6PVJkNfR9DasHLk38Qrk/2HplkMvUWkte3yXQVtq0quWoC/ZQfRpP8UxR5f56XS9mJcY+oT0H7TEsvhBMnH3VSVoR6FdTri5KVFW9HMzjLvlh7L0Ffx0xvOijCSbSgCTQ7zs+V/URqU9SOIiVLJt6J4X9SsTrnEjmgg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.128.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-yw1-f170.google.com with SMTP id 00721157ae682-6dbc5db8a31so4951417b3.1;
        Wed, 25 Sep 2024 00:18:15 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727248694; x=1727853494;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=zQWGmgokVdF/hyil2QWtat0xQhVTF6GVF1uDjbKl0E8=;
        b=abXQ2AKyu8KIBm6fl1LZpd9HiZFytG7VytkzPbqWEAnWFml5vh2T2oMV//y1iokNCc
         3C7XwOK1VeKhWxdog8SHgsqrLJxsVzaHSOW823tJ8J2ZcY1De2QP4O+ssszz6r3luOPV
         OZuA+8+XeOg/AaXAXybY1yjosSRyT+tXj/cMIxCDTUYBHH7Mb6q/dEHVE7q3jfVOyO1D
         Z3Q1KapQLqZcz+Px+tejt7iyMAUuq5c9/UqXLgOwYyCwhBApgNpW6LAouO9vXDcgzyA7
         laWboGVfEaq4MxYPpW2ylDkbJBUpqn+ci0lXGL247Z9WOLcZpvY4as14z20wjVahqS2i
         5nbQ==
X-Forwarded-Encrypted: i=1; AJvYcCUINYl+BcM9fCs+qiYedmG0Bf/wtvtuWiFimneXhiRj/gXTYzXUh9knSiPpY9z7H9hMyM19FoJ2V17w@vger.kernel.org, AJvYcCUr1L+4aoPSCAMir67oEnviewm1gy6wWywPtml6nL0/ZU0k2hw7wvthDmCijfu4vLW7qFmiuCF2UklIB/tTHH5nOg0=@vger.kernel.org, AJvYcCVQKb6JDDHAUeiqycwuKmje8wpWgbq568QBouPKXDhsNth30FgXZejI9trB5vmMusEGU37OzQRwpc7W@vger.kernel.org, AJvYcCVVWvu3KHZr3SowxttvWs3cNvl4XjRlzkMV4U1nF4qpOsuEbJx9TGB+h5ruyJSQoIe/R0vEzbWcZS2KPG4=@vger.kernel.org, AJvYcCXbBsA2Tk5sAeiZ7XOt4CRAkah12+YykPalxzpw5TYbJAPFDbxQBcziOTsYZV8l2iaV+CQalu1qgQueBeWu@vger.kernel.org
X-Gm-Message-State: AOJu0YxAX2gXjZrLYi4Ibk9xq769gDCd3Kqm1XVoCEq6FLh2vhiCV/FM
	4UtF4fYaJrphql8CG8moQYzfACdGTjPHhp3St6OFolurnXJ9LQ7HztGz5qQn
X-Google-Smtp-Source: AGHT+IG0Uolw3yeMqm5wif3OmYjmIbGg8iob3v0SVOUpPBwHvBIeJxbKTr358vhjUfCyrEqGySfLiQ==
X-Received: by 2002:a05:690c:6e02:b0:6dd:b9bb:3525 with SMTP id 00721157ae682-6e20865e0ebmr43431017b3.9.1727248694065;
        Wed, 25 Sep 2024 00:18:14 -0700 (PDT)
Received: from mail-yw1-f178.google.com (mail-yw1-f178.google.com. [209.85.128.178])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-6e21f50ef53sm1791277b3.73.2024.09.25.00.18.13
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 25 Sep 2024 00:18:13 -0700 (PDT)
Received: by mail-yw1-f178.google.com with SMTP id 00721157ae682-6dddca05a60so6383657b3.0;
        Wed, 25 Sep 2024 00:18:13 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCVztOB3tWBB56dQJSDRyqYpNOEFFglzfhKwMm3CClwPUHOxvVkWiKgBycCm8eLspBUvyVRoXX8yIp8yFZI=@vger.kernel.org, AJvYcCWE+Jvrng6q+Vm1MJQ1zH1GAuazcxw1hAGgbjfUEYicjK/fxoGm8OTjcvJ++AQQNrqbGTReSoUOx1TO@vger.kernel.org, AJvYcCWrgT7YwdeEv5bUBIpnzex33QbyOoBRkQgGlwiK+44uGnu/Kd24zMulwL4FjgHkqE39ViO2O5LDqkrJjxDp@vger.kernel.org, AJvYcCX4n64ElQIlhWVu2Lcw/IntzOu+UAUTqdmH4lc2zhxfUCCK1HRFfu3JyQXW8q4d1j5xYjqEyTPuwI8remL6nroYymk=@vger.kernel.org, AJvYcCX7kCowGGtQI+GZ+XIJhlYyXbcnIgGrN1gUcqzO8HEwILC3LASapxxydXpxD1nrX4w/jpuOkBkgYoAW@vger.kernel.org
X-Received: by 2002:a05:690c:6288:b0:6db:dee9:f6fb with SMTP id
 00721157ae682-6e208862f3amr46634627b3.11.1727248692956; Wed, 25 Sep 2024
 00:18:12 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240925031131.14645-1-yikai.tsai.wiwynn@gmail.com> <20240925031131.14645-3-yikai.tsai.wiwynn@gmail.com>
In-Reply-To: <20240925031131.14645-3-yikai.tsai.wiwynn@gmail.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Wed, 25 Sep 2024 09:18:00 +0200
X-Gmail-Original-Message-ID: <CAMuHMdXa9HpE_2jyjeUA7GDyccEhcZTAv2w9gKMZgs-5gfiOhQ@mail.gmail.com>
Message-ID: <CAMuHMdXa9HpE_2jyjeUA7GDyccEhcZTAv2w9gKMZgs-5gfiOhQ@mail.gmail.com>
Subject: Re: [PATCH v7 2/2] hwmon: (isl28022) new driver for ISL28022 power monitor
To: Yikai Tsai <yikai.tsai.wiwynn@gmail.com>
Cc: patrick@stwcx.xyz, Jean Delvare <jdelvare@suse.com>, 
	Guenter Roeck <linux@roeck-us.net>, Jonathan Corbet <corbet@lwn.net>, 
	=?UTF-8?Q?Carsten_Spie=C3=9F?= <mail@carsten-spiess.de>, 
	Geert Uytterhoeven <geert+renesas@glider.be>, Magnus Damm <magnus.damm@gmail.com>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	linux-hwmon@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org, 
	linux-renesas-soc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Yikai,

On Wed, Sep 25, 2024 at 5:11=E2=80=AFAM Yikai Tsai <yikai.tsai.wiwynn@gmail=
.com> wrote:
> Driver for Renesas ISL28022 power monitor with I2C interface.
> The device monitors voltage, current via shunt resistor
> and calculated power.
>
> Signed-off-by: Carsten Spie=C3=9F <mail@carsten-spiess.de>
> Signed-off-by: Yikai Tsai <yikai.tsai.wiwynn@gmail.com>

Thanks for your patch!

> --- /dev/null
> +++ b/drivers/hwmon/isl28022.c

> +static int isl28022_read_properties(struct device *dev, struct isl28022_=
data *data)
> +{
> +       u32 val;
> +       int err;
> +
> +       err =3D device_property_read_u32(dev, "shunt-resistor-micro-ohms"=
, &val);
> +       if (err =3D=3D -EINVAL)
> +               val =3D 10000;
> +       else if (err < 0)
> +               return err;
> +       data->shunt =3D val;
> +
> +       err =3D device_property_read_u32(dev, "renesas,shunt-range-microv=
olt", &val);
> +       if (err =3D=3D -EINVAL)
> +               val =3D 320000;
> +       else if (err < 0)
> +               return err;
> +
> +       switch (val) {
> +       case 40000:
> +               data->gain =3D 1;
> +               if (data->shunt < 800)
> +                       goto shunt_invalid;
> +               break;
> +       case 80000:
> +               data->gain =3D 2;
> +               if (data->shunt < 1600)
> +                       goto shunt_invalid;
> +               break;
> +       case 160000:
> +               data->gain =3D 4;
> +               if (data->shunt < 3200)
> +                       goto shunt_invalid;
> +               break;
> +       case 320000:
> +               data->gain =3D 8;
> +               if (data->shunt < 6400)
> +                       goto shunt_invalid;
> +               break;
> +       default:
> +               dev_err_probe(dev, "renesas,shunt-range-microvolt invalid=
 value %d\n", val);

I doubt this compiles well?

> +               return -EINVAL;

return dev_err_probe(dev, -EINVAL, "renesas,shunt-range-microvolt
invalid value %d\n", val);

> +       }
> +
> +       err =3D device_property_read_u32(dev, "renesas,average-samples", =
&val);
> +       if (err =3D=3D -EINVAL)
> +               val =3D 1;
> +       else if (err < 0)
> +               return err;
> +       if (val > 128 || hweight32(val) !=3D 1) {
> +               dev_err_probe(dev, "renesas,average-samples invalid value=
 %d\n", val);
> +               return -EINVAL;

Likewise.

> +       }
> +       data->average =3D val;
> +
> +       return 0;
> +
> +shunt_invalid:
> +       dev_err_probe(dev, "renesas,shunt-resistor-microvolt invalid valu=
e %d\n", data->shunt);
> +       return -EINVAL;

One more.

> +}

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k=
.org

In personal conversations with technical people, I call myself a hacker. Bu=
t
when I'm talking to journalists I just say "programmer" or something like t=
hat.
                                -- Linus Torvalds

