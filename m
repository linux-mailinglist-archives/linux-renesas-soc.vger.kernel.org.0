Return-Path: <linux-renesas-soc+bounces-32849-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id qIn9L9BuDWp9xQUAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-32849-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 20 May 2026 10:20:32 +0200
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 631665899B8
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 20 May 2026 10:20:31 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 6828E3088FC1
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 20 May 2026 08:10:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4EB3B3A7F54;
	Wed, 20 May 2026 08:10:14 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-ua1-f45.google.com (mail-ua1-f45.google.com [209.85.222.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E33AB3A8733
	for <linux-renesas-soc@vger.kernel.org>; Wed, 20 May 2026 08:10:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779264614; cv=none; b=uID6DnhN7soneo9k93b9O9rFAsR+ZhEElOJMH+UT94smH5+g1d9R9W1J16CPKhXfWFGBSqjqwcGymkayNTLKVrp7SserA45D1Kr4oRHvVVP71JYVKEqYSB0lyNhyl5ePE43pi5vTe2rvlintFRlQfuyS5Pq1KIEi0TRrQMv8ZgY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779264614; c=relaxed/simple;
	bh=IOo8AWuxTIJ+k+Dyvuuz2q7JZDzyTuhjrqS4OcfSgXg=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=PgbbRnsta8DjD1MUooLpgI5vW/mlH0DZi5KM1G47jeiss+Z5GLlIcOd0El0nbB/aj2DZuRPfGF/oZJzeqScXBiCDQCYfxJkSc9UxcW6koqjSSIOdJozEYRjSGC0V7u4FCTjJsW1SsShlDhbv+UmJuQWjbo1xgNKqZnTig9uJs7E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.222.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ua1-f45.google.com with SMTP id a1e0cc1a2514c-95d439bd3a5so970899241.3
        for <linux-renesas-soc@vger.kernel.org>; Wed, 20 May 2026 01:10:11 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779264610; x=1779869410;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=i7VdhJSDBkYzak9LDT4UkpAtfl9KPk9NUyHcgdGQUxs=;
        b=SJtnk5lV4Imuep7WuxNeGMR342wrsGfsO/n4YCrvuhPAZdHJacwVNTKhstbJxygAGM
         99um1ZU6ZO5UNx0KHK0NBEwfY1R8bmcblnwNHJ++9qXptoGgnRTuIJmlaN+gzyfUYkau
         nw/GHRvCxXLkz72O3xNrihOEiTRzqngz20BuQ8YUSRKIOL+BzvjditmPJr8J9ePdH3SM
         YwO6mQL8YiapahxXaX7bI4hRpJUDxMZ91ermswRB2x+mQUTW4lPRtnRuYW+1lzuhJ9dO
         PF8mRpMTfbLPtvRCoPtAXdTCMaB1gi8MDZzpC22BVuh+MxrBEWNpsE3oXiQUlmg6R9ov
         k+BA==
X-Forwarded-Encrypted: i=1; AFNElJ82BElZk++/ekQJi2zuYqNXTPXwWr+ivYqmExTxInbdCvWkGQoI/LRfsDb2x4INI9izQkgeYDlm1j7Vst2KsPDZ0A==@vger.kernel.org
X-Gm-Message-State: AOJu0YxoiH6de4PUlA4Ad2DyMBT9AWsE8H5fEACBweXwY3FiarJJOAAt
	ahRnZ7yW4X4d4kEIOIqXiE3VMXr9ODLANuxP/LMue/FenZZRutigiadgTaRTBd6LLp4=
X-Gm-Gg: Acq92OFQn7Kynit9jGn7Ufp/tGZmKwt0JVsef+K+iFJYzYHJWg/WyUDtsU2/+MEGPB/
	aTgLLVhThqvmweDFQfEl0y+KLHzWpB0g+BP5kUtFuqpJa7Wt8651zRF+xwV9uwT9GmDdOUdd8b4
	97/tKbOYFMmaqJtfBrUvR+W1hvWC7NisTSBNUPTBTSLkrUy1Ye4W16CQKxvoFccdbV6fUz9g1IQ
	Vjq3oZAXaPHFqsXSdzOJuHgjy0Bic3XFJc3blJa1cdCeNJH6rG/4zuG48Y2sIoPPttyvvP+NiYR
	2543a6Za8IbEBv1Nq2hndWlQFZkgUYulgDaQoYjHXFfiATQcJMPee4hF1B9MWPYwizYRWWVNb6c
	qwMpyLDUdjBta2+FqFPGjABUPqM6DvFS95QTPyJk83DCws8YiJCo+1+hjDCI8aP3xlPMVKjF8SS
	i0K/LHRnUts9KbT97LeKM6YLgjvlDvRXp4B9D8hZPwwW5BSj6yDIEMgBl7+UZ4Lexe
X-Received: by 2002:a05:6102:8659:20b0:64e:32c3:1371 with SMTP id ada2fe7eead31-64e33003a09mr4951651137.2.1779264609982;
        Wed, 20 May 2026 01:10:09 -0700 (PDT)
Received: from mail-vk1-f179.google.com (mail-vk1-f179.google.com. [209.85.221.179])
        by smtp.gmail.com with ESMTPSA id a1e0cc1a2514c-95fc2c9a4f8sm7905618241.2.2026.05.20.01.10.08
        for <linux-renesas-soc@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 20 May 2026 01:10:08 -0700 (PDT)
Received: by mail-vk1-f179.google.com with SMTP id 71dfb90a1353d-57533363201so1324710e0c.0
        for <linux-renesas-soc@vger.kernel.org>; Wed, 20 May 2026 01:10:08 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AFNElJ+7QdoLT2rjHqUa/uy788rGRAkE44YINzXtq0TLBlAbFcPnhOyD+/boKaIFKBQs1sbeRRwUMKMxMnlY7DNN/S72+g==@vger.kernel.org
X-Received: by 2002:a05:6123:86:b0:575:29ef:7df3 with SMTP id
 71dfb90a1353d-5760c05e326mr11364808e0c.12.1779264608558; Wed, 20 May 2026
 01:10:08 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260519141518.389670-1-biju.das.jz@bp.renesas.com> <20260519141518.389670-4-biju.das.jz@bp.renesas.com>
In-Reply-To: <20260519141518.389670-4-biju.das.jz@bp.renesas.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Wed, 20 May 2026 10:09:57 +0200
X-Gmail-Original-Message-ID: <CAMuHMdWv3aN5gBUGRwJnpSj3NZQ=U0CKxDsvPZS2xzRDKZ4NxQ@mail.gmail.com>
X-Gm-Features: AVHnY4K0YwXkoWQK4hs4FQNx_sQUKymIyLyfuSxkPAB17ObH2eKA6DsPNF7Kc4M
Message-ID: <CAMuHMdWv3aN5gBUGRwJnpSj3NZQ=U0CKxDsvPZS2xzRDKZ4NxQ@mail.gmail.com>
Subject: Re: [PATCH v3 3/3] clk: renesas: rzg2l: Rename RZG3L-prefixed PLL
 macros to CPG-prefixed ones
To: Biju <biju.das.au@gmail.com>
Cc: Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, 
	Biju Das <biju.das.jz@bp.renesas.com>, Brian Masney <bmasney@redhat.com>, 
	linux-renesas-soc@vger.kernel.org, linux-clk@vger.kernel.org, 
	linux-kernel@vger.kernel.org, 
	Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>
Content-Type: text/plain; charset="UTF-8"
X-Spamd-Result: default: False [0.04 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	DMARC_NA(0.00)[linux-m68k.org];
	TAGGED_FROM(0.00)[bounces-32849-lists,linux-renesas-soc=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-renesas-soc];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[geert@linux-m68k.org,linux-renesas-soc@vger.kernel.org];
	MIME_TRACE(0.00)[0:+];
	RCVD_COUNT_FIVE(0.00)[6];
	R_DKIM_NA(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[9];
	TO_DN_SOME(0.00)[]
X-Rspamd-Queue-Id: 631665899B8
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Tue, 19 May 2026 at 16:15, Biju <biju.das.au@gmail.com> wrote:
> From: Biju Das <biju.das.jz@bp.renesas.com>
>
> Rename RZG3L_PLL_STBY_OFFSET(), RZG3L_PLL_STBY_RESETB,
> RZG3L_PLL_STBY_RESETB_WEN, RZG3L_PLL_MON_OFFSET(), RZG3L_PLL_MON_RESETB,
> and RZG3L_PLL_MON_LOCK to their CPG_PLL_* equivalents to reflect that
> these macros are not RZG3L-specific and are shared across SoCs.
>
> Also fold CPG_PLL_MON_OFFSET() into rzg2l-cpg.c alongside the other
> CPG_PLL_*_OFFSET() helpers introduced in previous patches.
>
> No functional changes.
>
> Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
> Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
> ---
> v2->v3:
>  * Rebased to renesas-clk.

Thanks, will queue in renesas-clk for v7.2.

Gr{oetje,eeting}s,

                        Geert


--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

