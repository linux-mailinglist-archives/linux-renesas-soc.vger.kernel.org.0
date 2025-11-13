Return-Path: <linux-renesas-soc+bounces-24577-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 1725DC58BBD
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 13 Nov 2025 17:30:01 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id CB92B427FB5
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 13 Nov 2025 15:53:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7CF94352927;
	Thu, 13 Nov 2025 15:46:51 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-vk1-f177.google.com (mail-vk1-f177.google.com [209.85.221.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8C584350280
	for <linux-renesas-soc@vger.kernel.org>; Thu, 13 Nov 2025 15:46:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763048811; cv=none; b=ql//dkDIe3VUoTqCkWPdetpPuTyOgwc9lDhAnMD6BITnitFuVmwV4YgO+t7uwpPGCENGh/2iPzUY7lS2HRPkFZsYbHg0HvDbHnEBPtRpE9tcRUQwoR9/hseMmQJ7gdPae6sn+W3RRVBcXNrkYSFNNUIH5U7wZFOWacW0XAKeOrI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763048811; c=relaxed/simple;
	bh=JbMu6ahMlLII1KW/kjAvmBsc+G89KXscjqjvlqGkV2o=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=gWs2l2Q6WxPNUEFpg5erJIJvZqbDSYXYYDNiird2lDaQd44OuUUNmbWCmu2mFRSfR4hstj9hDxM9ZWWY/78XapdJJsHjv2F29/Zea37eolTRU+i0Dq2DwR1VS5n9EC7stQm7JuF88Cjnj8WiNc2m0YBSs9t7ladbpQDhfhx2SrE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.221.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vk1-f177.google.com with SMTP id 71dfb90a1353d-5597330a34fso689956e0c.2
        for <linux-renesas-soc@vger.kernel.org>; Thu, 13 Nov 2025 07:46:48 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763048807; x=1763653607;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ScuVkhi+y4j9hXy/c6rksPSqjbU1qzqA5VKC3tcakUw=;
        b=p19OfLHhkakHLvCXMcIX2OJYBiwTyvMXu7GZO87ofb9M4nsh+NeGzGiQxi7O0lO4lX
         a0EFa7QRyX9taE5eAgfyuaD8HUy3TCAjQxsR7jX4b0Snu1T4ZVZArHuaPkWKPTEgWJer
         sDyfW3KvnSi9ne7MsKGrElmez2n5EWqPKFBh251BDrI37FQ6uOqSkawjbOrDXUBrbIgt
         6lxcZNrRS1cggyPXXWI0t3GjqwJoGhOMKMJcQq4CsTwHGdLarrLirr6KsqBJBqJMbB+/
         L8i8jiLLnujiMdAxFZBObQLeB7Tqcn+uOh6fvwOWpb0S9Vwpxhs4F+Rrp6hU+bG1DENf
         WAQg==
X-Forwarded-Encrypted: i=1; AJvYcCUYKf8U2yLEUEKHCiQTjUIIHjZLeAP0ZzMTgX8cqAsE7MMSg85qs3G9BqJHhAGs/RM2m56vOWNLrgMYy/y7NSMpLg==@vger.kernel.org
X-Gm-Message-State: AOJu0YznWR3Lfso3D3/DyAqZguAERUfiX4TiIGv8UlZpFbRqt19uG1TD
	GmMVXydIMRGD6U9EiftqI+lXKanq9Uwe6VdnObSTLybME5rdT8SfQAzj7GOH9syJbPc=
X-Gm-Gg: ASbGncsQlhd/W0eGHdf7MdXPKVdslztmb/yXeK5YpZc/aN/6T0xH5d3mP5gylhwsF9h
	exlZrh36ma0Mu8mVpK8QYGT8kUCuj+Qv+GUeMpr7KNpA9+GYsGhYO7MPeENnDp2EOTHyU9INOCw
	dW0UaK5GKX6gyFF1OEVNEyGwtJKffGz4uqYHPunmqqw/EMLWkjJifpX4LGHXH/hCceQ6ffhDJGG
	bWxCSddkOIbQo8BuaW6xI2vNDcoS6Lpv5WRAlFELOjxiQSO4cmAzbhwy5jDYrj8KMs0TE2fSs4c
	+it9ZbB5g8d3gJqJQtOlxCTohY6Ne8zPDVykaeatVBMSx68AlJlqWZOnLJGysdGUubffploV78O
	xDaDOiGUqjQPJe7PUY8eJRQUNV3bdNt3nKCiC2FKVnoA7osaeqYyvslonRq3IThrkL1GGaV1qDE
	riLwoPvpzFfP/oPlX07r8fyqMFp72IIcpNvVzF9ukhSXSHHQGw
X-Google-Smtp-Source: AGHT+IFB0usb0oGxVne2nKT7gkbCMo9LcXh/jh6nulDk5TEdVAxuN1giLWjsIxIKSkv35DnssGOX/A==
X-Received: by 2002:a05:6102:6442:b0:5d5:f6ae:38eb with SMTP id ada2fe7eead31-5dfc5c04515mr11891137.44.1763048806688;
        Thu, 13 Nov 2025 07:46:46 -0800 (PST)
Received: from mail-vs1-f48.google.com (mail-vs1-f48.google.com. [209.85.217.48])
        by smtp.gmail.com with ESMTPSA id a1e0cc1a2514c-937611bfdfesm674105241.13.2025.11.13.07.46.45
        for <linux-renesas-soc@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 13 Nov 2025 07:46:45 -0800 (PST)
Received: by mail-vs1-f48.google.com with SMTP id ada2fe7eead31-5dfa9e34adbso759246137.0
        for <linux-renesas-soc@vger.kernel.org>; Thu, 13 Nov 2025 07:46:45 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCWUSXHzgNygSQrt6m4N0VsLgSlZ8UgCZQUTxhEgj2Uqtu4Z4Qn+Jgjsbl+l653sGD6qmaBNo2WlfNxxPVtGVCDV0A==@vger.kernel.org
X-Received: by 2002:a05:6102:cc8:b0:5db:ce49:5c71 with SMTP id
 ada2fe7eead31-5dfc55b0bbfmr40115137.18.1763048805410; Thu, 13 Nov 2025
 07:46:45 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20251110203926.692242-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
In-Reply-To: <20251110203926.692242-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Thu, 13 Nov 2025 16:46:33 +0100
X-Gmail-Original-Message-ID: <CAMuHMdVt2rtKs+yRqLBPK+_CwSwZC2XmBor-wmVf_JDyPiFbmA@mail.gmail.com>
X-Gm-Features: AWmQ_bkGYm2i_ZaT0N1d4rO7PGzb0yXpIqlcQJ7vIAPvPbw4btR7TgMuI9BaYk4
Message-ID: <CAMuHMdVt2rtKs+yRqLBPK+_CwSwZC2XmBor-wmVf_JDyPiFbmA@mail.gmail.com>
Subject: Re: [PATCH v3] arm64: dts: renesas: rzt2h-n2h-evk: Enable Ethernet support
To: Prabhakar <prabhakar.csengg@gmail.com>
Cc: Magnus Damm <magnus.damm@gmail.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	linux-renesas-soc@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Biju Das <biju.das.jz@bp.renesas.com>, 
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>, 
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Content-Type: text/plain; charset="UTF-8"

On Mon, 10 Nov 2025 at 21:39, Prabhakar <prabhakar.csengg@gmail.com> wrote:
> From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
>
> Enable Ethernet support on the RZ/T2H and RZ/N2H EVKs.
>
> Configure the MIIC converter in mode 0x6:
>   Port 0 <-> ETHSW Port 0
>   Port 1 <-> ETHSW Port 1
>   Port 2 <-> GMAC2
>   Port 3 <-> GMAC1
>
> Enable the ETHSS, GMAC1 and GMAC2 nodes. ETHSW support will be added
> once the switch driver is available.
>
> Configure the MIIC converters to map ports according to the selected
> switching mode, with converters 0 and 1 mapped to switch ports and
> converters 2 and 3 mapped to GMAC ports.
>
> Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
i.e. will queue in renesas-devel for v6.19.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

