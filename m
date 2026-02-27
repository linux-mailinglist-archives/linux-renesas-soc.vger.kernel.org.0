Return-Path: <linux-renesas-soc+bounces-28543-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 0NtSJI6xoWmMvgQAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-28543-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 27 Feb 2026 16:00:30 +0100
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id F42251B95E6
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 27 Feb 2026 16:00:29 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id B032030F9CC1
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 27 Feb 2026 14:55:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1E18D42B748;
	Fri, 27 Feb 2026 14:55:56 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-vs1-f53.google.com (mail-vs1-f53.google.com [209.85.217.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A52FD42982D
	for <linux-renesas-soc@vger.kernel.org>; Fri, 27 Feb 2026 14:55:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.217.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772204155; cv=none; b=GvaJQVfof6VV++ln14ZcZpeOeO6m6Wvn7mozYKwapA6zEx08PTpQlIpAiOSWq0lMrIY8gZmvcoAWyYq4SklYreIZOZuhr5v6x/FcoI5+oS4FFOEwl57aGvExR4n6GndlELMFokd67w/wqLqTM1MGRu3CVCVoGoVfoHpzM21dCbs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772204155; c=relaxed/simple;
	bh=lToFBo+bQaCa9neG/vLe3MHGOkvyleQBs1IqzhcHe1s=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Zm4/dqUI2kBaeC+cfjxs9a9oGXJoLKKJ+Qa9n+LSgl1g+TRsNs060114+mYrgdisgeO/X2iqc8l8kZNLPYTc8fyj9ci/t5Cy67eMorPccpT3ZQctvjFAnKAtU/yWGkOjotJ7VEooonk+2flBFBl4Sw8qR8m3N31i5zHCmJHptbo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.217.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vs1-f53.google.com with SMTP id ada2fe7eead31-5ff28393b18so973331137.0
        for <linux-renesas-soc@vger.kernel.org>; Fri, 27 Feb 2026 06:55:53 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772204153; x=1772808953;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=FUkkEiUGXuiXLmzIVFfuNzK2FaXQ+t2b+WPGwELOFZU=;
        b=gDHEBP993ef5eUqSg1l8Mzlo7yo1j9NqfbzXHuWEjnBvJHX1Wy4MzJN4agqYnqhLpr
         Zw9MiWutd8C8oBr8B7wUWmXeEUQ37JwxhUS51ryHOSb4h1HvGC3382fsBMejZaxcCvFP
         OHr7A4JXLbG68j6rVX/JuNo9PI3y9qiFFpojadornWAYcuwl+jyYH4gEWH0id3LBBXvU
         CCqHxZlQP0L+2mIYYD3wr/fDL5Aj3e3nLE0jub7soE8a+YvTieEXCnoML+s/McZjiZrs
         VaUwstMZX0Dr+09jWkTD2W7ez7ifLckXq/AvUlcd2TESi0gTMm9kuCTUyOeVvRFsTmpK
         liYg==
X-Forwarded-Encrypted: i=1; AJvYcCXe3NrliUiEMSCPTExiwiy2X+WGamhBL82Ap7n1FAXE420r3kSHQVoUffnxbigPyznOi8ezOdGRHLhrFSYQ4wnPUA==@vger.kernel.org
X-Gm-Message-State: AOJu0YwfEUfTmM9F9draeD6jwCqFeUxs8CjPtL9Anv8OrHGEoyDNgEpp
	Rs+5ppWUn7KxypGCZrY+K8hJYwxsV8J6WymdA+SFsSmgGZoKhj4g/ksWvy+oObm2woY=
X-Gm-Gg: ATEYQzwOAIACu9GzsxwQnWs8dnTKma+zoTixTQwLcWbqtWjIHqGukD4gxdeBFHNmZed
	jhNgZnh28DCrSjYowAFXv19v0jZkXRKr3unfdYyrE+h5RyHJNtX6xVa8tKziTV8iqL1y8NesrPh
	OPFuVjgUCC2cpCl7m6FE+/xkjQvq6cE1d4LRwwMGPNOoffCaqVeDcKN3gco2Vn/sMjKfrenHpfm
	yMQj6MmjWDbvF4E+YPcw2E2vEYoeiEfHeeeYI7Ggfno+O8aA8oCMs+1Mu/wGiJADIObQ2uIXvXk
	zXOtmybHRzitTxwFar1zdg9D9tT6CBTP/2WPGEEUz47N5iUkokLaeDRDF5tF/FUefz5VIdD4aA/
	+vpuSJrX/vnFJV3vNtuZUqqS58xuVzI+RKYDE/2juYML+KHApEDpPYmoQQKggyNZ7IjZRzr5oXd
	sT93PW06ycWvG+EA/clA1kpFeQYiwiWMQBHgsxMezBXyMyHwyjGhr8Wv855wqlcBcaVd+dRgU=
X-Received: by 2002:a05:6102:440e:b0:5ef:b32c:dff8 with SMTP id ada2fe7eead31-5ff1cda8e40mr3654019137.5.1772204152653;
        Fri, 27 Feb 2026 06:55:52 -0800 (PST)
Received: from mail-vs1-f51.google.com (mail-vs1-f51.google.com. [209.85.217.51])
        by smtp.gmail.com with ESMTPSA id a1e0cc1a2514c-94df65782f4sm4615924241.11.2026.02.27.06.55.50
        for <linux-renesas-soc@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 27 Feb 2026 06:55:51 -0800 (PST)
Received: by mail-vs1-f51.google.com with SMTP id ada2fe7eead31-5fdf71f3327so2212152137.1
        for <linux-renesas-soc@vger.kernel.org>; Fri, 27 Feb 2026 06:55:50 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCVO2Eymlfl4jSTGwpzPf5LvSt6np42a6ZuJ9qxOofDaznM766RzUkL8+8yTK8fEatrW4FRrgzpF4Atsag22bYbMIQ==@vger.kernel.org
X-Received: by 2002:a05:6102:f06:b0:5ff:1734:4ae7 with SMTP id
 ada2fe7eead31-5ff1cffe701mr3749937137.20.1772204150707; Fri, 27 Feb 2026
 06:55:50 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260128215132.1353381-1-cosmin-gabriel.tanislav.xa@renesas.com> <20260128215132.1353381-4-cosmin-gabriel.tanislav.xa@renesas.com>
In-Reply-To: <20260128215132.1353381-4-cosmin-gabriel.tanislav.xa@renesas.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Fri, 27 Feb 2026 15:55:39 +0100
X-Gmail-Original-Message-ID: <CAMuHMdWJh8y5zXUMtWcmYaEND=PXZUFa01xCVpKt_0X4BdztcA@mail.gmail.com>
X-Gm-Features: AaiRm53Ttbxl3AS1ZsDflKNTMNk92JmxxoblMh4cAxRt1__H5obq1pnJAwopKd8
Message-ID: <CAMuHMdWJh8y5zXUMtWcmYaEND=PXZUFa01xCVpKt_0X4BdztcA@mail.gmail.com>
Subject: Re: [PATCH v3 3/3] arm64: dts: renesas: r9a09g087: wire up DMA
 support for SPI
To: Cosmin Tanislav <cosmin-gabriel.tanislav.xa@renesas.com>
Cc: Fabrizio Castro <fabrizio.castro.jz@renesas.com>, Mark Brown <broonie@kernel.org>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Magnus Damm <magnus.damm@gmail.com>, linux-spi@vger.kernel.org, 
	linux-renesas-soc@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.46 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FROM_HAS_DN(0.00)[];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FREEMAIL_CC(0.00)[renesas.com,kernel.org,gmail.com,vger.kernel.org];
	RCVD_TLS_LAST(0.00)[];
	DMARC_NA(0.00)[linux-m68k.org];
	TAGGED_FROM(0.00)[bounces-28543-lists,linux-renesas-soc=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-renesas-soc,dt];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[geert@linux-m68k.org,linux-renesas-soc@vger.kernel.org];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[6];
	R_DKIM_NA(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[11];
	DBL_BLOCKED_OPENRESOLVER(0.00)[mail.gmail.com:mid,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,linux-m68k.org:email,renesas.com:email,glider.be:email]
X-Rspamd-Queue-Id: F42251B95E6
X-Rspamd-Action: no action

On Wed, 28 Jan 2026 at 22:52, Cosmin Tanislav
<cosmin-gabriel.tanislav.xa@renesas.com> wrote:
> RZ/N2H (R9A09G087) has three DMA controllers that can be used by
> peripherals like SPI to offload data transfers from the CPU.
>
> Wire up the DMA channels for the SPI peripherals.
>
> Signed-off-by: Cosmin Tanislav <cosmin-gabriel.tanislav.xa@renesas.com>
> Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>

Thanks, will queue in renesas-devel for v7.1.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

