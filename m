Return-Path: <linux-renesas-soc+bounces-10753-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id C0CF69DBA19
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 28 Nov 2024 16:08:28 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 3D0661612A2
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 28 Nov 2024 15:07:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BE69E1B5ED1;
	Thu, 28 Nov 2024 15:07:48 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-oa1-f46.google.com (mail-oa1-f46.google.com [209.85.160.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7BFF819EEB4;
	Thu, 28 Nov 2024 15:07:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732806468; cv=none; b=Hq3WIqxWwu4BkKQbl3u7FP97MrtYp22gJOoWR8x1eED2aKnYksr7mKjXbhCr1obVlyH9MHu5b6ANYPccLeuwdbJ7OXiAa1t8y6Z3280syDsKHMRo/dZaei1jUD3zc5H1V5jQWC4xnU/FUhCBnZiTMmLQKd825WWN2KktF3qJm5U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732806468; c=relaxed/simple;
	bh=19hCZy47BZ11Q7nKv1e07bp32BgPu4KZ5y+PdAk5t6M=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=NrgtKUofI0pUdrDaHTbdGeRQwzSlyDJNhdjNpDCpOdt7EWaQZuMKMZcknNn9OV+xKuAhDejBl0jzIXOqgCSHw7OMYDhIwf7gRPyJeqtwsxYFMFSBIFGiv5K0kKd50HIHNJxihaanAsTdWbZrRMPibkNXUr8ogCMJSRAG8kTeULY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.160.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-oa1-f46.google.com with SMTP id 586e51a60fabf-29678315c06so504933fac.1;
        Thu, 28 Nov 2024 07:07:46 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1732806464; x=1733411264;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=/yzWTFKVKmP/Yu30XBr6QDu1Y/pRbzSvABTgewzd4OE=;
        b=PTubygY6wDn8ye/wiBytZlpyop04c4MKtSv174bCt7t1jxNHtasNxuQr4oozCYkIKW
         a9D+usxbfmwHTDgfCY2pbSqJ+d1D+5OV5nMluNDl9O8HgC8OwlPRRSeLysGfmtpJCurM
         GYFzovNmr/cNH85Xsq3gSEx98e7lVWy08/84iCOUfQhBU6+J+VGotyOGZXwng+jU4/N/
         2MYIoOBZRtyMn3AR4tD1wWUm70bUz77Y3Lr05f6T2O1xRbjIinlVT2SjmCbpX7P40L8v
         RhmlCjPCdgMWSB41GbmepuCJreBQxPN0Pyh5/4ZLecrP+rINxBxug4YkJb9FwguQIbFZ
         SOvg==
X-Forwarded-Encrypted: i=1; AJvYcCUMz9HjgQWq+JJuKUtQkp24KuUPojszkI7aum7Rt5WdXJawOK6Q+ygKIIe1B7ayPaPyZNgnS5+i0UUhgAFs@vger.kernel.org, AJvYcCWmpCVvgxdJWvUy1PgtF5zAkqERca91FljahjY5mS7se+dOJDdI9y9/g0lVCNLON53Kq8Csm/trxSaE2vZKG6i9KxI=@vger.kernel.org, AJvYcCXOu4/lW0YfnqJ8JkfGMHnOKKLQCf2cMJVRk9Q3YL15Lfa8GUJ4FZ9XkKP065GQ1hg0ey9byDB2ksha@vger.kernel.org, AJvYcCXSM+Mds+NvQwuzjEwy7IZGASvJbj6i1SsmoaWju0cMXWvo5yUZmUK/JoWxP7kN+p+Mc/gYtJjeXAmQ@vger.kernel.org
X-Gm-Message-State: AOJu0YyelgVfWDykcN0dcBFSE3JvC2hSMdQ7OiR6DKwS7frcdmYWE9g6
	ERS3HY29AHfLqpUBXeSBBxPaMOCsCl03ZAK0ypfimx7na1ul1gXSksKoPa88XO0=
X-Gm-Gg: ASbGncuB9QXNoC7UM6Mxy5e8fbnt0Fpcbp5fOUKpt9DHL4lGZ5sBoW/QjY8NRR8Yyy2
	blyQmHMYpmm5j/hD5rznTgD4LpRzaR5XRbapG9+uaTEwxbZr/anRP/ej5U/oflH/sO0bA7+Za9o
	nf6u3cDnpMO/Wx7xPXh9pspXb+A+s7wYR3KWrXN0a/Eiki/UYsXWVmO0Oe9buvme8naatdQN89B
	V5or2fJFBAYQXR342pvhvJ0lkZD5tTZI4FjjfwVY/KdT8fKXDTDq3N4eaDEDp1ver64h2bNO2R1
	Oj7pkupBgxwr
X-Google-Smtp-Source: AGHT+IH3kQM9ucqvl/kj3LRxe3lckJI19K1fVxuJrKn7VJtSp3gfO4j1XUpUqmtGfbGvduhjqe9QMg==
X-Received: by 2002:a05:6870:9d9a:b0:297:286c:f106 with SMTP id 586e51a60fabf-29dc42ead8fmr7328181fac.29.1732806463818;
        Thu, 28 Nov 2024 07:07:43 -0800 (PST)
Received: from mail-oa1-f44.google.com (mail-oa1-f44.google.com. [209.85.160.44])
        by smtp.gmail.com with ESMTPSA id 586e51a60fabf-29de9946016sm448334fac.33.2024.11.28.07.07.42
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 28 Nov 2024 07:07:42 -0800 (PST)
Received: by mail-oa1-f44.google.com with SMTP id 586e51a60fabf-288fa5ce8f0so402012fac.3;
        Thu, 28 Nov 2024 07:07:42 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCVATJljL+uFSZu53Pv4t3gcJl8lP/V8ajmFbIBLvvpghz/jjBhYkginbh14AQlWi1NUpjUaqxwp90yhcp03@vger.kernel.org, AJvYcCWgdi4oR+SNBTGeD6IilEf7mviIrTG0f9lnFh9E+DmfpaIt8rZazSDiWeCA8K1+x98wn8joODCZ6/3P@vger.kernel.org, AJvYcCWshKdbzprDwFUNNbvMvjVLKFPhijqCdHtJkBEpmf/ynnA8iPZBekZ+R3dHJ3Q3F3FG4zvd1B5FbJNmgbZCmGnfMyQ=@vger.kernel.org, AJvYcCX2fq5Q6nav2/3jXEI9TKu0/x2TOG7f/N/oj+mEw/Y2fBAct9Ux1bzfyD3moFeQ2g8W1eXsIeedZMqK@vger.kernel.org
X-Received: by 2002:a05:6358:d39c:b0:1ca:9660:67db with SMTP id
 e5c5f4694b2df-1cab1692c19mr572203255d.23.1732806462023; Thu, 28 Nov 2024
 07:07:42 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20241126092050.1825607-1-claudiu.beznea.uj@bp.renesas.com> <20241126092050.1825607-11-claudiu.beznea.uj@bp.renesas.com>
In-Reply-To: <20241126092050.1825607-11-claudiu.beznea.uj@bp.renesas.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Thu, 28 Nov 2024 16:07:30 +0100
X-Gmail-Original-Message-ID: <CAMuHMdX9ZB5ec4g+Gs37U+oH4XPDv8DLoA63oxh4o8gj-N+sNw@mail.gmail.com>
Message-ID: <CAMuHMdX9ZB5ec4g+Gs37U+oH4XPDv8DLoA63oxh4o8gj-N+sNw@mail.gmail.com>
Subject: Re: [PATCH v2 10/15] phy: renesas: rcar-gen3-usb2: Add support for PWRRDY
To: Claudiu <claudiu.beznea@tuxon.dev>
Cc: vkoul@kernel.org, kishon@kernel.org, robh@kernel.org, krzk+dt@kernel.org, 
	conor+dt@kernel.org, p.zabel@pengutronix.de, geert+renesas@glider.be, 
	magnus.damm@gmail.com, gregkh@linuxfoundation.org, 
	yoshihiro.shimoda.uh@renesas.com, christophe.jaillet@wanadoo.fr, 
	linux-phy@lists.infradead.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-renesas-soc@vger.kernel.org, 
	linux-usb@vger.kernel.org, Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Claudiu,

On Tue, Nov 26, 2024 at 10:21=E2=80=AFAM Claudiu <claudiu.beznea@tuxon.dev>=
 wrote:
> From: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
>
> On the Renesas RZ/G3S SoC, the USB PHY has an input signal called PWRRDY.
> This signal is managed by the system controller and must be de-asserted
> after powering on the area where USB PHY resides and asserted before
> powering it off.
>
> The connection b/w the system controller and the USB PHY is implemented
> through the renesas,sysc-signal device tree property. This property
> specifies the register offset and the bitmask required to control the
> signal. The system controller exports the syscon regmap, and the read/wri=
te
> access to the memory area of the PWRRDY signal is reference-counted, as t=
he
> same system controller signal is connected to both RZ/G3S USB PHYs.
>
> Add support for the PWRRDY signal control.
>
> Signed-off-by: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>

Thanks for your patch!

> --- a/drivers/phy/renesas/phy-rcar-gen3-usb2.c
> +++ b/drivers/phy/renesas/phy-rcar-gen3-usb2.c
> @@ -707,6 +718,55 @@ static int rcar_gen3_phy_usb2_init_bus(struct rcar_g=
en3_chan *channel)
>         return ret;
>  }
>
> +static void rcar_gen3_phy_usb2_set_pwrrdy(struct rcar_gen3_chan *channel=
, bool power_on)
> +{
> +       struct rcar_gen3_pwrrdy *pwrrdy =3D channel->pwrrdy;
> +
> +       /* N/A on this platform. */
> +       if (!pwrrdy)
> +               return;

This cannot happen?

> +
> +       regmap_update_bits(pwrrdy->regmap, pwrrdy->offset, pwrrdy->mask, =
!power_on);
> +}
> +
> +static void rcar_gen3_phy_usb2_pwrrdy_off(void *data)
> +{
> +       rcar_gen3_phy_usb2_set_pwrrdy(data, false);
> +}
> +
> +static int rcar_gen3_phy_usb2_init_pwrrdy(struct rcar_gen3_chan *channel=
)
> +{
> +       struct device *dev =3D channel->dev;
> +       struct rcar_gen3_pwrrdy *pwrrdy;
> +       struct of_phandle_args args;
> +       int ret;
> +
> +       pwrrdy =3D devm_kzalloc(dev, sizeof(*pwrrdy), GFP_KERNEL);
> +       if (!pwrrdy)
> +               return -ENOMEM;
> +
> +       ret =3D of_parse_phandle_with_args(dev->of_node, "renesas,sysc-si=
gnal",
> +                                        "#renesas,sysc-signal-cells", 0,=
 &args);
> +       if (ret)
> +               return ret;
> +
> +       pwrrdy->regmap =3D syscon_node_to_regmap(args.np);
> +       pwrrdy->offset =3D args.args[0];
> +       pwrrdy->mask =3D args.args[1];
> +
> +       of_node_put(args.np);
> +
> +       if (IS_ERR(pwrrdy->regmap))
> +               return PTR_ERR(pwrrdy->regmap);
> +
> +       channel->pwrrdy =3D pwrrdy;
> +
> +       /* Power it ON. */
> +       rcar_gen3_phy_usb2_set_pwrrdy(channel, true);
> +
> +       return devm_add_action_or_reset(dev, rcar_gen3_phy_usb2_pwrrdy_of=
f, channel);
> +}

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

