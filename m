Return-Path: <linux-renesas-soc+bounces-10225-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id B6E449B6A2C
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 30 Oct 2024 18:06:49 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 505DC282843
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 30 Oct 2024 17:06:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F41B7218935;
	Wed, 30 Oct 2024 16:57:19 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-yw1-f181.google.com (mail-yw1-f181.google.com [209.85.128.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D3177214412;
	Wed, 30 Oct 2024 16:57:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730307439; cv=none; b=mpJHr/8nLS73nAk8xmBmtJ7xjqH0c2VyQl9VxmX9pYq0USsLlrlTcY8I9I2/b6tYFeWvufjzPSVDz5hPTbDCjspdXH0lc4/m+m6Vwr2MYw/dzk6JinzzVeQwd66TrpFFe0KLt1y2XOyBxoPC4SNeMElanw6wiXhpI3U01RPFO9s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730307439; c=relaxed/simple;
	bh=bxSIYU3CBSBTCzQ7GKtuaj8AvdhX0CI7uWOSk5ymYng=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=F8Rqm9Q9h/0bEXxxtwKEfh/x4tgvgdVvdaqEPXlmBx7+Yeub8CCXrOOqJmhb9ZNEN41C1XizW4GERPgedQoWIiu9GMUNX3ua/xxZNjug07gZPHQu0826RXwgGixwenMiOhGSb/ce+uDOhwRGIxTMGr0blhQTNx8blgyaVOOci4U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.128.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-yw1-f181.google.com with SMTP id 00721157ae682-6ea50585bf2so3720647b3.3;
        Wed, 30 Oct 2024 09:57:17 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730307436; x=1730912236;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=1XE3FgSu9XcTnXklfZocWE4Oupj9j+OgThQsMBCOqNI=;
        b=E6XnyN6v072RJLWv9wc0Oi7xGcrO/Zvqo36xamoifkzrSlZpaiuXkzfMfDkoKyHSNb
         i0U0CeuhLKj4/bEUFbH6QZQSgNmpunMqVVNNd6Dxh7WVDw1mcUQN8OrHapDaa88z0gPA
         plitVNR5cL+HQaFRStEZXEpPln+k26nLj3gdENoNvzLIlWMUCfMnZTMmBNgmrCGdnQMJ
         d/c/hfJfZ0h843ZqlWzBNJ1MOW0XFbAFi35+ZOcaglk/BHR16pQPT9nOBchPnC6ymkCB
         QVPZ0+XamDUPmeXN4UbmEp39dkoYyh09gl1FS+uv+2G9hgHpS176pgaAiXZFMH+cOkxu
         pi/A==
X-Forwarded-Encrypted: i=1; AJvYcCVWWjhURs2ZfKmd3QjyixriqNx9CUCjrHKuqmpNfUX1HACZd2ddYa4aBymGE7UQVW8lMckMMbsHDyE=@vger.kernel.org, AJvYcCWKsKquq4XZ78BRVF+Lj4R/3s1GCNhCVzv1nqFVXoD6yZwDQgcuAxm6mua1bHEUySSolOc5yC4W63ZT4KZB@vger.kernel.org, AJvYcCWsT5Nd8JR4DyevxrNW40G+NorhdxwYvfjJ0VGQwnsP7VFR7T0FjWijFvSweqREWoV7HjOX0HSQxrvK23GMDW28OPU=@vger.kernel.org
X-Gm-Message-State: AOJu0YxJXR8l2EMMyFyVhi9IiYI+lIf6GA7cCZo3qCoPisr1A5SiIvFP
	VpTyifUsbRkT3qjVKj2hAWgUeoAp/d2TASCYfA0c1K2fBWgkxewhewMLfG2G
X-Google-Smtp-Source: AGHT+IHNXb0KvYiTpVRX8c1BtYoXZiTENpcCLNWUST78az/lH2rR6dwnyb6/3YGUhQ1m/WXAXUXLXg==
X-Received: by 2002:a05:690c:3506:b0:6dd:c474:9cd8 with SMTP id 00721157ae682-6e9d8a1e730mr176243267b3.18.1730307435745;
        Wed, 30 Oct 2024 09:57:15 -0700 (PDT)
Received: from mail-yw1-f171.google.com (mail-yw1-f171.google.com. [209.85.128.171])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-6e9c6c1965asm25301817b3.72.2024.10.30.09.57.14
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 30 Oct 2024 09:57:14 -0700 (PDT)
Received: by mail-yw1-f171.google.com with SMTP id 00721157ae682-6e2e41bd08bso83437627b3.2;
        Wed, 30 Oct 2024 09:57:14 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCU4ZrMe0Koz/y0hOsTwqSDJHKiiaKN9kLDsgPHXTO6FB1dCygLqs8JflL+8N6jkv/WWaYt7G0JwtLQ=@vger.kernel.org, AJvYcCVq0Fn1cVOf88onIkA7lsGbmavIG2iGIqq3+/vrPjVa3Tx78tsyba19DjWeK5UKb8087+LdjSC2DQpLoqoK@vger.kernel.org, AJvYcCWLckINPAMKQsqVf8RhU1CiXw5jhViIKlCBKvyJ7vupZTP6PSMyZq56QzPHJ8s7fk5W1odXT4caemaMMXBBliVU1JE=@vger.kernel.org
X-Received: by 2002:a05:690c:61c9:b0:6e3:34b9:961d with SMTP id
 00721157ae682-6e9d8b8964cmr176430387b3.38.1730307434060; Wed, 30 Oct 2024
 09:57:14 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20241028212914.1057715-1-prabhakar.mahadev-lad.rj@bp.renesas.com> <20241028212914.1057715-3-prabhakar.mahadev-lad.rj@bp.renesas.com>
In-Reply-To: <20241028212914.1057715-3-prabhakar.mahadev-lad.rj@bp.renesas.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Wed, 30 Oct 2024 17:57:01 +0100
X-Gmail-Original-Message-ID: <CAMuHMdX5z5APK7JWtnqBBmtPpFYx_G1d_k9yxbv8vnvyuTsEWA@mail.gmail.com>
Message-ID: <CAMuHMdX5z5APK7JWtnqBBmtPpFYx_G1d_k9yxbv8vnvyuTsEWA@mail.gmail.com>
Subject: Re: [PATCH 2/2] clk: renesas: r9a09g057-cpg: Add support for PLLVDO,
 CRU clocks, and resets
To: Prabhakar <prabhakar.csengg@gmail.com>
Cc: Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, 
	linux-renesas-soc@vger.kernel.org, linux-clk@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Biju Das <biju.das.jz@bp.renesas.com>, 
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>, 
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

s/r9a09g057-cpg/r9a09g057/

On Mon, Oct 28, 2024 at 10:29=E2=80=AFPM Prabhakar <prabhakar.csengg@gmail.=
com> wrote:
> From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
>
> Add support for the PLLVDO clock and its related CRU clocks and reset
> entries in the r9a09g057 CPG driver. Introduce `CLK_PLLVDO` and associate=
d
> clocks like `CLK_PLLVDO_CRU0`, `CLK_PLLVDO_CRU1`, `CLK_PLLVDO_CRU2`, and
> `CLK_PLLVDO_CRU3`, along with their corresponding dividers.
>
> Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>

Gr{oetje,eeting}s,

                        Geert


--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k=
.org

In personal conversations with technical people, I call myself a hacker. Bu=
t
when I'm talking to journalists I just say "programmer" or something like t=
hat.
                                -- Linus Torvalds

