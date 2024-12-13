Return-Path: <linux-renesas-soc+bounces-11304-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 3CBA59F1227
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 13 Dec 2024 17:30:25 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id EBA70280D79
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 13 Dec 2024 16:30:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A49041534F7;
	Fri, 13 Dec 2024 16:30:22 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-vs1-f46.google.com (mail-vs1-f46.google.com [209.85.217.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EC0BE1474A9;
	Fri, 13 Dec 2024 16:30:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.217.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734107422; cv=none; b=eAEoHrCQcO6ijRy22ubxTWZdljJ8kDVSTeVPK31y6BjntyyH5ltswEZ/WTwJEK/OPeoNqrJFAg9Lwjn9gcUCizBk6YgJmL5BrcGpkt1fuQTGb8ZXhvEbtws/IEAOuJp5AQp7cGHQgcQbgn8/UHNWk5koRTfRhTNm4ELi0+o1DQ0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734107422; c=relaxed/simple;
	bh=egMufDEMdZ4IXHCWD2K6q3bkG+TtJ1YPvF/7LzWKAcI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=LfYYcc8Ar3mcdTDgSepDFMDReVmaSeoder2jX1CwsS63GyU8SQCwzABRXe5SXeNx/0R5ATBqydlkttqACit9uYcE8DH8RRDeuxgQwxLx2tz59b/lAWHDqPvvwb1FssOqSW2GNVZnWGMxAlyq22eqpi9mPHR/wRsilXNsDH/0aAU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.217.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vs1-f46.google.com with SMTP id ada2fe7eead31-4b24d969db1so303330137.0;
        Fri, 13 Dec 2024 08:30:20 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734107419; x=1734712219;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=gKQTw5TL8ZYENpD/MvDIPDbuaPA5S+3yDu2O/3xPriY=;
        b=VMlCDBt+AeVbl4y+BWzF1wFJlb2AHd/hC1ALZFA9lMBHnenG0W/gvQ9gep+Y3FUE+L
         8tkl4r3H7KqZ20cKzC9DO8NgrlzaslYO6eU1X24Xk6FBp8fEJspLCTsBLCIJZKLXsQgl
         oySYMgQa34b7g4LEn27/KuS6JgeOVFHo8Jd40hvXnc9HcGk5tTXHOzaO/kKdzI4tSwCR
         UpqsjyuSnBBN2z36mvSOn/ba1Jjqrk9/XPECU3X0ffGcbFYNgcKC+Oh5gvIRkECYcyK2
         jl7E0LbhEesm8jF0Sje3+Fn8RjcY/AGEEfDpNb13dUOaDlpv/cYuwnOUaEwSEW1hsqES
         l0+w==
X-Forwarded-Encrypted: i=1; AJvYcCWJUfUZ8Qzyz/1Dara8JANamxKfFC1qwI10eo6oBnqVquZrzEfU2PNbHxUG+zqsF4lVR4G9biOXb5mO0203@vger.kernel.org, AJvYcCXEJefNKcBgpKVwxNh9tyvakqIVuomJTIoaECXNSvz1dad/xJav1t1NQ2UUCzOkHO1MqXC3ctOS/PoA@vger.kernel.org, AJvYcCXTtau2/PvjF6Sc64du5c2mVPEUx3UZSIOjeFSLzJXD3AviA8Ptn1gKxEbi7kiJicsRxAs6uXHDWhYiKPvnpYC0upI=@vger.kernel.org
X-Gm-Message-State: AOJu0YzOJ2d9tPBNOxGL4Y93/5u13DUas/jobI2pLgZTiUgFZ/uj59yd
	eCt9xEOjixuQ4M/paVJSaSFRsO5NFlpNe5te+tYAGNL2P0JFDv4QsEGnLHp6
X-Gm-Gg: ASbGnct13w+lhKZ2YU8wb1AJtr97xPzArwRwyXMjyGpZN6DBHm4nU/0diF7p93fEdxZ
	taiKQLfpOKw7Rcs/sn5tZQwxuNqazzIrLVp/uW9HQebaZFb8aGNcxGE3mB4KK+JNhVRgSrqvuZ4
	2ZH7+EGH/FeHSvYuTbJb3ZL9bAMtMfPhIfzi8Ux/wmr7CkF1G990MlThSFwwVfq0nUzbdG8MVhh
	KN3YVA4yjSgKffZnlfn+D9tfmJYsKFm/JP4xWUN6NSAnA3U35/n+eT+wvXUhmxGt+VpykC/Yp3G
	GTKKtmb+u5FlBwGbmcg=
X-Google-Smtp-Source: AGHT+IHX0nGI3BEwqYpYR7m1ymIy3PIIiwzJKXb/KH8w1Xska2x7LfnwLGXEZLnRR4jjgBnnFs9IAg==
X-Received: by 2002:a05:6102:4b04:b0:4b1:1def:3d10 with SMTP id ada2fe7eead31-4b25ddb2c56mr3991533137.19.1734107419216;
        Fri, 13 Dec 2024 08:30:19 -0800 (PST)
Received: from mail-ua1-f44.google.com (mail-ua1-f44.google.com. [209.85.222.44])
        by smtp.gmail.com with ESMTPSA id a1e0cc1a2514c-85c56a6da7esm2046909241.34.2024.12.13.08.30.18
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 13 Dec 2024 08:30:19 -0800 (PST)
Received: by mail-ua1-f44.google.com with SMTP id a1e0cc1a2514c-85c4b057596so446246241.3;
        Fri, 13 Dec 2024 08:30:18 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCUH6WizBs+klIssjC6l0whjJ3OLYPApU/99OLseakTwT2qPDlVvsFziqmx3EaHIezinBrx/2Zde/4L1Wjpo4OutUV0=@vger.kernel.org, AJvYcCV92zzp9SoUN477/JAR4y467koMKPWbVXZuFUWTZDiYs9Fq18A8OTPcrPwpHHHOoXwOtNL0bnqKurgz@vger.kernel.org, AJvYcCWUfq96pGibJ17dx0QPltssDM6Xk0WHm5mdluJ68kwzrkpDAj9Jyo0qrEqCv+FDqxOTaHeu/Qcpd0LHeWoH@vger.kernel.org
X-Received: by 2002:a05:6102:1594:b0:4b2:49ec:1b77 with SMTP id
 ada2fe7eead31-4b25de2ede6mr4076076137.23.1734107418529; Fri, 13 Dec 2024
 08:30:18 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20241206212559.192705-1-john.madieu.xa@bp.renesas.com> <20241206212559.192705-5-john.madieu.xa@bp.renesas.com>
In-Reply-To: <20241206212559.192705-5-john.madieu.xa@bp.renesas.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Fri, 13 Dec 2024 17:30:06 +0100
X-Gmail-Original-Message-ID: <CAMuHMdW2cddSFNRe9Q8AG7wE47HfEEc-A=cixCdnGcPg3J+9Fg@mail.gmail.com>
Message-ID: <CAMuHMdW2cddSFNRe9Q8AG7wE47HfEEc-A=cixCdnGcPg3J+9Fg@mail.gmail.com>
Subject: Re: [PATCH 4/5] arm64: dts: renesas: r9a09g047: add sys node
To: John Madieu <john.madieu.xa@bp.renesas.com>
Cc: Magnus Damm <magnus.damm@gmail.com>, Rob Herring <robh@kernel.org>, 
	Biju Das <biju.das.jz@bp.renesas.com>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>, 
	john.madieu@gmail.com, linux-renesas-soc@vger.kernel.org, 
	linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi John,

On Fri, Dec 6, 2024 at 10:26=E2=80=AFPM John Madieu
<john.madieu.xa@bp.renesas.com> wrote:
> Add system controller node to RZ/G3E (R9A09G047) SoC DTSI.
>
> Signed-off-by: John Madieu <john.madieu.xa@bp.renesas.com>

Thanks for your patch!

> --- a/arch/arm64/boot/dts/renesas/r9a09g047.dtsi
> +++ b/arch/arm64/boot/dts/renesas/r9a09g047.dtsi
> @@ -154,6 +154,13 @@ cpg: clock-controller@10420000 {
>                         #power-domain-cells =3D <0>;
>                 };
>
> +               sys: system-controller@10430000 {
> +                       compatible =3D "renesas,r9a09g047-sys", "syscon";

The "syscon" may be dropped again depending on the outcome of
Rob's series, we'll see...

> +                       reg =3D <0 0x10430000 0 0x10000>;
> +                       clocks =3D <&cpg CPG_CORE R9A09G047_SYS_0_PCLK>;
> +                       resets =3D <&cpg 0x30>;
> +               };
> +
>                 scif0: serial@11c01400 {
>                         compatible =3D "renesas,scif-r9a09g047", "renesas=
,scif-r9a09g057";
>                         reg =3D <0 0x11c01400 0 0x400>;

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>

Gr{oetje,eeting}s,

                        Geert


--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k=
.org

In personal conversations with technical people, I call myself a hacker. Bu=
t
when I'm talking to journalists I just say "programmer" or something like t=
hat.
                                -- Linus Torvalds

