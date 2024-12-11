Return-Path: <linux-renesas-soc+bounces-11225-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 5E2089ECC61
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 11 Dec 2024 13:45:07 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id EC42A188A6B3
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 11 Dec 2024 12:44:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F2B9D3DABFC;
	Wed, 11 Dec 2024 12:42:41 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-vk1-f175.google.com (mail-vk1-f175.google.com [209.85.221.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 590CD233690;
	Wed, 11 Dec 2024 12:42:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733920961; cv=none; b=mn9hmrICsKmYeUaRLZSBntH2PhUbbdSdouvDc/pRPK9aQ0AM7ie7UxzULW4bfGNAUZJpCVczxzynahNMvYm8BOvxi1jvYpGwp2KGT+Bbef2YFJ3/7BHyBDNLKCW18kvvGr8VwyS860bmIR3HN6jgHe8BIUZRhMTq8pAw0p4MHkM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733920961; c=relaxed/simple;
	bh=z8ygNj9mcWw9Zpt4jlNTxtM38aXvxjE2d6iY9VU1WUg=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=tBreR2jQ99069lrO/NvPLti24u00TwlxyNkQBDQpXSb6AVRfVGUyqW4d9s9TJJA0Qjr2ffYRLVm0tjw5+kJ+9sOq24wzsyaXaY8VJ/UZ+9adGIx3meoky39G7yIoRqUjtvwftbxz0BATn6EpOgl2R+Vn3rUP3GdEVoY/XyO8liM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.221.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vk1-f175.google.com with SMTP id 71dfb90a1353d-5187f0b893dso896708e0c.3;
        Wed, 11 Dec 2024 04:42:40 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733920959; x=1734525759;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=zLBu7GsqeCW5EvQG6H5Db3zCH1soGXXD8ofBGkjH21I=;
        b=aBQAlyqiy5w+SwtU+CSRtoNTEgU6ZSMvpbx0zn8NKqTOs9pPILGhzV+jo9omccDd40
         ehT2BkNt1eY54zyBm01v6jSU8S7zrFjRqDk/yFq7Jqh873pghTNLOaLQ2hGhjNEN03Kb
         J8w/kRqS73QH8PjXDTFWA5TXS0TtoTNRgi38fmj8VqY34jrgNQhWlYJPFrZqiKS7q8uV
         87YRrLi2eCQNfubRR3upN9kgbp3kn7xqpQHWYyskeE9I3H7VuJvjsbjx4JQ5exGOiprE
         7G5r8dijuxQnQrfuGVG+NStFENQdooEHPL6lttxyyRqnLWPXeG88GbhDyj35cJAyG4cM
         +F9A==
X-Forwarded-Encrypted: i=1; AJvYcCU5S27Cxp38uRu7CmG8H/4MBoVf4zgyrowpbN7Vx51LAyWFtWVRcH2LeLPcfthSEugQ8ClHCznelTZ3/TuR@vger.kernel.org, AJvYcCUCD6UjC8Ks2YDFbLOid3AGVUE/AO0fg8qrR04xXEJJ7mMImZUU+iFQEbzC0cl+BMfU84KMPj02OVq0@vger.kernel.org, AJvYcCWv4pUFUxQzHeJ4XxIYvN4lsjOrINKgzfl0IgT2w5KTZ4Hd+wuA2ifQCBfvWYOJ9IdmLJUY2omY4oXQSXirpRjqG8Q=@vger.kernel.org, AJvYcCXwb9+XuzIPxiqyWf1KwAa167XIWyQRAhyRX7iQF2vL9LiJ7pPS9txqDtjFICB8D0EOAV0AhyMPCVCM@vger.kernel.org
X-Gm-Message-State: AOJu0Yxzxb98yq0P04mM/j/83wiuctWI8LKiwUDjsKWtLQRAFMTZ4/jB
	LG3OLp1cKdbfitCiBMxCWJInsum5yNi0OfqMUOvW0IWxUOBTm7SJIYW7+WFI
X-Gm-Gg: ASbGncs5LmgeexWNxhbmwp6tSMvl/SjRulONJRW5CCkxCWit35fiv/WDVM5DHh88oEj
	8wZ+HkMvnRqWbCJDp/Uq6plcU9bYqdli9/3iLcBfsS0qb+iUuY7THxsmVwem/cTWcHDtRbX7QUW
	VFQpgQFE76sq/eSMy5EFDdXQCnXpcWh05kfbEcX617m005jlW272qydVSbg8mfPJbTeajIgQpEG
	CYNaNq9KgyXvOJdnJ8yFNuh7qgtapc0iNZszUGo9fkLl9k7QzGWg3mzqaALen2hIGJHrBZiaCwt
	B5fYxKvUObGCILZj
X-Google-Smtp-Source: AGHT+IGO5cjrk+I4iD938Q/Bd+39FGQDPPi1Eynst/NgRytOY26oSaTzOHrGdyzA3Dx3eELQg98DIw==
X-Received: by 2002:a05:6122:1687:b0:515:e446:b9f9 with SMTP id 71dfb90a1353d-518a3bffd7amr2281285e0c.12.1733920958829;
        Wed, 11 Dec 2024 04:42:38 -0800 (PST)
Received: from mail-vs1-f53.google.com (mail-vs1-f53.google.com. [209.85.217.53])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-5160fd0e6f9sm793652e0c.41.2024.12.11.04.42.37
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 11 Dec 2024 04:42:37 -0800 (PST)
Received: by mail-vs1-f53.google.com with SMTP id ada2fe7eead31-4afd68271b6so1491698137.0;
        Wed, 11 Dec 2024 04:42:37 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCUETW1yKOJkiKkCmDSJt/NPm45QzI7+Ls5dAQ1EPtY13j0dkhFfJqG0FHMwu3+zwtkt38j/jmgWLU+gBqWJ@vger.kernel.org, AJvYcCUbdFappteGKHTMPvxZG5pgu+czkZGOXM1ZNKYUSexNji6B7JhIIVhmzIm4cKH6D4+23P/GBwXAnrqE@vger.kernel.org, AJvYcCWfDguEEmgdMW/Ji/tEx1JE8dZEtem2yyDqHSczMgR9MFbNgWJ9wNEDOiN8MqtYVCFeHUZTS8deepa+B8QjRVlJNYc=@vger.kernel.org, AJvYcCWiwKnHBQkdIvrMRqIsgmOU1UTaoZ3IjnAs6KHjhiUvDJNss5jQHmgY+2apIjgMw3YcGm59acXN0ruR@vger.kernel.org
X-Received: by 2002:a05:6102:3596:b0:4af:fa1b:d8f9 with SMTP id
 ada2fe7eead31-4b128f4d0ddmr2659704137.7.1733920957665; Wed, 11 Dec 2024
 04:42:37 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20241210170953.2936724-1-claudiu.beznea.uj@bp.renesas.com> <20241210170953.2936724-24-claudiu.beznea.uj@bp.renesas.com>
In-Reply-To: <20241210170953.2936724-24-claudiu.beznea.uj@bp.renesas.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Wed, 11 Dec 2024 13:42:25 +0100
X-Gmail-Original-Message-ID: <CAMuHMdXkEXFtQFfymHGxUy7bVKbYEfTqBit7P1jd3oK56buQKQ@mail.gmail.com>
Message-ID: <CAMuHMdXkEXFtQFfymHGxUy7bVKbYEfTqBit7P1jd3oK56buQKQ@mail.gmail.com>
Subject: Re: [PATCH v4 23/24] arm64: dts: renesas: rzg3s-smarc: Enable SSI3
To: Claudiu <claudiu.beznea@tuxon.dev>
Cc: mturquette@baylibre.com, sboyd@kernel.org, robh+dt@kernel.org, 
	lgirdwood@gmail.com, broonie@kernel.org, magnus.damm@gmail.com, 
	perex@perex.cz, tiwai@suse.com, p.zabel@pengutronix.de, 
	biju.das.jz@bp.renesas.com, linux-renesas-soc@vger.kernel.org, 
	linux-clk@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, alsa-devel@alsa-project.org, 
	Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Dec 10, 2024 at 6:11=E2=80=AFPM Claudiu <claudiu.beznea@tuxon.dev> =
wrote:
> From: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
>
> Enable SSI3.
>
> Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
> Signed-off-by: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
> ---
>
> Changes in v4:
> - collected tags
> - dropped status for audio_clk2

Thanks, will queue in renesas-devel for v6.14.

Gr{oetje,eeting}s,

                        Geert

--=20
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k=
.org

In personal conversations with technical people, I call myself a hacker. Bu=
t
when I'm talking to journalists I just say "programmer" or something like t=
hat.
                                -- Linus Torvalds

