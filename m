Return-Path: <linux-renesas-soc+bounces-26417-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 1480FD03F28
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 08 Jan 2026 16:42:13 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 96C9C347F61D
	for <lists+linux-renesas-soc@lfdr.de>; Thu,  8 Jan 2026 15:21:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 05EF9352C51;
	Thu,  8 Jan 2026 12:38:58 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-vk1-f194.google.com (mail-vk1-f194.google.com [209.85.221.194])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 12D8A350286
	for <linux-renesas-soc@vger.kernel.org>; Thu,  8 Jan 2026 12:38:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.194
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767875937; cv=none; b=TU3vRqh0Bp5M+Kzf4TCE9Lxwj3XDpkf+dOzQpQUGypRbEluTIu4pEF9dayDM3MOIIHdx9NGdk9X5mLdoGHV9IrMLFHaCKi0tx8PbpfECuO2jQPBoBo89eYMd6035CBMF/qsjmFFrZAqGiRbz5eOjSOcBNObnRMweyXNbEhygMKU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767875937; c=relaxed/simple;
	bh=55ZFRUPeDA/RxlGqo7HHBvj6ZABYAeyXZVfIb0RNEoQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=sMc50XoHnYbjjWU4LWbaVkjW5RdK16aQnjt4HPA22AUwQlFLtIox97C/4CH6vlPOfX01Vi51H+vyWSHeBxhPjrjt5F8NZyhr/ABG4C6EBy+3k7ATuf1mDukZ/cCH0ymfyqvmcfj59mrL32JHjHAEo8v/1/uC7/oXfBrUKvNjUIo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.221.194
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vk1-f194.google.com with SMTP id 71dfb90a1353d-5597330a34fso2232552e0c.2
        for <linux-renesas-soc@vger.kernel.org>; Thu, 08 Jan 2026 04:38:55 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767875935; x=1768480735;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ELrfmmP1+i+bzWrmPxdKmIn2tj5LiL1x6bd19VsxQ+o=;
        b=FamRd7ozYNq0QMEeNR1EAfuTWeHbBH62C4Pwt2VG51ir/0aONVftJ2vDOo6fEbdaVB
         UN+7e2+nwbCJ6All5A9Tl3KxNttZdtOOzOAF/LBP7N5UYLIkyMv0O6t3cJVxNPeQUx8c
         k7+uxAyQRlGYpqnkkvOMSkedwKRjzw3AS1/HTz9y9UffmUQWAZPI3flUo5s3KU9NCX5i
         5lI8sqJBIqb071v7wo295QnlXGGgLvgcU17zIF3MbEsyLO0a1XD15tuj/EfcJ1qMj62q
         n9v30ig2FJnPaBILvEkPmGOW2rvQgvqcpjgYOcMIbdOVsKknFnOfL1pTXSg5lXXvdnKO
         pT6A==
X-Forwarded-Encrypted: i=1; AJvYcCVo3G9EeFy6MQg0KaRH5Qro2K1dZp7B4Iim1KQ5ZuSGwLNq7eEZqMUSvAimvsU/STEjnB+olV8MZ9AkU45cxHGcZA==@vger.kernel.org
X-Gm-Message-State: AOJu0Yx5fVo4gC8+DCsXVQrKdCy5B2d2uWIZvtjmO0oDAnPK5kkWfbGG
	tMgEEZc1iSeYFQ3V8XjzQltsFR2fA0+910Bid0RRHzZsLKCjOujYGZVBJiDE3QAhTAg=
X-Gm-Gg: AY/fxX4r8j0otKKByom6mOt6gAdJcDF5ugmKXKDsjNoGXTS7XW8o8BmBTLazhL8iDQn
	BUBXMIGAYVB9rsNc7fMnUviCNrld1xEn+eV9YGG5HEZxjtwxSeZ+K6Pm2Qxrp/5dbCgOsL6qb+l
	SbCz0FqlPbRaZmeN6xtImXK0ZYi9tvjQIcNbNHNgLobWUd3BGoRolO4kii5f4bjTvaur6/o8yQI
	vehpdbDpJqUSsaxQV5EZKMPgR4OtNLv9spGkxfKt0/PnOXPz59cpPq3hAtTvlkKxIaBXDg8Nwbt
	BX6PoGTmS3UHPUvVmdDD7U3e0yze8CYOrSrstybJODPQkQBtN5ftBSvQbWr4ZMV+9klel6r69TS
	xi4ZbHh8gByfoODmXX118l0LILNFeYfDBlVNK8fEPJmMMc+c7efWxi2hOj/Oi6w9kCGX3+Et+Xv
	6fuCam98H+EfFXt4E8OAImuj8UJj8BlAOsXxoVlos/aDFPGx+fJjLo
X-Google-Smtp-Source: AGHT+IHkYxggroX78z8w4ahmn0H6EbnvxneSTLj+WBM47NjeFbFZcYMJNizqHnPbwEPcDHmkaAdL4g==
X-Received: by 2002:a05:6102:e0b:b0:5ea:64bb:7787 with SMTP id ada2fe7eead31-5ecb6962700mr2364154137.32.1767875934960;
        Thu, 08 Jan 2026 04:38:54 -0800 (PST)
Received: from mail-vk1-f173.google.com (mail-vk1-f173.google.com. [209.85.221.173])
        by smtp.gmail.com with ESMTPSA id ada2fe7eead31-5ec772afecasm6002812137.11.2026.01.08.04.38.54
        for <linux-renesas-soc@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 08 Jan 2026 04:38:54 -0800 (PST)
Received: by mail-vk1-f173.google.com with SMTP id 71dfb90a1353d-559f4801609so1191529e0c.0
        for <linux-renesas-soc@vger.kernel.org>; Thu, 08 Jan 2026 04:38:54 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCU91nva2d8vD7ry3sPNjI2Quv6NKFMfIrpi5yMtDpStDhfnS6TvDicuyBcsBDB9bfrJ/30xM2fbA5KPIRIcjLpDJA==@vger.kernel.org
X-Received: by 2002:a05:6122:f86:b0:557:b52a:d553 with SMTP id
 71dfb90a1353d-56347d7d51cmr2141718e0c.7.1767875934600; Thu, 08 Jan 2026
 04:38:54 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260108123433.104464-1-biju.das.jz@bp.renesas.com> <20260108123433.104464-2-biju.das.jz@bp.renesas.com>
In-Reply-To: <20260108123433.104464-2-biju.das.jz@bp.renesas.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Thu, 8 Jan 2026 13:38:43 +0100
X-Gmail-Original-Message-ID: <CAMuHMdVWsADGoGxeYEUrau+gHia7rbf3YB9sUGvSjX3B889z8Q@mail.gmail.com>
X-Gm-Features: AQt7F2ovlCowXVH2gu1zZ8GCYydnOydvjpickO5FxcppjUlNiy-E5fpX4dadr6M
Message-ID: <CAMuHMdVWsADGoGxeYEUrau+gHia7rbf3YB9sUGvSjX3B889z8Q@mail.gmail.com>
Subject: Re: [PATCH v2 1/2] clk: renesas: rzg2l: Deassert reset on assert timeout
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
>  * Added the variable "mon" in __rzg2l_cpg_assert() and used in
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

