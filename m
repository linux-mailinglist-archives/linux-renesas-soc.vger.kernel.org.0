Return-Path: <linux-renesas-soc+bounces-32845-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id qPTwCFJpDWquwgUAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-32845-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 20 May 2026 09:57:06 +0200
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 2E5335893F3
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 20 May 2026 09:57:05 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 4BF1F3010960
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 20 May 2026 07:57:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2843F39EF21;
	Wed, 20 May 2026 07:57:00 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-ua1-f45.google.com (mail-ua1-f45.google.com [209.85.222.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8158C39C01A
	for <linux-renesas-soc@vger.kernel.org>; Wed, 20 May 2026 07:56:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779263818; cv=none; b=hS8GG4PVtz1zdhs1uCAQScc38HFwaSpOMXzWGmTcIa8769xcUFvQraXIoigk5Zx2024r5aUH0Vw4+nS6QiZ6UgwZiyVUR3dS2EzZvkW/HMfVceTF1cd9BN/lEb6oD9i3dsQfCdH3D1E6jDGgjbWWTSlGz7E8LVXaE1ICel5aLVM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779263818; c=relaxed/simple;
	bh=jyR6CItUiBYwh36JUt384ZPKK5Q8HWzq/VYAHdg6RMk=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=eVggGgX05FEJv8R0kcc/sYSjzPe3TCmfXi1kDWmHZvyrK62lQhCdFdyMJUarv/o62fc+OARmeuf7qOFjq/O3k1D2yBKUMaUtMavBLfOJn86QHknChTSDLmCxYL+Z+rzv8Iu6933u8isFJApAE4qwD6VluJ3LtB4GjfHWyZDUHV8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.222.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ua1-f45.google.com with SMTP id a1e0cc1a2514c-95d0476490fso1190188241.1
        for <linux-renesas-soc@vger.kernel.org>; Wed, 20 May 2026 00:56:56 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779263815; x=1779868615;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=lx7PXaJ7S8HoogAUAhRbNuNVf+vLw1gLYatnc2YBrZ4=;
        b=rHGnUPEzRNNFaigtWlDjFlFEKX04trfPWSW6UYrWotKUxfY4rzdve4Cc0O/OJb0S3j
         Q9V0BtsXnyCYN2Qv1EGkXOUG/gKT6LHb7t15jBnHgKHA3fctu4emcm706lJrX/2HS1AW
         cGxTGeqcu7uj/A2EF7/FNGxLLdp5O520sQmhskDOzodxAkUAVn8o98K/+ZaXazf4ACAo
         CqIUjLXh1ogXb3afQdJ7CuIk0Fw17hFHZ2ZwyV+VCbayKT2divBeruqVURFDSZmCrKik
         RL2e8sgJ/crlNrJrfbOl8XIa4Y3ZmFP1qzy0UudNYLEz52CWgLCrXPReMXJwWo7jkHVu
         nEzA==
X-Forwarded-Encrypted: i=1; AFNElJ8b53JY6+0r+Dj2MVmhBBEAiQaOY9twj3Y6xPlW8yWddfNOgZ8pmVhRiwcq5pb/Avxt/Zaz9AOqegMFe25c5ulL/A==@vger.kernel.org
X-Gm-Message-State: AOJu0YzHMhPkREA9tp9/CQYSyrt6K66UzS70BU3GKjsTFeE4hBju+kQ8
	oysw26ZBUHtthyi29wRoiHTeLSFjq3gTV/mDZm3m85dX5LLm9jEBcVLwrNA3RZ8UIZY=
X-Gm-Gg: Acq92OHhZqV+0BlNBv2/j1A868Eg2EY1srjNwyOypjB1qP9w73n6NmceGz254FbWVP8
	5BlQHArMj69m+h3qauXqBsNClrkx2koBpdFeRq2ZCbT8P/rOlIOb+RoVuGJ+QXNF0Bm8bGhFhF9
	FolQ5/89KA5YMyP8lbrWF9DBXMBLHxcK322cscejlGtv2Y2Uo108PkKyGlWf3SG8qFvi4tlUyMY
	lO9DYiN2avYgIGRjGHlN42SdJAnOy8A3y7HpbqidcMQyU6u3D2FfHZJ1dmbMVew02sHzDQMqwcn
	UagB3E1Xz/BGttALoBl5oZbjCG2iLG7qkOYemjA1+Brz0gxCwPB1BJsyHjk7MLkAaDxAw1f+j25
	VxIT7eitiUaFkIR0f+5vGGl7EQDwlUf7TqWPSp52oX2lxHfmBvzbSrcDrxlgz2POuTahbVDE6+n
	QTAGYJ4tLnom9aEFhQjoamuxHZGIb1BtPspBCTqqUycPq3veltE238pi2D3iRA
X-Received: by 2002:a05:6102:8644:20b0:650:a9f6:4e3a with SMTP id ada2fe7eead31-650aa14d667mr4510801137.1.1779263814862;
        Wed, 20 May 2026 00:56:54 -0700 (PDT)
Received: from mail-vs1-f43.google.com (mail-vs1-f43.google.com. [209.85.217.43])
        by smtp.gmail.com with ESMTPSA id a1e0cc1a2514c-95fc2c99f63sm8044032241.1.2026.05.20.00.56.53
        for <linux-renesas-soc@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 20 May 2026 00:56:54 -0700 (PDT)
Received: by mail-vs1-f43.google.com with SMTP id ada2fe7eead31-63124ac76f5so1258088137.1
        for <linux-renesas-soc@vger.kernel.org>; Wed, 20 May 2026 00:56:53 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AFNElJ9fOM9ZOlQO7WWo/GGFrIRyLXI+K6VrsBsO5hzcTptJR+EbIWTCJMok5+3YPbADdYi5M098ijD+vEAHcTFK4yYLgw==@vger.kernel.org
X-Received: by 2002:a05:6102:6051:b0:611:17bb:934a with SMTP id
 ada2fe7eead31-63a3f98ec5fmr10259611137.28.1779263813547; Wed, 20 May 2026
 00:56:53 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260519135342.623943-1-prabhakar.mahadev-lad.rj@bp.renesas.com> <20260519135342.623943-3-prabhakar.mahadev-lad.rj@bp.renesas.com>
In-Reply-To: <20260519135342.623943-3-prabhakar.mahadev-lad.rj@bp.renesas.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Wed, 20 May 2026 09:56:42 +0200
X-Gmail-Original-Message-ID: <CAMuHMdVQp8BAyKdeEaLrtmCQpa_4Pqq4nbhyt-n8ef7duifTcg@mail.gmail.com>
X-Gm-Features: AVHnY4IbP8AIZJYKzVxOParrOshLbOYMr3ry1CVDytm7aZOPAeFN8Az-3bq0N1E
Message-ID: <CAMuHMdVQp8BAyKdeEaLrtmCQpa_4Pqq4nbhyt-n8ef7duifTcg@mail.gmail.com>
Subject: Re: [PATCH v2 2/3] mmc: renesas_sdhi: Add OF entry for RZ/G2N SoC
To: Prabhakar <prabhakar.csengg@gmail.com>
Cc: Wolfram Sang <wsa+renesas@sang-engineering.com>, Ulf Hansson <ulfh@kernel.org>, 
	Magnus Damm <magnus.damm@gmail.com>, linux-mmc@vger.kernel.org, 
	linux-renesas-soc@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Biju Das <biju.das.jz@bp.renesas.com>, 
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>, 
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Content-Type: text/plain; charset="UTF-8"
X-Spamd-Result: default: False [0.04 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[sang-engineering.com,kernel.org,gmail.com,vger.kernel.org,bp.renesas.com,renesas.com];
	TAGGED_FROM(0.00)[bounces-32845-lists,linux-renesas-soc=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	DMARC_NA(0.00)[linux-m68k.org];
	FREEMAIL_TO(0.00)[gmail.com];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	MISSING_XM_UA(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[6];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[geert@linux-m68k.org,linux-renesas-soc@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[10];
	R_DKIM_NA(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-renesas-soc,renesas];
	DBL_BLOCKED_OPENRESOLVER(0.00)[linux-m68k.org:email,renesas.com:email,mail.gmail.com:mid,sin.lore.kernel.org:rdns,sin.lore.kernel.org:helo]
X-Rspamd-Queue-Id: 2E5335893F3
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Tue, 19 May 2026 at 15:53, Prabhakar <prabhakar.csengg@gmail.com> wrote:
> From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
>
> The RZ/G2N (R8A774B1) SoC was previously handled via the generic
> "renesas,rcar-gen3-sdhi" fallback compatible string. However, because
> the SDHI IP on RZ/G2N is identical with the R-Car M3-N (R8A77965), it
> requires the specific quirks and configuration defined in
> `of_r8a77965_compatible` rather than the generic Gen3 data.
>
> Add the explicit "renesas,sdhi-r8a774b1" match entry to map it correctly.
> Note that the DT binding file renesas,sdhi.yaml does not need an update
> as the entry for this SoC is already present.
>
> Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> ---
> v1->v2:
> - Dropped adding entry in the quirk list instead added entry
>   in the OF match table to map the SoCs to the existing quirks.
> - Updated commit messages to reflect the above change.

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

