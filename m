Return-Path: <linux-renesas-soc+bounces-33219-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id ACtyEokOF2p62wcAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-33219-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 27 May 2026 17:32:25 +0200
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 978235E6E8A
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 27 May 2026 17:32:24 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 3A44C302DF52
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 27 May 2026 15:31:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DDCF93F20EB;
	Wed, 27 May 2026 15:31:50 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-vs1-f51.google.com (mail-vs1-f51.google.com [209.85.217.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6B414380FFD
	for <linux-renesas-soc@vger.kernel.org>; Wed, 27 May 2026 15:31:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.217.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779895910; cv=none; b=ATyqq/1vm9VnzX3Zj3ybCPfAxhHWvpj6udaoemvUwl4Eux3K/59VKsZU8MnAzwngR2UlWnxIMk01PY+NLT0ZYiF5vhYN61aMbhboxir0FXDg9T0QZroONk3IZ4DH80y+HQSRryChYZs8Rrmw18tovW0q2CVClhYyjueaXxPfZy8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779895910; c=relaxed/simple;
	bh=Ai8Gc0M9Ll15iapnKmt/9wTra1TFQlAJ8XHoXUJSQ/4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=YkI8jhXeKWdeWlsKaSUi5SfS50WJq8pad2KpGIaR5fzgE4nfJAYVNhbuV8PTtIj+HQPn+jYoOAxsDyKbYYfnt2u/2/3H9KRi/+MPRiPR+p9HdVN7wKJWtweV5ChvDX4RJDKV/ZUNTgMN9DIg8c78Vfs5u5ArUb4DjfsK4N3A6tY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.217.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vs1-f51.google.com with SMTP id ada2fe7eead31-67bfd0ec7f0so4987927137.2
        for <linux-renesas-soc@vger.kernel.org>; Wed, 27 May 2026 08:31:48 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779895907; x=1780500707;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=cIlRZgCVpGMi8akEWxP8kXEJKnwQumISGZeYfvbOEPY=;
        b=nI73qJbaMZKq4y6q5rJx114afnpIEnHbQIfyaC8WhbCFkhxdufBIohY1oUJcKJtRwi
         3hY1nJviMn0cTJ3t4vImWC4Kl78XWVVSwGD4SllnNGTn0IWMBlCpVVoOSUs+KI5NX8+z
         788RXWVsct+tEaDbSUKicXEss2L5p5QZ6hw3IWXtvTwTGPzzK8njeOjs4UOFKoM021Cn
         uqzjqgQthvEAxbDbq7KSYXtV4pDEy1KfsQ1kztkDDkselvuP7R3dRFRtoBFUc8WRkt7J
         LZF3gCUDN063eTJhbV60QPyx+gZw+Es4tt1G4A0mfMfCbLIKlVJLDEjKanbbvqeO396+
         l+MQ==
X-Forwarded-Encrypted: i=1; AFNElJ+GDNvmWG8hvrZzZNlGlHQqnhSD6C5nb+20tHgMx6tkg6NlfvydaK7f4h+dTX8RYybf8YoJ1c4Sg+kpJVu2uiixSg==@vger.kernel.org
X-Gm-Message-State: AOJu0Yy2YekEF4AUnK3SEc3DSe6LeD7d7P2mMq6aKzLg04ZysnJ0vIBG
	adiHYsNqhG+HGI82upJOLEvBoZsB7AcRh/tfBq4DCKEbntPAnp1W/Mxd9Hy8/hC4uEk=
X-Gm-Gg: Acq92OETyGYfsublXr0xkpYqMVJWtzxf18RCFsZDPUtE/JU7zQJelG5btUc4h1/kuaH
	vAPG70BTZMvvtnkLrfog/pzNQ1zBAMwKU6A3av/osjeTHz5vqpcmBYTJADTE1cH65dKZxnVZpHo
	ZUpUHAMS87edec7lCjX7WFvSlspgE80+RJAYzo2Fjuym+uQ8zAFmYHBG4rXNHe54ou3LgIV81oN
	bKzlZQoyEiGMSoYTOldSbvxExA7cMiKm00qJKI0CiPy+Srtz6zP76HhuT3gFZBJ/eA6ei1/mMXT
	yUk71mxavstYgzxJTItFhve3Rx+wh5q4E9p+pwLCxzh2sFIeeSCAU67ClxL7qrYFOglFVCnEEnz
	HAtyzimrcjgWQxLfELeRgaS/oKDIKfTdgiZcDj5SwtZgHwrvaoeUVt9/LBTI3ddGCl8LgxIggus
	Ixzql3IYQdlC9s78WwzYhJg0rVnZ9r4g0I7SoOCtQmNX8MtHZKpzEDAEPGNw5TuYoh
X-Received: by 2002:a05:6102:334e:b0:633:d7ec:153c with SMTP id ada2fe7eead31-67c7cee3d39mr13207948137.3.1779895907423;
        Wed, 27 May 2026 08:31:47 -0700 (PDT)
Received: from mail-vk1-f170.google.com (mail-vk1-f170.google.com. [209.85.221.170])
        by smtp.gmail.com with ESMTPSA id ada2fe7eead31-67fda9003a8sm16551352137.6.2026.05.27.08.31.41
        for <linux-renesas-soc@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 27 May 2026 08:31:42 -0700 (PDT)
Received: by mail-vk1-f170.google.com with SMTP id 71dfb90a1353d-5873983d19eso5102065e0c.2
        for <linux-renesas-soc@vger.kernel.org>; Wed, 27 May 2026 08:31:41 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AFNElJ8JAV316AtORd4hkhPJCT3yoKfM7AzSvCjqNcOUYuIGAcdHXE7oJ6fOWzVO8EIwShExfhQyoF4OXql0XgSLSuSRaA==@vger.kernel.org
X-Received: by 2002:a05:6122:390c:b0:575:19a7:ae16 with SMTP id
 71dfb90a1353d-58662da22a6mr12763319e0c.11.1779895900700; Wed, 27 May 2026
 08:31:40 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260505070206.7932-1-biju.das.jz@bp.renesas.com> <20260505070206.7932-4-biju.das.jz@bp.renesas.com>
In-Reply-To: <20260505070206.7932-4-biju.das.jz@bp.renesas.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Wed, 27 May 2026 17:31:28 +0200
X-Gmail-Original-Message-ID: <CAMuHMdXQxaiGKV+M2fZFnrL0cn6HZnm8KMU_FrpuLOOr23JEXg@mail.gmail.com>
X-Gm-Features: AVHnY4Lz-MCYK5IOf1GJVId8mM5byVTdsE82uuKVoBZTNLn4QsNmoS3qjRzNJzE
Message-ID: <CAMuHMdXQxaiGKV+M2fZFnrL0cn6HZnm8KMU_FrpuLOOr23JEXg@mail.gmail.com>
Subject: Re: [PATCH 3/4] arm64: dts: renesas: r9a08g046l48-smarc: Add gpio keys
To: Biju <biju.das.au@gmail.com>
Cc: Magnus Damm <magnus.damm@gmail.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Biju Das <biju.das.jz@bp.renesas.com>, linux-renesas-soc@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>
Content-Type: text/plain; charset="UTF-8"
X-Spamd-Result: default: False [-1.46 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FREEMAIL_CC(0.00)[gmail.com,kernel.org,bp.renesas.com,vger.kernel.org];
	TAGGED_FROM(0.00)[bounces-33219-lists,linux-renesas-soc=lfdr.de];
	DMARC_NA(0.00)[linux-m68k.org];
	FREEMAIL_TO(0.00)[gmail.com];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	MISSING_XM_UA(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[6];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[geert@linux-m68k.org,linux-renesas-soc@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	NEURAL_HAM(-0.00)[-0.981];
	RCPT_COUNT_SEVEN(0.00)[10];
	R_DKIM_NA(0.00)[];
	TAGGED_RCPT(0.00)[linux-renesas-soc,dt];
	DBL_BLOCKED_OPENRESOLVER(0.00)[renesas.com:email,linux-m68k.org:email,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,mail.gmail.com:mid]
X-Rspamd-Queue-Id: 978235E6E8A
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Hi Biju,

On Tue, 5 May 2026 at 09:02, Biju <biju.das.au@gmail.com> wrote:
> From: Biju Das <biju.das.jz@bp.renesas.com>
>
> RZ/G3L SMARC EVK  has 3 user buttons called USER_SW1, USER_SW2 and
> USER_SW3. Instantiate the gpio-keys driver for these buttons by
> removing place holders and replacing proper pins for the buttons.
>
> The USER_SW{1,2,3} configured as wakeup-source, so it can wakeup the
> system during s2idle.
>
> Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>

Thanks for the update!

> --- a/arch/arm64/boot/dts/renesas/r9a08g046l48-smarc.dts
> +++ b/arch/arm64/boot/dts/renesas/r9a08g046l48-smarc.dts
> @@ -7,10 +7,18 @@
>
>  /dts-v1/;
>
> -/* Add place holder to avoid compilation error with renesas-smarc2.dtsi */
> -#define KEY_1_GPIO             1
> -#define KEY_2_GPIO             2
> -#define KEY_3_GPIO             3
> +/* Switch selection settings */
> +#define RZ_BOOT_MODE3          0
> +#define SW_DPI_EN              0

The macro SW_DPI_EN is active-high...

> +#define SW_GPIO4               0

... but the macro SW_GPIO is active-low?

> +
> +#define PMOD_GPIO4             0
> +#define PMOD_GPIO6             0
> +#define PMOD_GPIO7             0
> +
> +#define KEY_1_GPIO             RZG3L_GPIO(J, 3)
> +#define KEY_2_GPIO             RZG3L_GPIO(6, 4)
> +#define KEY_3_GPIO             RZG3L_GPIO(6, 5)
>
>  #include <dt-bindings/gpio/gpio.h>
>  #include <dt-bindings/input/input.h>
> @@ -30,11 +38,17 @@ aliases {
>  };
>
>  &keys {
> -       status = "disabled";
> -
> +#if RZ_BOOT_MODE3 || SW_GPIO4 || PMOD_GPIO4
>         /delete-node/ key-1;
> +#endif
> +
> +#if SW_DPI_EN || PMOD_GPIO6
>         /delete-node/ key-2;
> +#endif
> +
> +#if SW_DPI_EN || PMOD_GPIO7
>         /delete-node/ key-3;
> +#endif
>  };
>
>  &pinctrl {
> diff --git a/arch/arm64/boot/dts/renesas/rzg3l-smarc-som.dtsi b/arch/arm64/boot/dts/renesas/rzg3l-smarc-som.dtsi
> index 6d86b88ce104..bc1178c7484a 100644
> --- a/arch/arm64/boot/dts/renesas/rzg3l-smarc-som.dtsi
> +++ b/arch/arm64/boot/dts/renesas/rzg3l-smarc-som.dtsi
> @@ -5,6 +5,23 @@
>   * Copyright (C) 2026 Renesas Electronics Corp.
>   */
>
> +/*
> + * Please set the below switch position on the SoM and the corresponding macro
> + * on the board DTS:
> + *
> + * Switch position SYS.5, Macro SW_DPI_EN:
> + *      0 - Select multiple SMARC signals active
> + *      1 - Select LCD

While the SW_DPI_EN macro is active-high, the signal SW_DPI_EN#
is active-low, so setting the switch ON pulls SW_DPI_EN# low, which
is OK...

> + *
> + * Switch position BOOT.1, Macro RZ_BOOT_MODE3:
> + *      0 - Select SDIO {CD,IOVS,PWEN} and GPIO4 Active
> + *      1 - Select JTAG enabled

Setting the switch on pulls RZ_BOOT_MODE3 low, hence disables JTAG!
So this is inverted compared to SW_DPI_EN above?

> + *
> + * Switch position SW_GPIO4, Macro SW_GPIO4:
> + *      0 - Select GPIO4
> + *      1 - Select RZ_VBAT_TAMPER

This is a single pole double throw switch, so please document the
which position corresponds to 0 and 1:

    *      0 - Select GPIO4 (position 2-3)
    *      1 - Select RZ_VBAT_TAMPER (position 2-1)

However, I think it would be more logical if SW_GPIO4 == 1 would mean
that GPIO4 is enabled.

> + */

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

