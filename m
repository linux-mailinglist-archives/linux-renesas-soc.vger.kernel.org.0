Return-Path: <linux-renesas-soc+bounces-34967-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id hJ0SBLi7T2rbnQIAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-34967-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 09 Jul 2026 17:18:16 +0200
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 5401B732BCC
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 09 Jul 2026 17:18:15 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=none;
	dmarc=none;
	spf=pass (mail.lfdr.de: domain of "linux-renesas-soc+bounces-34967-lists+linux-renesas-soc=lfdr.de@vger.kernel.org" designates 172.234.253.10 as permitted sender) smtp.mailfrom="linux-renesas-soc+bounces-34967-lists+linux-renesas-soc=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id E256E304E6FE
	for <lists+linux-renesas-soc@lfdr.de>; Thu,  9 Jul 2026 15:02:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C6F6133B97A;
	Thu,  9 Jul 2026 15:02:23 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-ed1-f49.google.com (mail-ed1-f49.google.com [209.85.208.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 70DC8285CB4
	for <linux-renesas-soc@vger.kernel.org>; Thu,  9 Jul 2026 15:02:22 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783609343; cv=none; b=dUOfH4MOhrs45hXl5V/Jw3cuqRnqyDuBKTAgjOm807eIDc8U4JNv5PX1tbbNt/x+q8SBPaDMBHyafPwDNgxZsz//wwyLumgDil6p+6jruU3WtDqWODipc17QEDt+4Pd8GbuR7Y2ozbJB3hdG9zeNI32QmicgsN2XkhKsEQZG7i8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783609343; c=relaxed/simple;
	bh=5tZ02EgSvxOdXygbK1WQKObjr5Gj2i0W61ocHuGcBkU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=nmhf98qDP9k047/LlDEKsOaqNEyCtaNK67QBrKBBZTMzvhN7azDN9N308sAqDX3XIk50mWEWnxN08SRKFcEBI7VkmllakxIg68lpkW8WXCQH4bSQyJnzsRDFNeLFO3VsOXF1rpP4CDGE9k1moXskLEKnjxXTcDlsWT9BBNTHaRw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.208.49
Received: by mail-ed1-f49.google.com with SMTP id 4fb4d7f45d1cf-697bd21fdc2so3422222a12.1
        for <linux-renesas-soc@vger.kernel.org>; Thu, 09 Jul 2026 08:02:22 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783609341; x=1784214141;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=P2zRt7Vjhk8Sqd+Km3YG6LmL4qUqvLlrRLlJ0jTtj5s=;
        b=QPGW9LE8+kMHlCqtR4nHO8iHV3B9pPlqOTqr0ftxuH3y4RFb4mYbtocA2pKtBPjJDl
         KSgCqPG/KxOgTCwJXRvSAV0L2Vx9Tol7I7z1SJt8E/TeeNpH1CJ85DIniY7uDJMRwh3h
         z9+GV3Z3ZqYVDqdaVaOM7aoREOfSyGmmDcNbvYpgIl8OAkLixYbw6qt8BT1xAhuzlaQQ
         PibPdTcjUmiCiln4Lzcf2SKhB1ufIxUgxnxXgPvZTh2VJPhe8mx/PNBnciKiHK8EUJ/I
         IANFH2UlojaLtLuoEnHwxd7ti2yFMr3L4g7ve9yQpmMR97AE0nzr0wlwBn73CuF7CLUC
         YDOg==
X-Forwarded-Encrypted: i=1; AHgh+Rr+YhZe0GUIQZRkuhlZm4tsrFnE6HOFygeDatDpINzVV7hyWOl3sagGD3BeplHkFE2+rj0gAdrMHa7wQOc+XhqP8A==@vger.kernel.org
X-Gm-Message-State: AOJu0YzwjDyRS+GfxFrr1R3+fmAR/k61XIO7vzY0kjwAd4AiVMIzHnoI
	oT+M/lElPUPqmCZx/NbfL1WgieGkIaG0aliKpM7bRj+xcCn+lfzEIocV9Q5wq2cYsUk=
X-Gm-Gg: AfdE7ckxSS2QLPYO5g2glO+X+aVIz45FErIwDvXUXDBZHH7POt8Zd1u81MI7BmnMu7a
	PaLxejxHLhvuachDYbifmaiEWvva0UdS1J5WWd6l8nxymURW6yFlp8+7tO7+9EgkZivN3RNSzmU
	AfenKtccfDaaguYxq8vSXdvzC6MZlmAmkAYCK/sgNRLuEWHkE/vvM4pkSXyRg7tGm5ZVhoYnLaK
	R9cjqyKp0rAGEKcZiBYSqFZD+p/GwS3kPJDjRpz9AZUJztd7ZH/VuXFYabYbygNEgfgJn3fkx+o
	z8H+GmUo0TjWr8aU438s16jL2cCz4SRIkbT4y57kVLVBwUVvh6wK4AiHiC1lkPgYf2aXoT6suTt
	Q8P0mkvcbepjz5EbqqUXInGI0x3SrFwTfkE1tW3eYvIbX2K2TG4PIFbsp6L0DwkbJ/j4B8PGuFq
	pnk9NXVtkC+jR9lw7wGFL6orLKwDFKCGfjyqQCX/FOdTbqMgdhpg==
X-Received: by 2002:a05:6402:3552:b0:698:87ae:6ced with SMTP id 4fb4d7f45d1cf-69ab44b1288mr3679047a12.28.1783609340715;
        Thu, 09 Jul 2026 08:02:20 -0700 (PDT)
Received: from mail-ed1-f51.google.com (mail-ed1-f51.google.com. [209.85.208.51])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-69acd1d32c6sm2230525a12.31.2026.07.09.08.02.17
        for <linux-renesas-soc@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 09 Jul 2026 08:02:17 -0700 (PDT)
Received: by mail-ed1-f51.google.com with SMTP id 4fb4d7f45d1cf-697564cb69eso3572104a12.0
        for <linux-renesas-soc@vger.kernel.org>; Thu, 09 Jul 2026 08:02:17 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AHgh+Ro2GgH9BDpcxU0QyFXXr/+kOKkHoNiE0TOT1I7kEmXIOVg7uZwrvNqgFTR4A6cCGtkoOj82CpArbRgGlQAq0BiSRw==@vger.kernel.org
X-Received: by 2002:a05:6402:360b:b0:698:351c:979c with SMTP id
 4fb4d7f45d1cf-69ab445ea92mr3246600a12.2.1783609336821; Thu, 09 Jul 2026
 08:02:16 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260708163311.222176-1-prabhakar.mahadev-lad.rj@bp.renesas.com> <20260708163311.222176-2-prabhakar.mahadev-lad.rj@bp.renesas.com>
In-Reply-To: <20260708163311.222176-2-prabhakar.mahadev-lad.rj@bp.renesas.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Thu, 9 Jul 2026 17:02:02 +0200
X-Gmail-Original-Message-ID: <CAMuHMdUasWiEXYoCZ2ivqQaKRq=S4J9Sn-D6Eu8JycjcVE4-kw@mail.gmail.com>
X-Gm-Features: AUfX_mxK3iTEhoniQD-rddM02fNhgR_PZxB2vthnAkaeoLfOdf3o1OoJYFCLKJI
Message-ID: <CAMuHMdUasWiEXYoCZ2ivqQaKRq=S4J9Sn-D6Eu8JycjcVE4-kw@mail.gmail.com>
Subject: Re: [PATCH v2 1/2] arm64: dts: renesas: r9a09g057: Add PCIe nodes
To: Prabhakar <prabhakar.csengg@gmail.com>
Cc: Magnus Damm <magnus.damm@gmail.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	linux-renesas-soc@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Prabhakar <prabhakar.csengg+renesas@gmail.com>, 
	Biju Das <biju.das.jz@bp.renesas.com>, 
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>, 
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Content-Type: text/plain; charset="UTF-8"
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-1.46 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	DMARC_NA(0.00)[linux-m68k.org];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:prabhakar.csengg@gmail.com,m:magnus.damm@gmail.com,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:linux-renesas-soc@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:prabhakar.csengg+renesas@gmail.com,m:biju.das.jz@bp.renesas.com,m:fabrizio.castro.jz@renesas.com,m:prabhakar.mahadev-lad.rj@bp.renesas.com,m:prabhakarcsengg@gmail.com,m:magnusdamm@gmail.com,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	TAGGED_FROM(0.00)[bounces-34967-lists,linux-renesas-soc=lfdr.de];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com];
	FORGED_SENDER(0.00)[geert@linux-m68k.org,linux-renesas-soc@vger.kernel.org];
	RCPT_COUNT_TWELVE(0.00)[12];
	FREEMAIL_CC(0.00)[gmail.com,kernel.org,vger.kernel.org,bp.renesas.com,renesas.com];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MISSING_XM_UA(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	RCVD_COUNT_FIVE(0.00)[6];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[geert@linux-m68k.org,linux-renesas-soc@vger.kernel.org];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	TAGGED_RCPT(0.00)[linux-renesas-soc,dt,renesas];
	R_DKIM_NA(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[glider.be:email,linux-m68k.org:from_mime,linux-m68k.org:email,vger.kernel.org:from_smtp,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,mail.gmail.com:mid,renesas.com:email]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 5401B732BCC

On Wed, 8 Jul 2026 at 18:33, Prabhakar <prabhakar.csengg@gmail.com> wrote:
> From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
>
> Add PCIe nodes to Renesas RZ/V2H(P) ("R9A09G057") SoC DTSI.
>
> Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> ---
> v1->v2:
> - Formatted the ranges property so that the new line entries are aligned.
> - Corrected the flag values for dma-ranges property for pcie0/1 nodes.

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
i.e. will queue in renesas-devel for v7.3.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

