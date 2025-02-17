Return-Path: <linux-renesas-soc+bounces-13213-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id F28D1A382D6
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 17 Feb 2025 13:21:15 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id B501A3AC47B
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 17 Feb 2025 12:21:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 38ABE219EB6;
	Mon, 17 Feb 2025 12:21:03 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-vs1-f43.google.com (mail-vs1-f43.google.com [209.85.217.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EB2A5218AD8;
	Mon, 17 Feb 2025 12:21:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.217.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739794863; cv=none; b=M1B4sJT9rHPUkfsLdF8cHVez2iXYCvuMnP1GmUu9/09wq+uX+8yK/4TkK+PWeevug0synx8w3/2jC/CIrFA4StIDZskZBfwbJUoYXfyW/4ZoQYadMaehTPIDphCAHXuKv279vO0B4MVUpcFeK0+qLp47pcJtvhLqKyYSmIiTczc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739794863; c=relaxed/simple;
	bh=KZKO3yI9rHTm1wsH4aaUOMVGQq6q+xbCd6zldgqXe34=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Az/QfUX1X650vg7qk8MeNQ4g0htgKnMW/FP8Vt6+Qt4KMEwibOCEYRsaIv/ynFd5Udv3HoctMQyht950cwFHR3JchiFpR5XOZXG4dAAC0uihY/bWDDuNJJLaLZ3k74C/+xzvhFabvcTkZT68Mr3qcKQuIHMrrh61o26n3GLjfdg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.217.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vs1-f43.google.com with SMTP id ada2fe7eead31-4be625c5365so199239137.2;
        Mon, 17 Feb 2025 04:21:00 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739794858; x=1740399658;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=0YIcLF2hVAfrm06lMTPgsuUIRnN4tcIhuSNEw1atqQM=;
        b=Azo/UxielhzaI7fnIj557drSOfFrjRIeKksPt39BGi5/FRIoO0YQbGDzitF0pMrYls
         3HZVsr2q5+pNtiWA8kDn1bYDxIlPgI0lgOgs5HpY1bL32eZZvLJEk0ssS96v2K9i/ZNV
         lyOuBL/93Qy4AUrT81dl0u0l5fRLRZAVe86lK0JVtRVpfTH/PnhA+zklD+ztP2z1L/6Z
         oAZeNCVCKn5IlkUQC2eB8jp1YTuuTlPfLX6aRf/EP2tfmsGd36+gmIHTcMsJfiZfub61
         xFa7Hhh9wzPsO2nrasutFvPD9/9Re7uEfykOdp/IwbHXPPBZD8Yt1SnYbCeJ9AcnZJMr
         4/yg==
X-Forwarded-Encrypted: i=1; AJvYcCVCHKprYZslt6f3Sjaj8SrPy4C2Yr+7nadNAmpuUOf/Ffl7wZm7XAGTX47Q+eZsj8g/ajalbt8rMpAV7bImaFM1GxA=@vger.kernel.org, AJvYcCVZGVNq1vof6/x341fKBkKtmCdswB7lvyGT0J08H09RaGdA6iRWD9hvwW3zgV88/9hlL2wNDaWVOG5YxaAA@vger.kernel.org, AJvYcCX06SMtQsJA2Xg4vQ172NUB/AmYxt7W/PzCsP87fbarcN3XZQ4Qa7EH8rzUQPhu22Sh5H14w+2k2wmSa1tG@vger.kernel.org, AJvYcCXX01qQbsmFoJBB7mdJ3yUGBR2mp6U8CfVq8ciF7msSFQO/QbueOXt+uDlniropArNoXoeNadUfHnkM@vger.kernel.org
X-Gm-Message-State: AOJu0YwtdRxsycC0YiQXajDmrDKRkp5r4eqdqMiRwNoxda0zkC0c0w7A
	0Iq7pK0MGC8Xfbd/ZNxrIteDZjWxmkbxd+sevxlsusXUMSCuniNQbYeH5Ur0
X-Gm-Gg: ASbGncshjvY19erkWgIrvjZj+yUKlk9akuvtCfg1L01hk4r11VwYAmfdjrvbhir7qMR
	La/j3kVYnhn6DIt6TYMeCbL8MPqE2+MpCVrXCg6/muBoO+52BdronRd5Sq32Ht/EuqeXK0ddDum
	nwHH51kLujv9ruenScGN7HoKgRVJy1l87OYNacP9pBS5e8HT7Wy59R4hmJuhrLsAU9V3VYgRSym
	B9OAQpdvf7dW8wArOsmxL7mVNXfhPznb6nJRt13YtPPQxhqUOxbLFfpH5JTPtC2reODn/JaNxZk
	LAomtw0e0xBou7ytN4juiHGgvLbUzbjvhjU91LWGagDJ9pC7gqPbGA==
X-Google-Smtp-Source: AGHT+IEHxjlCL1bMk/G2ffaH8Bu/xA4SjiLnbJjuEkTnqDDsltDerwpMcmkQTin+aK5PrYl8zNEXRw==
X-Received: by 2002:a05:6102:2910:b0:4bb:d962:62b with SMTP id ada2fe7eead31-4bd3fe38804mr5086865137.24.1739794858460;
        Mon, 17 Feb 2025 04:20:58 -0800 (PST)
Received: from mail-vs1-f53.google.com (mail-vs1-f53.google.com. [209.85.217.53])
        by smtp.gmail.com with ESMTPSA id ada2fe7eead31-4be1a9a3822sm903549137.16.2025.02.17.04.20.58
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 17 Feb 2025 04:20:58 -0800 (PST)
Received: by mail-vs1-f53.google.com with SMTP id ada2fe7eead31-4be625c5365so199230137.2;
        Mon, 17 Feb 2025 04:20:58 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCUENZ2t5gWiUHEnIzzILnyfzumOouOfwMnfxH9/zgDms58zZCGNKTm13niQ594K/iNM4kA6gEv5fmP5UtjS@vger.kernel.org, AJvYcCUM5bmlpgI6Iy4gc54pqhyO60mQI+IRA4rlU9oJdJrL868MvBVa9CmpQoDxr3w9VhZe3pbD1bpt99mI@vger.kernel.org, AJvYcCWzSgT4R+XC5j3+lX99v7jTA7BHk5xUcmUtAc1+AvqJfqmwu6zmtU7sY5dfIx4yJkLpUx63gO1FpDNm4D7K@vger.kernel.org, AJvYcCXUcRDOa0Q8X6uyp6hXQvJxi/MkS4Sjn+vckKI6xXJ2plddoA2mgH+0ppYKcMrumG13qGik9aiI7mvPrpD1WAhl69M=@vger.kernel.org
X-Received: by 2002:a05:6102:f8a:b0:4b6:8d8b:82c6 with SMTP id
 ada2fe7eead31-4bd3fd51b85mr4616633137.15.1739794857756; Mon, 17 Feb 2025
 04:20:57 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250217105354.551788-1-thierry.bultel.yh@bp.renesas.com> <20250217105354.551788-4-thierry.bultel.yh@bp.renesas.com>
In-Reply-To: <20250217105354.551788-4-thierry.bultel.yh@bp.renesas.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Mon, 17 Feb 2025 13:20:46 +0100
X-Gmail-Original-Message-ID: <CAMuHMdWfTsocOwuqDQZOBN7-wGMrrSc=cfJau+U1tx3Pwe+VHA@mail.gmail.com>
X-Gm-Features: AWEUYZnbIELHIwR1gjlghthSUzY-OPr_rQ25OoJOQ1Rz8hvrqJOq0-gfqoF3U4o
Message-ID: <CAMuHMdWfTsocOwuqDQZOBN7-wGMrrSc=cfJau+U1tx3Pwe+VHA@mail.gmail.com>
Subject: Re: [PATCH v2 03/13] dt-bindings: serial: Add compatible for Renesas
 RZ/T2H SoC in sci
To: Thierry Bultel <thierry.bultel.yh@bp.renesas.com>
Cc: thierry.bultel@linatsea.fr, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Jiri Slaby <jirislaby@kernel.org>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Magnus Damm <magnus.damm@gmail.com>, linux-renesas-soc@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-serial@vger.kernel.org, 
	devicetree@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Hi Thierry,

On Mon, 17 Feb 2025 at 11:54, Thierry Bultel
<thierry.bultel.yh@bp.renesas.com> wrote:
> Document RZ/T2H (a.k.a r9a09g077) in SCI binding.
>
> Signed-off-by: Thierry Bultel <thierry.bultel.yh@bp.renesas.com>

Thanks for your patch!

> --- a/Documentation/devicetree/bindings/serial/renesas,sci.yaml
> +++ b/Documentation/devicetree/bindings/serial/renesas,sci.yaml
> @@ -20,6 +20,7 @@ properties:
>                - renesas,r9a07g043-sci     # RZ/G2UL and RZ/Five
>                - renesas,r9a07g044-sci     # RZ/G2{L,LC}
>                - renesas,r9a07g054-sci     # RZ/V2L
> +              - renesas,r9a09g077-sci     # RZ/T2H

As the RZ/T2H SCI does not work with a generic SCI driver, it cannot
use renesas,sci as a fallback, but needs its own section.

>            - const: renesas,sci            # generic SCI compatible UART
>
>        - items:

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

