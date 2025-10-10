Return-Path: <linux-renesas-soc+bounces-22866-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 7A684BCBEF6
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 10 Oct 2025 09:35:56 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 347F73C1CD1
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 10 Oct 2025 07:35:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0EAA7257848;
	Fri, 10 Oct 2025 07:35:54 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-ua1-f46.google.com (mail-ua1-f46.google.com [209.85.222.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5D19F227E83
	for <linux-renesas-soc@vger.kernel.org>; Fri, 10 Oct 2025 07:35:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760081753; cv=none; b=mykXMN1LZTHzSJRbQb4EttXxE/TomSpsfcgttBlZa0HYCnj63yuD7FeE6vVhPxY9999ckfwFvugyplILdZ+TNqvpIj/IXzZoEnsaU73BkhqhS7baBv8v12/gHATrLsaabxG9fIjEQLB5ICGdkcSwMjF678AH/vlFdGrL63lXx5E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760081753; c=relaxed/simple;
	bh=O0oLWAzOWDZ21I/1hWS/+bYpEFudWwj0se/ms049cKI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=PCAeG4Qos9p3nDWBaBInFjERlaGqCghBcfRA5MmrYkygYvAsM4gPpddjlhAncOOQ6wjxgl0/hzkjypvs8XuAkjBHckB38kw0Wixx6q//cgszoPQ79AFttSKCR9Q6uJJOPyKL2+VdpLLkuvdUjzxCpsM2Y/lTdWq0HnEt8W+vrtU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.222.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ua1-f46.google.com with SMTP id a1e0cc1a2514c-8e364003538so1317884241.3
        for <linux-renesas-soc@vger.kernel.org>; Fri, 10 Oct 2025 00:35:52 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760081751; x=1760686551;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=2dCeF0ej9PX8EfxiL4r95RlNb4xSGMTy8wZampxAXtw=;
        b=o2j8ilDjDSY/ZDr4dJ60M3ImgY6suDPYl8+MlFksYuhF3qQXXKKMhlmn4lcbRYuxCK
         ddoDFJ0XX8+RMO8uZ1ova8eIkG0JoeceuxydQlyXWr5IU2mT/EoVzz/fXuefBtAZSk0l
         gIkRxDVTE+ClTD74bQvmv16OILGQbXc9thkW0xZpcbUJh9e9P7U4fXUjvEGNzDi/S3ii
         SxEXs4RAngiquxf3nGb6N1nAC23DcrciiWbQJJpgZKvAGx7t1eqdCAGF8H4fs8OoAug6
         YigbiXfWl4kMaEVziMA/9Z3mx7j8FFjMJ0x+OtG0HkeLXK9m7GivyVWNpayWIS6A+HNv
         +hcg==
X-Gm-Message-State: AOJu0YyWv9YTALJJOAKGnlacboRLq+f4Z9byJMKiYa7OVp0up1O4EX7L
	yq0YDRn3mf0FQLamZV1RnzKEewQVwqwqvaab1xDsXYcx70XHn8bFB3f5cvwLT22t
X-Gm-Gg: ASbGncur5k/kgkEc9VrJkWZfzbdhxwRlH3onIDYFhThKJCKs5oGgzc6yLV9SrMF0355
	iK0zIzVj/OPoL1p/TnEHx4A1hPTRIv13cFejgZPEq+/1HJvgB2G4clnl5YCF6N2bJEi+QtJeOXN
	gseCyskFrUrjJUEE2631T5KB/F5yVyKqM1X+K2KoaB+ALx5I8g51+cL382yomtRX8Wn9mpvIo4R
	hh3J1op5Pfl57hoc/4ZMxsXy/6Y0aBJlp57Cp8q9pqAvg1eebJf8C5FBQgTXDczMxIF94iJPf9u
	tztEMrX5c59juYc3Ra2HuV+Pe/yT2IPMahzEZngiAC7VgoExo3uCBtC47bH4Y2d2Nkb6lXokNjr
	EkT6oMbLZk7LPzwA/xM8qlbzGnuiPtnrRfHtyQjNSIdcDT67KIe1QrKP8DQuBTNjLfSA38a8UTj
	BUWLI=
X-Google-Smtp-Source: AGHT+IEOVgxO6vjC2j/Tt3atsnPsPENGvsBqihGUWj0VQgyBi6A9AatNpI2IuEdO32ZYFWZ1p8gF/Q==
X-Received: by 2002:a05:6102:54a3:b0:5d5:f6ae:3908 with SMTP id ada2fe7eead31-5d5f6ae3db3mr1893868137.38.1760081750996;
        Fri, 10 Oct 2025 00:35:50 -0700 (PDT)
Received: from mail-ua1-f48.google.com (mail-ua1-f48.google.com. [209.85.222.48])
        by smtp.gmail.com with ESMTPSA id ada2fe7eead31-5d5fc8f0a87sm680256137.13.2025.10.10.00.35.50
        for <linux-renesas-soc@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 10 Oct 2025 00:35:50 -0700 (PDT)
Received: by mail-ua1-f48.google.com with SMTP id a1e0cc1a2514c-904d71faab6so1399420241.1
        for <linux-renesas-soc@vger.kernel.org>; Fri, 10 Oct 2025 00:35:50 -0700 (PDT)
X-Received: by 2002:a05:6102:330a:b0:5d5:fefa:aff3 with SMTP id
 ada2fe7eead31-5d5fefab272mr690960137.42.1760081750169; Fri, 10 Oct 2025
 00:35:50 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250923161709.3110-2-wsa+renesas@sang-engineering.com>
 <CAMuHMdU+0iL0fjMM+_vPxsOmPXW72X0_=X2A=ZA9gRf367UB1Q@mail.gmail.com> <aOf0wSc5rgve30af@shikoro>
In-Reply-To: <aOf0wSc5rgve30af@shikoro>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Fri, 10 Oct 2025 09:35:39 +0200
X-Gmail-Original-Message-ID: <CAMuHMdXrjkbyXjTekjifbODcPPP09mVxVH+EDpMM9F0A8hXS1A@mail.gmail.com>
X-Gm-Features: AS18NWD7qLWbxhIQiPCVJaSCKbXuQce34PLWrR6mU5guC5RV3uWWeQ9wkFf4u6I
Message-ID: <CAMuHMdXrjkbyXjTekjifbODcPPP09mVxVH+EDpMM9F0A8hXS1A@mail.gmail.com>
Subject: Re: [PATCH] arm64: dts: renesas: eagle-function-expansion: add eMMC support
To: Wolfram Sang <wsa+renesas@sang-engineering.com>
Cc: linux-renesas-soc@vger.kernel.org, Magnus Damm <magnus.damm@gmail.com>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	devicetree@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Hi Wolfram,

On Thu, 9 Oct 2025 at 19:45, Wolfram Sang
<wsa+renesas@sang-engineering.com> wrote:
> On Thu, Oct 09, 2025 at 05:18:23PM +0200, Geert Uytterhoeven wrote:
> > On Tue, 23 Sept 2025 at 18:17, Wolfram Sang
> > <wsa+renesas@sang-engineering.com> wrote:
> > > Add pinmuxing and configuration of the MMC-capable SDHI instance to make
> > > use of the eMMC.
> > >
> > > Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
> >
> > Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
> > i.e. will queue in renesas-devel for v6.19.
>
> Thanks. However, I just saw that the node name in pinctrl is bogus,
> sorry :( mmc_3_3v is plain wrong, mmc_1_8v would be better, but
> actually, I think it should be just mmc0. Voltage switch is not
> supported on that board.

Thanks, will fix that up to "mmc" (which is what the others are using).

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

