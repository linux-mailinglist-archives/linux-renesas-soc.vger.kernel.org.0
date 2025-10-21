Return-Path: <linux-renesas-soc+bounces-23353-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 5B7FABF50C8
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 21 Oct 2025 09:47:14 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id B7CC03B913C
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 21 Oct 2025 07:46:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5496028469C;
	Tue, 21 Oct 2025 07:46:17 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-vk1-f170.google.com (mail-vk1-f170.google.com [209.85.221.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4455F26C3B6
	for <linux-renesas-soc@vger.kernel.org>; Tue, 21 Oct 2025 07:46:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761032777; cv=none; b=YhX4MAFwXFZ2FeaEUiIkMHlTfytSwfvpvvSvCukyCpMts1S3mSJ9ueJFPIbEDIuyo0OsGBD9s6xEZCcTYoAlNoXgf7M8PdH9yRh16ybwCbR3ZioIf20UKw4OuC/y76GHW/Ou3vr9ZMnhsTUEOhpkKHzWBlIInEoI6db6nGXhIMg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761032777; c=relaxed/simple;
	bh=8b3HA5v4yZAxTJ8eIP9xopr8fWpaOCAQs9WFX5TX3YA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=rJ29mTjBFhB5so8UdgBeYzUwrUDIVEQhENgYaSwUfW8oxqJpJT4iank8dH84vnUWrm3wMTPqoobBQdJLernSut2OkgXwB8hpirfqQ8oEYmj/8nWzYD+GXHjCSSjEPT26Q2HMmBlpN/O0XVV5xz5BtHXf+hE4vYkHULr17XLLakw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.221.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vk1-f170.google.com with SMTP id 71dfb90a1353d-554ff1682c8so3798182e0c.1
        for <linux-renesas-soc@vger.kernel.org>; Tue, 21 Oct 2025 00:46:14 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761032774; x=1761637574;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=dz+xjmqR6cEerBTfm3rdjied7saH40mVkJYUcW/wH5Y=;
        b=kbtfMCHTH2X0nRRYDlQwYyr7gWdkSBcGHc42WRkB/2NTaqJBnOsiPRxQTfDLOVOnjo
         g3S5vZ8UmZoELBI5W8pLqaDGziOPHKrAW+0N3EHneSrA7p2ws195Qr1ls+XkGTX37e0L
         aGxIH5rwM+tB8sL5sdTsbCJRRZifJcqxZwaU4y5yMv69COLyMHbsUs3YPfi6i+TytJL7
         L5+X2KXxf0TRk+xs9cKQRCmejpV3LvbK7OJSHEhXhFP2jYd08V3ckeNI8utpNAVLGCfY
         z3d05R4mai3fDvaH0Dok7NK+r/0/gZNxmv1Ip8pOL8jOsCU+WGcWAQ0T6dfiB5JWeJFv
         xbzQ==
X-Forwarded-Encrypted: i=1; AJvYcCWDTu+ALzmIgXJhGj12twQfejlMCUBgH2jXxM2CNE/NeIjmi0EbAXdTbbrNbpLLMDCMhiGtYCek1GRlpykF0apobQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YzykkNZSMztK4FMExH0ZL1o/67rFmJpJncC2VtA+d9+fPNo1VDj
	e/r4NHVGu8+90Qd0czrduuLZLIPrDKl5dPGAA1/U/i4DhL5SuANkygVXvV95kl+U
X-Gm-Gg: ASbGnctWDOG140NmV73l+10IoBjLt+rHSUj0n0NuDXKUyvoULvH2Wsmf97/9R9lQsD/
	57MCwhTWj9GFiaGmGWvXEgcZ4K/jBTPvpfoYOw1lfscyFuSdUtq6krg94O/liD6jtdfxmBV/B9p
	FfA0dJymzfQU3QyFLG9ZAQxYBwkuzudeRzpzmicTDmyr7qoXCAMOXy92YmzD/F6ghjVaasaPhfe
	K4p9I4ms3dS+aZMIceA4Lnf46eI/k0L3fi89/qx2dBqjE0PS45BxX4hp40wkOS+FJ4A8zXEmcQY
	JkXiGg4Bc8INOpVsgCO8ghM9zwfE5pK7wtYQxK0zkQiPkVcT9LfbpR9rN40R2B6Sezh48jsJnN3
	f8+idLOedTajQ5rYa8IJudCAwRUNUR05DEMwuu8VhpySFZnUTWseC2EmiGTLge6o5nfqdg73/LV
	ppNBIWi+ZUIc7+lVroS/cWTZUe0iHPefIs2ZYV5Rsl0Zw/m1O5
X-Google-Smtp-Source: AGHT+IEkE2rRa9Z1rzSfg1SfIrswlTtkk9uKRuXvoAGTOefTK0AOX0XtO/+clsWv8W8zJWYuWt0vIA==
X-Received: by 2002:a05:6123:2e6:b0:54c:da0:f70a with SMTP id 71dfb90a1353d-5564ee612d5mr5996192e0c.6.1761032773828;
        Tue, 21 Oct 2025 00:46:13 -0700 (PDT)
Received: from mail-vs1-f41.google.com (mail-vs1-f41.google.com. [209.85.217.41])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-556662eeca7sm2928323e0c.0.2025.10.21.00.46.12
        for <linux-renesas-soc@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 21 Oct 2025 00:46:12 -0700 (PDT)
Received: by mail-vs1-f41.google.com with SMTP id ada2fe7eead31-58de3ab1831so3993996137.3
        for <linux-renesas-soc@vger.kernel.org>; Tue, 21 Oct 2025 00:46:12 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCW1O0qs1jbK14/iVRrBFrGH5in0jytw2+8V2mVx+2oysn0UNNkPATy8lQZqU//dmCbMafn2UzCGrpHfADMG2dryZQ==@vger.kernel.org
X-Received: by 2002:a05:6102:374d:b0:59d:b0f7:664c with SMTP id
 ada2fe7eead31-5d7dd5ecfc8mr4994352137.35.1761032772016; Tue, 21 Oct 2025
 00:46:12 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20251005111323.804638-1-cosmin-gabriel.tanislav.xa@renesas.com> <20251005111323.804638-4-cosmin-gabriel.tanislav.xa@renesas.com>
In-Reply-To: <20251005111323.804638-4-cosmin-gabriel.tanislav.xa@renesas.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Tue, 21 Oct 2025 09:46:00 +0200
X-Gmail-Original-Message-ID: <CAMuHMdWZKDmME8vtCOR6xdtKxXO6YdR=60Nti8_Dc0SH8TnVwA@mail.gmail.com>
X-Gm-Features: AS18NWB6U78jSeH5jtDsRrmJGY1udV7PT7USkr6r0d8-dTFiq84SEiscvsgnda4
Message-ID: <CAMuHMdWZKDmME8vtCOR6xdtKxXO6YdR=60Nti8_Dc0SH8TnVwA@mail.gmail.com>
Subject: Re: [PATCH v4 3/6] arm64: dts: renesas: r9a09g077: Add ADCs support
To: Cosmin Tanislav <cosmin-gabriel.tanislav.xa@renesas.com>
Cc: Jonathan Cameron <jic23@kernel.org>, David Lechner <dlechner@baylibre.com>, 
	=?UTF-8?B?TnVubyBTw6E=?= <nuno.sa@analog.com>, 
	Andy Shevchenko <andy@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Magnus Damm <magnus.damm@gmail.com>, linux-iio@vger.kernel.org, 
	linux-renesas-soc@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Sun, 5 Oct 2025 at 13:14, Cosmin Tanislav
<cosmin-gabriel.tanislav.xa@renesas.com> wrote:
> Renesas RZ/T2H (R9A09G077) includes three 12-Bit successive
> approximation A/D converters, two 4-channel ADCs, and one 6-channel ADC.
>
> Add support for all of them.
>
> Signed-off-by: Cosmin Tanislav <cosmin-gabriel.tanislav.xa@renesas.com>
> Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>

Thanks, will queue in renesas-devel for v6.19.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

