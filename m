Return-Path: <linux-renesas-soc+bounces-11222-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 044FA9ECC38
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 11 Dec 2024 13:40:48 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 8CD601884709
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 11 Dec 2024 12:40:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C019C229129;
	Wed, 11 Dec 2024 12:40:37 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-ua1-f49.google.com (mail-ua1-f49.google.com [209.85.222.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EC1921C1F25;
	Wed, 11 Dec 2024 12:40:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733920837; cv=none; b=HbRcUJBUHKPFMRgsVUV3l4GLgtm5Q4pOZXJGwSXvESDMtnkJa1ocfaoR9a0FZo/gW3N7YrNVqM5K9S9e/SXK6soAytAYdzeb/ukcGvMNfGXlf14UJTu14CQHX+ftzbqnL2mXpXBXMiH95CsJmgaJWF1kgcPxR6Rcmpagm8pfxT4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733920837; c=relaxed/simple;
	bh=sOa9ZYz19luc7etTQ3JKpv5rDbIyWNa9v5idrNMbnsY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=UpbwZXTZBL0PXQsJpGYnbzj3nYWZ2CxSSI8Qnu/XQdyXVULpP060a2JffAzc41P2kim5xHBqmoCjsZ3qvMGOim/+eodxCBR5BtTSYm46PmD4VFawPKBywrpl7Fs+RAgOxZjMHq1jUoQIG6QvkqQFPzb+9+g5NY9RNDiq/TboYjc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.222.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ua1-f49.google.com with SMTP id a1e0cc1a2514c-85ba92b3acfso1747376241.1;
        Wed, 11 Dec 2024 04:40:35 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733920833; x=1734525633;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=SIHlUetqmjksC19uBnWgzXydGYYm7SjCWz4dlSQwPww=;
        b=O10lwopRW1yT3Ko8/Ueyvg4FKiE+42qxo1hxvX0zsi7AVEseYro9hRl4yA8fTtU0rt
         ypuz8oZyQH3GPR3uPJvv7KL9IaraJAOfgqu/IOaH0EasTBV4fSBHoo73lrJ4ZNKhHMTA
         Ieq6/gnUYokUNs+xT37Xy9A8yhEKok3apB/ibKzMka7FVi8ne3ChvXE59ee64wE00sNL
         +A8pVjLmEkeIajj2TCshgfo2You0vHTU0q7RUb78Jp/wNbiduR36smgTxOZwc+NMbtYT
         wVYvp/STb7h+pBvJHJwVItKV7HFMAE3xz1KHQxxHa2Hzn8BqQ2PKwHddzgo4L1BN59L9
         gI9g==
X-Forwarded-Encrypted: i=1; AJvYcCU4izEN32P4muoE0gRTsNGrjEZCqx/HrhXyMv9ee5bIN3hiu+SNInsqlaKO+dImyAUt12Pp+4HeOc+f@vger.kernel.org, AJvYcCUAIg+iD7PD3LHS7KL46zLxk/u7ikpDfb6B2xYRUKHMXZVZ+V//X5TFfzj+MSfkh9v43rfNdMY8RfBh@vger.kernel.org, AJvYcCVoOazJQzKIJQ4I7fZvLb39QZLs+zDx4Cr/m2mROZTnwT7RQvVfPaR7e+gXhlWa3FO92tJWEiCKsju+uk2z@vger.kernel.org, AJvYcCWt25UlY011y5pbTYSmhLJqH5Nwq0IiBwbYWjE3O2Lxd2bQY5Y13DomJH+xbZo/jnW37sFx/U9zHiDXfMXWHDbZe74=@vger.kernel.org
X-Gm-Message-State: AOJu0Yxlk9yMf2J2UdGfX7Y72fR7elalx77R9H8v6K6PYWW6UCTxuaPU
	QD6dabpOpKejuIbrJLc6Zyt0ayXclIGCXus5h23ut+lxuUIPLRSduynuwcp2
X-Gm-Gg: ASbGncvL+RiOU+rfcDLx8J0iEHen3j53c91+qwzsiChWueBnMMZI+isiMQGDyOVW78o
	/f9beCTBKsayP/KI+KziuoQVBN1oBnYXm0pi6RNrAIYNZCiZF2RDK00NVyxtul4gWuzUssUu8sR
	zsOpTyJxuMTi51ARmYZmc5Y8zwlwrOq6eg4+3OJNykPXWifEFxDs/OgS9Ba3B+6qhQj2LTgWs4M
	R4hMjVesJYbX1MTboQDDJASnCJ58PC/EXcvRCIwUlZy9lP8BS/w9OlENsJRCcQM/BOMiCxrWT78
	IEJprytsdAPwZlWh
X-Google-Smtp-Source: AGHT+IHBaKNuC17dOvC3yLJOtQ+mIT/iiwHN1oUXnfSOr95UqanfkvOcCdScvOxSTzk3o7CxVi3SlQ==
X-Received: by 2002:a05:6102:5127:b0:4af:f5bd:6376 with SMTP id ada2fe7eead31-4b128fe42a0mr2564430137.7.1733920832860;
        Wed, 11 Dec 2024 04:40:32 -0800 (PST)
Received: from mail-vs1-f42.google.com (mail-vs1-f42.google.com. [209.85.217.42])
        by smtp.gmail.com with ESMTPSA id ada2fe7eead31-4afda73c931sm1355694137.24.2024.12.11.04.40.32
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 11 Dec 2024 04:40:32 -0800 (PST)
Received: by mail-vs1-f42.google.com with SMTP id ada2fe7eead31-4b10e0654afso1836690137.2;
        Wed, 11 Dec 2024 04:40:32 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCVHznZ3u9zm/97E63AqU6jJUOPSF01ulkctZFT0vJYoZejRVYWZJZz/sszLX3Qyriht7M3wkz/yB5L/@vger.kernel.org, AJvYcCWBMlXDwXQQ4wFO3ToOeUCntUAArM7ooxr3uQtWn3buFm5CRXZmYZBBUDJLajv6vEEyRqmi1vI+h/biLcxlFc/T3B0=@vger.kernel.org, AJvYcCWr7LMms7n9zXt/qVTMZg9F430KPkYxmr0rMowJbx97NY7ns8oiiJmbOuDc/lZUGBcQrIxi7/LoU+1bCdFP@vger.kernel.org, AJvYcCXqOWJM3ydpXPkAfC3+ThkSbKitVLYWaZTNigQvCuuxmafcSrGxwkDuzAox+X0zgJC8qh+5hGzxrmoF@vger.kernel.org
X-Received: by 2002:a05:6102:c12:b0:4b1:1eb5:8ee5 with SMTP id
 ada2fe7eead31-4b1291b564bmr2335034137.25.1733920832133; Wed, 11 Dec 2024
 04:40:32 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20241210170953.2936724-1-claudiu.beznea.uj@bp.renesas.com> <20241210170953.2936724-21-claudiu.beznea.uj@bp.renesas.com>
In-Reply-To: <20241210170953.2936724-21-claudiu.beznea.uj@bp.renesas.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Wed, 11 Dec 2024 13:40:20 +0100
X-Gmail-Original-Message-ID: <CAMuHMdWK=jkf8eLcapRcNhyBissDJJ0YdFMP2vKW9zqYVkv5Lg@mail.gmail.com>
Message-ID: <CAMuHMdWK=jkf8eLcapRcNhyBissDJJ0YdFMP2vKW9zqYVkv5Lg@mail.gmail.com>
Subject: Re: [PATCH v4 20/24] arm64: dts: renesas: r9a08g045: Add SSI nodes
To: Claudiu <claudiu.beznea@tuxon.dev>
Cc: mturquette@baylibre.com, sboyd@kernel.org, robh+dt@kernel.org, 
	lgirdwood@gmail.com, broonie@kernel.org, magnus.damm@gmail.com, 
	perex@perex.cz, tiwai@suse.com, p.zabel@pengutronix.de, 
	biju.das.jz@bp.renesas.com, linux-renesas-soc@vger.kernel.org, 
	linux-clk@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, alsa-devel@alsa-project.org, 
	Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Dec 10, 2024 at 6:10=E2=80=AFPM Claudiu <claudiu.beznea@tuxon.dev> =
wrote:
> From: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
>
> Add DT nodes for the SSI IPs available on the Renesas RZ/G3S SoC. Along
> with it external audio clocks were added. Board device tree could use it
> and update the frequencies.
>
> Reviewed-by: Biju Das <biju.das.jz@bp.renesas.com>
> Signed-off-by: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
> ---
>
> Changes in v4:
> - s/audio-clk1/audio1-clk
> - s/audio-clk2/audio2-clk
> - dropped status for the audio clock nodes
> - collected tags

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
i.e. will queue in renesas-devel for v6.14.

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

