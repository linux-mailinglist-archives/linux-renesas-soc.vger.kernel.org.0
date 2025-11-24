Return-Path: <linux-renesas-soc+bounces-25077-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 87200C80E13
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 24 Nov 2025 14:58:21 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id E5A8F3A70BD
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 24 Nov 2025 13:57:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1A72630C34E;
	Mon, 24 Nov 2025 13:57:43 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-ua1-f50.google.com (mail-ua1-f50.google.com [209.85.222.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 84A0E30C342
	for <linux-renesas-soc@vger.kernel.org>; Mon, 24 Nov 2025 13:57:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763992663; cv=none; b=BzzeIezogTUXwzdzisZUo39B3R4YmwEqW3Ch9Gkw6Q1cmdXrIj5LOA0EzmTDu7Qs3q/u1CUrq0blPdYnF6f22UJIEMNF0hVkkyLgwP23hF/iguWT5l+jbA7l5dRwHlO787nAJBfftwaFpMoy+72h7Xl3xxWWqzjVgZ0tDMOSrug=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763992663; c=relaxed/simple;
	bh=bchZ5tACjnrIGiEU8MABHKftHjQFSFw0IuJycfThXEI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=AF13Sl4osKieDg/e1rlBs5RrxZwa4xoQvFfA9MqTAkVZHgmH+q8f3Q74MFkISo1oVVfZRlxOVzHW1XNP4nP+iwwcu3PZB5C0BGVZDElyyTfZEfA+uUiWL12Yg6PkKlM+gZGFhW5+r9RJ1SuHcQfl7upajXSIvocq8mlRg1PvYVY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.222.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ua1-f50.google.com with SMTP id a1e0cc1a2514c-9371aca0a4dso2527982241.1
        for <linux-renesas-soc@vger.kernel.org>; Mon, 24 Nov 2025 05:57:41 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763992660; x=1764597460;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=tPxVfYk4ukv1iM/zrMyVlR4rcaz/JJUYyFSelUS+neY=;
        b=VOpYipAu39tbGfvTs1KJ5sV1hEpEm3RYh1J7tA3eXRtR+9l8aRGAEl8F9YfOwi23eb
         yM3FVJNKSkvdVE8//MIvYr0Oc+gAhu612VSrtE66ohYwsc9Z0adCNfJuQkm+AwNcYFM+
         IVhdVQDzS4wnsUxf+Z/CX98GxvWrL0HGN4Rjf+A6ajZxTk+tXDF1mIZlLAYCFoSG0Xgm
         0VKnA7jXdkZeegfYoN0QYNSX68U/3yY2Pt6tHoEIhw7yY7vHzp+YUroRv7kSM3x/z8yT
         YQa2xOf6UGSBh4iAKg6iQGDpEPNlAeGQ3WEkDdUhoADeQUCJUKRYWns+qgZJTWRi7tB6
         8jiQ==
X-Forwarded-Encrypted: i=1; AJvYcCWh8z+FWCeE61L1hz3rvbVe9U2GwsAm85bSgPqE0RlIj0ef/hx264Fc6rlWzUHof9EHk3da1hzA3ZIDWoWTjRpUZQ==@vger.kernel.org
X-Gm-Message-State: AOJu0Ywut/wO3RXoNuBuyyjhwgyMZweQ4sZ3ZLwv4GgVVAFeBxNpN4f8
	fo1+TDvYTPvk1F6frrsrYW/snEtdEuq1gbkzg+qcevRsY17DJyAdqpQjDzlas59G
X-Gm-Gg: ASbGnct+JuwVO3UJ05/aOwoQAC9xClE4k0TbmDPoU9ZicwjEbmdT13YFOfDng1w1BmS
	3hUREvKywMIkMKluq4OpU1lIY16R0WCAv7QiHGLfxZCms33RyIOi5ppJYoFAQsIjSPIeyj0tj04
	rk1ucRBmbEGzpKxAlpM4IrBHanjTlY8+yLt4xS1s2pbqSE/wg8SG4+Kl4tnnIaBl/EcgmdOeAVb
	1ahYCrqZMaZfDTbVE9jcLrNTN1HsRB3B0HwB5V3ZtyJAgPglU4wOsuQtJ5T4IBiMYBOyASPhZHi
	xbD84tfyj5hd5o2B4U3oS7vWNVUvenQlf7ayckjvKyk5YJgF7mmkaA9nDL3P+AQUMljtNoxlGf7
	1c8B4zEWqqRfItCdPj3kgtZYTE8BYj2C6LInLthIw3KgTdUvRvNqq9bibgt26JpHBGk74GE/B5R
	coDhd5+57J2EeYu/ZLgb66I6OgBExiwJezO7j6nClGSk93fh8coIqXkfvy2s8=
X-Google-Smtp-Source: AGHT+IGyhhUUcrCZoBSjgFKmSy+kzxM/yTgyNbB2LSVXxUkaYelEO69U24Bne+AbAGVS1vafbfXFJA==
X-Received: by 2002:a05:6102:2ac1:b0:51c:77b:297c with SMTP id ada2fe7eead31-5e1de272e7fmr4033960137.27.1763992660375;
        Mon, 24 Nov 2025 05:57:40 -0800 (PST)
Received: from mail-vs1-f54.google.com (mail-vs1-f54.google.com. [209.85.217.54])
        by smtp.gmail.com with ESMTPSA id ada2fe7eead31-5e1bd96889csm5495973137.5.2025.11.24.05.57.39
        for <linux-renesas-soc@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 24 Nov 2025 05:57:39 -0800 (PST)
Received: by mail-vs1-f54.google.com with SMTP id ada2fe7eead31-5dfae681ff8so3073453137.1
        for <linux-renesas-soc@vger.kernel.org>; Mon, 24 Nov 2025 05:57:39 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCU5vY+TOK3yleGhx6Y3QBAceTmR9zaCJTrPThHW5J0cEJR7KSVTNZIPfwxIQv9L6mOnc+PssZFpPPhb6UYU8Gma/A==@vger.kernel.org
X-Received: by 2002:a05:6102:5a8f:b0:5df:af0f:308c with SMTP id
 ada2fe7eead31-5e1de345e11mr3648012137.38.1763992659104; Mon, 24 Nov 2025
 05:57:39 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20251119110505.100253-1-prabhakar.mahadev-lad.rj@bp.renesas.com> <20251119110505.100253-4-prabhakar.mahadev-lad.rj@bp.renesas.com>
In-Reply-To: <20251119110505.100253-4-prabhakar.mahadev-lad.rj@bp.renesas.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Mon, 24 Nov 2025 14:57:25 +0100
X-Gmail-Original-Message-ID: <CAMuHMdXO7JoaE+dGUx_AdQfTmxSc9cL8XBc23rMj2HEOqhgGpg@mail.gmail.com>
X-Gm-Features: AWmQ_bnnF32q6DHPAtboZ-Vj8KCfKhuv2OTygkZFZWoBgnWPB8SMEg2sntk8aIM
Message-ID: <CAMuHMdXO7JoaE+dGUx_AdQfTmxSc9cL8XBc23rMj2HEOqhgGpg@mail.gmail.com>
Subject: Re: [PATCH 3/4] arm64: dts: renesas: r9a09g056: Add USB3 PHY/Host nodes
To: Prabhakar <prabhakar.csengg@gmail.com>
Cc: Magnus Damm <magnus.damm@gmail.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	linux-renesas-soc@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Biju Das <biju.das.jz@bp.renesas.com>, 
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>, 
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Content-Type: text/plain; charset="UTF-8"

On Wed, 19 Nov 2025 at 12:05, Prabhakar <prabhakar.csengg@gmail.com> wrote:
> From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
>
> Add USB3 PHY/Host nodes to RZ/V2N ("R9A09G056") SoC DTSI.
>
> Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
i.e. will queue in renesas-devel for v6.20.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

