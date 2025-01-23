Return-Path: <linux-renesas-soc+bounces-12386-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id B69E8A1A25B
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 23 Jan 2025 11:59:33 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id DE253168F55
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 23 Jan 2025 10:59:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1EC4920E33A;
	Thu, 23 Jan 2025 10:58:33 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-ua1-f45.google.com (mail-ua1-f45.google.com [209.85.222.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7DE7E20E00A;
	Thu, 23 Jan 2025 10:58:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737629913; cv=none; b=plwZGo6uryAmclXlw4Bd/bu/41oFAWWEBKUtsXwDLA/8QxwBVwQg0uRoj8tgGz70ayrZqp+9pzYOQIB9KXOOpYbqjL++82qo3+KT+z/cruxiPtweH+EkmSL+q5BxnoNECgi7+otbS3ilk3d2ZeLAKo9q+lU2p1dLIncrYGE3opE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737629913; c=relaxed/simple;
	bh=bblR7p8Dlm/ygo+I/dAWjbnnd+tW2zBXd915sDRtEos=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=tct3S0W/dJXwauDrFwYkIIlYgunYt23IH9o6LfGwOtXQ1cdQ/YpGLE35DGmEvBvyJ96uPd7JJzG/wqGPXYKpcAL4UIJK1FwoI3iYlKo6PnP/5hHIAaeb5JibsQCRnNT8xE43pa9B+zFImE+deudeuVE7SEuygJ62cqTPv+NrpVM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.222.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ua1-f45.google.com with SMTP id a1e0cc1a2514c-85c41442fdeso198910241.1;
        Thu, 23 Jan 2025 02:58:31 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1737629910; x=1738234710;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=EiRcn8XHRU0BKRcNoZxUKv1RUAmcJ3B1dozFm7gB1+s=;
        b=Mpp4t/BxDWb0v7N2mT8vEWsT+2P28lsuEX2Q0SYXCR2xxJwIeRHPJIVlqxjX9yf1qH
         xWU8XjJj2/yltQpqMQzn4AmzcsGPyXRCApcc3zYM2jgpkESvu+qLZbUbPAajEM8udrFk
         owWFjZAwhMVePBFXL1/7GCkjsZjXV2kRDRQs+sCmXgL+yw6W/iKkjNKi8C31225c86tX
         HDK5KnAg9tqieUHAKaq77TH7t8Rvj3Bn3JhLfhh0j/+Hp0Dxu4tYJkcMT3Ikh4vv9Eak
         tC3KUWNgQNCzUCFMX8mjkc5MAExsUs8/UXZ/hFxM5odaCSVnsExDvytzLaoA8U4rUeo5
         /g1g==
X-Forwarded-Encrypted: i=1; AJvYcCVf95s1nJSdj4ywJmoDRA2fhfOEp/JlPCLjNJhO7h9xvJplgUexAoscLd9dtfOfD732cjv353+4TsBEPjwxHuoQCfM=@vger.kernel.org, AJvYcCWgHHnAmrgJoB819svgWqYrkghb9wtI9QZfjDziOoAMZnFzLXe4uLynzO0CMUyT7sXyPRMvvuMDsCOx@vger.kernel.org, AJvYcCWjeM6uaPPpuC/jf3HOm+WiRm7GEMMa/3l/mthJ4TeAXALLVqU1el8uR9Q8gY5/pQmsCQg9MjmNCK7jYR1h@vger.kernel.org
X-Gm-Message-State: AOJu0Yyl16wzSKny4BOYvJZdS5F32phqxU7iS+GCQQ96X4Ql9/F+rzSE
	4f79kvJtRp1MGf2aLEjtOz5A2vy0jRS4rGvO/99S4ddX2k7yyswGlg/GITiQ
X-Gm-Gg: ASbGncsIK9gUJigfgnunMue4XDD8rGrmpn4M7fb55m93tGdQvecAOn2jyLPsETE30vv
	eQUSUjS75U9lINALRLePuP5j2lt4wPpvYa+koEp+R2ho0OANzQWEoELsOi011aBsamxgcxNjLCM
	DdVV0T6SVejDr+NN64wK2EQi5MoZWbH8lBJQpQO9FGYi21OQ3SldXnMwqrMSI7qu/p93FANtj3P
	TXaEiUEwh/Xqd7/2csi4e69/dyw1o+32RFEKq1mHkQ8mJWy/kbVO8imHk2byrjODUAEyj6R8nyB
	sYivoX6XkkGTyHNLpaU7psdvn13dLNlRHUI9DehhkuA=
X-Google-Smtp-Source: AGHT+IHeAq2eHOqAmjt5dEUOr4524T82fM6cw6wPoUYP+EA4CIAWSioss+3pkMizhN2soKOCSgPMsA==
X-Received: by 2002:a05:6102:3e0a:b0:4b2:73f7:5adf with SMTP id ada2fe7eead31-4b690be5b36mr21887128137.9.1737629909722;
        Thu, 23 Jan 2025 02:58:29 -0800 (PST)
Received: from mail-ua1-f46.google.com (mail-ua1-f46.google.com. [209.85.222.46])
        by smtp.gmail.com with ESMTPSA id ada2fe7eead31-4b68a223269sm3289129137.14.2025.01.23.02.58.29
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 23 Jan 2025 02:58:29 -0800 (PST)
Received: by mail-ua1-f46.google.com with SMTP id a1e0cc1a2514c-85c48f5e2c1so140777241.3;
        Thu, 23 Jan 2025 02:58:29 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCVtqe6QfMWuKAueKvywPbxV6rOCp1kyV1iB5cmy6Z+53Gpp+Tdom2fzFIuKhg9FC/Dgtrz0Vze/dKrLAkKnMlQaeWE=@vger.kernel.org, AJvYcCXS6QLVnBCgHLr63xNO05SanTBP7JtBMBwJzZzDkfLk2aDSOfBMthQOWyMlatC9R1wUWCKvZJNslfUj@vger.kernel.org, AJvYcCXSrOH1tAMlnTBgasNYcAbWzyVanpNr76ZW17To6h6a5TdxJNhJJq20q02CQ+RvRYA+6JRqPPIc6WPyzT8j@vger.kernel.org
X-Received: by 2002:a05:6102:5114:b0:4b2:4cb0:91d5 with SMTP id
 ada2fe7eead31-4b690c1dc83mr20170025137.15.1737629909215; Thu, 23 Jan 2025
 02:58:29 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250116144752.1738574-1-iwamatsu@nigauri.org> <20250116144752.1738574-5-iwamatsu@nigauri.org>
In-Reply-To: <20250116144752.1738574-5-iwamatsu@nigauri.org>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Thu, 23 Jan 2025 11:58:16 +0100
X-Gmail-Original-Message-ID: <CAMuHMdW_UjGD5QQ87m6kC_Ei9LOdA6=T6zsmp3HL7Y_t0SP7QQ@mail.gmail.com>
X-Gm-Features: AWEUYZkG04BfU5RC9IcWyVUIF0S_FYDHD9C0fHku2jYXhVGPSiz2XuJY0fTGA4o
Message-ID: <CAMuHMdW_UjGD5QQ87m6kC_Ei9LOdA6=T6zsmp3HL7Y_t0SP7QQ@mail.gmail.com>
Subject: Re: [PATCH v2 4/4] arm64: dts: renesas: Add initial device tree for
 Yuridenki-Shokai Kakip board
To: Nobuhiro Iwamatsu <iwamatsu@nigauri.org>
Cc: Magnus Damm <magnus.damm@gmail.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	linux-renesas-soc@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Masato Kiuchi <kiuchi_masato@yuridenki.co.jp>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Iwamatsu-san,

On Thu, Jan 16, 2025 at 3:48=E2=80=AFPM Nobuhiro Iwamatsu <iwamatsu@nigauri=
.org> wrote:
> Add basic support for Yuridenki-Shokai Kakip board based on R9A09G057H48.
> This commit supports the following:
>
>   - Memory
>   - Input clocks
>   - Pin Control
>   - SCIF
>   - OSTM0 - OSTM7
>   - SDHI0
>
> Signed-off-by: Nobuhiro Iwamatsu <iwamatsu@nigauri.org>
>
> ---
> v2: Drop bootargs from chosen.
>     Fix binding name for regulators.
>     Fix the name style of the regulator.
>     Use DTS coding style.

Thanks for the update!

> --- /dev/null
> +++ b/arch/arm64/boot/dts/renesas/r9a09g057h48-kakip.dts

> +/ {

> +       vqmmc_sdhi0: regulator-vccq-sdhi0 {
> +               compatible =3D "regulator-gpio";
> +               regulator-name =3D "SDHI0 VccQ";
> +               gpios =3D <&pinctrl RZV2H_GPIO(A, 0) GPIO_ACTIVE_HIGH>;
> +               regulator-min-microvolt =3D <1800000>;
> +               regulator-max-microvolt =3D <3300000>;
> +               gpios-states =3D <0>;
> +               states =3D <3300000 0 1800000 1>;

"states =3D <3300000 0>, <1800000 1>;", as these are two tuples.

> +       };
> +};
> +
> +&qextal_clk {
> +       clock-frequency =3D <24000000>;
> +};
> +
> +&pinctrl {

Please sort nodes alphabetically.

> +&scif {

> +};
> +
> +&ostm0 {

Likewise.

The rest LGTM, so
Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
i.e. will queue in renesas-devel for v6.15, with the above fixed.
No need to resend.

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

