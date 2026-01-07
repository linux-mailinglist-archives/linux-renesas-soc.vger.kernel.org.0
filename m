Return-Path: <linux-renesas-soc+bounces-26361-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 3B0E2CFED02
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 07 Jan 2026 17:17:36 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 415FD3009119
	for <lists+linux-renesas-soc@lfdr.de>; Wed,  7 Jan 2026 16:17:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B99F6338905;
	Wed,  7 Jan 2026 16:08:20 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-qv1-f48.google.com (mail-qv1-f48.google.com [209.85.219.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DD4B7346E40
	for <linux-renesas-soc@vger.kernel.org>; Wed,  7 Jan 2026 16:08:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767802098; cv=none; b=OsGscJDEz1H4A3FZqyT4MJ33zlMVE8bjQKsEek7PHfQ9vr+4buj26XL6LwLvhDt9MtcQDWWl6JpNRNM95YFhAWFDySXTpl9bLI8eQ7JnBgYX8rynkAeC6pgm/9f1LXwGnLGygrWHxbMw4Mp/GqtqxoMAx9KAturDNXEAoAKQ4t8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767802098; c=relaxed/simple;
	bh=CpBdb8uA3gICTaZOWderu+gSLW0UKeJVNwn2Z74IFJs=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=nOLu+8kd52N23e+N6yqgXpm6wonM4Px8XJvSluURQS2rlDxJy2io/kN56o3eIYjHUx1AQ8uA5adxvd92BnIXWyNbBoPAa+tbq6apIN2CkFbGvS+Q5PAlE+w3oE8mDSNZ9dZPTmnAHux4HVRpch+EK+mPgzdJb8SBfMBCKsc1BBc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.219.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-qv1-f48.google.com with SMTP id 6a1803df08f44-8908f5ed4aeso2998226d6.3
        for <linux-renesas-soc@vger.kernel.org>; Wed, 07 Jan 2026 08:08:07 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767802085; x=1768406885;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=h+WCu+NesYEsPhaWEsmjj2oKeCV3O8/e7q9g5ocoFc8=;
        b=LFGwE1mbukmjpCZoAavmREi8J2WotoLiW+llnRVg7FpFVccxZfI5dCsN5yoEqTOPd1
         ULDFeMAq0Q+kCnxuSnl6S5nKRx3cae3Phof1dBYEqrKMs/ch6HPznFa6DCghENB2PGo6
         4fGw1yvVr0xuSVCjrSlfF5+kCoP01Id7AxogaHgi2LeDrA55GhRvoJxDkgdPWsCP2q1O
         lue83UFI7D/hp1M17bshBi9tz+lcD+0bzj9t+0g8rLV89GFA2SOBP/m3OV1IorgiCCA6
         U40Ga6ExUMwT/HbEm2TEl0XGDL2RDOoMb4/LEdiGHx2LaGUX2g0mN9vlMVIGt4fFIzxj
         uI1Q==
X-Forwarded-Encrypted: i=1; AJvYcCWau3NEYSE7f3/RHzcvpmycuc/CyN4R6et8HG/nk8UpcAXT+KwsHDt56dWGIO04lTR9/w7J8aboC6VQnKjN92nD8g==@vger.kernel.org
X-Gm-Message-State: AOJu0YxhZTb5wAitGIKpcpbv/v/VYb/6HVDuFi87IGb/PfnTPWdJU7u9
	BYzv8bwrK34ZVDgZTRf+VGJPqNy6qdRJh7rvH47yVF7MRvoVu1lfhJHms6Y1pNeV
X-Gm-Gg: AY/fxX5B6bNzucGH4Gkh9KgfdaoJAqDBtwpy8m/mKv2Cxc/gt8Rnptnzsb1Wr+cTgBE
	iA6Ok3WmxPmi16PIzaH+zEim3aQ0OuF/SxGDHCTHgNfXMHLRqV9Fg9Khk0z5CyyNArKdzeI98Yf
	Dx7ia3XGY6lsdurQGNjpivGrFSFsUCMuXiBkCdNzDboyvVBma0Yhn7TGY5B59EZraj4vyGUJlrK
	VOKSANVFVQuj7kjABIAZPNLNWU/r8JYLPX+YCmULS8CH/76jpwQkGTFtmO0IDtGodrDRwuPqld4
	f8VPr9jPpq9Hhz1TmErigZLTBf22uTl5s0zw8NhVo27w/Bv9RK4FYnu93YBKQfljmXO6jKuAbq5
	PvqryaqCm84OxcY9VtPbNxpgZnVDrXWVFHqNOxoKBEAIQqvSS14rIWFPdRiE2JxdHK239JQSmPw
	rmV+vIMQln40yea3h1zv2buN5t8omH1LcwZCb9kMDtP/JieEbhx8dW
X-Google-Smtp-Source: AGHT+IEijrQpQJ6OlTQKhhiII1f9qNrZ7mGnikrKaCdeIpCpeWXy0W5tPT9pGLLrKjNtVjMnpMgVsA==
X-Received: by 2002:a05:6122:4885:b0:55b:16ba:2854 with SMTP id 71dfb90a1353d-56347d6ddb4mr854179e0c.5.1767795803774;
        Wed, 07 Jan 2026 06:23:23 -0800 (PST)
Received: from mail-vk1-f171.google.com (mail-vk1-f171.google.com. [209.85.221.171])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-5633a3f6c0bsm3049848e0c.13.2026.01.07.06.23.23
        for <linux-renesas-soc@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 07 Jan 2026 06:23:23 -0800 (PST)
Received: by mail-vk1-f171.google.com with SMTP id 71dfb90a1353d-56021f047d6so629563e0c.0
        for <linux-renesas-soc@vger.kernel.org>; Wed, 07 Jan 2026 06:23:23 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCVjPTrfUqAsAtXxu/SJelHScs+BDXbrJyj5eJ9tUOP3GWBwaFKwuCGq8lWnIQab1pqH1I6VWnrCZ0I3fT/421x0hg==@vger.kernel.org
X-Received: by 2002:a05:6122:459a:b0:55b:74ac:72cf with SMTP id
 71dfb90a1353d-56347ffe7d5mr865823e0c.17.1767795803413; Wed, 07 Jan 2026
 06:23:23 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260105140625.2590685-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
In-Reply-To: <20260105140625.2590685-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Wed, 7 Jan 2026 15:23:12 +0100
X-Gmail-Original-Message-ID: <CAMuHMdVsupnaWOWkus769mp4Psn-z=5mYin4EwbX3xn0crJU_g@mail.gmail.com>
X-Gm-Features: AQt7F2p2JFuPY0xBDR_ju4-zvH5ugvq6zrCABYNExmkCYao6s0vjsGxlKuY5Ntk
Message-ID: <CAMuHMdVsupnaWOWkus769mp4Psn-z=5mYin4EwbX3xn0crJU_g@mail.gmail.com>
Subject: Re: [PATCH] clk: renesas: cpg-mssr: Unlock before reset verification
To: Prabhakar <prabhakar.csengg@gmail.com>
Cc: Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, 
	Pavel Machek <pavel@nabladev.com>, linux-renesas-soc@vger.kernel.org, 
	linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Biju Das <biju.das.jz@bp.renesas.com>, 
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>, 
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Content-Type: text/plain; charset="UTF-8"

On Mon, 5 Jan 2026 at 15:06, Prabhakar <prabhakar.csengg@gmail.com> wrote:
> From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
>
> Move spin_unlock_irqrestore() before verifying the reset result and
> printing errors. The verification condition only uses local variables
> and does not require locking.
>
> Reported-by: Pavel Machek <pavel@nabladev.com>
> Closes: https://lore.kernel.org/all/aVujAQJSDn6WyORK@duo.ucw.cz/
> Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
i.e. will queue in renesas-clk for v6.20.

> --- a/drivers/clk/renesas/renesas-cpg-mssr.c
> +++ b/drivers/clk/renesas/renesas-cpg-mssr.c
> @@ -806,14 +806,12 @@ static int cpg_mrcr_set_reset_state(struct reset_controller_dev *rcdev,
>
>         /* Verify the operation */
>         val = readl(reg_addr);
> +       spin_unlock_irqrestore(&priv->pub.rmw_lock, flags);

I will surround this by blank lines while applying.

>         if (set == !(bitmask & val)) {
>                 dev_err(priv->dev, "Reset register %u%02u operation failed\n", reg, bit);
> -               spin_unlock_irqrestore(&priv->pub.rmw_lock, flags);
>                 return -EIO;
>         }
>
> -       spin_unlock_irqrestore(&priv->pub.rmw_lock, flags);
> -
>         return 0;
>  }

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

