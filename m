Return-Path: <linux-renesas-soc+bounces-32989-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id EDkxIc1WEGraWQYAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-32989-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 22 May 2026 15:14:53 +0200
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id 296865B4EB0
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 22 May 2026 15:14:52 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 1809D303C794
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 22 May 2026 12:54:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8909435675E;
	Fri, 22 May 2026 12:54:08 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-vk1-f177.google.com (mail-vk1-f177.google.com [209.85.221.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E6651233956
	for <linux-renesas-soc@vger.kernel.org>; Fri, 22 May 2026 12:54:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779454448; cv=none; b=s1OIbCXZTMk0vEiqqkF0EnASq44Ry3GnrZuXQ+z3D9xEfcTKAsMq4c7p3XEPGp+WX0CQ57UVB5+5k3cLkX5TBaHOehOt7lGbOtDcu5E61Ffd0rR7tNOUjo6K1JcKmVLYR/MvNp5D+iKu1xN6G+YbBxUX3NkKWBA5VG53BFa90Vk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779454448; c=relaxed/simple;
	bh=y0f0zDcXdnnkLBeUUpPjjNjoTVeherK6Gnt2N+WMLIM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=u+y8LfzbLx8zVKm/DM8ChmJNOPaYgKjzcvR+/H558W3SGjRqRwpwbd72ThN5xx0wwSJVEMtHINS5MidnHRev5i1pxsFTLQvpsWTgiOIoRSk4cVhmpAEeJ/pcbgBHWc6Pt+VEoDJdbWCNEBOFA+Z+ekB1NfnDpxrkfjop8YCe+14=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.221.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vk1-f177.google.com with SMTP id 71dfb90a1353d-5752b279662so2607411e0c.2
        for <linux-renesas-soc@vger.kernel.org>; Fri, 22 May 2026 05:54:06 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779454446; x=1780059246;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=3quGHjyGKvPfNTVLHbhsH4A9LYn3Ygi87Pw363YCUbE=;
        b=qjHYKkeZsJE7T3+o9Z6aeV7VWWbhlKYJC3u7d9fQl03YSY+4YilUYFAmlQDLMJPi/e
         +Bj2qi1WuwuV7O0cBDgXWE7kTQSIrZIKcxA6sv2J3+22Xf9LSt7RtjbYkusZcvkMGARW
         VtJEtTx1Li1g/MLPA2kzFcTxYykfNlL88TMhPC0uciC6oT3yb9z55F1WXEvo8V6XJsvr
         yQBxLcWkqZT1GQ5QHkuysEYIoCCPA3BMfMMKFvIRnV8EsKNJD8rF7U2FdAJus1+C7aHX
         3sNF85DH26JF2UWeKpJuaswjKPRY7kGyutaaETQaiKPgNePje11QbfUsVNVsyWyLPe0w
         xhYw==
X-Forwarded-Encrypted: i=1; AFNElJ9A9zAtRKAc1EJ/p79NiOy30ZPOidRlE5HmjxEADD1UmQQicJLiTcdwZo/txl5ZOvOh83NnCq8soVaSVODP90cppg==@vger.kernel.org
X-Gm-Message-State: AOJu0YxEni1AI57MtIi2y+g4Ri3P8PPgWokViygIHRZsOfrtnxZL7gcv
	OP6n+1ILq/wJH09N67Vi96FEj/QUfOwgjqywIf7PKZLlY+TP6lRBLpnfNC0NioJw
X-Gm-Gg: Acq92OHDm5LFrp2Ebtpxxj2F6BjNnBnX4qFY2pJHOYHiahUJU5/792jKEm0ljNYz0aT
	8MNhVl3uWoANFjK7VprcAORHpCtxEI2bT+9BZe41qFDWH3LPYo6jnjeApgA6XNfptvUzZ0Mitq4
	50z8ZOWMHPEnsZMjjngkP9SQF53DiN3F372iBMrqg4YZxs9rKbxMIa3XGBxws4QV4FPSntowIcP
	gHcEoOKU+YQglCaHMbW2MA50e/GjnkvYMZw3R+AwYsg/nxV1Rm4S+NwOkH1Yjl/xw1FVBlqZoER
	uGIJHKsjPyBymi5kg9fwiw32B5yJZL5MtMTZalzU8SoxTxG93xy8F6Fymiy6SdfLtDcL6rwse7b
	tKH9Tz/Osfwf7Mwktkx31TwMyQXP5J76wefNV5f3icD4Ss9+Dkdgv+8boIrmZFnrq+EsnLJc2z+
	bCaZANMhXQgRqG/GCp7CrpVNMsSIx4n34BcHiRYNie8he9WQ5oHnVw761X2/Rb
X-Received: by 2002:a05:6122:d82:b0:575:3c93:fac with SMTP id 71dfb90a1353d-5865e1bf878mr1474176e0c.3.1779454445790;
        Fri, 22 May 2026 05:54:05 -0700 (PDT)
Received: from mail-ua1-f48.google.com (mail-ua1-f48.google.com. [209.85.222.48])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-586f23eea07sm1998587e0c.4.2026.05.22.05.54.03
        for <linux-renesas-soc@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 22 May 2026 05:54:04 -0700 (PDT)
Received: by mail-ua1-f48.google.com with SMTP id a1e0cc1a2514c-94e2ad66abcso2261339241.1
        for <linux-renesas-soc@vger.kernel.org>; Fri, 22 May 2026 05:54:03 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AFNElJ8mRBq/YU4ielXDJJVF6zIfhA7PHGqb7xqVVDphXqyoAWoZcvoscg+nUgesmYc500ipN8xrfdMcmwbKvED3x/gz7g==@vger.kernel.org
X-Received: by 2002:a05:6102:c89:b0:65a:fcea:5a4 with SMTP id
 ada2fe7eead31-67c749055f5mr1527775137.4.1779454443355; Fri, 22 May 2026
 05:54:03 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260520092947.70596-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
In-Reply-To: <20260520092947.70596-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Fri, 22 May 2026 14:53:52 +0200
X-Gmail-Original-Message-ID: <CAMuHMdWjp2bWkvPraNz13afhENWU0zdu3Zy0VP1dpU5HPB0PzA@mail.gmail.com>
X-Gm-Features: AVHnY4LtzrzzorNjSfvxyjhEkppUb04Rmj1TXYpE3QgN6Qn4KvJMw-KEJ4D4Cvw
Message-ID: <CAMuHMdWjp2bWkvPraNz13afhENWU0zdu3Zy0VP1dpU5HPB0PzA@mail.gmail.com>
Subject: Re: [PATCH] clk: renesas: rzg2l: Rename iterator in
 for_each_mod_clock() to avoid shadowing
To: Prabhakar <prabhakar.csengg@gmail.com>
Cc: Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, 
	Brian Masney <bmasney@redhat.com>, linux-renesas-soc@vger.kernel.org, 
	linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Biju Das <biju.das.jz@bp.renesas.com>, 
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>, 
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Content-Type: text/plain; charset="UTF-8"
X-Spamd-Result: default: False [0.04 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	DMARC_NA(0.00)[linux-m68k.org];
	TAGGED_FROM(0.00)[bounces-32989-lists,linux-renesas-soc=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-renesas-soc];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[geert@linux-m68k.org,linux-renesas-soc@vger.kernel.org];
	MIME_TRACE(0.00)[0:+];
	RCVD_COUNT_FIVE(0.00)[6];
	R_DKIM_NA(0.00)[];
	NEURAL_HAM(-0.00)[-0.579];
	RCPT_COUNT_SEVEN(0.00)[10];
	TO_DN_SOME(0.00)[]
X-Rspamd-Queue-Id: 296865B4EB0
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Wed, 20 May 2026 at 11:29, Prabhakar <prabhakar.csengg@gmail.com> wrote:
> From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
>
> Rename the internal loop iterator variable in the for_each_mod_clock()
> macro from 'i' to '__i'.
>
> The current naming conflicts with local loop variables named 'i' inside
> code blocks that utilize the macro, triggering compiler warnings due to
> variable shadowing:
>
>   drivers/clk/renesas/rzg2l-cpg.c:1494:36: warning: declaration of `i` shadows a previous local [-Wshadow]
>    1494 |                  for (unsigned int i = 0; i < clk->num_shared_mstop_clks; i++)
>
> Using a unique identifier for the macro-internal iterator resolves the
> shadowing warnings globally across all macro expansions.
>
> Fixes: 3fd4a8bb4b63 ("clk: renesas: rzg2l: Add macro to loop through module clocks")
> Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
i.e. will queue in renesas-clk for v7.2.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

