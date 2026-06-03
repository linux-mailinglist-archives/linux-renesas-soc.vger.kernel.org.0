Return-Path: <linux-renesas-soc+bounces-33520-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id pViBEu0jIGqXwwAAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-33520-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 03 Jun 2026 14:54:05 +0200
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 92018637B91
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 03 Jun 2026 14:54:04 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=none;
	spf=pass (mail.lfdr.de: domain of "linux-renesas-soc+bounces-33520-lists+linux-renesas-soc=lfdr.de@vger.kernel.org" designates 172.234.253.10 as permitted sender) smtp.mailfrom="linux-renesas-soc+bounces-33520-lists+linux-renesas-soc=lfdr.de@vger.kernel.org";
	dmarc=none;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 0AB7D312407D
	for <lists+linux-renesas-soc@lfdr.de>; Wed,  3 Jun 2026 12:43:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 72AA043E48A;
	Wed,  3 Jun 2026 12:43:05 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-vk1-f169.google.com (mail-vk1-f169.google.com [209.85.221.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3653E43E9D6
	for <linux-renesas-soc@vger.kernel.org>; Wed,  3 Jun 2026 12:43:03 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780490585; cv=none; b=stqPJR7UE+FhQs+Mnpu2xbKeNRt9fhLAOj+TY3Xg52LThWaxxB45q7X9zqqgNJSjWI0ee5ZHveMfWR9XYQpxgP0yR0JoBUgzoJWUxEnONAPxpLTsMY0gh93JeT8STfSCa/9bGKUk0kfnhptkmnQaGT3PD0xUczQLHKRPA3bcusY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780490585; c=relaxed/simple;
	bh=k13aCs1RdoPqecPo1wr59qkqrbO+R83+DXAj56G2grg=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=QVZkbU7sLIeYm6AXmwHL2vmuy+BmH1iqup1rKBS3T7J4R3gZoigTeEI0bwHXWD3te56PhGu89qu4wqfjuEsa3NOC8/VIRcmIFlm8Ml10TMgy8gIUONa/XbHOI1yVatcm0r7oK2gPZCVaVo+99DNfuscLkaxZiuW1cfj600DYSZY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.221.169
Received: by mail-vk1-f169.google.com with SMTP id 71dfb90a1353d-59d541955f8so1581709e0c.1
        for <linux-renesas-soc@vger.kernel.org>; Wed, 03 Jun 2026 05:43:03 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780490582; x=1781095382;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=jWxBYc1IVZbFBqFpe+a7OXnuXHa/My8CwptPt7UTNAk=;
        b=bB23NuOerA4l0O9UcWsXUNxC5THmZIflxeMyKxw9Sj13X1TEz8a4Z1l55ve5vSE8sK
         ib2XDFE4Tz2qiUX7x5SFAPgbT+Py5F7Sb78mSoje53C37aUCtl9Mi5UfNEX00tkf426i
         zGAIBfCWIpCrORktQmab44K6dk80aX+ZxxiX7Q8Un45MLr5NxRiq4d4L/KnyRoUWrb5L
         lrULNdb8NMnuehemiP/Gb+PRbQgroLwqTL0lupQnQ4BOEWZnMrjSV8h33wXOawBQWQyt
         rHEuiBk/QSdFX+ifIBDx00MCnqaJYCkbqNykphQWaTpjb/pUdO1mNpiQN/iqR0gZFGZD
         U5gA==
X-Forwarded-Encrypted: i=1; AFNElJ+4Lry/ljWHcpH0zzW0hVeQw/jMgPQ9pBGBlo36FjawWYHooqp2/icg4LXQTKeHjomGDibbFN40R9jFFUk+qxpFoA==@vger.kernel.org
X-Gm-Message-State: AOJu0YwFty5Lq+LglFyOb1p7f7t69h4Khjn+bldH1AfJmIch6r+Tycbu
	T1oGwPWDyn9qYq491u08mRECvtjKTysiwyrl3p2n8p8Cq8p2poIaGcTv/L+y7M8VTws=
X-Gm-Gg: Acq92OEbb4nvY9iEsu08CsN8HXI1OBTp6SKl60GHb6mKJajJL/b1B7b7XgnzoqJM/mp
	I8D5fCF9e4/JXT071GGZXLv38xSCEbKyT9pe8xL0IQywnDxp2C8/KcuAdj+Mg94ZIUIrmjN/Fy0
	DpiuSEJdeSoti0Aj80kfoKIEsODVKuAXuvlatglrA1vv4lq35uCr0uH57C0nHdIj1HOKkGSzC2h
	kKqeMyHsZsZ35ZOKoY61puqNmj9i9fOG1gSm9h8YQ5sYysAQD48zEDVCMAEY7TVWbVyB0Dm9V/C
	MfAkY+rzqew61a6tykfX77QBxi4QkmJXUsvImclSgGQr9VKMz0sUWFVHki6ddyhZj+fhJOQ90Qq
	RNAZXhkn9kriG57P4lrDdtLlJO89o89ul4WkEbwSvU3rjz2jsldk+sgaJwPLspGt2fM7rvgEGFe
	dZ88C2+a6EVvr5XpLgg8LP/sXo5KmFereK1JK1EfkR5JJiCrojzu7FiUrLhFiT2iywoAh+zCQ=
X-Received: by 2002:a05:6123:2e7:b0:5a2:5669:d6d7 with SMTP id 71dfb90a1353d-5a6e8628e41mr1795976e0c.9.1780490582189;
        Wed, 03 Jun 2026 05:43:02 -0700 (PDT)
Received: from mail-vs1-f51.google.com (mail-vs1-f51.google.com. [209.85.217.51])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-5a6d777996csm2189658e0c.7.2026.06.03.05.43.01
        for <linux-renesas-soc@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 03 Jun 2026 05:43:01 -0700 (PDT)
Received: by mail-vs1-f51.google.com with SMTP id ada2fe7eead31-6cfc776e451so1238146137.1
        for <linux-renesas-soc@vger.kernel.org>; Wed, 03 Jun 2026 05:43:01 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AFNElJ9NYGqmv/2Kobv21298pbfH/X6Twp16YXlo5rbiKS6CDPi1j89B9VKOqWbq87fruCJ9yoOm+9wowKheS0BnxfyAkw==@vger.kernel.org
X-Received: by 2002:a05:6102:3594:b0:607:4fde:1921 with SMTP id
 ada2fe7eead31-6ec490c3d34mr995887137.24.1780490581062; Wed, 03 Jun 2026
 05:43:01 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260601113919.8327-1-marek.vasut+renesas@mailbox.org>
In-Reply-To: <20260601113919.8327-1-marek.vasut+renesas@mailbox.org>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Wed, 3 Jun 2026 14:42:49 +0200
X-Gmail-Original-Message-ID: <CAMuHMdXGJ+Ww+ek3KLvrnFKpw2cJn=RB8q3k=W6ECVgtw-zK6Q@mail.gmail.com>
X-Gm-Features: AVHnY4IY7ZyzpnX56PnrLKeT4Q6f6pff2bdlvBxWDQkSl_14GHUg_sgrQjRBUyI
Message-ID: <CAMuHMdXGJ+Ww+ek3KLvrnFKpw2cJn=RB8q3k=W6ECVgtw-zK6Q@mail.gmail.com>
Subject: Re: [PATCH] arm64: dts: renesas: r8a78000: Enable application CPU
 cores via PSCI
To: Marek Vasut <marek.vasut+renesas@mailbox.org>
Cc: linux-arm-kernel@lists.infradead.org, Conor Dooley <conor+dt@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Magnus Damm <magnus.damm@gmail.com>, 
	Rob Herring <robh@kernel.org>, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-renesas-soc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-1.46 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-33520-lists,linux-renesas-soc=lfdr.de];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FREEMAIL_CC(0.00)[lists.infradead.org,kernel.org,gmail.com,vger.kernel.org];
	RCVD_TLS_LAST(0.00)[];
	DMARC_NA(0.00)[linux-m68k.org];
	FORGED_RECIPIENTS(0.00)[m:marek.vasut+renesas@mailbox.org,m:linux-arm-kernel@lists.infradead.org,m:conor+dt@kernel.org,m:krzk+dt@kernel.org,m:magnus.damm@gmail.com,m:robh@kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linux-renesas-soc@vger.kernel.org,m:marek.vasut@mailbox.org,m:conor@kernel.org,m:krzk@kernel.org,m:magnusdamm@gmail.com,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_SENDER(0.00)[geert@linux-m68k.org,linux-renesas-soc@vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	MISSING_XM_UA(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	RCVD_COUNT_FIVE(0.00)[6];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[geert@linux-m68k.org,linux-renesas-soc@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	ALIAS_RESOLVED(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[9];
	R_DKIM_NA(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-renesas-soc,renesas,dt];
	DBL_BLOCKED_OPENRESOLVER(0.00)[mail.gmail.com:mid,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,linux-m68k.org:from_mime,linux-m68k.org:email,vger.kernel.org:from_smtp,glider.be:email,mailbox.org:email]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 92018637B91

Hi Marek,

On Mon, 1 Jun 2026 at 13:39, Marek Vasut
<marek.vasut+renesas@mailbox.org> wrote:
> Add PSCI "enable-method" DT property to all application CPU cores.
> This allows the OS to bring application CPU cores up and down.
>
> Signed-off-by: Marek Vasut <marek.vasut+renesas@mailbox.org>

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
i.e. will queue in renesas-devel for v7.3.

> NOTE: This depends mainline TFA 2.15 or newer (or SDK TFA version
>       which includes b950bc09f5e9 ("plat: rcar_gen5: Fix multicore
>       boot by ensuring fixed address for plat_secondary_reset"))
>       and on SDK 4.32 or newer SCP firmware.

I assume SDK 4.32 includes a sufficiently new TFA, as that works for me?

Thanks!

Gr{oetje,eeting}s,

                        Geert


--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

