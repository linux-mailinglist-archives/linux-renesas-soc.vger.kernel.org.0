Return-Path: <linux-renesas-soc+bounces-18973-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id B3A81AEF8D4
	for <lists+linux-renesas-soc@lfdr.de>; Tue,  1 Jul 2025 14:39:34 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id E1FD94E01BA
	for <lists+linux-renesas-soc@lfdr.de>; Tue,  1 Jul 2025 12:39:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A91A4273817;
	Tue,  1 Jul 2025 12:39:07 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-vk1-f181.google.com (mail-vk1-f181.google.com [209.85.221.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E6ED126F477;
	Tue,  1 Jul 2025 12:39:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751373547; cv=none; b=I0Pfj8zjCI4iXQ/MoqRtcISOBwAQ0LJbvZvuQ3CPLPsQY/zcv9nLUHxFSgDu7jHrqIPVnQfYwr6iw0ftZVMdvCe2i1kWo0yVBJXyqyKDhPJ5xa9ZzvY5IoyFBRwKaVoNwtW6EjtUh743Svxc0kNphKRUn3F43Z+mg2A6g2ARjyc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751373547; c=relaxed/simple;
	bh=o5de/p1cZO3Uxp7wuj2Y3RT2zzFHhWp1WPtKT9S8MV4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=n/zAYyx/4ZtSAvtB6lkPXJf35ZDSPGtziFlU9mfa1AmzS3ljHbrkr9OM8AdEt1DaWop9BKOQN53eP6sOFLiSOrC0fXWdJjeIVnNOK1gyayPW3mLF6ptRE+zJiolnRoRgpgpy1NCRYEzH4EgWw5IxEkLih4p9LAvsiHbpbIbHsjk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.221.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vk1-f181.google.com with SMTP id 71dfb90a1353d-531b4da8189so1126671e0c.1;
        Tue, 01 Jul 2025 05:39:05 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751373544; x=1751978344;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ljpteC1rAZ0Y7Ib0YzT8O0VCIn4qc5LFAPg21zK2Gas=;
        b=gkSxrqBXMD4wqqG8PivRWlYNCBIMppwoepHMu0qcCMIoNw/y6WQZIi5/rKbdAfuZo5
         qKPPf1NF0msy6y/BxU1b7WGgWmvLK+ZwQsF5bMEGV0WILOp7cMuEmz4QcLN4OqUKjI8G
         L4IppnXc9H8hkipSsCGnBgpaus5hSRBYgagyYoZtz8dUt5UXBlybEqEZ096SOrSPgdTX
         SKJTHNnZFCJ+HvFuYkpZkh7lSbNVDxogWlPCaxJ7HDTRMhGsuTs9tGWUAII+0cdBfG5c
         VA9nZej11g8laaBYEm9akW6h0ti09NrCcQTpkK0N/9QArdMyVChlOuNiyagpnxvwAWyo
         xlow==
X-Forwarded-Encrypted: i=1; AJvYcCUJRHFADzB+lpuPh1mLZ0lFlIQIlGdf36BqRcrxX2fM1zxRyTcp+fOf5ZYEMZqt88Ap+cqMdqltFk+y@vger.kernel.org, AJvYcCUaXcOhrqo7ssb5skwNR7euZmvU8xNGxru+UR09h3saZH6mAfZPoTE0sF2CWm3IqzxwSD5L6hWQyx4MqQ/TD7UjtXI=@vger.kernel.org, AJvYcCVraAgAATICBaQTxG8E3gNy3LJtY+f/KHAk5Pp2WyZEP5Qg9GL0iAsJ/jx6DwDdKjxIxhNmeUkmE8JFABN/@vger.kernel.org, AJvYcCWwBlotdI+4N7Q2txXYs3kwx3hc8toxyZumvKARrP79+N9FW3Rp77TfpBohz3sQHBJy5eyMatzzjCD7@vger.kernel.org
X-Gm-Message-State: AOJu0YxEfMehb1n7Xz9SWC1eJZutOOxeziXdwohCBhSR/WQAWcFE0ILN
	xNrG71jUCu+HGCLv4EbJidmlU9aYaqzBzHRStKa1gXwFkevzzaZlNdXo0N82tkqq
X-Gm-Gg: ASbGncth76JoLUHXLntAXkPzzc2SkWZ/1RkCjsUmOqAoSnHms+mXzLma9gF2ll88+s0
	9n0o7Ak0DpDXYOxlXZvZHSKEVdn8lfJOKiBbFKiJveokjsFyeZM6ALYyWSs8zYzf2rAaou+tuPp
	44SOWP25ThpKSNijYzSHoFzhAG4BYgsvysRQtcLop4pU30hWIpJmlMyWTGvLWdeBkxkRYz5sXcV
	NiH4Ly7QkSGJZERzZb5UGh/V/MO8NQ1z5O9VMe06N9aClZIHHTr11BY+FxCLRua+LjZPErE9VjC
	lrDMo19L/YupsgUWibZafdNuSw2NkRv6j1koQhZ8JgGWx7axXEpWgGwDYSmQvljVhC9lpGrApL5
	myzf42048lI7Du6qKEGRVy9XnBemc0AljElk=
X-Google-Smtp-Source: AGHT+IGW29KumIU6iak2ktfnxBtmg0vPzQ8GNSWqpahz/gZFxHL6Ak1P4FkJwMbui64jupH44vK4Lg==
X-Received: by 2002:a05:6122:2398:b0:531:2906:7519 with SMTP id 71dfb90a1353d-5330be9f389mr10400456e0c.5.1751373543711;
        Tue, 01 Jul 2025 05:39:03 -0700 (PDT)
Received: from mail-vs1-f52.google.com (mail-vs1-f52.google.com. [209.85.217.52])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-533091ec491sm1731042e0c.35.2025.07.01.05.39.03
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 01 Jul 2025 05:39:03 -0700 (PDT)
Received: by mail-vs1-f52.google.com with SMTP id ada2fe7eead31-4e79dde8511so629568137.0;
        Tue, 01 Jul 2025 05:39:03 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCUTSmpNy+1hzHE29z5OhqpRVUnfzqgpnnQTNOeNy9zvbDnlVmdza43tbZBxDtngzUdO27hRa0G8K6bgf5iFIlxiitw=@vger.kernel.org, AJvYcCV2xvPtmkpqnRgS61BSTaMoHbBGl1M3pTbbsKHArVdZKKCKDHtdJMXGpec3V+5DuHD6exo8VcMY1c2O@vger.kernel.org, AJvYcCVOvI+iNtlhPk0QB1n8N8Lp8ABnU7+INxGqXsceaV59MRbchQFMmEqra5odKDOTTzioHd1gYbTQQPhIalbD@vger.kernel.org, AJvYcCVaZL9uKhYUOhpQiLzPDi0rp1h0Cxa7lGjKQHk4JCtri6r4QvQ0moZ8VtbedvZribLsSda0IYlTgy11@vger.kernel.org
X-Received: by 2002:a05:6102:b0f:b0:4ec:b2cc:de60 with SMTP id
 ada2fe7eead31-4ee4f5318f0mr10978211137.11.1751373542790; Tue, 01 Jul 2025
 05:39:02 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250627204237.214635-1-prabhakar.mahadev-lad.rj@bp.renesas.com> <20250627204237.214635-5-prabhakar.mahadev-lad.rj@bp.renesas.com>
In-Reply-To: <20250627204237.214635-5-prabhakar.mahadev-lad.rj@bp.renesas.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Tue, 1 Jul 2025 14:38:50 +0200
X-Gmail-Original-Message-ID: <CAMuHMdU+E_AJRL=cmARemBy+3Npf2PKnhmXx74DzRc+N7b75gQ@mail.gmail.com>
X-Gm-Features: Ac12FXwMYwN2RdZdQYYhBaaCN7mKnqLf5R-OHFjJmy-MgxRrEHPUBNS2mgw5E4k
Message-ID: <CAMuHMdU+E_AJRL=cmARemBy+3Npf2PKnhmXx74DzRc+N7b75gQ@mail.gmail.com>
Subject: Re: [PATCH v2 4/6] clk: renesas: rzv2h: Add fixed-factor module
 clocks with status reporting
To: Prabhakar <prabhakar.csengg@gmail.com>
Cc: Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Magnus Damm <magnus.damm@gmail.com>, linux-renesas-soc@vger.kernel.org, 
	linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org, 
	devicetree@vger.kernel.org, Biju Das <biju.das.jz@bp.renesas.com>, 
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>, 
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Content-Type: text/plain; charset="UTF-8"

Hi Prabhakar,

On Fri, 27 Jun 2025 at 22:42, Prabhakar <prabhakar.csengg@gmail.com> wrote:
> From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
>
> Add support for fixed-factor module clocks that can report their enable
> status through the module status monitor. Introduce a new clock type,
> CLK_TYPE_FF_MOD_STATUS, and define the associated structure,
> rzv2h_ff_mod_status_clk, to manage these clocks.
>
> Implement the .is_enabled callback by reading the module status register
> using monitor index and bit definitions. Provide a helper macro,
> DEF_FIXED_MOD_STATUS, to simplify the definition of such clocks.
>
> Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>

Thanks for the update!

> Note, this patch generates below checkpatch warning but this is
> not a problem.
> `WARNING: struct clk_ops should normally be const`

This is indeed a false positive.

> v1->v2:
> - Moved rzv2h_clk_ff_mod_status_ops to the CPG private data structure
>   and initialized it in the CPG probe function.

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
i.e. will queue in renesas-clk for v6.17.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

