Return-Path: <linux-renesas-soc+bounces-34787-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id ixHTCd2jTGr4nQEAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-34787-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 07 Jul 2026 08:59:41 +0200
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id B45D171835F
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 07 Jul 2026 08:59:40 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=none;
	dmarc=none;
	spf=pass (mail.lfdr.de: domain of "linux-renesas-soc+bounces-34787-lists+linux-renesas-soc=lfdr.de@vger.kernel.org" designates 2600:3c04:e001:36c::12fc:5321 as permitted sender) smtp.mailfrom="linux-renesas-soc+bounces-34787-lists+linux-renesas-soc=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id BC46630430C4
	for <lists+linux-renesas-soc@lfdr.de>; Tue,  7 Jul 2026 06:52:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3B47A3BCD1C;
	Tue,  7 Jul 2026 06:52:46 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-vs1-f52.google.com (mail-vs1-f52.google.com [209.85.217.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3D2533B42E2
	for <linux-renesas-soc@vger.kernel.org>; Tue,  7 Jul 2026 06:52:38 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783407163; cv=none; b=SQcKab+kECT5PStcGoOOYeX/DgLO0D8Ui8w2UaBtASytLf3MFm8HI1GaYtGwKGxmzCs/8DMuq8jvpBIUmV9W53QuHuHNvU00M2gXsooJAC1E6wYglPUyF+cg+qrpE24tHx4J29s6CdK6IcHxiaxRF2N9Op/nQEpAW9kEjEId/bs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783407163; c=relaxed/simple;
	bh=gD/q7SKmBrC0OtQIWUnnzJ0urKpnYBI77eKOVOV42ZU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=RcuVi19DrogyjztM6zd7r+cZQcqsFTE/jJqRkdTA0xtt2qToDrMhcnsMkf6uJGMrPbrKhrvY5kP9ZkkOjWbq0gROAySWKwKjwIkL9zfH39nyO+4mwCkLXLM1MFsvZWtggoPkDv/IJdzDernxsU6SjBn/5iWOVZXx+FOknbHF9s4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.217.52
Received: by mail-vs1-f52.google.com with SMTP id ada2fe7eead31-738b39dad22so951960137.2
        for <linux-renesas-soc@vger.kernel.org>; Mon, 06 Jul 2026 23:52:38 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783407156; x=1784011956;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=H1oWLi+zgA/mmqPta9lQQ7n/K/VL51Ngsb+MHJRTZdo=;
        b=tA2JnRg18J3oKYiWPSMdZh5jaKMJYkeRzZcMdNa0ruen7D6U9PbGYhw3QRFiJJtKw4
         g6XCL04dMM2TW8oKgBs2iWPDN0JItrbnmSaggNs4nAv7k2Tj3vyljrpJx+awxNQv+ECW
         A/7dmrXNGjGcVhrL8YeQpHKc+Ab/IUmfS5IrP5IvMU4wtaKpGMjiBQwCKx2GbGyzDiEl
         mI5yN6vUuIhX0PHtLITr49xZhjyLc5zLOgsu+SMWi0XOFdFP1S2Q8DGQQPRoMESrMcb/
         W6CwVQCI5qIW0QoupLBGIx/pynJpIYyTDIylSlB+feDnctG2HeKT1oKWErO47G9aMxyn
         icQQ==
X-Forwarded-Encrypted: i=1; AHgh+RrNcg34hRzNbRQJpgRoR5zMMIbuHLMvAeAHy4rvkbF+mgK9M4AtvABLXlbnbWgFFHvVdzu8EQv3o+N9jo+lM//hyQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YxQel1mblLbfrV75AiOjviBLpdhE0TDqdQXNHxvMIOj7w743slM
	l4s97V8sAalFVyH7yxIfGdgelG/meZqmVZyg2hLcxjmFukW2zavd+Or34yNDLdhj
X-Gm-Gg: AfdE7clKc89pE0adgXRBpUzsM/uK809SLzhEMFlx+J3i4kXM219ElEC5jCEoC2HL62q
	itiDSyRSKapNFgpGAv+OctuUjEZ+sS99/UTMlvpi76QNkcO3J9puRztw4fejQm+tyxu7BsfrUxK
	ulwTykSIbcgXABE7USnf1mn4XBajxpXFcPhFY0/kezU/wMGxgcqZYNGWA5U8JNWzqfWeZ2a0dX3
	2kbW5ZoOMDiAJuSjHzNVt/aeO8gDQ86s4ySYsa/WiYgNwm/FV6Phg0mP29L5G5AEJNc4Jwe++Ke
	sLOkxPsWcu00EHGYVrJYMWsNvoWv+8fJXiS8GOO5zacwatZacBh2Kc9hVRB30yGyZt1L5Z6YGqd
	/iXq14aiMuXNl+yexRveYEiIYKP88zBAUDtUhyKYaczFhSHemBvGHENypHi9MqizBssRnat9PtA
	9hhAB2vl8uNG1IL3ENefNAmfJESu/3eS/a2241iV6HFsawFe8rdg==
X-Received: by 2002:a05:6102:5e93:b0:73a:128c:4e3d with SMTP id ada2fe7eead31-744b7a20266mr2058347137.8.1783407156193;
        Mon, 06 Jul 2026 23:52:36 -0700 (PDT)
Received: from mail-ua1-f51.google.com (mail-ua1-f51.google.com. [209.85.222.51])
        by smtp.gmail.com with ESMTPSA id ada2fe7eead31-73e19f40debsm6596917137.1.2026.07.06.23.52.34
        for <linux-renesas-soc@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 06 Jul 2026 23:52:34 -0700 (PDT)
Received: by mail-ua1-f51.google.com with SMTP id a1e0cc1a2514c-9692373e0b1so920565241.3
        for <linux-renesas-soc@vger.kernel.org>; Mon, 06 Jul 2026 23:52:34 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AHgh+RqfkVKPKIXWhsNeJQa2hhH7ByqSNtV24FOSGl3zeqtn5icgCcnNmDdZRcwW2U6zbp1puSmU6jtD9haXD5adEEk4yg==@vger.kernel.org
X-Received: by 2002:a05:6102:1606:b0:740:2717:a2d5 with SMTP id
 ada2fe7eead31-744b79c1bddmr1806938137.6.1783407153869; Mon, 06 Jul 2026
 23:52:33 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260704151521.211335-1-marek.vasut+renesas@mailbox.org>
 <20260704151521.211335-2-marek.vasut+renesas@mailbox.org> <CAMRc=MeyKGv75rTLauZuGxSfgjCPXVE_r=A7uNduRr6kAd43aA@mail.gmail.com>
 <edc7505e-1103-42d7-b88d-013ca10753b3@mailbox.org>
In-Reply-To: <edc7505e-1103-42d7-b88d-013ca10753b3@mailbox.org>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Tue, 7 Jul 2026 08:52:22 +0200
X-Gmail-Original-Message-ID: <CAMuHMdXQQWmn612R3y6qSXOZ7YMwZcfrBTrQZ9GzGekhFhtWSw@mail.gmail.com>
X-Gm-Features: AVVi8CefYSfbwNIrN8ylhp-z_YSTf7aaF8Cz88JDJCE3fX10J7HfmxqA13tE8IY
Message-ID: <CAMuHMdXQQWmn612R3y6qSXOZ7YMwZcfrBTrQZ9GzGekhFhtWSw@mail.gmail.com>
Subject: Re: [PATCH 2/2] gpio: rcar: Add R-Car X5H (R8A78000) support
To: Marek Vasut <marek.vasut@mailbox.org>
Cc: Bartosz Golaszewski <brgl@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Linus Walleij <linusw@kernel.org>, Rob Herring <robh@kernel.org>, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-renesas-soc@vger.kernel.org, linux-gpio@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-1.46 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-34787-lists,linux-renesas-soc=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	DMARC_NA(0.00)[linux-m68k.org];
	FORGED_RECIPIENTS(0.00)[m:marek.vasut@mailbox.org,m:brgl@kernel.org,m:conor+dt@kernel.org,m:krzk+dt@kernel.org,m:linusw@kernel.org,m:robh@kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linux-renesas-soc@vger.kernel.org,m:linux-gpio@vger.kernel.org,m:conor@kernel.org,m:krzk@kernel.org,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[geert@linux-m68k.org,linux-renesas-soc@vger.kernel.org];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	MISSING_XM_UA(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	RCVD_COUNT_FIVE(0.00)[6];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[geert@linux-m68k.org,linux-renesas-soc@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	ALIAS_RESOLVED(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[10];
	R_DKIM_NA(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-renesas-soc,dt];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,mailbox.org:email,mail.gmail.com:mid,linux-m68k.org:from_mime,linux-m68k.org:email]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: B45D171835F

Hi Marek,

Thanks for your patch!

On Mon, 6 Jul 2026 at 21:44, Marek Vasut <marek.vasut@mailbox.org> wrote:
> On 7/6/26 11:19 AM, Bartosz Golaszewski wrote:
> >> +static inline int gpio_rcar_remap_offset(struct gpio_rcar_priv *p, int *offs)
> >> +{
>
> I am hoping to get some input on this remap function.

I haven't looked at your patch in detail yet, but the remap function
was the first thing that struck my eyes.  This might impact performance
of bit-banging and of the sloppy logic analyzer.
Have you looked at the code generated by the compiler?
Perhaps it would be better to use a table, like sci_port_params.regs[]
in the sh-sci driver, and riic_of_data.regs in the riic driver?

> >> +    /* R-Car Gen4 and older do not need any offset remap. */
> >> +    if (!p->info.has_layout_gen5)
> >> +            return 0;
> >> +
> >> +    /*
> >> +     * R-Car Gen5 register layout is slightly different and the offsets
> >> +     * that have to be added to or subtracted from each register offset
> >> +     * can be divided into five groups, listed below.
> >> +     */
> >> +    switch (*offs) {
> >> +    case IOINTSEL...OUTDT:
> >> +            return 0;
> >> +    case INDT:
> >> +            *offs += 0x10;
> >> +            return 0;
> >> +    case INTDT...EDGLEVEL:
> >> +            fallthrough;
> >> +    case BOTHEDGE:
> >> +            *offs += 0x70;
> >> +            return 0;
> >> +    case OUTDTSEL:
> >> +            *offs -= 0x34;
> >> +            return 0;
> >> +    case INEN:
> >> +            *offs -= 0x38;
> >> +            return 0;
> >> +    default:
> >> +            /*
> >> +             * This here must never be reached, if this is reached, that
> >> +             * means there is a catastrophic failure in the driver. Skip
> >> +             * any IO read/write to prevent further damage.
> >> +             */
> >> +            WARN_ON(1);
> >> +            return -EINVAL;
> >> +    }
> >> +}
> >> +

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

