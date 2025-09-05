Return-Path: <linux-renesas-soc+bounces-21421-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 0D8ECB44EBE
	for <lists+linux-renesas-soc@lfdr.de>; Fri,  5 Sep 2025 09:10:15 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 2AC6F18916D0
	for <lists+linux-renesas-soc@lfdr.de>; Fri,  5 Sep 2025 07:10:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5A8BA2D46C8;
	Fri,  5 Sep 2025 07:09:49 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-qv1-f51.google.com (mail-qv1-f51.google.com [209.85.219.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4D755DF71;
	Fri,  5 Sep 2025 07:09:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757056189; cv=none; b=gaRkUYA4Cg9zyldbzb6zwQR9DCmF81r/UVKQwTuvHWD1UFWU61R5rWspPXPnsl/bpn1d1CaFvFl50skebUr+TzrdvSMVWRcBAX138XQz9MKgQhdW9lLrympmEXTOLrZX8hw0KLr3Arf/JpoKcPn2QXBoVEiLVRGV0Tg0XsDNBXQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757056189; c=relaxed/simple;
	bh=sKo4jYgdvlfinYat3uVsJR4mwzI9n9ZEjIZvvx4OwhQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=tBAdfncROxsP5B1jWLU1WJzmj6voQ0CE7Jy3c+owYRUsWUgtDsJuftQGnavJ6sXHrHZ3+cDSpDMsdVootmfauUReFrqz5M1170hcc6nLRe25tsr5Frx/tQLkyuQBCNnJXiUlqd8fUdINDg2HH3jfEAYVbzVffPfYO8L9JG+uo8U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.219.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-qv1-f51.google.com with SMTP id 6a1803df08f44-72238e9f8ffso15867886d6.2;
        Fri, 05 Sep 2025 00:09:47 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757056186; x=1757660986;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=cuOVqLgDWDsi09lnXUkylGFovllEaeaRnLXYBa4dmhg=;
        b=XDPugdL0+M3HhHvF6NTmjXS8qqKJXQxcAIqwFsBqzwql1B96b5o5BCSyVKadugh5mV
         iJ2rPvTosJ3ZpTewJOkf1qJW9vibX5jDwEKd2kgj+ZLQw/c4dzFSsvL9VmcBCPOgB7/8
         azkYo2S505WVKQLWkJkOgeHMDfdYHW6+KdyNkzgJA5ZYEF96LTNNzEaU5pd7PGcqob4h
         HkPjTqeK94VYLf82wIASvN/W+xxBeMA/oieJ8+OU44xilmIqN4s3ewz7SJmrrNVH3u2j
         RmuWUkDu0EsGnTvkibjVcQB05GYb5AOEdWkVWQGS6ZHWIuaKcbAgiodpMWVaO6NNbZSh
         NUiA==
X-Forwarded-Encrypted: i=1; AJvYcCUEc77NG5uVHreYW97EsBEGvbl6knOED7wWNEW/k5bObSoObTtKrdfXKfxD0RxX8MWg0w6/kUEiwpALBVBwF0n3hnI=@vger.kernel.org, AJvYcCVBc3QQTub6IWTHsHVzUpztMvQZAiMeqYfQb637OWdyIpRbhW8os/ICmYX5rtLU8pKY5oxfFplNPq0SBncm@vger.kernel.org, AJvYcCVDi/EMxUQMOgZB6fOtCZW53a/kh29N35fwqbGXu1qAgVB/ntT3Te8OR5P6JRo4EJ+UqQ4NSofhsbDb@vger.kernel.org, AJvYcCVKLhMEo6ofD8eAP4HjptDYqE3vdqx/SAMwaZ78cxtvq7FIC4Z393C+iC+INhOx2g8Wwk4DmO9W@vger.kernel.org
X-Gm-Message-State: AOJu0YxHTVBwhuJ4/uaTvxQlxDuZ6Qs4lopoN48fbAmFnuLsXmE0ZjQU
	6xjhL2wiCdsheAH2KH9m1gwxYXqye2zq2QKiymTdES2OkF9espxg1VeyELxPtBqS
X-Gm-Gg: ASbGnctwSlrcXz5J5QduKHgFXLFPAKNSUCo743HZuWqOiiAeSwM9RTbJGfuQzpCUKIL
	FctjM0Qv6xy7O1iVKjrqTiy0rkT490URHt6gqzUqb97YtTH2xGGq/cAmeEt7TlQpb1G2dM06Hz1
	SbiS5DNfDjdMdiFkHOyq4zuGluEyUKSKSNSFsKnAKJeK4hM1MmDG8hkxcicLeIXa9ETLY65OwhY
	32wPXNFDrG0T2i0H8G8AIwGRMNb7RViEQ8dPpXqmwqdvg2IXfdnzG6xgk3DrQ9Hn5PXhfg/CJk9
	szQmbTl03AMgJiFICSBcNPxyDvPc7c4yZg/35B7tHGhpJs9dODd6XIHDjNUrj8ptAdQbb2LyrVs
	g4vEHCU4gQUdvTJVUtDKs7jpbUnbzbW/QjZS7UMqhqlZZSAAGGfBFqGhIwD9DgEs1q8eYM4Y=
X-Google-Smtp-Source: AGHT+IFri2vtbiB7fmxhYmy2fF0cj0ZGeOiB9BPZgMaeY9nOr6Ye87KS10JRxtup7TWiCKhpBAZz4A==
X-Received: by 2002:a05:6214:8ea:b0:72d:8061:93fc with SMTP id 6a1803df08f44-72d806198afmr10168056d6.38.1757056186070;
        Fri, 05 Sep 2025 00:09:46 -0700 (PDT)
Received: from mail-qv1-f52.google.com (mail-qv1-f52.google.com. [209.85.219.52])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-7220f78b9bfsm51176816d6.64.2025.09.05.00.09.45
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 05 Sep 2025 00:09:45 -0700 (PDT)
Received: by mail-qv1-f52.google.com with SMTP id 6a1803df08f44-729c1074875so11419056d6.0;
        Fri, 05 Sep 2025 00:09:45 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCVs2mVtD8nhY8MFjapE9/CazRiXosDgk74/85T09sUKWQ4h7hk4Gxao7cWNoLevvZ7S1ugI/MkQQ3W4jdBx@vger.kernel.org, AJvYcCVvudR+2pzZZIWv8SJc1ciU8YDMlwdgIlBOS3WsO5E+AGjVk4uLGEtWCftYW0wAsJg9AoFkeTMt@vger.kernel.org, AJvYcCXCzxNHiFG4skWqYm307b+PnmkT/4OgcPhJOXmfFWtUg7fOZs4TqGIa70BQLTx+AEk+AtpLTzvMA/Um@vger.kernel.org, AJvYcCXmafFXhd+wRsskwO18ihbKOa2upitE+XW37FnaSOzXHKbGqOCXYwzIKfuf6+wIR7rgZKtgiL2wbIISWRcnuR/uaYk=@vger.kernel.org
X-Received: by 2002:a05:6102:4412:b0:508:aeba:ac31 with SMTP id
 ada2fe7eead31-52b198509ddmr7249793137.2.1757055766011; Fri, 05 Sep 2025
 00:02:46 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250904114204.4148520-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <20250904114204.4148520-7-prabhakar.mahadev-lad.rj@bp.renesas.com> <021e970a-f606-4702-9f0e-b4b0576bc5d6@lunn.ch>
In-Reply-To: <021e970a-f606-4702-9f0e-b4b0576bc5d6@lunn.ch>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Fri, 5 Sep 2025 09:02:35 +0200
X-Gmail-Original-Message-ID: <CAMuHMdVnhjA0xi+wojMc40Zmv_JBZpOm04GO_ewBSzFndbtegQ@mail.gmail.com>
X-Gm-Features: Ac12FXwI-xpP3iIVZZhI0fQdOQYz6cBywMUyW9k6_qQbTcQY9MOz59KPn3SE_zo
Message-ID: <CAMuHMdVnhjA0xi+wojMc40Zmv_JBZpOm04GO_ewBSzFndbtegQ@mail.gmail.com>
Subject: Re: [PATCH net-next v2 6/9] net: pcs: rzn1-miic: Make switch mode
 mask SoC-specific
To: Andrew Lunn <andrew@lunn.ch>
Cc: Prabhakar <prabhakar.csengg@gmail.com>, 
	=?UTF-8?B?Q2zDqW1lbnQgTMOpZ2Vy?= <clement.leger@bootlin.com>, 
	Andrew Lunn <andrew+netdev@lunn.ch>, "David S. Miller" <davem@davemloft.net>, 
	Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Heiner Kallweit <hkallweit1@gmail.com>, Russell King <linux@armlinux.org.uk>, 
	Philipp Zabel <p.zabel@pengutronix.de>, Geert Uytterhoeven <geert+renesas@glider.be>, 
	Magnus Damm <magnus.damm@gmail.com>, Wolfram Sang <wsa+renesas@sang-engineering.com>, 
	linux-renesas-soc@vger.kernel.org, netdev@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Biju Das <biju.das.jz@bp.renesas.com>, 
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>, 
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Content-Type: text/plain; charset="UTF-8"

Hi Andrew,

On Thu, 4 Sept 2025 at 22:37, Andrew Lunn <andrew@lunn.ch> wrote:
> On Thu, Sep 04, 2025 at 12:42:00PM +0100, Prabhakar wrote:
> > From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> >
> > Move the hardcoded switch mode mask definition into the SoC-specific
> > miic_of_data structure. This allows each SoC to define its own mask
> > value rather than relying on a single fixed constant. For RZ/N1 the
> > mask remains GENMASK(4, 0).
> >
> > This is in preparation for adding support for RZ/T2H, where the
> > switch mode mask is GENMASK(2, 0).
>
> > -#define MIIC_MODCTRL_SW_MODE         GENMASK(4, 0)
>
> >       miic_reg_writel(miic, MIIC_MODCTRL,
> > -                     FIELD_PREP(MIIC_MODCTRL_SW_MODE, cfg_mode));
> > +                     ((cfg_mode << __ffs(sw_mode_mask)) & sw_mode_mask));
>
> _ffs() should return 0 for both GENMASK(2,0) and GENMASK(4, 0). So
> this __ffs() is pointless.
>
> You might however want to add a comment that this assumption is being
> made.

I guess Prabhakar did it this way to make it easier to find
candidates for a future conversion to field_prep(), if this ever becomes
available[1].

[1] "[PATCH v3 0/4] Non-const bitfield helpers"
    https://lore.kernel.org/all/cover.1739540679.git.geert+renesas@glider.be

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

