Return-Path: <linux-renesas-soc+bounces-23354-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [142.0.200.124])
	by mail.lfdr.de (Postfix) with ESMTPS id B661CBF50E6
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 21 Oct 2025 09:48:13 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 4DA8D4FF243
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 21 Oct 2025 07:46:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7C7AC28505E;
	Tue, 21 Oct 2025 07:46:33 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-vk1-f169.google.com (mail-vk1-f169.google.com [209.85.221.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D5DB3284883
	for <linux-renesas-soc@vger.kernel.org>; Tue, 21 Oct 2025 07:46:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761032793; cv=none; b=KMI5DpSKoTtGjhL9kXCwgHWtENWA2PHacvwMaawOBcP1C0eskdW5ZMIA/dwQrR7S6Hzq6w27trLMKlwWnfhxC0XxUd/y8pOT4rd3hssKQPO4pyNOfJkxDC7/9njT0Z5ir/TCR4Cat43mlLPx9AzCvZq/j1Q948G2BhhNRAuvsHY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761032793; c=relaxed/simple;
	bh=5G4JqyuB+1jfwF+3s2F0oLxHOIeUzEWkM1tGorit4ZQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=IBdqpQuqRaR3suAjDM/DXne7XCkK2Tz+XcKoLSKij1LRjpPAjb28qaomuLuWo1/jeA+D6GXziU1dKJqPXtVX+1k8MZc7d8l22AV+LaJ7mBsmTsQpjg+BkiP4gFrYzDv4FL7aJa/wdXh3VZj2DhlE4uYgmbtunfOQEwHdrih1aUI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.221.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vk1-f169.google.com with SMTP id 71dfb90a1353d-54b27d51ef7so2096856e0c.1
        for <linux-renesas-soc@vger.kernel.org>; Tue, 21 Oct 2025 00:46:31 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761032790; x=1761637590;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=SOVef87yu8OWyluOAjGxPlGJdL3ZMdICelAlkVBkCao=;
        b=Rh88Q8Vm4KnWIHyLfoH+ihydTB+1+IzVgl3LeDPgIOrefmokpCjhm8ZeGQUTIN1zWD
         Lx/EtqVCYX/twLTe+rz/7sH29xx5v0JUgT/f+7D64+2p0FGAzTZMwA3VViyZRmJOek9S
         de9YKbTwhdqbpLtR1ighKTc4GBTjrif90YbbAW/H3T98J9xjcw1lvzCCgjj6soV3KgAx
         L7sN1IKdr1FmOXi/PrzF+V256tL4Y1yU6jPHLB45nlGMSVHsiBvL2oTyXm79eYr9iGNX
         cSO4y1gt/ekcR4wyfwfY0SMsp1kqYxJyW/6jE7IZJNdZQZk65u757h0IRFwJn1o5bz5T
         dNbA==
X-Forwarded-Encrypted: i=1; AJvYcCX2LGwvWy0a21PD4iWaRhEANWXXxIm7j/INHAzYNj4YztZ6csFzpvAU/gtP2atZCTxlFZI87O93//DhF0JEMUoAOg==@vger.kernel.org
X-Gm-Message-State: AOJu0YwfhykexpEMUyjlbmDPl3LA0POa8ilbDVmTxEhbf7EcoaD94FnK
	ImQ60iaXV/6ycOKofvkZvy2stpC/zDSaeylUf1jDjAbWyCbkrqwWL/Pcr/srk6t1
X-Gm-Gg: ASbGncuZl2JitjeN1av4uTiXiN9SkLQV+3oAD76BTglC6D799Wt8tvwpw5URlnkMJvm
	2YtqmwHn/1kwgZJXZA17TfzJG5i2K6j+6u1K6EuDCelwvN5VKlHfDM827G0SoCjqt+ab72AgsEg
	q1rM2hRTmmTv8HdWrOgB6Hfhypht6MktblHffXqc/5w2Dree4QXOP6+COlfM+MOc/p1ZF49xJHF
	GClPa9Rf07Fjgwn3AwAhf93ZPIAL8HtW+R09pcMgdDVCqwg/8W0cDL++XKp2ac6QrCjmCaFtXwN
	HUmPL+oYW+FGY8NEyLQDpNzwsC5Q6jJh+YYa+EdsbrDFkjmfsM39z/eTXjO3CzmMyEayRtMIWef
	oQNy26zxepa527gj4kSKkaJ5mcL3Ke8kgn20kla/P8gGLxRnj6AfEzOAuMxEMVkis5XhbPHeMpg
	5NYuSoE18uAsTvo/EJp+ZuoTkHu9/EnqF/xPCTEBBeb/fMa0Vh
X-Google-Smtp-Source: AGHT+IFJkgmHL7aiF5FVaumLQyrK+WpQ7qhCTUZbJiZoWeX4qaQU8oB1QTI3hVByidXJb5Uwwa3n1g==
X-Received: by 2002:a05:6122:c9a:b0:54a:9e47:7624 with SMTP id 71dfb90a1353d-5564ef5bdbemr4742463e0c.14.1761032790504;
        Tue, 21 Oct 2025 00:46:30 -0700 (PDT)
Received: from mail-vs1-f44.google.com (mail-vs1-f44.google.com. [209.85.217.44])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-55661f6e351sm3093471e0c.4.2025.10.21.00.46.29
        for <linux-renesas-soc@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 21 Oct 2025 00:46:29 -0700 (PDT)
Received: by mail-vs1-f44.google.com with SMTP id ada2fe7eead31-59f64abbb61so1951801137.3
        for <linux-renesas-soc@vger.kernel.org>; Tue, 21 Oct 2025 00:46:29 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCVZXdsZoHCdSgLhqldwcjGEKNf1VVxtM3d58rSsPnUB5sUzQsCqOEoRE20vMoUMmyLNnS8zrS3l6JiDwq/lqPW/+Q==@vger.kernel.org
X-Received: by 2002:a67:e101:0:20b0:5d6:18ea:a52f with SMTP id
 ada2fe7eead31-5d9773551a6mr1568570137.41.1761032789407; Tue, 21 Oct 2025
 00:46:29 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20251005111323.804638-1-cosmin-gabriel.tanislav.xa@renesas.com> <20251005111323.804638-5-cosmin-gabriel.tanislav.xa@renesas.com>
In-Reply-To: <20251005111323.804638-5-cosmin-gabriel.tanislav.xa@renesas.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Tue, 21 Oct 2025 09:46:18 +0200
X-Gmail-Original-Message-ID: <CAMuHMdXcfw5LNHJzb6wPhhr_+PhqTXW7vVsPh0Jh4C37sH_1RA@mail.gmail.com>
X-Gm-Features: AS18NWCrnqUjqenK4TJrNwGcosBJE6DKtmO9ndJuUuCBGZAhQh3Anhkt0sj-6Uo
Message-ID: <CAMuHMdXcfw5LNHJzb6wPhhr_+PhqTXW7vVsPh0Jh4C37sH_1RA@mail.gmail.com>
Subject: Re: [PATCH v4 4/6] arm64: dts: renesas: r9a09g087: Add ADCs support
To: Cosmin Tanislav <cosmin-gabriel.tanislav.xa@renesas.com>
Cc: Jonathan Cameron <jic23@kernel.org>, David Lechner <dlechner@baylibre.com>, 
	=?UTF-8?B?TnVubyBTw6E=?= <nuno.sa@analog.com>, 
	Andy Shevchenko <andy@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Magnus Damm <magnus.damm@gmail.com>, linux-iio@vger.kernel.org, 
	linux-renesas-soc@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Sun, 5 Oct 2025 at 13:15, Cosmin Tanislav
<cosmin-gabriel.tanislav.xa@renesas.com> wrote:
> Renesas RZ/T2H (R9A09G087) includes three 12-Bit successive
> approximation A/D converters, two 4-channel ADCs, and one 15-channel
> ADC.
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

