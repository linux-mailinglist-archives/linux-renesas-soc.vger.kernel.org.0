Return-Path: <linux-renesas-soc+bounces-32212-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id cHfdF+Vg/Gm2PQAAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-32212-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 07 May 2026 11:52:37 +0200
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 005214E6466
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 07 May 2026 11:52:36 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 3CB82300C317
	for <lists+linux-renesas-soc@lfdr.de>; Thu,  7 May 2026 09:52:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9350D3CB2CF;
	Thu,  7 May 2026 09:52:31 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-vk1-f170.google.com (mail-vk1-f170.google.com [209.85.221.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E9B9531A81C
	for <linux-renesas-soc@vger.kernel.org>; Thu,  7 May 2026 09:52:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778147551; cv=none; b=P4y+Ih9CBUHvtCO0aCi1YT06zcoWbd3l3fP2zX3CxiRxlzmFXLGQfQTVdR6gAzqM0O2mm1ePc21SIU5HsK1KxWAP2ZlmR64d6nDrmWTHCwvzTqWdbrpDj891dVa8v1wQMpvDyQWWTOfPJftTBMwj0GovUElnbqJp2jfonEEFkdY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778147551; c=relaxed/simple;
	bh=iiCjcMKQDb6dh1Z2nARM6SLN843hq3vWmsi9ZYCMshM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=h6nfE0Aj7g0Jdv4CiEoBhScR/sXRKwxeGFDwTWlo5cKHmRg2Jhhpdl83ODNwP0BhwRto9Fd/Po6pGGpmhzHenA+VnhXjkgT130fUXdleain64WiYUhoZTa3LYR0uBVrKIWL/qspHiULuSiCSxS5HWQ/dqH912SNRUlJEJ0S6A3c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.221.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vk1-f170.google.com with SMTP id 71dfb90a1353d-5751a9020faso423467e0c.1
        for <linux-renesas-soc@vger.kernel.org>; Thu, 07 May 2026 02:52:26 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778147546; x=1778752346;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=K+tvqFUkK77BUXjUfjU3WlAimu0K87l+Oc8QxPKsLbc=;
        b=GG8OHSx4jbdppIlZCi3SjUp6KYPJQ6xXVgo7ULn4mUPQu/b11/Aa+4NFA2NAw4BTXQ
         kw02XTk5ouXZ8hGYpT5mCsYMr2uYKVPGeuwFuGxEDH3tSJBB3NdAw/SWNmlkcuWmQ96G
         FVHrTiR4jLCD1lAnRfiK+HbQkVjuIaSL4CBXCb/N7l6U5k55gm7NLHRo4DYRH33nDF6M
         vw2r8QMuJRI6euDUsZL83QjGfbkV3w42kTdu/wLFL6aVUqYCGFwwmsNzQxw9++aEL97N
         NKjpiOAP8zTCwp3DJBObHow71i/XYTzn2DWF6SDnipz0CJj1s0WCngpyM+PfVn+rfnLJ
         3wDw==
X-Forwarded-Encrypted: i=1; AFNElJ+tKfwK2HeiyOU8mI4uK2JVl7GIqqLxzmMOA5NbxHLhyDO30OG7yz+cU7TWdY27AI+8cFXqHl6dDsKCDTgwFC9WWA==@vger.kernel.org
X-Gm-Message-State: AOJu0Yyxm3QlWQrfmJiFOnh4soQRpoD9lL86nyOjBVL4kjr13sH0XVtk
	Yde9aiguMxU5gW0HBl3Knu7u+wYEhzSfrKbxmK64j4f9ubBUOR9O2ENprGUmWa/snwE=
X-Gm-Gg: AeBDiet39NRHeiZD2Rl1nkzsh7qiDyItLgsNXpHwg1vrjITCRgE6MJ1Rm/L8aICkCU9
	G6+pT1WKXqSwWfqnhgDA7SheJOZNrxNfGh4lZOlhmkAJuaBQBbfHSFhFfWkfEMl3OWdqxK/0kHG
	Qa24bhyyHBoaZ8133dEgwcShNX5Zau6ttwW7CGWoR3HjnvZD04V2OLd44ugRfWaXL12DGhQ5hDC
	Nr5PgMHCbrrii8A2v4ZHbKj5Ml8ShE/xZNsHPptddFI6IF8SDYzpje64bZKWsNb7OVHn/mf3m3l
	LDqHyBj9XXF0vWuSSHV0yyxBA2M+h869LOobwVJ8KCfpFPMfzNcyxrspHyU7lAatt1dmxT0atpE
	InyefMIXIRAQnH7HrHCpJkiBcpfcRfHZ4jgtVOsVqOdu4a3x3f5zQmtcH0GifwITRtnjUOfXRj/
	6I1V6I5QJYoimWVMEiMl5Tk5Um80nRKrnrmciqlVKCciqbryyX1xDYM+7mnu7ahwlRe5SuC7Q=
X-Received: by 2002:a05:6122:341a:b0:56f:6880:a3fc with SMTP id 71dfb90a1353d-5755955a51dmr3559143e0c.7.1778147545860;
        Thu, 07 May 2026 02:52:25 -0700 (PDT)
Received: from mail-ua1-f46.google.com (mail-ua1-f46.google.com. [209.85.222.46])
        by smtp.gmail.com with ESMTPSA id a1e0cc1a2514c-95ce08f4a7asm10242408241.5.2026.05.07.02.52.24
        for <linux-renesas-soc@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 07 May 2026 02:52:25 -0700 (PDT)
Received: by mail-ua1-f46.google.com with SMTP id a1e0cc1a2514c-95cc96eac66so389233241.1
        for <linux-renesas-soc@vger.kernel.org>; Thu, 07 May 2026 02:52:24 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AFNElJ9z2TTrD/1Nv9ld0sGWoHCMpCZdcyFsXDVLIeo/9fDzzYcdTaEoxIAH0BwHli8WJUBIKJm7Lpf+MyHkm2QSy5LITw==@vger.kernel.org
X-Received: by 2002:a67:e102:0:b0:602:9977:a4f5 with SMTP id
 ada2fe7eead31-630f90ee36amr3499863137.27.1778147544736; Thu, 07 May 2026
 02:52:24 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260326111953.31024-1-biju.das.jz@bp.renesas.com> <20260326111953.31024-3-biju.das.jz@bp.renesas.com>
In-Reply-To: <20260326111953.31024-3-biju.das.jz@bp.renesas.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Thu, 7 May 2026 11:52:13 +0200
X-Gmail-Original-Message-ID: <CAMuHMdX1M6D=1TvJs5a2BPUH7DqeBks5gSi8E+jYfTdw29wRdg@mail.gmail.com>
X-Gm-Features: AVHnY4KE3t_QeJUhj6FrfQKOY76vzo6G6nbw5yB_AuakYbQaBIAxN1jj6MHUy4A
Message-ID: <CAMuHMdX1M6D=1TvJs5a2BPUH7DqeBks5gSi8E+jYfTdw29wRdg@mail.gmail.com>
Subject: Re: [PATCH v3 2/2] arm64: dts: renesas: rzg3l-smarc-som: Enable eth0
 (GBETH0) interface
To: Biju <biju.das.au@gmail.com>
Cc: Magnus Damm <magnus.damm@gmail.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Biju Das <biju.das.jz@bp.renesas.com>, linux-renesas-soc@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>
Content-Type: text/plain; charset="UTF-8"
X-Rspamd-Queue-Id: 005214E6466
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.46 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FREEMAIL_CC(0.00)[gmail.com,kernel.org,bp.renesas.com,vger.kernel.org];
	TAGGED_FROM(0.00)[bounces-32212-lists,linux-renesas-soc=lfdr.de];
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
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	NEURAL_HAM(-0.00)[-0.998];
	RCPT_COUNT_SEVEN(0.00)[10];
	R_DKIM_NA(0.00)[];
	TAGGED_RCPT(0.00)[linux-renesas-soc,dt];
	DBL_BLOCKED_OPENRESOLVER(0.00)[renesas.com:email,linux-m68k.org:email,sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns,glider.be:email,mail.gmail.com:mid]
X-Rspamd-Action: no action

On Thu, 26 Mar 2026 at 12:19, Biju <biju.das.au@gmail.com> wrote:
> From: Biju Das <biju.das.jz@bp.renesas.com>
>
> Enable the Gigabit Ethernet Interfaces (GBETH0) populated on the RZ/G3L
> SMARC EVK. The eth1, pincontrol definitions and hotplug support will be
> added later.
>
> Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
> ---
> v2->v3:
>  * Dropped ethernet-phy-ieee802.3-c22 from compatible.
>  * Fixed the typo txdv-skew-psec->txen-skew-psec.

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
i.e. will queue in renesas-devel for v7.2.

Gr{oetje,eeting}s,

                        Geert


--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

