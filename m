Return-Path: <linux-renesas-soc+bounces-31742-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id mL/PAByu8WmwjgEAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-31742-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 29 Apr 2026 09:07:08 +0200
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id EB2FD490337
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 29 Apr 2026 09:07:06 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id A61F73039A6C
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 29 Apr 2026 07:02:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0A57E39DBFC;
	Wed, 29 Apr 2026 07:02:17 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-ua1-f52.google.com (mail-ua1-f52.google.com [209.85.222.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BE6F81A9F9B
	for <linux-renesas-soc@vger.kernel.org>; Wed, 29 Apr 2026 07:02:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777446136; cv=none; b=bF06FR0R/xAsm1pLCHvANIUyozUOWra7lfS5EJUWyekUwfwfeJao2TU602KLJuJE4zMtbL5D2Fc4k25VOq2SijIEnu07my27Ej5d4ZXqn7683LvdYKce8E1BaSu3qrgWapdb94aGlQZ7OttwIi9ynyxpLa5RXii6uvNGPDmox2k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777446136; c=relaxed/simple;
	bh=V35ZW2YnkHgO0RfXOUoYbcnt9bguN1mK4UQfElfcjqI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=SOjYx8oLrmlkXbyx3J4FSbQVO3+pB7SWUeot/WFjUL+/fo3nKipy3sN5Iz6Qs0m7O2v9TG3pGheNGqykjJQpfNRnqvCPD2aTCDH6I7eR7+YjVjOhzV8mT27AYU495jgj4V72bLAricQgksfyN2l/u8zrkIrnEX6OHsMXQXYWJzE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.222.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ua1-f52.google.com with SMTP id a1e0cc1a2514c-94de664b541so3476460241.1
        for <linux-renesas-soc@vger.kernel.org>; Wed, 29 Apr 2026 00:02:15 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777446135; x=1778050935;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=t3SMcHmd/G4Qm9j51Mi9eY7BLzwpv46B8Xc3O0CQPw8=;
        b=YnhIKkwxQVnRkh0GFy9sJHgk+jLxKFH1i5sNwvNsEZYDajxVuUquJvTsd3qiqalRR+
         R4tdAXefmCCCCpWRTIsiC6dGFg81fH0U69JU1aorOjcuOsao+TJ9yAgvMjC49K0bvo5+
         wVlxSOqy5C/gPNe5WEjGcJQZqlqVFbYzfJc2rBf4uPcQhKByMkVeoZnHvqFPljXNaN3B
         /+ypGxDAwUkENDT4iZy8mvzQ8dZDxq9bTHyaTbpZDfkihk3v7XdmSlQARojHFV5eVTo/
         nKA7y5GHHO+OqUgYHag81pN8HNKcMdVPXHeLqhchJ+D5W596QcSDnmn8+dV2TR1EWQjQ
         Ct8Q==
X-Gm-Message-State: AOJu0YwCAoojdk8BYANC9pRygeayiAVV4hCGy8oIkQKXkvwmggvOpuak
	yo76EXMlg592Jky27xjdz2SG/JRPLroffOQ3BYE3BYdtOqvpuK/ISB3ONQQLkXpWLX4=
X-Gm-Gg: AeBDiesiTeNhybZ/14Si5aQD0wf/Qc5Q40qLYPSDkR27qGMOTU95vW64LIW6BYr8swM
	NGywWrXtKWGAtBzs0Udk2r5v8XgFp8yULOiWonnMBlD+EZ4lm/qtqKBCEewarXAdVb1uPdHcjS8
	Cqnh4X8Ft3MTP97CTMvZ0SDK10Zx4vA2PmSqZS33RTxDpVx5cWXzAXLsFRc6lLzWJ3VW0W8KueN
	X6BZvDVqNz4P1lKiyjAYr0SUj31D6YBiwP2oCT2gQwVf/DziyCoYjNG4EqvHcbvqgVDPgL3aEkK
	ytcMI7CeHwF4JqHWfESbW+lBd6GygIaMZTIYIlpraoKzsHXE1WTFJUw6mBxpxvoCJU59i+cgT+a
	09CuKjC3XTdeGWQ8uA63f3BwudRzpJyHmYm1XIyZWn5LwuJHzr8vENO3iJK8ueGdAbamrVk0wOc
	UVInWMVokgTDqmkJo1mS3mAsk53BbfCnNq/YaGBHjPTz8o5PALAQIWXhmScupfoSU7nNbg1OE=
X-Received: by 2002:a05:6102:1588:b0:611:8e5e:4143 with SMTP id ada2fe7eead31-6280b1e0c7fmr2741226137.27.1777446134391;
        Wed, 29 Apr 2026 00:02:14 -0700 (PDT)
Received: from mail-vs1-f42.google.com (mail-vs1-f42.google.com. [209.85.217.42])
        by smtp.gmail.com with ESMTPSA id ada2fe7eead31-629848683ebsm606883137.12.2026.04.29.00.02.13
        for <linux-renesas-soc@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 29 Apr 2026 00:02:14 -0700 (PDT)
Received: by mail-vs1-f42.google.com with SMTP id ada2fe7eead31-6120528b8b4so3572313137.0
        for <linux-renesas-soc@vger.kernel.org>; Wed, 29 Apr 2026 00:02:13 -0700 (PDT)
X-Received: by 2002:a05:6102:2c11:b0:608:2acf:cd19 with SMTP id
 ada2fe7eead31-6280abb415emr2946346137.22.1777446133255; Wed, 29 Apr 2026
 00:02:13 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260402112709.13002-1-wsa+renesas@sang-engineering.com> <20260402112709.13002-4-wsa+renesas@sang-engineering.com>
In-Reply-To: <20260402112709.13002-4-wsa+renesas@sang-engineering.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Wed, 29 Apr 2026 09:02:01 +0200
X-Gmail-Original-Message-ID: <CAMuHMdU_kWCLvb6V=Q+42YPaf+VN5cUY5NNsDCYdQG6si6w-dA@mail.gmail.com>
X-Gm-Features: AVHnY4L6nIpcvMSmKF5tD2EbsnGQ0WPXJVgyDxXyU53hMZMzbXwbThISGQiWtxQ
Message-ID: <CAMuHMdU_kWCLvb6V=Q+42YPaf+VN5cUY5NNsDCYdQG6si6w-dA@mail.gmail.com>
Subject: Re: [PATCH v4 3/3] soc: renesas: add X5H PRR support
To: Wolfram Sang <wsa+renesas@sang-engineering.com>
Cc: linux-renesas-soc@vger.kernel.org, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Marek Vasut <marek.vasut@mailbox.org>, 
	linux-kernel@vger.kernel.org, Magnus Damm <magnus.damm@gmail.com>
Content-Type: text/plain; charset="UTF-8"
X-Rspamd-Queue-Id: EB2FD490337
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.46 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[vger.kernel.org,kernel.org,mailbox.org,gmail.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	TAGGED_FROM(0.00)[bounces-31742-lists,linux-renesas-soc=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	DMARC_NA(0.00)[linux-m68k.org];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MISSING_XM_UA(0.00)[];
	FROM_HAS_DN(0.00)[];
	RCPT_COUNT_FIVE(0.00)[6];
	RCVD_COUNT_FIVE(0.00)[6];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[geert@linux-m68k.org,linux-renesas-soc@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	NEURAL_HAM(-0.00)[-0.865];
	TAGGED_RCPT(0.00)[linux-renesas-soc,renesas,dt];
	R_DKIM_NA(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns,sang-engineering.com:email,mail.gmail.com:mid,linux-m68k.org:email,glider.be:email]

On Thu, 2 Apr 2026 at 13:27, Wolfram Sang
<wsa+renesas@sang-engineering.com> wrote:
> On this SoC, PRR is now inside the MFIS memory block, so we need to
> access it similar to e.g. RZ/G2L.
>
> Suggested-by: Geert Uytterhoeven <geert+renesas@glider.be>
> Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
> Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>

Thanks, will queue in renesas-devel for v7.2.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

