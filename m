Return-Path: <linux-renesas-soc+bounces-11018-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 7B99C9E6F49
	for <lists+linux-renesas-soc@lfdr.de>; Fri,  6 Dec 2024 14:29:12 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id BD89218871A1
	for <lists+linux-renesas-soc@lfdr.de>; Fri,  6 Dec 2024 13:28:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7F98B20767B;
	Fri,  6 Dec 2024 13:28:21 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-vs1-f49.google.com (mail-vs1-f49.google.com [209.85.217.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7A235207669;
	Fri,  6 Dec 2024 13:28:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.217.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733491701; cv=none; b=LJG55KxOnB/kr+UChV3qEtA5WhlvssWXc+h0b8CRLdkqJleuhEGsAdBxOhA+Ilt+/b3wDahJ5J8WmAFMqS/J6kiWjbfO2CfYBHXxsG+jV0KrvDZ7WejojVTejsnfRZlsz4RXYn5o8u3mkEFGUHolN8H3Ou1ngxBp+WEWL/3EDJk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733491701; c=relaxed/simple;
	bh=lvgWX8/njdPoFtghd5BcqAc4V4QZT2RZDpqhv/SIlkU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ZCjwSN0l4OwhRbyoLNNXu41vNY28MLDwbBy7UYMD8F5PgymkrJzba5/qc4AiqYni79tDdtGCyrOvpOOEKQk/FhA3lztPVQsMd3LEyiEA1SZ1lUlPlzzphla/Ioi3whtkJl5qBc7fQ3vxq6Ty2/GkrO3b9HPj5tACSdZ7/Or1rWQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.217.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vs1-f49.google.com with SMTP id ada2fe7eead31-4afac826ab6so538367137.1;
        Fri, 06 Dec 2024 05:28:19 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733491697; x=1734096497;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=lRo2MrQnolPQb96bWYBhAhxwNZNgIyN/5SUVcGO6HO0=;
        b=APYYuuUn3e1lWEGBDgaIUkdh9UwviEB+iNJapQhabZrvlbPGC/nOWk1sfZkLy9Sc4j
         ykLJlvHGorI8MyUpWPAVxNJQbAbB+eU2CWHgVbb0PcQCx1ZL7fE9sNCsUJA8Cw7XrRkx
         VoWiwQjzCKE/RbWI//GGbQffZyf85U5CIm0GvhUPwVOyhALtdz1fSbXIn2kbViUQTOd1
         4xgemzr+Tq2tXOpZ1LbTazXH5Gzd5qF1aRqdMyvW/jkcs58RWDYpulenmgtWoXsZcfcP
         hCJhyp7956jqqvtPqlsZ/YqfSl6d3jkgTbwQWG7z9NV0Io+DCDzK6TjbEO1WzgvBaS9v
         osoQ==
X-Forwarded-Encrypted: i=1; AJvYcCXV4zTO/Ff2q0OXofGgiws6d8twmP6fnZpTSVaf4Gu3P6zQVW/ZyI98mpUxFEh3W0xlasttNQPoHlE=@vger.kernel.org
X-Gm-Message-State: AOJu0YxrWg3fVAgfUJzTfWFXMzHepam09qKAKzwug8sURo3HwjWPLkjf
	UrnjrTLxzTtb+j1RpaJ+R5gsgAEvFwH9vFYTelZWSrcyE32Knm9j3NcYz0Pi
X-Gm-Gg: ASbGnctzWys6AI+06UHN9JZKwleoLFwA0LxeuIndv/gThC45CmDg0UCeOkTZn6lmr5l
	dewHQ+q1oc2D3I6ZPvDaFY2FrKDINAVRNv8EoC69tYoGUznGxV0dLHwcOSTdnci4XfRBv27MqOh
	7ee7xXOkAEOu7nW5xfKCfT6qTdijNgrIrOIt+cvUK1MSWrCz+W2ftdqIENMywfe0vi0pGfri3ZO
	Ckr7RxnLZsBZVTbzJo9TXsxdNaU+9f/kbFtMcGr7Q4skjeF+He7+UklC6jDwKjwTXyFeUpKnF2M
	YN43kFIPLtYg
X-Google-Smtp-Source: AGHT+IGOdPoLzxhGLYQxefOy9KeCV6lcUQQA8e99oO7qaA9tY0ztJ1PNyPFrjeEREZmvUTrHAgnJNA==
X-Received: by 2002:a05:6102:304c:b0:4af:bb06:62d with SMTP id ada2fe7eead31-4afcaa1b40bmr3333981137.11.1733491697659;
        Fri, 06 Dec 2024 05:28:17 -0800 (PST)
Received: from mail-vs1-f46.google.com (mail-vs1-f46.google.com. [209.85.217.46])
        by smtp.gmail.com with ESMTPSA id ada2fe7eead31-4afd5ee97ecsm68084137.12.2024.12.06.05.28.17
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 06 Dec 2024 05:28:17 -0800 (PST)
Received: by mail-vs1-f46.google.com with SMTP id ada2fe7eead31-4afd4b5b3f6so130763137.0;
        Fri, 06 Dec 2024 05:28:17 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCUPaZQHY2LiE8zQIuk3a6avR2cdPl41zQLrHPImKaMW2QjZQajpkrKoLlUS+z6I3BqVPDbVZXvmjF8=@vger.kernel.org
X-Received: by 2002:a05:6102:304e:b0:4af:3fc1:e02 with SMTP id
 ada2fe7eead31-4afcaaf3ac0mr2967442137.27.1733491697058; Fri, 06 Dec 2024
 05:28:17 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20241128091113.24116-1-wsa+renesas@sang-engineering.com> <20241128091113.24116-2-wsa+renesas@sang-engineering.com>
In-Reply-To: <20241128091113.24116-2-wsa+renesas@sang-engineering.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Fri, 6 Dec 2024 14:28:05 +0100
X-Gmail-Original-Message-ID: <CAMuHMdX7Zd8t_mpHNmipbgquc86iwnOK6EtRhfe8sx9OMsCBUg@mail.gmail.com>
Message-ID: <CAMuHMdX7Zd8t_mpHNmipbgquc86iwnOK6EtRhfe8sx9OMsCBUg@mail.gmail.com>
Subject: Re: [PATCH v2 1/2] clk: renesas: r9a06g032: add restart handler
To: Wolfram Sang <wsa+renesas@sang-engineering.com>
Cc: linux-renesas-soc@vger.kernel.org, 
	Geert Uytterhoeven <geert+renesas@glider.be>, Michael Turquette <mturquette@baylibre.com>, 
	Stephen Boyd <sboyd@kernel.org>, linux-clk@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Nov 28, 2024 at 10:11=E2=80=AFAM Wolfram Sang
<wsa+renesas@sang-engineering.com> wrote:
> The SYSCTRL module also does reset handling. Start supporting that by
> allowing software resets which can then be utilized by a restart
> handler. Finally 'reboot' will do something useful on RZ/N1D. Watchdog
> support to be added later.
>
> Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
i.e. will queue in renesas-clk for v6.14.

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

