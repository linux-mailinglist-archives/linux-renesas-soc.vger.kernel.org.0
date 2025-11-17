Return-Path: <linux-renesas-soc+bounces-24699-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [213.196.21.55])
	by mail.lfdr.de (Postfix) with ESMTPS id 28FDAC646D3
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 17 Nov 2025 14:42:37 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id 65333355ECC
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 17 Nov 2025 13:35:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BC39933030F;
	Mon, 17 Nov 2025 13:35:04 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-vk1-f174.google.com (mail-vk1-f174.google.com [209.85.221.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3348731B130
	for <linux-renesas-soc@vger.kernel.org>; Mon, 17 Nov 2025 13:35:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763386504; cv=none; b=bxDfM8AQL7+os1DSokEgo99eExpcFK9g5LKV6CQJjct1ty2VF/1p8yDSBEjZl9W1JG3o7qSGSpuI5JL3mLFeV4BqNxFxa4PhNnR+MXYsZe8hCdFJifn37mE1AFkveTlWU4o9bmnr5tAcw7X/tj9IVMrT2sPypL3aWN4g5OP3rhc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763386504; c=relaxed/simple;
	bh=px2hV1A/nOdN7ZX1sTKuZqvlCW5UVG+hbRtvmwMHmns=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=AJ8FYEhkFJay89V0uDT0oZrU7Ov+07U6/aalrV35Hn4/6pbyyhVzzNOOqOQmJkApoHEQnbO/qFMWagMTBS8rByHjoMeCK99NNRvLf4hyEsUEXjfDgrfwPnXZrtpgD1duh5ih3Pd0vnCk3E82jFUkGYZL38sc+QIO1RPYAGm9PYM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.221.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vk1-f174.google.com with SMTP id 71dfb90a1353d-55b155c9ab2so919770e0c.1
        for <linux-renesas-soc@vger.kernel.org>; Mon, 17 Nov 2025 05:35:02 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763386502; x=1763991302;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=XicRv49ckL1HlqmKBdAWtpcFjnN28YIuiJ+gd2B6JYo=;
        b=p+KpTIHvwdBjHLUTGeMj1jEhScdpAhj9N+/AZuuFWz7EzCXlkYyzfuQUW7m8jOMFTv
         F87Ca1CfuY/VR8CaD/CQ+oDSaVKlR3KqqvkOHtyh8ghOuj3zOXuwDR4gY8laBZUj+sCG
         bZVFhEuv65d8VgK8vJHiYii97UInkwXNdOKNWI1wAwtuoAtEr3Az/zO/Les1UYGbhHMz
         7y1zjn3dbKFhnrDKMjR8BlCsFVudRoizXjnfDxIA9D5hZx/eal9LIFj2gPklVoE45XRU
         wxb1tvt/cvkIEosdSaoBw61zTYp1XI9nk8EjZnqRFz6W9Qphf3SB75KlXCdRoz7Hy97e
         M9NA==
X-Forwarded-Encrypted: i=1; AJvYcCX27R9/a8rwVjf1uE6s7hs9s3CwcXt02EJTRjwWOarDw0Bg4hoywHi1NwIdo7GCMwC0kWu6e0+ZU5fzhxgHTUQ1gw==@vger.kernel.org
X-Gm-Message-State: AOJu0Yy67SHEU11AuxMiHFFgkfBTu2QJxJqA1Bg9UuXlXXG6E1uvNaGa
	t6QhP2CL0eV8mc871/JTJgEdU02w9/g3sLORESf//RCHs6nA7q41XphGc3JWi/nAE1s=
X-Gm-Gg: ASbGncsgODIZ0IyRq/If2ak+Ix+4FdL3DiubuTNoi9i92+MbA7R4U+pKKJ2PEwz3riZ
	wAk1QsSJwQN99sv6WQ9pe8dO8MluaxDGykO+1Z/usx6AUjE/n0RSDjQho/wu6POuwUiMSmmPZ2P
	5OFV6ZdrT7X8ZBBz52DxANcjPf156Oy4VkpE5J79sB/FWBB+XyPRVhzECepKVOmXAUcIZ/Kty0A
	kngWH/NJRpPMRBW12L1/vT1Fej3KK5xPz/L6jxR2v7oTvDHvYKjoApbY+nLub3Q+FjaN2ppLS6A
	76wOij/vC3TmuhGC9fH/wX8Lf9t6+eNcXtCAZ1kym9tx8u1oJZe0L2r6FPS0LB3ow5HDVNfqPBP
	n6kg9sbhoTb/tshltpWwQFEp3oRLKnK+KSu6EXwoS+Yd8Flq23RhCcFbxFkj2RVLoaOZAuJaY0P
	uI1yIAYjxW2VzNu4wxQy2uX3AaWJzCjRgREW3EQw==
X-Google-Smtp-Source: AGHT+IHVpMhGi3VvjkFE/9xJXYPSjaQxBYno02/1ijhNHqM7Y1bXqoOfUyrrW118vtsqu8S8c2iL9g==
X-Received: by 2002:a05:6102:cd1:b0:5d7:de89:8dc6 with SMTP id ada2fe7eead31-5dfc554dfb0mr3463626137.6.1763386501755;
        Mon, 17 Nov 2025 05:35:01 -0800 (PST)
Received: from mail-vs1-f51.google.com (mail-vs1-f51.google.com. [209.85.217.51])
        by smtp.gmail.com with ESMTPSA id ada2fe7eead31-5dfb70ea4aasm4405279137.8.2025.11.17.05.35.01
        for <linux-renesas-soc@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 17 Nov 2025 05:35:01 -0800 (PST)
Received: by mail-vs1-f51.google.com with SMTP id ada2fe7eead31-5dbe6304b79so1604348137.3
        for <linux-renesas-soc@vger.kernel.org>; Mon, 17 Nov 2025 05:35:01 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCXcB4aZ2yR8G08JhqV/ndylCRPiKJG8b//dXwkOxYspKM3Iw7dgAL+/Pi6BkLVK3xoU8NVk7Dg6qE0CgoV9c47Dyg==@vger.kernel.org
X-Received: by 2002:a05:6102:4b89:b0:5df:b085:835a with SMTP id
 ada2fe7eead31-5dfc5b9e6d5mr3484003137.30.1763386501291; Mon, 17 Nov 2025
 05:35:01 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20251027123601.77216-1-herve.codina@bootlin.com>
 <20251027123601.77216-6-herve.codina@bootlin.com> <CAMuHMdUicJjXkkNs7FhZ0-jyuv9pzr_Q0AZNXs7tiv-MBGTkbg@mail.gmail.com>
 <20251114125810.629e8931@bootlin.com>
In-Reply-To: <20251114125810.629e8931@bootlin.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Mon, 17 Nov 2025 14:34:50 +0100
X-Gmail-Original-Message-ID: <CAMuHMdXGjdqSfWnY6JrXLKiTS+wpQuphB+tW1RWoMskO3-MHGA@mail.gmail.com>
X-Gm-Features: AWmQ_bnSRNaycDrtFmwU2BRrd31X7UUoS4AupST9inXGj9lqsg7WOq47fOxQ24c
Message-ID: <CAMuHMdXGjdqSfWnY6JrXLKiTS+wpQuphB+tW1RWoMskO3-MHGA@mail.gmail.com>
Subject: Re: [PATCH v6 5/8] ARM: dts: r9a06g032: Add GPIO controllers
To: Herve Codina <herve.codina@bootlin.com>
Cc: Thomas Gleixner <tglx@linutronix.de>, Wolfram Sang <wsa+renesas@sang-engineering.com>, 
	Hoan Tran <hoan@os.amperecomputing.com>, Linus Walleij <linus.walleij@linaro.org>, 
	Bartosz Golaszewski <brgl@bgdev.pl>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Magnus Damm <magnus.damm@gmail.com>, Saravana Kannan <saravanak@google.com>, 
	Serge Semin <fancer.lancer@gmail.com>, Phil Edworthy <phil.edworthy@renesas.com>, 
	linux-gpio@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-renesas-soc@vger.kernel.org, 
	Pascal Eberhard <pascal.eberhard@se.com>, Miquel Raynal <miquel.raynal@bootlin.com>, 
	Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Herv=C3=A9,

On Fri, 14 Nov 2025 at 12:58, Herve Codina <herve.codina@bootlin.com> wrote=
:
> On Fri, 14 Nov 2025 10:04:10 +0100
> Geert Uytterhoeven <geert@linux-m68k.org> wrote:
> ...
>
> > > +               gpio0: gpio@5000b000 {
> > > +                       compatible =3D "snps,dw-apb-gpio";
> >
> > Don't we want an SoC-specific compatible value, too?
>
> I had added a specific compatible string in my v1 iteration but it was
> rejected by Rob [1].
>
> [1] https://lore.kernel.org/lkml/20250729181151.GA530390-robh@kernel.org/

OK, if Rob is happy with this.

(If/when needed, we still have soc_device_match() ;-)

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

