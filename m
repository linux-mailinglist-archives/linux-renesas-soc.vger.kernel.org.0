Return-Path: <linux-renesas-soc+bounces-19521-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 8D938B0231A
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 11 Jul 2025 19:47:23 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 88A177A4C71
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 11 Jul 2025 17:45:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 20BC119E82A;
	Fri, 11 Jul 2025 17:47:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="CiPk5+Pn"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-lj1-f180.google.com (mail-lj1-f180.google.com [209.85.208.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4E9822AE66
	for <linux-renesas-soc@vger.kernel.org>; Fri, 11 Jul 2025 17:47:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752256038; cv=none; b=c8MqFbY+ScSzAFgDjDuzUoivWNqQ5sC0nO4jL/cNdq5Ab8bFK7njhanvJbBl9ThbyaEfrfAUVDzw8+kQYM3GrexnJ5aC/O729Ems4Dyd3MHxu3PSiVxgZ2EPIOd+ickGJYHAmIa8Z9uBMV792UtWf1i3/9dqSb/PSzqxJUJ7KV4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752256038; c=relaxed/simple;
	bh=Kbh5lzG1/MmpNMzFmA7c0uNWesP/syy+KMxcW9SydSI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=elEpTPgVWa30lRCLRc3JXA09PRraiyec6GvAFlTwSLLryul7nn3iV+vniURQHd36u3+yr/P4s5ZJWMO07J9gPdsN8pKwXxM4B9IppRaeFuJWMfiaMmcXoA59WMLLBKy43BTa+d6ODkV4B4+WD441BWfu29yyMuSiU7ndNEayXsw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=CiPk5+Pn; arc=none smtp.client-ip=209.85.208.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lj1-f180.google.com with SMTP id 38308e7fff4ca-32b8134ef6aso21615271fa.0
        for <linux-renesas-soc@vger.kernel.org>; Fri, 11 Jul 2025 10:47:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1752256033; x=1752860833; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=7cOfUcs8bO2r/HGvePRD4ra10KW6myCvruW5dIJCDLE=;
        b=CiPk5+PngLXj2NBNsPwvQ9oTfTgBnGQ6kO3w9bWvVlcottVJUrB0GOg/wBAFkIynjz
         sJ4BJdstFjjFEXxjWZ9+PeN6Dk/Xzhpv7FVX/CyUNqR896dQFsvXOTzEmzf770IQtLWN
         5VuVtMxEtvK+KlXbHvtSpkk2MmZX52LYcAwKC3N03HuL3lx4jDd+744FgFLsAGzPcfkW
         rng63J6dJbiYxC+Ctwu0xyIXdO2bXPifH6RLwh8EcrSffTz3rLI73yAouPC59NTdlf68
         IAgGI44ZEzgF6LaURIoBZy8oBVstnzwWbmdiFR1Ou+aHnXwgagvIKQL4ry9Ixf5XAJej
         zwrw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752256033; x=1752860833;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=7cOfUcs8bO2r/HGvePRD4ra10KW6myCvruW5dIJCDLE=;
        b=V+ZMolmIk1rP6FNcLCQ1QFmEr6NylG5Z0nx3a7jzFxfdrkVsa5iEbIG+86Eg0Lq+1A
         UJMWfTKaLapeCLxRBKUx0Okg92aL+yx2fGX+2iZfUwJXGd0EsfRVxgVM4zieT2tQqvZ7
         5lv8BiBWqzrldtlws1rza9rvc1TPoHBMhzqhpt2Ve5PbUTsiTU083JNM/6abIkXHroiM
         FV0BO3ESGKAIdpsny/105v5wO4X3UGuctGN2gD4PgbCxozQk4MrsbVIKTZYmKN+8p4+N
         sg0m8u4oijwsA1ill9yWSrfl7LViHHbGIVWPXuR0FWF6XuBh+y3JHFqHY1iYIks14uKD
         Eyag==
X-Forwarded-Encrypted: i=1; AJvYcCXZeisY1hyeGVgePR4FCiWX753jU2/oUFBPkEr6SNQgocIDYJZCcw4X74X2SaxsqZzifXbhmqSvCNPEG3AqRTUFmw==@vger.kernel.org
X-Gm-Message-State: AOJu0YzIHhSrG/QuI2juyuISEWJjdzjYwm/F7pGfm7O2t6lMVpGwYXF9
	WHFaL4zYPuGTSdU2fBAOIuGDTxpB4EM1s6fN4OjFgYz8Fn9x/7mZ/X6SzASRdM8EuSiDyjmMVPf
	EI5nBBc+oJlozSYEW2XiVxLsJjssAsK76KmXNHJMffQ==
X-Gm-Gg: ASbGncsvyb8yXpWdcpaFA+qssgmBwZ6fL1ZIHsH/jAd3juPniNucpkB0dOCfZHT4FDL
	f/XP3iFWbC4KjIoJN5DGmniVzs5fEMDFXxyVtiZNeIiujTtVqzg+Gp6Zxqx11bHg7Ta8hcHcwjI
	wVIohkfip5PK1vPpHXw5WigO5f1DHm1Q/SHdvkSlhROYXXSZBOOQLsynWKjbvyQJ2wdC4qpx/FA
	LG2wtk=
X-Google-Smtp-Source: AGHT+IE29/tPzCUZgOFnp3M5AVqflNjt3TR6DbBd8FFhQgMpt6TpX5xeioJd9itBxmX3C7MryhgeiBUJZrvf4/FB9ds=
X-Received: by 2002:a05:651c:2205:b0:32c:bc69:e940 with SMTP id
 38308e7fff4ca-33053499dfamr18435051fa.29.1752256033501; Fri, 11 Jul 2025
 10:47:13 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <cover.1752090472.git.geert+renesas@glider.be>
In-Reply-To: <cover.1752090472.git.geert+renesas@glider.be>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Fri, 11 Jul 2025 19:47:01 +0200
X-Gm-Features: Ac12FXzXv7_pbXFvCvY5VMYSBH-pyPi7J1iDA0jUPQyzNP6Vv_OpEDAS7DBK7h0
Message-ID: <CACRpkda3kVfChCwzgEiPmA2dDomV3n4zpFPcTNr4Qr-meRdRsA@mail.gmail.com>
Subject: Re: [GIT PULL] pinctrl: renesas: Updates for v6.17 (take two)
To: Geert Uytterhoeven <geert+renesas@glider.be>
Cc: linux-gpio@vger.kernel.org, linux-renesas-soc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Jul 9, 2025 at 10:14=E2=80=AFPM Geert Uytterhoeven
<geert+renesas@glider.be> wrote:

> The following changes since commit 52161035571cd62be9865039b4be65615860dc=
e0:
>
>   pinctrl: renesas: rzg2l: Validate pins before setting mux function (202=
5-06-19 19:25:20 +0200)
>
> are available in the Git repository at:
>
>   git://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-drivers.git=
 tags/renesas-pinctrl-for-v6.17-tag2
>
> for you to fetch changes up to 7000167796a00d64322dc3ed0c0970e31d481ed6:
>
>   pinctrl: renesas: Simplify PINCTRL_RZV2M logic (2025-07-02 20:16:45 +02=
00)

Pulled in, thanks Geert!

Yours,
Linus Walleij

