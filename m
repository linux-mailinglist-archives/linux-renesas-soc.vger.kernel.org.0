Return-Path: <linux-renesas-soc+bounces-2854-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 39C05856950
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 15 Feb 2024 17:17:02 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id C7A811F219B8
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 15 Feb 2024 16:17:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 20E9A13472B;
	Thu, 15 Feb 2024 16:11:35 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-il1-f180.google.com (mail-il1-f180.google.com [209.85.166.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B4584134726
	for <linux-renesas-soc@vger.kernel.org>; Thu, 15 Feb 2024 16:11:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1708013495; cv=none; b=hzvpS3yPeQF7dFTIU4uyzU+JI80GLFGBMl4bzWeKWHz46ykbzEn2NMbkAOrH9kERFty8qgSAfwshYUPVl4MdSp1bCjmZWJdQfyUos2WeJMEq+T5scbeL/tuSOePS2nQjYEuMuK19P6fp2Rz0rZsuPTXdfrwOlrO2Nv4A9wKDujc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1708013495; c=relaxed/simple;
	bh=lzJ1PJbnqmBKntZRfMElMIcQfiMZJ0tVcC0T5Y/YjPQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=TCuYjZXIf+fLH4D7ZLqNHRCUQxMn73Qa5HbzbgKLwTfxUXlYZfpkfeaSDGOjuuUenfgV4MKRCdMyS+OyfTb8B3gOmatVLVD7IXtahPxEC9ABZ/2CoXdzNSy9Rinv0McgBfurgOXiktXf9bDB9PDT38ptNb/i8RyV2H85LyUkAe4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.166.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-il1-f180.google.com with SMTP id e9e14a558f8ab-363b8429f03so3229145ab.1
        for <linux-renesas-soc@vger.kernel.org>; Thu, 15 Feb 2024 08:11:32 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1708013491; x=1708618291;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=lnJbz00w/JQYCLD9aR8Q9Z2Q5vEE4ivGpZ92jW+m+gM=;
        b=tgh42ILiiQQLHGYJPdNCSdwPbQcKL9vkpzHN8m1FbhFFuRcXwiLJDA4aiQz30Ew8nf
         QVDphwAxky2Nuc0F3NZ40Mw8ztQ1ixp2yTHchKyRdOgTGjaKTvB3RtYCiCcJjybvLB7N
         E+Fm8FR5cyOzFWTRVzmGnkkqeWo1Z0lvIfpVEAcd5gKvd1IbzXK2liD1SNNt9HYwvY5n
         jZAVMSt5LT16YUQefhAH8+sX4sKA5ZqIGE+QYp/TSq0hUhQBD6uOryEWHDiVN4DUZyR/
         FUqQsqpzV23sacVbZnuqptDmoEaqoIWPDw2CTszZ/J7DkDwyMs43V/0zptoR5/PyPYMc
         2l0A==
X-Gm-Message-State: AOJu0YyWxO8KxEDnFqQ0/GWbBKC1ieHQqX5UUIeDt/Qcey3fPsXWxCg5
	eRVzqKkE3tJVH1dHhpaOZSbz8EYl5H7WzD39vCDBIjJUimi5vTJyqlrVyJKeM/UbUg==
X-Google-Smtp-Source: AGHT+IHL/OP40RCPkVcK+S3y6NBCU3+kzzIYXgDU+YFFgRnQp2os5CYIubvacKQHi7NLzSk+LFxuzA==
X-Received: by 2002:a05:6e02:219b:b0:365:279:a04c with SMTP id j27-20020a056e02219b00b003650279a04cmr233254ila.32.1708013491189;
        Thu, 15 Feb 2024 08:11:31 -0800 (PST)
Received: from mail-il1-f177.google.com (mail-il1-f177.google.com. [209.85.166.177])
        by smtp.gmail.com with ESMTPSA id cv10-20020a056e023b8a00b00362759b0e4asm460549ilb.32.2024.02.15.08.11.30
        for <linux-renesas-soc@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 15 Feb 2024 08:11:31 -0800 (PST)
Received: by mail-il1-f177.google.com with SMTP id e9e14a558f8ab-363b8429f03so3229045ab.1
        for <linux-renesas-soc@vger.kernel.org>; Thu, 15 Feb 2024 08:11:30 -0800 (PST)
X-Received: by 2002:a92:4a12:0:b0:363:c9cd:e8e3 with SMTP id
 m18-20020a924a12000000b00363c9cde8e3mr2072960ilf.27.1708013490761; Thu, 15
 Feb 2024 08:11:30 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240122160441.759620-1-niklas.soderlund+renesas@ragnatech.se> <20240122160441.759620-2-niklas.soderlund+renesas@ragnatech.se>
In-Reply-To: <20240122160441.759620-2-niklas.soderlund+renesas@ragnatech.se>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Thu, 15 Feb 2024 17:11:18 +0100
X-Gmail-Original-Message-ID: <CAMuHMdV_a2u7PPaYbu+zU7-5jN2+ux6e4AAsWxC6+LCFyfvgPQ@mail.gmail.com>
Message-ID: <CAMuHMdV_a2u7PPaYbu+zU7-5jN2+ux6e4AAsWxC6+LCFyfvgPQ@mail.gmail.com>
Subject: Re: [PATCH 1/2] arm64: dts: renesas: r8a779g0: R-Car Ethernet TSN support
To: =?UTF-8?Q?Niklas_S=C3=B6derlund?= <niklas.soderlund+renesas@ragnatech.se>
Cc: linux-renesas-soc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Niklas,

On Mon, Jan 22, 2024 at 5:06=E2=80=AFPM Niklas S=C3=B6derlund
<niklas.soderlund+renesas@ragnatech.se> wrote:
> Add Ethernet TSN support for R-Car V4H.
>
> Signed-off-by: Niklas S=C3=B6derlund <niklas.soderlund+renesas@ragnatech.=
se>

Thanks for your patch!

> --- a/arch/arm64/boot/dts/renesas/r8a779g0.dtsi
> +++ b/arch/arm64/boot/dts/renesas/r8a779g0.dtsi
> @@ -538,6 +538,22 @@ tmu4: timer@ffc00000 {
>                         status =3D "disabled";
>                 };
>
> +               tsn0: ethernet@e6460000 {
> +                       compatible =3D "renesas,r8a779g0-ethertsn", "rene=
sas,rcar-gen4-ethertsn";
> +                       reg =3D <0 0xe6460000 0 0x7000>,
> +                             <0 0xe6449000 0 0x500>;
> +                       reg-names =3D "tsnes", "gptp";
> +                       interrupts =3D <GIC_SPI 429 IRQ_TYPE_LEVEL_HIGH>,
> +                                    <GIC_SPI 430 IRQ_TYPE_LEVEL_HIGH>;
> +                       interrupt-names =3D "tx", "rx";
> +                       clocks =3D <&cpg CPG_MOD 2723>;
> +                       power-domains =3D <&sysc R8A779G0_PD_ALWAYS_ON>;
> +                       resets =3D <&cpg 2723>;
> +                       #address-cells =3D <1>;
> +                       #size-cells =3D <0>;
> +                       status =3D "disabled";
> +               };
> +
>                 i2c0: i2c@e6500000 {
>                         compatible =3D "renesas,i2c-r8a779g0",
>                                      "renesas,rcar-gen4-i2c";

Matches the bindings (for which I did have some comments), so
Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>

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

