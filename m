Return-Path: <linux-renesas-soc+bounces-30347-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id +F56Bog7xWn/8AQAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-30347-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 26 Mar 2026 14:58:32 +0100
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 86F1733669D
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 26 Mar 2026 14:58:31 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 517D93018758
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 26 Mar 2026 13:51:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 76AF9303A1E;
	Thu, 26 Mar 2026 13:51:07 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-ej1-f47.google.com (mail-ej1-f47.google.com [209.85.218.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 278CD29A32D
	for <linux-renesas-soc@vger.kernel.org>; Thu, 26 Mar 2026 13:51:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774533067; cv=none; b=PiaVjs1u/+WnCLVUZsXYN6Fxi6jdHdbZHP/C0GwsNwglx6AiCQl6nLUlE3u1/+TwDWJp4VblH/t/jcCexXGEegv+TvG0W/hnuVx+Cx4tedjrVUq3qVhO+Ac9D8015EHkOMpqAOUhW4W7qw2mde0b6pe/T/tvvyLF6AegURX2RgQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774533067; c=relaxed/simple;
	bh=ApmXkWimEbhFrJhxmnQ0tGJk1At79kMIOzPAwtwQJQ0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=SKwCr7tR3zxgmVF1DzWdkFg0PSjCNc8ontqQI2HJK3b0ezT7BC+7PdpK1dhjt8YNv/sFltzd3mq2dWNsuSA177FLf5zIAPlbLz9MeJ29mKvQ0If8GtXB2g54M+XUdegtGMQKZEPZZHUO7LPiihdZOAi/ixU/g4fOpwgZ026ZoxU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.218.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ej1-f47.google.com with SMTP id a640c23a62f3a-b9910707d82so113566166b.1
        for <linux-renesas-soc@vger.kernel.org>; Thu, 26 Mar 2026 06:51:05 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774533064; x=1775137864;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=56TPENpBYkVbPaYM9HCYrZsM2LvTOb5K6nYcvbleZG8=;
        b=ha7nZLzEKHu/F1OOpikNK4w38zUj4gfu+ByAn90BD+iiJbN5XeP7fQHbkdJMHnbrR1
         i+c+vY+tccrgTAgQiN7euoU7YIJPej5IGAKXzfFAxPGYnOw+tbVhjeQPHRx6prcrZ+6n
         ZASLzVOVZIaAn+fu6qp/MU8WYYFcT1qJQJW54UUdvDB0FJleTdOp3QQNDLyr16QDK+1B
         Cmn4nUbWfxHWjR0b0/qEQmHKU8ej921JQ8lZsSkV8gCSPlcQ3jPxVreq21RqyeRlQiBX
         srYhQ79iRUt1dXqADMN8LzsJ9VxUtGjohhKvwTHl/gcddWHEIArs0tRedeB46/vL1m7C
         fECg==
X-Forwarded-Encrypted: i=1; AJvYcCX7+RLnE7Sur19knrnYoAZYls4pKKHPIlzqfY4yGsA6xZLjVEZSNZVHH3OMVggRedIAzC2et7h9WnDuhSG6QjQVqQ==@vger.kernel.org
X-Gm-Message-State: AOJu0Yw7Bmi/5Rv+44Qmm+oBKRqAm8mWimSp+gCzVgN57xJL825egdsC
	Dy3FTFTUCnesAcyrN7to5pV1dFDlmVn4pOcGjJkWVPqNNahxUaBUiSaClrFkNZwK0no=
X-Gm-Gg: ATEYQzw9w1iVbr88nRqhoI4g9i1gbXPmyD/pAUOJ6Wq1wtrTkD7+ENrQGhym+D+RVfP
	/hqjbw2BbzW43ZM0TgUuIxXckwAJXY0wnqUKeG0KL9yfjYxNQGog7EgWBLzunDqFmY7Twvjb065
	0HjE1gSIOf63zspWNM2AFvDDV9F0+fzeperPBc6GLz3u85Q40dMsozM/xcuHasJopXQigpfNG7s
	8HrJfRh2ni0ZXbMfEPU0tHexls5agEGNb42IPu5OoU1fYSHg8RuSxugYu+nqz/4eNlh7qWyvZx+
	uaecmyEBodYbLVMrGaEDRwmXF01d7PzYVcGrfLfxK5gYnJ1vS1ONBglWSJp4w5TApabUtxXwefj
	jNkfrYqMOKecKv9RGxmF7u0d/4382tKHaZ6ZKB9KH7uK+5iG7emn7+oBQC5fVT/Ko+jhfogoRc3
	QirhtN6u9SkzS7LpXPA+bWJ5vVn7KHCJ0XASyyP487U6kzzqJ2EeDUEojDuPRx
X-Received: by 2002:a17:907:6c0f:b0:b98:4b8:1046 with SMTP id a640c23a62f3a-b9a54234d4fmr526526266b.31.1774533064409;
        Thu, 26 Mar 2026 06:51:04 -0700 (PDT)
Received: from mail-ed1-f52.google.com (mail-ed1-f52.google.com. [209.85.208.52])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-66b0bdf75b2sm657569a12.3.2026.03.26.06.51.02
        for <linux-renesas-soc@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 26 Mar 2026 06:51:02 -0700 (PDT)
Received: by mail-ed1-f52.google.com with SMTP id 4fb4d7f45d1cf-668d4751a3bso1386217a12.2
        for <linux-renesas-soc@vger.kernel.org>; Thu, 26 Mar 2026 06:51:02 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCXnCzVIpGiBH9m7/BYQAVGGeC+899uMT46WXX2aPi9tDU2hLH45SbJ8aarW94ClupqU2AVQ31r+C7oNdwVWFpIrIw==@vger.kernel.org
X-Received: by 2002:a05:6402:5294:b0:660:a2df:ad1 with SMTP id
 4fb4d7f45d1cf-66a8262758amr4825424a12.7.1774533062546; Thu, 26 Mar 2026
 06:51:02 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260324114329.268249-1-biju.das.jz@bp.renesas.com> <20260324114329.268249-3-biju.das.jz@bp.renesas.com>
In-Reply-To: <20260324114329.268249-3-biju.das.jz@bp.renesas.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Thu, 26 Mar 2026 14:50:48 +0100
X-Gmail-Original-Message-ID: <CAMuHMdVrn6XVmnE=QeF4ByJc6=_AV=-0hbhG6DK2mjzyzzV2QQ@mail.gmail.com>
X-Gm-Features: AQROBzC4WZlINfrg7Ep9cwJ-vM8or7JcDcyPMGLbIWeq-F-wcEtFpIaRMEEqRBk
Message-ID: <CAMuHMdVrn6XVmnE=QeF4ByJc6=_AV=-0hbhG6DK2mjzyzzV2QQ@mail.gmail.com>
Subject: Re: [PATCH v8 02/11] clk: renesas: rzg2l-cpg: Add support for
 critical resets
To: Biju <biju.das.au@gmail.com>
Cc: Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, 
	Philipp Zabel <p.zabel@pengutronix.de>, Biju Das <biju.das.jz@bp.renesas.com>, 
	linux-renesas-soc@vger.kernel.org, linux-clk@vger.kernel.org, 
	linux-kernel@vger.kernel.org, 
	Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>
Content-Type: text/plain; charset="UTF-8"
X-Spamd-Result: default: False [0.04 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-30347-lists,linux-renesas-soc=lfdr.de];
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
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	NEURAL_HAM(-0.00)[-0.999];
	RCPT_COUNT_SEVEN(0.00)[9];
	R_DKIM_NA(0.00)[];
	TAGGED_RCPT(0.00)[linux-renesas-soc];
	DBL_BLOCKED_OPENRESOLVER(0.00)[renesas.com:email,linux-m68k.org:email,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,mail.gmail.com:mid,glider.be:email]
X-Rspamd-Queue-Id: 86F1733669D
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Tue, 24 Mar 2026 at 12:43, Biju <biju.das.au@gmail.com> wrote:
> From: Biju Das <biju.das.jz@bp.renesas.com>
>
> Some reset lines must remain deasserted at all times after boot, as
> asserting them would disable critical system functionality with no owning
> driver to restore them. This mirrors the existing crit_mod_clks mechanism
> which protects critical module clocks from being disabled.
>
> On RZ/G2L family SoCs, the DMA reset must be remain deasserted for routing
> some peripheral interrupts to CPU.
>
> Add crit_resets and num_crit_resets fields to struct rzg2l_cpg_info to
> allow SoC-specific data tables to declare reset IDs that must never be
> asserted.
>
> Introduce rzg2l_cpg_deassert_crit_resets() to iterate over all critical
> resets and deassert them. Call it both at probe time and during resume to
> ensure critical peripherals are held out of reset after power-on and
> suspend/resume cycles.
>
> Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
> Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>

Thanks, will queue in renesas-clk for v7.1.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

