Return-Path: <linux-renesas-soc+bounces-30834-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id YARrOryHz2mwwwYAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-30834-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 03 Apr 2026 11:26:20 +0200
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 97F17392C34
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 03 Apr 2026 11:26:20 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 2315330166EC
	for <lists+linux-renesas-soc@lfdr.de>; Fri,  3 Apr 2026 09:23:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5797138C424;
	Fri,  3 Apr 2026 09:23:18 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-vs1-f54.google.com (mail-vs1-f54.google.com [209.85.217.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 95E4937FF56
	for <linux-renesas-soc@vger.kernel.org>; Fri,  3 Apr 2026 09:23:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.217.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775208196; cv=none; b=Gvj8rkoU2T9rcdr08y6k1N4KPMDIuWmAO4U8OiEarkzh4+3cftj/FdjbRnUyPhMjIdI85KiGORq77LEDZlVq/SdyR+eYpn8za4j20NRzkNQSTz/5soNkL+J8F63U9GALG0sFclSad12U0rJcSm7qPwjFSn88ZPpyfVhUdGGRK/g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775208196; c=relaxed/simple;
	bh=PteNZaH/pu2Rgr0Gs9WjcGnkXZwRRHo3rSjOHEa/flM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=NjrtvfxcbMoMq5UqGEGc/AAQSMoY45oicqWN85VxFHvd7AUBm0vHg1XKz1Xe7bsHTrMbeNCS6bvR4k92+vPtVVPWiV8V6Axurv8CE5UvcQnsHGAaGVYJ6Bnd/W7JWBiu0iJdqP1/4tMXoXEgTzv8zNvM4KnhJXnW5GQx6PRYhf4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.217.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vs1-f54.google.com with SMTP id ada2fe7eead31-604dfcc9892so1181396137.1
        for <linux-renesas-soc@vger.kernel.org>; Fri, 03 Apr 2026 02:23:13 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775208191; x=1775812991;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=I33x8hNGNTQHLqp8m/P6sxkK71TBmOtYKAjfqJkvDog=;
        b=H+QWXuu/M8dBR51DpswYXcKFBDyTRpe1qgeCl5PKC2xjkjNktjvuH8XaufdPqEr1vE
         7XODTy6MW9tt07W3OCpfN5eQ+ub4Z80DzLpdljkn/aSCtqxfRDvRd53CEdisfu8rNcyK
         ogxPBbui+IZbOtLJ12X++MyYkUhyZDgHX9htruX7A5mTuPiLhCdsDaV1+5ite4zdLd2J
         HvMgFtlfb2+B2zpOfwB5h1GDIKJhl7Gg46G4AlAEHlIJQknSkli0JQp+YgqpFVYUFFvr
         jSy49vjnsgKm64jDnx4iKdzO4v1MVa4u0DApjSn58SVtg1TnA4IRgRH8PR/zQacXwz17
         a+Jg==
X-Forwarded-Encrypted: i=1; AJvYcCUjtbhYmNEioPhZkseLGRCA2MZsozTrJ8HpuJlLuFMjh4KoJAsoowbUj9k0zqFsnWqoumoHDp2m7jHiSD17usQs1A==@vger.kernel.org
X-Gm-Message-State: AOJu0YzEjny7WntZX06XEgiBwAXlcpfZb23SeXnSw+Ae86GYJuvn7Dt9
	DFE7EbZOjVHBf4Nk7o2kplSzMPJiaKJ1OnYVvqJ1YoOko6Jo80Is86XWry+fJFGK
X-Gm-Gg: AeBDietldjOkc8mJgUlsUaKxTwEf/xdStLlgkzLvxsLcga0Ql2EZulEm2wPJ1gO+bkK
	f84f2fY2BzUXRg/JclGWb2wKLuihvMKYkJygclMXMLMf9PPHACqJ57Uq7YjWVg8H4bINO9LHxnh
	ECwJCwFBVAJXZxTGf7YslNNvUtkTBt49sint8ACAkVb9mniizrfAmBbcVx3axKYATUu08W5ZLXi
	mf8bZKSh2rS5qSbbhLNotR4deNk88SuYOBRde6EBJ/rBZcFhpXmpGF3pcGFOkNWLGm5hvZD/74L
	Y0IGNiPSnEtGc1lCEnan4OsoyH2tUbmj8wtqzNiPwoDPl0erB8aNkVT0DaAlV5CB+IAs+2tpwee
	GuNzT2enkj988wsjfpbRo0cu/J91K+g36c9UIRlEoQ/+Gj5Q5SIAtXxkfn6YvZgetVeG8sbS+xz
	/QJMCNkVmTY3LhgREodCzEWSTQw5NH/VTIy4ZajzkLDX/bEjiKCeS81h4GJR/S5LrD
X-Received: by 2002:a05:6102:5cc1:b0:605:5d09:8634 with SMTP id ada2fe7eead31-605a4cbb92cmr803042137.6.1775208191142;
        Fri, 03 Apr 2026 02:23:11 -0700 (PDT)
Received: from mail-vk1-f174.google.com (mail-vk1-f174.google.com. [209.85.221.174])
        by smtp.gmail.com with ESMTPSA id a1e0cc1a2514c-953fba6abbcsm5645376241.9.2026.04.03.02.23.10
        for <linux-renesas-soc@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 03 Apr 2026 02:23:10 -0700 (PDT)
Received: by mail-vk1-f174.google.com with SMTP id 71dfb90a1353d-56a8e0ea02aso1996246e0c.0
        for <linux-renesas-soc@vger.kernel.org>; Fri, 03 Apr 2026 02:23:10 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCXQjOQQBaqv6zCZs86T6hivWlgWZkRgDUKSE9RHDW0FGLI9c+0MYhLSF5dXTIaSP/WwhJHXG6pnUVxOSf5cHNrFJA==@vger.kernel.org
X-Received: by 2002:a05:6102:390a:b0:5ff:1d91:a4bc with SMTP id
 ada2fe7eead31-605a4fcd40emr771373137.18.1775208189971; Fri, 03 Apr 2026
 02:23:09 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260327234244.91707-1-marek.vasut+renesas@mailbox.org> <20260327234244.91707-5-marek.vasut+renesas@mailbox.org>
In-Reply-To: <20260327234244.91707-5-marek.vasut+renesas@mailbox.org>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Fri, 3 Apr 2026 11:22:59 +0200
X-Gmail-Original-Message-ID: <CAMuHMdUvMorMi+wXaY0Lyh6V7UAHfWmLi-L4q8UbuY7oe=UC+w@mail.gmail.com>
X-Gm-Features: AQROBzCQwZaYRUu7vhbxTj26YE3Owx_k7G6dQI1gQ3uOUpCmwWAEjJ6d9e-9qTc
Message-ID: <CAMuHMdUvMorMi+wXaY0Lyh6V7UAHfWmLi-L4q8UbuY7oe=UC+w@mail.gmail.com>
Subject: Re: [PATCH 4/6] ARM: dts: renesas: r7s72100: Add missing unit to bus node
To: Marek Vasut <marek.vasut+renesas@mailbox.org>
Cc: linux-arm-kernel@lists.infradead.org, Conor Dooley <conor+dt@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Magnus Damm <magnus.damm@gmail.com>, 
	Rob Herring <robh@kernel.org>, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-renesas-soc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-Spamd-Result: default: False [-1.46 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FROM_HAS_DN(0.00)[];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FREEMAIL_CC(0.00)[lists.infradead.org,kernel.org,gmail.com,vger.kernel.org];
	RCVD_TLS_LAST(0.00)[];
	DMARC_NA(0.00)[linux-m68k.org];
	TAGGED_FROM(0.00)[bounces-30834-lists,linux-renesas-soc=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-renesas-soc,renesas,dt];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[geert@linux-m68k.org,linux-renesas-soc@vger.kernel.org];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[6];
	R_DKIM_NA(0.00)[];
	NEURAL_HAM(-0.00)[-0.757];
	RCPT_COUNT_SEVEN(0.00)[9];
	DBL_BLOCKED_OPENRESOLVER(0.00)[glider.be:email,linux-m68k.org:email,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,mailbox.org:email,mail.gmail.com:mid]
X-Rspamd-Queue-Id: 97F17392C34
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Sat, 28 Mar 2026 at 00:43, Marek Vasut
<marek.vasut+renesas@mailbox.org> wrote:
> Add missing unit to bus node to fix the following DTC warning:
> "
> arch/arm/boot/dts/renesas/r7s72100.dtsi:40.11-46.4: Warning (unit_address_vs_reg): /bus: node has a reg or ranges property, but no unit name
> "
>
> Signed-off-by: Marek Vasut <marek.vasut+renesas@mailbox.org>

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
i.e. will queue in renesas-devel for v7.2.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

