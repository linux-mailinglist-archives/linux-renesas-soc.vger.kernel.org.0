Return-Path: <linux-renesas-soc+bounces-26348-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 1E8A0CFD5DC
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 07 Jan 2026 12:18:01 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id E4921300284C
	for <lists+linux-renesas-soc@lfdr.de>; Wed,  7 Jan 2026 11:17:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 51504306B25;
	Wed,  7 Jan 2026 11:17:56 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-ua1-f65.google.com (mail-ua1-f65.google.com [209.85.222.65])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 85D3927FD75
	for <linux-renesas-soc@vger.kernel.org>; Wed,  7 Jan 2026 11:17:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.65
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767784676; cv=none; b=p+zJcV+AXcfiWT+VjznOixPigULyAyhtupHXSh26Zy16vXMk+p2l4BOdRs9CZtqF2McKWRaWt5GFzYXqE0NKx17nSfVoayEqUFsBN3YpzmSdyfnbed+Sgf06Cx7yG6yMe8T2NMUyNjxhPPHeWNB9IbWcr53NbWhagpEEAZdgTE8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767784676; c=relaxed/simple;
	bh=BU2zF0S3mv+/DgWWcbZd1AF3XocUunMy7BAPkCdJ31o=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=G0JiAu9yNf5QIaiyCf38VhGD71yvZBWsS2PWzn4xqtHCknvRLsL6qM4qe+EkfTXZVhcBrGdcZSSMjKXnxF5jUQVwJWeiVSKPXcq9zDmnh1xSuiqWMiHga3gTAOMvz1CvdBV3JNyZwN8WbccGDt6ipFkCxyVIcMH/WCKfdaUfrPI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.222.65
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ua1-f65.google.com with SMTP id a1e0cc1a2514c-9412edb5defso491109241.0
        for <linux-renesas-soc@vger.kernel.org>; Wed, 07 Jan 2026 03:17:54 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767784673; x=1768389473;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=z2xoUaAszeiwsol2C34FUeUV6F5U7+1lQLKuib8MADg=;
        b=MCxaIFD3zW4XK+EwZvGAhyhgUOkPhSe7EbBGhGbj4Z1l/+7l+kCL7YFWdQND22yq4U
         vprBesloI6JB3H4yD62gJMxAiebUuOTFxagct0Kovkeutcpnnl/ZlSIjRIaf0ASnuLm1
         XqW5sVQ1hWjkfIxhp6N+cXetUGI1ovEzmeDiJ83qFSCJalZWJ+2FdewyCFwmhu6T2917
         Mis8oa6ir+UWcuzA/orF22y8LtfgtLDLhl2nA8fgw17N64+0hiAGGZpWECUuzMs5HKWx
         B+gRNPA8S0/PSWehBn1qieVQwhWXdfdfgj4Io+QeEskBJkhgJB3gq2Yos4fhSC/1Ca0x
         RBhg==
X-Forwarded-Encrypted: i=1; AJvYcCX+LKkIcW8koNqV4EFr9oOiSA3eB9rico8XeFdfWrxd1FWAjWXzHYN6w2bO2QyzYa2gWEqvWD14sIBwyDFpnO1lAg==@vger.kernel.org
X-Gm-Message-State: AOJu0YxxWQZaiKz8xJaabyAQpOfQRqVM72wAzgfEZoUzNb1bqezyIMZr
	mIMTHEp31TVH0rf2ZxUwNlOqOUz4nu/Icp522NgEqrIHNFQD65EHp9ZZuUDUrvpG6Nw=
X-Gm-Gg: AY/fxX5IQ/8VqgDZY9GqeDQS4U8JG8VVb8q2B0zYmZtrKj0WjIZCqwjr+fJsmNEqMqB
	1G841HfslD9PJfxmv/Zc192Dhe/EpxNRsKV6uTUVkO2b116EVc6H1Q3bwn3t56BBD08WtlohimP
	CBcHRlVH1JTl8BfELFW0IgybzQ0iosF1/Sn/rs2A7YjfqcWrt4dW5wNBAR5HbOcnXEuj1BHlvxc
	0ijzcIo7x6Wd/RL8TrEXJmo0W1bd8whae+wd0GMrtVHxHD1ObBtCndeW+RQL4CbqGK341mIoTOU
	LUIUkiyNHhVrjAx4zaO6rz1WCDOE5yqlNn1yrQCTmC441QM6jKA8mYJ3NKYkWAXlbOc/BRSmPZO
	wIM0BwzjJBXQTd1KN+uKgfUiiGZQOlZhctj4UMGg9p9dHE59j9j6DY8tMYh6c7Fetgw876SEZU+
	88mDeLEtN2l+FcUzzUsDrkKDtBoC6f/1B/ZNXd+J5vwaRv6Hyh4iHkMEKQnjfC94I=
X-Google-Smtp-Source: AGHT+IEbcCOZghdZMkASJTULeIaI6t63mGPj3flPZy3tqX9rX3HSJwiyQVhDq7kB/P1S6JJJmMD/zQ==
X-Received: by 2002:a05:6102:688a:b0:5df:3b19:4125 with SMTP id ada2fe7eead31-5ecb692cf34mr609172137.26.1767784673161;
        Wed, 07 Jan 2026 03:17:53 -0800 (PST)
Received: from mail-vk1-f177.google.com (mail-vk1-f177.google.com. [209.85.221.177])
        by smtp.gmail.com with ESMTPSA id ada2fe7eead31-5ec7702eb72sm2456783137.4.2026.01.07.03.17.52
        for <linux-renesas-soc@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 07 Jan 2026 03:17:52 -0800 (PST)
Received: by mail-vk1-f177.google.com with SMTP id 71dfb90a1353d-55b104727c8so660615e0c.0
        for <linux-renesas-soc@vger.kernel.org>; Wed, 07 Jan 2026 03:17:52 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCVIqQYjpqWnr0g3ksE7qbQWQT+UaUY+GcRgqKV19Ku1DZYSGe9+I2JFufsruzNWEWGmQl69xzOfi4guXD+2UUyOpQ==@vger.kernel.org
X-Received: by 2002:a05:6122:18b5:b0:563:4a88:6ecb with SMTP id
 71dfb90a1353d-5634a88727dmr391501e0c.18.1767784672114; Wed, 07 Jan 2026
 03:17:52 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20251208101356.101379-1-biju.das.jz@bp.renesas.com> <20251208101356.101379-3-biju.das.jz@bp.renesas.com>
In-Reply-To: <20251208101356.101379-3-biju.das.jz@bp.renesas.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Wed, 7 Jan 2026 12:17:41 +0100
X-Gmail-Original-Message-ID: <CAMuHMdUbAU68yuW7aok1WXMzNOVGTZtVJNZQLJyyrbvk976szg@mail.gmail.com>
X-Gm-Features: AQt7F2rbOvROcLbmdVhiAEERGEuuY21engHsV7c_FEPthrjOFbc3I4Drmat3D7o
Message-ID: <CAMuHMdUbAU68yuW7aok1WXMzNOVGTZtVJNZQLJyyrbvk976szg@mail.gmail.com>
Subject: Re: [PATCH 2/2] clk: renesas: rzv2h: Deassert reset on assert timeout
To: Biju <biju.das.au@gmail.com>
Cc: Michael Turquette <mturquette@baylibre.com>, Philipp Zabel <p.zabel@pengutronix.de>, 
	Stephen Boyd <sboyd@kernel.org>, Biju Das <biju.das.jz@bp.renesas.com>, 
	linux-renesas-soc@vger.kernel.org, linux-clk@vger.kernel.org, 
	linux-kernel@vger.kernel.org, 
	Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>
Content-Type: text/plain; charset="UTF-8"

Hi Biju,

On Mon, 8 Dec 2025 at 11:14, Biju <biju.das.au@gmail.com> wrote:
> From: Biju Das <biju.das.jz@bp.renesas.com>
>
> If the assert() fails due to timeout error, set the reset register bit
> back to deasserted state. This change is needed especially for handling
> assert error in suspend() callback that expect the device to be in
> operational state in case of failure.
>
> Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>

Thanks for your patch!

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>

> --- a/drivers/clk/renesas/rzv2h-cpg.c
> +++ b/drivers/clk/renesas/rzv2h-cpg.c
> @@ -1366,8 +1366,11 @@ static int __rzv2h_cpg_assert(struct reset_controller_dev *rcdev,
>
>         ret = readl_poll_timeout_atomic(priv->base + reg, value,
>                                         assert == !!(value & mask), 10, 200);
> -       if (ret && !assert) {
> +       if (ret) {
>                 value = mask << 16;
> +               if (assert)
> +                       value |= mask;
> +

Same here: if readl_poll_timeout_atomic() would use its own
variable:

    value ^= mask;

>                 writel(value, priv->base + GET_RST_OFFSET(priv->resets[id].reset_index));
>         }

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

