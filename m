Return-Path: <linux-renesas-soc+bounces-22141-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id D3131B91589
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 22 Sep 2025 15:15:58 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 637101883D4D
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 22 Sep 2025 13:15:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1BE1630F81A;
	Mon, 22 Sep 2025 13:13:27 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-vs1-f49.google.com (mail-vs1-f49.google.com [209.85.217.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 308C730F554
	for <linux-renesas-soc@vger.kernel.org>; Mon, 22 Sep 2025 13:13:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.217.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758546807; cv=none; b=l6E/oTlbdTAE/ikAVvKLGc75ow8drtDaP0/W1Sfez8LzQ2noqnw5NToZ7C1PgKx4qgOd4EeWNKuJpbSZyudbp4MVRk9mnsdWKoaqiBOoWXedFqojoQlqgL/fzNrDmQbgcjrJGH7TKH2VMpOTj78OHcsX3NkME7ejtniLqTCnhFw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758546807; c=relaxed/simple;
	bh=S/6XpFBr1IRtyZO8OA/cwmZ4o5NgtKwVhHfKm6CI0Iw=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=lij43oxNK0Fs2xtJlK5aeZVbBI8vPVOjeXoeGCC8cITikTm+POpSs6RLN8KY6wPdhhAjpHMjnJ5H6CKUOXmw05CnOlQFn2UNvbeJzfxwDWRngfAZNzKvHUQnbVejsj8pvJ1goNUj/zZkWPlxtzF5Y2evsXXlEYiULWWU82PzYy0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.217.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vs1-f49.google.com with SMTP id ada2fe7eead31-5a46c3b3a5bso155584137.0
        for <linux-renesas-soc@vger.kernel.org>; Mon, 22 Sep 2025 06:13:24 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758546804; x=1759151604;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Nutag0WU4swh2Ttkj8YGMxVYoDLOFgxz3Bs9L8eyAiI=;
        b=JVYeJXpIY4bkw8Pl0k3jtwvDIEyJiKp9s078KCu/lK/7pg7I3c3N0c/O8gcR3iQIBy
         z3F/KclBsrshRQsObUZLK/1iZx0DL62W6ykg3l8npvzFifoePxXoEpINHxcNqBepudAK
         G1GXkLOVppTrWO6hE78QmPzqchhe3tqeQRrJ30hvzQqKgi5y6Bhl+OapskkwfEXxqYSF
         469aq0XdfB3tF2CdzOBVFYTQDveZT/1zRQPUVdM/AZB4myDxnboGVf2Au68wAhSw+KgQ
         2B7ynESMPyGxw4CwNZMp86tH7ZHCjfitGeLW5F+26uiTWrkwmqhjPOZMwlnMWvM9Dh4n
         piVA==
X-Forwarded-Encrypted: i=1; AJvYcCW5Vp++SKpKdrQuc4P+gG8Kya4gsKJkIPo2IhdSQcJJDI3VrGrx1ACBYemN4S1DPDIhteoZvKlPGb2hUMedrTgn+Q==@vger.kernel.org
X-Gm-Message-State: AOJu0YxPp7/J8nq+P4INYuG7JLz8Psz7tiahBknrlT5RcogtWHQd0CaI
	7fkEqoqOXkzW+3yIcZo998YraRwCpj/MFzsUzxunsf/VZcLxCrTX5YPA2brppC87
X-Gm-Gg: ASbGncuXy7FurDORJhJ0UdpKeaHu22twV2dhi91h9pvtVo0fFMqeQfATxNv+SCGd95z
	69rLafPjAcn9ap4iW7CfJsNhXaIpb615GWYcDVzXucMo4PDryJeTZnVZfdG1PlQemSdi+jH5/GR
	Azma1yQR010JNqeF3TpG/D1yB5j3NnVerJE/k12r1tXS3sbc9+mMVq34DRRsdxsPvUauUsKxcFS
	6a82E5H5SQtrXFLLsCPCNyhxwEvCRR8JPMQpOacdGeAGqU9+z3KAL8Z8yd7LiuhlF6JsDHV4P++
	9blmAqcV+1tssdsDY0sqPZ7tap6f0wH41Qz0JtU/dYQqQWUxF7sgd3MvHQdBqHVbYO+zO239Pql
	V/m10OFFZzs4MguhL17QpQPJs67X3dcHSN/LA9SIfRgliCUbz9kJlfagzdNL/
X-Google-Smtp-Source: AGHT+IF9qstqWB9UX8p0jpcrrkO8Pc1ujvDHyRrHXka23EEx1AuBGilKPmeMAcVPIAmHZoY6QIafIA==
X-Received: by 2002:a05:6102:2ad3:b0:4e9:9281:85aa with SMTP id ada2fe7eead31-588d8deb017mr3680438137.1.1758546803645;
        Mon, 22 Sep 2025 06:13:23 -0700 (PDT)
Received: from mail-ua1-f48.google.com (mail-ua1-f48.google.com. [209.85.222.48])
        by smtp.gmail.com with ESMTPSA id ada2fe7eead31-579b4e5cbb0sm3292439137.0.2025.09.22.06.13.23
        for <linux-renesas-soc@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 22 Sep 2025 06:13:23 -0700 (PDT)
Received: by mail-ua1-f48.google.com with SMTP id a1e0cc1a2514c-8a967f3a873so1665330241.0
        for <linux-renesas-soc@vger.kernel.org>; Mon, 22 Sep 2025 06:13:23 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCVymPfeMDMRuCGoLWJ/3HPXA3CrD5LKcWY7mODDOXmHW49FiXzo+zdTIJpkCe1hGy2ZDHT7dus1FYGFVJaIwSJ3LA==@vger.kernel.org
X-Received: by 2002:a05:6102:6a85:b0:519:534a:6c22 with SMTP id
 ada2fe7eead31-588f802c452mr2930268137.32.1758546803126; Mon, 22 Sep 2025
 06:13:23 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250921111557.103069-1-biju.das.jz@bp.renesas.com> <20250921111557.103069-2-biju.das.jz@bp.renesas.com>
In-Reply-To: <20250921111557.103069-2-biju.das.jz@bp.renesas.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Mon, 22 Sep 2025 15:13:11 +0200
X-Gmail-Original-Message-ID: <CAMuHMdVCMPkh+D9G1rNJmhnyqOV3Ya5jb_VKjZEdVjysEqFVUw@mail.gmail.com>
X-Gm-Features: AS18NWAuG6KhnMhrzu9_2fL0vDBhmEtSyA2voBsifQw3rX27cbvUkygACfbs8sY
Message-ID: <CAMuHMdVCMPkh+D9G1rNJmhnyqOV3Ya5jb_VKjZEdVjysEqFVUw@mail.gmail.com>
Subject: Re: [PATCH v4 1/2] pinctrl: renesas: rzg2l: Fix PMC restore
To: Biju Das <biju.das.jz@bp.renesas.com>
Cc: Linus Walleij <linus.walleij@linaro.org>, 
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>, linux-renesas-soc@vger.kernel.org, 
	linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Biju Das <biju.das.au@gmail.com>
Content-Type: text/plain; charset="UTF-8"

Hi Biju,

Thanks for your patch!

On Sun, 21 Sept 2025 at 13:16, Biju Das <biju.das.jz@bp.renesas.com> wrote:
> The PMC restore needs unlocking the register using PWPR register.
>
> Fixes: 14c32dc1f63d ("pinctrl: renesas: rzg2l: Add function pointer for PFC register locking")

I would rather say:

    Fixes: ede014cd1ea6422d ("pinctrl: renesas: rzg2l: Add function
pointer for PMC register write")

as that is the (later) commit that should have converted the direct
write to an indirect call.  However, both commits prepare for the
advent of RZ/V2H support, and the actual issue cannot be experienced
before commit 9bd95ac86e700ab8 ("pinctrl: renesas: rzg2l: Add support
for RZ/V2H SoC").

> Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
i.e. will queue in renesas-pinctrl for v6.19.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

