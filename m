Return-Path: <linux-renesas-soc+bounces-33417-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id OAX6Nvy4HmrZJgAAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-33417-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 02 Jun 2026 13:05:32 +0200
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 44E4162D1DE
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 02 Jun 2026 13:05:32 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 93DC7303E483
	for <lists+linux-renesas-soc@lfdr.de>; Tue,  2 Jun 2026 11:01:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5413F37F75E;
	Tue,  2 Jun 2026 11:01:12 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-vs1-f50.google.com (mail-vs1-f50.google.com [209.85.217.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 590B238AC79
	for <linux-renesas-soc@vger.kernel.org>; Tue,  2 Jun 2026 11:01:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.217.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780398072; cv=none; b=VAFavyyAY2t3m8QgKkBP3vty61MBHBAFhdHo7rtgKOH2zB6aySzS319RWllIUI3X7XINfoEKzJnO06jHKU4siSOOUjn3EmsxVt+vPWoXryXf0tITWvSZCFRvQAbILAvAYXFvj5dYXVGgad1qEbYvlgacohnNYukKBVzstTioiE4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780398072; c=relaxed/simple;
	bh=NqH1FNMQ9zyJu1faayTHUSgA7NJKPbme9XX6KBLu/0I=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=FaJV/XcPZOG0jMFWC4Z9venTl1AZ0ao9hXMCJ5fbqkox+mOHa5gqnUA5v39+pt6Zjjhh2Cj+uXSsNq/1iN9MNou2zdWf/h+32NUu7TOItV1SsDGsU/k03kiLTtsEBCw5MA8BJagXyk+MEbYwX9P9nBMozrZoW42mKU/XNLJ/tXI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.217.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vs1-f50.google.com with SMTP id ada2fe7eead31-6c3099b11a9so1469539137.2
        for <linux-renesas-soc@vger.kernel.org>; Tue, 02 Jun 2026 04:01:10 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780398069; x=1781002869;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=quFd3bFmDxUCLWFjABTEW7yL2A0qhMBAyX1hbqGA//A=;
        b=c47g5O4cKAQEegpxJ5+akW3+qg+wWYSIMRYtQOEnr//cY2UNwTFc11ZExASfEa6y8L
         6Wbu+ZLZDvr4S1jVoa88T6nYiEcgfL9EV8UT0SC2u+uzsQm5/9iBWbcsljOzzYgSUR1j
         iuokSgbQMrSy631kPN15atf1O9NCnO2Y57Pucu0ODOE7kI05Z9BwXVeRxQL/gYYRMe+4
         xAfVVCYxHL5/5B3K7SNJQNaw6hNOlE4o7qixWpGdYYsP3tHjh6djTTX/TqDgmU8cQxKQ
         RpbiqLUO+PormSsLouj7rFsiToiEw9A6TcCoX9plhzh1VkZNKwuZp5BTzICz+Ig4xfUi
         aFtQ==
X-Forwarded-Encrypted: i=1; AFNElJ+PTsjD4MD3qSu9kSBeIjrFe+hdF92R0lHqn0HaT7Xr48pSVUnNzDLf7OAeXnHKKl6lhK9Q/SmHM8vNGBMW5vecYA==@vger.kernel.org
X-Gm-Message-State: AOJu0YweAfkT0l/FzHdWXjG+GTqRYccrWOVrh6aHIC3BiMlNHzG9zOCq
	sWWg6uCBDwBblFaxeNEiTrfDfjXnuc/V6vAJVKqTeIkUFBYiDkVOxQH/yFhP6yEl
X-Gm-Gg: Acq92OF2Zs9aD8vyoINm0+ZJ1tEoko7fjtSnoigQ/Ni3vqH8cNmdTe/B0hvoM/tNIBp
	1dXmH58Xw+04ct/1wth7gsCqq476h4fRnKNGThR6xyqRyz8zKH/sp3KlnNrWJNm1teEKsr3FwSd
	Vi9gah506iT+IdfzUyzkjUWgs9b23W+pH27ua6m8iLY1YWfO4wP7BVw53tOIBIc+zJDgtPYr2pn
	yc5p2DL2QS8byLrH/BU6p8td6xXVkkAzccmIMjOWpAm7JikEZpAPL/mHkHwzFMRpgJB9i7wpFOV
	dPZxao1xkqk0gAX9Qu4bJeylPnLyXEsc2Irc4J3GWvIjYcDreBsWW5WFZos2oOjhtFFgIlUzQQs
	jH+lX4n7FTjA9G9Lh1+/6Do8bjF6Mt2TE7HC5LgAPQpLipuTFmbGWAwD0jKhuSPx8PRZ1iK5l0h
	djLFT8gZ8wysVItBWt2l7R0VIYKcYKOSCa75M4cekXVpuF6ibswG7oRKLJI5U49Tlqlz81wXNk6
	fE=
X-Received: by 2002:a05:6102:80a6:b0:5f7:240f:bbee with SMTP id ada2fe7eead31-6c68d43dbb8mr6235294137.1.1780398068962;
        Tue, 02 Jun 2026 04:01:08 -0700 (PDT)
Received: from mail-vk1-f178.google.com (mail-vk1-f178.google.com. [209.85.221.178])
        by smtp.gmail.com with ESMTPSA id ada2fe7eead31-6bfc81ab8a5sm8959169137.9.2026.06.02.04.01.06
        for <linux-renesas-soc@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 02 Jun 2026 04:01:08 -0700 (PDT)
Received: by mail-vk1-f178.google.com with SMTP id 71dfb90a1353d-59eb501bcf0so831043e0c.0
        for <linux-renesas-soc@vger.kernel.org>; Tue, 02 Jun 2026 04:01:06 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AFNElJ/bj4Osk8f4mtNsAs86sdEkDENhrH4JGdnbLYBgfi1JQPCNlbGcZVdz+MqIOrFLOeVWscsSlPU5Ni2EX4FILjuZeA==@vger.kernel.org
X-Received: by 2002:a05:6123:2e6:b0:59b:1012:3f42 with SMTP id
 71dfb90a1353d-59bf37a2880mr7199139e0c.10.1780398064583; Tue, 02 Jun 2026
 04:01:04 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260529130704.327505-1-biju.das.jz@bp.renesas.com> <20260529130704.327505-2-biju.das.jz@bp.renesas.com>
In-Reply-To: <20260529130704.327505-2-biju.das.jz@bp.renesas.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Tue, 2 Jun 2026 13:00:53 +0200
X-Gmail-Original-Message-ID: <CAMuHMdWhdDc1dgQqDUeiOmMnM05+1U2zitV0W_9rwNaHdfVaYA@mail.gmail.com>
X-Gm-Features: AVHnY4L-jYfQDDQl3nCvQFzjNbNG3mAAr1K9WWmRppD5oHyedAVujAGuEiu4-DQ
Message-ID: <CAMuHMdWhdDc1dgQqDUeiOmMnM05+1U2zitV0W_9rwNaHdfVaYA@mail.gmail.com>
Subject: Re: [PATCH v2 1/2] arm64: dts: renesas: r9a08g046: Add RSPI{0..2} nodes
To: Biju <biju.das.au@gmail.com>
Cc: Magnus Damm <magnus.damm@gmail.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Biju Das <biju.das.jz@bp.renesas.com>, linux-renesas-soc@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>
Content-Type: text/plain; charset="UTF-8"
X-Rspamd-Queue-Id: 44E4162D1DE
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.46 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[gmail.com,kernel.org,bp.renesas.com,vger.kernel.org];
	FREEMAIL_TO(0.00)[gmail.com];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[bounces-33417-lists,linux-renesas-soc=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	DMARC_NA(0.00)[linux-m68k.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MISSING_XM_UA(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[6];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[geert@linux-m68k.org,linux-renesas-soc@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	R_DKIM_NA(0.00)[];
	TAGGED_RCPT(0.00)[linux-renesas-soc,dt];
	RCPT_COUNT_SEVEN(0.00)[10];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,mail.gmail.com:mid,linux-m68k.org:email,100f3000:email,100b0000:email,renesas.com:email,glider.be:email]
X-Rspamd-Action: no action

Hi Biju,

On Fri, 29 May 2026 at 15:07, Biju <biju.das.au@gmail.com> wrote:
> From: Biju Das <biju.das.jz@bp.renesas.com>
>
> Add device tree nodes for the three RSPI channels on the RZ/G3L
> (R9A08G046) SoC.
>
> Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
> ---
> v1->v2:
>  * Updated reg size from 0x400->0x1000.
>  * Dropped num-cs as the hardware has 4 CS lines and the driver is
>    hard-coded to 4.

Thanks for the update!

> --- a/arch/arm64/boot/dts/renesas/r9a08g046.dtsi
> +++ b/arch/arm64/boot/dts/renesas/r9a08g046.dtsi
> @@ -442,6 +442,75 @@ rsci3: serial@100f3000 {
>                         status = "disabled";
>                 };
>
> +               rspi0: spi@100b0000 {

Moving up before rsci0 while applying, to preserve sort order
(by unit address, but grouped per type).

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
i.e. will queue in renesas-devel for v7.3.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

