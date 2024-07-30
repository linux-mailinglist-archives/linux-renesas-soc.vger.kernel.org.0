Return-Path: <linux-renesas-soc+bounces-7617-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id B41D7940C1F
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 30 Jul 2024 10:47:00 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 35064B2711C
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 30 Jul 2024 08:46:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CE28919309D;
	Tue, 30 Jul 2024 08:45:56 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-yw1-f181.google.com (mail-yw1-f181.google.com [209.85.128.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A89C315622E
	for <linux-renesas-soc@vger.kernel.org>; Tue, 30 Jul 2024 08:45:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722329156; cv=none; b=ZBOQVGER2zdpTb2qM9t4Qo15NyzDY5jZq1qhSpoBMAJDm1I9h2KqoRSaj18sBJj/h9DYtQF5N/hOq+OqKsZe1u/g+Y9eT8WJ3FB6gw3oI+uA4QnWNF3/4BU9GRrLOl4adLQjFJbkaFnDrolYKj+MnDgjnzeKzFWqCwJvhc1SNag=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722329156; c=relaxed/simple;
	bh=yFOSwhd9cJivmr7GwRvtqaD7YJZJZRovi0qjQXAg9sg=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=f4ZkrJuSbgqS0CCEyBUg+iA/dx1cHbQA42rh0vwMxf8Mr8OIzo7gEcIxZlqwiW9yXoQwKZIga6PSFD6ew1KfABxWYFilZaOT4urKHlyya/gaolc/tj0Q2sMHyuOGb3+AAu6U3Q9GUQwLQNhbSJaV6qeNGcQRDDk8Jwz8P/09lQ8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.128.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-yw1-f181.google.com with SMTP id 00721157ae682-6519528f44fso28645367b3.1
        for <linux-renesas-soc@vger.kernel.org>; Tue, 30 Jul 2024 01:45:54 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1722329153; x=1722933953;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=J+PIJmV53Jj5gVivYOrx6jVq0P1AxA3gfcO8zhyG0Bc=;
        b=v/WZ/TtBqEt5MR0Vn0aA58d6Wvmnkz9eUK5UT13pdPiDjTxO1vzzZ28iTgXhRviHcz
         ZAYxgpQnem0HREnrQY/A0j+RIA0TLfOV1fGky6W637yFAiRpSrfR361bZpU3KTNRIvWl
         2bTcYgiVEReBKv/I44CyNIkwS4wboHRXQYiurKyLIng9mkzngUoCnFPZN9leJzHZzQjA
         ugTrQRzzLGoYmlMQVj8E63Ew724zXjcXt2U3OHqqFAhe+nE85RJLOYrnsi1qeQazWNsr
         x2y711G5fYmXjvMCmMQYY2IVGZlttEF71+eml0XBdQuG7GUChK2L5Vu4Q7k4AlWE6fZ9
         5lYw==
X-Gm-Message-State: AOJu0Yw6o0YSvu8a2IYVrHJB+wXx33VVbbic+OwV6WCDKuyI5sjhdDp0
	+V4rtNTHYPr/EZvAya6S/lFZvyxeksLcGtEieMHrP11S78DTP18ImM4Ttlo7
X-Google-Smtp-Source: AGHT+IEXJtP3RVHK2s5zpDJBqUwuUS1BBtoTxnC2kPqkv6Detohy+jq5WoP4F4VnKa8EwnlQfkRnaQ==
X-Received: by 2002:a05:690c:ecd:b0:63c:486a:289e with SMTP id 00721157ae682-67a09783c26mr144779237b3.32.1722329153354;
        Tue, 30 Jul 2024 01:45:53 -0700 (PDT)
Received: from mail-yw1-f176.google.com (mail-yw1-f176.google.com. [209.85.128.176])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-67566fc4a04sm24593077b3.6.2024.07.30.01.45.53
        for <linux-renesas-soc@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 30 Jul 2024 01:45:53 -0700 (PDT)
Received: by mail-yw1-f176.google.com with SMTP id 00721157ae682-6519528f44fso28645347b3.1
        for <linux-renesas-soc@vger.kernel.org>; Tue, 30 Jul 2024 01:45:53 -0700 (PDT)
X-Received: by 2002:a81:6ec5:0:b0:650:9d94:799f with SMTP id
 00721157ae682-67a07b77709mr116409927b3.26.1722329152851; Tue, 30 Jul 2024
 01:45:52 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240725194906.14644-8-wsa+renesas@sang-engineering.com>
 <20240725194906.14644-10-wsa+renesas@sang-engineering.com> <CAMuHMdVncvZT5q=eAdmjQqdHh-n4f4EJ+=r=JzFDr4cbHvSqWw@mail.gmail.com>
In-Reply-To: <CAMuHMdVncvZT5q=eAdmjQqdHh-n4f4EJ+=r=JzFDr4cbHvSqWw@mail.gmail.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Tue, 30 Jul 2024 10:45:41 +0200
X-Gmail-Original-Message-ID: <CAMuHMdXu=74hRkqmcaAQ1LfOVrYJ+Vt5Y3SU9mEC87-Pv-ySmA@mail.gmail.com>
Message-ID: <CAMuHMdXu=74hRkqmcaAQ1LfOVrYJ+Vt5Y3SU9mEC87-Pv-ySmA@mail.gmail.com>
Subject: Re: [PATCH RFT 2/6] clk: renesas: r8a779h0: Add TPU clock
To: Wolfram Sang <wsa+renesas@sang-engineering.com>
Cc: linux-renesas-soc@vger.kernel.org, Cong Dang <cong.dang.xn@renesas.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Jul 29, 2024 at 8:39=E2=80=AFPM Geert Uytterhoeven <geert@linux-m68=
k.org> wrote:
> On Thu, Jul 25, 2024 at 9:49=E2=80=AFPM Wolfram Sang
> <wsa+renesas@sang-engineering.com> wrote:
> > From: Cong Dang <cong.dang.xn@renesas.com>
> >
> > Add the module clock used by the 16-Bit Timer Pulse Unit (TPU) on the
> > Renesas R-Car V4M (R8A779H0) SoC.
> >
> > Signed-off-by: Cong Dang <cong.dang.xn@renesas.com>
> > [wsa: rebased]
> > Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
>
> Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
> i.e. will queue in renesas-clk for v6.12.

Postponing this until it works.

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

