Return-Path: <linux-renesas-soc+bounces-11386-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 047AF9F3303
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 16 Dec 2024 15:22:37 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id F0D2A188AE03
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 16 Dec 2024 14:21:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2C355203D42;
	Mon, 16 Dec 2024 14:20:02 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-qk1-f181.google.com (mail-qk1-f181.google.com [209.85.222.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 67A1C17993;
	Mon, 16 Dec 2024 14:20:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734358802; cv=none; b=Tc4Cie3XG1JgAzUNU+Q6vRxwK7PDHydrVmNKkkM4QvWvxI5j6h0alTKwao4VlqUKbXC8LkAOYC6+HH+ixTxYQfszSK30rLNU0LjCes3fvc6eIdseKZTmMFnd/XBMmEk/jrnLWY2OQBsL9kPoyhfNQQ0Fc3ISTtMnJRf7Jxf5fqY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734358802; c=relaxed/simple;
	bh=KmIliMh9DHajbXgG4fpMb2hw4c8Pc4wiYR4Qk+H8wWg=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=b5gQ9Eg3PZ8SfmWsCN+W16wI2R5lTFjLD8lwTDUggz4HNBa9Jk8vWN4Mgv5Q9WF0l1s0XLxreViLo9fdlrh6EVfRNm/aKRqUHxQ+YRBkLX8KXD7ZvHtmz5bkeSVtC5jUPmOROTU0LMidgGgJLAHxiRzT7nwkSW78c9crho36LKc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.222.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-qk1-f181.google.com with SMTP id af79cd13be357-7b6f0afda3fso446815085a.2;
        Mon, 16 Dec 2024 06:20:00 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734358798; x=1734963598;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=pAF79hhieIGfORkv8j3LnXlIbdxq713cpZadhWZIRkM=;
        b=SPFB+aCytdNH+Zrlo4tfd1BeyWmok3JYiy7U70n+H5LX8zaQY3uJlGBMciDE+RowT1
         sVMDbIk48hZ9UJOp0tM3IiMUb0npvpv+G/KxSzzFSonS4PGsUQy2Gf8rXBmghN4ZsB9g
         TegNagV1353RZPr2VpRW+bsmxe/yqVqRdAaOah2e0e4fnORE+4mtEZ35b2g0+lyAfVAJ
         QSXQZE6b1I6CJR0FJwN2y0gWDZQUttTeJ+hQ1/4kqxdZUVjlKAkf1pa6PZZP05gbSidr
         ea4weKU9cOasB7N/CR0WeQwukAcuxm2ftoZelusUVK5LQDjCFcFhzDW2ep+dQMZ+m+G0
         R1yA==
X-Forwarded-Encrypted: i=1; AJvYcCU5ApxdiPojAOCSzhoH9QMd+eTrsrsUS6cuWcNtrvWcRJQMao0kiErzsJ/wAXN/xbfdaSdr1mdED5uWlsdx3hFBMao=@vger.kernel.org, AJvYcCX/UkUSYnT9t21LWEsE8pzQRYyN1mtx8IjIf4PAV08zxM9+xr7uqRuEy+L0dJMsgmvOcHfimDxsz6k=@vger.kernel.org
X-Gm-Message-State: AOJu0YzyAW6ezRFvk6qTZh3Bk1s6CQVjIEGK0kTfpa0Y/bUOvtBzVA5y
	69GMuVsZffX2MdDMacau4L+x5V6OqrfZttjIXsFUJJsJo4+ObSP7KzPUpzt5
X-Gm-Gg: ASbGncv6oTHCEAEJmJ2zqn+TZkyHgmgtik1P5lCsAmdWsYX9LU8WLZ8NtCG4qAViOgo
	iyscwQTADMf7zkpidjIFYAu+aawtNj16zlKBWuYTkkyMWjBPan04wSz0Yg/C8kYM1C/qdryXTLf
	+/RkLPcSNgaV2nyJfDgXb4ycrmSWro4D+8pRJHiWepcHbxkKUrXZqM3mfbGXerO5OYCSk2n/GNL
	j/WUr4SO36LwlnCZbrnQeDxk70s8byLPcoukKiXFq6yYb6W800UHYwiIFc/aivkWifv835NqvTI
	y0eLligTe7OJ7cMxvcGf7Fc=
X-Google-Smtp-Source: AGHT+IFSFpGocC2NKZl0N51JEJOOlyZG35vQu5DZvbRIcvChQPMVtkSLJe5RZlzAyD0XukXM0J0TdQ==
X-Received: by 2002:a05:620a:2955:b0:7b6:c93a:7f2f with SMTP id af79cd13be357-7b6fbee7fb9mr1749755285a.14.1734358798420;
        Mon, 16 Dec 2024 06:19:58 -0800 (PST)
Received: from mail-qk1-f174.google.com (mail-qk1-f174.google.com. [209.85.222.174])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-7b7047ee680sm227335585a.58.2024.12.16.06.19.57
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 16 Dec 2024 06:19:57 -0800 (PST)
Received: by mail-qk1-f174.google.com with SMTP id af79cd13be357-7b702c3c021so197219085a.3;
        Mon, 16 Dec 2024 06:19:57 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCVIs7h76YtzxePQgPjU7cqZSwxhPvMsCIrN++bKybMzLTc0ARis1Ss22BtdwKXaUctLcBb7TaKjZYM=@vger.kernel.org, AJvYcCVOifuUnXJ9tr7Dcg6Ze9ACKzPLwj2zGj4MFmiP9Qakof+/VC6m7WJRoebaDxGx0Km4h7ND7MY7eiTscLQxdM/vhAU=@vger.kernel.org
X-Received: by 2002:a05:620a:438b:b0:7b6:6701:7a4a with SMTP id
 af79cd13be357-7b6fbf4536emr1946616385a.53.1734358797238; Mon, 16 Dec 2024
 06:19:57 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20241213123550.289193-1-biju.das.jz@bp.renesas.com> <20241213123550.289193-4-biju.das.jz@bp.renesas.com>
In-Reply-To: <20241213123550.289193-4-biju.das.jz@bp.renesas.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Mon, 16 Dec 2024 15:19:45 +0100
X-Gmail-Original-Message-ID: <CAMuHMdVJ8K9GjwMVYUaUxOTU=TX9t4M5BBXfW7CHJWBgFyEXsA@mail.gmail.com>
Message-ID: <CAMuHMdVJ8K9GjwMVYUaUxOTU=TX9t4M5BBXfW7CHJWBgFyEXsA@mail.gmail.com>
Subject: Re: [PATCH v3 3/3] clk: renesas: r9a09g047: Add CA55 core clocks
To: Biju Das <biju.das.jz@bp.renesas.com>
Cc: Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, 
	Magnus Damm <magnus.damm@gmail.com>, linux-renesas-soc@vger.kernel.org, 
	linux-clk@vger.kernel.org, 
	Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>, Biju Das <biju.das.au@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Dec 13, 2024 at 1:36=E2=80=AFPM Biju Das <biju.das.jz@bp.renesas.co=
m> wrote:
> Add CA55 core clocks which are derived from PLLCA55.
>
> Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
> Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>

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

