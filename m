Return-Path: <linux-renesas-soc+bounces-21319-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 24006B4367D
	for <lists+linux-renesas-soc@lfdr.de>; Thu,  4 Sep 2025 11:02:31 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 28A6A17AD6F
	for <lists+linux-renesas-soc@lfdr.de>; Thu,  4 Sep 2025 09:02:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9206C2D3EFC;
	Thu,  4 Sep 2025 09:02:25 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-vk1-f180.google.com (mail-vk1-f180.google.com [209.85.221.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F10202D321B;
	Thu,  4 Sep 2025 09:02:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756976545; cv=none; b=XeT/0hPwHXo0Vgk8dyjT4rZuLC5P1oQXV7Z/YCaK+Vc2leIE1yvUyLK7elWy8miwycRtk3VD6mh9LNMqdPel155q4FAKUuWHNwKO27oMqCA7mysloQJMHxc5E2JQ2Ro4T0ei0GmjMOX7KKT687Mc1fnOMWpuH4SDfEsl468hFng=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756976545; c=relaxed/simple;
	bh=V3Pil8R+isTXfgImi13oxse9wTcVfWEdzYDNadaKKOE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=k2M1+BxKQJ1kzt/mmVZAJoelTpurLbjvMbzoZsrfWy2Ht9thLnUqMNjdEI7TOQFoheUbKN6cxJsp7PAtmk9mlYIKP+/+7UYxcpLk7Novx14itH1jw4d7A6guFqPdcWDaeFFrhaoqBVa5N3CjchWwnTHsn8NZLP/h/vRbbqxH4NY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.221.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vk1-f180.google.com with SMTP id 71dfb90a1353d-544aa9b536eso623251e0c.3;
        Thu, 04 Sep 2025 02:02:23 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756976543; x=1757581343;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=qpc7710X32n/a9Pna2fxDP8q3RBO2d1XgJPIooR9dZw=;
        b=XwyVNcITuNT6a68Bu7J0poYI9VyVZLAYqgjK2DnLSpTpB9c+/gHlbNSkDgAGNZNVVu
         3TOIAVoqh+6ZbKA/CmTLmJKkbP5zKuK69EZq0gvYWSDe9wRR/TTrfCq771NGoq8pgNxy
         /dwT/lpwzmUe5lcfi76EPpEve+s1csmsjB8arsLElstNijcg2nKNchUcNdw2dGraDTiO
         027svDgfM8BrAYjGQr+ZxLdS4A7+khcyQ4v9vTjqfB3J16PDMQTVzxtBpcx7AuZ3lFx0
         JJFJBE6cyRNrOjt2n3Zj6dFtxipen4xMz8J7/RinJUYMjQk3OJPYytS/YeErtqi+0vq0
         Rqdg==
X-Forwarded-Encrypted: i=1; AJvYcCVrbTQ1KquhFhHFpRsZza0Mq5wbDfXLHN+LVr6Ixn7+/kU0wanZ2c2zxYTrxiJejcT1U7Aboagtj1LHjatq@vger.kernel.org, AJvYcCWGwzcvZrq2UZAzGZ4zMXch0te4BcCk68AcdlTpZS6goBt4CscAmZBq7y3axCrxh0llUPhRCYvrpF1WnynzQ3p08L0=@vger.kernel.org, AJvYcCXPZK9A5JREPHXz/TqL37OFMDbscrERvgzoQOGkrpJ0m40wCaXzbL4XdRcHJQLbzcskFyCjgQD5lFNW@vger.kernel.org
X-Gm-Message-State: AOJu0YyruYrdmp7P3oTLAupzk+N3mKslV1KUtswTP0K2VWrwEqBAAguD
	g51fcsTQZ1HhZsf089S1gJEqS9exU70PrH4UokSGMHSTPvjYsyw89E4ww49Z36d9
X-Gm-Gg: ASbGncuu+Z4VUcqzHaKm29bsnjklfXdZQz7VvrqgPK+KWYv9BkmTihDjjY2yueUqHRA
	CWk910wUz5Tf5vKF8tX4iAMKD+POyAyyAIcDqj0JkKZHNpFttQJ426TnlS02e839jBULkObT7+x
	NOwdTTsLFd6OKLF0Xq1XidAJGsqRi1O3ZnTnB1ilO/9QdYRyspYgEksjSy5lEZLIRUz12tg8TWg
	nTE+/uxEyQ07GHj+Y4npKBfu3g2TkCriR2VdHFdzS05A4/MTCpuNJdqFlggrg2g+25JtvNo7dTn
	1iKr25eqxOmVtFWmPzvNuxjGhUDpY4AwjPpsvV6VudEQwxAWyPjYgjCQTUvklwqe/83dVjNrAPc
	5V8mFJ964eYkwjSpPlh6df4SLdojlYZUjefb+3BNcIpV/jcfuD+4tmqx2W6nn1SDQnR6ZsN7wjK
	aDID7rbg==
X-Google-Smtp-Source: AGHT+IHgApMkHYKAOreSBFnXH6HF32gw392iK4eQBithRX2x4Dfn6bgZpAWQDVlyJP9h9meniuyv6g==
X-Received: by 2002:a05:6102:5f04:b0:520:3f1a:c533 with SMTP id ada2fe7eead31-52b1b91e423mr5493687137.21.1756976542742;
        Thu, 04 Sep 2025 02:02:22 -0700 (PDT)
Received: from mail-ua1-f45.google.com (mail-ua1-f45.google.com. [209.85.222.45])
        by smtp.gmail.com with ESMTPSA id a1e0cc1a2514c-899c47af508sm2285713241.11.2025.09.04.02.02.22
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 04 Sep 2025 02:02:22 -0700 (PDT)
Received: by mail-ua1-f45.google.com with SMTP id a1e0cc1a2514c-895fc1c8f05so543448241.3;
        Thu, 04 Sep 2025 02:02:22 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCWuxGgwBlnRB8amAVLYJcwB4Tx6zK6smanPhWVhmqAXgGsD7Ez3McZRl4r5rxU4CPtA6XEyZ+EnD9zz@vger.kernel.org, AJvYcCWxzRt36gelSLox8jepuJ0re5j6wREra3LaxRymTbJhvGJlWtlQZ2koBsfcLqeH3zrFMSvq07au+fUgVWvG@vger.kernel.org, AJvYcCXtK9UD2nIoTPSG0WWnf91UnRa4gAFFeji68slwlmPyby83zzU23TKUurFo9Vzj+Xt1rEU7M5qbw4EMa/AFrVJwKEQ=@vger.kernel.org
X-Received: by 2002:a05:6102:38cb:b0:51a:4916:c5f0 with SMTP id
 ada2fe7eead31-52b1c887eafmr6489993137.32.1756976541801; Thu, 04 Sep 2025
 02:02:21 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250821161946.1096033-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <20250821161946.1096033-5-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <CAMuHMdWPst=JAbyL43SZAHTrCR=wajs15JZXCH4kmM41cdAh5w@mail.gmail.com> <CA+V-a8thD8ALr+tzyBC9kjuTw4iLbSn2UBLJC+zgo+HCa6yN+A@mail.gmail.com>
In-Reply-To: <CA+V-a8thD8ALr+tzyBC9kjuTw4iLbSn2UBLJC+zgo+HCa6yN+A@mail.gmail.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Thu, 4 Sep 2025 11:02:09 +0200
X-Gmail-Original-Message-ID: <CAMuHMdW_=ZQjPODqcsj-TBi6R-veN-d6zHAi-c18UQEoR+aDGw@mail.gmail.com>
X-Gm-Features: Ac12FXweDeX0WLX9YUhleAO6cf7ji5ohEuy-e5RUCWA7zOg55oknvr6I5-LJl6U
Message-ID: <CAMuHMdW_=ZQjPODqcsj-TBi6R-veN-d6zHAi-c18UQEoR+aDGw@mail.gmail.com>
Subject: Re: [PATCH 4/6] arm64: dts: renesas: r9a09g077: Add USB2.0 support
To: "Lad, Prabhakar" <prabhakar.csengg@gmail.com>
Cc: Magnus Damm <magnus.damm@gmail.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	linux-renesas-soc@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Biju Das <biju.das.jz@bp.renesas.com>, 
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>, 
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, 3 Sept 2025 at 16:51, Lad, Prabhakar <prabhakar.csengg@gmail.com> w=
rote:
> On Wed, Sep 3, 2025 at 3:05=E2=80=AFPM Geert Uytterhoeven <geert@linux-m6=
8k.org> wrote:
> > On Thu, 21 Aug 2025 at 18:19, Prabhakar <prabhakar.csengg@gmail.com> wr=
ote:
> > > From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> > >
> > > Add EHCI, OHCI, PHY and HSUSB nodes to RZ/T2H (R9A09G077) SoC DTSI.
> > >
> > > Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com=
>
> >
> > > --- a/arch/arm64/boot/dts/renesas/r9a09g077.dtsi
> > > +++ b/arch/arm64/boot/dts/renesas/r9a09g077.dtsi
> >
> > > +               hsusb: usb@92041000 {
> > > +                       compatible =3D "renesas,usbhs-r9a09g077";
> > > +                       reg =3D <0 0x92041000 0 0x10000>;
> >
> > "0x1000", as the region starting at 0x92043000 is marked reserved?
> > I can fix that while applying.
> >
> Ouch agreed, thank you for taking care of this (also for RZ/N2H patch).

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
i.e. will queue in renesas-devel for v6.18 with the above fixed.

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

