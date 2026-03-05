Return-Path: <linux-renesas-soc+bounces-28894-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id mFGALLmbqWnGAwEAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-28894-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 05 Mar 2026 16:05:29 +0100
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 6A62821423C
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 05 Mar 2026 16:05:29 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id E5BB530A31A0
	for <lists+linux-renesas-soc@lfdr.de>; Thu,  5 Mar 2026 14:58:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 29A863B7B61;
	Thu,  5 Mar 2026 14:58:16 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-vs1-f41.google.com (mail-vs1-f41.google.com [209.85.217.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EB18C3B5314
	for <linux-renesas-soc@vger.kernel.org>; Thu,  5 Mar 2026 14:58:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.217.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772722696; cv=none; b=sEO8DlzuxiWPsxs7k7ih0LymczctS2ZYh7shD3C/43PTY7i6YJO27O0WWRgIPkTINQ/9B4KjgDjxD/GB8eiVJA6ry2LbqaEjA6U7n8gb9Ijkuz9SZslDqKRP3r1Nlh6bXaRjGs5ZT6AbRDp8uYNBrFPtWx25g7/M+HfaLD7WPkM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772722696; c=relaxed/simple;
	bh=5vD4Kg/M6WLs7JWJ9iOz9JD4pJnjd1OxEmi1NYB0Vic=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Jf6cdo2p6zisMcvk8oB27YXXXglzZICG0ubhdjvi05ICo8MxBvXMpc1Lk/nksOEJROPPNeswszrHQQtRa9cS6J9/qhn4MwSmCWruXAoI4H4Hc3HlYTx4Mwe5TsBSd36pUAWplE8T67+XCUi8adaZvlBulWrnZi148V/7BV5GV3c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.217.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vs1-f41.google.com with SMTP id ada2fe7eead31-5ff09bb6335so2552351137.2
        for <linux-renesas-soc@vger.kernel.org>; Thu, 05 Mar 2026 06:58:14 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772722694; x=1773327494;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=fqSOZpWNO3C/9wQ4B5UwddHacEUZVZn8oPi7wE7jo6I=;
        b=pjZoWbGrXET++5//EFxKyD3WUewuL29afM7KiD8tzkWkahM4uT3e2zDiQKH0weO5PO
         xTzifUqA+cLBoPZM+Bkv9DT9mZ8TNjikLwpibb7l/h+IJ5soTuNE9AuTVd2XV+I/be4T
         stnW7gFfjlHxo0BktlOxwHgCI5L2UmVKXlJ5g1oKDJuUsmNLIXJAYAhG8L+it/MQrwOi
         roVlUk7x49mj3XrrP/9l9Rcd6SyewWAkj78WB/DWWumHoLDvZscX+hV2xjZG2HXn+dhr
         XV24RAg76bJoY84oEBt56MvWXD+vZbVdIpv/QfWLB9pOwZkS4h6HFgtj+O+25t8pjRA2
         JaNw==
X-Forwarded-Encrypted: i=1; AJvYcCXEePVS2yvoISUpw2Nub3W89JhTpxAtIUkHTWjcTVoOUm4gqzz6Wis++zYkenp6SavVIR5BM5ZPPwE37nZrdCbhqA==@vger.kernel.org
X-Gm-Message-State: AOJu0YzL7yZZstnLBLdzO6LDgLHhO081sQOGr8ZMxb09/tbg79hqRdq4
	fa22HiqaitwVp9or0PrzIWl7a/KM44aaQY2i6O1tKX213FcUVcDhetHVvvmQapoBMjs=
X-Gm-Gg: ATEYQzySKWejeKVwvK+OnSNnpbdYAQmn5bsqN+joTsqpSPm51BDWB+7TUcVTpJjDfom
	rznu5Nna5HtLln+f9G17g1msnJQIf1b5cQoIgD1gkTy8Jc4r0cYA3jUak6eJG/onnF5xhErII1X
	/aUW6uTngIe0KzqjAeRwqh+aMwOvexrtdgCAi12F4OR2xoSDexQDAACBvxERDbk/5x6NUHpPr7L
	9dm7Km6IqpKv7Km7rB+oQwJL39Pf/nYcYMFbFgkxrh9hDCWRWzTbenwoYqh4+6DILOEnlf/Tgwb
	WxZN8pFORqIt3yoLPYoHi9GVmxwuYpdHgcauJhPh9zR7IxTkZ6oom7yaKxsfkZ2a5WV5NdYa6Fx
	5qLmoriXH7FsvILxcji5BE5ISPVLQwItCrNOqElZ5IBbCUF14dFKZSEFSNzPoCgTPUTBMmIHDDl
	LjIppjTSYunswLzX1VbJf+nC8LQGKt/8QhL99YVYfuvIrMHUxwUgtV2jz2iLn7+QfiROK7LFI=
X-Received: by 2002:a05:6102:290c:b0:5f1:72a7:f879 with SMTP id ada2fe7eead31-5ffaafc676bmr2797519137.28.1772722693679;
        Thu, 05 Mar 2026 06:58:13 -0800 (PST)
Received: from mail-vs1-f52.google.com (mail-vs1-f52.google.com. [209.85.217.52])
        by smtp.gmail.com with ESMTPSA id ada2fe7eead31-5ffa300c3f8sm6666656137.6.2026.03.05.06.58.13
        for <linux-renesas-soc@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 05 Mar 2026 06:58:13 -0800 (PST)
Received: by mail-vs1-f52.google.com with SMTP id ada2fe7eead31-5ffa277c156so533246137.1
        for <linux-renesas-soc@vger.kernel.org>; Thu, 05 Mar 2026 06:58:13 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCVYh8wpqp4QXwtPCTvxPf9IbdP/ULzNpu0irvCuySKK9V793mJaLXLpV0e4cZwP48bYKtOnpm7cMsjDa1sTqxt4Kg==@vger.kernel.org
X-Received: by 2002:a05:6102:f06:b0:5f1:4fc3:855d with SMTP id
 ada2fe7eead31-5ffab26e129mr2408811137.38.1772722691995; Thu, 05 Mar 2026
 06:58:11 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260203103031.247435-1-biju.das.jz@bp.renesas.com> <20260203103031.247435-9-biju.das.jz@bp.renesas.com>
In-Reply-To: <20260203103031.247435-9-biju.das.jz@bp.renesas.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Thu, 5 Mar 2026 15:58:00 +0100
X-Gmail-Original-Message-ID: <CAMuHMdW3zMqMxevkP5DLrRiUY0DMb+yngFf=yayzkeHZpq-4uQ@mail.gmail.com>
X-Gm-Features: AaiRm52qa0hxXfUT-U-AmnVbAfPkSS5Tat4oKezMmKZoi-V1pVPBaxiOn7gK0BU
Message-ID: <CAMuHMdW3zMqMxevkP5DLrRiUY0DMb+yngFf=yayzkeHZpq-4uQ@mail.gmail.com>
Subject: Re: [PATCH v3 08/10] arm64: dts: renesas: Add initial support for
 RZ/G3L SMARC SoM
To: Biju <biju.das.au@gmail.com>
Cc: Magnus Damm <magnus.damm@gmail.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Biju Das <biju.das.jz@bp.renesas.com>, linux-renesas-soc@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>
Content-Type: text/plain; charset="UTF-8"
X-Rspamd-Queue-Id: 6A62821423C
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.46 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FREEMAIL_CC(0.00)[gmail.com,kernel.org,bp.renesas.com,vger.kernel.org];
	TAGGED_FROM(0.00)[bounces-28894-lists,linux-renesas-soc=lfdr.de];
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
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	NEURAL_HAM(-0.00)[-0.318];
	RCPT_COUNT_SEVEN(0.00)[10];
	R_DKIM_NA(0.00)[];
	TAGGED_RCPT(0.00)[linux-renesas-soc,dt];
	DBL_BLOCKED_OPENRESOLVER(0.00)[glider.be:email,renesas.com:email,tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo,linux-m68k.org:email,mail.gmail.com:mid]
X-Rspamd-Action: no action

On Tue, 3 Feb 2026 at 11:30, Biju <biju.das.au@gmail.com> wrote:
> From: Biju Das <biju.das.jz@bp.renesas.com>
>
> Add initial support for the RZ/G3L SMARC SoM with 2GB memory and
> extal clk.
>
> Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

