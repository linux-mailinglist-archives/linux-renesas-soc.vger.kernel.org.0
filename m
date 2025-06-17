Return-Path: <linux-renesas-soc+bounces-18421-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 813A0ADC5AC
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 17 Jun 2025 11:06:41 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 33668177F82
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 17 Jun 2025 09:06:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A935E290BC6;
	Tue, 17 Jun 2025 09:06:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="hE2QhMfp"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-lf1-f44.google.com (mail-lf1-f44.google.com [209.85.167.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A6C9C28FA8D
	for <linux-renesas-soc@vger.kernel.org>; Tue, 17 Jun 2025 09:06:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750151197; cv=none; b=UwWKUPoV3n6HHXVncZ88lONBEVgt9n8tvIDdQmPKTdNyVRHT3kavW7qvUE1juZ91/ajQwi1fTPRfxsWohXbX1f2b7ymYhtn1q+alsxuo1NLgs81leOv+/7OqNYRjYzsrNEwvFTr36kBHCdOtyz0iRp/T8BX2sBRlCOvWGopKzuA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750151197; c=relaxed/simple;
	bh=VnnWAyTUfMYF9OfisVSLFv03JCDiJkAGct7ouNDogi8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=YPpHS7RpKQnQKYrEvmVlJuwDKpYOgswPraQUoKwipmT5vnRp4IxaRNBasC+EERO7CZgk0Bru+FzwKbAqLOILkKIDbJKzA8MpU45y28H/jxvWiZTc2ONSojtefHosjj6Upxeo0dH8gWnWcjvEzpijXKhl7zRyT3mraj6IC9iy/98=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=hE2QhMfp; arc=none smtp.client-ip=209.85.167.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-lf1-f44.google.com with SMTP id 2adb3069b0e04-553c31542b1so1974300e87.2
        for <linux-renesas-soc@vger.kernel.org>; Tue, 17 Jun 2025 02:06:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1750151194; x=1750755994; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=DYSR9cPTGMttpq4ANyJ9wXClXskALgO97k4qcjZi/YY=;
        b=hE2QhMfpnI9Nl2arLUPNfgwSgpBWma3UboNDB0fey3P+4UPcfCfA8J1gemcp1P59St
         zOVz2lHenYrcFg10pUD7DPIrsI4GNvV5+GyZXqLiLu8EgZHH4EfxZdBv6tTBxYtilCoy
         BWOWALfernEDDxt5D7vQXaGAt7rG2wY4TZEJLJL0ioF+5XCqkqSnCZU0WezDG4KYz+MG
         A7o79Xk/L6nubof911z/6+1bemF3zTjLB1kxmO3XCPShzGq7RHmq+ybYVafToPVwWDu4
         DuMUgM3c7bnabUiSmqsEdQwV+H29QW0kyg5QNBZRChky0wlUBXbF2LMAnFkytQVtJjg8
         AiVg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750151194; x=1750755994;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=DYSR9cPTGMttpq4ANyJ9wXClXskALgO97k4qcjZi/YY=;
        b=wEtjB+e9RyEgZqiY7dpG+qIkT8L/xLVVrRWFN0xU4ANqWT5RE/eHK7fulKIKqosj2N
         uVCJVtn1sY2rIxlws3LreCpMp2bq0OsH1zgz7RVdeR7kHDR38UT6dYZQ9+wDSvajofSF
         Z5B6l2YJfGCzX82fFzasXaLpYVhDLkN1R/GDTcsLhr6iIvG/se4fck5mTyBwOM8prS3Z
         prQRtt2xsFSahpRgArtkGIiK/A+ZYb2KU+apjPVMwrAuUxCPikJ6g1sQOpt5wHCTQEnZ
         WG8+Dm6yO9HiTiTf6dE0tIhAly0qgkMEOVUQa0xZg8QNh3E0zMebF42tXokyfig1k7Pe
         PdCw==
X-Forwarded-Encrypted: i=1; AJvYcCXHxnYkphrNjdMIorzsjXI9dRCr2sIrrW0I7HGx/s0mxAHkqFRjxgYGzmHpbuA4QghcU7IHwS9r9S6m8q+TGhh6Pw==@vger.kernel.org
X-Gm-Message-State: AOJu0Yx3zRM8n2sRjnWN2SraHtgB0f0OckqEFqAizm5qKt2VnjD41AbF
	9pLUBDskKxm6hspmkjFal0Np5zsgRfv6Sktts2IOJl/h4kHMcUOPVUHZecN4kKp9BXo499iqVMf
	gYEvNivOv8nkmY6WjjXDPLR2DxUJ4NapkzVkRXfV3Ig==
X-Gm-Gg: ASbGncuPhmqbS9YwWEj/DycsEAQdcR0DRdh41ErPAf/5ERKj3ilFSy/slOfmZSV16QR
	uOkTmJLTriBTMKj8e4mhkTquvJ4ozIUaZ5Lu7l+rd5l2cxIIYKik6kawPlczwmzG1V5baZy3TNI
	Qdp+z7KlQ437aU4IL3rtx6YHTmXewv0aBKnerif2ybWlqZwyc/KpMI73++06X5+/YMJw058AUHi
	SaY7WA5hN7WKA==
X-Google-Smtp-Source: AGHT+IHxfvF/JsaZcrfFFhgdaJyfP3Q1Rvsp+Eki2op7uwpLqALSK/SkV0T30JPb2qy9MbbSEPsYfSWYtxl6UeRzssA=
X-Received: by 2002:a05:6512:2314:b0:549:5866:6489 with SMTP id
 2adb3069b0e04-553b6f31234mr2964444e87.47.1750151193633; Tue, 17 Jun 2025
 02:06:33 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <b648ffcfe6268d3886b134a98908b2f91dbece56.1749801865.git.geert+renesas@glider.be>
 <aEvotoVqitiHxgYA@shikoro> <CAMuHMdV+2AQbuzLhx5rdtuiVdN85oHJpdUvTKPkVdEn5krp6Fg@mail.gmail.com>
In-Reply-To: <CAMuHMdV+2AQbuzLhx5rdtuiVdN85oHJpdUvTKPkVdEn5krp6Fg@mail.gmail.com>
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Tue, 17 Jun 2025 11:06:22 +0200
X-Gm-Features: AX0GCFvLh6XS4qqKu4e0InKMYhz7K-nQiQrWLqpktjZgla1xYJJ-ImUIP2a8ocg
Message-ID: <CAMRc=MfB_7JTzsSk+9ssdC4N2S1Rn1hHpkQ7CbWMF6SFUadrJA@mail.gmail.com>
Subject: Re: [PATCH] gpio: rcar: Use new line value setter callbacks
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: Wolfram Sang <wsa+renesas@sang-engineering.com>, 
	Linus Walleij <linus.walleij@linaro.org>, Magnus Damm <magnus.damm@gmail.com>, 
	linux-gpio@vger.kernel.org, linux-renesas-soc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Jun 13, 2025 at 2:02=E2=80=AFPM Geert Uytterhoeven <geert@linux-m68=
k.org> wrote:
>
> Hi Wolfram,
>
> On Fri, 13 Jun 2025 at 13:42, Wolfram Sang
> <wsa+renesas@sang-engineering.com> wrote:
> > >       bankmask =3D mask[0] & GENMASK(chip->ngpio - 1, 0);
> > >       if (!bankmask)
> > > -             return;
> > > +             return 0;
> >
> > Doesn't that mean that the mask is invalid and we could return an error
> > here? Or is '!bankmask' an expected use-case?
>
> That is a good question!
>
> I _think_ this really can't happen anymore, as the GPIO core is supposed
> to check this against the valid mask? Or isn't it?
>

Yes but this doesn't seem to have anything to do with the valid_mask?
If it's about the number of GPIOs then that too is verified by GPIO
core.

Bart

