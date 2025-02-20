Return-Path: <linux-renesas-soc+bounces-13432-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id DB438A3DFDE
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 20 Feb 2025 17:08:33 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 756251890A58
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 20 Feb 2025 16:06:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 30DE71FFC6C;
	Thu, 20 Feb 2025 16:06:20 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-qk1-f179.google.com (mail-qk1-f179.google.com [209.85.222.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 82CC11FF60B;
	Thu, 20 Feb 2025 16:06:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740067580; cv=none; b=Ov6LFRJ9H0Ka5UTKhBUsXcgQUYEDPGv4goN2p7Da+QBxnq25s3W2ypMCQ0XjBcD5kk7dE8rZvTI9ZbDFbIx24bc7Z/GGloNCq9P9AM3cZxUmzqwrkAaHwPDxHbZvRL9c4M93DOaYGmMY34VTOMiBfDELCRstBK4BEgKsa8vwQpw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740067580; c=relaxed/simple;
	bh=KmJV58XjM0H4Bi0GF4aCTXcJKt0E+QHiSK4dnhwVXDo=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=B7NWOhlK1wBh6Jvm3s4figUyKvfUPBt+EdjH7Gv10WQNmxJk2djDJbpjW0O9ttmSMAflMPCmqdyee1A2A3CS/nerpCKrNJuwR9vLy26fwEmyki3axG3kqdFyFxALYQqXDrFHS6wMEJkDPnsUrjK1Nqe/qYJAxErmARXyz0ZseE8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.222.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-qk1-f179.google.com with SMTP id af79cd13be357-7c0a3d6a6e4so100060985a.1;
        Thu, 20 Feb 2025 08:06:18 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740067576; x=1740672376;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=yB4cxeiL7TbiQ7GPlKRnLR7D+jnPJcOOYMBm3C+KPOU=;
        b=aPbTVJMzma8ZXz8EBiaVKQxALZZfgtel6LYEFP9VakL67AN8P+him9Hj9JtGtFaBLQ
         HIM9URx16/HjSqcV5DEd6jFu1yt3Njf+FiwUtea8DDpsJA/DJ9Lmy2MZ/oiWvM8hnqKg
         Z/AIbCZxUcEg3hVfeemO5c+Hg7lq+Ha5uwr7x1K+pQmApbLLOkeSLKPRDBRi3RxBhCvs
         5NbZRGudV3xZlUXAdJ6/dm3x+JQhxySqSc5Pl/30yFvT4V7MxkCtKHxLf/A6GDi/vv3E
         /N1itIMcmA9VBNXSei1bYiM5JVlsaFcOmAx/shT1OLK3RhCzfv3FSvkOUTWq4qaBD4Yt
         eE0g==
X-Forwarded-Encrypted: i=1; AJvYcCXJY35P4KSIaTOFGO6st1n7bNmY+ZyiewvcvuHGDmUQ0oneeey4D59p8yT8AlZZ0+wO3Eh6lnyJ478=@vger.kernel.org, AJvYcCXK9gXQkAWLNpOk49Hj//DkufHGYjak77pp1NknKkoMUZcbF1TwTNqXcXgWkCBvRrqSJh3msJ0r4X8RXEM68HHO8Tc=@vger.kernel.org
X-Gm-Message-State: AOJu0YwNeRufyhWXKKxeuwVd6vKXOOiRQmNrfgjPov/17K+uSspQGlrH
	fO+ghZPzAGd717Ex3yiP6368bxOIiDS3uBAO17mxr4FaMZetaRUvIs+sGdzx
X-Gm-Gg: ASbGncuare1ldXDxxYQTuMaqhRd3OdMEEHqkvoRuqSY9PQjtOgpOC0m+S49/j65Wto7
	ngyj0uNQSb8OPFTm4+P/UrCcwoEtHjySB1MQBWNEnPQFAIxfaRVnRaJQRQY4WTEZN2sK5UOkST5
	gmFwLUTiukAznaQ2oFpG8pRXcV7p602CPPM96bz4x6OlQ2seBqCc7i5bkiJ1gLo/u74BxFucOoa
	Meq6loHNIkyhoPZWIk4sKa07JqrnXckXisCANibQVugXm5bV6aEmz7S59SI+e5drGyrzloUR+nx
	P9+fWVk/awoOKItcsX1zltgDj3uP4MoB0+qq+QHpdgP1u6zEybtuqfDKzg==
X-Google-Smtp-Source: AGHT+IEIccqHyKqhNrBKfHoOdCHAerrHkXPWaPiX6si+metTOrnT06yQtyjLeRzwDmGLjopbFpRkcQ==
X-Received: by 2002:a05:620a:2442:b0:7c0:b572:f58a with SMTP id af79cd13be357-7c0c42a6bd9mr349933385a.17.1740067575757;
        Thu, 20 Feb 2025 08:06:15 -0800 (PST)
Received: from mail-qk1-f172.google.com (mail-qk1-f172.google.com. [209.85.222.172])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-7c0a45585f3sm427470685a.93.2025.02.20.08.06.15
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 20 Feb 2025 08:06:15 -0800 (PST)
Received: by mail-qk1-f172.google.com with SMTP id af79cd13be357-7c07cd527e4so97908385a.3;
        Thu, 20 Feb 2025 08:06:15 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCUpEHsMYMk6N27K8RqvtoNk5a9leXIEBbZf/u8GRkzg8//ElHg6AZIincVszE4PKmkSo6lXOKU5OjaTZucsQbuXhh4=@vger.kernel.org, AJvYcCUqh8tgnAvSBYKWUf4SN1Z6lhXX9ELWb9/wKi1vU17m0HRt6no/RYVS+X9t2Y8huefwOcTGqdY5Q6I=@vger.kernel.org
X-Received: by 2002:a05:620a:800b:b0:7c0:bc54:fa52 with SMTP id
 af79cd13be357-7c0c42a5621mr387647985a.16.1740067575069; Thu, 20 Feb 2025
 08:06:15 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250218105007.66358-1-biju.das.jz@bp.renesas.com> <20250218105007.66358-2-biju.das.jz@bp.renesas.com>
In-Reply-To: <20250218105007.66358-2-biju.das.jz@bp.renesas.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Thu, 20 Feb 2025 17:06:03 +0100
X-Gmail-Original-Message-ID: <CAMuHMdWAjCudnNjMS29biEheTxwYg+6BxO5ueVE7Lm4=apEm+g@mail.gmail.com>
X-Gm-Features: AWEUYZnoBoYabM9raemHFjg1li3IvBc9YPSqYQFbhJrvoMdAt7QId9fsA7S1s58
Message-ID: <CAMuHMdWAjCudnNjMS29biEheTxwYg+6BxO5ueVE7Lm4=apEm+g@mail.gmail.com>
Subject: Re: [PATCH 01/11] clk: renesas: r9a09g047: Add CANFD clock/reset
To: Biju Das <biju.das.jz@bp.renesas.com>
Cc: Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, 
	linux-renesas-soc@vger.kernel.org, linux-clk@vger.kernel.org, 
	Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>, Biju Das <biju.das.au@gmail.com>
Content-Type: text/plain; charset="UTF-8"

On Tue, 18 Feb 2025 at 11:50, Biju Das <biju.das.jz@bp.renesas.com> wrote:
> Add CANFD clock and reset entries.
>
> Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
i.e. will queue in renesas-clk for v6.15.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

