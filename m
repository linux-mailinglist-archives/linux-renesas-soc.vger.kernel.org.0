Return-Path: <linux-renesas-soc+bounces-22784-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [213.196.21.55])
	by mail.lfdr.de (Postfix) with ESMTPS id E0EEBBC4322
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 08 Oct 2025 11:51:24 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id 8CEFF3510B4
	for <lists+linux-renesas-soc@lfdr.de>; Wed,  8 Oct 2025 09:51:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DC81C2475F7;
	Wed,  8 Oct 2025 09:51:18 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-vk1-f174.google.com (mail-vk1-f174.google.com [209.85.221.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5D72825785F
	for <linux-renesas-soc@vger.kernel.org>; Wed,  8 Oct 2025 09:51:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759917078; cv=none; b=Z+zRm0m0RbbxqJU0kpt3EiPWkxFlRqTz6iEHst4Pur0n4oiMdBlv5G6Cd29rJw6PmnR1wuS/qovQ0WXpQB2CxqOo7Skozdf9hczeY5ELsmqTF50xKywHOyUjz3n1IrGH0sq6XaqrcC/8N6bH9BYYJId5WATF59CMEYyaTcLSilA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759917078; c=relaxed/simple;
	bh=r+ToGzTI6uxWEPYumm60pPHWI41nkxsIjrp4Zp1EsqY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=UxoGpLFXdG5m/FOeFbkBlWo471Y2D904vNYH5zqmQma21zk9Q3EBWa5azrm29DgTJm4qnkakVO6um3eu9KoaJWXSPhhvt0mtnK4QfXMQOc2/hFiHO+Kxj5/lGgvtlrna/gpbFiBW6Z+ehavDDJJIF3NYLpe4HA4FpBsun/Cxc2E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.221.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vk1-f174.google.com with SMTP id 71dfb90a1353d-54bbc2a8586so2575588e0c.2
        for <linux-renesas-soc@vger.kernel.org>; Wed, 08 Oct 2025 02:51:17 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759917076; x=1760521876;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=G09dlK4ttSR1bBxdlZNpESQsXtEQhLpmRygu9mDDuZI=;
        b=vDWfJmqJvGyTvC14EF2rZstjTMsMPsa71GYXg8CCa8O1A2uXFO0+2/dYNSNf2nYjMk
         WsBlR2ZfoSts1IEEIUgnbsqYRP8RdbFEI44OIE8aeGqdUBqv3JrHkgbFaVJ+fv24tKP2
         jD1QM3d52LdELhz+almsngM9E4rFKjwC+VuFlcCEzGD6FzJgqaQi8C8WZDMOypykwyYs
         srW4aken3YDtPecOIqMmh6WxDSwzfUQBveZ0g6rdBEAkJC1D/WhpqUjxF2gtBRca9i99
         +SuYSqRUvG8NRJU6BWTnHu4htXiSuoL9CRBLOZnu1/govvDhQGk7xVcVbbxuB7x8sbvA
         CHLQ==
X-Gm-Message-State: AOJu0Yx2ZnGxxc334htEfpidFZadmdqqfK0VX0G8m4Xn8dky39li5mWW
	+SJuq75C0Bxxb7WAqT7tNPmF/WfrghjT57vCI98Q+0w0TKU3EkJ0rpa+qtBs8nxi
X-Gm-Gg: ASbGncsyPLLFgQkq7tV0sFIgBVsIJk9phEBs+kJl4RofyM8r3MCAVRbCSoomiXbBS9o
	+fgQm8ELGh3nMO51+rj5hiEiRFOpTEfhdPqQLgUiEDc+Yvu/PmW6z5hQZI0DuIfWK75lI3sVHuW
	3xcyXLVDJT4svgf36RInf6FZflSkHz65N6xl4b8rYK01GUsqxkbri7B9YYZK+5Mt+FGsSuSpkSR
	gCXgGMFgPzUP6ETqH8y7Ma3B2HdUaJURt+YXyhGHDFuR+XUR824XsC0XhFBPtXwXku/mqIjHeOV
	HquOrHN2Vk9A9AlQ2rehEsOb+tK3p54LxKUVWcS/Pvhsbf7yEMNXVo/WVRBhUVEtDpmrLzkblVZ
	EG/0+Tq7ZdqKWSd6KlNEhLm9RLlO7hF3PcU3oVAIBtj/ein4CaaZ/8e29qUAR+RY4dzFPvSztN6
	BvztGnLkES
X-Google-Smtp-Source: AGHT+IEX60v33SCrPYmeE7V3VRQZxcIswmYxMp5HPbiysqKSOyKRxEwJzlqihj/Fv+E33t67+U4rAg==
X-Received: by 2002:a05:6122:1e04:b0:54a:a782:47c5 with SMTP id 71dfb90a1353d-554b8c074d4mr901345e0c.15.1759917075970;
        Wed, 08 Oct 2025 02:51:15 -0700 (PDT)
Received: from mail-vs1-f43.google.com (mail-vs1-f43.google.com. [209.85.217.43])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-5523ce694ffsm4327470e0c.10.2025.10.08.02.51.14
        for <linux-renesas-soc@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 08 Oct 2025 02:51:15 -0700 (PDT)
Received: by mail-vs1-f43.google.com with SMTP id ada2fe7eead31-5a46c3b3a5bso3530475137.0
        for <linux-renesas-soc@vger.kernel.org>; Wed, 08 Oct 2025 02:51:14 -0700 (PDT)
X-Received: by 2002:a05:6102:512a:b0:519:534a:6c20 with SMTP id
 ada2fe7eead31-5d5e23afcd1mr853215137.30.1759917074311; Wed, 08 Oct 2025
 02:51:14 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20251006172119.2888-1-wsa+renesas@sang-engineering.com> <20251006172119.2888-2-wsa+renesas@sang-engineering.com>
In-Reply-To: <20251006172119.2888-2-wsa+renesas@sang-engineering.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Wed, 8 Oct 2025 11:51:03 +0200
X-Gmail-Original-Message-ID: <CAMuHMdUb105BF1pNtqMpq2N2Yrh0Rp2hAxuzaZZWXfQfou=k4A@mail.gmail.com>
X-Gm-Features: AS18NWDRVT_iGSvxNuYXIG-QZwF9FHymRVnJQTzRE7VPezsiv6NxhZyhisJFrAc
Message-ID: <CAMuHMdUb105BF1pNtqMpq2N2Yrh0Rp2hAxuzaZZWXfQfou=k4A@mail.gmail.com>
Subject: Re: [RFC PATCH 1/2] dt-bindings: iio: accel: adxl345: document second interrupt
To: Wolfram Sang <wsa+renesas@sang-engineering.com>
Cc: linux-renesas-soc@vger.kernel.org, Rob Herring <robh@kernel.org>, 
	Lars-Peter Clausen <lars@metafoo.de>, Michael Hennerich <Michael.Hennerich@analog.com>, 
	Jonathan Cameron <jic23@kernel.org>, David Lechner <dlechner@baylibre.com>, 
	=?UTF-8?B?TnVubyBTw6E=?= <nuno.sa@analog.com>, 
	Andy Shevchenko <andy@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	linux-iio@vger.kernel.org, devicetree@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Tue, 7 Oct 2025 at 01:20, Wolfram Sang
<wsa+renesas@sang-engineering.com> wrote:
> The pinout of all the supported chips in this binding have two interrupt
> pins. Document the second one, too, even though the Linux driver
> currently does not support the second interrupt. Boards may have it
> wired nonetheless.
>
> Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

