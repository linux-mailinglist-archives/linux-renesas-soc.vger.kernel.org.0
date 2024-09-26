Return-Path: <linux-renesas-soc+bounces-9088-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 1C38C98743C
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 26 Sep 2024 15:11:20 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 4C48F1C20A58
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 26 Sep 2024 13:11:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E9AD2219FC;
	Thu, 26 Sep 2024 13:11:16 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-yw1-f178.google.com (mail-yw1-f178.google.com [209.85.128.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 05F9D43AA8;
	Thu, 26 Sep 2024 13:11:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727356276; cv=none; b=DQ/Gd6YI90o6coi92JWlL5MsKjAf3gTt1YcMEWCsXLU8xbv4/UESJPqXBHiyruqqJ7yEhxGvi/gY4REFy0PunTXwmsJOH6wPUGGLGuj3VXF2ebFEspv0n4tQCCTxtRZVuZg/k1LJQpAsELlWfMb+uYZpckgNIoTSzVZOONkfWxA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727356276; c=relaxed/simple;
	bh=Ifx8nzAdFfV1Z0C32wPXwwBK4bwTnZwuvQa1l8VG1jE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=f1fXU0PyzLqcSPf5jOQMS0aIcmBV48ACppefFskcIYAkvBUaFdPYjbtUUvg6QuOE/OY3Ci5yXJL4rcmeERth4+pYkkfVe7iE8xx2fguN9DeDRqjU/EwLtKXNjvy9GJuCiNopR8WdFBbnggjwwDNLGCzU+admNd4A6YLsooMb1PA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.128.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-yw1-f178.google.com with SMTP id 00721157ae682-6db836c6bd7so9403987b3.3;
        Thu, 26 Sep 2024 06:11:14 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727356273; x=1727961073;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ae22g67465D42AsU8WiJ6xb14L3KGQVsOXvugoGAtwE=;
        b=rrklGYAmU7Jv+kJEkMfq/eRwLQ2R7lSw9vSnDGqWa1T3RSFwYO8mp2mae1n68LvreU
         RFtPp06yWufk0DsD6ltUy/xqYDLEZ7iXq67nJ3NUDlWa2rZlNdWfH3XKfUnVUvRcuXQO
         IPN9eQ7U2f0OxNa3MPA+Kz0Nloi2Ybqj1RF3iAU/ZeaoP6JQLC098/0/GD1zu1gIcs6T
         WxIngLVR+r2d2LP4Pslr0RNsH13jAJd5FWjqOc4m8b7VgW4QaCSjt3TZUXGFO1cNo7ml
         C20F4oE9jNhYMWWfxPxV1sFbSxyQYGg/Pe+IjmcwJThAecAuoNPmbE88Pp4kOozrLPPo
         ZftQ==
X-Forwarded-Encrypted: i=1; AJvYcCXLPzkWW8a0/BOGDk/S77uRAbTHHvXStaO7ww7HQALJYvFpa6N/UisUMEC7HloSVzag0PCQVNzeoBD3@vger.kernel.org
X-Gm-Message-State: AOJu0YwgF6PW8F3SjPsDO37FaApKWe9YZeODl+UHMBg/7jJuAQZ9o+hG
	S4kP/5b/vtK79xIF4r7SaWvO3Ohc4YZKGSaQcVgGcaYA97tO2O4X20OxYbgB
X-Google-Smtp-Source: AGHT+IGZs83/AQjHGYXNA4g4iQ9rtflJkeGJAIT/t6260b5kqhBhz03Hpo7oBOeUNHCePj3zSxmLWQ==
X-Received: by 2002:a05:690c:4089:b0:6dd:d5b7:f33b with SMTP id 00721157ae682-6e23734eb0cmr9219867b3.33.1727356272890;
        Thu, 26 Sep 2024 06:11:12 -0700 (PDT)
Received: from mail-yw1-f173.google.com (mail-yw1-f173.google.com. [209.85.128.173])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-6e20d2a67a2sm9859337b3.136.2024.09.26.06.11.12
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 26 Sep 2024 06:11:12 -0700 (PDT)
Received: by mail-yw1-f173.google.com with SMTP id 00721157ae682-6db836c6bd7so9403727b3.3;
        Thu, 26 Sep 2024 06:11:12 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCXekS2deHwv31lxBo/fCGJcYxvyi9WwlJiEQQhTOJskyo+kgXqjQCZZPoH+BppO0Fe6XiRP2E//ZMjA@vger.kernel.org
X-Received: by 2002:a05:690c:7183:b0:65f:80bb:e6b2 with SMTP id
 00721157ae682-6e21d6f4a05mr49453487b3.14.1727356272192; Thu, 26 Sep 2024
 06:11:12 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240925090812.14497-2-wsa+renesas@sang-engineering.com>
In-Reply-To: <20240925090812.14497-2-wsa+renesas@sang-engineering.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Thu, 26 Sep 2024 15:11:00 +0200
X-Gmail-Original-Message-ID: <CAMuHMdUcw4DVOLKsQ00z3oEkegPSqgpyYE+Wf440j_DMmBN73Q@mail.gmail.com>
Message-ID: <CAMuHMdUcw4DVOLKsQ00z3oEkegPSqgpyYE+Wf440j_DMmBN73Q@mail.gmail.com>
Subject: Re: [PATCH] ARM: dts: renesas: genmai: update audio codec bindings
To: Wolfram Sang <wsa+renesas@sang-engineering.com>
Cc: linux-renesas-soc@vger.kernel.org, Magnus Damm <magnus.damm@gmail.com>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	devicetree@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Wolfram,

On Wed, Sep 25, 2024 at 11:08=E2=80=AFAM Wolfram Sang
<wsa+renesas@sang-engineering.com> wrote:
> Meanwhile, bindings for the audio codec exist. Add dai-cells property
> and limit max frequency accordingly:
>
>   codec@0: '#sound-dai-cells' is a required property
>   codec@0: spi-max-frequency: 5000000 is greater than the maximum of 5260=
00
>
> Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
i.e. will queue in renesas-devel for v6.13, with s/bindings/device node/
in the one-line summary.

> --- a/arch/arm/boot/dts/renesas/r7s72100-genmai.dts
> +++ b/arch/arm/boot/dts/renesas/r7s72100-genmai.dts
> @@ -248,9 +248,10 @@ &spi4 {
>         status =3D "okay";
>
>         codec: codec@0 {
> +               #sound-dai-cells =3D <0>;

I'll move this to the end, to match generic property order.

>                 compatible =3D "wlf,wm8978";
>                 reg =3D <0>;
> -               spi-max-frequency =3D <5000000>;
> +               spi-max-frequency =3D <500000>;
>         };
>  };

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

