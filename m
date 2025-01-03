Return-Path: <linux-renesas-soc+bounces-11824-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 52399A00C8A
	for <lists+linux-renesas-soc@lfdr.de>; Fri,  3 Jan 2025 18:08:01 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 2F88C163DA3
	for <lists+linux-renesas-soc@lfdr.de>; Fri,  3 Jan 2025 17:07:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8C2241FA8D0;
	Fri,  3 Jan 2025 17:07:58 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-qk1-f170.google.com (mail-qk1-f170.google.com [209.85.222.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 50D3F46B5;
	Fri,  3 Jan 2025 17:07:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1735924078; cv=none; b=u2Bct4nwvG6Sm3MqCqoKRHE5EH1Sx5IwS5PGjow3IuLH6T6lnnnBWZfbT9zcHy3IIhQRx9XDYJ7kv4uOmTxuJ+ntSUy/+uodXZO7UTPWAcfvWYR6YS+lspYhh9FS0qfoffGKe+3ihM+neH8OnBF/CK+pICFWLmqzjgCZO3eILwg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1735924078; c=relaxed/simple;
	bh=c6hYZlYOXZM6OGe9zGZBGJG6YE0KeGqxPiG6qDNLGk0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=AFgkctNNxLqN+lmEVFNBXqQBWeuidx20hjZyWeK1h1yt1sY/PTA/8UeEYb7keNHoAax5v1geHQ4FyxgPyAHRF/wG22kMCOrQIHG4OkS8rw+5xNuoDEB7NN97F1BDMJ5HKGeZ4p2xyf0vDE+Ni3ni1jltJoeB6PB1nYWlxpLjSZo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.222.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-qk1-f170.google.com with SMTP id af79cd13be357-7b6edb82f85so1626141585a.3;
        Fri, 03 Jan 2025 09:07:56 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1735924075; x=1736528875;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Qn8d5cENAH6c2566eOaC6IydtEyqWjDH2zytH7k9tyY=;
        b=kisahJ8THrRp+m5HsFLsx1yksp4sEorLqJTdUvsOLibz5nUZVslvzLJDc6OEp8PT38
         EzbpCxxHpI4Wk24PE9F+W8d5lmYtdb2zp59PAHJl+bQx5l1JkJA4xeWdWtGc7RRo/F3u
         6sPLku1UM7cddCdtKIHfxLywqyFAvYO6HhVvTmyY+XpDNVuzcoE9QB1BobfOLYnRgsuL
         X+GQ7ByomXx67BC2jgdW/Gn/1oSkNR8Y+ojT5xAaHXRjfRaLCRCShFk+p3Rai0rhyKOr
         4rB3a/4MQ9rxGjYQkvQSJf0FWh0xLuTm68AA4U0wN9sKNzhY2ZdHcz130rQJW2OoJtbZ
         pxNw==
X-Forwarded-Encrypted: i=1; AJvYcCV9yswNkGhsvuXYKS9volozD5oXhmg+0WrCUmbjGDYmH14lZg+W/iI59WpaemXQxWarAoupS+N2XZwQNAZ8@vger.kernel.org, AJvYcCVur01MCk8lpef5pqysU0G7dh7oI5wzEylNWgy8K4TUTQj81RXSZzl4zLfX1PipLTtt9O6Q1b72jJ4=@vger.kernel.org, AJvYcCXOYg2BU6IbA2Vusku0PSr/Oq1/EUVC4U9L3BK1L7c/DeQl2vDB48ozgpfA11WjK7MP1KoALhLeTWGV5savOiiNHnE=@vger.kernel.org
X-Gm-Message-State: AOJu0Yyfbmnl12rHggYEn/XDjIHeEv8gFzPTiC0Jwko69UGzYTX4LMAL
	BoXt/ybWq9F98U5AYuE7NVZ4eNkxFkK0IE/oAXRWkAwUh9RBjPz+5WpBqQKNOlQ=
X-Gm-Gg: ASbGncuXKBxeSpTo3lQTCz/P5q/gj2tPh8uv5s1nTIPXpByEwQseY4jwAxVW/lI3RBW
	jEq8nnPtgz6qw8o2M2tpoyCByD+UxOpJQ3/ohYvPG9chl16sOAclhTkqg14WM4dgQALZqpeZYck
	AcVBoOXMsoSLnL0RrKE6IzgBXwj+jGcjEd4DzJmYffl/9e9QWFaeUnqkAZ2IvjIk0OLkrfTDHCK
	aOyoQ4FlUVNwVv/CePxvdWYWF42r7TYIPt9Hi3jveBOOeAKbnfgsDyTa3B22rSnGrze9E/CpUPo
	Y7WktGiJdnUlQ3Q0T2AWEiQ=
X-Google-Smtp-Source: AGHT+IG2heKLnnBH4y/30k8A9om6emWuKTuuXC29/9K3mApZaqVEeXhRAGsgWjF+9O8OkM9GTT6gGw==
X-Received: by 2002:a05:620a:4897:b0:7b6:f995:6e08 with SMTP id af79cd13be357-7b9ba7aa40dmr8908497085a.31.1735924074989;
        Fri, 03 Jan 2025 09:07:54 -0800 (PST)
Received: from mail-qk1-f177.google.com (mail-qk1-f177.google.com. [209.85.222.177])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-7b9ac30f4d1sm1282869985a.65.2025.01.03.09.07.54
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 03 Jan 2025 09:07:54 -0800 (PST)
Received: by mail-qk1-f177.google.com with SMTP id af79cd13be357-7b6f75f61f9so1666374985a.0;
        Fri, 03 Jan 2025 09:07:54 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCUKuHVFNbxZIenLKwlDFsgXfeFfjLiCOsP4pf0eivbXz9hvVtYC23adiMI8LUcbDK3D2Fk8hQFCenjr1FsIyPnUMzg=@vger.kernel.org, AJvYcCVds4C2GGeEs3eQpnvaLkZUHJqFEb2Y5BH7tOqBr4g7f2JVZ66y07IHiY4jEeBP705AguXoSad0aNTkBT9I@vger.kernel.org, AJvYcCWP2duYmhTOAykt4pWQV4U3dEJn2xLwSVwnDdMK82HKopQbfsk26a8/zlCgof1RqNBy40fev9TTTeI=@vger.kernel.org
X-Received: by 2002:a05:620a:450b:b0:7b6:d9df:d53 with SMTP id
 af79cd13be357-7b9ba7bbccbmr8258794385a.37.1735924074577; Fri, 03 Jan 2025
 09:07:54 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250102181839.352599-1-prabhakar.mahadev-lad.rj@bp.renesas.com> <20250102181839.352599-4-prabhakar.mahadev-lad.rj@bp.renesas.com>
In-Reply-To: <20250102181839.352599-4-prabhakar.mahadev-lad.rj@bp.renesas.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Fri, 3 Jan 2025 18:07:42 +0100
X-Gmail-Original-Message-ID: <CAMuHMdW7z5ui5KTnisRS6NNqUazxH-JCmzOWRCozCkVO5xxC_g@mail.gmail.com>
X-Gm-Features: AbW1kvZI_H8i6-Ufip72Nr_o5Ta6K4syIgtJeE4JMnNfFmvbXT-Vb22sp2hJJ5c
Message-ID: <CAMuHMdW7z5ui5KTnisRS6NNqUazxH-JCmzOWRCozCkVO5xxC_g@mail.gmail.com>
Subject: Re: [PATCH v3 3/6] clk: renesas: rzv2h: Simplify BUS_MSTOP macros and
 field extraction
To: Prabhakar <prabhakar.csengg@gmail.com>
Cc: Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, 
	linux-renesas-soc@vger.kernel.org, linux-clk@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Biju Das <biju.das.jz@bp.renesas.com>, 
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>, 
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Jan 2, 2025 at 7:18=E2=80=AFPM Prabhakar <prabhakar.csengg@gmail.co=
m> wrote:
> From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
>
> Replace manual bit manipulation in `BUS_MSTOP` with `FIELD_PREP_CONST` an=
d
> `FIELD_GET` macros for better clarity and maintainability. Introduce
> explicit masks (`BUS_MSTOP_IDX_MASK`, `BUS_MSTOP_BITS_MASK`) to improve
> readability.
>
> Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
> ---
> v2->v3
> - Dropped unnecessary parentheses
> - Included RB tag from Geert

Thanks, will queue in renesas-clk for v6.14, with

--- a/drivers/clk/renesas/rzv2h-cpg.h
+++ b/drivers/clk/renesas/rzv2h-cpg.h
@@ -8,6 +8,8 @@
 #ifndef __RENESAS_RZV2H_CPG_H__
 #define __RENESAS_RZV2H_CPG_H__

+#include <linux/bitfield.h>
+
 /**
  * struct ddiv - Structure for dynamic switching divider
  *

Gr{oetje,eeting}s,

                        Geert

--=20
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k=
.org

In personal conversations with technical people, I call myself a hacker. Bu=
t
when I'm talking to journalists I just say "programmer" or something like t=
hat.
                                -- Linus Torvalds

