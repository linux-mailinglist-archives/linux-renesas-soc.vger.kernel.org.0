Return-Path: <linux-renesas-soc+bounces-25983-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 4BD77CD62C4
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 22 Dec 2025 14:36:54 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 19D973011B13
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 22 Dec 2025 13:36:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AE5A5302766;
	Mon, 22 Dec 2025 13:36:48 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-vs1-f47.google.com (mail-vs1-f47.google.com [209.85.217.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DB8EA2F6168
	for <linux-renesas-soc@vger.kernel.org>; Mon, 22 Dec 2025 13:36:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.217.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766410608; cv=none; b=Rr8igVeQcY6y6gIeyXg26alz7NOAYOxt1avjquVwTOj9h8hFPiXHnv7y3khcWe8SEtpt3w/MHHJaQE0/hfez4/dq1r9gw7yLnKcHfX96mUApXyTs5sx57t103w+IR9p0F6y3cFQ/5gRFqSR6H4HJKese9wMaHIs0VN+6ucAdip4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766410608; c=relaxed/simple;
	bh=dTQUrjFwGkubE0gbsMMweQhxBG+tHQk52NGssDmMAiI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=B9w/4D+U66+NiwwVgSgTWQuHeVR59IpfZ6eQ9nJtUHG0icJ2jTtmM6FeJoAYkG8Z5kRw+/ZMHBiLahdpcqeMs88JsbmQ1x70bd/9Eid1v+jar4wGDCflmJh1usaQQ4vdJKI0RQf4/Bc7Ysi4XV5iOu16bPPgnIo9I9QmfdBmFZE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.217.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vs1-f47.google.com with SMTP id ada2fe7eead31-5dbd8bb36fcso3173334137.1
        for <linux-renesas-soc@vger.kernel.org>; Mon, 22 Dec 2025 05:36:45 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766410604; x=1767015404;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=LkEkVXOBUK+8jQQJIkENuCRqGRgCBUZJdvN6vgZt39s=;
        b=A1wHejQgCw6z7aZ9g0iw2eIIN+yLBUB7XobFCGhPudlY0A6z/jb1gMOYORMimjIKDK
         is90uhE9qGqEwt3RzAA/qDC3HJ863VdPXz6OzpxyyC+x50pEHUNptjXr736uDSnUh4rP
         Ws8W0b6s5VB98ZgpUDiyC+M6iE3cSQwOAJ8zq6xWhSNkom2VsqGRs82BGQbi8VFuJhrj
         KV8jj/QSI1yh3jMd6S4JvdmznPa12sgDOGaf7Ht3fogUiZl6dL+QNEgbQyMA/MMJqdz4
         gbwFkNeIG/oVqEJA7EzZ8+WDZDgkqxiDgQUxYvID5tKbaHcBRzww9Hvvj1tFcqBNhXfJ
         pKFw==
X-Forwarded-Encrypted: i=1; AJvYcCU3Pc+WsofiuNFxuZtN6Mg8aQlGkiJzsRzoNsIoz+YIzTVP9icw2pW/imx1uxey5rKQsjeRZd2jcvgKMGAe8+gOaA==@vger.kernel.org
X-Gm-Message-State: AOJu0Yzs2jnbbRYQ7A8nCIwi/+OqFF8wSIQ3HF2IuOJk+dNkvGPtkX2N
	du34AMMZL8lIPMntv4efIeRUgez6jY2IvV4ugK/pnDEKUhyg4jEDwQWJXnV+zExf
X-Gm-Gg: AY/fxX4ORJ0FmTOaD5hbLYYeLvEuRIIWsSkx6/dg3Ey5B0la41Vhf0JbOGfIgJlBsmB
	mGkoB24ajwlEmn6pdADdNhdSylhsgd9sY5AADtC+ISyCjFMh6MJnYC5FouXmMUDzimTFFkwq7gU
	vCrjgJRsKPHZgDwII2cHFp1fX48PrGKJJJCYelzrDutM8cv0p+YYWh65EZLQoN2tBPiaUxA9LL0
	pKCPHK8rEMAocns0OaAMn3eWjFKBxyA+Hjag3SIaNqA2bk+jCXF0Ym5BdmGrLJtsC64+S945L/S
	on+ijpmQl+ea/6w4Xis58AP6+9LvXDpYXy0QblEuURhCeBVSztYWOoHVu9yvrI5hLawUIkixpT3
	YDea+HWu7fECdh2hm/sN0C+8rMYApzGXANgBaYJt6IbaTXPpxg3iiNJNkeFWeAss0Z57T9lSPfi
	ZLr3F41GaB4uCriViWIMKyAH2rayJmpYTf03Cj6vAUVl8H3ljy
X-Google-Smtp-Source: AGHT+IHJODzR/4kqVlzsYBPUDy4so3Jl0pQf8onCxN3SDMqc1syechpbD+5v8ki8kLnmImhKypLdpQ==
X-Received: by 2002:a05:6102:26d1:b0:5dd:a0bf:8c89 with SMTP id ada2fe7eead31-5eb023b641dmr4851094137.7.1766410604589;
        Mon, 22 Dec 2025 05:36:44 -0800 (PST)
Received: from mail-vs1-f43.google.com (mail-vs1-f43.google.com. [209.85.217.43])
        by smtp.gmail.com with ESMTPSA id a1e0cc1a2514c-9434176b55dsm2817039241.11.2025.12.22.05.36.43
        for <linux-renesas-soc@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 22 Dec 2025 05:36:43 -0800 (PST)
Received: by mail-vs1-f43.google.com with SMTP id ada2fe7eead31-5dbd8bb36fcso3173318137.1
        for <linux-renesas-soc@vger.kernel.org>; Mon, 22 Dec 2025 05:36:43 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCUoQTNIK5aXzRYU2s3YozPXNe/e1VY3tYH0NQos/HrkCcLlWDSUAs0ro/VegfXURQnBZnYkf/DW9E0gxOSiCRMJMQ==@vger.kernel.org
X-Received: by 2002:a05:6102:f82:b0:5db:f897:59f0 with SMTP id
 ada2fe7eead31-5eb024c6470mr5244066137.11.1766410603362; Mon, 22 Dec 2025
 05:36:43 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20251103200349.62087-1-prabhakar.mahadev-lad.rj@bp.renesas.com> <20251103200349.62087-2-prabhakar.mahadev-lad.rj@bp.renesas.com>
In-Reply-To: <20251103200349.62087-2-prabhakar.mahadev-lad.rj@bp.renesas.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Mon, 22 Dec 2025 14:36:31 +0100
X-Gmail-Original-Message-ID: <CAMuHMdVSGhvewOB+BKE8d8gu6Du3-A5V3BzRGAiB0=0m3v1sEQ@mail.gmail.com>
X-Gm-Features: AQt7F2oTy1Q7h9hYYdcCF_F0NGf_UEXtPHwES0sXifBsGDbdSKwdtbA6Pui5cic
Message-ID: <CAMuHMdVSGhvewOB+BKE8d8gu6Du3-A5V3BzRGAiB0=0m3v1sEQ@mail.gmail.com>
Subject: Re: [PATCH 1/3] arm64: dts: renesas: r9a09g056: Add FCPV and VSPD nodes
To: Prabhakar <prabhakar.csengg@gmail.com>
Cc: Magnus Damm <magnus.damm@gmail.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	linux-renesas-soc@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Biju Das <biju.das.jz@bp.renesas.com>, 
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>, 
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Content-Type: text/plain; charset="UTF-8"

On Mon, 3 Nov 2025 at 21:04, Prabhakar <prabhakar.csengg@gmail.com> wrote:
> From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
>
> Add FCPV and VSPD nodes to RZ/V2N SoC DTSI.
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

