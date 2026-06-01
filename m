Return-Path: <linux-renesas-soc+bounces-33403-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id oP7lKqXEHWq9dgkAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-33403-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 01 Jun 2026 19:43:01 +0200
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 143FC62361C
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 01 Jun 2026 19:43:00 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id B7432302EED7
	for <lists+linux-renesas-soc@lfdr.de>; Mon,  1 Jun 2026 17:37:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6E4713DEAC7;
	Mon,  1 Jun 2026 17:37:10 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-vk1-f177.google.com (mail-vk1-f177.google.com [209.85.221.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DBE4C29CE1
	for <linux-renesas-soc@vger.kernel.org>; Mon,  1 Jun 2026 17:37:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780335430; cv=none; b=FPmU8TwL1daONuocY9nsZA7Kt91st0LCNt4zmZLhGFm6dAzs9UCzMKySPOkaiRpnh4HmDZZmWVwJGjqCOOkCcIHLxL4In84ys1N9cHR5qdLQBun8asXQ6MU8aZHa6Bl0v2QJlANKryXGViWoRucqgWWRCzYSMzsHa9dyopOuCio=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780335430; c=relaxed/simple;
	bh=Wv9usFZnfS7kK95hkSPiPI2QnCEnCaHz2isr2NMGWUI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=kyTZfcLrZ85OefvfOkcOKx+OhS9gRKfekx9eY4v4QXeXzuDF+WQIBxH8I+YG1z66fMNLNkC2MeQrBHCPojAHhO3J++5zxSfcIw7FFFvJjxbZRYe18OhM9/Sa7bvqpGuaHSjJYl3KqCf/Lt5dBwJYU8lQnQpzF5+VyBUTHNdAjk0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.221.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vk1-f177.google.com with SMTP id 71dfb90a1353d-59c627b53a0so785239e0c.3
        for <linux-renesas-soc@vger.kernel.org>; Mon, 01 Jun 2026 10:37:08 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780335428; x=1780940228;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=f9sxbisFtWpwoKU7G3mS5YfDApAUtM0f1mz57V6Gziw=;
        b=ZO99m8p6a8WxOshMd6H7KP2m0JhRLPLjgtkztqnrm/eTYP6pjnakcAh4UyMO8gCynJ
         KSioD6ZCxR+fpSqh7kBcmCmyCcS/PxCycv2HeR80CZwPC+E70IU/BfvVukuDXNsNO268
         Q0R5rkRY9a+C5uTTpJJi6Eeq4T2f+B1AwR7cXzlwe/ZPWyMn9oOGHNiRrOwPbdR8vP/9
         4tL5bsD4ZELi3b3rxn/r6KUeQo+lGOYj0vVs25ouBcvtRYhCvTu9yNbppKAM4eHXdBp4
         kKMjpqZEWyjsVjtepGfkb2e4u3CVSsLP/jXHDOs//1JTSZ5fJSivkoEG/KTnZkIpgNo4
         9oCQ==
X-Forwarded-Encrypted: i=1; AFNElJ8zTRL4ltLiNPiBWgHx48cuWDg08NUm6O7yHR2GsP5+JXWZue8qI4QSmYY8V3U42KyS9b7dIFYF6oPJUR11GCzkHw==@vger.kernel.org
X-Gm-Message-State: AOJu0YzI0axrQxSPw/gk1Ka1AUVw8PQd2ZYBG/fq1mWnrd0bYPAaIZ/V
	FTqW6f1MfE2DmgE+CFTH1JuSyCSyxKQDvXgXrWhN0N45p2ZYBNlhGb+kbjoSRuB9
X-Gm-Gg: Acq92OG2YSl6jW2090bjc3F4wv4VNtrwCbR4CPsKlMIVC5JcH9WRo1A5o5A2nwY3xNv
	xY2cTNC9Fo1kuaNFB372/DGEhYORDJik5o2lM5bvBbpL401jzz7XokPEb6k259C2q6N3vYM6oXy
	b0NmzPZDUPtZN01q9lVP+lDjFE5HJRq/vxtR45guaXeEFuurWOLDlA2LOK1aWc6oshFp7xP6yDk
	VFqR7RxWcGA5ap0/Vh5D8T7JSZhT4JNZ+Z8tkDwPUSfRNqFlGgM9hCLanbek4Ri5lPyBN70teYi
	Z3lc2lenN6zFR7jzj72qo+uzCapXP1R2xmlSNdK66PJEbZOyAHYdbpWc15D1qafRjW6cjrXMpo+
	uhCpUAnBklWWQmLY12r9BHXXLa2rKAIUo0qOsztRDPf8uN/cQbU51/1orXP+wuPktOgp6bc2tKY
	wAUDWplkHXtOg8nCFbBZp6Eoo+TzhibhxgDjdS1HuEkeJoSjLUGWNmpbyngC9VWrPQPG2+A/b7x
	OQ=
X-Received: by 2002:a05:6122:3282:b0:5a1:edab:f216 with SMTP id 71dfb90a1353d-5a1edac04b4mr2615872e0c.11.1780335427688;
        Mon, 01 Jun 2026 10:37:07 -0700 (PDT)
Received: from mail-vk1-f172.google.com (mail-vk1-f172.google.com. [209.85.221.172])
        by smtp.gmail.com with ESMTPSA id a1e0cc1a2514c-963aba241ecsm6650451241.2.2026.06.01.10.37.07
        for <linux-renesas-soc@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 01 Jun 2026 10:37:07 -0700 (PDT)
Received: by mail-vk1-f172.google.com with SMTP id 71dfb90a1353d-59cfbfe64baso755039e0c.2
        for <linux-renesas-soc@vger.kernel.org>; Mon, 01 Jun 2026 10:37:07 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AFNElJ+PsBjRUIX12RDjyO0gDcXK5xlImUl3+CXaQ5oV587ezXvuEfrSg8IR0Ef56zO7nZljfN/CX1R/gExm+t2RYMKopA==@vger.kernel.org
X-Received: by 2002:a05:6122:a26:b0:575:29ef:7df8 with SMTP id
 71dfb90a1353d-59bf84c927amr5742975e0c.2.1780335426878; Mon, 01 Jun 2026
 10:37:06 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <cover.178031911driver8.git.geert+renesas@glider.be> <ah2t8FPZpJCF6CL7@shikoro>
In-Reply-To: <ah2t8FPZpJCF6CL7@shikoro>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Mon, 1 Jun 2026 19:36:55 +0200
X-Gmail-Original-Message-ID: <CAMuHMdXFUObHJSaFg5Xb359AWwFejtA5n-Hn2dF4WFtC5-eXgg@mail.gmail.com>
X-Gm-Features: AVHnY4LGrjuiK8Yupb4kRE62mimooYo_V8U0dBYQY870ZETHUqYjUyV_8zVtMJo
Message-ID: <CAMuHMdXFUObHJSaFg5Xb359AWwFejtA5n-Hn2dF4WFtC5-eXgg@mail.gmail.com>
Subject: Re: [GIT PULL 0/2] Renesas SoC updates for v7.2 (take two)
To: Wolfram Sang <wsa+renesas@sang-engineering.com>
Cc: soc@lists.linux.dev, soc <soc@kernel.org>, 
	Magnus Damm <magnus.damm@gmail.com>, linux-arm-kernel@lists.infradead.org, 
	linux-renesas-soc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-Spamd-Result: default: False [0.04 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_CC(0.00)[lists.linux.dev,kernel.org,gmail.com,lists.infradead.org,vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-33403-lists,linux-renesas-soc=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	DMARC_NA(0.00)[linux-m68k.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MISSING_XM_UA(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[6];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[geert@linux-m68k.org,linux-renesas-soc@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	NEURAL_HAM(-0.00)[-0.997];
	TAGGED_RCPT(0.00)[linux-renesas-soc,renesas];
	R_DKIM_NA(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCPT_COUNT_FIVE(0.00)[6]
X-Rspamd-Queue-Id: 143FC62361C
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Hi Wolfram,

On Mon, 1 Jun 2026 at 18:06, Wolfram Sang
<wsa+renesas@sang-engineering.com> wrote:
> On Mon, Jun 01, 2026 at 03:18:17PM +0200, Geert Uytterhoeven wrote:
> > This is my second pull request for the inclusion of Renesas SoC updates
> > for v7.2.
> >
> > It consists of 2 parts:
> >
> >   [GIT PULL 1/2] Renesas driver updates for v7.2 (take two)
> >
> >     - Identify the R-Car M3Le SoC,
> >     - Add Multifunctional Interface (MFIS) support for R-Car V4H and V4M.
>
> The bindings patch for this V4H update...

[A]

> >   [GIT PULL 2/2] Renesas DTS updates for v7.2 (take two)
> >
> >     - Add timer (MTU3) and xSPI FLASH support for the RZ/T2H and RZ/N2H
> >       SoCs and their EVK boards,
> >     - Add PCIe support for the RZ/V2N SoC and the RZ/V2N EVK board,
> >     - Add support for the R-Car M3Le SoC and the Geist development board,
> >     - Specify ethernet PHY reset timings on various R-Car boards,
> >     - Add (more) serial, I2C, DMA, and sound support for the RZ/G3L SoC,
> >     - Add PSCI, Multifunctional Interface (MFIS), and SCMI support for the
> >       R-Car X5H SoC and Ironhide development board,
>
> ... depends on the initial X5H binding addition in this pull request.

[B]

>
> >     - Add serial DMA support for the RZ/G2L SoC,
> >     - Add keyboard, I2C, Versa clock, and audio support for the RZ/G3L
> >       SMARC SoM and EVK boards,
> >     - Miscellaneous fixes and improvements.
>
> I am confused, does this really work?

Thanks for your comments!

[A] does not depend on [B].  Both [A] and [B] depend on commit
0f63ba15dde8748e ("dt-bindings: soc: renesas: Document MFIS IP core"),
which was merged through renesas-r8a78000-dt-binding-defs-tag1 in both
renesas-drivers-for-v7.2 and renesas-dts-for-v7.2.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

