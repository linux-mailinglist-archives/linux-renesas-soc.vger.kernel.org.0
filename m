Return-Path: <linux-renesas-soc+bounces-13045-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 40E5DA30C03
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 11 Feb 2025 13:49:42 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id AD8811888B03
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 11 Feb 2025 12:49:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8E1AF1F9AB6;
	Tue, 11 Feb 2025 12:49:39 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-vs1-f47.google.com (mail-vs1-f47.google.com [209.85.217.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 14CC41EF0AB;
	Tue, 11 Feb 2025 12:49:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.217.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739278179; cv=none; b=X+boOi7qNFB8soXsOIM9oWVDb3esu6aAiQ5/xxARHbN7O60QdwQJlsRrzI/q3ftHLQU27U+lcQD+q/50rEfSnxH+uLcJu591qk2YD477qPKRXwOYGgJM4nw95u3oXMy/WOElXWAKgmdpsjmX8uJT1IhdJuKNfEcj3ZOXcf0jYhI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739278179; c=relaxed/simple;
	bh=flU3SSe4Qc4TmAfvqT5+pJ1zjUTWnOOIQXN33bCwx6Q=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=PXjOtyVzbN2fi4oL+p+0/Ir2yNzrDRMjusUivWRSeRPRxg/LyhGe0GUXtGH9eTEdZRnUymMjsfT2FFx+PStAZFH7LV/jkedIB5xMiKjaEufRSwKtVLZgVWgNL3pKcEFfd85L+R11/q4a0Ak0GADQu+tAufelcVx7WkBpvVd4+10=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.217.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vs1-f47.google.com with SMTP id ada2fe7eead31-4ba7a9c17c0so2896298137.0;
        Tue, 11 Feb 2025 04:49:37 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739278176; x=1739882976;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=6pyxfQka+Z/kZA7wXgsGcvOw9n3YwPQRTvWVrpy4LdA=;
        b=W8k3eNPrR5Q/mzshtLb2UBOBeGQnj4Zdp4tVKNPE3N7E3RWMwMZEpBO4ZBcH6rkYQf
         3+egjAMKCtGtWIEg77yrvYZJh0PahgTa+N2P3okljUAvEhLiM6REjWo/PFd9XWF0C7Rw
         dKNssKUMasAxUxh7Bu1F90mQO7i16byA9Msq/vPrZlDlyJkgrbQvLINg+n31e8xM54Vv
         X7JU8ZsMf5Xt+017tEH7MvqIuPz0M6UekdqysfTKSTiktXcITwVqID/vuaYIQy/xcx72
         /Et107u4LihAAuw2aWF8ScEUQ2oken1vBq6FfSLn/mLTJDmbvL2rRQGGw1N21a9Nv874
         gtYQ==
X-Forwarded-Encrypted: i=1; AJvYcCWV600boy1vBQfx/JmwL1uzaDCx/EE5IzPvCflrR7q/RtO8Ei3bQcqVopGUKI+8FipqYGKLtkSxcPHXnsAeY6KVXQY=@vger.kernel.org, AJvYcCXtyCH33XLDcawRdM8qRti3suRwuBGq+8aDLtP1VYv6pIhjOUDYyqN1eMovDTqXtmHXqNUCWtUpH4OR@vger.kernel.org
X-Gm-Message-State: AOJu0YyZxnEbds/xAr7lUlRYK4iMRYOz/U7lrK+90N7ZbUNOSVYddvcO
	XIRT2f17Irh9sop3tJhiAiuXNLCuuE5HY5mpNRpSif3Ku95+RFjt80FJOaUKU0s=
X-Gm-Gg: ASbGncvhEt+kMlaashfCM7d7+tN4VS8R/43DN8wbD6au7LuPt7gdEVz/EOts3o8mn3z
	dzyYfyyT3rMpifMAPvjteToHLKY9La1S+dp1OjJ1xeLwEJG0JLi4H2uelXmtOXClJD3vcTaL5wp
	tyx1WzgR5eLUOqVnXHe8YdqXL7DKiJQKjcilR7Wafh4OdZJ/o5bO05vBLsY3ca7ZAlAzs1g5+fa
	4O+svK6YMqGNkHjGMpzw6DnO43+gR8mKubtQ7AOvi+BMVcVNSvqY5Ykc4cLivJLuNVHuI0LLdSZ
	GJQUtU6bEXP0Cx67OMeXb95ZnWLiBa3ONAujuH8j6K8Ka+3mzzUlVw==
X-Google-Smtp-Source: AGHT+IE+dnRhcb24Cudg3ry1VEK1BSDUG9TZ+xnJ8WDGcXWOIbwC/4MVTEdfZSBKJil1NaQvpJWjBw==
X-Received: by 2002:a05:6102:2913:b0:4b5:aa91:f29f with SMTP id ada2fe7eead31-4bbe1323ce1mr1786410137.8.1739278176589;
        Tue, 11 Feb 2025 04:49:36 -0800 (PST)
Received: from mail-ua1-f49.google.com (mail-ua1-f49.google.com. [209.85.222.49])
        by smtp.gmail.com with ESMTPSA id ada2fe7eead31-4bbc93070afsm736423137.21.2025.02.11.04.49.36
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 11 Feb 2025 04:49:36 -0800 (PST)
Received: by mail-ua1-f49.google.com with SMTP id a1e0cc1a2514c-866e8a51fa9so3378150241.1;
        Tue, 11 Feb 2025 04:49:36 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCVM+QNMl/5ENrddIG7kSdbTB6y+kclBN8503pDmeL9Up6/s2E7L7cAUFFh2KA0cHMXM62v6boH4sGX1@vger.kernel.org, AJvYcCWsWo24jxErYFAzFn2jjpJY780dHDqUBS3sq8BQXQCIAKkzGchg2pxY1RoBjoObujpyDvV0SE970zthyMkuOSRe9qs=@vger.kernel.org
X-Received: by 2002:a67:ed84:0:b0:4bb:c5ad:af1a with SMTP id
 ada2fe7eead31-4bbe13bc510mr1252805137.7.1739278176057; Tue, 11 Feb 2025
 04:49:36 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250206134047.67866-1-biju.das.jz@bp.renesas.com> <20250206134047.67866-5-biju.das.jz@bp.renesas.com>
In-Reply-To: <20250206134047.67866-5-biju.das.jz@bp.renesas.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Tue, 11 Feb 2025 13:49:24 +0100
X-Gmail-Original-Message-ID: <CAMuHMdXNcqxDxGxKTE0E2WL4UWBic8HtE1d=CfY+C8kALdFmVA@mail.gmail.com>
X-Gm-Features: AWEUYZkyRomnvu1Jhy6MZ5Bzc-8m4zqyTvdf7rvy-GxO8QoSoA8lUR9G9tg04SA
Message-ID: <CAMuHMdXNcqxDxGxKTE0E2WL4UWBic8HtE1d=CfY+C8kALdFmVA@mail.gmail.com>
Subject: Re: [PATCH v3 4/8] arm64: dts: renesas: r9a09g047: Add SDHI0-SDHI2 nodes
To: Biju Das <biju.das.jz@bp.renesas.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Magnus Damm <magnus.damm@gmail.com>, 
	linux-renesas-soc@vger.kernel.org, devicetree@vger.kernel.org, 
	Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>, Biju Das <biju.das.au@gmail.com>
Content-Type: text/plain; charset="UTF-8"

On Thu, 6 Feb 2025 at 14:41, Biju Das <biju.das.jz@bp.renesas.com> wrote:
> Add SDHI0-SDHI2 nodes to RZ/G3E ("R9A09G047") SoC DTSI.
>
> Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
> ---
> v2->v3:
>  * Renamed internal regulator labels vqmmc_sdhi{0..2}->sdhi{0..2}_vqmmc.

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
Queueing in renesas-devel is postponed, pending acceptance of the DT
bindings by the MMC maintainer.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

