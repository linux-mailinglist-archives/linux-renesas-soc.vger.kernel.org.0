Return-Path: <linux-renesas-soc+bounces-22147-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 22777B9198A
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 22 Sep 2025 16:09:45 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 8AB47424F5F
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 22 Sep 2025 14:09:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6810D19B5A7;
	Mon, 22 Sep 2025 14:09:15 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-vs1-f52.google.com (mail-vs1-f52.google.com [209.85.217.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 775081990D9
	for <linux-renesas-soc@vger.kernel.org>; Mon, 22 Sep 2025 14:09:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.217.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758550155; cv=none; b=cyE0aWmq50dZW2Co0h5bJ19fRbCSRvyh1Q5KK38IGSLVGXaglgJiota2ag7yQ2S8rm6MfPch8S87vYfeX+inz8RjlRZavfiZ3TZ1h2rel+YU/1z0jx9sYnOt0Mf2YpEZvxc4lbOFxHYbxxP8E8T94kK9gndND7/Ot1G4rQYgTGQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758550155; c=relaxed/simple;
	bh=c5oVqsPoTa3VSn3rF+3vlXIawS3iS9jeZUv5xAHbhIM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=rgY3MIV/Y0w2d84cstC8tsIc8ny3TuEh+5MCnW0W6UgrEbUZSZnSQl7z5zn8Y7BLQ3KbBDpMeXmWLCGqKVM5GghGe0t3AiXVaVEGD3SigYFiW9nKo2GdmmCqAxxT82+K+LpFvyU9PmSYvZKPUlNruwo8fnUblIh97HVMumIkfYU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.217.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vs1-f52.google.com with SMTP id ada2fe7eead31-557a2ba1e65so3763124137.2
        for <linux-renesas-soc@vger.kernel.org>; Mon, 22 Sep 2025 07:09:12 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758550151; x=1759154951;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=9myguoJ7hjvRqUVutV6ImQsg8/m76or1A6XOg+N5HvU=;
        b=OB8yW7OuwBLrNPvo+aV747TH5U8AdY2MarLqnNF9R4Ed/ZaorSRKkbSSir6pKLiRBq
         y8Tnev7mOkqIUgphyK6QFsAB8Qb32Fon2TRQstvhZrfb2wR4BrY6ykPlNdwsRLyyPvoA
         WWcNYpNX9d8adEk/TWtAlYN0fYHzcSDYczchkrSSHv7S31QwPysJZCqCpjOI+ahOb1Qi
         cyYxaC+IyNrslcKr1RLJBIk8CLDLCuwwtvGtORSpmK5pROUJ1oiqPYhACprHJvHL9/pU
         Zw7zvaVOEdkU57yWUPXVhlXGkHJecYzjBh1dQAg4q/hvEWcjaNJV1XpRkuvRxtUoccj8
         jd1g==
X-Forwarded-Encrypted: i=1; AJvYcCXLwP4YQZ6I2pLJVcqASsIM6GMlb8VAyKHQY6W1RJ+FaDftm36LlYHzvE9QdxjuaTLpwHTDEqtyfoJJqScgbr1ZZg==@vger.kernel.org
X-Gm-Message-State: AOJu0Yy4QmWN9Qxld5bXDLckpfN6Oe1uLcazMD6+JrSTIZwL7/oRCp39
	brSxfL7tZEWTObRkBfPXNL6t8QHDxFHwBa1XqwGKYG6puQRGfvALs4D9C3KZj2hO
X-Gm-Gg: ASbGncsSGsy63omUxDeYCZeg+Z/yb8bZi1SSUO1y3BIudB1W00FEUKM1Op6l0i/J0i6
	Pxp5gidsjIxmtwmKqUWSBZ6K9nlyp/UnMnd++ynJv8GD4p7pYlFqRFaQdty46IsfZ8XFrKbkNJG
	3ZSFFYUAR8ygUm4jB1zouQiGSG/1KebWDw60bMI5WLlJdsBbDAHl0T/CUJ+1Y8pjbUYC2wK0YPP
	b6RJVedgR4Ny4qdbrkY7PKHCERz285Ow75x8o8xm+wVLxmiYxxUf5Rhos/WAdsTA5vrLYFXfp5f
	r/msFfKDoIK89j3UJp2c6cGIPK77+X9Y0ayloAPp/p29264ysNVhNEUp4Q+SeP4OTW7KeMr2lea
	+qwZYe6j/X4ruqLwxPJ9X81AeT3ByXcZkmyut6cSdrDJbTayZHOoa+CxYhEPu
X-Google-Smtp-Source: AGHT+IFAFiFMvauyvnrzIbwSC4Wq0fIK9rH0rEWLt4fAslY8hbU9aIwfDAfYJMiLUNzCvIPlrLKySw==
X-Received: by 2002:a05:6102:4244:b0:5a2:668d:f20b with SMTP id ada2fe7eead31-5a2668e027fmr1064546137.16.1758550150533;
        Mon, 22 Sep 2025 07:09:10 -0700 (PDT)
Received: from mail-vs1-f47.google.com (mail-vs1-f47.google.com. [209.85.217.47])
        by smtp.gmail.com with ESMTPSA id a1e0cc1a2514c-8e3e7fe91bdsm2284752241.21.2025.09.22.07.09.10
        for <linux-renesas-soc@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 22 Sep 2025 07:09:10 -0700 (PDT)
Received: by mail-vs1-f47.google.com with SMTP id ada2fe7eead31-58de3ab1831so1726054137.3
        for <linux-renesas-soc@vger.kernel.org>; Mon, 22 Sep 2025 07:09:10 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCXdJ0awPQwGt1Jq6KnbEYX3Z67e8c97BHKmZPWacA9DVCMOvzBwVev8R5y5ps2rUxX1qxBr6IAtYFu58D1vldCjSQ==@vger.kernel.org
X-Received: by 2002:a05:6102:c0f:b0:57d:9305:63de with SMTP id
 ada2fe7eead31-588e0e89e45mr4003349137.10.1758550149618; Mon, 22 Sep 2025
 07:09:09 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250918030723.331634-1-marek.vasut+renesas@mailbox.org>
 <CA+V-a8sjPx8U+MB3v-SxErRPqbz4irAgZhCvd5CHY=6uO_VoyQ@mail.gmail.com>
 <353db156-e518-49c8-96ac-bd138ee64a01@mailbox.org> <CA+V-a8sLxBq8vSuq2HxcchpLqyQxqTRtkWjUKsRN9tBqGhU7mw@mail.gmail.com>
 <9dbc6022-eb97-49af-bda7-1a7a8069609a@mailbox.org> <CAMuHMdWuCyq+jXSasGdrMOSBP-XmDG-wHsBaXUMTGA3mtq_C5Q@mail.gmail.com>
 <aNFVv_n7y-ZmblX-@shikoro>
In-Reply-To: <aNFVv_n7y-ZmblX-@shikoro>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Mon, 22 Sep 2025 16:08:58 +0200
X-Gmail-Original-Message-ID: <CAMuHMdV7QvQFs_wXYy5B8fyO_TT2-ksHtfRKQXrhe3ouQpJALg@mail.gmail.com>
X-Gm-Features: AS18NWCrW3QxDjpWptl-dOn2GBYoJBw9An_ElV0y7JonoSEdT_C1EiUOZKFlSZM
Message-ID: <CAMuHMdV7QvQFs_wXYy5B8fyO_TT2-ksHtfRKQXrhe3ouQpJALg@mail.gmail.com>
Subject: Re: [PATCH] clk: renesas: cpg-mssr: Read back reset registers to
 assure values latched
To: Wolfram Sang <wsa+renesas@sang-engineering.com>
Cc: Marek Vasut <marek.vasut@mailbox.org>, "Lad, Prabhakar" <prabhakar.csengg@gmail.com>, 
	linux-clk@vger.kernel.org, Michael Turquette <mturquette@baylibre.com>, 
	Stephen Boyd <sboyd@kernel.org>, linux-renesas-soc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Hi Wolfram,

On Mon, 22 Sept 2025 at 15:57, Wolfram Sang
<wsa+renesas@sang-engineering.com> wrote:
> > So e.g. MSIOF has synchronized resets, while I2C has not, although
> > both are connected to the peripheral AXI bus...
>
> Is this why we need 'read_poll_timeout_atomic' in 'rcar_i2c_do_reset()'
> then? I have never received a reason besides "HW engineers said so".
> This is pre-Gen4, though.

Perhaps... IIRC there never was any mention of "(a)synchronized resets"
before.

Can you trigger an issue by removing the polling, and does Marek's
patch fix it?

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

