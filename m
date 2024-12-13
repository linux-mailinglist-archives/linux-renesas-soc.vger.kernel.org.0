Return-Path: <linux-renesas-soc+bounces-11281-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id F236F9F0937
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 13 Dec 2024 11:14:33 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 1A973164A0F
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 13 Dec 2024 10:14:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5227A1B415F;
	Fri, 13 Dec 2024 10:14:31 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-vs1-f46.google.com (mail-vs1-f46.google.com [209.85.217.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0EB7D1420A8;
	Fri, 13 Dec 2024 10:14:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.217.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734084871; cv=none; b=elYulZk7VhSY0EmJNUaalmvu+e8jLKGwdHX7tCNvVR7Ed6T+8//uX0XDhvbii/aUFTKZgbwQhQ1VstvcOUNMz1646wSFdereqP1M6LlmAzaRSiUt71KUlRZz2QV5CYell9N0F8Vk6VeqyAdGRE9gr1I9XCF0HkLpPYbA6XEandg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734084871; c=relaxed/simple;
	bh=HZS4/N3UC+HRatg5dCf21TeFnkCBeNVHiXgqn8YyDow=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=tiFLqZvONogVNU9PT2xYv4QWEq8qHCWAuqIQPbZo1J2SgNurts6Y+aIld6AcGedsPHYseDNTL3zesmLFgHXQLlcCOCehGKF4QjolVQ6BqguYx3wmKJ9trdxobyxW+t2gBHxRMfYbQR/xBOPopxs1wBPqwxbOj0oRV1+3hrdT19c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.217.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vs1-f46.google.com with SMTP id ada2fe7eead31-4afed7b7d1bso375470137.2;
        Fri, 13 Dec 2024 02:14:28 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734084867; x=1734689667;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=jtMAPHEGtEupo0IcLVLh7mDcYFioW0IfZvVBEFwV6Gs=;
        b=eLlI2TEBHIXt87ere8pxpYrwaYa6BW9sSGiN9bzuqMAfduLaWPsc/qMhSEtaGQGv/K
         1ztM0+7pyKKKVb4yzU5VDOPyrqdbsK1LNcSwucZYVZW5y9se3/Mc8uru6OBT2qONFTK+
         v5cnqC0DcTUiEvDaY/EiAwxIo4Osbmd3FpwhC3KrWPmXz6w5+BevtVHDooIF/FzAurCk
         N6OILvog/QCMbaORaclDgWl0u8IZL+pwtgf+NstHywV89XuWIdWFf1NcCCCYMc4eirzJ
         b1uPnc+GmDqCQ50hThpJDem2c9lKTwm6m1r8eygazR9WrvfOa5eqwOj3+Kz8FeB3hBzC
         qC/A==
X-Forwarded-Encrypted: i=1; AJvYcCWKzRmMhbp1hMYewrR7qyj5BIDURF3LyS6arYLrjwC2ObStLNJgT2rpji1+8uGBxBySehXNS8yQgh0HgTpJ9SD7TNg=@vger.kernel.org, AJvYcCXmxaS0dQoRTwBADMfeuPKpwYVPLmXxMx0OYhddY8jZ3QYVMQnAotmlGw7fx52uXMyuYh8Mwe7tebXK@vger.kernel.org
X-Gm-Message-State: AOJu0Yy5F4/FVA4d/HyhIvsWX3rcDsGzOMHtYfAtgqZZy/Vy8+IfJ079
	Yebwc2iiINXchilH0ROs5zgBuZJKUSUyKkGhKkaIT8rmalPorU4qidyNY0BG
X-Gm-Gg: ASbGncu1NA+p0khcPAXM8T3mnD23pWY41AllAH6XqrHmuiPFvC3nToZww77Iosw1WIs
	Fy8zT9NbodWDB3x6ZYeXC/6+fOsA08E8qftifgFING1C7WjH4bP0vWUuhZeVQUk3lRJLOoN3U9L
	kfJmMmopYYBvhqtQD7JQ0VcEZUx8xH7/3ogxs6sVF+MRuKH6oOGV/akeCEteih49/w3sRfp0dG3
	e3AC3vI6YO5JaWYX6h12tUcZe30EdPbXfq+xQh+i35joGdqjE+i3YsVJ0PfnFGmvLanmyCMjxBS
	lF8fGCrquGj12UF4iK0=
X-Google-Smtp-Source: AGHT+IGGl98s7xeaeiwXvuRqgDQz3v8bT3rRkb+NutSet528kjRREWpUVZeHqHWru210f4zisuZsmg==
X-Received: by 2002:a05:6102:8090:b0:4b2:48f8:b5b0 with SMTP id ada2fe7eead31-4b25dc8cd96mr1891850137.10.1734084867570;
        Fri, 13 Dec 2024 02:14:27 -0800 (PST)
Received: from mail-vs1-f43.google.com (mail-vs1-f43.google.com. [209.85.217.43])
        by smtp.gmail.com with ESMTPSA id a1e0cc1a2514c-85c56a6da7esm1944490241.34.2024.12.13.02.14.27
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 13 Dec 2024 02:14:27 -0800 (PST)
Received: by mail-vs1-f43.google.com with SMTP id ada2fe7eead31-4afed7b7d1bso375459137.2;
        Fri, 13 Dec 2024 02:14:27 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCU1vKdA01ujBpQHl7xoLSDMzC/VCkwmP14cS6kn+D4XzoMIgToxuYCHvwWOyL8Dk/TecwAPBYsGUNUp@vger.kernel.org, AJvYcCUMfZXuQIFNX8Gkp9KrkNdiNu2XgKC+jKl9QZaVdoEWpwL7oRG0/EmgiwpWHgBSlsU+9NFB+20CIew8gfCi7CjlzVI=@vger.kernel.org
X-Received: by 2002:a05:6102:4b13:b0:4b2:48cc:5c5a with SMTP id
 ada2fe7eead31-4b25dccbf77mr1713280137.15.1734084867217; Fri, 13 Dec 2024
 02:14:27 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20241023154643.4025941-1-niklas.soderlund+renesas@ragnatech.se> <20241023154643.4025941-3-niklas.soderlund+renesas@ragnatech.se>
In-Reply-To: <20241023154643.4025941-3-niklas.soderlund+renesas@ragnatech.se>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Fri, 13 Dec 2024 11:14:15 +0100
X-Gmail-Original-Message-ID: <CAMuHMdXehxafA6Xt2i4TE7CDboKEvaqM_Do1NrQaNNnhxncG+A@mail.gmail.com>
Message-ID: <CAMuHMdXehxafA6Xt2i4TE7CDboKEvaqM_Do1NrQaNNnhxncG+A@mail.gmail.com>
Subject: Re: [PATCH v2 2/2] arm64: dts: renesas: falcon: ethernet: Describe
 PHYs connected on the breakout board
To: =?UTF-8?Q?Niklas_S=C3=B6derlund?= <niklas.soderlund+renesas@ragnatech.se>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, linux-renesas-soc@vger.kernel.org, 
	devicetree@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Oct 23, 2024 at 5:47=E2=80=AFPM Niklas S=C3=B6derlund
<niklas.soderlund+renesas@ragnatech.se> wrote:
> Describe and connect the five Marvell 88Q2110 PHYs present on the Falcon
> Ethernet breakout board.
>
> Signed-off-by: Niklas S=C3=B6derlund <niklas.soderlund+renesas@ragnatech.=
se>
> ---
> * Changes since v1
> - Remove the specific "ethernet-phy-id002b.0980" compatible value and
>   depend on the MDIO bus properly probing the PHY.

(this time on the correct patch, instead of a duplicate tag on the first on=
e)
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

