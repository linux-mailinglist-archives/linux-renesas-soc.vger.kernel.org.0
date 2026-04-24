Return-Path: <linux-renesas-soc+bounces-31635-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id EPlNF01o62m2MgAAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-31635-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 24 Apr 2026 14:55:41 +0200
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id 27C6145EBAB
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 24 Apr 2026 14:55:40 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 82B413008C3C
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 24 Apr 2026 12:55:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2248A3D333F;
	Fri, 24 Apr 2026 12:55:27 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-ed1-f50.google.com (mail-ed1-f50.google.com [209.85.208.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 88B573D0927
	for <linux-renesas-soc@vger.kernel.org>; Fri, 24 Apr 2026 12:55:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777035326; cv=none; b=jtxuo5tfBwY96TGaQ/cLaKY1ye+xL4+ITfYJNrraz0nSbDp/Fhp8eWNF824O/SnzpwJ6ncnx/wa1uUHK1Wee01nZp8CzluseuGKm392HUDwnShJsytDCaNi5FzM7NBUEmZxOzSij5Zw6DtNbLPRqMBbmDbLYXkquWLxC/bbT6h0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777035326; c=relaxed/simple;
	bh=42/E5ZPR2B6gkFPuTFsjwFpgB1yxDiW7r73CtbxY0FU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=t7ofeUAPZMsqz+rwWFit813UExhSfm7/H/lhMSz/fQxLoBT20kBmbODMX+KubqmAt7/QB22oIpWQ3xKgWMIs463BGHmqMVLhszxmmi+LynDAYxaA4kt0xOpOP1b9FloOrr+FcaUzcZjgmI24fZZ5yu6kQy4o61BnNbzBa6XoKyo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.208.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ed1-f50.google.com with SMTP id 4fb4d7f45d1cf-672645dbfeaso8465751a12.0
        for <linux-renesas-soc@vger.kernel.org>; Fri, 24 Apr 2026 05:55:21 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777035317; x=1777640117;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/lh2uoqfMz/5p6xF/SqCiKgLYXOLD7frnhUVdKR8cm4=;
        b=cqoZFf/uyD5ZWzQg+95+R8QUALsHzffDivH27v4VCh4058XrchZ60aD46BOPC0jqTc
         5vpeHge2yGCgWTyzsKMzQb4zm4SjZdpx/cPm5f5M/HFhh03FGxelYBGIraVDYJFIjmxy
         EsBU+k9GKR4xjlkN57kd7Tn+LmGGOxQwdsZ/XJXV2zBMB4tKKvQmTApG5gPEGu6iHACv
         BSCx/1ZJnuu4MdTN7kbvpngO33XV7Fe29GZOnKbd8EjjAyuYhdxmx3u/0caiNd36ve1R
         zTzUqUdyW3cSW8BVyPZ4DNfIjpeTvSKFFp3+hzjuo0hoHVf9D2Kzfu7dgBBhe6KzsvW3
         Rf+w==
X-Forwarded-Encrypted: i=1; AFNElJ8/I4ObT9lK/4oRsVpWMZLFiYC6usPbkI/nsmvNWL8CTLZGI6SiCixLe0lxQD4+I4debNhqL1a9U3CzZlmU8KMJUw==@vger.kernel.org
X-Gm-Message-State: AOJu0YzMBbebHp+KGw9V1iBRk05yfY42TV5Am8VgwRPdsDOk5YvEydjR
	adDFvvjHeelhHHvNbzTMWuPqgmlnklA9CofJN1LzDbhG1GVmFg+ZbgJs8l/mDp+N+Ac=
X-Gm-Gg: AeBDietoYZrgt7gQRgZtRSKDODqv3TEZVF01xk1OrXAd/z8TCjXZQj6Hm8SGymX7FHr
	Vghyn8E5BYZQmo7SuCxeXo6/cYDgP7kXCdn6b1ARN7H/E3nRP1v1qgO7wvY+kM0WlnXCpntJZ6F
	tK46IHvGpgOMOPGHQgw1JOOHSJ6yk00hTqA6iL3UuGuSVTIevqW8Wc8T3ZSZSjCLIVZwY2UZDq8
	QfStq+AaEuOfzsG/fIZubVUYxQM4fVxMrSXFbNf3zLvVtf5fJvvZg/g7+E7lW5400LYgrIYFtPX
	7swYgnp1ffruc8n+r0r32guFz+CtK86AShl8hgMwaP6BYl389XYih7jlg1AdgPEHLnVmYXHaktc
	y3Fn9tl5CSKKrpaSgSyMbafR1zntvk9YdRkrB7ufLHSoKDP6EWdI3H4YGHe4X6+5rxa3PIGHhX3
	lqFH2uOB4bJOYVZd3eVxcawhWtUGAmVIJHteFiz8QuwxVMcOS+maTENPHwR9Z1h061br5xnJQ=
X-Received: by 2002:a05:6402:21d5:b0:676:7f29:d38f with SMTP id 4fb4d7f45d1cf-6767f29d486mr7662541a12.22.1777035317092;
        Fri, 24 Apr 2026 05:55:17 -0700 (PDT)
Received: from mail-ej1-f44.google.com (mail-ej1-f44.google.com. [209.85.218.44])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-678974e23adsm941116a12.13.2026.04.24.05.55.15
        for <linux-renesas-soc@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 24 Apr 2026 05:55:16 -0700 (PDT)
Received: by mail-ej1-f44.google.com with SMTP id a640c23a62f3a-ba36357195bso954913866b.0
        for <linux-renesas-soc@vger.kernel.org>; Fri, 24 Apr 2026 05:55:15 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AFNElJ9Do+ZvQrQJWkcTbk8IP4bzxZ34hIFcilSX7WnqSkGPu/FQZNNWb4PQUV8OHFmccIcqyAh4SE5ReNIwX0eAtFXjkQ==@vger.kernel.org
X-Received: by 2002:a17:907:9622:b0:bab:897b:1aae with SMTP id
 a640c23a62f3a-bab897b1eebmr554803166b.49.1777035315325; Fri, 24 Apr 2026
 05:55:15 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260330132349.149391-1-biju.das.jz@bp.renesas.com> <20260330132349.149391-6-biju.das.jz@bp.renesas.com>
In-Reply-To: <20260330132349.149391-6-biju.das.jz@bp.renesas.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Fri, 24 Apr 2026 14:55:01 +0200
X-Gmail-Original-Message-ID: <CAMuHMdUEKsUEq2408XOG1thdwWxA0BvD+KGRSJ0JEAnueuJqng@mail.gmail.com>
X-Gm-Features: AQROBzC92lOZut4wvqLOrENamY1_Y5-0Fl_css0VHPeUm7lfcrk2_KwQ9-0msMY
Message-ID: <CAMuHMdUEKsUEq2408XOG1thdwWxA0BvD+KGRSJ0JEAnueuJqng@mail.gmail.com>
Subject: Re: [PATCH 5/5] clk: renesas: r9a08g046: Add I2C clocks/reset
To: Biju <biju.das.au@gmail.com>
Cc: Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, 
	Biju Das <biju.das.jz@bp.renesas.com>, linux-renesas-soc@vger.kernel.org, 
	linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>
Content-Type: text/plain; charset="UTF-8"
X-Rspamd-Queue-Id: 27C6145EBAB
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [0.04 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-31635-lists,linux-renesas-soc=lfdr.de];
	DMARC_NA(0.00)[linux-m68k.org];
	FREEMAIL_TO(0.00)[gmail.com];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	MISSING_XM_UA(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[6];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[geert@linux-m68k.org,linux-renesas-soc@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	NEURAL_HAM(-0.00)[-0.999];
	RCPT_COUNT_SEVEN(0.00)[8];
	R_DKIM_NA(0.00)[];
	TAGGED_RCPT(0.00)[linux-renesas-soc];
	DBL_BLOCKED_OPENRESOLVER(0.00)[glider.be:email,linux-m68k.org:email,sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns,renesas.com:email,mail.gmail.com:mid]

On Mon, 30 Mar 2026 at 15:23, Biju <biju.das.au@gmail.com> wrote:
> From: Biju Das <biju.das.jz@bp.renesas.com>
>
> Add I2C{0..3} clock and reset entries.
>
> Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
i.e. will queue in renesas-clk for v7.2.

Gr{oetje,eeting}s,

                        Geert


--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

