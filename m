Return-Path: <linux-renesas-soc+bounces-9055-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 8D24D9863FE
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 25 Sep 2024 17:44:13 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 44B8D1F28301
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 25 Sep 2024 15:44:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 965BE156CF;
	Wed, 25 Sep 2024 15:43:44 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-yb1-f172.google.com (mail-yb1-f172.google.com [209.85.219.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 451E34C62A
	for <linux-renesas-soc@vger.kernel.org>; Wed, 25 Sep 2024 15:43:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727279024; cv=none; b=PAZUcvMupMUdrbvdd1ROlqbbqDKzS6AWaXqD0CA60EPcQ/NpQWd2c1jQR4OLVOxV0J/23vGJT5TF631RxI1pDJGHoh7pKyau+K7B4MpqwFHv4jdYDuH3SF2OKv5uuu6W0mzrEwiGIK/HKzB/j9vGsg87OFHXRW+r0sfF2D4Ii+0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727279024; c=relaxed/simple;
	bh=dBiTGbS4gLSwD3K3dZ/o1O933jN6tkwEebJ4WjfmFvk=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=alLPVKfYsOR8+1l6QPoLTxGtLA1fAUrdEpjrdjgGUf/QL5bSTi0FBNcvFZi78PowOD6v7ui9yMrnuMBNCkNk7SOZsdU01t+EAvCkojuGe4mSGM2r9SdLiTon/7+QXIUSamFLNgADrZ5ERR5sR5SorCXcNGhF272FQWe4d0I0awE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.219.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-yb1-f172.google.com with SMTP id 3f1490d57ef6-e24985919c8so2228265276.1
        for <linux-renesas-soc@vger.kernel.org>; Wed, 25 Sep 2024 08:43:42 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727279021; x=1727883821;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=GDAZ6a7zH8FMBzCwtNes5L2Xa8Eb9Ak8/+2wFYzNcVM=;
        b=nlTwP2UGXA8glXxJGSZ2oN7Y/kQ7M+NAQLjU3ThIt+1MIGHxNg3p6CSTuHuqJWjgfb
         gTOiwx1/gEPnuTXLPi7JnfpC0SpMoBs120f8C4Oy4LepEIYoQPc3iPw7siJzTOv2U9O6
         NC8x3K0AHtq16IhRoL/IW3ITUhi5lU/Ih3DF/cQ5kSldiAovKRVm5it7qZfqh6bUIe6/
         tcA8ZZbOIgiSMg+82KG9nwSkSC2VhrqJCz8Rci16haYJoDRm+5YaA3JOtwc056BJbSE2
         8DXE8GLoOssuGK3toACRZLUjUsVXCrJD1Wesfi3h6w2N9Rh459QKezdW32ukkJvF/Jma
         JZrA==
X-Forwarded-Encrypted: i=1; AJvYcCV9/LSa9EdWhhAmbDEB3hYDreVqUntQefMmb0mT7KmQkiubsRXxQnSqjEQvNHP12Yf2KTPJ8/1TkBYo9I/YNB65LA==@vger.kernel.org
X-Gm-Message-State: AOJu0YySPPGNyHN8WuqY06/sxKe4MqwKDPFDu4xTHx1WAvABgxct4o0E
	nmb8hhHZKQYwUMb3ppc9Rgd6FQaRtFA/0Jc4fjN59rgU+9cCp935/xI2qcjn
X-Google-Smtp-Source: AGHT+IHk+WEHLkR5m9M6Sy50ALeB3sYye25q3exKeILk0A0nSTNRq2cXBz3s/0VsrvdpGBsxqezyjg==
X-Received: by 2002:a05:690c:15:b0:6d3:4c37:d652 with SMTP id 00721157ae682-6e21d843852mr30024727b3.24.1727279020922;
        Wed, 25 Sep 2024 08:43:40 -0700 (PDT)
Received: from mail-yb1-f176.google.com (mail-yb1-f176.google.com. [209.85.219.176])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-6e22eaad8ffsm152487b3.13.2024.09.25.08.43.40
        for <linux-renesas-soc@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 25 Sep 2024 08:43:40 -0700 (PDT)
Received: by mail-yb1-f176.google.com with SMTP id 3f1490d57ef6-e02c4983bfaso6250790276.2
        for <linux-renesas-soc@vger.kernel.org>; Wed, 25 Sep 2024 08:43:40 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCUHSMyUP4G4X/HM0gdGJdlsZucpKOavGEeRq+LZGBuQcDxh3RV7ypZvH90+V5oicOMTWWLMrpajFYBylkyRrPMzRw==@vger.kernel.org
X-Received: by 2002:a05:690c:f16:b0:6de:351:3e with SMTP id
 00721157ae682-6e21d6c74abmr32982497b3.8.1727279020548; Wed, 25 Sep 2024
 08:43:40 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240904003409.1578212-1-yoshihiro.shimoda.uh@renesas.com> <20240904003409.1578212-3-yoshihiro.shimoda.uh@renesas.com>
In-Reply-To: <20240904003409.1578212-3-yoshihiro.shimoda.uh@renesas.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Wed, 25 Sep 2024 17:43:28 +0200
X-Gmail-Original-Message-ID: <CAMuHMdUOhGPBtF04Ff3rGom5yTD+awm0oyXrXxAumbsmWYpmVw@mail.gmail.com>
Message-ID: <CAMuHMdUOhGPBtF04Ff3rGom5yTD+awm0oyXrXxAumbsmWYpmVw@mail.gmail.com>
Subject: Re: [PATCH 2/2] arm64: dts: renesas: r8a779h0: gray-hawk-single:
 Enable PCIe Host
To: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
Cc: magnus.damm@gmail.com, linux-renesas-soc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Sep 4, 2024 at 2:34=E2=80=AFAM Yoshihiro Shimoda
<yoshihiro.shimoda.uh@renesas.com> wrote:
> Enable PCIe Host controller on R-Car V4M Gray Hawk board.
>
> Signed-off-by: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
i.e. will queue in renesas-devel for v6.13.

> --- a/arch/arm64/boot/dts/renesas/r8a779h0-gray-hawk-single.dts
> +++ b/arch/arm64/boot/dts/renesas/r8a779h0-gray-hawk-single.dts

> +&pciec0 {
> +       reset-gpio =3D <&io_expander_a 0 GPIO_ACTIVE_LOW>;

reset-gpios

The former was deprecated in commit 42694f9f6407a933 ("dt-bindings:
PCI: add snps,dw-pcie.yaml").

I'll fix that up while applying.

> +       status =3D "okay";
> +};
> +
>  &pfc {
>         pinctrl-0 =3D <&scif_clk_pins>, <&scif_clk2_pins>;
>         pinctrl-names =3D "default";

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

