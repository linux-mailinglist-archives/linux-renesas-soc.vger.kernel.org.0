Return-Path: <linux-renesas-soc+bounces-30385-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id WJWqA395xWnw+QQAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-30385-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 26 Mar 2026 19:22:55 +0100
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 3959033A015
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 26 Mar 2026 19:22:54 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 74572300BD97
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 26 Mar 2026 18:14:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D96F03932F0;
	Thu, 26 Mar 2026 18:14:13 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-vk1-f173.google.com (mail-vk1-f173.google.com [209.85.221.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4A7B834E747
	for <linux-renesas-soc@vger.kernel.org>; Thu, 26 Mar 2026 18:14:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774548853; cv=none; b=jCs7TblNY9JjKSgoPWSeXPlgVcF1q9a4ktWKCMV05iA/4U+mPod0EXwjq6Z0FKomXEw5cESwRw73XbixzqVy39GnLuV4lDwj6jEFzkujsDlcgDjbt+s4zTxhvOdhzECEZ++2ujSDoX9vQlznCf+vugXZ7oP8M+GuOw0Yw7cj62I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774548853; c=relaxed/simple;
	bh=76VMedtrZ0Lm+x5KOVR+2lWQ5UcBt0+gKLPvNzCznGU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=jzzJofVLVHF75rp69bKkSQUtE4/ZIF775MGlRhuJyNwzQMiED+0V+cnpABg7i4IlgJBibVa+g3PkkwHbEOi/1podLQ4UWCXmw8Han1srRjcjsk2I1jD0A2kDP+TxvoOfYu6Q2z5KeAgBNtly/1XIBukE3/ikbXODTzRur6Yrelk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.221.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vk1-f173.google.com with SMTP id 71dfb90a1353d-56a857578a8so579172e0c.3
        for <linux-renesas-soc@vger.kernel.org>; Thu, 26 Mar 2026 11:14:12 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774548851; x=1775153651;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=GHLUPu/4rF+1oqXhCLWDxxcDFJL1EIISHR05cKMTjK4=;
        b=Z7U81PwzPJS5x4nxUrZilZbky3hahxC6LryjYFnqXLcfqnN0GJNhQ79PXLM5vIzB9o
         64jsxYp1MVz6xgvLS7Z18HyqYeRq4/7uZM+mjJW2+Ia9Rl5jFQUGc7MhCqY7f5wlYxhz
         5KlYwccUfcIMOtPis4/DTozxshVyPWLBBcYRJytQqgvVZdveGqmBJKylhw5azS9KJxjT
         nHqbi7JDAAR85ZQICTaBfrOF7cYiJLNhSmhzSB+7ITG6DopNL7pMURfmJiZs3T3VQRqW
         Lln3opSAMFL64OM8vgSFkXv9JKiPVttbo5sWSpJCWNr9Qe6nDLDD6KS8ArDtVAEQmQbm
         8uYQ==
X-Forwarded-Encrypted: i=1; AJvYcCXC0Abih7oI74R69M5lN/noy8r24PywsdE8m/SbQG3v3DN5V6A45xDOKUJClV7bPscO/+HnkskdVshZUteiLECLjw==@vger.kernel.org
X-Gm-Message-State: AOJu0Yw07+ntnD6qWayZFEk0aqHQwxoDgXnrqd3PgAd2l9oLFoSV7tJd
	Sjnbj5qbOe6FhZZjTL9Btqr/tUEn3jg5Ac7KuwO0ONSiBN+j0IakdA7om2t/oHPlqjg=
X-Gm-Gg: ATEYQzxaaiHBOo7TJ5jbcJQK+i3WOFgKTnSz8VgCkyfMFofp0PYrN7AcgynjWSoTxRt
	PxIxbvMe+5sxzfYPcWf8ZCiybDIph6f3Gtixn3PRoqUEXFSqPqQwF8ywj7vr23MJ0c1S5ou2u6q
	jJHBQFhN0lmgC/OzO5cPgWBYdF48jE9w6IhnRSaCUur/9nxQSQNkwCjBBAb5PwKbN8YTy8pMuep
	R2UneFLS/VG2pao9iO465svWcIkw9Yda5/breGfY1dhotYiuQeSrUqe/pvMWNqfTCM8ORVRRgpw
	ADL84PbBqCiiie8VyzoW324UzAOnEM3auacBrVdIkffwxiuS7fP1XCFLuAbicr6fMbIIosBCB7v
	fcTzH7XDDzoP1tkvdt4KsT1w2l2CdCmoVxL5VAa+zKRxcL1FjLIwBzaYBsRDzHG4Nftro5KtY6m
	IBDdIMHNacSoysZF0Goo4ykRJw+S1iGFgNco+kOQmt69nlY6ATAO26Qwi49mER
X-Received: by 2002:a05:6122:8ca:b0:56c:ca38:ebfe with SMTP id 71dfb90a1353d-56d220f6255mr3835277e0c.16.1774548851237;
        Thu, 26 Mar 2026 11:14:11 -0700 (PDT)
Received: from mail-vs1-f42.google.com (mail-vs1-f42.google.com. [209.85.217.42])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-56d31c2afdcsm5106490e0c.8.2026.03.26.11.14.10
        for <linux-renesas-soc@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 26 Mar 2026 11:14:10 -0700 (PDT)
Received: by mail-vs1-f42.google.com with SMTP id ada2fe7eead31-60328744770so397769137.2
        for <linux-renesas-soc@vger.kernel.org>; Thu, 26 Mar 2026 11:14:10 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCVL8tb9qmq6RnGbkqUCBFnaZO6eTfcWfNT8gTU0NK48h2XEuSSMUCb/BdKY6S2W00i/elZCYHLwhn/bDksPVgHV7Q==@vger.kernel.org
X-Received: by 2002:a05:6102:3ca1:b0:602:6784:3eef with SMTP id
 ada2fe7eead31-603872c905cmr3701587137.28.1774548850029; Thu, 26 Mar 2026
 11:14:10 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260326162459.101414-1-biju.das.jz@bp.renesas.com>
In-Reply-To: <20260326162459.101414-1-biju.das.jz@bp.renesas.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Thu, 26 Mar 2026 19:13:59 +0100
X-Gmail-Original-Message-ID: <CAMuHMdWQrGC122Wq3iUmqs9HnrBWZtXUgLFPkBn7a5dbF3h8qA@mail.gmail.com>
X-Gm-Features: AQROBzDv6QdGpz2y1Tker0_kpChhfFsFmJQK-M4dgnKK-7Xf9ip2061ToeQN1p8
Message-ID: <CAMuHMdWQrGC122Wq3iUmqs9HnrBWZtXUgLFPkBn7a5dbF3h8qA@mail.gmail.com>
Subject: Re: [PATCH v3] pinctrl: renesas: rzg2l: Fix save/restore of
 {IOLH,IEN,PUPD,SMT} registers
To: Biju <biju.das.au@gmail.com>
Cc: Linus Walleij <linusw@kernel.org>, Biju Das <biju.das.jz@bp.renesas.com>, 
	Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>, linux-renesas-soc@vger.kernel.org, 
	linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>
Content-Type: text/plain; charset="UTF-8"
X-Spamd-Result: default: False [-1.46 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FROM_HAS_DN(0.00)[];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-30385-lists,linux-renesas-soc=lfdr.de];
	DMARC_NA(0.00)[linux-m68k.org];
	FREEMAIL_TO(0.00)[gmail.com];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-renesas-soc];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[geert@linux-m68k.org,linux-renesas-soc@vger.kernel.org];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[6];
	R_DKIM_NA(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[8];
	DBL_BLOCKED_OPENRESOLVER(0.00)[glider.be:email,mail.gmail.com:mid,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,linux-m68k.org:email]
X-Rspamd-Queue-Id: 3959033A015
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Thu, 26 Mar 2026 at 17:25, Biju <biju.das.au@gmail.com> wrote:
> From: Biju Das <biju.das.jz@bp.renesas.com>
>
> The rzg2l_pinctrl_pm_setup_regs() handles save/restore of
> {IOLH,IEN,PUPD,SMT} registers during s2ram, but only for ports where all
> pins share the same pincfg. Extend the code to also support ports with
> variable pincfg per pin, so that {IOLH,IEN,PUPD,SMT} registers are
> correctly saved and restored for all pins.
>
> Fixes: 254203f9a94c ("pinctrl: renesas: rzg2l: Add suspend/resume support")
> Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
> ---
> v2->v3:
>  * Dropped pin_off, pin_desc, and pin_data local variables and
>    instead used pctrl->desc.pins[pin + i].drv_data.
>  * Started the loop at 0 so that it covers all the variable pins.

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
i.e. will queue in renesas-pinctrl for v7.1.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

