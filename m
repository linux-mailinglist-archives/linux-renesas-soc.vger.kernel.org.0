Return-Path: <linux-renesas-soc+bounces-18975-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 041F0AEF8DE
	for <lists+linux-renesas-soc@lfdr.de>; Tue,  1 Jul 2025 14:40:27 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 6F63B16E695
	for <lists+linux-renesas-soc@lfdr.de>; Tue,  1 Jul 2025 12:39:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B027E274659;
	Tue,  1 Jul 2025 12:39:40 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-ua1-f42.google.com (mail-ua1-f42.google.com [209.85.222.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 26FD4273D7F;
	Tue,  1 Jul 2025 12:39:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751373580; cv=none; b=QBxHC/06ACjqKMGyJa0npvkI1RFId8us7/PxH3yfuJQ1EyecVucuriInO7HN4gXmMfqB8Uo/gVjCFrpZlGGUUZg6wKOQ826/Q6tfYnfQKi5wt8IPdYRjzd1m5Lxo4QNd+dPQYkQ6yPuBQ3xVraAb+fNSbOKSvv8zBauKathSTBg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751373580; c=relaxed/simple;
	bh=WnkpxqJlREwalU2kiyF/pRQ2yr/YG9Wcammx70WmMJo=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=LEH4HUYNxPUxbihz1ukavGCxhxvP+F9+ZWI5/Ls8Hw28GxNaDn9S6eTamFFyLluCEfoNUdadXxvzsgkrwi8mIIZZflLAjYBjZwgVYbDkk+S7nF0EJaT8Af1u1cerYGjktm765B/70jXgBIvpJp/NmRScAXd1vj6QbLeq8xro86Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.222.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ua1-f42.google.com with SMTP id a1e0cc1a2514c-87ed3b792a2so611806241.3;
        Tue, 01 Jul 2025 05:39:36 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751373575; x=1751978375;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Huq13UwLgaodxR/+WGRy3SjFc14hPFMLTnsMQNvPPbo=;
        b=tpv48sdaMToThFGW7N/aD/soq2jue6oSP2e8Ogpmb+b3OdJ4jowf7/ah9ws+VmD5vk
         9hqesiKY7hQLVZRgq0RL/FRaWRJsj6rD0Lj2xPR+P0kZE+mQG37QRwM5Av6W8ONWPPUX
         McF6LbKRuxtmqnWWW8LeIHUCXSkjLzz/+O0YR2LItCCy2fMI7NEwmCpNjunPW6asbQBU
         SmB3tZ3lHuTNU3kaC9rnoxD6mX0w/2NUHtl3AoxRl8jJO9TcPGXPfAbW+8RiZqsshJHS
         kzg+r6s3lqZKhlUGotFa+NkMhgWq4Mfob/VtTLjAgZTpCtm0zecO/qoPFbL8xsbDj8o6
         7Uzg==
X-Forwarded-Encrypted: i=1; AJvYcCUA/uRxgLhvZexZRnyx/R19ypC57fBIILzx7skZF/t/yNikwvIoNo9GxXICSqgiGk+2rqugVNUxzeHs@vger.kernel.org, AJvYcCVcBqPQD9nsr+yh6cmIE9TFru243zdXBBeec/2tmCD63F48lD3PwglH/nlQG7AMi/Lb/SQMkq5/Yo9bidhC+2BMO9s=@vger.kernel.org, AJvYcCWP8cTOIVRv3CUHuIG7My1AmGz4ML+sIsiW0mc+l18NqeBaH+feQNFMchZBsQhMRGwVjvsm64OfzVmq@vger.kernel.org, AJvYcCXHttzRxddQe0ilhGN3+vC8HoC3Qt+YsAp8h4VkIbkCEWGx+pNPxKuwp/ZxLnyitFtum+FHrDSPhBleq26W@vger.kernel.org
X-Gm-Message-State: AOJu0Yz/sfuBIM1BlJAVR/dKt4Xr5aBo7JuUFZMdXcHlEQWDHE8jm1VI
	5h2pLNCAkZp3jvsp5pqjEgGl0SdffZuEkJ6RTE3YHvzoK9GP/jXFCsajgv2if/bM
X-Gm-Gg: ASbGnct7EWgcj+qtYIhGWJxCml5OqjU9++9sjxX3O2uiTPkP8WsmM4cd0MWZyTGLaB7
	MHzgw/LjzHA7ppRhrzmGn2coXv44v9e7Wj/vTWpUWVoiYnIgXRMBjVM9elwMv9vNTC/rrhaIVmq
	nLQS/uwE6rOF4rNEBVSPoD1sCmVWB0Dq9w4dyDa7M/6H+Gbx5SxfBmZy09ycbq9dDhaQezNE904
	82/i25/5Cfyo8cH27ZXEcyz3MU+9638W5MSM6JQ9BmGNo+clJ6gbhu6bp0cWIJfaYOt/gQHF1Py
	cjXJCUpuCM95t7uh5btPgWDo2Wo55NB/e+EJBxGwyZcO81VrKuEkRabZuATfATz7XUNXcCk7YXT
	DyyT5Rk03WJ7iZeutejJ5OOAx
X-Google-Smtp-Source: AGHT+IHjGZa0E1BPx1jrfqHgd/qEgd9WCYq+X3AEAG+9cOQ50ZcRgAChVL4/O3Bi8llhgZgUfCWAEA==
X-Received: by 2002:a05:6102:5717:b0:4e9:c773:dca1 with SMTP id ada2fe7eead31-4ee4f6d96fbmr11775196137.11.1751373574973;
        Tue, 01 Jul 2025 05:39:34 -0700 (PDT)
Received: from mail-ua1-f42.google.com (mail-ua1-f42.google.com. [209.85.222.42])
        by smtp.gmail.com with ESMTPSA id ada2fe7eead31-4efb032beebsm1092206137.14.2025.07.01.05.39.34
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 01 Jul 2025 05:39:34 -0700 (PDT)
Received: by mail-ua1-f42.google.com with SMTP id a1e0cc1a2514c-87f1b3a3e7bso709317241.1;
        Tue, 01 Jul 2025 05:39:34 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCUSv1azqxtOTbOurwBM1agK1LBzBbfBgsUqUz/sJPNJJS0rWQku+c0c/ulv7zhovjFO9MnAW0fcvdLf0Rjb0kGSVjc=@vger.kernel.org, AJvYcCUmQLwZw5DhBpmsYCtua2PEKdGi4y28tGqXCP63HrndejCFRnuUS3X85wbC3ZVjxSGYd7l5nVRZcC90@vger.kernel.org, AJvYcCVz7+GRGWhpFDmCcjDFxcZh5d8YECte0PrLP7nx0l/wePMIhyc6wJYTeQRyQ0sRa1QnQEwib+Jmzl/S@vger.kernel.org, AJvYcCXu394nIbP7SDru4MO6jZWLPhVNPP6tyZgt8NCMP35x5Mq7W29Tw5B9LpsTjI6Gns5y8tbHgqJo/sDzPJ4s@vger.kernel.org
X-Received: by 2002:a05:6102:e0b:b0:4e5:8c2a:fbee with SMTP id
 ada2fe7eead31-4ee4f7aca08mr10949101137.15.1751373574281; Tue, 01 Jul 2025
 05:39:34 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250627204237.214635-1-prabhakar.mahadev-lad.rj@bp.renesas.com> <20250627204237.214635-4-prabhakar.mahadev-lad.rj@bp.renesas.com>
In-Reply-To: <20250627204237.214635-4-prabhakar.mahadev-lad.rj@bp.renesas.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Tue, 1 Jul 2025 14:39:22 +0200
X-Gmail-Original-Message-ID: <CAMuHMdUF2D1Sg633KBeU5rEVdFM2dqK123dxwaPxEd2ewZaD=g@mail.gmail.com>
X-Gm-Features: Ac12FXwynkEynYzjgUPYUL-ZzZT87-jvZI3n0Ds_faNnK3-Hl5yU80S6Svta75g
Message-ID: <CAMuHMdUF2D1Sg633KBeU5rEVdFM2dqK123dxwaPxEd2ewZaD=g@mail.gmail.com>
Subject: Re: [PATCH v2 3/6] clk: renesas: r9a09g057: Add support for xspi mux
 and divider
To: Prabhakar <prabhakar.csengg@gmail.com>
Cc: Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Magnus Damm <magnus.damm@gmail.com>, linux-renesas-soc@vger.kernel.org, 
	linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org, 
	devicetree@vger.kernel.org, Biju Das <biju.das.jz@bp.renesas.com>, 
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>, 
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Content-Type: text/plain; charset="UTF-8"

On Fri, 27 Jun 2025 at 22:42, Prabhakar <prabhakar.csengg@gmail.com> wrote:
> From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
>
> The mux smux2_xspi_clk{0,1} used for selecting spi and spix2 clocks and
> pllcm33_xspi divider to select different clock rates. Add support for
> both.
>
> Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
i.e. will queue in renesas-clk for v6.17.

Gr{oetje,eeting}s,

                        Geert


--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

