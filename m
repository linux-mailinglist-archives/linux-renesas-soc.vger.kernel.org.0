Return-Path: <linux-renesas-soc+bounces-21273-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 84954B41E13
	for <lists+linux-renesas-soc@lfdr.de>; Wed,  3 Sep 2025 14:00:40 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id EA04C1BA40F0
	for <lists+linux-renesas-soc@lfdr.de>; Wed,  3 Sep 2025 12:00:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 903F32FFDC6;
	Wed,  3 Sep 2025 11:58:41 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-vs1-f47.google.com (mail-vs1-f47.google.com [209.85.217.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CE9CA2FF643;
	Wed,  3 Sep 2025 11:58:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.217.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756900721; cv=none; b=hpitx7V9k62zxrLQjFBkYfiWmf9XwJseZNj6XFtR8NTu/vFiBhglf70swja7Tz27rLgMN3Vt+nmMv+A0drZ4MCpYPaHJBCjNj3isLnpfdwvefKsuqSf0uVeIUuU4WyFQTon9k3A7putuTsZ5uqmTcZpXP//c8r65YU5dy03onjo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756900721; c=relaxed/simple;
	bh=yaJqh2VDrWQ1DxACW5SPoSFNNNkLbBmtgSRyoK7CgtU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=OFbvuhXPpusFNuwwrVR2pk414OTIx/gSSJbTJH3N/7JrW75X8McKl+zi9WAK4rfvQUTI6FF4zumJuVhOOb8P5nYXAgafVfoLnZ5EQti5gYKV0K5jUXFB566vTeWWjPr4ODFA+zI77/TfErRwFjQy01XcmzXhcmcKTLtX62d9KRg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.217.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vs1-f47.google.com with SMTP id ada2fe7eead31-52e231e3d48so1135334137.1;
        Wed, 03 Sep 2025 04:58:39 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756900718; x=1757505518;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=c6WuE2oNiBPwI08RjkW+PWfEBaP/Xa6V6hhs3bRi3RQ=;
        b=LtYiDUHfSWIVj9o2nBy0nihTCQlU1l2xIOqyvmXAcyvhs268CsUpsiMk8Vsi3DvsvH
         WX8a407ubVtQBdXKAsk/4EhCmVdrODYQ+cDA33RbLPm/8uHhbmrE0SLeXnHDHTlepPra
         QwnV6rJNpOfqHgf7rfQZSOUVCvjC8xki0xGUth+evG2p1IEWHOWdlz6ur7hiYJe6bCaw
         1k66+5JWTZeSr1Q4tMM+7BW05MHUDbX+vbnVt5wFYGVXzVYuMJw8j/WYlmFoF4qPL4NE
         s+hpOgDehdYnehichwofJnm8b3fI2ODMrBhySjY0HSpZjcknFN7zvxwPm0qImLgVmwuu
         hUhQ==
X-Forwarded-Encrypted: i=1; AJvYcCUi/TOtlxoMf+SC68/0DTdZmLJKDuEPOClvxQPiO2Q0Ni0l/X4OXPGTWTYe7sT5PTjTibnzfLW2j8OcLEN9@vger.kernel.org, AJvYcCV2X9gZPK8xNFAYwztxllbS7l+CdODN/MtEG1AXypRBMoPD4mqBP9TSVhbyWmikuo32jWgsrtcXZVPweUoikwfTXtw=@vger.kernel.org, AJvYcCXQaa4PG364EKtSjdJenAkexjMTsue1wLaD3GRXB8WhN1mmBS273L472qMXrbDdzJYUsvDDdJMGh14=@vger.kernel.org
X-Gm-Message-State: AOJu0YwulHsF/mZZjRk+ZQC3ELb/uH+B/bFrPtr9d43ztxZcJu+hWCBV
	BYoHITSswMwbeosEC8RMhxi+QfqE3KO4kk4KmxaA4/s5pZAEP6opP9p4zfmTIAJ3
X-Gm-Gg: ASbGnctScF06D4itjGTfjAiScdsges/pFYeS6+Y8HjrtvxnetpT6p0/uJouD/3hDfXA
	TNma/cwGJReZGUWrBEWCPMkI8wJ6JQoZCG5XLvVN6ZNPYgruxxjvq45T3nkMBZGRjHwgxaBOQiA
	lflCL08p2ta5rlH+NRdObZELNX2vZVb+2obvXWgQtMcCQIxEjwo4PQh6Y7yY/HltSsAJanpAny+
	8x0ISwBD8DENiGjTzpUaY7TdanmQ75dsTVJcXVEU+Z7CLUoza+i+5KeYTYoxcFcwIn54YWQPXwg
	wPSqWXWov2TjbOS675b1dpU4rClKmdqwWK5D5xk4bsPujUHj9dHohudHkWcgqzNtF9KCFH0UoL4
	JV2ov1bTfsNQTYasMQVFpxX/i1NmBZ68bmofovorw9V2kDVGCJgh7jr+j+20V
X-Google-Smtp-Source: AGHT+IHTl4Z+U0PfiyN7OkEeVFTA4s86J7o6OhMkJq37XtcmkSaz9nw5n8IJZNtgEMhjSeY/Q9b18g==
X-Received: by 2002:a05:6102:2ac9:b0:529:4887:9f05 with SMTP id ada2fe7eead31-52b1be2a14cmr5041306137.27.1756900718607;
        Wed, 03 Sep 2025 04:58:38 -0700 (PDT)
Received: from mail-vs1-f52.google.com (mail-vs1-f52.google.com. [209.85.217.52])
        by smtp.gmail.com with ESMTPSA id a1e0cc1a2514c-8943b7c369asm5615632241.2.2025.09.03.04.58.38
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 03 Sep 2025 04:58:38 -0700 (PDT)
Received: by mail-vs1-f52.google.com with SMTP id ada2fe7eead31-52eb6872bd2so1308018137.3;
        Wed, 03 Sep 2025 04:58:38 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCVVAjWVb3VSzrO/fT7nOB/+XYHINCWsMsbE/8q/TQe+mJDYJRElHPH26yjltJ+rvdD8AvnJDQkot2TDO9I1@vger.kernel.org, AJvYcCVdZkCj0mohW3hDfWTVtZF8GW9nfnhsuebMc4LVmji3FsmcM28025zPFOpFSzfYMzA/4oXuLSY//eI=@vger.kernel.org, AJvYcCWCdRc/5QJq4q05FBpxpaR4xa87uF/NRxku1BbrDDKsLie6PDAE7R/5M6zYNBq8fP6fezi7DmYXOimzRc9Tr/A/ddo=@vger.kernel.org
X-Received: by 2002:a05:6102:6a8f:b0:52a:daa1:87e2 with SMTP id
 ada2fe7eead31-52b19b5df5amr5404870137.11.1756900718060; Wed, 03 Sep 2025
 04:58:38 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250903082757.115778-1-tommaso.merciai.xr@bp.renesas.com> <20250903082757.115778-5-tommaso.merciai.xr@bp.renesas.com>
In-Reply-To: <20250903082757.115778-5-tommaso.merciai.xr@bp.renesas.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Wed, 3 Sep 2025 13:58:26 +0200
X-Gmail-Original-Message-ID: <CAMuHMdWc+gJo35btt3D7mibq+JCnZh4OagFPtSgUELjAG1J9UA@mail.gmail.com>
X-Gm-Features: Ac12FXzpl2KDgVFIaSoTGPqoQ-We8jzec3aA0Bomu7VEX-KNarpcbWQzd9HkGLY
Message-ID: <CAMuHMdWc+gJo35btt3D7mibq+JCnZh4OagFPtSgUELjAG1J9UA@mail.gmail.com>
Subject: Re: [PATCH v2 4/5] clk: renesas: rzv2h: Simplify polling condition in __rzv2h_cpg_assert()
To: Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>
Cc: tomm.merciai@gmail.com, linux-renesas-soc@vger.kernel.org, 
	biju.das.jz@bp.renesas.com, Michael Turquette <mturquette@baylibre.com>, 
	Stephen Boyd <sboyd@kernel.org>, Philipp Zabel <p.zabel@pengutronix.de>, linux-clk@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Hi Tommaso,

On Wed, 3 Sept 2025 at 10:28, Tommaso Merciai
<tommaso.merciai.xr@bp.renesas.com> wrote:
> Replace the ternary operator with a direct boolean comparison to improve
> code readability and maintainability. The logic remains unchanged.
>
> Signed-off-by: Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>

Thanks for your patch!

> --- a/drivers/clk/renesas/rzv2h-cpg.c
> +++ b/drivers/clk/renesas/rzv2h-cpg.c
> @@ -867,7 +867,7 @@ static int __rzv2h_cpg_assert(struct reset_controller_dev *rcdev,
>         mask = BIT(monbit);
>
>         ret = readl_poll_timeout_atomic(priv->base + reg, value,
> -                                       assert ? (value & mask) : !(value & mask),
> +                                       assert == !!(value & mask),
>                                         10, 200);

These two lines now fit on a single line.

>         if (ret && !assert) {
>                 value = mask << 16;

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
i.e. will queue in renesas-clk for v6.18 with the above fixed.
No need to resend.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

