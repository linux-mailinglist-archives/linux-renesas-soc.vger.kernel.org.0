Return-Path: <linux-renesas-soc+bounces-6745-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 089D8916B3E
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 25 Jun 2024 16:57:17 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id BA4AF2858D1
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 25 Jun 2024 14:57:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 60CA216F0ED;
	Tue, 25 Jun 2024 14:54:55 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-yw1-f178.google.com (mail-yw1-f178.google.com [209.85.128.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BCE9D16D4C8;
	Tue, 25 Jun 2024 14:54:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719327295; cv=none; b=Ne9vt3I0U2vL9Vb5rp+8B76/i8R26vbjAozvffg2Gn4wwRSFlm7jz8xH6PD1lzrrER5pqfRTiHPCzyYv3P8KO0SDAMDCftK3ne1liyKvcB268WOZcHkwmQSuC8rKKGhG7Zqzxp0FATTDxMd7oSGlrqK0QLBIY6BHYNZX8datEQk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719327295; c=relaxed/simple;
	bh=3rtPKYOOveHd/ARhrCQb9r9Lhm1DNbXyLmJaYkZwo24=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=QgjiT8CL3ukPLEfAD24z95uTjFZZrjxJQKdulImEurDezhYwQPxSDizC+wsJd0L/PS01OCFFJ67mcjNYs9unc+NU7igfKngEsS7G4pxUX1l0L3D39BbRAbUrCGBiA+GcHHf1+nzLJOmg8PLmD2HDal554NGe1jow+QJzH+aYrPU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.128.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-yw1-f178.google.com with SMTP id 00721157ae682-645808a3294so19269127b3.3;
        Tue, 25 Jun 2024 07:54:52 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719327291; x=1719932091;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Q1bc/+AE+hdXh7sh8QJ2NzxJSopu94WFQ3wm93AcRUU=;
        b=EglHN7SbQKkI5CHrWu7Q+ovLijXF/TmCay8kJLKhhhpZxiWoDoympVTW3EPQ1BJML6
         j4dTUHcrqfuvlcOtMYT9RWi9eDAVWBpf74Mj92FXSTiOY1xeKPD45exwAJyAV/+1M7I9
         3W665k6nxosdWZfvLazn7xlgqu88odS9RV6ywr0ncBETe+F20F22R1HkIuR+LFHiQ5nv
         UlxCLHsUJWGFXDvtFY/jwWf2PIygqPD1596PHmwEbXZhVj8QFMJlRApPOHi8nCdHsDbz
         c9+Pvt9eknHB42jbCvU6AAC6tNp1EBvhTUUWOjeN/tFpBsHKXpIYoEagxPDm1hdnYrat
         S3Bg==
X-Forwarded-Encrypted: i=1; AJvYcCURqKbKawGF6b3TeY5OSv0Yol81BTWlW2p809VHC+4ufZLXKKuIYLqTCM9NpOsAR/m3nqLc/A9c3AH4GrzexmBsQBl8Y+Z+/F2S0+sgy/Rj1WGziK2SK6eYHCxWkM00LiUE7S9GLQAU+WrAqcZ5
X-Gm-Message-State: AOJu0YwQB/uoBMb7KlwB0OjLRaUDJrWYDgH3qoNPGneU8wDzIBZYfZWS
	kDdvd9nMLysTvNOilS0DXjLb5EgIN3IYZGHuVjdYAswWfvd7Ja81nCLhGmGB
X-Google-Smtp-Source: AGHT+IHq8AOfkusm9NNS0y/HrqzAs24XHU37COyEUUz6wO/ZrJNrnrzK9sPEM2W1DW1BniKYF8EayA==
X-Received: by 2002:a81:f203:0:b0:62c:f82b:553f with SMTP id 00721157ae682-6433eaf2c0emr73673877b3.31.1719327291015;
        Tue, 25 Jun 2024 07:54:51 -0700 (PDT)
Received: from mail-yw1-f175.google.com (mail-yw1-f175.google.com. [209.85.128.175])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-63f154d5d90sm34565067b3.106.2024.06.25.07.54.50
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 25 Jun 2024 07:54:50 -0700 (PDT)
Received: by mail-yw1-f175.google.com with SMTP id 00721157ae682-63174692a02so52736917b3.0;
        Tue, 25 Jun 2024 07:54:50 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCUbnW5C28wtGxX7bBhPcnsmtJTdfghTinSQhHm3vKVDeznJVRY/+710oqTVfXzYiDMxDi8bvgsb5dZWpm3qVLRtfFjr+ZtFDSXdqpE/+VA2ugkoCgg40CNebFiCxTKE6YC3kThAxoTv78WGFBPb
X-Received: by 2002:a0d:e382:0:b0:618:2f6d:ca80 with SMTP id
 00721157ae682-6433dd74200mr82795787b3.12.1719327290521; Tue, 25 Jun 2024
 07:54:50 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240625133008.2638902-1-niklas.soderlund+renesas@ragnatech.se>
In-Reply-To: <20240625133008.2638902-1-niklas.soderlund+renesas@ragnatech.se>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Tue, 25 Jun 2024 16:54:38 +0200
X-Gmail-Original-Message-ID: <CAMuHMdVXGP_x1aoTqCfYo=axnEqGCncJ-HRckqzwNjX1+wxf9w@mail.gmail.com>
Message-ID: <CAMuHMdVXGP_x1aoTqCfYo=axnEqGCncJ-HRckqzwNjX1+wxf9w@mail.gmail.com>
Subject: Re: [PATCH] arm64: dts: renesas: white-hawk: ethernet: Define AVB1
 and AVB2 PHY
To: =?UTF-8?Q?Niklas_S=C3=B6derlund?= <niklas.soderlund+renesas@ragnatech.se>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, linux-renesas-soc@vger.kernel.org, 
	devicetree@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Niklas,

On Tue, Jun 25, 2024 at 3:31=E2=80=AFPM Niklas S=C3=B6derlund
<niklas.soderlund+renesas@ragnatech.se> wrote:
> Align with other Renesas SoCs and use the specific compatible for the
> PHYs connected to AVB1 and AVB2, Marvell 88Q2110/QFN40. This allows
> software to identify the PHY model at any time, regardless of the state
> of the PHY reset line.
>
> Signed-off-by: Niklas S=C3=B6derlund <niklas.soderlund+renesas@ragnatech.=
se>

Thanks for your patch!

> --- a/arch/arm64/boot/dts/renesas/white-hawk-ethernet.dtsi
> +++ b/arch/arm64/boot/dts/renesas/white-hawk-ethernet.dtsi
> @@ -27,7 +27,8 @@ mdio {
>                 reset-post-delay-us =3D <4000>;
>
>                 avb1_phy: ethernet-phy@0 {
> -                       compatible =3D "ethernet-phy-ieee802.3-c45";
> +                       compatible =3D "ethernet-phy-id002b.0980",
> +                                    "ethernet-phy-ieee802.3-c22";
>                         reg =3D <0>;
>                         interrupt-parent =3D <&gpio6>;
>                         interrupts =3D <3 IRQ_TYPE_LEVEL_LOW>;
> @@ -49,7 +50,8 @@ mdio {
>                 reset-post-delay-us =3D <4000>;
>
>                 avb2_phy: ethernet-phy@0 {
> -                       compatible =3D "ethernet-phy-ieee802.3-c45";
> +                       compatible =3D "ethernet-phy-id002b.0980",
> +                                    "ethernet-phy-ieee802.3-c22";
>                         reg =3D <0>;
>                         interrupt-parent =3D <&gpio5>;
>                         interrupts =3D <4 IRQ_TYPE_LEVEL_LOW>;

Originally, I added explicit ethernet-phy-id* compatible values because
Linux does not deassert the reset line before trying to read the PHY
ID, hence failing.  Have you checked if this is still the case after
introducing the mdio subnode?  I'd rather not add the explicit IDs,
as board manufacturers may change the PHY revision or even the PHY
model without notice.

You can find my original test procedure, using kexec or bind/rebind, at
https://lore.kernel.org/cover.1631174218.git.geert+renesas@glider.be/.

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

