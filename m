Return-Path: <linux-renesas-soc+bounces-26347-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 5B1E1CFD602
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 07 Jan 2026 12:20:32 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 5E754300ACF4
	for <lists+linux-renesas-soc@lfdr.de>; Wed,  7 Jan 2026 11:16:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EEBF222D781;
	Wed,  7 Jan 2026 11:16:36 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-vs1-f67.google.com (mail-vs1-f67.google.com [209.85.217.67])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7D5093009DE
	for <linux-renesas-soc@vger.kernel.org>; Wed,  7 Jan 2026 11:16:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.217.67
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767784596; cv=none; b=BmybWSkJIgMD4n2BvblE8fcTbflSD52UJ6H4MXQV//MT/7LcPE3SnOK7rlPQ7x23vVq3+XBrfpsOdnrJf6oiZ4Xch/4UwshvPDfmE41pB9zLmGD0ofpJenLuxR1IDQQrOL8uPMHebU0rWbr5/EZ5rcplvbfPdW/WbTY+UqlGDRA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767784596; c=relaxed/simple;
	bh=RrM8XtdV2MHD6GHqPad8HEG4WV2zgZVMEIfORujDgSE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=gVDd93l7lBPIjXjDWa04y/sYmX9v/+ufhl+wfmftt/JjL4k3KY7050RedB5tLb3pCb8v+NaKTM8lj0AB8vgRh8kAdzvAMT+iOg7l0fTMzOgLGzOcTkctoNQcYXhfMeKmv/GrE72yeA/y75C61aWpLUhT6Mq9j58bz8EJH2rQj3E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.217.67
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vs1-f67.google.com with SMTP id ada2fe7eead31-5dbddd71c46so679926137.2
        for <linux-renesas-soc@vger.kernel.org>; Wed, 07 Jan 2026 03:16:34 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767784593; x=1768389393;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=3WdZ5/VUwE1xJh8ISh+dZC2h81cNevcLv2ku2RENiDo=;
        b=drBo6pEUFpKAg7fwjp5Demn9YfT8VKaz5Lj5YGV/k1XYw0jb/7htr+z6wSC4V7rpeD
         5zL9UIxr4iQ6Hrt7eygnfVpyToWfz5XOrozNpO/AfOtaoeO6NlPwtKKcu+wiZkZAScph
         oyQr3xM0rVbLeMRIEIbwLu6LrLOa76ZgEUvrLW6C+O5/NOk/Kmxeyl6Ydap4PjsCkK21
         MNnphQvRnATkMSxsybBAdw/gLNuQLnj8idIaQBA8P9pAits2cj8l7ImusGSzeLpAlSFC
         ARpAmjBqz1Ud1vxaj5ANK5d7+d/SiT73/5HcV+f9JAwMRpW9ZlgRcGIfCYKBC68OkZeB
         tTSg==
X-Forwarded-Encrypted: i=1; AJvYcCVN/7aBbUAFOYKsj+1NSpRFccRb0hasimD3CS7pFNyvY0skzzyeumzscWX0BFxgLbZcKi0Bl1xlZ5K8npo+epI+ww==@vger.kernel.org
X-Gm-Message-State: AOJu0YydlfRUzVtihJVhrSVDy/A//cSnVo/+uD5jlzCjesniPCDLFrDK
	d8b/iNLStcJl9GvLJnkaYEWTsjC5Y6ck6g0iTteB+d8jLmZpOzgT3am47xCRSwBbKac=
X-Gm-Gg: AY/fxX5cYUNJFRkRiQWl6HNxV2StEWCjK3QBUVgG2bS+e6hS1pZ6EFKV4Tcv2dYmSNy
	eeSWF0ZwB/mCSev2j7mVc/fEicbNfBtj/ROoz0otb1dEo3QN0a6J27sNekAdyF9eJ+EgN3mUoTr
	ujFyAx35zawAfhGheQeZ8puqczvP6tM0ZEPB9MfSLkwv11NSmNnsWXTp+p8nxAv57NhysvcnC+V
	S2q/X+SXNba/cRZiBvOTwpOjTk7Pmxg/o/SrsWGV27WEJm69iphk3bNpHqbM+kD21vRC7tu/LET
	i2PCBc7FFNmsEois7KeDdYdQk+KcfAKvR3y10t0GhQneB718t3FjxnsiabfUixMeAtxz82W2cfk
	Gz5QIrRS/eiFzuJX93l6tiI0XeE+gxfuNoFA/Cmyb85FwU/g6MS/bu4+r96ZkhOp+t12XyhPwwW
	4brcIGo2PmE9jOutMp5Jv3WI7YfszPuUPnZiA4fDO83ORCTcOWwIT2n+74rLo=
X-Google-Smtp-Source: AGHT+IF0Vxx5HTsID+J1FmVkEv+ApVrDnFTEmKbBRBpm5nlefpGc8RNVxRp/Y04OP2A52Yvw/RT9NQ==
X-Received: by 2002:a05:6102:f84:b0:5d7:bd67:eaf with SMTP id ada2fe7eead31-5ecb687e079mr669807137.18.1767784592770;
        Wed, 07 Jan 2026 03:16:32 -0800 (PST)
Received: from mail-ua1-f44.google.com (mail-ua1-f44.google.com. [209.85.222.44])
        by smtp.gmail.com with ESMTPSA id a1e0cc1a2514c-944123fca44sm2338811241.7.2026.01.07.03.16.32
        for <linux-renesas-soc@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 07 Jan 2026 03:16:32 -0800 (PST)
Received: by mail-ua1-f44.google.com with SMTP id a1e0cc1a2514c-9371f6f2813so614998241.0
        for <linux-renesas-soc@vger.kernel.org>; Wed, 07 Jan 2026 03:16:32 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCUWA7XO6y6xK46ti2hEhZ1MaIL5s69wfX+PnNlcV8vcwUGefLwwVA4irf9sZvnV9yw/9iPfhEuWmuPs1n4ZD8YHEQ==@vger.kernel.org
X-Received: by 2002:a05:6102:374d:b0:5dd:84f1:b523 with SMTP id
 ada2fe7eead31-5ecbb14f786mr562313137.44.1767784592410; Wed, 07 Jan 2026
 03:16:32 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20251208101356.101379-1-biju.das.jz@bp.renesas.com> <20251208101356.101379-2-biju.das.jz@bp.renesas.com>
In-Reply-To: <20251208101356.101379-2-biju.das.jz@bp.renesas.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Wed, 7 Jan 2026 12:16:21 +0100
X-Gmail-Original-Message-ID: <CAMuHMdWdDQLYHm825t5Z3r2cwhUHAkMdgbhuF4oKhUqvnddHgw@mail.gmail.com>
X-Gm-Features: AQt7F2ppzHtEKNTRC_2cnqisndOj7_CT6UKFhC42GAaqOr3yn1NZxbW9SH3gO20
Message-ID: <CAMuHMdWdDQLYHm825t5Z3r2cwhUHAkMdgbhuF4oKhUqvnddHgw@mail.gmail.com>
Subject: Re: [PATCH 1/2] clk: renesas: rzg2l: Deassert reset on assert timeout
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

However, I am wondering what you think about the alternative below?

> --- a/drivers/clk/renesas/rzg2l-cpg.c
> +++ b/drivers/clk/renesas/rzg2l-cpg.c
> @@ -1669,8 +1669,11 @@ static int __rzg2l_cpg_assert(struct reset_controller_dev *rcdev,
>
>         ret = readl_poll_timeout_atomic(priv->base + reg, value,
>                                         assert == !!(value & mask), 10, 200);

If this loop would use its own "u32 mon" instead of reusing "value"...

> -       if (ret && !assert) {
> +       if (ret) {

... then "value" would still have the wanted state here...

>                 value = mask << 16;
> +               if (assert)
> +                       value |= mask;
> +

... and you can just switch back to the old state using:

    value ^= mask;

>                 writel(value, priv->base + CLK_RST_R(info->resets[id].off));
>         }
>

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

