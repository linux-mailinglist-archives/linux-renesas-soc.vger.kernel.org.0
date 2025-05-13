Return-Path: <linux-renesas-soc+bounces-17021-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id C0EE2AB4C8E
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 13 May 2025 09:16:22 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 8657E3A3D36
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 13 May 2025 07:16:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8DC462AF1C;
	Tue, 13 May 2025 07:16:18 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-ua1-f43.google.com (mail-ua1-f43.google.com [209.85.222.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2869F1C84B9
	for <linux-renesas-soc@vger.kernel.org>; Tue, 13 May 2025 07:16:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747120578; cv=none; b=p0YqRdS+mBRNLT5/NyE4H5TZDOM60rL+BJzZT4xnskH7Ez6sqnMNfFgt0SWbgUS9JyFJxZ1cU9gUXviZROOeDfkyPQKtI02kPbuIE1jSMKZx0PVdT9eVveIoZD8RqSYTJHRVLrjZWbbQnN3GjLsh1/FTDWLyDxJIdJofx2xQxaA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747120578; c=relaxed/simple;
	bh=ESdxS5ue/Tm3c3Rt+/WchsT5nR9KW3FVD2t9CjcgACM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Ye0xoIlueToY9MLrrdL6nP4BD6yDHqVYzwwM6eRhrmHR4EqdVLhQQUlMYbz8PjG0JVjaLMGCJkwYt7GIRaBTiLifa8GE3C6JyHwj6aUrZODnPpI/CCL38EmfPdgMlNNK1oTx1qggvHPPKykKF+d9qHjpBtNk8gQRIq8MdPz08Ow=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.222.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ua1-f43.google.com with SMTP id a1e0cc1a2514c-87843d9d40bso1378718241.2
        for <linux-renesas-soc@vger.kernel.org>; Tue, 13 May 2025 00:16:14 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747120572; x=1747725372;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=hzDVo4FQ6ah48v90Cg2f4xDKatHzBs1SUP5exMwf8H0=;
        b=kreH+OoEqvjfbJMK6GHCib1z+T1CCe3hYIlrsAm61jUgMkF+x/jjB7o/R35K/jRmhT
         7BwwDIacWA3DD6bCAlWjB/FQ/ptDtRsSRq2i9CQXjgDskakfAZNNPeCEZqmXP2/z0pOd
         uZtlyjE009vMcTa7f985UaMSKruvJpCAjqB/lFnLWx14WPONcWTNDkac8b4gER8YD4e9
         jwZzMFYgP5QUCZHY1SZq+GANEfhss/bx+NpnFSVAEOnyBGBUcH9qZ5SE73aRc3+PI1AV
         ZhYlt5NoTFcLXR+uTNUdW5HtTcA95bzbKZrrVLqyqmznvVLC8MH7wGSLRZQeMlslCo7p
         90cw==
X-Forwarded-Encrypted: i=1; AJvYcCU4kzptCeuKYIo7d3nItBPYE38BcdcnM1qK9rY/f5QnU+N3xPtpqykLHlkBN0kZkvseL/o2dA7t87g8jVVG5OEmKQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YxmyS05MzOJv1Isi5WXn1qJ8dQK5YMUaq4Ki4wXD0jSOEpZ3Y1f
	lMu1/Oj617fs3fVhMj1e0Cy7mLzNjgP3NeHE/UyfRkk6/Bi2Qi6TVedI6VJR
X-Gm-Gg: ASbGncsn4JAiQU3Nfh1EzAyNxKZUYPGINvqO0QrcIOE749XQxPURCYE37eqKyxBpbHW
	JySl0S8BC9fcsY2qwdm8qnlZBJ3qrkUELZjBL95OevtOAxHEJZ7AuxMxReQkgD8LyeWi37zR6j0
	pLUlsDzwXAOEOqFhMwXf1eeFXMOlsGxy3AR573rGOMePTOqzCtlZoH2NEJ8wGL3y6NAAmNg3399
	Ha73WxyIy06HbnSkpBh8odweVFdUpHzzdGMjpV0+Cy9kohoJDXN1eCyw2KppL9Ua6ljwLaWLRhP
	9Ei98LG5sCjaZZurgu9Rvdq8VFQNKhYldPLcYgwntA/Hpc9cOuDA5C61YkJBnqI6VbW059qbWbT
	ZTxcDnIV8wrrFMw==
X-Google-Smtp-Source: AGHT+IGZEkCeMCcweXeVIzV0XTDi3zvuQZvxjw0xbZcM3CjLXXrYZ/5gfCbw31asisrRggQeYNMvOQ==
X-Received: by 2002:a05:6102:2b8a:b0:4c3:7f7:92f4 with SMTP id ada2fe7eead31-4deed34e2f8mr12966173137.6.1747120572549;
        Tue, 13 May 2025 00:16:12 -0700 (PDT)
Received: from mail-vs1-f50.google.com (mail-vs1-f50.google.com. [209.85.217.50])
        by smtp.gmail.com with ESMTPSA id a1e0cc1a2514c-879f61754d7sm6271938241.14.2025.05.13.00.16.12
        for <linux-renesas-soc@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 13 May 2025 00:16:12 -0700 (PDT)
Received: by mail-vs1-f50.google.com with SMTP id ada2fe7eead31-4ddb03095d3so2161366137.0
        for <linux-renesas-soc@vger.kernel.org>; Tue, 13 May 2025 00:16:12 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCVqZzPK37fSErM7uLcU7pqU065o5hlxKPGB8BIKCKVv9kLKWHIA1RjCdd5i3TAsqxN0KA/0B8DdmLoKOSPaZHJBhQ==@vger.kernel.org
X-Received: by 2002:a05:6102:15a0:b0:4dd:bb2c:491a with SMTP id
 ada2fe7eead31-4deed3f138fmr12982135137.25.1747120571798; Tue, 13 May 2025
 00:16:11 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <fbad3581f297d5b95a3b2813bbae7dba25a523fd.1747039399.git.geert+renesas@glider.be>
 <87tt5pe7e2.wl-kuninori.morimoto.gx@renesas.com>
In-Reply-To: <87tt5pe7e2.wl-kuninori.morimoto.gx@renesas.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Tue, 13 May 2025 09:16:00 +0200
X-Gmail-Original-Message-ID: <CAMuHMdWwm=t96Bw+d7xVpuDX_Oa1wU1zA673RRGvcBa08AWiqQ@mail.gmail.com>
X-Gm-Features: AX0GCFsefrB6ygaM3MFjCWcwsnMA4Lwk2o225dXj78YXf5bP8dqT7Njk6kmGVW0
Message-ID: <CAMuHMdWwm=t96Bw+d7xVpuDX_Oa1wU1zA673RRGvcBa08AWiqQ@mail.gmail.com>
Subject: Re: [PATCH] arm64: dts: renesas: sparrow-hawk: Disable dtc
 spi_bus_bridge check
To: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Cc: Mark Brown <broonie@kernel.org>, Stephen Rothwell <sfr@canb.auug.org.au>, 
	Rob Herring <robh@kernel.org>, Magnus <magnus.damm@gmail.com>, 
	Linux-Renesas <linux-renesas-soc@vger.kernel.org>, 
	Linux-ARM <linux-arm-kernel@lists.infradead.org>
Content-Type: text/plain; charset="UTF-8"

Hi Morimoto-san,

On Tue, 13 May 2025 at 01:28, Kuninori Morimoto
<kuninori.morimoto.gx@renesas.com> wrote:
> > make dtbs:
> >
> >     arch/arm64/boot/dts/renesas/r8a779g0.dtsi:1269.24-1283.5: Warning (spi_bus_bridge): /soc/spi@e6ea0000: incorrect #address-cells for SPI bus
> >       also defined at arch/arm64/boot/dts/renesas/r8a779g3-sparrow-hawk.dts:471.9-486.3
> >     arch/arm64/boot/dts/renesas/r8a779g0.dtsi:1269.24-1283.5: Warning (spi_bus_bridge): /soc/spi@e6ea0000: incorrect #size-cells for SPI bus
> >       also defined at arch/arm64/boot/dts/renesas/r8a779g3-sparrow-hawk.dts:471.9-486.3
> >     arch/arm64/boot/dts/renesas/r8a779g3-sparrow-hawk.dtb: Warning (spi_bus_reg): Failed prerequisite 'spi_bus_bridge'
> >
> > The Sparrow Hawk uses the MSIOF module in I2S mode instead of SPI mode,
> > triggering a conflict between the SPI bus bindings and dtc:
> >   - Serial engines that can be SPI controllers must use "spi" as their
> >     node names,
> >   - Dtc assumes nodes named "spi" are always SPI controllers.
> >
> > Fix this by disabling this specific warning for this board.
> >
> > Fixes: ca764d5321a2cee7 ("arm64: dts: renesas: sparrow-hawk: Add MSIOF Sound support")
> > Reported-by: Stephen Rothwell <sfr@canb.auug.org.au>
> > Closes: https://lore.kernel.org/20250506192033.77338015@canb.auug.org.au
> > Suggested-by: Rob Herring <robh@kernel.org>
> > Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
> > ---
> (snip)
> > +DTC_FLAGS_r8a779g3-sparrow-hawk += -Wno-spi_bus_bridge
>
> Thank you for the patch.
>
> But I still get the same warning. I'm using latest linux-next/master
> + this patch. And run this. Am I missing something ?
>
>         > make dtbs_check DT_SCHEMA_FILES=Documentation/devicetree/bindings/spi/renesas,sh-msiof.yaml

Works for me:

$ git checkout next-20250512
$ rm -f arch/arm64/boot/dts/renesas/r8a779g3-*dtb; ARCH=arm64
CROSS_COMPILE=aarch64-linux-gnu- make -j 12 defconfig dtbs_check
DT_SCHEMA_FILES=Documentation/devicetree/bindings/spi/renesas,sh-msiof.yaml
[...]
arch/arm64/boot/dts/renesas/r8a779g0.dtsi:1269.24-1283.5: Warning
(spi_bus_bridge): /soc/spi@e6ea0000: incorrect #address-cells for SPI
bus
  also defined at
arch/arm64/boot/dts/renesas/r8a779g3-sparrow-hawk.dts:471.9-486.3
arch/arm64/boot/dts/renesas/r8a779g0.dtsi:1269.24-1283.5: Warning
(spi_bus_bridge): /soc/spi@e6ea0000: incorrect #size-cells for SPI bus
  also defined at
arch/arm64/boot/dts/renesas/r8a779g3-sparrow-hawk.dts:471.9-486.3
arch/arm64/boot/dts/renesas/r8a779g3-sparrow-hawk.dtb: Warning
(spi_bus_reg): Failed prerequisite 'spi_bus_bridge'
[...]
$ git am 20250512_geert_renesas_arm64_dts_renesas_sparrow_hawk_disable_dtc_spi_bus_bridge_check.mbx
$ rm -f arch/arm64/boot/dts/renesas/r8a779g3-*dtb; ARCH=arm64
CROSS_COMPILE=aarch64-linux-gnu- make -j 12 defconfig dtbs_check
DT_SCHEMA_FILES=Documentation/devicetree/bindings/spi/renesas,sh-msiof.yaml
[... no warning]

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

