Return-Path: <linux-renesas-soc+bounces-32848-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 6M1nBb9uDWp9xQUAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-32848-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 20 May 2026 10:20:15 +0200
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id B44C6589995
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 20 May 2026 10:20:14 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 908BF3081336
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 20 May 2026 08:10:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 14A2F3A7F7A;
	Wed, 20 May 2026 08:10:11 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-vs1-f50.google.com (mail-vs1-f50.google.com [209.85.217.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9D6943A6B78
	for <linux-renesas-soc@vger.kernel.org>; Wed, 20 May 2026 08:10:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.217.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779264610; cv=none; b=rLOHCnL2zOAakwg6L5Aj8Z+7Mx8e3OvVnXfuLGXKSdkS+qw5RdFPHBLQ9SImIBEwOamC+PdIlew57qXx0K9qqw482hZGN2+Pl41/NL+WtXDWDNLMX6ehIE1oC39Iv83ZfEOb9+Sb6mQXRYH0mcokqizDyEZbAvddouHBE1N2irI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779264610; c=relaxed/simple;
	bh=585E/t6ktMIeC1UpZ20AYiKMMBarLZckC8rEfws2X8I=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=QKXbXg8GSzRBnrO/8lDETV/5em9evQ28CzJlNSfWZZT2ECYWBjudip9rZvTVrZ6cctPQi95p9GReZ7GX7v3dgPApc3FshNwpx25xNF4cj8OxGJPF7lLLqtgjlBdpxLY9QtOS09HwziNRTZSNnSYs3c3kYLaBNHvJkmEDRxBzWY0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.217.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vs1-f50.google.com with SMTP id ada2fe7eead31-6324ee4040cso1375146137.0
        for <linux-renesas-soc@vger.kernel.org>; Wed, 20 May 2026 01:10:07 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779264605; x=1779869405;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=QAf0/u2XRQdu+JrfxP8RWdf/XDncyvkHhwZOJE5kRt0=;
        b=PCudCbyUy9NYJen0ViPRuEv6fTeQfJv6et1KVVt46SL8gVPDBEV3U+uiQmCaEEV4dA
         iHjQZg92FPGG7i8jwlIHQEzhqEUZVNt3pyAqTgS8KJfEiseMUO/6oSQMFMmjGs4cHLvF
         /GThkVi8aHXAzLTLLnYINZ/RwuSSyCmX1SeJiqesns4aMaf3FfBs9Fkj2340wuAkyIul
         m5jc3k7wF8/zT6CiZEJQTWpsij7G/T54q2Ai7RO3gNsZyDvslTDIcPlT7jG1F9z/0hWF
         0B2QlHoXdVMIsGZYs9xCqJQeLTtsvD/IJdYTRisk3kIe5KIt39iG3a8s9kwPtrDeDZzS
         BZrg==
X-Forwarded-Encrypted: i=1; AFNElJ8EZwUdpJP80Y4Ydh09ACI4lS+XDkd7q9beDa9CceDWShOyLilpiwlO3LPfhPBaHCGCSwPRtLumnUyqoB7lEsteUw==@vger.kernel.org
X-Gm-Message-State: AOJu0Yws4kaYF3cqaeUk2KipbpR/FRja8VziV2Sci+CK55WGWW9K5oQj
	V4sz7q6lSUArvNXPmM9h+TC2OtwRFFw0YzDoknjkcQKUQjqIuuTAE03+9VyXkOoqvK0=
X-Gm-Gg: Acq92OEjMRRFOLWzt3eCJTNedtvhEd7cZrD2JxiwWOyg0jj4Mi1ouTt2IRNiSU1kFf4
	Bp9UtgPlCfBQDtdS3e9RmZXayspPSo+GRAH7mRCOTHij47Rt1hYtjH+Ut4BdTYSdypCG6YCIoKq
	OuaxQqi7FfsUvQ23axw4P13SHyBGzmyaG1nHE/mT4uWz60qrapC/ugw1b4ilaHzKLXI4amyRqt6
	sh4dsXayySDwo1hBrwCPPV7wF7z45HYnZKDDsZ1EcN1QEAiisNu746I2x88pfLV4D2V15M1PWNB
	irxd4tpCsh6Bexz0bIc9hDHBjOhcbc8Oo5Rmd830yIu8NxZZIIlyOiQ8Mz333HqNMDPRhxiDzJq
	WwVyPoP4OEd3jAso3MLBSAH52AsT1UKSOQCLcUriqH/TxhZdkZ5LOW+0BY6WOMSBZlsA9o366HA
	CZYuODoF2WngSdSeMT5Zwq1oJQnFvmKZLYoA8H3ps+h6PmCE70fR601h4lHaSmmhJF
X-Received: by 2002:a05:6102:6046:b0:631:b834:e052 with SMTP id ada2fe7eead31-63a3d72bf03mr10290632137.12.1779264605151;
        Wed, 20 May 2026 01:10:05 -0700 (PDT)
Received: from mail-vk1-f182.google.com (mail-vk1-f182.google.com. [209.85.221.182])
        by smtp.gmail.com with ESMTPSA id ada2fe7eead31-63cd19e0bf4sm7828336137.6.2026.05.20.01.10.04
        for <linux-renesas-soc@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 20 May 2026 01:10:04 -0700 (PDT)
Received: by mail-vk1-f182.google.com with SMTP id 71dfb90a1353d-5774680983dso1448679e0c.0
        for <linux-renesas-soc@vger.kernel.org>; Wed, 20 May 2026 01:10:04 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AFNElJ/wckxgRc66cmdC+e1oY4xECDhhhD99ef1C5I+uFlozGmYxK8zub00pC2uxOwgpw+NsgthThRz6tRKfKzmgBRMsbw==@vger.kernel.org
X-Received: by 2002:a05:6122:2205:b0:575:1711:a9c4 with SMTP id
 71dfb90a1353d-5760c054182mr12389586e0c.9.1779264603992; Wed, 20 May 2026
 01:10:03 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260519141518.389670-1-biju.das.jz@bp.renesas.com> <20260519141518.389670-3-biju.das.jz@bp.renesas.com>
In-Reply-To: <20260519141518.389670-3-biju.das.jz@bp.renesas.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Wed, 20 May 2026 10:09:52 +0200
X-Gmail-Original-Message-ID: <CAMuHMdXCn9T87hGMxqDNZjb2y0E+svQ1dnxe4biUNaJ_xMLKBw@mail.gmail.com>
X-Gm-Features: AVHnY4IFrwj5iY5NKmvHYn7v3fK5ncvbUea1DK68vcdC-uxeWDvWpMmdQfg_9yo
Message-ID: <CAMuHMdXCn9T87hGMxqDNZjb2y0E+svQ1dnxe4biUNaJ_xMLKBw@mail.gmail.com>
Subject: Re: [PATCH v3 2/3] clk: renesas: rzg3s/rzg3l: Simplify PLL
 configuration macro
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
	TAGGED_FROM(0.00)[bounces-32848-lists,linux-renesas-soc=lfdr.de];
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
X-Rspamd-Queue-Id: B44C6589995
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Tue, 19 May 2026 at 16:15, Biju <biju.das.au@gmail.com> wrote:
> From: Biju Das <biju.das.jz@bp.renesas.com>
>
> Replace the per-SoC G3S_PLL146_CONF() and G3L_PLL1467_CONF() macros with
> a unified CPG_PLL_CONF(stby, setting) macro defined in rzg2l-cpg.h.
>
> Drop the now-redundant GET_REG_SAMPLL_{CLK1, SETTING}() macros, replacing
> the latter with CPG_PLL1_SETTING_OFFSET() using FIELD_GET() to extract the
> offset value. Update RZG3L_PLL_{STBY,MON}_OFFSET() macros to derive
> offsets directly from CPG_PLL_STBY_OFFSET().
>
> No functional changes.
>
> Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
> ---
> v2->v3:
>  * Rebased to renesas-clk and fixed the merge conflict.
> v1->v2:
>  * Updated commit description.
>  * Fixed the macro RZG3L_PLL_STBY_OFFSET by using CPG_PLL_STBY_OFFSET.

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
i.e. will queue in renesas-clk for v7.2.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

