Return-Path: <linux-renesas-soc+bounces-11226-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 72AE49ECC6E
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 11 Dec 2024 13:46:15 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 310F41889D8B
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 11 Dec 2024 12:45:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 80F3522915B;
	Wed, 11 Dec 2024 12:43:18 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-vs1-f52.google.com (mail-vs1-f52.google.com [209.85.217.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 01A9F23FD34;
	Wed, 11 Dec 2024 12:43:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.217.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733920998; cv=none; b=JoLL5xRCbSY74GdMlg2p/IF3cT5Q4z3xVVfIxfBxLj5Qbxj/QZy/qAExyoHZr4x2HMo3VtFuA6G1GTsiES67KuQ8fl0ZZmsbRUY4igpeHTT3celG2XWGs3+fS3zKDrA3Nz1IO2BGfznPtBewV0prAOjMy2C5/XYdhnVxGqIdr/s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733920998; c=relaxed/simple;
	bh=Pjzv9rYanq0So6Xz8lRteoxftfHkgIEnaA+sNGK5d1Q=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=sFRIN+Toe4CtIRrQGlnMHjW+JhTifxFTyvLfBCRM9rQ7TMtcoOugMmVzDbOzz1fikk+3fpUXe39uhc9jLhqtF5anVIUxzAbzyWiZjGoNeK8x9RG5Si2YmA1MtYYloEwuvHxsbkF7IbPRxGyNrAPqbh2v+gvN+OQ9djZRttQr4Sk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.217.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vs1-f52.google.com with SMTP id ada2fe7eead31-4b11a11a4f0so662984137.3;
        Wed, 11 Dec 2024 04:43:16 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733920994; x=1734525794;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=TMEcM2Vxiv+upGXTWO8pvAgZSwCW6PcJ5zIP5uxGg5E=;
        b=vSG5EBapsKqXveNIiwwxMg6ZWuy1Cy2mPiT/lgeCH+z3LUJeKk4YAjCAcy4LwgChhm
         gEPhYJfnI0Y5BLXFgcvvup0/X0makREl71ZzQn37iy/nR/ypcIfAz9aKCzaht6WG9NGV
         dVGKRdTCskf3y+JrjEjpIudMCknfHWJZJzVzk6151ffAr507FT2COhB/bM82MCIzvYOD
         SOxU6xEbz204Rq4TSR5kskGVbc/nBLbN7aH5MVFu4YHwcDa+B30Wt9tOl2iq7BWh50YS
         H3nJKcWDWgNdFQ4eOrONVaHoMBa39ffjy46oMJsigDt9VX8wQjGQK6J6HDYjU83K5enI
         mDrg==
X-Forwarded-Encrypted: i=1; AJvYcCUqTT13Qu01iRbxdkWslTAw1TXOk8+1lzgll4PXAtxCbmBF0maH+ocB149CmOm4gzbvItecJLkePa4rq0L095Wpwy0=@vger.kernel.org, AJvYcCWgw2R7X9OK2mQ1B1+lR3IjunTp/q0Fqtn2dKdWN0NteuPWypv2I9ZjO6TMwx2k7/tPqW2vDHIzmcxW6tAc@vger.kernel.org, AJvYcCXNLciKIYwT8tf/vpu1eJ1AvsJwgEIzuGhgBMIQ4gRhHCzNw/iOzjEXxyhUxKKTLClBzk6S7J3pLEpR@vger.kernel.org, AJvYcCXY5qFadah8IL1iWHq7PdE0W53VMsMmleVxONe00cUp1O4hasXgkUPDmKxzAtD9C0uhw9M4fHZQhYDL@vger.kernel.org
X-Gm-Message-State: AOJu0YxEy57tr48QI+6MM5iK1Qj8E6ErIWILSen6ImAUTCZek5HXRmRQ
	KJFVDXccFjx/aRAzRs9GLc+hZiQ2EzjdkOrk5YtRFhqS+ZHuwldsH1HNeNVW
X-Gm-Gg: ASbGncvY73zGw1hlhnA9VlF5AhpkrCzOil90wo5/eaXE/JuOW3QhW4upDFR6mHpWLng
	BRXf3ieHCbs/m6InRe49vB7yw2Tz3FjYdXr3T4RqPnsEBhpBs29sR5c3wzb18b3Dpiez6F+z13g
	zYe7H5r0m8g9zTvsRhnaOKYwhdvqerKxPV6QoHUSAr18senP1eN0vZ1wR69hX28wct19usOK/XZ
	Q4wxWDUHNDUORumx0QsAU9VFMNdELmM27zpf4B8JqRjb+NaEEPD+9223cnPWFBcJKU89je9Ites
	AHiSNKxNqss8dtHw
X-Google-Smtp-Source: AGHT+IEo35NpT0A1qvoR0WVAWsXQOD8sI2uSHQOi2FjNpMyieZUY4Q7AbIvvkxBIKWAWh45wWIU72Q==
X-Received: by 2002:a05:6102:3ec8:b0:4af:be6e:f0aa with SMTP id ada2fe7eead31-4b1291b9832mr2124770137.25.1733920994386;
        Wed, 11 Dec 2024 04:43:14 -0800 (PST)
Received: from mail-vs1-f46.google.com (mail-vs1-f46.google.com. [209.85.217.46])
        by smtp.gmail.com with ESMTPSA id ada2fe7eead31-4afd95c33f2sm1199979137.9.2024.12.11.04.43.13
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 11 Dec 2024 04:43:13 -0800 (PST)
Received: by mail-vs1-f46.google.com with SMTP id ada2fe7eead31-4afeb79b52fso1041721137.0;
        Wed, 11 Dec 2024 04:43:13 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCUR8xblPt0aspN049TSaFcGs/MzrzOW8zg5w/RpA2rQBDbZ7bN2trJ0dvCqXQ0cU4A6/fpxE1PZOyxS2dMS@vger.kernel.org, AJvYcCX2w3UKWDe2kFqOaeYRmJRLM0wt/wFP/rgcNHEf99JFBQsM35UOzJuHCc7PGRdP9nLtnF4kp6MVh0Ub@vger.kernel.org, AJvYcCXSVhd72xZJ5AK5/lmGlA3iTKzff7ZhPQzGGnQbroC4n7aFmBFr2HCADL80ykyxphHvUKw5xJu4I0E9@vger.kernel.org, AJvYcCXdqn0NX4jeeeboi9hN8h1xb+kXDsJIYG/zJZSBh3Xx8oZ+RM7Lef4zvJCKMpC7FfJOlG0AKBNx2aU75vy7FIdBo5M=@vger.kernel.org
X-Received: by 2002:a05:6102:a49:b0:4b1:1b24:7241 with SMTP id
 ada2fe7eead31-4b12904a4b3mr2174344137.15.1733920993297; Wed, 11 Dec 2024
 04:43:13 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20241210170953.2936724-1-claudiu.beznea.uj@bp.renesas.com> <20241210170953.2936724-25-claudiu.beznea.uj@bp.renesas.com>
In-Reply-To: <20241210170953.2936724-25-claudiu.beznea.uj@bp.renesas.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Wed, 11 Dec 2024 13:43:01 +0100
X-Gmail-Original-Message-ID: <CAMuHMdUOHX2dCmPBBarPoPC879zEt9QsWC_iKerm9pesH_MHdA@mail.gmail.com>
Message-ID: <CAMuHMdUOHX2dCmPBBarPoPC879zEt9QsWC_iKerm9pesH_MHdA@mail.gmail.com>
Subject: Re: [PATCH v4 24/24] arm64: dts: renesas: rzg3s-smarc: Add sound card
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

On Tue, Dec 10, 2024 at 6:11=E2=80=AFPM Claudiu <claudiu.beznea@tuxon.dev> =
wrote:
> From: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
>
> Add sound card with SSI3 as CPU DAI and DA7212 as codec DAI.
>
> Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
> Signed-off-by: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
> ---
>
> Changes in v4:
> - collected tags

Thanks, will queue in renesas-devel for v6.14.

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

