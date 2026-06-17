Return-Path: <linux-renesas-soc+bounces-34167-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id PGlPHEqZMmpi2gUAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-34167-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 17 Jun 2026 14:55:38 +0200
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id D96F7699E2D
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 17 Jun 2026 14:55:37 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=none;
	dmarc=none;
	spf=pass (mail.lfdr.de: domain of "linux-renesas-soc+bounces-34167-lists+linux-renesas-soc=lfdr.de@vger.kernel.org" designates 172.105.105.114 as permitted sender) smtp.mailfrom="linux-renesas-soc+bounces-34167-lists+linux-renesas-soc=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id E289C300F554
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 17 Jun 2026 12:55:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 162363F8249;
	Wed, 17 Jun 2026 12:55:35 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-vs1-f45.google.com (mail-vs1-f45.google.com [209.85.217.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 618E1EEA8
	for <linux-renesas-soc@vger.kernel.org>; Wed, 17 Jun 2026 12:55:33 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781700935; cv=none; b=dvTadoonUtA428DYppn9C/lR8ov3M3ENm3cbcRstgE6G8nhzuJy/KbMslxXcLdg7f9so3GQ3lP/jFRvXe6VoBaaPLxwisRWVP+YRaXcnWjhT8wJ8Fj6iOj4fzgi8Stkfcl8zUPEnmVEavKCrcfL6FpTjOJEmE/FIcsSgG+Q4Ses=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781700935; c=relaxed/simple;
	bh=0/aJZ1+qcFjE5raZSmrVX9byG/kJAxaY8lPPVD7F6bg=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=UEAvfZOjdCMPdWumTUdzhEmo4NehZVkKA/00PZE+hb2rlaM/AHKdBpa0r10whk13+zUSUAAKOYIXoQlugjU2TBmmmYQG+W0OpwFe2zs3yOt+Q166OdE+HTewtmVFGn0ID6jwxXx7WVPr/WA8WOt1OJmituW0jUOBbtQcl5SPONE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.217.45
Received: by mail-vs1-f45.google.com with SMTP id ada2fe7eead31-6cfc776e451so1415395137.1
        for <linux-renesas-soc@vger.kernel.org>; Wed, 17 Jun 2026 05:55:33 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781700932; x=1782305732;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=swsEpNagNzyxpR27JaeGBqQ3WkRXyoY0gcVkfq2WrNA=;
        b=OUKyQh29IkmcX3hiKV9mjQ1kYbOpyuJ6ks21lv4ksBYFGjOKMozVX6cztgZWsB5xdb
         iN3Gr7zdNQ3oHsdefiebT8YXIibuXijhWCvFjs7bhSMUgSrHXQGaBjzMmUKtbzxWqvQ1
         B48svjy5XqMHuJyXtDXKowRwBrSVUdZtgNx0+4O7cEDBMzAjCsdXV/D4QC6e+pupcrdU
         kN7Noy28J+OC1lbIa11CzmElxravpzE8E/gIg9SZ/v+YEFkki4qEbiTHj5pxQuIN3V6z
         gy53IUe/vaEX8m+ttNC4h3/S9YB6L3kJIp7o7759uH93vy9PI7okEmwiahv8/2GzPkC6
         OHtw==
X-Forwarded-Encrypted: i=1; AFNElJ8ZrSk/r5i/fDZb8yGmybouw4rfTpbAZJS5g+LcjrV4seSkTPMpHkb9gxi2bJcdoYcqovssgNB42ziLaY7KfBbPzw==@vger.kernel.org
X-Gm-Message-State: AOJu0Ywbu1DhDW+vSJDc34oWiC8WgNf9QLN+o6S3L4rnf7d+K+qJsAJv
	r0Vrn1cPW8iCEdLb/ZhO1DYJj+1QOtkKV6ZumyxdxRl6F0zJ44Sx0yDU237sms0M
X-Gm-Gg: AfdE7ckUKD0DSXBPno45KCZVeLWkBp1HnnBfR635hvkew8eBw7lUUufa/lqxfuEnk1l
	lOGUlev8h/6x9F1HMrLY7/v6WIfuOhBAGkKAbw4efHPkjklbeaJCy5kwmw6I36+iWvOl6///vr2
	/Zu3HhHf+kBL0zEOG3U8HRFZ2qSAKN3Se1h6B1LWibgog+Z47bwRqJTPt8vm8BzkXKMcV8csLmt
	gZqIiSwhwKninsfBK3hW6rPm6GdTrPx9N08nIQCaLsT7z8NuIZqqru5+/tE4OaQVLIIgRc1nyHo
	5jixQ1oWuCaNaizPADXcYfoJnvydvmiEuNNsXBQ5do6ukBN/q2ITJbfharuEA5K8zNfSrgV2xlF
	agGhQN6S74yNHkjhAtZGD9bXhMCYlHyc7/ny4L/8mSGOStSCVUu9ViNUYdn3e/6N1XMrQTfryyz
	az7v072wlbI+YRVd+cTKrZqcae+4gm7v4nuWmURrJZlNtInTtH3c1n8w==
X-Received: by 2002:a05:6102:838b:20b0:622:702c:fd3f with SMTP id ada2fe7eead31-7246d0f4125mr1309290137.21.1781700932249;
        Wed, 17 Jun 2026 05:55:32 -0700 (PDT)
Received: from mail-vk1-f174.google.com (mail-vk1-f174.google.com. [209.85.221.174])
        by smtp.gmail.com with ESMTPSA id ada2fe7eead31-720878872efsm7135646137.12.2026.06.17.05.55.31
        for <linux-renesas-soc@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 17 Jun 2026 05:55:31 -0700 (PDT)
Received: by mail-vk1-f174.google.com with SMTP id 71dfb90a1353d-59ccf81e6feso2042456e0c.2
        for <linux-renesas-soc@vger.kernel.org>; Wed, 17 Jun 2026 05:55:31 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AFNElJ/TJYW2sP5PUJoBlBy77LwVSTB625+0RCRbEzcecWYXAGnlMb+khBKBYTTO596e9H7fCX3FLFJvHmbqvEpBkF1B8A==@vger.kernel.org
X-Received: by 2002:a05:6122:658a:b0:575:24a9:78da with SMTP id
 71dfb90a1353d-5bbbe6f8b86mr1739412e0c.11.1781700931517; Wed, 17 Jun 2026
 05:55:31 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260603065731.93243-1-biju.das.jz@bp.renesas.com> <20260603065731.93243-3-biju.das.jz@bp.renesas.com>
In-Reply-To: <20260603065731.93243-3-biju.das.jz@bp.renesas.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Wed, 17 Jun 2026 14:55:20 +0200
X-Gmail-Original-Message-ID: <CAMuHMdX_a799cCu4CtA-A98BOSeWJfmhoQjG23UDNsivrdJOtQ@mail.gmail.com>
X-Gm-Features: AVVi8CcRu24rZi7169625C1e-vNyTdWNf4LeGohuQVxPxnk-RbJiJI4sNd-KtyA
Message-ID: <CAMuHMdX_a799cCu4CtA-A98BOSeWJfmhoQjG23UDNsivrdJOtQ@mail.gmail.com>
Subject: Re: [PATCH v17 02/17] clk: renesas: r9a08g046: Add clock and reset
 entries for SDHI
To: Biju <biju.das.au@gmail.com>
Cc: Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, 
	Biju Das <biju.das.jz@bp.renesas.com>, Brian Masney <bmasney@redhat.com>, 
	linux-renesas-soc@vger.kernel.org, linux-clk@vger.kernel.org, 
	linux-kernel@vger.kernel.org, 
	Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>
Content-Type: text/plain; charset="UTF-8"
X-Rspamd-Action: no action
X-Spamd-Result: default: False [0.04 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	TAGGED_FROM(0.00)[bounces-34167-lists,linux-renesas-soc=lfdr.de];
	DMARC_NA(0.00)[linux-m68k.org];
	FORGED_RECIPIENTS(0.00)[m:biju.das.au@gmail.com,m:mturquette@baylibre.com,m:sboyd@kernel.org,m:biju.das.jz@bp.renesas.com,m:bmasney@redhat.com,m:linux-renesas-soc@vger.kernel.org,m:linux-clk@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:prabhakar.mahadev-lad.rj@bp.renesas.com,m:bijudasau@gmail.com,s:lists@lfdr.de];
	FREEMAIL_TO(0.00)[gmail.com];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_SENDER(0.00)[geert@linux-m68k.org,linux-renesas-soc@vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	RCVD_COUNT_FIVE(0.00)[6];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[geert@linux-m68k.org,linux-renesas-soc@vger.kernel.org];
	MISSING_XM_UA(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[9];
	R_DKIM_NA(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-renesas-soc];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo,mail.gmail.com:mid]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: D96F7699E2D

On Wed, 3 Jun 2026 at 08:57, Biju <biju.das.au@gmail.com> wrote:
> From: Biju Das <biju.das.jz@bp.renesas.com>
>
> Add clock and reset entries for SDHI.
>
> Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
i.e. will queue in renesas-clk for v7.3.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

