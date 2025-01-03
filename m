Return-Path: <linux-renesas-soc+bounces-11811-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 64978A00BBE
	for <lists+linux-renesas-soc@lfdr.de>; Fri,  3 Jan 2025 16:58:02 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 41CDB1643B4
	for <lists+linux-renesas-soc@lfdr.de>; Fri,  3 Jan 2025 15:58:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C9E1C1FA17E;
	Fri,  3 Jan 2025 15:57:59 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-ua1-f42.google.com (mail-ua1-f42.google.com [209.85.222.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 20CB41A8F9A;
	Fri,  3 Jan 2025 15:57:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1735919879; cv=none; b=K0Adu/Jy4Cu5gLHnfMr5LIT6oM/IW0krP19YxJzdXtrCyqSqkbuaJMz8nVrD+9y0CT7Qd/liXn5ZE1gL5XL18+jneb9dyXQKDTfmE9t0uX4J0Eqp7giyCoPpWAv9hubMMamDLIiHmzm+KjJPdBjxU8o3FSjKXVL4rngPrQXh4I8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1735919879; c=relaxed/simple;
	bh=4RjgWwwswzG9RR6mqzYCoL4a8hKNxvHmAc73JZKJf7w=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=TX5DpeetSdv3L/kOUTDfiXEM4wm003/bymKiwucTnsn86bQ+hnO/5f3qAzitqwmX+eT1MtPL+hO5GHBW54IEAOMfnVZ26YFv5/NFtOpE//cmGcIuE8LJGMP+AG3A8GV1hlXy6v7esc89sucvvoOFLqtQfinI6Yl5GUCjx4SJ3EU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.222.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ua1-f42.google.com with SMTP id a1e0cc1a2514c-85c61388e68so1786178241.3;
        Fri, 03 Jan 2025 07:57:57 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1735919876; x=1736524676;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=KipYZNO5YdUedjWjk6+OlBzBEgST5J2vRfwoXHkTwE4=;
        b=euo+pz35te7sgjePGyMrnbbxPjUPql/c+WCe/ExvfvtVlf7k+qtvI9r7SM40TyYapx
         jdgUr9Wocy81kqTi3weV78KkBQz37Yg5jX03rUn0WZnUryZ9o9igR0taswlszLLGe9Sw
         nc8RS2odh8r1bq7rgfXnNproSavlMz4awtCHYX/ZwoTwiqtPYZYjVaH8gRBvtDxYiCMF
         nRtG17zpvfa9auM1ERc85NN0CFMWinpIdQwZRzqLo8AjJy5B+27zrCRnf8BLmYHvTEXI
         PVqdlSKq2f/NeY8bciQkEx562YqIXZ7L2rmW1cyBdiECgPsIYn7QKIqy7/UMHmECx+sh
         kWIQ==
X-Forwarded-Encrypted: i=1; AJvYcCUK/PaNhBLNDSsoTzJ8X72578VsGDAMoWEgkvRePrXfirKuJb6pr6PFoqrUYuTNqHmVGP/1hevJ9sJwCpLCcsj4TzI=@vger.kernel.org, AJvYcCVZh4Te3JIuW7FFDLf7nYYeuLfBzlPieaavH3IXHYYOnHOBuAjFz2744c4/qkOMIKJxpz1v80Bvm9QpSWtV@vger.kernel.org, AJvYcCWzATE/TsN5BqlrJVnSMzlnVQ7ahCpbKJEf3dam5GzsOBdfxSPBa2loLPR+zAF88kcFIAW/i6umJ7k=@vger.kernel.org
X-Gm-Message-State: AOJu0YwSIRf1qUl7Tj+u/UfImGJUGssyJDBFdPAM7rI52Upjk31biNbg
	tmQlmMCoWwzQLgX3sBa+lLk3pzQJjCRNPhdUtu6+k6Ito+n7lfdSKprHmj7tuOc=
X-Gm-Gg: ASbGncvFd0gQr2uatpmKrJ6cq9xhFTflu70Q2YYFo7HSE4t1lw+uSZU/JW5As26Tpyo
	EIZU7pNHMlx8Llt1QhzrGJlB+7+Kb9lFOw6PP+HJNd55CatjU/wkpDcpm7GJJhxZnlOlaCzduRN
	BcnLQD6+CHnUfckT028kGilC7jwNnEqEAvAFrgbEUc1GQG6hnowjDLc6LdBon/LtE+XTpc6qULU
	6uZVJaC5IQq7tv9h48tuMV7jwuSEJEoVQHDyCbfuFwf8KrRvLh3p61dSp2eDu/pN7jfuBS65v5r
	YJcV0Q1C1uMAn9QbdcU=
X-Google-Smtp-Source: AGHT+IFjdlJr7ceb35c7+pnDzrZlvSnN1Q2pU4+oaEfo4xkUQPipxHeEHvnYJ+5rMS+FY1/Sg26m3w==
X-Received: by 2002:a05:6102:c02:b0:4b2:5c72:cd55 with SMTP id ada2fe7eead31-4b2cc31f256mr40579723137.5.1735919876429;
        Fri, 03 Jan 2025 07:57:56 -0800 (PST)
Received: from mail-vs1-f42.google.com (mail-vs1-f42.google.com. [209.85.217.42])
        by smtp.gmail.com with ESMTPSA id a1e0cc1a2514c-8610ac4c4dfsm5640562241.14.2025.01.03.07.57.56
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 03 Jan 2025 07:57:56 -0800 (PST)
Received: by mail-vs1-f42.google.com with SMTP id ada2fe7eead31-4afde39e360so3391565137.0;
        Fri, 03 Jan 2025 07:57:56 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCWmUOjIIJyzfkzh8IveTEhQsAIoicgFO6s7ryL1Dqa1SU3JWjGIOQHeWkx1m82axyXrlwHpQFYFgBqmvSx5@vger.kernel.org, AJvYcCX+2h3x/Sg0J9F+b4atsfAFnKTDCjT/w2KjcRalZwFVz7k+go6+CFZOklhlWFBEognjBklmzgt9fRU=@vger.kernel.org, AJvYcCXoqjslpKMjD9FZ7QLVHeJ7wZBYKYUZNb2G7PeC03fQAO7T0wPvXvGOXLI9x34YgupEGeGSH9Ym4DJJPsYAhwLILSY=@vger.kernel.org
X-Received: by 2002:a05:6102:c02:b0:4b2:5c72:cd55 with SMTP id
 ada2fe7eead31-4b2cc31f256mr40579715137.5.1735919876042; Fri, 03 Jan 2025
 07:57:56 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250102181839.352599-1-prabhakar.mahadev-lad.rj@bp.renesas.com> <20250102181839.352599-6-prabhakar.mahadev-lad.rj@bp.renesas.com>
In-Reply-To: <20250102181839.352599-6-prabhakar.mahadev-lad.rj@bp.renesas.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Fri, 3 Jan 2025 16:57:44 +0100
X-Gmail-Original-Message-ID: <CAMuHMdXeysiJMx=6KNfnhA=0Hi7jLA0OTQ2brxL7+xj51XHpaA@mail.gmail.com>
Message-ID: <CAMuHMdXeysiJMx=6KNfnhA=0Hi7jLA0OTQ2brxL7+xj51XHpaA@mail.gmail.com>
Subject: Re: [PATCH v3 5/6] clk: renesas: r9a09g057: Add reset entry for SYS
To: Prabhakar <prabhakar.csengg@gmail.com>
Cc: Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, 
	linux-renesas-soc@vger.kernel.org, linux-clk@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Biju Das <biju.das.jz@bp.renesas.com>, 
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>, 
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Jan 2, 2025 at 7:18=E2=80=AFPM Prabhakar <prabhakar.csengg@gmail.co=
m> wrote:
> From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
>
> Add the missing reset entry for the `SYS` module in the clock driver. The
> corresponding core clock entry for `SYS` is already present.
>
> Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
> ---
> v2->v3
> - Included RB tag from Geert

Thanks, will queue in renesas-clk for v6.14.

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

