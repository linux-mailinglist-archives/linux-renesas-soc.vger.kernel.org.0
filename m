Return-Path: <linux-renesas-soc+bounces-11387-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 0A3449F3312
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 16 Dec 2024 15:23:32 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 646EB188A707
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 16 Dec 2024 14:22:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BC5A620629B;
	Mon, 16 Dec 2024 14:20:30 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-qt1-f169.google.com (mail-qt1-f169.google.com [209.85.160.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 343641EEE0;
	Mon, 16 Dec 2024 14:20:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734358830; cv=none; b=pAC+oMJ8+HIehZZnsIrA6/oU09Qd8I8EotYU6Jo/8ZrM2j7I5b0rKu7FeJ2toIYcSk519vwb5nTp0zDBvwzf3SFf/M+z9GBHuIHRfzijGI4EU5k6n0rWqubZwPYZNV7rlyDXwAQV5KxB53QL2QXskJyc8CzZGwB8pnxfceiIWeA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734358830; c=relaxed/simple;
	bh=Qf5v39sYgnt99EVEhFQvt2Al6R3xR9FJrQS1YSIxcA0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ADyxD21qqCUfPt7jRuPEk4MVRNmjdfXSHBuWtJO6RX9+3hsu2zNXBwIrqsTEWYgc8QKB7MBwe/SJ9qWKZJN9lCvhfuBgfTeNS5xWWw/MjeIrsOeULCSEipOFWWJIBrXDhJrokjPs3SpYUuGzi190sTfmbCTBFeGS6lKi3M/Yauc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.160.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-qt1-f169.google.com with SMTP id d75a77b69052e-467a3c85e11so20719591cf.2;
        Mon, 16 Dec 2024 06:20:26 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734358825; x=1734963625;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Z/MKJqh549rSWgCtH63tzgCHvR/0wJsqjq3226yxhUQ=;
        b=buCoAD26LDXDruEuZHtVUFbfAuUTruWpLle3ZtIsPpTm70gtApJH/FFtY69jf7mGlI
         FdSPg0mpeSiSaa0eAAENGzYqOF9+Rk7iRZgBLj11et3SW7Qh8PUvyxHrOgkHqClGNzfp
         3sYMZdndWSJyYavipCqmZ7EBla4ywCH+SFPW0d3fIGFmWg0ZaP5R4G+/0JQlYH5G0nFO
         htGFqnaB0rGeXKvM20bDYPsPgBVgzgbSIbCFNucpR4Iv4M2uuz4uwWJvYULxsHFCUAho
         k+rG+9zh1GBuGhFCdvFN2vkdDEukA9FmFbJfl8V0byYYbquQ1hDiftMXiZ1GZV5YfNWL
         212A==
X-Forwarded-Encrypted: i=1; AJvYcCU0z2uhRukbV2qIhG8smb8JvlNU/spESRL6msHD2Ygn4gaLBOAx5hwVSpEg44xdEBx2bQuB5O3AZcscqDgKfJSK5jo=@vger.kernel.org, AJvYcCXrtQgUCizyjQMvfJZm79m8Wvj2wqSj8DW0EQyKi8CB/H5lVYbngDBBILpOhwM5tLX8KlVFfbLxzCo=@vger.kernel.org
X-Gm-Message-State: AOJu0YxBFs/0wedeFVdfWwIciZGLy1sVbcBEyuNLEiqCQnoodji2mjhR
	ohzYgkwHS5SO1JYdoW5mSZKUyGSeM8f93AGh9eFcGXVAwxj7h4iZ1NzhBRFR
X-Gm-Gg: ASbGnctSh130cE6HqGAuouIqlLiYHKrojuHj65vZ1WDSScnzlHAp41V156hrrqHdJdb
	PAYdERR8A8/wTctmdidzksN8XvI+sQpeZPIjEgKPBh2HnnSJnxsaPwYQ4fmrPleTD/1pYvP+VdE
	Hm+I1I348MmYeZQuDbABgLiNB4Jj7GPWJ++jMJWbZw2/t9fPwIEtOTYaQXk4X/0VhgIxa7zVVs6
	W7VSEAusP1NIB5zjsVj9z32HWhBAnlP4WvU2PBQE+NyjRzgw/0Iw4KXyS2ofMNq7w8Hhi+YiNFH
	2wwjAOlCDQSu/GiW/9A=
X-Google-Smtp-Source: AGHT+IEHmbTERww89TiSZJDx9Vm07uU3JdsHAuYEgtVTPO7F/0VYOULXLwBsQdWm9twFoQvXIwzJZQ==
X-Received: by 2002:ac8:588a:0:b0:467:54e5:ceaa with SMTP id d75a77b69052e-467a5721b7fmr236804511cf.9.1734358825532;
        Mon, 16 Dec 2024 06:20:25 -0800 (PST)
Received: from mail-qv1-f42.google.com (mail-qv1-f42.google.com. [209.85.219.42])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-467b2cbb473sm28203611cf.36.2024.12.16.06.20.24
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 16 Dec 2024 06:20:24 -0800 (PST)
Received: by mail-qv1-f42.google.com with SMTP id 6a1803df08f44-6d8e8cb8605so23263546d6.0;
        Mon, 16 Dec 2024 06:20:24 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCVlmvxE+IuylTsiLuzcXopalY2CPV9bdGuTTraGsRGltCBk/Ambt7NhxBgDbusQO0s1DugGytcXJvc=@vger.kernel.org, AJvYcCXcPoCe7AzmgThQfMMEdglpJfLjG38j5Zzh09DlXpj0GP26lwMiZ8up7xZBK4PCdjyjTtMaRHoacmjgsom3CePN7qg=@vger.kernel.org
X-Received: by 2002:a05:6214:2426:b0:6d4:1b2b:c82b with SMTP id
 6a1803df08f44-6dc90320658mr258152236d6.38.1734358823875; Mon, 16 Dec 2024
 06:20:23 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20241213123550.289193-1-biju.das.jz@bp.renesas.com>
 <20241213123550.289193-2-biju.das.jz@bp.renesas.com> <CAMuHMdUoYYdLmQkcRbiVgKcWmozqCGnjr7_D2T7fXz=szM1Jtg@mail.gmail.com>
In-Reply-To: <CAMuHMdUoYYdLmQkcRbiVgKcWmozqCGnjr7_D2T7fXz=szM1Jtg@mail.gmail.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Mon, 16 Dec 2024 15:20:11 +0100
X-Gmail-Original-Message-ID: <CAMuHMdVk0mmgNYZAeDufUAmEX0=vYSNXGEcznaCTuJ3PX3ubGg@mail.gmail.com>
Message-ID: <CAMuHMdVk0mmgNYZAeDufUAmEX0=vYSNXGEcznaCTuJ3PX3ubGg@mail.gmail.com>
Subject: Re: [PATCH v3 1/3] clk: renesas: rzv2h-cpg: Add MSTOP support
To: Biju Das <biju.das.jz@bp.renesas.com>
Cc: Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, 
	Magnus Damm <magnus.damm@gmail.com>, linux-renesas-soc@vger.kernel.org, 
	linux-clk@vger.kernel.org, 
	Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>, Biju Das <biju.das.au@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Dec 16, 2024 at 3:18=E2=80=AFPM Geert Uytterhoeven <geert@linux-m68=
k.org> wrote:
> On Fri, Dec 13, 2024 at 1:36=E2=80=AFPM Biju Das <biju.das.jz@bp.renesas.=
com> wrote:
> > Add MSTOP support to control buses for the individual units
> > on RZ/V2H.
> >
> > Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
> > ---
> > v2->v3:
> >  * Updated commit description as adding MSTOP support
> >    for RZ/V2H first will ease backporting.
> >  * Added missing MSTOP data for SD{0,1,2}
> >  * Replaced BUS_MSTOP_NO_DATA->BUS_MSTOP_NONE
> >  * Added idx, mask variable to struct rzv2h_mstop to simplify
> >    the code.
> >  * Started setting initial value of refcount with the correct value
> >    based on the clock's current state.
>
> Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
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

