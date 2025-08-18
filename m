Return-Path: <linux-renesas-soc+bounces-20628-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 8A428B2A762
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 18 Aug 2025 15:52:32 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 5ABC56E0934
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 18 Aug 2025 13:45:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0F81131E101;
	Mon, 18 Aug 2025 13:44:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="DONGjlCl"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-wr1-f54.google.com (mail-wr1-f54.google.com [209.85.221.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 44AEC31AF3A;
	Mon, 18 Aug 2025 13:44:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755524661; cv=none; b=YyYmSDM7GPoiErfJWv5JH0iBPjoJcZy9jz7jADCm4ipm5v+ugxBNQ6MiF20RmxYY7l1EF5xR987fDfVLf6SXv3ywcbJ8X9VeV5yk78KYX6JW8pYlqml/A6sOMfkODC8+5eDIn1g3jBOKP37lZyCFChMQYC4HgffAu3NFK5y3xaw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755524661; c=relaxed/simple;
	bh=pIZnCTtl+oja/frA9Sz2wT+DxHf6lpRd8wPl+S40zHw=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=mVYqfaivVG62iLwz13XfGhdutFqpl+ZREnBJR7Ml4fa/is6bwisEZBgeaj6epkeZPONXK7x6FNP4oT/QEmWGhx69rIjzLXhLUgctscTl5nTw/2lQU4f0dAsu9/jlm0xZOro5x5YDnyt+VaGlG/FN0RrzD+MA3Uq/AOUVONHGab8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=DONGjlCl; arc=none smtp.client-ip=209.85.221.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wr1-f54.google.com with SMTP id ffacd0b85a97d-3b9e414252dso1967952f8f.3;
        Mon, 18 Aug 2025 06:44:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1755524658; x=1756129458; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=SiEVHskzF1eg+qdMYnVzuXxMv6Gbw4mlKEHXA1k+p/Q=;
        b=DONGjlClCnVZyAWEI67Y9JSmvDnRwqkIQ1lk2u0H9aUQOcexzOWr3wFQPFF3h6+udr
         E0iC8IFM8SkbLnWiUfdM3ifD1RKJYz5VAkItzsHtt6pqM+j9GNmR2jcdFG3/yjNFVzGO
         qA7WGmnCZzM7DIUVI/GvsnGzyrUewGN4/ODf4BDOJ8+bO45B7uY7Mh0m1izVQqxXra0E
         /EWLB0IhoVBlGj6tD8YyReFQoe5FekMN4HmdUv2WJQJu8SV7tualrde8x/0qZtRCGpei
         gDNhoaimzxYCzHpNGpmbq7TWBDHxFTUaTGIDlV6V9/sASPDazZD0b3cps74ibFi2heau
         2ZiQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755524658; x=1756129458;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=SiEVHskzF1eg+qdMYnVzuXxMv6Gbw4mlKEHXA1k+p/Q=;
        b=fu/NPJuAVsh8F9fLnCk+L+666XBwQNU1d0DieZeKySbMetiGlh2+cIoLBmkflGXSYu
         +mb1DtTpTmz2gENbM2OXRv5Es63KSih4EXjwWn66rIzpR51rU+qWqmiElF7ePmWjvP7a
         pZhPwOqP44f5xRlSmc7MuMSNLv25ix//d0Obt5PvEF9sDnr9MBo3Vb3eSdyVJ0d2c0o2
         DMuanrhiM/W6LsSO4gz0hICO4kghl7eJ++VkFm0uslrgToOo0qRFAnDwdktVuDiBVfl2
         sLA8gPyNhg0WqoIHW5kWQhCsrCclEU/ugtCORzdBLZi8vtMe/TzHFjdksC80jO+I2bfr
         wzjA==
X-Forwarded-Encrypted: i=1; AJvYcCVKLhFsrZJqhRugP/lo2dLWHgNZ+bFd8skVX4KenbXMDVjZibekyZV/bAKI73uwvjOmIFXZo8Uf3BXW@vger.kernel.org, AJvYcCX7+/+WWUxmkKbimMDrSkzBMO/3iTeLoHo8SNj9kww9le/yrB8MJE+x5zD7aFHx7T5aOhz1HuXAv4ShA0wx4PVaGLM=@vger.kernel.org, AJvYcCXOheg9z4/5LmdIwgR9QaCsZXfNo3ygxItOIHZqruxVEm5FsIMNv49NNazDY9ntRuedocnHCaYjZs1NL11v@vger.kernel.org
X-Gm-Message-State: AOJu0YygQzS1AxkWli3dUTJ+LADeLBW9Gy4Gi54G23oOBuCba14I8Gl0
	d/yChBSTtBKTd81/tW3CoDK6sGGLc0iiwKlbjJ+5zFqhn4qceosQigFHsSi6XkV/ZeXbHx8s6j8
	ngI8uo/QeFCkDt5GeGT6icgjMVpuwt3s=
X-Gm-Gg: ASbGncsCil9hO4n9s1q7kzlS3oXBP4NAKqweTALAB9bePZxi6hZLRbow/hwq1I0R5yc
	1vXtIww5r6GmH1mUslAXon5tbJZrornihsm+1fySE4grkXbQd/ZI2ojGQJ0o+yoR6o6H3xfQHEE
	wkVKGCurI4IATdb4EMgNG6U7/pkiduyywcLTAF7KkyS5WwGcUU0kukI4OdgHxddQyrSQLSzMhbU
	7c3Cqqi
X-Google-Smtp-Source: AGHT+IGEZRZJuCsQmh+GGeOLEN/OTrXJw0LxVaX0n2noAUCzpe61aoMgbS52ARL9CNtZasK+JzTQ+K6fJXYOlMI5UN8=
X-Received: by 2002:a5d:64e9:0:b0:3bb:2fb3:9ce8 with SMTP id
 ffacd0b85a97d-3bb68a16ea2mr7880821f8f.30.1755524658087; Mon, 18 Aug 2025
 06:44:18 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250812200344.3253781-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <20250812200344.3253781-5-prabhakar.mahadev-lad.rj@bp.renesas.com> <CAMuHMdX=8rdWHyTpUmreOy5Nf-kiAoQMVakU051AyC2BoVP8vA@mail.gmail.com>
In-Reply-To: <CAMuHMdX=8rdWHyTpUmreOy5Nf-kiAoQMVakU051AyC2BoVP8vA@mail.gmail.com>
From: "Lad, Prabhakar" <prabhakar.csengg@gmail.com>
Date: Mon, 18 Aug 2025 14:43:50 +0100
X-Gm-Features: Ac12FXwREzTEEJN9Bi9j3LYwbmIYhN6Bv0d3u42rM5WXlOcyxKppBQ5xr4C3MMk
Message-ID: <CA+V-a8tk8FJoynigy0JSWbb7x-BOjUEuzC9fYY0wC+GQKCRiBA@mail.gmail.com>
Subject: Re: [PATCH 04/13] arm64: dts: renesas: r9a09g087: Add pinctrl node
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: Magnus Damm <magnus.damm@gmail.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	linux-renesas-soc@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Biju Das <biju.das.jz@bp.renesas.com>, 
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>, 
	Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Geert,

Thank you for the review.

On Mon, Aug 18, 2025 at 2:34=E2=80=AFPM Geert Uytterhoeven <geert@linux-m68=
k.org> wrote:
>
> Hi Prabhakar,
>
> On Tue, 12 Aug 2025 at 22:03, Prabhakar <prabhakar.csengg@gmail.com> wrot=
e:
> > From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> >
> > Add pinctrl node to RZ/N2H ("R9A09G087") SoC DTSI.
> >
> > Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
>
> Thanks for your patch!
>
> > --- a/arch/arm64/boot/dts/renesas/r9a09g087.dtsi
> > +++ b/arch/arm64/boot/dts/renesas/r9a09g087.dtsi
> > @@ -5,6 +5,17 @@
> >   * Copyright (C) 2025 Renesas Electronics Corp.
> >   */
> >
> > +#define RZN2H_PINS_PER_PORT    8
> > +
> > +/*
> > + * Create the pin index from its bank and position numbers and store i=
n
> > + * the upper 16 bits the alternate function identifier
> > + */
> > +#define RZN2H_PORT_PINMUX(b, p, f)     ((b) * RZN2H_PINS_PER_PORT + (p=
) | ((f) << 16))
> > +
> > +/* Convert a port and pin label to its global pin index */
> > +#define RZN2H_GPIO(port, pin)  ((port) * RZN2H_PINS_PER_PORT + (pin))
>
> Shouldn't this be in a header file under include/dt-bindings/pinctrl/?
Agreed, theT2H related macros are used in the driver whereas the above
aren't. In the past DT maintainers opposed including such headers
which aren't used in the DT and drivers. Hence I choose this approach.
Please let me know if you want me to move this into a header file
under dt-bindings.

> Else you have to duplicate these definitions in DT overlays.
>
> The rest LGTM, so
> Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
>

Cheers,
Prabhakar

