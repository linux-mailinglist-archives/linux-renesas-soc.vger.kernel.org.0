Return-Path: <linux-renesas-soc+bounces-24628-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [IPv6:2a01:60a::1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id F2586C5C292
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 14 Nov 2025 10:07:25 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id 3778435CF90
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 14 Nov 2025 09:04:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CDA9430277F;
	Fri, 14 Nov 2025 09:04:27 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-vk1-f172.google.com (mail-vk1-f172.google.com [209.85.221.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8C3422FFF8D
	for <linux-renesas-soc@vger.kernel.org>; Fri, 14 Nov 2025 09:04:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763111067; cv=none; b=p8oAtsoLEa7iuJJfYhkpcNVyzexcCdNT2U5xhy0Q6IIVECBT6gx0O07R1lTOP82DPKnRfai9INnbSR/hizd+jus/NzAGo805IIcxbuCy08WswsFsO/uRYDiXiK5fm6iTfEwaBcNz3r8I1yywno2aq24l+9jwc8+By/hYGtXQ3lQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763111067; c=relaxed/simple;
	bh=BHvm3hbmkPoS31CB/qQMOauxLpXwLi+jzNOEIhvIoqU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=tvD0tDNnjDrT6g7ERtsP7RpbriZAYzU0ZryeiBDus3rrYkqzNFkruOUWaEu/xlY902L35v2RVXa8gcoTmp30O8ohFuSIq7UmPZ3D3KaeBROVfx/Jb3NCgaNG+7VqDapEz4NSX6Px/mJvL2aYMDbZQwW4Q3tP54YAMLW+lvfMZZU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.221.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vk1-f172.google.com with SMTP id 71dfb90a1353d-559966a86caso443784e0c.2
        for <linux-renesas-soc@vger.kernel.org>; Fri, 14 Nov 2025 01:04:25 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763111064; x=1763715864;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=gil5rxl+Rfqu8BNaVY7z8XkReqTcCBYpfj3RKeayOGo=;
        b=muTCvkAw0aJejnzNpPA09eB8vJKK54N7fHRCYZaBrsnLOlxx1uamcGarQHYzliC0wx
         ZWVqZnCD9dDPEKWwKiWBF58dZAMsteROa1WvU3iuqsxefcICcHU57VdpSP0dlAkvGZtc
         QANvTmHwm9OmjXP6Rjh5BAlqLLEAWLS4muqz9TkNibpW+IWkAJKM+MqW/eCZcWxy7PiX
         jMFZZrdWvYKeykHkxbGppgu6drVaA9T9UogJ9EzkpO8ZEs7Kd9e2Lq8i2cGsZLUIdz1+
         2fLCMelCaXshs4B7LIbIZM4J2HJB+9dBgGDK9GXaVhm/M2dBLm2ve0tQcumBQUHXNoik
         gtzw==
X-Forwarded-Encrypted: i=1; AJvYcCUCe0DqFYn+V9jZuHbB/XaxkjNw1Ao36CgNGGZvJarDkl/GwKMkWj/I1CLy6oSqlx4FoQl/xwarVX/6z4lgwinecA==@vger.kernel.org
X-Gm-Message-State: AOJu0YzVXvLjwzaAadO01NtEBzyZR/OXfHBVAHOpmXsZeuL8qO1LMgu9
	B4n3C9AhIdSzaj0SvhxpWf/tV/Jdxtp84p/3R14CO07ICKMejqoz8i1nfE/A0AsW
X-Gm-Gg: ASbGncu/I4ZcVJkU06tihA4OKAqe5o/ZJJquC9zO6xQFKV6QbE3w2Qky1QVa4UNa9Vu
	YanAeaqkQn3oLsQtX4tuWw4hPmdUXNOKmkYWeQ+0ZBnD6TyodaW5KhYREvc7FPejjhBQK3MYy3v
	zqVRg2dM49kL9kPVwxdBZfAahIg6wcALw4q2g9UvR1sPEvzeibHPt598N1KAW4YuGGaj5FcmzSG
	OkQd+f5JH+ou3yTWZxPSXtt3lXMVAQUEGFMj/MTq8jfnXCPvDw4ySvvJc88cpMdvcJUxzmhrLKK
	Lybhvx+s9hvB5p7/lX8WAWa33k+ICyWdp1b3R1NCvNeE9eLXXLffdO2oltmFVEjzanFtyS92o3k
	urxv1dZ9S5uJ5RCqrbvsTeUIeOFHyh3ZEvO0Ml1tsuPM2+YVcdS06GvGMhXZf5G7hGZ5OEpVHjZ
	1dRdH0+U/QRnbAP/IA8NTOCx/3UEkc3S0XiOWsoZQTDSquBXn6E0kF
X-Google-Smtp-Source: AGHT+IEOjFMqRaRoOZ17XY4tMzUZEy3PaRbmY+mzbiHMv4hioLvrXigNDocrhie6bVSHEKxlmeYyag==
X-Received: by 2002:a05:6122:65a9:b0:55b:1a1b:3273 with SMTP id 71dfb90a1353d-55b1bd3f01fmr823498e0c.6.1763111063596;
        Fri, 14 Nov 2025 01:04:23 -0800 (PST)
Received: from mail-vs1-f48.google.com (mail-vs1-f48.google.com. [209.85.217.48])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-55b0f35db02sm1487118e0c.9.2025.11.14.01.04.22
        for <linux-renesas-soc@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 14 Nov 2025 01:04:23 -0800 (PST)
Received: by mail-vs1-f48.google.com with SMTP id ada2fe7eead31-5dfb5fcf063so490718137.1
        for <linux-renesas-soc@vger.kernel.org>; Fri, 14 Nov 2025 01:04:22 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCUDE8ywZqN1EqaZL7UY8WU3d1UUdRbRR0RfwVCha8eshps1hYO2YFdY6ug8FzGpi4sfPc+qin3I/wYzA9xbJYqq0g==@vger.kernel.org
X-Received: by 2002:a05:6102:3e1f:b0:5db:cba0:93a with SMTP id
 ada2fe7eead31-5dfc5a6064bmr814214137.35.1763111062738; Fri, 14 Nov 2025
 01:04:22 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20251027123601.77216-1-herve.codina@bootlin.com> <20251027123601.77216-6-herve.codina@bootlin.com>
In-Reply-To: <20251027123601.77216-6-herve.codina@bootlin.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Fri, 14 Nov 2025 10:04:10 +0100
X-Gmail-Original-Message-ID: <CAMuHMdUicJjXkkNs7FhZ0-jyuv9pzr_Q0AZNXs7tiv-MBGTkbg@mail.gmail.com>
X-Gm-Features: AWmQ_blv8a_OuSRESNKfbMrLVNnd3bpz0G1F8NnKOsI4crGuxZwqclBQZ7aOGl8
Message-ID: <CAMuHMdUicJjXkkNs7FhZ0-jyuv9pzr_Q0AZNXs7tiv-MBGTkbg@mail.gmail.com>
Subject: Re: [PATCH v6 5/8] ARM: dts: r9a06g032: Add GPIO controllers
To: "Herve Codina (Schneider Electric)" <herve.codina@bootlin.com>
Cc: Thomas Gleixner <tglx@linutronix.de>, Wolfram Sang <wsa+renesas@sang-engineering.com>, 
	Hoan Tran <hoan@os.amperecomputing.com>, Linus Walleij <linus.walleij@linaro.org>, 
	Bartosz Golaszewski <brgl@bgdev.pl>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Magnus Damm <magnus.damm@gmail.com>, Saravana Kannan <saravanak@google.com>, 
	Serge Semin <fancer.lancer@gmail.com>, Phil Edworthy <phil.edworthy@renesas.com>, 
	linux-gpio@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-renesas-soc@vger.kernel.org, 
	Pascal Eberhard <pascal.eberhard@se.com>, Miquel Raynal <miquel.raynal@bootlin.com>, 
	Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Herv=C3=A9,

Thanks for your patch!

On Mon, 27 Oct 2025 at 13:36, Herve Codina (Schneider Electric)
<herve.codina@bootlin.com> wrote:
> Add GPIO controllers (Synosys DesignWare IPs) available in the

Synopsys

> r9a06g032 (RZ/N1D) SoC.
>
> Signed-off-by: Herve Codina (Schneider Electric) <herve.codina@bootlin.co=
m>
> Reviewed-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
> Tested-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
> Reviewed-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

> --- a/arch/arm/boot/dts/renesas/r9a06g032.dtsi
> +++ b/arch/arm/boot/dts/renesas/r9a06g032.dtsi
> @@ -499,6 +499,127 @@ gic: interrupt-controller@44101000 {
>                                 <GIC_PPI 9 (GIC_CPU_MASK_SIMPLE(2) | IRQ_=
TYPE_LEVEL_HIGH)>;
>                 };
>
> +               /*
> +                * The GPIO mapping to the corresponding pins is not obvi=
ous.
> +                * See the hardware documentation for details.
> +                */
> +               gpio0: gpio@5000b000 {
> +                       compatible =3D "snps,dw-apb-gpio";

Don't we want an SoC-specific compatible value, too?

> +                       reg =3D <0x5000b000 0x80>;
> +                       #address-cells =3D <1>;
> +                       #size-cells =3D <0>;
> +                       clocks =3D <&sysctrl R9A06G032_HCLK_GPIO0>;
> +                       clock-names =3D "bus";
> +                       status =3D "disabled";

Usually we keep all GPIO controllers enabled by default.

> +
> +                       /* GPIO0a[0]      connected to pin  GPIO0      */
> +                       /* GPIO0a[1..2]   connected to pins GPIO3..4   */
> +                       /* GPIO0a[3..4]   connected to pins GPIO9..10  */
> +                       /* GPIO0a[5]      connected to pin  GPIO12     */
> +                       /* GPIO0a[6..7]   connected to pins GPIO15..16 */
> +                       /* GPIO0a[8..9]   connected to pins GPIO21..22 */
> +                       /* GPIO0a[10]     connected to pin  GPIO24     */
> +                       /* GPIO0a[11..12] connected to pins GPIO27..28 */
> +                       /* GPIO0a[13..14] connected to pins GPIO33..34 */
> +                       /* GPIO0a[15]     connected to pin  GPIO36     */
> +                       /* GPIO0a[16..17] connected to pins GPIO39..40 */
> +                       /* GPIO0a[18..19] connected to pins GPIO45..46 */
> +                       /* GPIO0a[20]     connected to pin  GPIO48     */
> +                       /* GPIO0a[21..22] connected to pins GPIO51..52 */
> +                       /* GPIO0a[23..24] connected to pins GPIO57..58 */
> +                       /* GPIO0a[25..31] connected to pins GPIO62..68 */
> +                       gpio0a: gpio-port@0 {
> +                               compatible =3D "snps,dw-apb-gpio-port";
> +                               gpio-controller;
> +                               #gpio-cells =3D <2>;
> +                               snps,nr-gpios =3D <32>;
> +                               reg =3D <0>;

Please move "reg" just below "compatible", as per DT coding style.

The rest LGTM, so
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

