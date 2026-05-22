Return-Path: <linux-renesas-soc+bounces-33012-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id YHZTJv1cEGrbWgYAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-33012-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 22 May 2026 15:41:17 +0200
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id F1C945B55A3
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 22 May 2026 15:41:16 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id C69073096757
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 22 May 2026 13:35:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7076B3DEADB;
	Fri, 22 May 2026 13:35:29 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-vs1-f46.google.com (mail-vs1-f46.google.com [209.85.217.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0E77C3C1F41
	for <linux-renesas-soc@vger.kernel.org>; Fri, 22 May 2026 13:35:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.217.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779456929; cv=none; b=Dq43Hwyg+J1WNiFaVDBvXDN0vA/IR6AmIfRuc41McERBMEt31wOvXN0O3M2CVdt9uoni5BnyZz2JIpoFCCstjQ95yj9HBbWFs/byjTYkZTKqIEKVnrqMTrs6s6ZOKrgooP2lRTpPIkcfZLZSFR2ZcGQxFinv0TRTq3we1jG/W4g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779456929; c=relaxed/simple;
	bh=ZRbNgqNon+gA5ESuUnTv7elhapKwqBFnwMB5cEO+XK4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=G9dskArUQv6jar3PDFvVDY9fnZNV+W7qp9G4u+vQNFV9uVI/rt84qFYe7wZci8l6WOExWIXtS0j7BiWvFITWKjsUEM9q+K5rsEJTjx8J5XaRMwCc0kDW3LkdYEeCO22oMk16EcjpA8h32wUWNUPNjgglb//A5djcnhtXMmthZj8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.217.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vs1-f46.google.com with SMTP id ada2fe7eead31-6314287380bso5337077137.3
        for <linux-renesas-soc@vger.kernel.org>; Fri, 22 May 2026 06:35:27 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779456927; x=1780061727;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=VuUtEv2RIQpNuzR/xXhc1VDTRjgz51KFxcDKZyYrP1M=;
        b=rbVk9MPLBvIHu/Lw/8uykf2GM+MkXJIsKr/bzjjdiDVJ6Cc5Sj3JcKoaad19Lgkqr3
         9YyFrCfPOU2qbbU53NhWdysMEuswlRdCxBolLCLpTfNqLBSeQFocxi5M+u764TqNxSAG
         oBFkpyZu9NbghQOl/oPiFOaYagahbAZYAdgpwMpmIWruiXaQXkjH9P+N86l0F/3K80Ox
         phaVXROOcTdbK5JaQpqwPNYCYI5xBrhKykB94FqUuO1A2ZqW3ZAlemxEQ2KfmqklWyeb
         tBsLmDDqrA9OMndGHr10FWK8uEjaur/ypG+DWp9FThbXyMR5wwMbXhdr5e7TcbIDvv2V
         3K6Q==
X-Forwarded-Encrypted: i=1; AFNElJ/+Iy2P4gUSLCCoqRXWPvN8l8SdlOr7Y/HeJ9Dqw2nYAEY9cuRvKupxHnuYQt7GzM08hf9N3w2e/g05+KNCh5E5XA==@vger.kernel.org
X-Gm-Message-State: AOJu0YzHf8wrteATKp7DsSssQxfAfynvnyWOaKsmMGz1oy1P7mOJt+3h
	ZpvT4kws/OjQWudM4qhZMRDwKSWsQQ7Jz1VzbzglGk0Lc88RvNo9kg0DrVzHsw8DEdg=
X-Gm-Gg: Acq92OHa4I4pkYrg27yh6WSGRRWzueciHCB1yGANeg9JMlmNYYmd/Y1/Fa1D0vWvPlv
	RIUxWdzRggbphB124T0z1BYvcmRipyV8MNKGGgH//3LyhTRZxqZzTAZGX7RWGkUZ6t8HlYlyUpI
	8Afx5X/cTj2l5kXPcjHomxu5lWHLc1itiKbsSduXhiWZb7ru6jSCkDCRmwFQet0vVRvAAmxqAuc
	t/2GYcec1jyASQ7arg6DrU91z1e/WOIp7XWjb8lD9Cfx8j1cqONuDcqZv09NSXOKuz7vfMyPZTc
	RSFag4IA+KYFpfp9VhiVXF1SPWF2VQiXR/QCwzjihsWeQM6mLgYs3kQu7armsMKswQmdeww/WDn
	qVNqMmPcbso8COvXNcxJx2uybB6bRf1phq3uRG0/fPAAAvv5TFtU9mC6ZnbKbnGaHfsRO5E+t1i
	ptIOg37mIaDAo8yGFgMFvFAr7G2iaG8kmWRIn12fPQyjnT8+Bs2iuFGuLtHUjY
X-Received: by 2002:a05:6102:334f:b0:631:4c79:b1d2 with SMTP id ada2fe7eead31-67c8d07192cmr1788342137.25.1779456927055;
        Fri, 22 May 2026 06:35:27 -0700 (PDT)
Received: from mail-ua1-f47.google.com (mail-ua1-f47.google.com. [209.85.222.47])
        by smtp.gmail.com with ESMTPSA id ada2fe7eead31-67fd8850d17sm1334292137.1.2026.05.22.06.35.24
        for <linux-renesas-soc@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 22 May 2026 06:35:25 -0700 (PDT)
Received: by mail-ua1-f47.google.com with SMTP id a1e0cc1a2514c-95d3492fb1eso4635020241.3
        for <linux-renesas-soc@vger.kernel.org>; Fri, 22 May 2026 06:35:24 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AFNElJ9Ocj9AodLxoPtoX6aJczit3UO8r9Z1AlrqY7XwxZyGSTd84WugiZ/FjXyBA0qBf9Hie0Pa0XPg/E7zwZvl55/1Bg==@vger.kernel.org
X-Received: by 2002:a05:6122:4b88:b0:56d:9f2a:d6b1 with SMTP id
 71dfb90a1353d-58663771c2cmr1857047e0c.12.1779456924577; Fri, 22 May 2026
 06:35:24 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260506155804.3984418-1-prabhakar.mahadev-lad.rj@bp.renesas.com> <20260506155804.3984418-2-prabhakar.mahadev-lad.rj@bp.renesas.com>
In-Reply-To: <20260506155804.3984418-2-prabhakar.mahadev-lad.rj@bp.renesas.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Fri, 22 May 2026 15:35:12 +0200
X-Gmail-Original-Message-ID: <CAMuHMdUqvp=hmafE+UxbpY+zvQUP_oUeNa5XThEyFoaw=7qGHw@mail.gmail.com>
X-Gm-Features: AVHnY4LINUoqykcN6gqjkx-vdZZaVs7hY-T8nDgwUYqRXMQhjzCr9agy9tkXMMc
Message-ID: <CAMuHMdUqvp=hmafE+UxbpY+zvQUP_oUeNa5XThEyFoaw=7qGHw@mail.gmail.com>
Subject: Re: [PATCH 1/2] arm64: dts: renesas: r9a09g057h44-rzv2h-evk: Add
 alias for on-SoC RTC
To: Prabhakar <prabhakar.csengg@gmail.com>
Cc: Magnus Damm <magnus.damm@gmail.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk@kernel.org>, Conor Dooley <conor+dt@kernel.org>, linux-renesas-soc@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Biju Das <biju.das.jz@bp.renesas.com>, 
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>, 
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Content-Type: text/plain; charset="UTF-8"
X-Spamd-Result: default: False [-1.46 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FROM_HAS_DN(0.00)[];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FREEMAIL_CC(0.00)[gmail.com,kernel.org,vger.kernel.org,bp.renesas.com,renesas.com];
	RCVD_TLS_LAST(0.00)[];
	DMARC_NA(0.00)[linux-m68k.org];
	TAGGED_FROM(0.00)[bounces-33012-lists,linux-renesas-soc=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-renesas-soc,dt];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[geert@linux-m68k.org,linux-renesas-soc@vger.kernel.org];
	MIME_TRACE(0.00)[0:+];
	RCVD_COUNT_FIVE(0.00)[6];
	R_DKIM_NA(0.00)[];
	NEURAL_HAM(-0.00)[-0.988];
	RCPT_COUNT_SEVEN(0.00)[11];
	TO_DN_SOME(0.00)[]
X-Rspamd-Queue-Id: F1C945B55A3
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Wed, 6 May 2026 at 17:58, Prabhakar <prabhakar.csengg@gmail.com> wrote:
> From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
>
> The RZ/V2H SoC provides an internal RTC, which is enabled in the DT.
> The RZ/V2H EVK board also includes an external RTC in the RAA215300
> PMIC.
>
> Add an "rtc0" alias pointing to the on-SoC RTC node to ensure a stable
> device numbering.
>
> Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
i.e. will queue in renesas-devel for v7.2.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

