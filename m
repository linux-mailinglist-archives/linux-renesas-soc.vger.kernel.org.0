Return-Path: <linux-renesas-soc+bounces-15123-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 76121A76314
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 31 Mar 2025 11:19:34 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id CBFEE3A66D7
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 31 Mar 2025 09:19:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 825B78F5B;
	Mon, 31 Mar 2025 09:19:31 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-ua1-f44.google.com (mail-ua1-f44.google.com [209.85.222.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6B974259C;
	Mon, 31 Mar 2025 09:19:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743412771; cv=none; b=Ro56RTTYwmuPhPTb1iZ1ruqI5PySP7SE7x7z/hcSc0VeHpJVsFCNoWTG41J2EY+TLP/qPj7cRYrXtBWtFXaBpAPzuMtnNT58EAc1PNP781obgQrV7b6tHHw2G+Q2cgaj/lvWZ9TtPVR9f78a0GxXXo2TORL8y117OGHD8W37O1I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743412771; c=relaxed/simple;
	bh=7c0qmFds8EV3cDGq1yo9ks7ah3r6Eu5mm9ICXN7DqtE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=UXJffmMACciDRrJLMirBM8T6gVweXSq6WogyBcPElWfBgEuwR92AVzdWH4+I3R5kWjRlm5aPOPIYOtxmWUe9ctyLGFlrPcN7EQ+jwS4P2fR/5L3uzGuUjBpiRbwT5YnkubmMQlDTsFfp7TC7QqzporFHABc4vH76R//HdZG8kjk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.222.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ua1-f44.google.com with SMTP id a1e0cc1a2514c-86feb84877aso1681993241.3;
        Mon, 31 Mar 2025 02:19:29 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743412766; x=1744017566;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Y1aWj+bfn1QXmL2H/p3AwAZB6J44E1Tiv+2Ia6bC4Fc=;
        b=Bq1pllICEXjEEAWQKzkFCc2AjRcYKLvDCBEFeyX0MiG7sUyUypDOZCUFFTbbeJoEq5
         VF+sMCniIiOPqGYysIgefIjba0Gr0B9Xzu1d+enBolLVz4IhmbefVLI4S8yloygXnsC+
         28h7gB5jjRofjCX6Hn47Ru+mLE5xn4B7U5psSbL9LdkFGKH/yL1Ogrz5ovFl3uzmEELb
         hkuadbe38P7jvtNSg765VE/KAnkdYuQOqebe5P+OK33gsYFPeCHpugWnSPaqGpNW3L34
         ep+Y/fjW/fnWXCF/T3Nm0yoCTZIRZk4/EsTM3hat+Z6hswdgtaXCc1+l62joaAY8/5If
         qerQ==
X-Forwarded-Encrypted: i=1; AJvYcCVprCrB/HdaZySoSxVrkI00NBJdnHumqRYKaeZPn2fiUxYdBNhnIg1XNdeLj/X0YcjSxYp6ia2/cIDPoslRFC0es2g=@vger.kernel.org, AJvYcCWdaHep6haDyVXPdeLTn0J8gb2IyiVrlHPBZIOkcpKvQwjSSfUFzqM7nUfHiUPayg4+tkN5dkw5yFE=@vger.kernel.org
X-Gm-Message-State: AOJu0YzoTirDBGNlbfSrCtlDs1iiDurFr6gb1DmN+ci/sHsyH1/WVidC
	NcQi2JUA4pavtGxZ6w6ePyMkTJjfyrD7I4Fu+Ne3zHf6O7gHEvqWjlTT0pJY
X-Gm-Gg: ASbGncvBB5e8bFjd3QlRqdmmAyvE3GeTxaFV3a66W4B2tyl2wC9lbYISohByrVUJn3D
	91QdLnOkZ+ah4imY4TQyg4n+hT6B476FuBNfQJ6/D3HLf6snj15XVqaoFZzabGwkQEsNyoqjelx
	gFtvW+rfn27sCoyWNo2XahsQZQqGjjCBtXl0k9a1i+G2AYwJ6ZywH7Z5IZUAKJ44fhEvufYKyp1
	xuPwgqxj5QvJ1GKKcvQhma+3hQ8GEGgbbtZbjmdVZhbXQ3h333MQxhaQvyhkXYK3j+S62q36FRb
	NV5IuHmxU2yiwXMXdJQGkBD8R0ahrkjHSO60Q2nUzrFhf+vd2XT4OqJxcAqSGdNi9ZGQMtHAN6f
	kDj6uZS+9xM4GsnAkQQ==
X-Google-Smtp-Source: AGHT+IGiJm2b6oRFZRF9d/zEtfUTF5YcCjlZBDaPzF7X5ONQQy4pJzIt7CHJBtZ4yFGdwa+xJXU1OA==
X-Received: by 2002:a05:6102:c09:b0:4c2:4b08:12e3 with SMTP id ada2fe7eead31-4c6d38d53aamr4327337137.14.1743412766281;
        Mon, 31 Mar 2025 02:19:26 -0700 (PDT)
Received: from mail-ua1-f47.google.com (mail-ua1-f47.google.com. [209.85.222.47])
        by smtp.gmail.com with ESMTPSA id ada2fe7eead31-4c6bfcb729asm1485619137.12.2025.03.31.02.19.25
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 31 Mar 2025 02:19:25 -0700 (PDT)
Received: by mail-ua1-f47.google.com with SMTP id a1e0cc1a2514c-86d30787263so1844980241.1;
        Mon, 31 Mar 2025 02:19:25 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCVxDCJTq/tb0+b6fV4jJbVrvmyXSxVhu4COTrCOGN5jWm2kHQJNgExdFeyeP37q0OYjhXm12n07yz8=@vger.kernel.org, AJvYcCWd8HUA5pcVMzwFB8GF4JBozE8TmXT0Arus5PZWAOPVbpXlTnedsLe23V/sHbVQcPEWxFLGeP44ZPbzdB4p+ZBseZA=@vger.kernel.org
X-Received: by 2002:a05:6102:14a8:b0:4bb:eb4a:f9f2 with SMTP id
 ada2fe7eead31-4c6d38852c7mr4913880137.9.1743412765229; Mon, 31 Mar 2025
 02:19:25 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250329080036.49170-1-biju.das.jz@bp.renesas.com>
In-Reply-To: <20250329080036.49170-1-biju.das.jz@bp.renesas.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Mon, 31 Mar 2025 11:19:13 +0200
X-Gmail-Original-Message-ID: <CAMuHMdW8zfxixBA6Ahe2JVtNnwYroEXpmSCR94C9fohFCpSPzQ@mail.gmail.com>
X-Gm-Features: AQ5f1Joflex0umWnVrHVzuYUDAeeG8HVYcs7q0qlLzwEROzYHZObEOToS0CHtJI
Message-ID: <CAMuHMdW8zfxixBA6Ahe2JVtNnwYroEXpmSCR94C9fohFCpSPzQ@mail.gmail.com>
Subject: Re: [PATCH v2] mmc: host: Kconfig: Fix undefined reference to rdev_get_drvdata()
To: Biju Das <biju.das.jz@bp.renesas.com>
Cc: Ulf Hansson <ulf.hansson@linaro.org>, Adrian Hunter <adrian.hunter@intel.com>, 
	Victor Shih <victor.shih@genesyslogic.com.tw>, 
	Ben Chuang <ben.chuang@genesyslogic.com.tw>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
	Sergey Khimich <serghox@gmail.com>, Shan-Chun Hung <shanchun1218@gmail.com>, 
	Peter Robinson <pbrobinson@gmail.com>, Geert Uytterhoeven <geert+renesas@glider.be>, 
	Wolfram Sang <wsa+renesas@sang-engineering.com>, linux-mmc@vger.kernel.org, 
	Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>, Biju Das <biju.das.au@gmail.com>, 
	linux-renesas-soc@vger.kernel.org, kernel test robot <lkp@intel.com>
Content-Type: text/plain; charset="UTF-8"

Hi Biju,

On Sat, 29 Mar 2025 at 09:00, Biju Das <biju.das.jz@bp.renesas.com> wrote:
> The driver no longer builds when regulator support is unavailable. Fix
> the build error undefined reference to rdev_get_drvdata() by selecting the
> REGULATOR in config MMC_SDHI.
>
> Fixes: fae80a99dc03 ("mmc: renesas_sdhi: Add support for RZ/G3E SoC")
> Reported-by: kernel test robot <lkp@intel.com>
> Closes: https://lore.kernel.org/oe-kbuild-all/202503290554.zASQT70Q-lkp@intel.com/
> Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
> ---
> v1->v2:
>  * Added 'if ARCH_RENESAS' to leave SUPERH out
> ---
>  drivers/mmc/host/Kconfig | 1 +
>  1 file changed, 1 insertion(+)
>
> diff --git a/drivers/mmc/host/Kconfig b/drivers/mmc/host/Kconfig
> index 6824131b69b1..f62e436b1d4f 100644
> --- a/drivers/mmc/host/Kconfig
> +++ b/drivers/mmc/host/Kconfig
> @@ -692,6 +692,7 @@ config MMC_SDHI
>         tristate "Renesas SDHI SD/SDIO controller support"
>         depends on SUPERH || ARCH_RENESAS || COMPILE_TEST
>         select MMC_TMIO_CORE
> +       select REGULATOR if ARCH_RENESAS

Regardless of Arnd's comment, making the select optional means the
build can still break when compile-testing on a non-Reneas platform.

>         select RESET_CONTROLLER if ARCH_RENESAS
>         help
>           This provides support for the SDHI SD/SDIO controller found in

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

