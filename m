Return-Path: <linux-renesas-soc+bounces-22720-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [142.0.200.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 31A00BBE8B8
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 06 Oct 2025 17:49:36 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 554C64EFFB0
	for <lists+linux-renesas-soc@lfdr.de>; Mon,  6 Oct 2025 15:49:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 64C3A2D63E5;
	Mon,  6 Oct 2025 15:49:13 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-ua1-f51.google.com (mail-ua1-f51.google.com [209.85.222.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C7C2F1DFF0
	for <linux-renesas-soc@vger.kernel.org>; Mon,  6 Oct 2025 15:49:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759765753; cv=none; b=pT65r+NJhG17B778Zjpq6sYAaPVFwRsqx0cx7HMz8FUqZQjU5/DVNWVU9qaTivo2BzMn9YeuiImmrwh8tswK4tuxZJw25l7N+jfdWDIDLIjJAWNp8X1gDEJI6KZrEKCoH4wQfM5cPlmRgDoT19+snM6VTUASzzPNyJSabXjNuik=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759765753; c=relaxed/simple;
	bh=PVdvCVE2eYWFiP3cR9c4GvqYb8gZt/OyTsTupK/w8CU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=OaPeoBz6z+X1qVAbwVzJu6WbmnDlb7lKt3ynPEqDW0xDKySaeKxrPJzB6k/p63PNlUssUxIgMTU12fm4owqiyNmI/3RT9jRSpFSLD8gwfkCHvXKvpm3Wbl/Yy21LPNdyVoxUHcyTOTaH9FfmJtUTtGImy1ZaIonrkJqutuTqxQo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.222.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ua1-f51.google.com with SMTP id a1e0cc1a2514c-890190d9f89so3655777241.2
        for <linux-renesas-soc@vger.kernel.org>; Mon, 06 Oct 2025 08:49:11 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759765750; x=1760370550;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=z9cUjdoCYBcQFUwR15PiM4qDt/xHkJtXxPd5pO9yUZ8=;
        b=m1ZVvQfgNcDZv8sZsEFmM8ANZDszyiR8ECGRrQ1CYyzN/iWF3GwT0Caz4UcjIRWBWV
         HZ4b84NG9Pc4u2LPjMTAFern8f91J4v9vK5dBXS5Y+Q/Nn7AqgmhIDTiowwWm3p/NFl6
         83+6Al8BbaRCVtOsvP9rVDZ0neX6wdm49hSQsqymCE1ahXITVJmIvWq29/WoxAsyZdsx
         vYwoXjQpgGyMPqdfAPJ0kB84DSV9Fz8T2nOCAPY0C+F5ZVq24fddI5e9+Mo8rbpNH/W+
         sdbzHVd/ZsEGzN61lnAFJB6WRLJIryXmBKj5VJu72ohvAfuIiSFg+A0ebBirlSuDqa9l
         hN4Q==
X-Forwarded-Encrypted: i=1; AJvYcCW4JFF1OAY9rSCy+qi0QU+6l0HHyqIeYKhbm5NCNBmdKqZKGi8IukfDknUmWAK5ln17+AEH1j8O9OL//3aMoKzqZQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YwjfgF5hGnsonBxVfJy33kX6eQD5gx6Cb82pzjzsWw5i+DnoXSG
	msoGTSNh0R9g/bDZ+U2CA0gHJTNV5VctbmbQDek8jA1K+s4PURGgmyhSjRrCS2FM
X-Gm-Gg: ASbGncv6P6pKxlCzC2Bk6d5PPO0b+djPE79L0r3O+I/s4L4DPZu1e0UZBm1MU/Hx12l
	5AKsm791bo4zhs5vxqxNrk43l7jdY2LGYie5w2Bo7l501L8dsdxPZi9wJkcdFA1LJ4pNWUH+nxf
	rYpIjcuzFvoFHRS3rDISGaytkWHcg+92IuYsjyf3VbdEu/JL1oZ5eVK8oJMPOVDqAznsxsVQHe9
	DJxrg80aQJX+Qduqdp2YFKDvnfMrW503zej5WVGOYSJPpKqMT3pKdodePqHYSQQsvHRu/5pz1U4
	44/Kur50f+DG8BRtqkL03mxzkH3559PVnG44Lr1NPg3w0qf1kFyAvzXRT/cRsdclxDQsvAM7Gqz
	fnQW6MqxpJOs6xwfZKU9J+nqseFkRL3j3ZQvgxuoMw5Zb/4U0ORFCw3xJontKA9aS90pNV1O/hp
	pXGbOQzk36L9rJqrt5vUFVsVQ=
X-Google-Smtp-Source: AGHT+IHDgttN09dzPYam1ewgdSQ7yCjuZCrxZXt9Of/Hsvg6upb7kFZLn2D/sA7Q9oZmR9Yh0k15bQ==
X-Received: by 2002:a05:6102:14a2:b0:51c:77b:2999 with SMTP id ada2fe7eead31-5d41cfb2f91mr5499189137.2.1759765750422;
        Mon, 06 Oct 2025 08:49:10 -0700 (PDT)
Received: from mail-vk1-f174.google.com (mail-vk1-f174.google.com. [209.85.221.174])
        by smtp.gmail.com with ESMTPSA id ada2fe7eead31-5d5d39adafbsm84445137.11.2025.10.06.08.49.10
        for <linux-renesas-soc@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 06 Oct 2025 08:49:10 -0700 (PDT)
Received: by mail-vk1-f174.google.com with SMTP id 71dfb90a1353d-554a7e98e19so93120e0c.3
        for <linux-renesas-soc@vger.kernel.org>; Mon, 06 Oct 2025 08:49:10 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCUhoRGhfEB3FquuD47uUK0inilPmtuaZmltLvvlXXAowbCmOKs1jZV6LyUTil3sRMItTEi1ZaQb4Cs8XfX/PEs5IQ==@vger.kernel.org
X-Received: by 2002:a05:6122:1828:b0:54a:93be:46fc with SMTP id
 71dfb90a1353d-5524e41594bmr4628932e0c.0.1759765750015; Mon, 06 Oct 2025
 08:49:10 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20251003215318.39757-1-niklas.soderlund+renesas@ragnatech.se>
In-Reply-To: <20251003215318.39757-1-niklas.soderlund+renesas@ragnatech.se>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Mon, 6 Oct 2025 17:48:58 +0200
X-Gmail-Original-Message-ID: <CAMuHMdX-arzDXgv-2gUs8uAt_APkoM3VnAvAYbp1N8oc2v84Hw@mail.gmail.com>
X-Gm-Features: AS18NWB5kY2B2y6TFB5oLhNDBm5KpJIF8LceyyLdhipcCtPerf86ByWEmMs2hLA
Message-ID: <CAMuHMdX-arzDXgv-2gUs8uAt_APkoM3VnAvAYbp1N8oc2v84Hw@mail.gmail.com>
Subject: Re: [PATCH] ARM: dts: renesas: koelsch: Update ADV7180 binding
To: =?UTF-8?Q?Niklas_S=C3=B6derlund?= <niklas.soderlund+renesas@ragnatech.se>
Cc: Wolfram Sang <wsa+renesas@sang-engineering.com>, Magnus Damm <magnus.damm@gmail.com>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	devicetree@vger.kernel.org, linux-renesas-soc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Niklas,

On Fri, 3 Oct 2025 at 23:53, Niklas S=C3=B6derlund
<niklas.soderlund+renesas@ragnatech.se> wrote:
> Use the more modern adi,adv7180cp compatible for the CVBS input found on
> R-Car Gen2 Koelsch boards. This aligns the bindings with the other Gen2
> board with the same setup Gose.
>
> Signed-off-by: Niklas S=C3=B6derlund <niklas.soderlund+renesas@ragnatech.=
se>

Thanks for your patch!

> --- a/arch/arm/boot/dts/renesas/r8a7791-koelsch.dts
> +++ b/arch/arm/boot/dts/renesas/r8a7791-koelsch.dts
> @@ -295,6 +295,16 @@ hdmi_con_in: endpoint {
>                 };
>         };
>
> +       composite-in {
> +               compatible =3D "composite-video-connector";
> +
> +               port {
> +                       composite_con_in: endpoint {
> +                               remote-endpoint =3D <&adv7180_in>;
> +                       };
> +               };
> +       };
> +

Moving this below cec-clock while applying, to "preserve" (sic) sort order.=
..

>         cec_clock: cec-clock {
>                 compatible =3D "fixed-clock";
>                 #clock-cells =3D <0>;

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
i.e. will queue in renesas-devel for v6.19.

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

