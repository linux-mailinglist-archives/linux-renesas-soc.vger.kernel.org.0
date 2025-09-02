Return-Path: <linux-renesas-soc+bounces-21180-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id C9A17B40035
	for <lists+linux-renesas-soc@lfdr.de>; Tue,  2 Sep 2025 14:23:10 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 969E14E67D6
	for <lists+linux-renesas-soc@lfdr.de>; Tue,  2 Sep 2025 12:17:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id ABE892F8BF9;
	Tue,  2 Sep 2025 12:13:05 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-vk1-f173.google.com (mail-vk1-f173.google.com [209.85.221.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 284692882D6;
	Tue,  2 Sep 2025 12:13:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756815185; cv=none; b=maJNZ9sQrdY3DPLf02FxF8YP2Awq6G/exELwMYaKPSoj8/vILTA2Zgl76MuaiP1ccKnUEmDyd81mlRckBoTFFcMJxlvSnt4Y1XcsjuA9EVW4XGXXKs961GSQfdWLOHozU6YI+n4ZZmupKIME44LFnznDUNbHQmi4vttS0r3qfC0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756815185; c=relaxed/simple;
	bh=TOhSKm/cs0IcjUSAOvCakjp4LAKiuqz0Bl8m/ahHY5s=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Ypw0C9mh7m/145z8z75ankGHayzQFTdmMY+MsidE6x7WFSW/5nHAna4EdDOuM5pXKT9BOiJbh/xUUeM5sRIj9BnHbiSLf28cQvEHuwmxo18qOLIG7CW1rniM7SL8io6MVpYP73lFN6OoJOZx3R/sW1fsu/y7S1HD/ZSuxWAwAbI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.221.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vk1-f173.google.com with SMTP id 71dfb90a1353d-5449fc0a7f1so2437147e0c.0;
        Tue, 02 Sep 2025 05:13:02 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756815182; x=1757419982;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=/UimdT1ibBTesy/AP3pxhJqwDMsUxNlw8Zh+OBcciDk=;
        b=gTZyQbA0Wm8s0WysviV9VnK7ydHUCenev1Q57pl2yu8kK/jrg1PTCMlZM3SB2FOqh8
         2mzwxcKS53lJGktBtgGaPxaYfRTHBr1BNVbBIANUctouc5xEnxHnTwHkzj3xF2nmbJj7
         M0KnJnpi25HztTq5Qvqd46ObbE7OMlNsKOkEvznetDfdA+T3UJQ8b8c/+9Phca3RNs3X
         Ky5HqqLOUCrV9qVYGRdE6qckITqZuXNDcXMmHXPZqUfGe29Kf2Jqes64kqYo6mshMpBh
         R1KkWEqgcatJifFAIYhcfPKY+DdEbbWXhY1DAI3RCC182Nw0fFoMujzUCGRtsfst/ICm
         k/+Q==
X-Forwarded-Encrypted: i=1; AJvYcCWNCZ9TsIU6mpY7lefGUv2K14GOToawHObQPJUa6r8dLNwhP6jaL6a4mo5xahYh+b7nI658e7XtCvggd6l18d0ufIw=@vger.kernel.org, AJvYcCWs3LU6kwWfSFZJVyMNByvS3mUW4v7yDR3h8gkd0ZrDoDQ4guqXF3TIWZJKJWW20oZSAYWUq7HycLs=@vger.kernel.org, AJvYcCXVxXANdaUIkoy5GctyTnh0sbwd2OVXNozZ2xkmXjmMkZck+3lAW12A2rr6pWb8Eq5ayPX8bo/fip54q9YF@vger.kernel.org
X-Gm-Message-State: AOJu0YxJF66eSruc/2WZvvcgikLBXMeDsjSR3WlkEsw9KiPjBl+YOCub
	nZJZhmX0Sq6CQ8Paru7TprNMUwWmKGKWhXNRm6lPvzzo4JEQRga9tfXku1CvrO0x
X-Gm-Gg: ASbGnctCkH3Zx8vhEZZkzourPOFanWJ/KscQSgE3oIwv365R1w3EhvV3bdlvn5JvW4j
	hihZVCAx7y03GS9Xq8y3KoyMN8oAGcK2ghC7dOu/2yHvxJRsaSHlYBOoHNC3uyO47wgId8ln8ki
	lWTxa06Ithfx3NgcrDzqR/IyEiAnyK+Q3a0a+G5eeqiTcgUKXLTJyX7NePGbGDBn8LEeOFZzx4D
	pe9YQtoYU0JQja9tlTTnxkAINbSLwjshcV5jRK++a267woaCqIGzJN09ZFteygOw5sDfXjZcBcQ
	U7Vo2v2BPx2GDdVzGpWp5ObOAgcHBGcjBu3vj5lBOsmJShpNLXV8ptprPvW5eElNSoJZzXrSXC8
	9X3r+Z+urYLSVrPecrc340XeOdzo0+nq8rjdx3dA3GuQdx6B6HztOZpy7oXDK
X-Google-Smtp-Source: AGHT+IH4PMXC7FIWpoDwykyTNStkR9UQRZ9/h1c+juN1zRpzkwKoZkyp6vFzTxbBG4jOyt78oCZNmA==
X-Received: by 2002:a05:6122:3d06:b0:542:59a2:72fb with SMTP id 71dfb90a1353d-544a02b1510mr3472136e0c.9.1756815181696;
        Tue, 02 Sep 2025 05:13:01 -0700 (PDT)
Received: from mail-vs1-f50.google.com (mail-vs1-f50.google.com. [209.85.217.50])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-544912c6d3bsm5516535e0c.6.2025.09.02.05.13.01
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 02 Sep 2025 05:13:01 -0700 (PDT)
Received: by mail-vs1-f50.google.com with SMTP id ada2fe7eead31-5299769c79cso2471265137.3;
        Tue, 02 Sep 2025 05:13:01 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCUZLU8P3bqvTCfR6eN1yUQmyXbzzMu4H+SrjKcz/XnO6ehtN4+C6LZjO3SMyrT2Bf1a5ENiEcCyiU16kmZf9PyhruA=@vger.kernel.org, AJvYcCVdSWYlDfWLI8p6e/EzN1tQS4vaLGjjT5nANWLrd1sFcEUG9eEzIE1geIP7pgKys7hMCd5czRNNrf8rOoJS@vger.kernel.org, AJvYcCWMU0P8uZc0elQx7QLQuLZ9RA80WC/IO6f7znhpBpkLVHIW46RCJki4lGohyzzNVlVq1XMBJLtK2SY=@vger.kernel.org
X-Received: by 2002:a05:6102:5f04:b0:520:3f1a:c533 with SMTP id
 ada2fe7eead31-52b1b91e423mr3012578137.21.1756815181104; Tue, 02 Sep 2025
 05:13:01 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250820100428.233913-1-tommaso.merciai.xr@bp.renesas.com> <20250820100428.233913-2-tommaso.merciai.xr@bp.renesas.com>
In-Reply-To: <20250820100428.233913-2-tommaso.merciai.xr@bp.renesas.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Tue, 2 Sep 2025 14:12:50 +0200
X-Gmail-Original-Message-ID: <CAMuHMdX3xesNr7VXjH75jfaQ=aXrzNhAhpPkdN6LiC3wY8sX3Q@mail.gmail.com>
X-Gm-Features: Ac12FXx7puQzjJrrLGE0Y4HY7C5fGC5GMSPwBCK32PiGQ-K3n4k4nXO_Grb_Z38
Message-ID: <CAMuHMdX3xesNr7VXjH75jfaQ=aXrzNhAhpPkdN6LiC3wY8sX3Q@mail.gmail.com>
Subject: Re: [PATCH 1/4] clk: renesas: rzg2l: Simplify rzg2l_cpg_assert() and rzg2l_cpg_deassert()
To: Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>
Cc: tomm.merciai@gmail.com, linux-renesas-soc@vger.kernel.org, 
	biju.das.jz@bp.renesas.com, Michael Turquette <mturquette@baylibre.com>, 
	Stephen Boyd <sboyd@kernel.org>, Philipp Zabel <p.zabel@pengutronix.de>, linux-clk@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Hi Tommaso,

On Wed, 20 Aug 2025 at 12:05, Tommaso Merciai
<tommaso.merciai.xr@bp.renesas.com> wrote:
> Combine common code from rzg2l_cpg_assert() and rzg2l_cpg_deassert() into a
> new __rzg2l_cpg_assert() helper to avoid code duplication. This reduces
> maintenance effort and improves code clarity.
>
> Signed-off-by: Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>

Thanks for your patch!

> --- a/drivers/clk/renesas/rzg2l-cpg.c
> +++ b/drivers/clk/renesas/rzg2l-cpg.c

> @@ -1664,37 +1668,20 @@ static int rzg2l_cpg_assert(struct reset_controller_dev *rcdev,
>         }
>
>         return readl_poll_timeout_atomic(priv->base + reg, value,
> -                                        value & mask, 10, 200);
> +                                        assert ? (value & mask) : !(value & mask),

This can be simplified to "assert == !!(value & mask)".
Do you like that?

> +                                        10, 200);
> +}

The rest LGTM, so
Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

