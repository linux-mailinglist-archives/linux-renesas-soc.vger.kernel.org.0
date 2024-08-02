Return-Path: <linux-renesas-soc+bounces-7700-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id AEF3B9459FE
	for <lists+linux-renesas-soc@lfdr.de>; Fri,  2 Aug 2024 10:34:03 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 597881F267E6
	for <lists+linux-renesas-soc@lfdr.de>; Fri,  2 Aug 2024 08:34:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 03E4E1C37B9;
	Fri,  2 Aug 2024 08:33:35 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-yw1-f174.google.com (mail-yw1-f174.google.com [209.85.128.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D5EB31C37AA;
	Fri,  2 Aug 2024 08:33:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722587614; cv=none; b=WEYgEpD9KmMq4Th0qs/ppwSh8/5jw8NaKwDnNP+JI/6Wu/v2T8sdJlSs10ltBOMBMAdkT2aV2SwnoMyOscviy8sYR7hK5+BZa5pn1tdQUvf4OhbEutG4X8vPze76KT6I396kuS8T9Z6zUn9x5b2G0nrQNsKbTXO4/MH4d+uJdzE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722587614; c=relaxed/simple;
	bh=JOMrkNR9tEZEDyRADgmXANJ4bLQM66fC0jyatyk/zmw=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=qPkUjGGuHdvhwIKCdySg23vuu9TlHk44xjCAkWIL+dLywD+1GTv/gHIzd0AHxs62lIO3X77QWBBiurvVIvUH7hEBy85USccIz9d0wLgkXt2Dv6yfpUgQ5nbemWNR5hXIJD2rH1PC6JVibJJiVt8ys246hObLI0KA4jKLvIqXKX8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.128.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-yw1-f174.google.com with SMTP id 00721157ae682-651da7c1531so65630657b3.0;
        Fri, 02 Aug 2024 01:33:32 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1722587611; x=1723192411;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=l8EFg2K7xS512JFwmSCqMteVtVm9m9OPJCO6ogS1r0E=;
        b=o1emupyVuxZmmrRInOg80KodQFAjjbX3f74+To/Ie6I553wvJnVzNrZLu+dK5xP9Q9
         fI9SFV3TpGayd4ajXwMDxphJ9w3wVqQSgbDdZlg3EeufQfCw9JQZI1nJHhW5OrKhmPK/
         JEem5+ciZFI6A9Cd5f4PdE1qqrqaORqa5xDPiGwpaAXSQoaShHcB6XviM6fE9VQwPEkd
         Yrplu14QEmTJwzFNOpIfY8eRLdOJSrcsV7qWGWmnGwugsgFE2llvG2L3vG+Q/1mHfY+X
         fASQMbvKbx8YYTNUTv+1Cs6Cak9QdKvKq40p7X7OBYfKZ3AVYOyIt9QRds5WCr8AyA8V
         ngiA==
X-Forwarded-Encrypted: i=1; AJvYcCVLrkdqSRsYhZqPSV9JJkZC3xg7gO/6IcKcCltexCBz9mpqZBYWPYhHhB54DlGkkfT/qMMAFm7TntES7m/1PBj6jIUZW5gOEk9nqhb4kL+2mnYxCqpEYdiW2ksgFWzflV0eLQxSAlb0+9NGPsen
X-Gm-Message-State: AOJu0YwJAwiJHwfD1RDZJ7GpVwGO2Z+rL2b8AijD1tk6JoExYInJqngd
	Vdm26GfApA9SfYlf5YaB1cXk4GVtIjt0U49O9CL8zZ2Ein7K7eAr1YZ5X4dp
X-Google-Smtp-Source: AGHT+IGR6ExImpfinf03maRaTMNtsr/9fpVw2RpvetWiympwmH/e4CRk5FWL1v9OlsDWiz0tTSygeA==
X-Received: by 2002:a0d:f087:0:b0:664:66d8:634f with SMTP id 00721157ae682-6896459206fmr32240997b3.44.1722587611488;
        Fri, 02 Aug 2024 01:33:31 -0700 (PDT)
Received: from mail-yw1-f175.google.com (mail-yw1-f175.google.com. [209.85.128.175])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-68a12c1bbb5sm1758697b3.95.2024.08.02.01.33.31
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 02 Aug 2024 01:33:31 -0700 (PDT)
Received: by mail-yw1-f175.google.com with SMTP id 00721157ae682-685cc5415e8so27306137b3.3;
        Fri, 02 Aug 2024 01:33:31 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCWOHv8ZikRe7X8lMDIK2bH7vuyUOOEBpWEzJ1PdmhPDio//IMMtzdMy9rjurAKfaikBwQCGXq3kIkRxm2BqWW40QJv6sX2Ybo66XiFNG5yOvNFe1U5WVxCnhc083vjaq0ajJFQja79Hw3hP0YfK
X-Received: by 2002:a0d:e947:0:b0:61b:1f0e:10 with SMTP id 00721157ae682-6895f9ec050mr32608147b3.4.1722587610965;
 Fri, 02 Aug 2024 01:33:30 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240704152610.1345709-1-niklas.soderlund+renesas@ragnatech.se>
In-Reply-To: <20240704152610.1345709-1-niklas.soderlund+renesas@ragnatech.se>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Fri, 2 Aug 2024 10:33:18 +0200
X-Gmail-Original-Message-ID: <CAMuHMdUZAVAkPVus2T_O3sWT7f1PciRYjxm6ecLy0QUyh50OEw@mail.gmail.com>
Message-ID: <CAMuHMdUZAVAkPVus2T_O3sWT7f1PciRYjxm6ecLy0QUyh50OEw@mail.gmail.com>
Subject: Re: [PATCH] arm64: dts: renesas: white-hawk-cpu: Move avb0 reset gpio
 to mdio node
To: Marek Vasut <marex@denx.de>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, linux-renesas-soc@vger.kernel.org, 
	devicetree@vger.kernel.org, 
	=?UTF-8?Q?Niklas_S=C3=B6derlund?= <niklas.soderlund+renesas@ragnatech.se>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Marek,

What is your stance on this?
Thanks!

On Thu, Jul 4, 2024 at 5:26=E2=80=AFPM Niklas S=C3=B6derlund
<niklas.soderlund+renesas@ragnatech.se> wrote:
> When creating a dedicated mdio node to describe the bus the gpio reset
> property was erroneously left in the phy node. The reason for adding
> mdio nodes on WhiteHawk was to ensure the PHYs where reset before they
> were probed, keeping the property in the phy node prevented this.
>
> Reported-by: Geert Uytterhoeven <geert@linux-m68k.org>
> Fixes: 54bf0c27380b ("arm64: dts: renesas: r8a779g0: Use MDIO node for al=
l AVB devices")
> Signed-off-by: Niklas S=C3=B6derlund <niklas.soderlund+renesas@ragnatech.=
se>
> ---
>  arch/arm64/boot/dts/renesas/white-hawk-cpu-common.dtsi | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
>
> diff --git a/arch/arm64/boot/dts/renesas/white-hawk-cpu-common.dtsi b/arc=
h/arm64/boot/dts/renesas/white-hawk-cpu-common.dtsi
> index 80496fb3d476..4f0230327868 100644
> --- a/arch/arm64/boot/dts/renesas/white-hawk-cpu-common.dtsi
> +++ b/arch/arm64/boot/dts/renesas/white-hawk-cpu-common.dtsi
> @@ -156,6 +156,8 @@ mdio {
>                 #address-cells =3D <1>;
>                 #size-cells =3D <0>;
>
> +               reset-gpios =3D <&gpio7 10 GPIO_ACTIVE_LOW>;
> +
>                 avb0_phy: ethernet-phy@0 {
>                         compatible =3D "ethernet-phy-id0022.1622",
>                                      "ethernet-phy-ieee802.3-c22";
> @@ -163,7 +165,6 @@ avb0_phy: ethernet-phy@0 {
>                         reg =3D <0>;
>                         interrupt-parent =3D <&gpio7>;
>                         interrupts =3D <5 IRQ_TYPE_LEVEL_LOW>;
> -                       reset-gpios =3D <&gpio7 10 GPIO_ACTIVE_LOW>;
>                 };
>         };
>  };

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

