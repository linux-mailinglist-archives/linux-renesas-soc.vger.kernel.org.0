Return-Path: <linux-renesas-soc+bounces-8487-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 683619641F6
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 29 Aug 2024 12:35:03 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id E692C1F215D4
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 29 Aug 2024 10:35:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AC2A21922FE;
	Thu, 29 Aug 2024 10:26:19 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-yw1-f175.google.com (mail-yw1-f175.google.com [209.85.128.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0CBD118F2E8;
	Thu, 29 Aug 2024 10:26:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724927179; cv=none; b=hfdGLr9AM0hz/9+o6NN3C1c8XKeVfyd1uADZq85gvX2NT3zVExJvw/jxKFj0sDSeRtKZgV7MDkLgxZr63iSZSdJNZ50DQxI5yDE+egr6lVfDO7erqu/wp1dj2eq+oyQpTdVguPQMLj5LI9w83tD0J67S8wBwB/u5Q0BWm+cGbdg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724927179; c=relaxed/simple;
	bh=6XWqP8bKZWsUUt60rJKSVITjDTX6h8TZTnifXNfByKE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=BTIOoKq1q27XzWcPAQ177fcEqiiqG5indLoMj0IUlotKs+m5z0f5ULn3fWxwqmlxkKt7zqfwxHg8oa0LIRz7fKKepaHZsMAIYLppEXqm4VKRhO5I5SJ3ttjl6SGlCzsLi8AIZhDBeXxdQc0Fiy9801JcSMo9t6Ciq3OO+CDkpsY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.128.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-yw1-f175.google.com with SMTP id 00721157ae682-6b4432b541aso4991737b3.1;
        Thu, 29 Aug 2024 03:26:17 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724927176; x=1725531976;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ZRjz2JoWhdzaIicrwZANk4lGjg8N3x3jKVcQoxrNf4U=;
        b=gekpARPYljeMLQy54JymNxHFW3z/nexHtni9qPwA86+h/LMR8cgIHNAhlDBbQ1olLJ
         ickgasI3RCqUrThJfiBazbm5l9fR9Qo3YZ/E+q4iLaTFxVVd2lsCjYULz50D//c2LYiK
         DK/PnS9bznLrumQqEu1aUFH9iXv+wqGFMwdFJVbLy3m9xlHn+znBAO+BlxdeY5CFA9EA
         VS8rueNRWD8hQb+9FLzBoaFzPbTd5/kxgFGM7novdMYTd6d5WxVpN4AJLmK8bB8eQxCf
         Olktm3c5PR4wv59Wyt5Kgy4NisKI9fAdj0naJ69popip7JzrXXRmyTcpKlqd8oQYcCLz
         Nrqg==
X-Forwarded-Encrypted: i=1; AJvYcCUi9g6Q6FEdBlRK6zAgHvx3GzODtx8b5PRnmPJJShNpafGx7s//q4UzlfVG7N9WLCKpKMzvKB7gZLy0@vger.kernel.org, AJvYcCWLXS7TGL+yJ7pqwjJh8Mc8FLGFfpPsVnNdixLKFVpjPPqYULAEnBYYtgSMFTWtb/RHtS6fZMm/lnVP8zMcbNprknA=@vger.kernel.org, AJvYcCWtaogSnk13IkPgpDvh+XvH09c0xGysjMXFP5mOFUDU4y37Dw3fnqj0N7btBW1TWRNb7OeNFjEljHxH+Oh+@vger.kernel.org
X-Gm-Message-State: AOJu0YxwgfA+HRhUMLhjLmMcXxY2vlQDsvBNChNJKfSfCTPMe93o+/zO
	pxQGynVMt6ZEItLY4TmbCXMmIPboVCHIKYfNFusI4Xqdhn+525xuJJ8ibuHf
X-Google-Smtp-Source: AGHT+IFBUaJ6AO+HD/lvaLhW3BsAKY74E1NvdS6XAoOvtQBlIHWSh7zjd7ritIPqr+bwqzhk1T9TvA==
X-Received: by 2002:a05:690c:3513:b0:65f:80bb:e6b2 with SMTP id 00721157ae682-6d2764f9fe6mr24844047b3.14.1724927176084;
        Thu, 29 Aug 2024 03:26:16 -0700 (PDT)
Received: from mail-yb1-f177.google.com (mail-yb1-f177.google.com. [209.85.219.177])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-6d2d5ea58f8sm1796797b3.106.2024.08.29.03.26.14
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 29 Aug 2024 03:26:15 -0700 (PDT)
Received: by mail-yb1-f177.google.com with SMTP id 3f1490d57ef6-e1205de17aaso525329276.2;
        Thu, 29 Aug 2024 03:26:14 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCWWWEoV+ZHRE5FnkYGVoDUB1JSD2pd2/YBknmkUrpubJ7k+2CHXEG9rl0VFKWu4pnMoOBYIm+vZp27D@vger.kernel.org, AJvYcCWxaKU53yRB7xYhfcD+uyM3+hygdnC2CZSPyC+6giEE/xoEQw7PD3lW85FrXJQfPhz2MFOhHKL7RDF6QqeZ@vger.kernel.org, AJvYcCXwF3IHMWCtPaIN5ApHBPYhKwq4dOr71BB2o3IN9dcJFbezB+fD8/8IJXGpgznRraUg9aX3ULv4knpZ6KfVxt7tMOU=@vger.kernel.org
X-Received: by 2002:a05:690c:3187:b0:6b1:2825:a3e2 with SMTP id
 00721157ae682-6d27813ffc7mr19561497b3.44.1724927174128; Thu, 29 Aug 2024
 03:26:14 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240828124134.188864-1-prabhakar.mahadev-lad.rj@bp.renesas.com> <20240828124134.188864-7-prabhakar.mahadev-lad.rj@bp.renesas.com>
In-Reply-To: <20240828124134.188864-7-prabhakar.mahadev-lad.rj@bp.renesas.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Thu, 29 Aug 2024 12:26:02 +0200
X-Gmail-Original-Message-ID: <CAMuHMdVu_KyTjK2oqcZzjgB+KM=a9Mbi9+_s3fzFa=1erSQG2Q@mail.gmail.com>
Message-ID: <CAMuHMdVu_KyTjK2oqcZzjgB+KM=a9Mbi9+_s3fzFa=1erSQG2Q@mail.gmail.com>
Subject: Re: [PATCH v4 6/9] arm64: dts: renesas: r9a09g057: Add SDHI0-SDHI2 nodes
To: Prabhakar <prabhakar.csengg@gmail.com>
Cc: Magnus Damm <magnus.damm@gmail.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	linux-renesas-soc@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Biju Das <biju.das.jz@bp.renesas.com>, 
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>, 
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Aug 28, 2024 at 2:41=E2=80=AFPM Prabhakar <prabhakar.csengg@gmail.c=
om> wrote:
> From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
>
> Add SDHI0-SDHI2 nodes to RZ/V2H(P) ("R9A09G057") SoC DTSI.
>
> Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
> ---
> v3->v4
> - Used hexadecimal values for clocks and resets

Thanks, will queue in renesas-devel for v6.12.

> --- a/arch/arm64/boot/dts/renesas/r9a09g057.dtsi
> +++ b/arch/arm64/boot/dts/renesas/r9a09g057.dtsi
> @@ -420,6 +420,51 @@ gic: interrupt-controller@14900000 {
>                         interrupt-controller;
>                         interrupts =3D <GIC_PPI 9 IRQ_TYPE_LEVEL_LOW>;
>                 };
> +
> +               sdhi0: mmc@15c00000  {
> +                       compatible =3D "renesas,sdhi-r9a09g057";
> +                       reg =3D <0x0 0x15c00000 0 0x10000>;
> +                       interrupts =3D <GIC_SPI 735 IRQ_TYPE_LEVEL_HIGH>,
> +                                    <GIC_SPI 736 IRQ_TYPE_LEVEL_HIGH>;
> +                       clocks =3D <&cpg CPG_MOD 0xa3>,
> +                                <&cpg CPG_MOD 0xa5>,
> +                                <&cpg CPG_MOD 0xa4>,
> +                                <&cpg CPG_MOD 0xa6>;

This fits on two lines, so I will reformat while applying.

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

