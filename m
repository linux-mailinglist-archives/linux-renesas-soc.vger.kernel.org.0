Return-Path: <linux-renesas-soc+bounces-23087-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 5BA57BDF6A2
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 15 Oct 2025 17:37:04 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id AC6973BD646
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 15 Oct 2025 15:36:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6EBD02FCBF5;
	Wed, 15 Oct 2025 15:36:12 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-vs1-f45.google.com (mail-vs1-f45.google.com [209.85.217.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7DD1A3054C2
	for <linux-renesas-soc@vger.kernel.org>; Wed, 15 Oct 2025 15:36:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.217.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760542572; cv=none; b=P0JZYoraZVfYoTjfTKqIzI/a1NJ20WorreyiSCfSTiGfdBvujb1IxlkK8exRZ+7caWlA3M3AdfS3JQmOf+wSd+Et5tWoLsEJNS41FfmGY7exMbtgzOmI3xdetZkCVPttpzB4f/lbe9pPWCCz5O0YbvzKTauSLPu7TM75qX/qmm0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760542572; c=relaxed/simple;
	bh=I6P15+XhidIm4wEGq3EBOacS03cItxiFUaa6LkWs8hg=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=QWJjQDeFdBJeWiBoofhVuCnLQgvQRqsjJZDw5VoKrFgAZRvLRD/a0F76brVNlrvgG9uwb14BLFDVbQR8bG2iAezK01tSA0qxa9TBEpP3i5Prt2qaTWMQfgmhfc7118LdupQeUFo2hzvj4mSexzu1x7UKZjh+pnYaT+v2rR08wP8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.217.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vs1-f45.google.com with SMTP id ada2fe7eead31-5d42137abc2so6076215137.2
        for <linux-renesas-soc@vger.kernel.org>; Wed, 15 Oct 2025 08:36:10 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760542569; x=1761147369;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=DNmUCrYMJqR/KXnbLWdaSqa9Gxw7R7jjIcZiaJXQXIA=;
        b=JIw9ncRybRSUgZ6ISnRgDwnKwXXTs726nNZYlxUMPDjBA5uO+fwGpLJ2BrG4cRn1cm
         rGH+4bvkwOEJSHPo0K3N3+2Hyv9IO1ML4CES/OfCIb2JyOw/miYH0QrxewqSo/wguY0s
         GrS/tkxR/zAaGyEZFBWLmm2kVYqME/9EExBxsI7r+OT+IEgaz3kiJhmg5JnAdEXTYScw
         IjHF6OwZQhpvJuJzEClFjIm7ETrDhZ2GxZzOMBkmHpxSZdR0Ngglt6+krjlRSAWZrMeL
         Qw0Bymd08XA17Np2ZyXrzqoAheUTuuoj6YXmGji4I0cmb5dc8uV/Wm5pye8V/odOMI8d
         eLkQ==
X-Forwarded-Encrypted: i=1; AJvYcCXERcFPjyQs8RoxapYIFs3s9esgXtyaQNMVKv28QYJBl7kK1CocJ8L/sT9CAPkviL//KxfdjM9pGfPVQybfwUnmAA==@vger.kernel.org
X-Gm-Message-State: AOJu0YyMB37hVQnnRUNoyV6kgr8JHYNwMbr4eQBuishbqVFJQ0h6Yctd
	fM8nQr3YGBxRcJicPF4iBrKrX1GC42JKMmLIJn/7Ro2VSnBnHYxMyntZqeWNcqIs
X-Gm-Gg: ASbGncs1HmFBkgeYdREy3HTBm8+D4pkatnkgF83yaUYz/JcUGnp4nyUURAOrxElxw2l
	ucaB1OLfsvDaYKIBBekvAd0qH0ceFGRyhh473vXDoTp2vu+C96qy6izF/DhFhg6O39neX3bveWR
	Zr2BfsPoyRPOIIM1uu9BXkVBrqrLXxcfxkfHUM+4RdQSstBrefZeMi60i5R7v0/PZRiuNWfVuXp
	ClRdhIZL/HK0VgCmINETflgf/Wn9gRag4cveoAHV1+GKxX3MgA+RG6WXrYMtStxFYjt/o9YpHnr
	DVNgSOHM8C2FSEYID/gf6retaGAya7EPSc53c1mUVRly4h6Hy8ItVQGWLnx9yb26D943+DoMHG6
	FkwIXeNc5A1KvcU+cCQ0u3r0moKGw4CAn8+BcUhPl1gW4LzkJrrwAZWxoJ0R81VomkOfkBgP6jn
	Jk1ZII34lBcWTypeguT8jukwvIns48
X-Google-Smtp-Source: AGHT+IHBmpY/adDb0ki6UsiOl+5zycgSlxOZbEgoOzLEspEymMvnojbl1U4iNB3vtsOLTnJ3wIXHrw==
X-Received: by 2002:a05:6102:b02:b0:529:4cf5:8aee with SMTP id ada2fe7eead31-5d5e224dca0mr10012207137.12.1760542568965;
        Wed, 15 Oct 2025 08:36:08 -0700 (PDT)
Received: from mail-vk1-f182.google.com (mail-vk1-f182.google.com. [209.85.221.182])
        by smtp.gmail.com with ESMTPSA id ada2fe7eead31-5d5fc761bbesm5483179137.7.2025.10.15.08.36.08
        for <linux-renesas-soc@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 15 Oct 2025 08:36:08 -0700 (PDT)
Received: by mail-vk1-f182.google.com with SMTP id 71dfb90a1353d-554a7e98e19so4583691e0c.3
        for <linux-renesas-soc@vger.kernel.org>; Wed, 15 Oct 2025 08:36:08 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCVB71jUImnZWegATJZyhIi7EGrLcLTYnPIztNpVCI9UleLbyQuPGsPDxN2/iERIWjm3MK8OzQjOr9a6Cr7KMQXPsA==@vger.kernel.org
X-Received: by 2002:a05:6102:3f8d:b0:5d6:254f:4e24 with SMTP id
 ada2fe7eead31-5d6254f4e58mr4448769137.32.1760542568340; Wed, 15 Oct 2025
 08:36:08 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20251014153314.177300-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
In-Reply-To: <20251014153314.177300-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Wed, 15 Oct 2025 17:35:56 +0200
X-Gmail-Original-Message-ID: <CAMuHMdUBthNYYOg4WHjt+gJRL=g00wmiqCsx+La_3NCUrCJ9gg@mail.gmail.com>
X-Gm-Features: AS18NWC2xZ5k0_H_MwKSUXMl7-yjZeX_uMDf4r_eO11t9puIMof4gvI7VNM2V8g
Message-ID: <CAMuHMdUBthNYYOg4WHjt+gJRL=g00wmiqCsx+La_3NCUrCJ9gg@mail.gmail.com>
Subject: Re: [PATCH] arm64: dts: renesas: rzt2h-n2h-evk: Add VCC supply for EEPROM
To: Prabhakar <prabhakar.csengg@gmail.com>
Cc: Magnus Damm <magnus.damm@gmail.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	linux-renesas-soc@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Biju Das <biju.das.jz@bp.renesas.com>, 
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>, 
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>, 
	Bartosz Golaszewski <bgolaszewski@baylibre.com>, Linux I2C <linux-i2c@vger.kernel.org>, 
	Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>
Content-Type: text/plain; charset="UTF-8"

Hi Prabhakar,

CC at24, regulator

On Tue, 14 Oct 2025 at 17:33, Prabhakar <prabhakar.csengg@gmail.com> wrote:
> From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> The R1EX24016 EEPROM on the RZ/T2H-N2H Evaluation Kit is powered from
> the 3.3V rail. Add the regulator phandle for the VCC supply to reflect
> this in the device tree and avoid the fallback to the dummy regulator:
>
>     at24 0-0050: supply vcc not found, using dummy regulator
>
> Fixes: 0176c9e82e10 ("arm64: dts: renesas: rzt2h-n2h-evk-common: Enable EEPROM on I2C0")
> Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>

Thanks for your patch!

> --- a/arch/arm64/boot/dts/renesas/rzt2h-n2h-evk-common.dtsi
> +++ b/arch/arm64/boot/dts/renesas/rzt2h-n2h-evk-common.dtsi
> @@ -160,6 +160,7 @@ eeprom: eeprom@50 {
>                 compatible = "renesas,r1ex24016", "atmel,24c16";
>                 reg = <0x50>;
>                 pagesize = <16>;
> +               vcc-supply = <&reg_3p3v>;
>         };
>  };

"vcc-supply" is not a required property, according to the DT bindings,
and I believe the 3.3V supply can be considered always-on (but see
below to encounter dragons).
I was always under the impression that these "supply not found, using
dummy regulator"-messages are just informational, and can be ignored,
but they are at the KERN_WARNING level.
So should we add real dummy supplies to DTS, or not?

Thanks!

P.S. Actually the 3.3V supply is controlled by an SLG7RN46899, which is
     an "RZ/T2H Power Sequencer with IIC".  From a quick glance at the
     documentation, it is not clear to me what is the purpose of the
     I2C interface, and whether it can be used to control the outputs
     or not.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

