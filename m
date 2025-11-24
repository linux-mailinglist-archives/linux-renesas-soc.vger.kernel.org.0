Return-Path: <linux-renesas-soc+bounces-25079-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 379DBC80F90
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 24 Nov 2025 15:21:24 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id CBAA03A77E6
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 24 Nov 2025 14:21:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 70FA830EF6E;
	Mon, 24 Nov 2025 14:21:22 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-ej1-f51.google.com (mail-ej1-f51.google.com [209.85.218.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C0BCA30C63C
	for <linux-renesas-soc@vger.kernel.org>; Mon, 24 Nov 2025 14:21:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763994082; cv=none; b=ArDDuuuR3Au/MG/ssxUYNkpcykFIssWbERmRmbwsLgsrivF1qE+nOW3mv2dVOPX4oyzXpfm15NVWSTYFZHJkyn1GY3KlRc9OnsR1y/ZVRD+lj+ZsqTqo8KRKiUQP42MzusLTfyy0/eVUWbs/XeewtYNFDS0OJQO0GYwOOOgUj5w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763994082; c=relaxed/simple;
	bh=dCfY/5dMEkVPjD6YAtXB+73QblfC2Qoexi2JBaX5Sok=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=uvpvxkWnZAcYRJ4HjkiKTo/H4dWoKLeaXMp3C841+Y+G6BmQiZMM0WuTeCTKP0lcjoq+nl67zixFg0VbawOPDVHzVvK75HhqGpnB5tcFnOmxfHwKphi7VRhEz+TJ0GGIb6KdEvJSDAXfJ+Z4o/wiuN7uknP5YgnI3erzISlFWP4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.218.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ej1-f51.google.com with SMTP id a640c23a62f3a-b7373fba6d1so693989866b.3
        for <linux-renesas-soc@vger.kernel.org>; Mon, 24 Nov 2025 06:21:20 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763994079; x=1764598879;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=YUFSLiAWL8OVw+Y8TYrXfAUgXhJH/5VJkp3fvGhEutY=;
        b=tbqYRtg0HFYqTN5+7Jb4h3xKoWuZvNE/wdWJrQNzAMZ4Guh59pvDqPErFrDlgvXRr2
         AhItQKfrgbnBmAXg0uIXuQ0yUgDemOYnqHw+71lZw+d8PgwjGbp+LjwCjr9BxT4AuYTE
         d9TE3xrC5lkEGUiv9hSR/5yNrXtPUGmWAnXJEqpw4dZgrgaj/WBU8TqVNgu4J1mP8EOi
         N8LscYeIJ8YO7TTWh175Ekuob/ju+S6lVuwjlcsqmzfynuODaY1M0bPp8OUa82N3aupu
         Nq83mAqObRHzlSqdxRDV6TiAUGAfWNks/3bMvy7aGUQzVBcnsvwRacuRfYfBSiq5kE3D
         WrsQ==
X-Forwarded-Encrypted: i=1; AJvYcCVQq9yxZJIA7RkZ1XubdhzKpjljzaPsMRBOYXTmJcRIXI/q7XEUJb5uomCPFABvWhH/rwK1GbcAS/MDVQjcyL6iUA==@vger.kernel.org
X-Gm-Message-State: AOJu0Yz3pKN/h3lxDeYrBzZgZOqkAAiYghH9cYfuJhYwsGdO7R5QD2Em
	PMa4cxhuXIoZNjuHN9j7hxZ4Yph5ETKSu5GvzQlviZjLp/SRrehuARmlW18q02522X4=
X-Gm-Gg: ASbGnctiodcTXAcS9nfbqBkDfIN0GmMZ9SXEXgzfJ+d0GmoZWmBKSbMlGdA8+SfsjR4
	E8x7fwVwfPbWDUVYj/t/b3OasrSNHhYUUXbhJidsXQeCgoMygGNopu0EEIsDbNQfiGY8gYlFFtM
	d3RjdEHceBpHaTCpFwbOtEY1+CorULe7y19g8+4JxtEtGQSaKOjCJpymBfxyjEqlSqKEXjXw+Q1
	81jDnm4mJaGqclCNDgqKcZPVr818qvbK8TqNCuimHV+9XTanMbm/eW8HvfQSz/tl4nFVzECmLeG
	Gg4sQ9QP0V4FVP4QccQSBCrh/m0wQiek64+KG5EGaM6fx48Rld47T8QG9K/4tnqsU0i9X40hIuO
	R2UReU9WyGJw7QSUP7+c2h6DmqfMQpifCwuAQqsKVog4XzcWKXSEMjDT1aEFpePtF6UvYnLBHWJ
	cv5Z2qNdlkbiWfgSA8LX0w097kfj/9Q6EWXrXFL57ff+UmgAEB
X-Google-Smtp-Source: AGHT+IEyZI7oKtHJbOhB6JPl/2VrNzkw36AN8NzLEszIxPIrqCHkvJBk7aI/BZMFgycGbQ0Y1RvPUg==
X-Received: by 2002:a17:907:944c:b0:b72:8398:f248 with SMTP id a640c23a62f3a-b767168f525mr1425652566b.2.1763994079115;
        Mon, 24 Nov 2025 06:21:19 -0800 (PST)
Received: from mail-ej1-f53.google.com (mail-ej1-f53.google.com. [209.85.218.53])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b765c1379ddsm1219194166b.0.2025.11.24.06.21.14
        for <linux-renesas-soc@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 24 Nov 2025 06:21:16 -0800 (PST)
Received: by mail-ej1-f53.google.com with SMTP id a640c23a62f3a-b72bf7e703fso714800566b.2
        for <linux-renesas-soc@vger.kernel.org>; Mon, 24 Nov 2025 06:21:14 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCUW10JQAzcLZ9Mi+d+Y280qbJXmkBlOUQ6NGNqi3LQUssRsvTtvVcI4V4d4UvPPxQ5ul6ECQs/9kkNdWbCZePsWRQ==@vger.kernel.org
X-Received: by 2002:a17:907:7213:b0:b73:2ce9:fa76 with SMTP id
 a640c23a62f3a-b7671a469a1mr1156653166b.33.1763994073952; Mon, 24 Nov 2025
 06:21:13 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20251114193711.3277912-1-chris.brandt@renesas.com>
In-Reply-To: <20251114193711.3277912-1-chris.brandt@renesas.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Mon, 24 Nov 2025 15:20:58 +0100
X-Gmail-Original-Message-ID: <CAMuHMdW98bnhfGMhvX9gUekgjS1fEhebOUvxzv9GXY8v3u5aRA@mail.gmail.com>
X-Gm-Features: AWmQ_bllDnnos8zJ8Mu8saYcqAuJrQ-8hDIk3lfEy3od343oWUHxQ6XMSDK77dQ
Message-ID: <CAMuHMdW98bnhfGMhvX9gUekgjS1fEhebOUvxzv9GXY8v3u5aRA@mail.gmail.com>
Subject: Re: [PATCH] clk: renesas: rzg2l: Fix intin variable size
To: Chris Brandt <chris.brandt@renesas.com>
Cc: Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, 
	Biju Das <biju.das.jz@bp.renesas.com>, Hien Huynh <hien.huynh.px@renesas.com>, 
	Nghia Vo <nghia.vo.zn@renesas.com>, Hugo Villeneuve <hugo@hugovil.com>, 
	linux-renesas-soc@vger.kernel.org, linux-clk@vger.kernel.org, 
	stable@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Fri, 14 Nov 2025 at 20:37, Chris Brandt <chris.brandt@renesas.com> wrote:
> INTIN is a 12-bit register value, so u8 is too small.
>
> Fixes: 1561380ee72f ("clk: renesas: rzg2l: Add FOUTPOSTDIV clk support")
> Cc: stable@vger.kernel.org
> Reported-by: Hugo Villeneuve <hugo@hugovil.com>

Closes: https://lore.kernel.org/all/20251107113058.f334957151d1a8dd94dd740b@hugovil.com

> Signed-off-by: Chris Brandt <chris.brandt@renesas.com>

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
i.e. will queue in renesas-clk for v6.20.

Gr{oetje,eeting}s,

                        Geert


--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

