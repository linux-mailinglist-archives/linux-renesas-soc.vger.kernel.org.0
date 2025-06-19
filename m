Return-Path: <linux-renesas-soc+bounces-18551-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id AA922AE0A5B
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 19 Jun 2025 17:26:40 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id A729F1BC1B50
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 19 Jun 2025 15:21:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 22A34221F0E;
	Thu, 19 Jun 2025 15:20:37 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-vs1-f43.google.com (mail-vs1-f43.google.com [209.85.217.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7E3FE1917CD;
	Thu, 19 Jun 2025 15:20:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.217.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750346437; cv=none; b=txiEtq3Lby9wzcpztF2ixDiVv/UkDNSm7AAmc698y6uVfaAMixIivzvUk7f4VtsQsiglaTMEL3wvOdgMyIivT81TH6A4+mBLJgXoVLk/X0WUZz/uh9JBO0w7qsFl4Zzq1IA2Bc96UIT+AFpmb9QOchVDVHR9X1QkqVc4eKq8FlU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750346437; c=relaxed/simple;
	bh=ScOYzWHPQH8+sx/yjMIEThr5Pi2LHGCdgt5KNkdEvRI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=eEhIKSpJMkJKbTuvCTcWhO9mnOBrgY1/kQ4M9PmEAifzwgkvBQgLishWVzYRHVDkD0qFBZPaN//swM4LFgIKHEGbQIqK0v9Y8UCQUHRS6uasmV0ADCdYyjoyXmwuesVBYNA5nEcPJw6gq+v5OhijWczkYOxpccWgNslJRM+7BSA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.217.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vs1-f43.google.com with SMTP id ada2fe7eead31-4e77d1333aeso292632137.0;
        Thu, 19 Jun 2025 08:20:35 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750346433; x=1750951233;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=aSkl/380e5H5cxv39S6/yq0VkCvcYJimq8W0g/WHe10=;
        b=A0HuaEh3BiPyxf1qL3I1BVCbLPMUOL17hYnhC9QmPaFAIHk2nNY/2ABjjD+n8H0dKY
         tqceiL+fWu2ABIq22IxO0WTM+EcMYRKf9FzRQwsb77SKpkrBgnHadupzgbKuGP8FyU2r
         qNO9undBdhgSRcz4zH9Di1tRGi1NsoFnf6dMNhk59Ndr+V1IGltWQln2PoQ1YKfiYeAB
         r0cswU/A3LkD7fzML59oBd2iSfqncJO7ZJ9YOyBovokFhOSHgPcwcdTs1psOPMHK32Yd
         q/J18xuKtzaBXramq8Thlh+gvBtqiCUmaqpwN+Svw8Z0/5GcZ/coa3tGg5FyxQ1CG5XS
         5vzA==
X-Forwarded-Encrypted: i=1; AJvYcCUQp76DeyKeUJpufw4VKG/Mp26dGijgymQbjB/22zV200wr/lQ+MNasZMCqRL9nueOlkuuFPeVfv8VPF1dL@vger.kernel.org, AJvYcCUmjDInxlboEqZsrT3J4Mf+dbK1EUimE2jIgiqBuELmZscPef96lFNyMntlEnV9YivgiAKhu74NAW80@vger.kernel.org, AJvYcCXJWAZf8o6TToH0Bpo8jprBJErV7EDcvAsn+1LqyvKOWzeJ8Ed+AtTJqygn5QcGmI2A8hYAQ8oZXMUpOUHm/dDXRP4=@vger.kernel.org
X-Gm-Message-State: AOJu0YwJgumdBBoe3B2Wo92GjtMOcEOu3SPmXC3gLru9/Sev3rGOHxyR
	r8lSmJRPOJLnSO+n34nY3jmAxhSsjPcdByU/YKKnN0Z7pAlPwjZkln2Cnm+c3PXy
X-Gm-Gg: ASbGncuqgo8Q4YdeG8QMJGy0+8A8sTp8VzccIIJS1QYbbrBtXuG0Xwk5iM9hxCbWLdk
	92GkZr3ElOouifskS0Vnokc9Dm8cLQv0GubcR9MMOIfT3glzUh2wh+HWxE7S6Xr6nlSJ2RrO9bR
	RRc+GXmrtx79KXnq93XK4Wgy5qYgQmcURzS7BUKTT0KKso8ulii9sE0FnBlJS2gqOegyoeE8uei
	avSPuQ9ZyQa5R2duV38H7DvLi/KZT6M3DZMa/cKAliZvtl+kv2uvUr67xLZTPSp50rcJL0+VoL/
	DV8lvu+1MaODGF6zDC03RF9Nuci6S+AlMVqDTQZ/1ST6NnfCJsrjtJRLidqu7e6Sdc6LMQmIS9U
	Y30UODNCuKt+NwFvyXKnXvbFKmVl7
X-Google-Smtp-Source: AGHT+IHJkNv5WxWdZgn/0MuGVp/4r8uoIrIcVhGnn2itwg7AS3ocRMykjdeQ5qYR+CcZuxPAg0rAtw==
X-Received: by 2002:a05:6102:4424:b0:4e6:da5d:2c42 with SMTP id ada2fe7eead31-4e7f62b12d4mr16701176137.19.1750346433447;
        Thu, 19 Jun 2025 08:20:33 -0700 (PDT)
Received: from mail-vk1-f172.google.com (mail-vk1-f172.google.com. [209.85.221.172])
        by smtp.gmail.com with ESMTPSA id a1e0cc1a2514c-87f0f8e8682sm2429934241.0.2025.06.19.08.20.32
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 19 Jun 2025 08:20:33 -0700 (PDT)
Received: by mail-vk1-f172.google.com with SMTP id 71dfb90a1353d-531a1fad7faso238414e0c.2;
        Thu, 19 Jun 2025 08:20:32 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCV7MQa38SRB7/ngp/rp2vy+rjaRKwxzb3u6l5W5CQb1L3h/SEn1brBCy/vSI/CaKjhhVgfUDxN55RX9NWLxw/CmGP8=@vger.kernel.org, AJvYcCW8XHyq5s7t3C6UVI00budfJjLpWD8LQbhvfqitb+U/lST8dmPGdYu+O/lp2e3H9TgG+WhLkBafAQm+2DIE@vger.kernel.org, AJvYcCWh+///RLGxWVPHE1gnHJW8TN4rqlxEathEfmfTO5zhqgURcncSxDJymWA2yCCnJEjVMnqJ8Hw4JLPK@vger.kernel.org
X-Received: by 2002:a05:6122:3d0d:b0:520:6773:e5ea with SMTP id
 71dfb90a1353d-53149c507aamr16508674e0c.7.1750346432516; Thu, 19 Jun 2025
 08:20:32 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250617171957.162145-1-prabhakar.mahadev-lad.rj@bp.renesas.com> <20250617171957.162145-3-prabhakar.mahadev-lad.rj@bp.renesas.com>
In-Reply-To: <20250617171957.162145-3-prabhakar.mahadev-lad.rj@bp.renesas.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Thu, 19 Jun 2025 17:20:20 +0200
X-Gmail-Original-Message-ID: <CAMuHMdXUJOh+7Za5j1OKmKsUAtAFF91=817b6XTgcHm8KkH4jg@mail.gmail.com>
X-Gm-Features: Ac12FXwu4ud-dOAPgVZ6B87gIE8_tROCw6zpgToA0179mn-fWyXkmiQIoEVlLCI
Message-ID: <CAMuHMdXUJOh+7Za5j1OKmKsUAtAFF91=817b6XTgcHm8KkH4jg@mail.gmail.com>
Subject: Re: [PATCH v2 2/4] arm64: dts: renesas: Refactor RZ/T2H EVK device tree
To: Prabhakar <prabhakar.csengg@gmail.com>
Cc: Magnus Damm <magnus.damm@gmail.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	linux-renesas-soc@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Biju Das <biju.das.jz@bp.renesas.com>, 
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>, 
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Content-Type: text/plain; charset="UTF-8"

On Tue, 17 Jun 2025 at 19:20, Prabhakar <prabhakar.csengg@gmail.com> wrote:
> From: Paul Barker <paul.barker.ct@bp.renesas.com>
>
> The RZ/T2H EVK and RZ/N2H EVK are very similar boards. As there is so
> much overlap between these parts, common device tree entries are moved
> to the new file rzt2h-evk-common.dtsi.
>
> Signed-off-by: Paul Barker <paul.barker.ct@bp.renesas.com>
> Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> ---
> v1->v2:
> - Renamed the file to `rzt2h-n2h-evk-common.dtsi` to better reflect its
>   purpose.

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

