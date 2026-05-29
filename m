Return-Path: <linux-renesas-soc+bounces-33327-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id aP8LLSNaGWqtvggAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-33327-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 29 May 2026 11:19:31 +0200
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 128DC5FFD05
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 29 May 2026 11:19:30 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 0A9AF30078E2
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 29 May 2026 09:17:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AD325351C13;
	Fri, 29 May 2026 09:17:19 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-vk1-f179.google.com (mail-vk1-f179.google.com [209.85.221.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3014532AAA0
	for <linux-renesas-soc@vger.kernel.org>; Fri, 29 May 2026 09:17:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780046239; cv=none; b=sYmjPYPKrGBU+lbzDNIRVespVuHZV0/3nKcAXllkrCRNP2OxpLzy+A7/upDT1wQq99GL6XLjdkbAlT4LDw0ZYD7tEoC0HmXL362GWXI/dsTeXiX6MyF8mHo+yoezda7eeWawDCtig+n/PcSXh/AS7pz2uhfLD3MV8/Ge2M7ztB4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780046239; c=relaxed/simple;
	bh=A7303nXP7mzkEH/OWAtRsm4hbLTXsrEjg9htPQcfPcs=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=HQa7NVt9ZSSnvljJ05k7HAayO+e+9g8HtFvg/+Pd1ZCOqZYe6rVQ2nBaF0V7oGHbFJZevJgWO9R/cf8w3s2znbeW0/R6CO3VGtwyGQUonqZbxZQ5mlfzACo2eyM9/6MAA3LTrUvvopdHGRiHo3Xif+1HIo/1AUwnAOQPjgWLwLk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.221.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vk1-f179.google.com with SMTP id 71dfb90a1353d-5945b781ddfso2254148e0c.0
        for <linux-renesas-soc@vger.kernel.org>; Fri, 29 May 2026 02:17:17 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780046237; x=1780651037;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=4KsR+eTamR7CorXHidGBoOzlgDhPzd4vd0egbm1d2kE=;
        b=OosngF6jXnL84wVwf+7QRWQFo0KqHkMpGf4ei0WaBLvnrDGEuEp8PffwUUVpezrq/Y
         EEcGjTE2MzxR+SQWN4th1lW2bqDIaGkMgGk89/q+U7cPVDY4R+b0DXMieqfW5BscfMIu
         qwx70hqznHQKlq04KKlpoNnYf+jbdhEAaibu08Wp820+m+zXiVf4HXhxhKCALNA1In03
         QqrUKuJdIapvLd+bgdNbsmrChxrGjQ6PBsTTLtLPjbx15RHwHuRnuK7Iz0pIBnb/778T
         lbFgrxGW715CmTrCPLV2LFEPyloeRiF9MnowGPA/KC2/FxTN4AE2uvNF/7t2kFmdRcWm
         IixA==
X-Forwarded-Encrypted: i=1; AFNElJ+ooE10UJOcwvHQIzMl1wUzacP8dpUYCThFv9A1YVKiNryZgFOHLMSZXoz8thMBwDxMqji13BRkZ1FE3HAZZMxkqA==@vger.kernel.org
X-Gm-Message-State: AOJu0YwFgkILeb48off4auyjLZHMSOMA/CHPGCysRgsXDOwfGKp5r1lO
	sEjZiRmtyRhsy8fARuUp1VmqAlmoatyirGmLgXwIUkLqqD58ahomm4FPy6jUE7c5fJU=
X-Gm-Gg: Acq92OFpQicmzqJ9vys/6B7AfILiY9CIb2QkvUGrDQgiCnGGX8YsIRjrnp9yWc1dHii
	yLzJiGUSzYTFfjstytVcnA1aZolw9GMBHDZlTB/4R6ZBvNbIF9gAs3lXPAfw8Is93ZHni7HgF2m
	Mc18MMMw0/I7z2G7cXikw/S0Q9Co9cXgybki+jdfvV663u5QiEE7SBGFtMioPCCN3aJGcpB3cJH
	d9pxaOWWiJn4vBoV2YRk4097EnJYrX9b2PL5PskzWXu5vAulYSlGiH4gYZ77mB8be/FrnXiMga5
	/7wwmSw85Se/D62aDecZMYlrFQZj+qGPIMAMxHL0rJZLNGPjAo4jk+ecWPswEQeUEW8K7sxx8Hn
	gANk3M8EhUceY8zT/d+L8inRShwJM8QqEclIeamqFXFfc3XnYxI6WHrutOiGLnKLBEMn9FDV1et
	zzMfn6pSYv71fNgM2eMXgwR1DDYWGYX2vanPoxM/FLZEXvAqlTPTk8czLnRCjqe1mkHnwoHvM=
X-Received: by 2002:ac5:c5ab:0:b0:575:9cb5:a87d with SMTP id 71dfb90a1353d-599b73b5abfmr509560e0c.2.1780046237113;
        Fri, 29 May 2026 02:17:17 -0700 (PDT)
Received: from mail-vs1-f53.google.com (mail-vs1-f53.google.com. [209.85.217.53])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-599d9271a90sm810228e0c.9.2026.05.29.02.17.16
        for <linux-renesas-soc@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 29 May 2026 02:17:16 -0700 (PDT)
Received: by mail-vs1-f53.google.com with SMTP id ada2fe7eead31-6c3a36fa9edso8921137.0
        for <linux-renesas-soc@vger.kernel.org>; Fri, 29 May 2026 02:17:16 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AFNElJ/tjvTu1OeM8du51KPkpc6J6FeI43XP1SF39Nvl+9YvNCdADO/LE+DwjdeHL+mYGMSQeXe/Nm17k00Tl0CNtu2HHg==@vger.kernel.org
X-Received: by 2002:a67:fac8:0:b0:600:3b3e:681a with SMTP id
 ada2fe7eead31-6bed960857dmr483889137.14.1780046235748; Fri, 29 May 2026
 02:17:15 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260527202430.606341-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
In-Reply-To: <20260527202430.606341-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Fri, 29 May 2026 11:17:04 +0200
X-Gmail-Original-Message-ID: <CAMuHMdUuvQ7sKbUh6kn4DPfYR7iYk5cK=EV-zJ=GbrKudY5Yag@mail.gmail.com>
X-Gm-Features: AVHnY4Js00YTQovdr1eCSGXVo4f2fAUcVUSkGdqR3jPyv1KLJgrEEvSe7UG5BL0
Message-ID: <CAMuHMdUuvQ7sKbUh6kn4DPfYR7iYk5cK=EV-zJ=GbrKudY5Yag@mail.gmail.com>
Subject: Re: [PATCH v2] arm64: dts: renesas: rzt2h-n2h-evk: Enable xSPI nodes
To: Prabhakar <prabhakar.csengg@gmail.com>
Cc: Magnus Damm <magnus.damm@gmail.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	linux-renesas-soc@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Biju Das <biju.das.jz@bp.renesas.com>, 
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>, 
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Content-Type: text/plain; charset="UTF-8"
X-Spamd-Result: default: False [-1.46 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FREEMAIL_CC(0.00)[gmail.com,kernel.org,vger.kernel.org,bp.renesas.com,renesas.com];
	TAGGED_FROM(0.00)[bounces-33327-lists,linux-renesas-soc=lfdr.de];
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
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	NEURAL_HAM(-0.00)[-0.981];
	RCPT_COUNT_SEVEN(0.00)[11];
	R_DKIM_NA(0.00)[];
	TAGGED_RCPT(0.00)[linux-renesas-soc,dt];
	DBL_BLOCKED_OPENRESOLVER(0.00)[mail.gmail.com:mid,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,linux-m68k.org:email,glider.be:email]
X-Rspamd-Queue-Id: 128DC5FFD05
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Wed, 27 May 2026 at 22:24, Prabhakar <prabhakar.csengg@gmail.com> wrote:
> From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
>
> Enable the xSPI0 and xSPI1 controllers on the RZ/T2H N2H EVK board.
>
> Configure the xSPI0 controller interface to 1-bit (x1) mode, even though
> the connected MX25LW51245 octal flash device supports octal mode. Add a
> corresponding inline hardware comment detailing this restriction;
> operating in octal mode causes the BootROM to fail loading the first-stage
> bootloader following a Watchdog Timer (WDT) reset.
>
> Configure the xSPI1 controller interface connected to the AT25SF128A
> flash device for 4-bit (x4) mode to utilize all available data lines.
>
> Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> ---
> v1->v2:
> - Dropped CKN pin
> - Added ECS pin configuration for T2H EVK
> - Added Switch settings for both T2H and N2H EVKs
> - Fixed partition address for xSPI0 flash device
> - Added spi-max-frequency property for both xSPI controllers
> - Dropped grouping the pinctrl into subnodes for XSPI1 and
>   for XSPI0 merged the ctrl and data pins into a single group

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
i.e. will queue in renesas-devel for v7.2.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

