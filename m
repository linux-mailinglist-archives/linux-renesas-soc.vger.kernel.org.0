Return-Path: <linux-renesas-soc+bounces-1589-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 8D71582DE21
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 15 Jan 2024 18:04:32 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 11DA21F22797
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 15 Jan 2024 17:04:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2DAF518C03;
	Mon, 15 Jan 2024 17:04:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ragnatech.se header.i=@ragnatech.se header.b="sVKfcz1b"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-lf1-f52.google.com (mail-lf1-f52.google.com [209.85.167.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 481CD18C01
	for <linux-renesas-soc@vger.kernel.org>; Mon, 15 Jan 2024 17:04:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ragnatech.se
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ragnatech.se
Received: by mail-lf1-f52.google.com with SMTP id 2adb3069b0e04-50e80d40a41so11393284e87.1
        for <linux-renesas-soc@vger.kernel.org>; Mon, 15 Jan 2024 09:04:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ragnatech.se; s=google; t=1705338262; x=1705943062; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=/g7PQUHmI+Dvtdedh9KbNdIVUsZuxXRmOLtkVe/RM3E=;
        b=sVKfcz1bwl6VDhCJn0ePLASnle4u8uoo1QTmCW9jSQhNDWUHWbWP9CtdVbv0y5IA/I
         8jva4l5gS5db194ll+KddHbZoBAG3swqouxFuxbQjCN1RuUEh9E8U6YzCrJMwsRd3473
         U0IY3NPOICJXZFIa1pniSwwgklin9cLo8gI4jqhj3dl2c9PkOlK0CTvyKFIxGi5pOkcE
         4rIewOpIFPrlTY+J5txUHGaSj57GlPY/kxcdIgDgNh6wj1P/w8yYrpboMIOpg/rOsqvI
         Vwf8bEv/ZE7ezZn79kVUoSf9lyknMM0UiUxHilT/AsPyidPG4DueUsSUgnQ9RI/ya8QQ
         plBQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1705338262; x=1705943062;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=/g7PQUHmI+Dvtdedh9KbNdIVUsZuxXRmOLtkVe/RM3E=;
        b=HxJHSOo8OQvIWsG2ZE8mJN8buYvn+EYCEKkLsS7MTJb5bs9jkFfeHkiNRa8dcVQqpL
         jooVKUYqbGrbUqxIG3wMyj9Q5n1amrvWVpq9kMklE/IIeNSwM/4yX8EAAZsoeEqpRaxV
         3aBZJMuTQbiyHHQtWXUJWgTTlVGM0iJflBisZm4Yo0RN2DlpQISMehcl8N1iq9MsfRlG
         CiI960heb+DY4dI0b0Ol4MxNPj5axqOsTmtWbxyYOsrswBtfuydIl4Mkwan9yYZLlgQW
         eBz00eh6jonzIiShw/pYCcpvJ1/Maj2z2E6wleeWhiIrYC36dO5DfLg0zCsQVJmn5xz9
         KtRA==
X-Gm-Message-State: AOJu0YyQCvNsFQ54ajjCS64hIWSwbhIGRVudMQ7wnLMpPGhIS7VdYbw5
	Ymlc53GlJ3g4l2Rw0Xohjdo48K9Yr1fwTw==
X-Google-Smtp-Source: AGHT+IF7PlPTzlcTv5+X0PVJt6MqY1Hp+6/htenkTGo1AuYfQVmq86wQB5KmxD6CanT9GBDj9kCCOg==
X-Received: by 2002:a05:6512:3d14:b0:50e:76e0:9ef7 with SMTP id d20-20020a0565123d1400b0050e76e09ef7mr3473525lfv.99.1705338261884;
        Mon, 15 Jan 2024 09:04:21 -0800 (PST)
Received: from localhost (h-46-59-36-113.A463.priv.bahnhof.se. [46.59.36.113])
        by smtp.gmail.com with ESMTPSA id c26-20020ac2415a000000b0050e85108daesm1500580lfi.222.2024.01.15.09.04.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 15 Jan 2024 09:04:21 -0800 (PST)
Date: Mon, 15 Jan 2024 18:04:20 +0100
From: Niklas =?utf-8?Q?S=C3=B6derlund?= <niklas.soderlund@ragnatech.se>
To: Geert Uytterhoeven <geert+renesas@glider.be>
Cc: Magnus Damm <magnus.damm@gmail.com>,
	Ulrich Hecht <ulrich.hecht+renesas@gmail.com>,
	linux-renesas-soc@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH 0/3] ARM: dts: renesas: r8a73a4: Clock fixes and
 improvements
Message-ID: <20240115170420.GA3147291@ragnatech.se>
References: <cover.1705315614.git.geert+renesas@glider.be>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <cover.1705315614.git.geert+renesas@glider.be>

Hi Geert,

Thanks for your work.

On 2024-01-15 12:03:02 +0100, Geert Uytterhoeven wrote:
> 	Hi all,
> 
> This patch series contains fixes and improvements for clock descriptions
> of the Renesas R-Mobile APE6 SoC and the APE6-EVM development board.
> 
> After comparing CPU core performance over a wide range of SoCs, I had
> been wondering for a long time why DMIPS/MHZ for the Cortex-A15 CPU
> cores on R-Mobile APE6 is slightly higher than on R-Car Gen2 SoCs.
> It turned out to be untrue, as the R-Mobile APE6 DTS contains a wrong
> crystal osciallator freqency, causing the CPU cores on R-Mobile APE6 to
> run 4% faster than assumed by Linux.  The first patch fixes this.
> The two other patches contain small improvements and a small fix, none
> of which have any functional impact.
> 
> I plan to queue this in renesas-devel for v6.9.

For the whole series,

Reviewed-by: Niklas Söderlund <niklas.soderlund+renesas@ragnatech.se>

> 
> 
> Thanks for your comments!
> 
> Geert Uytterhoeven (3):
>   ARM: dts: renesas: r8a73a4: Fix external clocks and clock rate
>   ARM: dts: renesas: r8a73a4: Add cp clock
>   ARM: dts: renesas: r8a73a4: Fix thermal parent clock
> 
>  arch/arm/boot/dts/renesas/r8a73a4-ape6evm.dts | 12 ++++++++++
>  arch/arm/boot/dts/renesas/r8a73a4.dtsi        | 23 +++++++++++++------
>  2 files changed, 28 insertions(+), 7 deletions(-)
> 
> -- 
> 2.34.1
> 
> Gr{oetje,eeting}s,
> 
> 						Geert
> 
> --
> Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org
> 
> In personal conversations with technical people, I call myself a hacker. But
> when I'm talking to journalists I just say "programmer" or something like that.
> 							    -- Linus Torvalds
> 

-- 
Kind Regards,
Niklas Söderlund

