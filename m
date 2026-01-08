Return-Path: <linux-renesas-soc+bounces-26418-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 25E51D046F4
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 08 Jan 2026 17:37:06 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id E01083155000
	for <lists+linux-renesas-soc@lfdr.de>; Thu,  8 Jan 2026 15:27:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 342753816E6;
	Thu,  8 Jan 2026 12:39:22 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-vk1-f195.google.com (mail-vk1-f195.google.com [209.85.221.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DB8BD3816E8
	for <linux-renesas-soc@vger.kernel.org>; Thu,  8 Jan 2026 12:39:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767875962; cv=none; b=KEjGOm1A66bOEH1DcQdAlUZFyY97x7Kw0lk0nolEtjvFofjphJpWD3nh5O2gEq5hy5Jnb0GXy5LDWND5lX2+TTRUwwLb3giIplX5snLSOKEYpY7B8uuuSNOA8of46hjstuTu1+94L3xO8Cs65GLwrZzR5pP9OxAT+NIurP6mpGY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767875962; c=relaxed/simple;
	bh=WC3uYKd4/f6Vde2p8a+mUChwObaCtYpLEvINds9n0r8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=CDjShsaDb/tnXEr+GK6iLfBK0g6M3TEgG1DbQU0kfOc/R+tE0DSvl43E4bJkh3s9iRpZhvGkpbE8xsBv3qvaWC1DjgYBiaE6GieuQ1JnDB8WICT5ujmxrC/WltjChitPyNbDxfpU3nQNjc6yAdvAMN+y3lkwhamThJ/tQmQZDdI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.221.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vk1-f195.google.com with SMTP id 71dfb90a1353d-563610de035so75771e0c.0
        for <linux-renesas-soc@vger.kernel.org>; Thu, 08 Jan 2026 04:39:19 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767875958; x=1768480758;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=5lFdiq7Kd8jcUn0UfsFN902y3LB21vpaGTSMoUSM1Rg=;
        b=oufkm1jLQPfFFtkUxQRtHDkoCYqjqP1FEoTF0vTy7gtLt7ivOC5TNjFpwBckVyNSUR
         rDXiBunwjf4LXaikanocdN1grwGPgT3gaEHHUKVFPg6r90GjyuNECbYvrWRctgQpp+GU
         Bw/dBV0iymqL2BNDR1gac6r7h4cGFoB1iEIHu+wK+sDyMqQKXaZrm4iRNnZO/DEdcHG8
         hRSvo0oejsuccBQJGv2YSx7sNvTlFYSIjVIL2EBxwCRj/LVhL8ZGVPYUwbmEOpIk6Asj
         t4tcW+guLkQCaqNstWTTUvyIP4rofYiTaT9wruOH97tYgCicobMbSzN8uXpMsUaeEUce
         +BlQ==
X-Forwarded-Encrypted: i=1; AJvYcCUlEXeDj7/ZiDgC2fPg6IyqmprERCoGvFPwaju1pLkeja6jw6wBZq2G7WdCw59Pd0FLq2CsHJRorKqlekvYF56q2g==@vger.kernel.org
X-Gm-Message-State: AOJu0YzpgZyZM6iMzvIuwL2zpQI35XJyZVUWxpd1tKrnQJdOe3e3eMQX
	kJCwgAWdTuYZUAh2NgaHYNg9T4ckMMhNMv/iWZSPE7GeqF4cfkxeUBnp+6sx+X0E580=
X-Gm-Gg: AY/fxX56IPM++syJ7mwOfYzSxpCerTd8APZSdx+VMfAPPWm0bZgchmCNXYCjjxU8M5x
	NNbypFFvhI6CnO0SNMYyKpJNIJFvmyLiZzVAUWnyfj3VsKzTkqwVUBp7m1rk+ydAJ6co9AykmiP
	7gJOw7FeDt5NcL0q0rllWvwocm7wEHX4y9hFfGOdlnOIrOInmRjuGufnTZTCJPqbeNgRyw9ohVD
	uZV/hLZ31TZ2sVWw0c+obLG/ep+aJPlbb9ka4J8y7qiRiK1at7WeYhfuUyMDw29LzytfP/DSxOr
	n7PyY0GxsZOPmbJpvekonYV4duvg5ApA6TOWs9sKEXLDi/YUI4/5c3ukcwiy3zDH+oMnOp4+QcV
	veOGPTgevplecmKlOGIh6ErJh7Cm0WBzNR4n2RJOMmtcUjxzjm+aEmo6NSmUaaJ+Y2hvKk5yete
	QUbxvJAzMvIjV7H4fJf4LgZKvNGLXX39egScZQszkLVC3GMfGo
X-Google-Smtp-Source: AGHT+IGIuncvsvIXBrkFw7nQwkxLunR2FLJFwUn7FjZq/4SfXAwbo/hbmPjU6VKU0bvHChFbYhLrCw==
X-Received: by 2002:a05:6122:4593:b0:54a:9fe8:171e with SMTP id 71dfb90a1353d-56347d8330amr2234462e0c.7.1767875956984;
        Thu, 08 Jan 2026 04:39:16 -0800 (PST)
Received: from mail-ua1-f51.google.com (mail-ua1-f51.google.com. [209.85.222.51])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-5633a20a183sm5879037e0c.9.2026.01.08.04.39.16
        for <linux-renesas-soc@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 08 Jan 2026 04:39:16 -0800 (PST)
Received: by mail-ua1-f51.google.com with SMTP id a1e0cc1a2514c-93f5667f944so1917555241.2
        for <linux-renesas-soc@vger.kernel.org>; Thu, 08 Jan 2026 04:39:16 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCXVhLdtrQ8rr0fJhwZHN0Scy74M9VfdvoMYQT8N6B4MkoJkBisvbGvWmjEZpKj+66qUev7GZdPVsX1lhXgwuWkFtQ==@vger.kernel.org
X-Received: by 2002:a05:6102:dc6:b0:5db:3d11:c8d3 with SMTP id
 ada2fe7eead31-5ecb1e8de77mr2236719137.8.1767875956411; Thu, 08 Jan 2026
 04:39:16 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260108123433.104464-1-biju.das.jz@bp.renesas.com> <20260108123433.104464-3-biju.das.jz@bp.renesas.com>
In-Reply-To: <20260108123433.104464-3-biju.das.jz@bp.renesas.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Thu, 8 Jan 2026 13:39:05 +0100
X-Gmail-Original-Message-ID: <CAMuHMdVr3Miyq+X_7p3WXC-rBxbhF=sT7TR2ztX3TB1jLPQ1Bw@mail.gmail.com>
X-Gm-Features: AQt7F2omDcJzqHunFWBMk_zmpDyoi-qCpdliOqTIUGhTgLZHXOdiILu0JcnuVYM
Message-ID: <CAMuHMdVr3Miyq+X_7p3WXC-rBxbhF=sT7TR2ztX3TB1jLPQ1Bw@mail.gmail.com>
Subject: Re: [PATCH v2 2/2] clk: renesas: rzv2h: Deassert reset on assert timeout
To: Biju <biju.das.au@gmail.com>
Cc: Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, 
	Biju Das <biju.das.jz@bp.renesas.com>, linux-renesas-soc@vger.kernel.org, 
	linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>
Content-Type: text/plain; charset="UTF-8"

On Thu, 8 Jan 2026 at 13:34, Biju <biju.das.au@gmail.com> wrote:
> From: Biju Das <biju.das.jz@bp.renesas.com>
>
> If the assert() fails due to timeout error, set the reset register bit
> back to deasserted state. This change is needed especially for handling
> assert error in suspend() callback that expect the device to be in
> operational state in case of failure.
>
> Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
> Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
> ---
> v1->v2:
>  * Added the variable "mon" in __rzv2h_cpg_assert() and used in
>    readl_poll_timeout_atomic() instead of reusing "value".
>  * Dropped the assert check in error path and simplified value using xor.
>  * Added Rb tag from Geert.

Thanks, will queue in renesas-clk for v6.20.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

