Return-Path: <linux-renesas-soc+bounces-26438-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id E9469D04530
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 08 Jan 2026 17:24:17 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id C6E023090B3C
	for <lists+linux-renesas-soc@lfdr.de>; Thu,  8 Jan 2026 15:47:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5B5D52E719E;
	Thu,  8 Jan 2026 15:43:59 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-vk1-f181.google.com (mail-vk1-f181.google.com [209.85.221.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7D73B2D9797
	for <linux-renesas-soc@vger.kernel.org>; Thu,  8 Jan 2026 15:43:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767887039; cv=none; b=kKWRNArkhd+AgulmEXhF+8ylThmE2Tr6dXwZkQBIWGLhZHD5d4kzbQRiCKaG80i+F1fNLI6f2TjXwmLBZMkOFI8beGtsr/dduWypE0o4AebdpqWE82Hemv1cAvUUb/NsCJTs792uCiqt/Nz5DCbeJwIMeBWOpJbtyZ7RvdbpcNg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767887039; c=relaxed/simple;
	bh=szg4XoxN3u9g+Ff2h/pAFUtLTJUETFvDphXYepeSKBI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=k3v95GTz8KwziodSpDhJzST4+b8/26pqoov01H9CgyxZF2EFzxr/3IumvvHLiViKfMrkQlX1mJnbuuMTqbjooxBpZEAPAiic9zaH4x5ykJtJfKbC5Mz6hl9FAjx8jbCzZdwxMIeGPowZleOiS1o5JhMNkfSS3ryJEvDi0APfrf8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.221.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vk1-f181.google.com with SMTP id 71dfb90a1353d-55ab217bb5eso577586e0c.3
        for <linux-renesas-soc@vger.kernel.org>; Thu, 08 Jan 2026 07:43:56 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767887035; x=1768491835;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=jAzoJbmxW9Hq33LekfntKKNhXdUxUdN8KMqCFiNMSXI=;
        b=Wer19Vl8O1PL2GtiGAxdUardKk9hfgjfhfTw9VKmZClTDThKAw1Wt0DwMNN5+wU5Ip
         OJei+k06CPzZCxkJD8NrbvOCV0A2GSdDIOPfUnKQhvBHm7GmNutTUmg8Axr5Py2f9gY4
         hARztwFdO/oYTxlMg2Q10nSMHtHf8GSIqyVgHrtlkdRJReGICnlvqG3SahzI081pMYfy
         pkdpfyA8asoqLD5RsBCE0bKBxf36yJqGh58z3kCipOnXKaAZlf5K1CG5PzJ4G6IizSYk
         Eh7Y7NkPZJlulSEQg+3ZLFPnxmh3RmpQhkV7lMrD2ED+ZTvzdqbPTmpBX18TeuK4M+zo
         pOSw==
X-Forwarded-Encrypted: i=1; AJvYcCWZoaFPaRIk+4RpJfzYG5sKay7yTaVYuDWp/yt7a7BQ7RvqzvUsago6tkga1dRULLEMLPD55jZi+4FOD0uS89EFfA==@vger.kernel.org
X-Gm-Message-State: AOJu0YwA36lcxK+sQZNPG0brA1gpmSkBjbBN1b765iMsQroWi4JF8bv9
	86rc2ZyM+lca9umnSRjAYe4i6QexZEOuok2GfL9qVjw+JUQpzHzUa4OI+FFHfH7i
X-Gm-Gg: AY/fxX51Ca5sYfd1XuXjWsHxWJNXRPe3+06pBBZCz+MjJp+rHQW/xbtn+AaguUtxlIQ
	HqgOqyoR/7m6JtQrCKR/PtJlNjS0iaxkB+JtAkRa5QqUvmzh39mRkcJyq8vnwCbagly67XEyNH0
	ZIAfm3Zb86gIjrmGwEFA1zrT8egcjZOJAMZ12tqpmb85JszT+gH/n24uEUYjFqDWCAaBCqF9jgB
	sVD8xk17B2yD9lMrjyV7Fwm/ATrAqxbr3xS0VgvVvQp6dY2VmEQ0qD9eK5nnQe/Hcju+VYKyyIb
	dRWhSRAS2plBPHp0XMwpZ6FQ9oDKolCKWurqK6TqVy3pP5jM4TIQqmm2O4xQAhdk2W+pJbGE4sO
	R8vCubSIWeNuV+Az0TzH63hb4kHffgb6utgHVxzCHQbhOiUkORTfaYgg5S6UiNDq7nLmjJ0Vm88
	cm7Nt/j/iYSFAs3nna5Ch5m99V4WVuBGUI62I8mL9j0N7+6EN7
X-Google-Smtp-Source: AGHT+IHvVSOWU3H52qb0tv+KItTHtiU/FttwD5JRGfo7Bmyf0PC/4cBelrblF6x+XGQxNFz5S8pI/w==
X-Received: by 2002:a05:6122:4b89:b0:55b:305b:4e38 with SMTP id 71dfb90a1353d-5634800729cmr2406524e0c.19.1767887035163;
        Thu, 08 Jan 2026 07:43:55 -0800 (PST)
Received: from mail-vs1-f42.google.com (mail-vs1-f42.google.com. [209.85.217.42])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-5634d9162a4sm4652361e0c.15.2026.01.08.07.43.54
        for <linux-renesas-soc@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 08 Jan 2026 07:43:54 -0800 (PST)
Received: by mail-vs1-f42.google.com with SMTP id ada2fe7eead31-5ed0b2f1fccso396469137.1
        for <linux-renesas-soc@vger.kernel.org>; Thu, 08 Jan 2026 07:43:54 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCX4tvZcYGzS9w1Tu5T7lSI6XVAIydC/hOLWmDwxbfDSxhUxi0Jx+GCIGuX1WGrLC63BQbgqyCzghbyj5kbJ05cMCw==@vger.kernel.org
X-Received: by 2002:a05:6102:554b:b0:5ea:67f4:c1ad with SMTP id
 ada2fe7eead31-5ecb68aff05mr2439515137.21.1767887034584; Thu, 08 Jan 2026
 07:43:54 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20251126130356.2768625-1-cosmin-gabriel.tanislav.xa@renesas.com> <20251126130356.2768625-9-cosmin-gabriel.tanislav.xa@renesas.com>
In-Reply-To: <20251126130356.2768625-9-cosmin-gabriel.tanislav.xa@renesas.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Thu, 8 Jan 2026 16:43:43 +0100
X-Gmail-Original-Message-ID: <CAMuHMdX9zNBNtUNwLN4SgDbMpvyMOBYVhVwufgB4zC+F+OCgVw@mail.gmail.com>
X-Gm-Features: AQt7F2phv5yFw7C9wXRwfNBduSHOcvNWuCOsJEw2DhFFHSG9sOONm1vVQhQj4OQ
Message-ID: <CAMuHMdX9zNBNtUNwLN4SgDbMpvyMOBYVhVwufgB4zC+F+OCgVw@mail.gmail.com>
Subject: Re: [PATCH v3 8/9] arm64: dts: renesas: r9a09g077: add TSU and
 thermal zones support
To: Cosmin Tanislav <cosmin-gabriel.tanislav.xa@renesas.com>
Cc: John Madieu <john.madieu.xa@bp.renesas.com>, "Rafael J . Wysocki" <rafael@kernel.org>, 
	Daniel Lezcano <daniel.lezcano@linaro.org>, Zhang Rui <rui.zhang@intel.com>, 
	Lukasz Luba <lukasz.luba@arm.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Geert Uytterhoeven <geert+renesas@glider.be>, Magnus Damm <magnus.damm@gmail.com>, 
	Philipp Zabel <p.zabel@pengutronix.de>, linux-pm@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-renesas-soc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Wed, 26 Nov 2025 at 14:05, Cosmin Tanislav
<cosmin-gabriel.tanislav.xa@renesas.com> wrote:
> The Renesas RZ/T2H (R9A09G077) SoC includes a Temperature Sensor Unit
> (TSU). The device provides real-time temperature measurements for
> thermal management, utilizing a single dedicated channel for temperature
> sensing.
>
> The TSU loads calibration data via SMC SIP.
>
> Signed-off-by: Cosmin Tanislav <cosmin-gabriel.tanislav.xa@renesas.com>

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
i.e. will queue in renesas-devel for v6.20.

> --- a/arch/arm64/boot/dts/renesas/r9a09g077.dtsi
> +++ b/arch/arm64/boot/dts/renesas/r9a09g077.dtsi

> @@ -952,6 +967,37 @@ sdhi1_vqmmc: vqmmc-regulator {
>                 };
>         };
>
> +       thermal-zones {

I will move this after stmmac-axi-config while applying, to preserve
sort order (alphabetical).

> +               cpu-thermal {

[...]

> +       };
> +
>         stmmac_axi_setup: stmmac-axi-config {
>                 snps,lpi_en;
>                 snps,wr_osr_lmt = <0xf>;

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

