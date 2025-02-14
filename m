Return-Path: <linux-renesas-soc+bounces-13158-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 43A09A35B14
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 14 Feb 2025 11:04:40 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 027A716FCA4
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 14 Feb 2025 10:03:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 54B112505C2;
	Fri, 14 Feb 2025 10:03:11 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-vs1-f53.google.com (mail-vs1-f53.google.com [209.85.217.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8B3BF186E40;
	Fri, 14 Feb 2025 10:03:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.217.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739527391; cv=none; b=QyQDd/tAvYeZ+pikeU89YPVlcmPJQpicz3mxPGrqJI9/b/hOfG2ukHI0BQJKAD8LXhHBIk+B3Tg51rGXog+KBbr3ic9mmY5huRexC0YBQuV150qCZxJ62QinbT1TB3d/pjvS3Hp2FXR7fondZtHDKIy5fotdqGJDaZDRmHjGJO8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739527391; c=relaxed/simple;
	bh=srSZy0fGEMt6o4wncQG0hGfi+JWU6PXfZLThmo6ElvY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=RtLWJ9TmOEsOTBZc88dwyReImWJej8C4sFJHrtp54ihhloB+sDROBtzrfJP4F96T9y3lojaTJKM9ydKW39r75FN/hO5THG4N6nWnyFUvp+w++GCrQxMg41D2nRo0+A/UiEWGQL3ljxrol0O/d6Nvt4+Mkm+W++veDkKgL/rB5LY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.217.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vs1-f53.google.com with SMTP id ada2fe7eead31-4bd3763900aso54129137.2;
        Fri, 14 Feb 2025 02:03:09 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739527387; x=1740132187;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=GwRMJibn/gtsGcl7fkUZirnJvkIAEeTn8KQ8iBAEz8s=;
        b=LEcdAuNAd+dHbT2Ydiy7rqiU/5jSPbx5H5OxDVfrTfiJCj9iBzFKm1QYZxdm+sictK
         AQSGUlh6QWb6u66kKx3i0vC9VEgVSiKAeg4RXhLIv17FTurfdzmMHi5gEzPg9iEn9gHO
         Yk37M57+KoTTf2+BtbYij+qvrXhh8g1hWQ3fRAwml68FAOTNc4JpdsBynhZWiCJSjWJv
         j87YkHM2NxrXItd2Ht/ATBzURjrRr7DC5ipzswy8nMjqaQAyJwzxZBJk/emV0VI+EWel
         1pDvCdbEAPUhUpT2cDSEFVqtLHAw8h/xaTSsz3uBvWPmT1ebZfih5ASu6GWR2+NIYocd
         FfPw==
X-Forwarded-Encrypted: i=1; AJvYcCUTDLtcDNh9n6oe0Mgc5rAvR1fCOdPLi7TC535PI3BaO2OCn4bZmpMHX/FfQw7FG4YvoiDFL7x0qj8=@vger.kernel.org, AJvYcCUw+Y9FUuyI21PkzBztnkOYinidmhy9/8M9OrS8CODdFOmC6CP1HBzehwRvZGRzn+bRutb2tRWXo+ZaUvNU@vger.kernel.org, AJvYcCWaY9duM++PzMMwyv9ePODq7gPXboUqatJeXjJiLwPjCe2oJINB2KARg2gRqPpH4YFWnMkw0MmMyOtDQeBphBlNk7o=@vger.kernel.org
X-Gm-Message-State: AOJu0Yw0v0VjIyOU/zi5P2fCRLJMFQx8OudX2zU836Yh9TLpHF63Ab+g
	+eYSRPQdlsCphYtWKWNbK+dqn2UXkWgl9PeokEXw89OFgxQOp4V11O9hPTfdj40=
X-Gm-Gg: ASbGncuyJxg9VklCXHCRBS/3ANIZpQjUC/nAaTL3m3KNkwlmm50JCy8rAX8qQSGqG7D
	FK1N0LrKlO7VXDKaBLaYHYlqiM4Uiji1MTLBT9CMtaSa26RsWX7ihvGBtEkveVNijMHXUysx9Tb
	dr4QvWtxBh3Sa2Kaccah+FXs+xDRymJ8j/kRF1/c5sfJBoMM4kwdhomd3c4ymQMG6FPsQd2hB5i
	oIt5wMWEtsccjRIDrJtg/g3P/dIRk+Tn+GucqfuP6tCSF984yqEc6tMR1OzynXGK9mR1GBnhP+v
	lVZkFO2nppbIf1EhNHt62IZn/1bqhtrXSVzIC+Q4KhmpZ60+pPgoMg==
X-Google-Smtp-Source: AGHT+IHq8XR3Kph+vnEd4RKcMTxuWlJ7MVRPl/PLwlJfmK0GghznfW/ibJW8XiBapor41l2Xq8aYqA==
X-Received: by 2002:a05:6102:3f0a:b0:4af:c519:4e7f with SMTP id ada2fe7eead31-4bbf22e8233mr10005831137.18.1739527386837;
        Fri, 14 Feb 2025 02:03:06 -0800 (PST)
Received: from mail-ua1-f42.google.com (mail-ua1-f42.google.com. [209.85.222.42])
        by smtp.gmail.com with ESMTPSA id a1e0cc1a2514c-868e86d4e8asm468119241.34.2025.02.14.02.03.06
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 14 Feb 2025 02:03:06 -0800 (PST)
Received: by mail-ua1-f42.google.com with SMTP id a1e0cc1a2514c-864e4f5b253so568741241.1;
        Fri, 14 Feb 2025 02:03:06 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCU7mlo89iWa3qrQ6KaheF6w6uJiKZMPYATHmeZ4IRN0fmD8PHEMVeQtsi3F+iUbCgiyxgSyfW6HhZKTCwlt@vger.kernel.org, AJvYcCWRvbrwEmgzUSMeBoz+Ftms1FI5OdU2vZBPHBfv+UULTprXD6wJNV+bWi+8r7uhTv0M8PYiWMM0qrTGqR+a2krdOhA=@vger.kernel.org, AJvYcCXiU/567wF6YE2BeZZz382AvqOrHSIqdL6Xs15Ouib3MtMC8xn4tzpN5D8JFlRCjtoZuOGtS1BFGkY=@vger.kernel.org
X-Received: by 2002:a05:6102:c8b:b0:4ba:9689:872e with SMTP id
 ada2fe7eead31-4bbf21cdc3cmr9180315137.10.1739527386255; Fri, 14 Feb 2025
 02:03:06 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250211105603.195905-1-prabhakar.mahadev-lad.rj@bp.renesas.com> <20250211105603.195905-2-prabhakar.mahadev-lad.rj@bp.renesas.com>
In-Reply-To: <20250211105603.195905-2-prabhakar.mahadev-lad.rj@bp.renesas.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Fri, 14 Feb 2025 11:02:53 +0100
X-Gmail-Original-Message-ID: <CAMuHMdUhOzjpo=a5C9A_aA8gRYsdi-EM9OznjW8_EyH5nrdMsQ@mail.gmail.com>
X-Gm-Features: AWEUYZmmfFvEem34T251UJV6mok-YPnbeecChTnVC_3e7-TqeMladahr6o0pfBM
Message-ID: <CAMuHMdUhOzjpo=a5C9A_aA8gRYsdi-EM9OznjW8_EyH5nrdMsQ@mail.gmail.com>
Subject: Re: [PATCH] clk: renesas: rzv2h-cpg: Update error message
To: Prabhakar <prabhakar.csengg@gmail.com>
Cc: Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, 
	linux-renesas-soc@vger.kernel.org, linux-clk@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Biju Das <biju.das.jz@bp.renesas.com>, 
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>, 
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Content-Type: text/plain; charset="UTF-8"

Hi Prabhakar,

Thanks for your patch!

On Tue, 11 Feb 2025 at 11:56, Prabhakar <prabhakar.csengg@gmail.com> wrote:
> From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
>
> Update the error message in `rzv2h_mod_clock_endisable()` to provide
> clearer debugging information. Instead of printing only the register
> address, include both the `GET_CLK_ON_OFFSET(reg)` offset and the

Indeed, printing the obfuscated virtual address is useless.

> corresponding `clk` name (`%pC`). This enhances readability and aids
> in debugging clock enable failures.
>
> Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
i.e. will queue in renesas-clk for v6.15.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

