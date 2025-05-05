Return-Path: <linux-renesas-soc+bounces-16689-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id E91C7AA9503
	for <lists+linux-renesas-soc@lfdr.de>; Mon,  5 May 2025 16:04:05 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 5D55A163D54
	for <lists+linux-renesas-soc@lfdr.de>; Mon,  5 May 2025 14:04:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 601C3205E3B;
	Mon,  5 May 2025 14:04:02 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-oo1-f43.google.com (mail-oo1-f43.google.com [209.85.161.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8E1DB18B47D;
	Mon,  5 May 2025 14:04:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.161.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746453842; cv=none; b=jYbnp7wg/ujaBeDRzqxGiU0oktsdez0F0+/Pdw+kMUZ5q5+CbXMW8tAEM2Hb7uZISDqOPdwQlzZjaow7EI+4hHEEbvbb+jZ7OdEmBUxbpbOdkf5m09FHgDfAaJosfwFZreFGrfdj3em2JOxYNYxZejwuEcw+JXjiwrFUVX3u6zw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746453842; c=relaxed/simple;
	bh=i2AXPd3UWogJ2V8aPdlDbH36J4SzDsEd9vLmKCLw2x4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=d/fL7q/piYQ23uz6iGDMgGrHUdmp9C29jYTjiownovQmSDUEA83bcIQcLtBATBv4XnfozGTLTXntmOSoYXgMlfxLxLHZZz0sESHPjCBU9kgG3aeS84t5FP5w2yR/xwma2CsEV+8QumBktvPn6MVOCK8/5xu909o0spxmv2jx9Ns=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.161.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-oo1-f43.google.com with SMTP id 006d021491bc7-604ad6c4d3dso1273482eaf.0;
        Mon, 05 May 2025 07:04:00 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746453838; x=1747058638;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=BFDIHlETByEqkNmOq6w7+s46eZCEx4V+CbRjLafxWkc=;
        b=LKBXcT/rq0C6z8i4RMKaJeGQ8cX36sgaGMMjyT/IhbNJLGgxqa50OFNbUC5ELlkcMa
         +xP/erLFlmTJ78zPcZykxokHP02348t4Gj2TUjoDEzUUNNu0CqescSG52UZVUzA4iNoz
         N9auX0sWB8kUr/fZi5cMYuc4ci53lb/bRSvl3IPjwWIPvo0BeflODTVBRS+YDuIFZt1V
         ReMzUPWUch4RypBNUOKI8IPBXbChjno3UZ3HoO9Wg/suHbd32ikA7vWM1AVjhFYtlhj2
         GVU7LFPb/Z3hjTHwkOYhtxfOqrb9qOIsczAoeomG2hTdP3nHQ7gNRsCh7UZAkYINR5gI
         8vlA==
X-Forwarded-Encrypted: i=1; AJvYcCVwG1gdXxnRH5QaOcnnw33Wm6JRSjYl9xl2Qd+MiMOhlVJBeDuUMKNj+YUKLrWCDw4Q2Fxxwkygx4F0@vger.kernel.org
X-Gm-Message-State: AOJu0YzeTWMKV7OzAOWPgfV6wqOBgCu2a5UUWYyIEqBW35Y6UI+cs126
	Xrs+eNX/D7VLRBqliroXdbJuN5bEnUFFPQSIKBBbTTgjD4Ra9K0jVTTtlLQN
X-Gm-Gg: ASbGncuOSs3zdjKjZ4zOzS26jkF9dyz+Gjc2zKEuW4r8sPRO5JeAKrF1ipk5J52Dr5k
	wRtjDGL9lBpCViWprAxVmEc4fHc7TFTQqQOVse540GIYMrCgPGmT0QRqw6vkV1Rgp4N+9AA5etF
	pxIGuIQesVdTm6Bam2YleAhdtigkh4pDSJSlTQt5EIsCW9gFmkvFrnw5NculQDlvfeCN8s4tzjz
	iwoG2JjSZih/yt45sWBZEklUoeGKsFWvyimiQCG8xnCCFyb/VbKvI4zPB9OBrWq1Elsoyh2JXld
	Px1/fCOuxy+shCq4P6lm3UzINGLWYLYmhjrKKoMbSszLh2ekLqZUJLyljzswPu2qFOrn6FCkJeT
	WLi8vOdw=
X-Google-Smtp-Source: AGHT+IHQZAo/fW6HfB37GHOPEB61wv08ZWEOsvDCzzCVzm/pI1A9D4vpjuJkoTLTHgzi9JnYnI8XBg==
X-Received: by 2002:a05:6820:450a:b0:607:8929:44ff with SMTP id 006d021491bc7-6080022606emr4648848eaf.1.1746453838409;
        Mon, 05 May 2025 07:03:58 -0700 (PDT)
Received: from mail-oi1-f178.google.com (mail-oi1-f178.google.com. [209.85.167.178])
        by smtp.gmail.com with ESMTPSA id 006d021491bc7-607e7d8b6f1sm1606675eaf.12.2025.05.05.07.03.57
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 05 May 2025 07:03:58 -0700 (PDT)
Received: by mail-oi1-f178.google.com with SMTP id 5614622812f47-3fbc00143d6so3217189b6e.3;
        Mon, 05 May 2025 07:03:57 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCWamN8D2kxQFB+gSqukez+b44gSNm/gdELveQAYNSoSJjlGt8XpWI8fY4uNp4EYGsTrXn/+P1pMQ2ja@vger.kernel.org
X-Received: by 2002:a05:6808:18a8:b0:401:e8ac:9487 with SMTP id
 5614622812f47-4035a53e044mr4610632b6e.4.1746453837417; Mon, 05 May 2025
 07:03:57 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250425100129.11942-4-wsa+renesas@sang-engineering.com> <20250425100129.11942-6-wsa+renesas@sang-engineering.com>
In-Reply-To: <20250425100129.11942-6-wsa+renesas@sang-engineering.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Mon, 5 May 2025 16:03:45 +0200
X-Gmail-Original-Message-ID: <CAMuHMdW2NHeatmSr4ePj6fPcbT5XNZJr967L3NJ_i6xYwgxaBA@mail.gmail.com>
X-Gm-Features: ATxdqUGyy6BxkrOS6nn8_7dn3i4obOKD1aoTNuq-MNnfS9d1RPzyPdsn703gwP0
Message-ID: <CAMuHMdW2NHeatmSr4ePj6fPcbT5XNZJr967L3NJ_i6xYwgxaBA@mail.gmail.com>
Subject: Re: [PATCH 2/2] ARM: dts: renesas: r9a06g032-rzn1d400-eb: enable USB
 host port
To: Wolfram Sang <wsa+renesas@sang-engineering.com>
Cc: linux-renesas-soc@vger.kernel.org, Magnus Damm <magnus.damm@gmail.com>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	devicetree@vger.kernel.org, Herve Codina <herve.codina@bootlin.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Wolfram,

CC Herv=C3=A9

On Fri, 25 Apr 2025 at 12:01, Wolfram Sang
<wsa+renesas@sang-engineering.com> wrote:
> Can be used via the USB connector J20.
>
> Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>

Thanks for your patch!

> --- a/arch/arm/boot/dts/renesas/r9a06g032-rzn1d400-eb.dts
> +++ b/arch/arm/boot/dts/renesas/r9a06g032-rzn1d400-eb.dts
> @@ -153,6 +153,13 @@ pins_uart2: pins-uart2 {
>                          <RZN1_PINMUX(108, RZN1_FUNC_UART2)>;
>                 bias-disable;
>         };
> +
> +       pins_usb: pins-usb {
> +               pinmux =3D <RZN1_PINMUX(119, RZN1_FUNC_USB)>,
> +                        <RZN1_PINMUX(120, RZN1_FUNC_USB)>,

These two are USB_PPON1 and USB_OC1...

> +                        <RZN1_PINMUX(121, RZN1_FUNC_USB)>,
> +                        <RZN1_PINMUX(122, RZN1_FUNC_USB)>;

... and these two are USB_PPON2 and USB_OC2.

> +       };
>  };
>
>  &sdio1 {
> @@ -236,3 +243,9 @@ &uart2 {
>         status =3D "okay";
>         uart-has-rtscts;
>  };
> +
> +&pci_usb {
> +       pinctrl-0 =3D <&pins_usb>;
> +       pinctrl-names =3D "default";
> +       status =3D "okay";
> +};

This corresponds to USB port 2, which is a USB host port.
Port 1 was added in the previous patch as a USB function port.

According to Sections 10.6.5.1 (1) ("Meanings of USB_OCI and USB_PPON
Signals") and Table 10.131 ("OCI and PPON") of the RZ/N1D System Control
and Peripheral Manual, USB_PPON2 and USB_OC2 are only used when both
ports are configured for host mode.  When port 1 is configured for
function mode, port 2 uses USB_PPON1 and USB_OC1 instead, so you
shouldn't need pin control for USB_PPON2 and USB_OC2.
However, that does not match the schematics, which show that USB_PPON2
and USB_OC2 are wired to port 2's power switch.
Can you enlighten me?
Thanks!

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

