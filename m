Return-Path: <linux-renesas-soc+bounces-12903-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 3F043A2A72C
	for <lists+linux-renesas-soc@lfdr.de>; Thu,  6 Feb 2025 12:17:27 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 28F90188804E
	for <lists+linux-renesas-soc@lfdr.de>; Thu,  6 Feb 2025 11:17:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8C43C2147E4;
	Thu,  6 Feb 2025 11:16:34 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-vs1-f43.google.com (mail-vs1-f43.google.com [209.85.217.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4F0CB22D4E1;
	Thu,  6 Feb 2025 11:16:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.217.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738840594; cv=none; b=srNOsGlR3MDwba/jxS5Hiyd0C+NsxqXwol2vmjeMJVsSRxopbNnfpwjWgAJ8ex76IqGjnPv0gjUx949lgvayb4AwEgEkEitTP8c+5UrnzHlGMsWme4wXutaMWlFxJaj7l9cU9aJki0E7gsXOIWdYtbzbtb1YTBmkgi9NJjp7IB4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738840594; c=relaxed/simple;
	bh=UuLdarRfuoxlFPi1Ph8y04dtaYoWHWGc7aTrO93gla4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=QuilRGJc4MMQrxxH9qKBY1aO53Efjn74dGN6Nr8A4/5GQ8YOT9qCI4U6Ejdp77A4nYYZopN9vOJ+D7an33v2uTA0QncqjfkwUz1Wlrjx4Qo89PMnBpKfqu89iU1iRiGLih36KiRh/pnL9K4yXIlP/r8wd6g/DSJ4eSXSQ1HhhbE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.217.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vs1-f43.google.com with SMTP id ada2fe7eead31-4ba7ab22192so116853137.3;
        Thu, 06 Feb 2025 03:16:31 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738840589; x=1739445389;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=//+PJmIs/7Gi54i7iKXDbeeOP+JccMOw2lnKBTAPwIc=;
        b=Z/UHMfNiXqjm4hSuM10e/kkKIdp/bcvSihm8GsuluTu5MPMwHfMHqZcLqqfK6IWajX
         7nB9YBsIAfvErdhRxdVw79GC5I+AnKCIK8sp04hzbmM6t8CjXq3UxXvyc0XDsHkH72X3
         4vsunjZ/ujjiDfl4fwm/ilH37FSCqPCSHi+jusdA/jVslRokuwygX0hjQvYdjwS3mgCr
         61oG0bI+c1a7xcfPJFBWYgDwiI/cGINa7JKMEGvSDVsydnDuXgNVbbeIGLyaRacDxrQi
         jrOK2LWZfrSwSRfTn/X/n+xnRtwmNadhTmdp+bT8/1gcI7PM9sNOETBC6j1LXPWTa7Bk
         zdaA==
X-Forwarded-Encrypted: i=1; AJvYcCUmPappiV0YY2bJLHbIhWF8iKbnVZh57j/NkmRDA0clMkLIRm8iV57vM9RIfG8GLEPJqZCRoq7sl6KeuX1Hr+wt26M=@vger.kernel.org, AJvYcCV9tWZIriT4aEvBeeQKkN2j8kbBkIppbRps1Dt4sRldCJ/7JlDLJ7N1iXgZEE7P1hMQKlmC2+MKWmsJ@vger.kernel.org, AJvYcCVDtT8nSsnascwcksx7TjXuoH7ZpZVmLWjZ5+KHaJHNPrv1BIkqgTvY0KVpbuDOu6lM6vqud95t3WBKyW2k@vger.kernel.org
X-Gm-Message-State: AOJu0Yyqah6kTeE2/sdbDvlIvk5sqPVek9xGcheXw/ANIgoIAwTuBHp9
	DqWKrIBll3u4WRFVFIx7km5oaP/RwcPhzV+YLS1G0DH4GPRJXBhOpUmTEzxp
X-Gm-Gg: ASbGncsozqceXjcMyDprLOPt/mdEBGAERIxyYQvIOzYKff8TNEHR3UNIR/cPhvvQOYH
	Y9gD/UyuqqW9sdfC1ycT72P56X3RwKAbh2g3BQ+3nHyaXy0I8QEQhUbogcJYD7tEj1f2nNwJ2KW
	zsm6GRpVxxg6m/pV9h0EiM2yx/Z8qrFEGcp3EHSp/KAjsCmNLbsCZFMpesXHKQ5I/dKNVQgoyP9
	rGvTIFjXNvCKjm9lsNHQWy6sCHyfEMT9EDB9KMbKFpKZbReuNJNO4OGpQXLDcFxEMtf34I9lxl5
	mmihOjaBE7/t0iQL4Z0IReJfid7Tr03t0+AUD5gtXWgS/G4bwF5tuA==
X-Google-Smtp-Source: AGHT+IGtJFEpnvpe1ZSxHHRAhFckKnv6hnji8IewNnvyXm9Bzsz6E5o1LxxoLPL6SBecp/TvNa5n4A==
X-Received: by 2002:a05:6102:1515:b0:4b6:3d72:5c28 with SMTP id ada2fe7eead31-4ba47a8c4e3mr4694876137.18.1738840589258;
        Thu, 06 Feb 2025 03:16:29 -0800 (PST)
Received: from mail-ua1-f44.google.com (mail-ua1-f44.google.com. [209.85.222.44])
        by smtp.gmail.com with ESMTPSA id a1e0cc1a2514c-866f97d7902sm163420241.27.2025.02.06.03.16.28
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 06 Feb 2025 03:16:28 -0800 (PST)
Received: by mail-ua1-f44.google.com with SMTP id a1e0cc1a2514c-8622c3be2f4so198754241.1;
        Thu, 06 Feb 2025 03:16:28 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCVnK3t4LTJ0elWnHKMHNDNL9DFXrv5f7uROZcZ6lP2HX3JNEgNaINPWzZl3X8uGnkP9mYKsqi6VaDFuFpQIX0XVi9g=@vger.kernel.org, AJvYcCWjvuCxc9OfTDpDq+DdMruIFgjcqY20/Cz4WK5elIQZqa9AdYR0AYFseCMFAiB4eD3WSaDZquLpWzyy@vger.kernel.org, AJvYcCXRbRGhcOWToqvvJUIliwXv0M9NrhVYhk9bAX06fwHuZlVJ0NBjWlv5/KE/TC66Rvo1aD7uV8B5mvlx939n@vger.kernel.org
X-Received: by 2002:a05:6102:809e:b0:4b1:16f8:efc4 with SMTP id
 ada2fe7eead31-4ba4791aa90mr4226310137.12.1738840588352; Thu, 06 Feb 2025
 03:16:28 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250131-myir-remi-pi-v3-0-2dda53e79291@collabora.com> <20250131-myir-remi-pi-v3-2-2dda53e79291@collabora.com>
In-Reply-To: <20250131-myir-remi-pi-v3-2-2dda53e79291@collabora.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Thu, 6 Feb 2025 12:16:16 +0100
X-Gmail-Original-Message-ID: <CAMuHMdXAS6pnNcT=A7i9La22tbDXYf7EKqbJzHuK2ze2gf6cgg@mail.gmail.com>
X-Gm-Features: AWEUYZlTMlTyS7G50P-0xRIKRghcKDvJbTN5YUG58ZUK4AGmfGIcfS-edw6EtK0
Message-ID: <CAMuHMdXAS6pnNcT=A7i9La22tbDXYf7EKqbJzHuK2ze2gf6cgg@mail.gmail.com>
Subject: Re: [PATCH v3 2/2] arm64: renesas: add initial support for MYIR Remi Pi
To: Julien Massot <julien.massot@collabora.com>
Cc: Magnus Damm <magnus.damm@gmail.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, kernel@collabora.com, 
	linux-renesas-soc@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Hi Julien,

On Fri, 31 Jan 2025 at 10:58, Julien Massot <julien.massot@collabora.com> wrote:
> Add basic support for the MYIR Remi Pi (based on r9a07g044l2):
>  - UART
>  - i2c
>  - emmc
>  - USB host
>  - HDMI output
>  - Ethernet
>
> Signed-off-by: Julien Massot <julien.massot@collabora.com>

Thanks for the update!

> --- /dev/null
> +++ b/arch/arm64/boot/dts/renesas/r9a07g044l2-remi-pi.dts
> @@ -0,0 +1,351 @@

> +/ {
> +       model = "MYIR Tech Limited Remi Pi MYB-YG2LX-REMI";
> +       compatible = "myir,remi-pi", "renesas,r9a07g044l2", "renesas,r9a07g044";
> +
> +       aliases {
> +               ethernet0 = &eth0;
> +               ethernet1 = &eth1;
> +
> +               i2c0 = &i2c0;
> +               i2c1 = &i2c1;
> +               i2c2 = &i2c2;
> +               i2c3 = &i2c3;
> +
> +               mmc0 = &sdhi0;
> +
> +               serial0 = &scif0;
> +               serial3 = &scif3;

Wasn't the plan to drop scif3, so it can be used by an RTOS running
on the Cortex-A33 core?

> +               serial4 = &scif4;
> +       };
> +
> +       chosen {
> +               stdout-path = "serial0:115200n8";
> +       };
> +
> +       memory@48000000 {
> +               device_type = "memory";
> +               /* first 128MB is reserved for secure area. */
> +               reg = <0x0 0x48000000 0x0 0x38000000>;
> +       };
> +
> +       reg_5p0v: regulator-5p0v {

> +       reg_3p3v: regulator-3p3v {

> +       reg_1p8v: regulator-1p8v {

> +       reg_1p1v: regulator-vdd-core {

> +       hdmi-out {

More sorting work to do...

> +};

> +       sdhi0_pins: sd0 {
> +               sd0_data {
> +                       pins = "SD0_DATA0", "SD0_DATA1", "SD0_DATA2", "SD0_DATA3",
> +                              "SD0_DATA4", "SD0_DATA5", "SD0_DATA6", "SD0_DATA7";
> +                       power-source = <1800>;
> +               };
> +
> +               sd0_ctrl {

Here, too. Plus the underscores reported by Krzysztof.

> +                       pins = "SD0_CLK", "SD0_CMD";
> +                       power-source = <1800>;
> +               };
> +
> +               sd0_rst {
> +                       pins = "SD0_RST#";
> +                       power-source = <1800>;
> +               };
> +       };

I fixed the style issues locally, so if you can confirm or deny the removal
of scif3, I can fix that while applying.

Thanks!

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

