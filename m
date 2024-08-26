Return-Path: <linux-renesas-soc+bounces-8293-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id EEBE595F31C
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 26 Aug 2024 15:38:17 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 8D6C5B213F8
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 26 Aug 2024 13:38:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 88B3A18859A;
	Mon, 26 Aug 2024 13:37:13 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-yw1-f182.google.com (mail-yw1-f182.google.com [209.85.128.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A65C618454D;
	Mon, 26 Aug 2024 13:37:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724679433; cv=none; b=ofZPvkQdgxjyNPfZIYwfdW8NVXdlg0u11wyvws3/oIYOsidJdRSEDEP+s4zIRbvxgJ9J9wC7ePuOBIHfkBYunyAmP6sbw6VE+GptddkUkkqqCGj+K9w7OLzqJAjltGiC9FPLoaO7vBlMRe70x8jiQNt7dAZeJsA3uiYO86dMXcU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724679433; c=relaxed/simple;
	bh=9whOsCzv3m3ZPW2QREqTez5XUl4MYMB9UFimcB9rE8k=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=OVS/v7x9SAncfraZgBeLG6CiAi+xhlgopGYb9WhiXrN35UGKDPBUcbm45j2iUTc0GijXuD4QFJQ3ePJ8UkeKulTBR7KhElQQp6eX0PNKyAsRigS6yjizzBDqv6Ak07+orHkWLwQGV+ZccGMUmEnaVY/Lh9BXxvxIb2PsnPMMv6k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.128.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-yw1-f182.google.com with SMTP id 00721157ae682-68518bc1407so46260997b3.2;
        Mon, 26 Aug 2024 06:37:11 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724679430; x=1725284230;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=V42L34Dbl6HXHTKKW+P9zR6eV2yIE2JosLjaAq7Os8c=;
        b=FXhyxVY64sd8pUkM9rdUZ2k6XH1y8sDHNOE085AdBUU46W/lZU3Z7OKIY9lIHvXb5a
         LdylWxYKb+ajomyTiJ89HEyx2fSQFc8GmojaBY6XjOhAPIGfeJEPyK6JNUVXsEWLKMLF
         aFYwOuuTIJaQhO8+eAcDCeKKOO3vhl8KHco2AWu3chI2PocDa3huW22KBmmGkBrZn788
         2zPwEvo3lpODj6MJ1FDvM+vLMoK8yemf3evvdDQmIW+CaQHIeBsgHpolmYvXuVbJVhcw
         VOWTb+UGlq76C93anJvNKiUE6D4eUdgThlpGlfK1JWKz1b98nlOro+CfRG6WWRCj03xv
         kjUA==
X-Forwarded-Encrypted: i=1; AJvYcCVV1vM2ARmLmzTTTerYTH09a6zxjss2JGk+FXf+RiZsHc+s9Vv/dy0jjfpUBGqYqjBsvcphoZv75C7bbg6k@vger.kernel.org, AJvYcCXGw6wQouS0nJWXlojxbjMcBimXejtiUHBkQ/rg+ygzLiwvZzHp9AtOvqijgukgKydLLT/ePMqUTx4=@vger.kernel.org, AJvYcCXOoie4RQZwuySl8NN/eJ8CJJKGEu5D3xfBNnWGxlZS1ts2D/2PPSnkPrb6+ue27XX2PcOfY9bEjA+C1fOLP2CxkZA=@vger.kernel.org
X-Gm-Message-State: AOJu0YzIF2nIuhQNKUJenu3jVTClXcuuHtEr/2xoC9EWQkXGkoDhQqPV
	wRi2r0+/BsWrhds0E3o2E5pYThWisLwmctiOjEZkHLDsH5zCSfenUVGGRfk0
X-Google-Smtp-Source: AGHT+IErlJJmue/qiUPcfJvl2uWqKyDvC7mgjBbu+U0OaYvtcOkLLJLKxq+Dkrk4LwheJclACNOXxQ==
X-Received: by 2002:a05:690c:298:b0:6b2:6cd4:7f95 with SMTP id 00721157ae682-6c629beb6a8mr108286257b3.38.1724679430031;
        Mon, 26 Aug 2024 06:37:10 -0700 (PDT)
Received: from mail-yw1-f177.google.com (mail-yw1-f177.google.com. [209.85.128.177])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-6c39a752d06sm15257067b3.36.2024.08.26.06.37.09
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 26 Aug 2024 06:37:09 -0700 (PDT)
Received: by mail-yw1-f177.google.com with SMTP id 00721157ae682-6b5c37a3138so38734397b3.1;
        Mon, 26 Aug 2024 06:37:09 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCUXb/2/IrFhVq3N+NS5ySEzs3feUTcdOr+A55NabF7GfxH/rqSOiK9VMluL21r9EAMPLIssEtEdBEZp9SyP@vger.kernel.org, AJvYcCVrCGI/RO+v9JUi9ByVbS0QostzMRZEddJnEaY6HD1WZt5ljrTe5eg/Ub+mlZGFiUBJHB78NaH7+EI=@vger.kernel.org, AJvYcCXK0WY1ssQS5udeoSsDEpd0bmWuhR04bahR7Ajr6uOZCgj2u4DpP9KV7vq8qv2wgJY60TjSoIf+5sdyTx11YtZ1bw4=@vger.kernel.org
X-Received: by 2002:a05:690c:3248:b0:683:37a8:cd77 with SMTP id
 00721157ae682-6c629250047mr86776737b3.29.1724679429605; Mon, 26 Aug 2024
 06:37:09 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240822111631.544886-1-prabhakar.mahadev-lad.rj@bp.renesas.com> <20240822111631.544886-3-prabhakar.mahadev-lad.rj@bp.renesas.com>
In-Reply-To: <20240822111631.544886-3-prabhakar.mahadev-lad.rj@bp.renesas.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Mon, 26 Aug 2024 15:36:56 +0200
X-Gmail-Original-Message-ID: <CAMuHMdWcHn2ae6qennqtPq2eLtKLkeKUNoSoAXbOTh=gDgJ9tg@mail.gmail.com>
Message-ID: <CAMuHMdWcHn2ae6qennqtPq2eLtKLkeKUNoSoAXbOTh=gDgJ9tg@mail.gmail.com>
Subject: Re: [PATCH v2 2/2] clk: renesas: r9a09g057-cpg: Add clock and reset
 entries for GTM/RIIC/SDHI/WDT
To: Prabhakar <prabhakar.csengg@gmail.com>
Cc: Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, 
	linux-renesas-soc@vger.kernel.org, linux-clk@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Biju Das <biju.das.jz@bp.renesas.com>, 
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>, 
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Prabhakar,

On Thu, Aug 22, 2024 at 1:16=E2=80=AFPM Prabhakar <prabhakar.csengg@gmail.c=
om> wrote:
> From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
>
> Add clock and reset entries for GTM, RIIC, SDHI and WDT IP blocks.
>
> Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> ---
> v1->v2
> - Updated DDIV_PACK macro to accommodate width

Thanks for the update!

> --- a/drivers/clk/renesas/rzv2h-cpg.h
> +++ b/drivers/clk/renesas/rzv2h-cpg.h
> @@ -8,6 +8,13 @@
>  #ifndef __RENESAS_RZV2H_CPG_H__
>  #define __RENESAS_RZV2H_CPG_H__
>
> +#define CPG_CDDIV0             (0x400)
> +
> +#define DDIV_PACK(offset, bitpos, mon, size) \
> +               (((mon) << 19) | ((offset) << 8) | ((bitpos) << 4) | (siz=
e))

I think the DDIV_PACK() macro (using C bitfields?) belongs in the
previous patch.

The rest LGTM.

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

