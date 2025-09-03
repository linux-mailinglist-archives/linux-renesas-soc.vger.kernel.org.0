Return-Path: <linux-renesas-soc+bounces-21270-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id D9089B41DC7
	for <lists+linux-renesas-soc@lfdr.de>; Wed,  3 Sep 2025 13:56:22 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 883427B0079
	for <lists+linux-renesas-soc@lfdr.de>; Wed,  3 Sep 2025 11:54:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1AEBA2FC866;
	Wed,  3 Sep 2025 11:54:39 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-vk1-f180.google.com (mail-vk1-f180.google.com [209.85.221.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 651821C7017;
	Wed,  3 Sep 2025 11:54:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756900478; cv=none; b=UalmAZ1Jw8njHRLvy3FmoHTXWP4GYcJNQiXFZLDll5CMa039eGzfdYJWFD7HnDA97tgDFZWLdhPrM8Vramb8kn7vIeXXUDNCI1j+PPG3n+gZTad1tVRvNVQBrCulI7X1AQkKV4eXRFo5hqpNrFztRmMzKzy6qNcftYNw7eK8gcM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756900478; c=relaxed/simple;
	bh=pqlpdwsRuAVGUbjsdKAnC4B6zAHK8fDlXCJ2mi0/3xo=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=lawbKwXQWXUm6tkzLG4ec8xAZaSujy4M37cXGNZ2ZAAuM+dXUQ2IKW//RsVyWKrXQ3St94jYgeilzBR25cjfJQZH22b1NXR9gUiuhPkOrw078QF11k/FRvoB7P8RXU6kquoJZQKgZnYXScfXwcb4pPJXHWcgb0MYiyH7LamU+1M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.221.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vk1-f180.google.com with SMTP id 71dfb90a1353d-544a6597c82so1801163e0c.1;
        Wed, 03 Sep 2025 04:54:37 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756900476; x=1757505276;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=wfA5OsPiC3c45JyOQP3sZXAxpUQvEElagrHi+v4qjCg=;
        b=SgJcR3wQ3/fZyLb8Di/Ppcj38E3ols/1dlcupQcjJ0b3So0xhqkFMZK6NzG0Pzou8T
         uvMP+9zJUEqQlFc+xs18eT9Y97iABLWcv+Fb7R1H092DCJzyqiRKkYhl224NSdKxpNue
         3i07uDtOt2KI6VpDyetITR/QkRs9fVdaotWQ+G11viKv3kgG2M2HNlOSHjXfzAjRVGJ7
         9hJtdThyuVg4CZSdRHcTK7THeWl8ic8mQHY8NyBAfDY1LKixuaFbr9pXYscDZGMiVw0R
         +3zinkeRIFKgXEOBlus6R5HlxwVZDZ/DvqsPUc2FAm4HD/u6eLclckoP7JrDdwbZ1jZd
         uhPA==
X-Forwarded-Encrypted: i=1; AJvYcCUfX50a9afJweccTMJZeNlFQxFRHBK7y05ZJ09SBwS3UES8Xs3lX8E/lSHJszv6kPf76DCDcGIFVmv3PgID@vger.kernel.org, AJvYcCVOKMdRnpd02A8arjKad5awI2PnFOIREP8mBHYhufj9DHM3p0WHCSeOLm3uxbyYdvnLMyFlfP7gTuA=@vger.kernel.org, AJvYcCWi8UjvNrGxb7I7JKxn7dw2Z/kjVRNeX+nEWOstPnMkmxXqhBlIw3MJf7bz3sctvnmjlqAw17zseIZPlJ7GmLDx0LI=@vger.kernel.org
X-Gm-Message-State: AOJu0YwFbT6Yxm6ULGEWpBCoLLTDOZvS9cxILSGAPa3fOdssdSslqpkF
	2nzUkRkS36HJ4owka3yTgiOdbnijVd5n8bTsu4q28661kIBY44z7iPl7SMbmxQma
X-Gm-Gg: ASbGncux+msxbHIIhlLG/UmeHd69y81wV4NiobtVCAlDnGjIuGyJx1NpTBKodQ/+GCh
	mAy0M0l+XuOKEVu/RJYDP/CJFkhBvfd+3NlvU1pPqXA18/BzI5JmwzF/zCHZ/lprf/l6iP+G6uW
	nySA39Z9ojpu8IDTmXbw2dw9FGRrEwfTRjIW3YpfOfeDqiUo6QlSxYVEPD1ZjQg47gMOxRR9L+/
	wP1R8X3A/wEm6+V5705IE4qgy4RvIoLaGqdp0QfwvrU02KNwgMB6vV1wFTjvAWxPl9ogeneEVSn
	4iKHqFT540bzOnkWBYTmlzIQj/svkDJifWSkTWc7AV7W9f4bTdQWhR0ZLbde++MhEnkOvHpnfwe
	pvS7AKhsAa9bGe93GoDXtEoYkF0msigjf5DBUfTGjTZYzTGtZYHuQbgwHt5AgU74tGIUBkQ0=
X-Google-Smtp-Source: AGHT+IHnN0jYYs6Q9Rwq3ukDYYLKj7+l/5/lY7nxT7LOZPjH12xb1XIKhZCCV43LmGVoXoxLLvBpZQ==
X-Received: by 2002:a05:6122:179e:b0:531:2413:ce62 with SMTP id 71dfb90a1353d-544a02a8e35mr4065088e0c.11.1756900476087;
        Wed, 03 Sep 2025 04:54:36 -0700 (PDT)
Received: from mail-vs1-f41.google.com (mail-vs1-f41.google.com. [209.85.217.41])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-544a1f09810sm4965938e0c.22.2025.09.03.04.54.35
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 03 Sep 2025 04:54:35 -0700 (PDT)
Received: by mail-vs1-f41.google.com with SMTP id ada2fe7eead31-52a80b778e7so1505887137.1;
        Wed, 03 Sep 2025 04:54:35 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCWz7CoK9J7YSgacJIOVzK/HIysP7qjvNJci5nlqImLUWN0AZLLy/SZYwiuewh6btDOWD/iQsmJu8js=@vger.kernel.org, AJvYcCXRd4dW+R6oeJr2lNaHE0QvbSoH5WM6GAFjnIC5zJkUIDR7kP0wtlaRcTRycewVrcBUMf846cm0kcgs2iKo1043UBE=@vger.kernel.org, AJvYcCXisql7nh6MIGUsjghfXYLjeWWXql9gcmeKtfZI8EXcSu3xTAHK07um4WCCFTY9TSAJ1QGlJA5uaB+DYEjy@vger.kernel.org
X-Received: by 2002:a05:6102:5687:b0:523:95bb:b63a with SMTP id
 ada2fe7eead31-52b1b6fbbc8mr3794515137.21.1756900475446; Wed, 03 Sep 2025
 04:54:35 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250903082757.115778-1-tommaso.merciai.xr@bp.renesas.com> <20250903082757.115778-2-tommaso.merciai.xr@bp.renesas.com>
In-Reply-To: <20250903082757.115778-2-tommaso.merciai.xr@bp.renesas.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Wed, 3 Sep 2025 13:54:24 +0200
X-Gmail-Original-Message-ID: <CAMuHMdUuN2vML5jzzU54oqAeViz3w-qJ64Pqn+X0D_mGE0W-ig@mail.gmail.com>
X-Gm-Features: Ac12FXz2-dhQInWTQI6nYL01i4OKgtBDNbhGhuaB8n-kQiWeOud5B9f2baOsFzU
Message-ID: <CAMuHMdUuN2vML5jzzU54oqAeViz3w-qJ64Pqn+X0D_mGE0W-ig@mail.gmail.com>
Subject: Re: [PATCH v2 1/5] clk: renesas: rzg2l: Simplify rzg2l_cpg_assert()
 and rzg2l_cpg_deassert()
To: Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>
Cc: tomm.merciai@gmail.com, linux-renesas-soc@vger.kernel.org, 
	biju.das.jz@bp.renesas.com, Michael Turquette <mturquette@baylibre.com>, 
	Stephen Boyd <sboyd@kernel.org>, Philipp Zabel <p.zabel@pengutronix.de>, linux-clk@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Hi Tommaso,

On Wed, 3 Sept 2025 at 10:28, Tommaso Merciai
<tommaso.merciai.xr@bp.renesas.com> wrote:
> Combine common code from rzg2l_cpg_assert() and rzg2l_cpg_deassert() into a
> new __rzg2l_cpg_assert() helper to avoid code duplication. This reduces
> maintenance effort and improves code clarity.
>
> Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
> Signed-off-by: Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>
> ---
> v1->v2:
>  - Collected GUytterhoeven tag
>  - Simplify polling condition in __rzg2l_cpg_assert()

Thanks, will queue in renesas-clk for v6.18...

> --- a/drivers/clk/renesas/rzg2l-cpg.c
> +++ b/drivers/clk/renesas/rzg2l-cpg.c
> @@ -1664,37 +1668,20 @@ static int rzg2l_cpg_assert(struct reset_controller_dev *rcdev,
>         }
>
>         return readl_poll_timeout_atomic(priv->base + reg, value,
> -                                        value & mask, 10, 200);
> +                                        assert == !!(value & mask),
> +                                        10, 200);

... with these lines folded into a single line.

> +}
> +

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

