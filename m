Return-Path: <linux-renesas-soc+bounces-26725-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 3D888D1E43E
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 14 Jan 2026 11:59:31 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 70419301AD1B
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 14 Jan 2026 10:48:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DB652304BCB;
	Wed, 14 Jan 2026 10:48:47 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-qv1-f54.google.com (mail-qv1-f54.google.com [209.85.219.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 809D638F230
	for <linux-renesas-soc@vger.kernel.org>; Wed, 14 Jan 2026 10:48:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768387727; cv=none; b=kY2FqTVRHoqjrcMZgwYxwG5BMSUoF5MvLlAx1pwlNRDS1zgJRDOS/YI0a9d01xkMDazdc7uOlbKWP48f0GRibVkCToHFVO3ANb0jLyPFVX8MW2Ia9lEf1mruOz/B+OtlAiRCb4cVtf38xUNfjvmHUap2J9o/TK2GmMogJ1XRPFc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768387727; c=relaxed/simple;
	bh=+CpkI+BgHc6zaB6k60VnTXT0jloiPS7gjdxb71LJsAI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=eoEKDmQ6Xvs51EaDAsHcZxETF9S42q2bj2mO/ftvOmlIsKDHtLiM3p88ZY3fjoZjcUcjxSrYJRND2i7spn5jIruoj5EwgFj4a0zD+SFH0d2q/qIV6XSw6s8R3nhRrBi0C7ImG66Gt/2ZwuYiwrv09r2of60p5RqcageqDvfZz5w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.219.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-qv1-f54.google.com with SMTP id 6a1803df08f44-8907f0b447aso96054906d6.0
        for <linux-renesas-soc@vger.kernel.org>; Wed, 14 Jan 2026 02:48:46 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768387725; x=1768992525;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=tyHAPthnDWEMy7Xz8e1fs/6rcFrRy4CPLB9pLiuxF3I=;
        b=qPKePtz2R9mbWs3kKpkYJjVP76679ra1T8/vvfoprvW+T+SlMoQeoVwik9jI5tbvBM
         EEG4pT00qf1/qLMZJmeBEXG5uvSdVrXHBtx2tP0eLLV0A4WHucziXgnJD+0QFNDMjZ7X
         g54YVn4AjVhT+iqyE1jz46RV2jQcaRFlUrq0byYZKS6rujb/Oc3O2c2cHtGNlw0M4d9g
         I3u7a9KWgCRlhVaQQC2eSrFTNfmHvqdEm7vW4kkiCnfPR6jwWaVhe2uLIu+BWw2xzys0
         zQ3uWb5BI8FTRp6Y48VB0BOu4jBKyClMDTVrsSdR/8UEL0DnW6wZcExbRskKsXI6535G
         Yztw==
X-Forwarded-Encrypted: i=1; AJvYcCVzPNkY/h929i27mwe75Ar+z1LYIoSIKMBE4hjEElpSwVL9Eb4i2Z1BYuK2hHFVUuuSmSQLjN4INePirG2A+mqdFA==@vger.kernel.org
X-Gm-Message-State: AOJu0YzuKfUGpJ3dp4ePr7Iqfz4VhHg3PGshfjXb4CdLSJ1F8yRYHSEt
	JzjS7vIOJ6/2xukbWRPZ+6f8QvkgQ8E+vDkh/X1rpY30l17/f+A/gBQNOECD3+AQ
X-Gm-Gg: AY/fxX4005p0NtFovadkgEHcewSqaEBJOzYEviDIGoGUv55O2FCL6Rl3gyz/bIV9Voz
	cIV23HS6IlY674aJsNS2GmM5YycyqzvMOQdl5kX4Al51r2an0nNFX94SCenpcoqzz0pLMO60Qby
	ZRD0rai2zDor2trquWQsHm3kdX0eNa9b+2lWdCmhFTXEpEzQ1giFefwZ8YYp5s/MP/0L9YJJu3V
	3LwcmuVp3cXDFMxXNwEcMINXu1rr8fS1vt8K/QggAYMDG8FAfDpHnmcAAP7wFlRieH1aexy3XW8
	gBD2PMyjcxg4BRTeXkHGbBUFaNAuhK2eBJDy0kAb/q+4uyie+EmG0AKiBcsAS57WcFjsBAvpoqt
	01U4QLahQOY3XUR5leLeyc0vhE02iwKTfbBVM7tsaKaeFPyGtpW6jthVK46Bq8WGt+VvQBSrwAj
	k/Ii/ponZIRAfiiSg4Pq69KpTpcP4LA4W1mEJhfyQMAtg0z91bfeAA
X-Received: by 2002:a05:6214:f0d:b0:890:6331:7e88 with SMTP id 6a1803df08f44-892743d2a5amr28909316d6.44.1768387725209;
        Wed, 14 Jan 2026 02:48:45 -0800 (PST)
Received: from mail-qk1-f179.google.com (mail-qk1-f179.google.com. [209.85.222.179])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-890770cc7b1sm173500326d6.5.2026.01.14.02.48.45
        for <linux-renesas-soc@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 14 Jan 2026 02:48:45 -0800 (PST)
Received: by mail-qk1-f179.google.com with SMTP id af79cd13be357-8c537a42b53so2202985a.0
        for <linux-renesas-soc@vger.kernel.org>; Wed, 14 Jan 2026 02:48:45 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCVeNy3uKEv0ejRCXXNNi1h1xVnkOZ0HsrKwqxF3WulSI52G7RkDT5Tha/94Ugpx4PeDPMCMcooovkc3b3AwtwgFXw==@vger.kernel.org
X-Received: by 2002:a05:6102:149c:b0:5ef:a4b0:bdba with SMTP id
 ada2fe7eead31-5f17f4325b5mr758488137.8.1768387256797; Wed, 14 Jan 2026
 02:40:56 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260114093938.1089936-1-herve.codina@bootlin.com> <20260114093938.1089936-6-herve.codina@bootlin.com>
In-Reply-To: <20260114093938.1089936-6-herve.codina@bootlin.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Wed, 14 Jan 2026 11:40:45 +0100
X-Gmail-Original-Message-ID: <CAMuHMdXBD5W8GSvSJt73PXcTD-pbdgR6LvR37ESzEx5s6nrQgw@mail.gmail.com>
X-Gm-Features: AZwV_QjGV8YAOz6mJPMHZ_hZCfKnrX7OINnAGBUggG34taCywTbcQHE61jaJ6l8
Message-ID: <CAMuHMdXBD5W8GSvSJt73PXcTD-pbdgR6LvR37ESzEx5s6nrQgw@mail.gmail.com>
Subject: Re: [PATCH v8 5/8] ARM: dts: r9a06g032: Add GPIO controllers
To: "Herve Codina (Schneider Electric)" <herve.codina@bootlin.com>
Cc: Thomas Gleixner <tglx@linutronix.de>, Wolfram Sang <wsa+renesas@sang-engineering.com>, 
	Linus Walleij <linus.walleij@linaro.org>, Bartosz Golaszewski <brgl@bgdev.pl>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Magnus Damm <magnus.damm@gmail.com>, Saravana Kannan <saravanak@kernel.org>, linux-gpio@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-renesas-soc@vger.kernel.org, Pascal Eberhard <pascal.eberhard@se.com>, 
	Miquel Raynal <miquel.raynal@bootlin.com>, Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Content-Type: text/plain; charset="UTF-8"

On Wed, 14 Jan 2026 at 10:40, Herve Codina (Schneider Electric)
<herve.codina@bootlin.com> wrote:
> Add GPIO controllers (Synopsys DesignWare IPs) available in the
> r9a06g032 (RZ/N1D) SoC.
>
> Signed-off-by: Herve Codina (Schneider Electric) <herve.codina@bootlin.com>
> Reviewed-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
> Tested-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
> Reviewed-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
> Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
> Reviewed-by: Linus Walleij <linus.walleij@linaro.org>

Thanks, will queue in renesas-devel for v6.20.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

