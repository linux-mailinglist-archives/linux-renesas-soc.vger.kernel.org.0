Return-Path: <linux-renesas-soc+bounces-23355-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [IPv6:2605:f480:58:1:0:1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id F3F2CBF50FE
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 21 Oct 2025 09:48:32 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 1C2ED4F7A38
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 21 Oct 2025 07:47:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 240FE284670;
	Tue, 21 Oct 2025 07:47:19 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-vk1-f179.google.com (mail-vk1-f179.google.com [209.85.221.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 80B47284684
	for <linux-renesas-soc@vger.kernel.org>; Tue, 21 Oct 2025 07:47:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761032839; cv=none; b=aV4Rb0jHcEULzor6VYBPaHrcCpkCuOnUuGXEfjptMTEbRPfVf01+H6RJu/yYQK34T9k8jwOh6hhDyqrR6Q5qRIubeHbYyAqsFQbU9Cj/j1fGJPCzSHBdYxlij2fm5pUquuFdZ1MIga5L9nnZjP5IvXWi1dRpTXlO9M/eVENNBM0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761032839; c=relaxed/simple;
	bh=4rLfdYNYjsSbcnQhe0QwWJ01RmTVRIBvCLsXhlunggg=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=AgbLf91H1Pa9KVratIYgkNkIMmbcAbQzy95q37BXok1BvQLIKggyqHGFsIVQcOS8sTaz6rv59ZS5/EI+OKsC+GjPp6/l/yS85x2BqXwmoQkmPJngq8CK+G9K58ZpexQ3QAKBWYvZK/lyh4BTPaco9V1FpTJxfQEAmq2hGzQcRkE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.221.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vk1-f179.google.com with SMTP id 71dfb90a1353d-54c0a10990fso1836164e0c.2
        for <linux-renesas-soc@vger.kernel.org>; Tue, 21 Oct 2025 00:47:17 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761032836; x=1761637636;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=hyBTSkqNbsTAr96ACFRRuX4nnSDrq9+ChtxprKl4p5Q=;
        b=uLk9hAwHhGgFJSPGYS6/X+eVFr8xe6DT5eU+Ls9/McVvsHGrUTaK2iNB/KleqPbQQI
         RyObjDX3lHG2XarU8zQ/R0cWqdvijtVn1WfAuP/HLDXWZzkcUABejluF62DHnm6yBDM/
         3f9tpwL6ypo0eMUB4TBbdpRbScDyj8d1gJfuzsKLTUNHnoahXDNvjUgKqq5cba4C6vjV
         a29ndFHd9Uz5V9EsEOVphzjpGiE1Heb361RvFFjzKu7MR27Ww+MVrZD349RaL1AvT0Nz
         4NKXVLqPKt4BS/qAN/upbVDW3JiYPD1E7S8gkqoN6mBN0xGhxm0vSHXAthKG8TRJDba0
         J0jQ==
X-Forwarded-Encrypted: i=1; AJvYcCX2Bh4d/CtBzcjHz9c5fOd5U1/nNS7SMSXNmuw5AhWNDlFVbzs8XdUCw9h1PY1HD/yWw65uPQcmARekyedqFhXJ0Q==@vger.kernel.org
X-Gm-Message-State: AOJu0YyC91ykaei0qcJFQjLOafIfCqIIwREaFGYZr0/icw1BtSCRKpDe
	xTnXwhk3IXVHUOM67/9KyXxaE/DJw3cVuQX8CrA/qAddzB2G6P3ErFJTST5XX/ru
X-Gm-Gg: ASbGnct4KycHvdLCMYh7sb/tecmfBFGU+++rfXkzOnM973J3KoZ9r4LaAQDd1ncGa37
	84Fzax4DP54T2HCBa1KWpjThKk0nm1E0/imxeK/fBPQxnO2GdW+Yyh6TV3mV4HDPM2OpMTPKiNP
	UuU6Qpb+bqM0Jdurc2o+z0gg7jPEpZvaB+hEtzK66+zGyGHdQ7l2YEM9LvnO022BqNQi2s/iMZb
	jOTLL5cCLuPRl+lnQrGYv88DTqfXLPGcgzeXYTAkfVpqBWhfeyYUxRa5qbCJ2XRXNC2FWZCVR1f
	p7hBqDTSeqLHXu4CBuOyCHC0EIpV2jRvGp3tAAs/2M3rIGlBNQqnYzr4q04N9Fed3pMwdAkHPbx
	mZUmXj3Vlr+UWtxCBX39pGPr9SYKnnKLMrrGEPgVjLlaa0Tm78+GE5pc8GOiTcEU/sizYG8HZoO
	kKkwyD5ZDhE385b9xCXJfR1ItRxRcUT8QzRF7pY6RtNuekDnTK
X-Google-Smtp-Source: AGHT+IHCYlROJa6XyzlJ7IbDiJ2eOuIrY/j6HVYvgISbEn4jvRNJFK3idKtgC+4GeYrp8DIi09RnvQ==
X-Received: by 2002:a05:6122:8d4:b0:54a:71f6:900f with SMTP id 71dfb90a1353d-5564eca636emr4190707e0c.0.1761032836154;
        Tue, 21 Oct 2025 00:47:16 -0700 (PDT)
Received: from mail-ua1-f46.google.com (mail-ua1-f46.google.com. [209.85.222.46])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-55661f9b0b8sm3089354e0c.8.2025.10.21.00.47.15
        for <linux-renesas-soc@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 21 Oct 2025 00:47:15 -0700 (PDT)
Received: by mail-ua1-f46.google.com with SMTP id a1e0cc1a2514c-89019079fbeso1127596241.2
        for <linux-renesas-soc@vger.kernel.org>; Tue, 21 Oct 2025 00:47:15 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCUVl+jkPJVzJNALcGCHoVLnpvB6OqvkTOSxLQ9NyJci4lFH6Rs1cw3Z02oSUim4kg1p9ujNopsEaWy4JDMtnw9f0w==@vger.kernel.org
X-Received: by 2002:a05:6102:548d:b0:5d6:687:ac with SMTP id
 ada2fe7eead31-5d7dd67f9a9mr4245252137.31.1761032834720; Tue, 21 Oct 2025
 00:47:14 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20251005111323.804638-1-cosmin-gabriel.tanislav.xa@renesas.com> <20251005111323.804638-6-cosmin-gabriel.tanislav.xa@renesas.com>
In-Reply-To: <20251005111323.804638-6-cosmin-gabriel.tanislav.xa@renesas.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Tue, 21 Oct 2025 09:47:03 +0200
X-Gmail-Original-Message-ID: <CAMuHMdXDGJyp-aOWSMuPR79heRGg07VMd_F_GgV7j7yb9k+RSg@mail.gmail.com>
X-Gm-Features: AS18NWBfETG-hXu7wbnQOlGl6tEMYt_Vg7yeLyUKLs2dRaA7g8MciWHBy3GKdoI
Message-ID: <CAMuHMdXDGJyp-aOWSMuPR79heRGg07VMd_F_GgV7j7yb9k+RSg@mail.gmail.com>
Subject: Re: [PATCH v4 5/6] arm64: dts: renesas: rzt2h/rzn2h-evk: enable ADCs
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
> The ADCs on RZ/T2H and RZ/N2H are exposed on the evaluation kit boards.
>
> Enable them.
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

