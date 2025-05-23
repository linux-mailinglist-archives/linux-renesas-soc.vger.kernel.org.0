Return-Path: <linux-renesas-soc+bounces-17416-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 21F0EAC1E2E
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 23 May 2025 10:03:49 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 87E5B1BA0005
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 23 May 2025 08:04:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 849542857FD;
	Fri, 23 May 2025 08:03:39 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-vs1-f42.google.com (mail-vs1-f42.google.com [209.85.217.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 76CAD21C177;
	Fri, 23 May 2025 08:03:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.217.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747987419; cv=none; b=M4XwAG+BTNduvUZU2Y6+GKsDbiMp/WE1a65Tpzmiso2tPJhVlSYYhsDAghy3UoxxJ+OgaphQ7PcYVOrZ2URUzZfV+Q+l3L/lDGMcf+wVqIYJYtYFRACFmG73tHbI6GRb/O7tC1GawP2jZN0P7pJ5SuvzgMbYT1V5UbaIfAgIDmw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747987419; c=relaxed/simple;
	bh=YuqaVAe7Y8up+DAPtDGPbElQ2EvWKfRjssdxAyS9cec=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=jvm0dZvlF1e/AcgyEtcXUXx/OFODU88jaBkOkjUA1HG2vkdCW12pYU8Jb4q8C5nSQWMegr65xAicLPHk4axXuCKZNHTTp4PN08jUZJb6qmsQhd/3xIpXtQyebzPF+MRF9TcH20fG19DEBEITexT/3IzOdm4WAgROkK87XU39yNU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.217.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vs1-f42.google.com with SMTP id ada2fe7eead31-4e149bf7f4eso2522192137.2;
        Fri, 23 May 2025 01:03:37 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747987416; x=1748592216;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=DQqNiV3npSztD91z3+Feib7p+1NeGfg4kgqNf6iyxIc=;
        b=Gd+rQ+OKEBn5SnSabo9x8NzKeive7EY37XN3iVF9I46xkqpv5wnDALWtnM1yDpovIT
         ZoZm8VGOqYQj1IFc26DQYhWfpw7Mq+oUdZiTrJAHkTYqwwwDshZdIYbuDdedIG6fKDeb
         2tTb/KzJ5/pmdgF+CvPz5/UFHGG8nT32m0tLS9pPM2//q0F8+eCWR2Oj2829UivjViJa
         vi3pucO+PbCsqPlfOog+hl2a0hOJbaHnLAx+TvcTsnKtU5X9cFQJcB/ljwXoTlQDOrQ7
         1s1kG4JNDg7OcgM89KyzRZJs6KbGavN9CD0w1uTF6DYcoNVWJndsIgYaHiG6Dc7lFrJf
         p8Lw==
X-Forwarded-Encrypted: i=1; AJvYcCUQoeRhm7CN1giBaKzIQ0WlbGi1rAFXXqWjPYREAx6Fzvs0c2SUIKGi+4HdW1IY2mPcbyV/TBCYYeQ6iEvW@vger.kernel.org, AJvYcCWLvD9fPmOR3dFUGr884Os1HohA+ItDSuSl8UIswM6V3pO7r6SPqrliaHAjR675oUnfB9yO5OYI6ng3@vger.kernel.org, AJvYcCXLJqGsgCGf38r8mgJNqa5elyszCG97IdDhnKwuLL+NAXzpOdeEgsdVsPQxq3x0mOZq78f2XcEuEVIgny18yPrvhM0=@vger.kernel.org
X-Gm-Message-State: AOJu0YznkZyQRUjxpiEyX6exB0S1EKNhEaL6LkBr+eYm89pNokCzYpTt
	rgQgLaYdP2wBQJOnGmcQwMA+2OWNsI3lZxT40ISg1tqnQ8YmcEGv0LRYF1XGDP6T
X-Gm-Gg: ASbGncuing/eBdNLU/eS4RJjqeCrkW6DetBZ4sjBalW1FAUOE52UvPyccTZAhqkmVoc
	ZROH4UoM2cRAKgnK43/SUFmNSPmI2t6xA43pelOwbvo5BJQ/PUFpWZZyVAqKlt5+pMDwnGADL5L
	nZR1PLj2THL9wHo3iXIhpNcrDbgd9bWCvJxr4mIzMh3L44MGvzYj/Z4OZ83Y6z7YSZEn62/3zyf
	Bjbs+7SLinmF2ckAskUagugGjoe320B23gH2k5jFIegafw2ohIlwCcGD4XyAuO1yTkm4J6UVwl/
	mxUosW2eUPQpIl0LquO2JyzTu/ZztLM8dlQYBHYUfE+3u9Svv8k0GlMyWPPjZcC8rl/kzWlOiZs
	NWsegN03QVovPV39qbg2ro1Ez
X-Google-Smtp-Source: AGHT+IH0goiZMqcGa6abC2HBoeetfD7g+m3RkdCba6o7/QIT/PB6fLKADhaCYT53Pfmcdth7DS+FDg==
X-Received: by 2002:a05:6102:f9d:b0:4e2:aaff:d5b9 with SMTP id ada2fe7eead31-4e2aaffd91amr12582608137.5.1747987415783;
        Fri, 23 May 2025 01:03:35 -0700 (PDT)
Received: from mail-vs1-f50.google.com (mail-vs1-f50.google.com. [209.85.217.50])
        by smtp.gmail.com with ESMTPSA id a1e0cc1a2514c-87bec155e2csm11614782241.16.2025.05.23.01.03.35
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 23 May 2025 01:03:35 -0700 (PDT)
Received: by mail-vs1-f50.google.com with SMTP id ada2fe7eead31-4e149bf7f4eso2522182137.2;
        Fri, 23 May 2025 01:03:35 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCUvZpwBdWE35ySu4Ur4lKGZepUqL+uDNGKegl5seVBGk2ThEi0UaMYXwCLuMl0TNlWCezO9H44i5IEvSa+5WFRj3zo=@vger.kernel.org, AJvYcCVEGE3JsgqMtpOr18hlp67efdTn2csrlooFRBNEEBT/amSuk+7gmhQbchvaIB60pB0j2ZaKrAlFK1aoEmsZ@vger.kernel.org, AJvYcCWSCNGwibYx0z313hI+r4JLLW+XgwOj+7yAJKu0Ae7NxO+iePcVudK9So4mcMCSacvDCBUux5R7U6l5@vger.kernel.org
X-Received: by 2002:a05:6102:3ca1:b0:4de:81a:7d42 with SMTP id
 ada2fe7eead31-4dfa6af4f05mr30382735137.1.1747987414895; Fri, 23 May 2025
 01:03:34 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250515183104.330964-1-prabhakar.mahadev-lad.rj@bp.renesas.com> <20250515183104.330964-2-prabhakar.mahadev-lad.rj@bp.renesas.com>
In-Reply-To: <20250515183104.330964-2-prabhakar.mahadev-lad.rj@bp.renesas.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Fri, 23 May 2025 10:03:23 +0200
X-Gmail-Original-Message-ID: <CAMuHMdVv3abCx-FXMZFhfmc=5tk5-OA0mnxpcT=QYQGzaVZPjw@mail.gmail.com>
X-Gm-Features: AX0GCFuNsEKlJdma0Ka385Soh812_nhoVH7XnvtNgnlD5t9mcfrr0O76hdjpaUo
Message-ID: <CAMuHMdVv3abCx-FXMZFhfmc=5tk5-OA0mnxpcT=QYQGzaVZPjw@mail.gmail.com>
Subject: Re: [PATCH 1/2] arm64: dts: renesas: r9a09g057: Add USB2.0 support
To: Prabhakar <prabhakar.csengg@gmail.com>
Cc: Magnus Damm <magnus.damm@gmail.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	linux-renesas-soc@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Biju Das <biju.das.jz@bp.renesas.com>, 
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>, 
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Content-Type: text/plain; charset="UTF-8"

Hi Prabhakar,

On Thu, 15 May 2025 at 20:31, Prabhakar <prabhakar.csengg@gmail.com> wrote:
> From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
>
> The Renesas RZ/V2H(P) ("R9A09G057") SoC supports 1x channel with OTG/DRD
> and 1x channel with host interface.
>
> Add the ECHI, OHCI, USB2.0 PHY and reset control nodes for USB2.0 channels
> in R9A09G057 SoC DTSI.
>
> Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>

Thanks for your patch!

> --- a/arch/arm64/boot/dts/renesas/r9a09g057.dtsi
> +++ b/arch/arm64/boot/dts/renesas/r9a09g057.dtsi
> @@ -662,6 +662,119 @@ sdhi0_vqmmc: vqmmc-regulator {
>                         };
>                 };
>
> +               ohci0: usb@15800000 {

Moving above mmc@15c00000 to preserve sort order.

[...]

> +
>                 sdhi1: mmc@15c10000 {
>                         compatible = "renesas,sdhi-r9a09g057";
>                         reg = <0x0 0x15c10000 0 0x10000>;

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
i.e. will queue in renesas-devel for v6.17 with the above fixed.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

