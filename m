Return-Path: <linux-renesas-soc+bounces-31035-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id UGmEKzJ61mnxFggAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-31035-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 08 Apr 2026 17:54:26 +0200
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 29A313BE8DF
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 08 Apr 2026 17:54:25 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id DFB2130684F7
	for <lists+linux-renesas-soc@lfdr.de>; Wed,  8 Apr 2026 15:47:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F30FF3054EF;
	Wed,  8 Apr 2026 15:46:01 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-vk1-f172.google.com (mail-vk1-f172.google.com [209.85.221.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 96EFF3016E7
	for <linux-renesas-soc@vger.kernel.org>; Wed,  8 Apr 2026 15:46:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775663161; cv=none; b=twF/BZxUcWgMmWr88Z8dpJzxOlhSeRAX5DYFKYY2wjFSQYEyzuSfwXvzlA0awtncIoL0Mof48bArOmYpzUCHOqVML5t4Q5bPHMDHTww4MzBvm7qtUfW2YewFDtDEV0KGt2Mz8x4lgQjQ3fR37d6ItR0qcVGcpDONIZJaFRMPrzE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775663161; c=relaxed/simple;
	bh=16j4upoT9sJfPzdH6X/+Xv5a+TcPUTpYanV6Lb/dLPY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ZrUIp5hbmpRVhrUEv1JU3JqPNWObgB8zey/ZGHKu5ZDxXi8e4rQ9BszuGsq2NLyhlEM18b31bRjvEZdJPEkEBdytvxjYVlGh7gJxGZHgS9HJsOkY4X+zaGEUFc3VQz/AI2eatJKaMTZwyrdu9irDahJE67qjWKbK92sQZLJVkMY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.221.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vk1-f172.google.com with SMTP id 71dfb90a1353d-56db63456d4so1685072e0c.1
        for <linux-renesas-soc@vger.kernel.org>; Wed, 08 Apr 2026 08:46:00 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775663160; x=1776267960;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=vHFk0A5PiqyMvdhTllvamqBie3Dm7/U8ZhTI9V50sFc=;
        b=b287MMq6hu1BCyzrMhaG+97LPXPQtSVuRebI4KWswWe5EKQFtlNx3fVX6GE7EtmqKt
         EHw0qva5p99r4uZxZ8iTZFMcmdRWNBNvY0cA88JsCTVh9oDAW7bzm5RyABs+TUAiisJo
         z9qmrmJfhbnfn3srlmv4qNkhcZd56mTNfKL9WIEP1TpAtrTGZejWcxmZIJwAmxQzRndX
         ffbhtCMm+RuqXeEneYsAqseYgfaIWvJG1c1apkjzwv0Cru+AM0LhfXCXFrOxQgO0+JBx
         jEfmfySVlt5+gFcgjpog/Iz7LM/oxnTO/AmmbyAaa5ElKyM3sXwkDGK0m/DHEB1YWok0
         tGAA==
X-Forwarded-Encrypted: i=1; AJvYcCUryJ392iUJXkgUpLRhVJy39ftqjK7hkdjmH/45cqK4S47lFi7a6XTzpBCCd5rt/OdMvdggETuuaxg5nRhy63hVMQ==@vger.kernel.org
X-Gm-Message-State: AOJu0Yxju2ATaT5FZHv37kQpqhxCwDQIKaDrYYTJrFIWRsWm+SNMOtMI
	OVLlAtvsDjoENk7mCExiKhfZMYtcyvaoxJ7tDo+ql+o9Ct6E+u3m1jIu8QnrIv09
X-Gm-Gg: AeBDievINbq9nZoZXCKkXi+V4w/yETvz9mKjiw6hpa1EVl3WJnVcSI3uGiP00JqrcyA
	TLFngpNNicRvL+i+aizCySizvKwqG11yuc2K6wEv38xw9lrYgUsj0XC5aeQp9RmKQzPI467arvK
	4S0GHr0jEJ3TDIddQulW0B1HC+Lit91uhtipQJjDw1QHEOLsfRkkEUTcq6YhlKWerGgiOgR8X34
	a95wLrFvKQzTYA/Kt/J23qKMdwaBVUEzkRB9RDe8fTKE3PygZYBzcS2D3KcPknc3QpDfvlY9PhN
	q/H/2va98jnQaT82WbMxTQGXVtyCRkQ+vyO7nfT7j4/3sRMWNu2uuzIhFOxh3b3at4n2KucPG1U
	IBmFYoSNmUmm7MCsUXghZkP+VyyafSy1kZO3dylsccv7qCYNOfNQYzmYGAmEHVrbCx4GF4CFDP/
	sVeOuNbArP4eg89XrW9OGsHHoJIAK7M0JhRBvF8YYfHXStgzpgroPW52WoQt3cGnib
X-Received: by 2002:a05:6122:1b8c:b0:56f:2125:e8b4 with SMTP id 71dfb90a1353d-56f2761ccdbmr264095e0c.15.1775663159609;
        Wed, 08 Apr 2026 08:45:59 -0700 (PDT)
Received: from mail-vk1-f173.google.com (mail-vk1-f173.google.com. [209.85.221.173])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-56d9ba81b53sm20283430e0c.4.2026.04.08.08.45.58
        for <linux-renesas-soc@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 08 Apr 2026 08:45:58 -0700 (PDT)
Received: by mail-vk1-f173.google.com with SMTP id 71dfb90a1353d-56db63456d4so1685039e0c.1
        for <linux-renesas-soc@vger.kernel.org>; Wed, 08 Apr 2026 08:45:58 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCXA76Q4Ky+9buQRQV091SCscAAgQuNSwfqV58qHJxuc6ZTza3dHh4RTk77vRPKixm0/ySbv7R8cIRQ4dI9BJtsY+g==@vger.kernel.org
X-Received: by 2002:a05:6122:3221:b0:56b:814e:d35a with SMTP id
 71dfb90a1353d-56f274c9dcdmr288556e0c.8.1775663158274; Wed, 08 Apr 2026
 08:45:58 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260408142105.310210-1-biju.das.jz@bp.renesas.com> <20260408142105.310210-3-biju.das.jz@bp.renesas.com>
In-Reply-To: <20260408142105.310210-3-biju.das.jz@bp.renesas.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Wed, 8 Apr 2026 17:45:46 +0200
X-Gmail-Original-Message-ID: <CAMuHMdXVbWg=nz-E0VTet2YgCP-GvmVY_3MJeZbE0Thp-mMpHQ@mail.gmail.com>
X-Gm-Features: AQROBzBGldNv6VigTu3n3nywjLnQaTCy4GOqCagh4X2AkIWNe3fnNYY09g9NnsA
Message-ID: <CAMuHMdXVbWg=nz-E0VTet2YgCP-GvmVY_3MJeZbE0Thp-mMpHQ@mail.gmail.com>
Subject: Re: [PATCH v2 2/2] serial: rsci: Remove goto and refactor baud rate
 clock selection
To: Biju <biju.das.au@gmail.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Jiri Slaby <jirislaby@kernel.org>, 
	Biju Das <biju.das.jz@bp.renesas.com>, 
	Thierry Bultel <thierry.bultel.yh@bp.renesas.com>, 
	Wolfram Sang <wsa+renesas@sang-engineering.com>, 
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>, linux-kernel@vger.kernel.org, 
	linux-serial@vger.kernel.org, linux-renesas-soc@vger.kernel.org, 
	Pavel Machek <pavel@nabladev.com>
Content-Type: text/plain; charset="UTF-8"
X-Spamd-Result: default: False [0.04 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	DMARC_NA(0.00)[linux-m68k.org];
	TAGGED_FROM(0.00)[bounces-31035-lists,linux-renesas-soc=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-renesas-soc,renesas];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[geert@linux-m68k.org,linux-renesas-soc@vger.kernel.org];
	MIME_TRACE(0.00)[0:+];
	RCVD_COUNT_FIVE(0.00)[6];
	R_DKIM_NA(0.00)[];
	NEURAL_HAM(-0.00)[-0.842];
	RCPT_COUNT_SEVEN(0.00)[11];
	TO_DN_SOME(0.00)[]
X-Rspamd-Queue-Id: 29A313BE8DF
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Wed, 8 Apr 2026 at 16:21, Biju <biju.das.au@gmail.com> wrote:
> From: Biju Das <biju.das.jz@bp.renesas.com>
>
> Replace the goto done pattern in rsci_set_termios() with a positive
> conditional block. When baud rate is zero, the clock selection logic
> is now simply skipped rather than jumping to a 'done' label, eliminating
> the goto entirely.
>
> Since RSCI only uses a single clock source (SCI_FCK), the multi-clock
> tracking variables (best_clk, min_err, brr1, srr1, cks1) are redundant
> and removed. ccr0_val and ccr4_val are likewise dropped, replaced with
> hardcoded 0 at their write sites, as they were never modified from their
> initial zero values.
>
> No functional change intended.
>
> Reported-by: Pavel Machek <pavel@nabladev.com>
> Closes: https://lore.kernel.org/all/abPpZULsXhRmXTX9@duo.ucw.cz/
> Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
> ---
> v1->v2:
>  * Dropped the check (abs(err) < abs(min_err) as it is always true.
>  * Dropped the check (abs(err) < abs(min_err) as it is always true.
>  * Dropped variables best_clk and min_err as they are no longer needed.
>  * Dropped intermediate variables brr1, cks1 and srr1; results are now
>    written directly into brr, cks and srr.
>  * Moved dev_dbg() inside the if (baud) block.
>  * Dropped ccr0_val and ccr4_val, replaced with hardcoded 0 at their
>    write sites, as they were never modified from their initial values.
>  * Scoped variables err and srr locally within the if (baud) block.
>  * Updated commit description.

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

