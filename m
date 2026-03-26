Return-Path: <linux-renesas-soc+bounces-30326-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id wDFaDq8LxWma5wQAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-30326-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 26 Mar 2026 11:34:23 +0100
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 911E03336F2
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 26 Mar 2026 11:34:22 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 9EAD1324E389
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 26 Mar 2026 10:09:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4CECF3BF689;
	Thu, 26 Mar 2026 10:07:53 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-ua1-f43.google.com (mail-ua1-f43.google.com [209.85.222.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 043AC399030
	for <linux-renesas-soc@vger.kernel.org>; Thu, 26 Mar 2026 10:07:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774519673; cv=none; b=Qb17APRyF3V2abbXHSJTMNKtbGDhfa675x5CHLuGmJb/yawlnD4xraC45CQ2PnCmvNhheUhBK3mNkIwAGf/R7YnemGz05FDg+HMnHz2KxrAMuYbdQ6uTCXgLwEeWBDhYS1Ygl1nuyTiGXBvXg5PryFkLr9CVfB7CPKYs7yQQGuM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774519673; c=relaxed/simple;
	bh=XsGegs66l1CKoLtu/+3QgbtTvmQGUGUmoelFQjWXbtM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=DlBeEwbn/RnSC07BlLdqJWw19WuFSEWZylHRbY9sET/i1Rh0wuk1zvrTPczuG/K+o1X2C/7Mnec8OzRExYkwLVLN6QdNfW9RZUNzmwXb4Za7NspyHTn0NbSzxNn7hmnfmmohxEc1lkvn0DfltiK3Lf5efwpIhg6612V6X+UQcYI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.222.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ua1-f43.google.com with SMTP id a1e0cc1a2514c-94ac5cb71feso225042241.2
        for <linux-renesas-soc@vger.kernel.org>; Thu, 26 Mar 2026 03:07:51 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774519671; x=1775124471;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=F94y0mp+/D6GVV7M4ewGzosByGn4hznQhChrZ7f2x4Y=;
        b=Pt4F/x9SqAiMrWOWi9RRAjGn/zr8CyuBMVh9o2z3e6yOx86l+49wfFuZuU3QqTeIDQ
         wG/vphT+cgEYSy0yQ5QgWDK4sSgPjC3GYBLgnQbfBoHIawFmVoGANuCdQyqyZj9JLm7l
         1DPn2ikp7LwnN2CeSsfcr02ya3pKu0yfXorkdX31sJ2iw74/sI5C7A4UeA+y2YOoNpEk
         IOwyiEWeM4kelgd52R9pYdyn1xDzfRuvbsHMqzsaufBCwm5wYbqeJTLXl2t3rF2ldOBv
         hO6KgqhQIJtIR5PNdMXgz+2IE16qSNlIE7Q5KM08jSC8tU09pJWm15J75GerPPf9/hka
         pZCA==
X-Forwarded-Encrypted: i=1; AJvYcCXAoE7I9t1K6QDN2mWd9crwrNWdST4jecDLK10IHi9Q10V4RHNWnyUdA83NEpaSapTewrw35XL1ZfB70yXf8CzwJQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YxxOnrzoYL8ACoxp6faYRXVBusJ1j4H7SGHPfbpFWS37yEabu91
	Lb0yFNLTCnuIbkItTtgTYzTAuUbswJQ1cA6nwYZN/6swfS5e1CLDla1ihZWEmhP4Sa0=
X-Gm-Gg: ATEYQzxLWOt+J8w60JpxSqVLGoHEPOW7ZNNpzy2N0vgsYBXV7rBdOhBSKuNUXiXY9/0
	nJq84VfEMgxRKFNW/hgUtMg5j+JjxP3hrmZyg+bzWMe0CUtCAe/WCWWrxAXLqAIxvWes6mpmKAC
	DFYA6Dwt3lT+zkvN30TobmtK0HMRhOUODaUwBfFePg0OUpA27trO50iwPapWbUPbkfciLgqCvJt
	HEQPkRInARnxLjBlY0PFKrGFLITD6KtLysR0rNL9wCY68c5IJWyL5Y+uJ6dTQeCV70bU1KSnRuZ
	5tsLiUS17dvkOP5ClCDi1h73moZdJy4BbklnzxDtxHgGl2tsLceLILVJOZbdFKqQ2o38/utQLvb
	qNk9tkEOQbWk39xpS6dcS0xdBo9o8WL2VA8yD01xETkRTJyxRVnPA44/jMxEkasppu6MKAUJk6b
	fTpuqcrtsfkpQrEKPgvfoQXwfsI7MS/Oa2qX4s5B1VS4nKzFuWwY4ovo54Do7mXVPP
X-Received: by 2002:a05:6102:554b:b0:5ff:a16b:93f0 with SMTP id ada2fe7eead31-60387268e91mr2851106137.22.1774519670902;
        Thu, 26 Mar 2026 03:07:50 -0700 (PDT)
Received: from mail-vk1-f175.google.com (mail-vk1-f175.google.com. [209.85.221.175])
        by smtp.gmail.com with ESMTPSA id ada2fe7eead31-604d5313adbsm2529117137.8.2026.03.26.03.07.49
        for <linux-renesas-soc@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 26 Mar 2026 03:07:50 -0700 (PDT)
Received: by mail-vk1-f175.google.com with SMTP id 71dfb90a1353d-5674d8be45eso361616e0c.1
        for <linux-renesas-soc@vger.kernel.org>; Thu, 26 Mar 2026 03:07:49 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCViElTXwSENOivpv+Hoy+TFpg385E6pGRyhhrbUBLB/70nP8GinQoVcxKjMzlIyS+RRm0NTc+TjvhDKWr1+3IK61w==@vger.kernel.org
X-Received: by 2002:a05:6122:3387:b0:56b:5e7e:d3fa with SMTP id
 71dfb90a1353d-56d21f56bcfmr3191484e0c.7.1774519669709; Thu, 26 Mar 2026
 03:07:49 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260326042411.215241-1-marek.vasut+renesas@mailbox.org>
In-Reply-To: <20260326042411.215241-1-marek.vasut+renesas@mailbox.org>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Thu, 26 Mar 2026 11:07:37 +0100
X-Gmail-Original-Message-ID: <CAMuHMdVtea9q1Yoaq1sEquxEAnQ-armLRdO1cMtJnp2K2mYtOg@mail.gmail.com>
X-Gm-Features: AQROBzAkfIER99cc95oQTkegA98ufjqQruJaj6kJ10lCtG__AGEprt5eHbo-Ac8
Message-ID: <CAMuHMdVtea9q1Yoaq1sEquxEAnQ-armLRdO1cMtJnp2K2mYtOg@mail.gmail.com>
Subject: Re: [PATCH 0/4] arm64: dts: renesas: Fix missing cells and reg
To: Marek Vasut <marek.vasut+renesas@mailbox.org>
Cc: linux-arm-kernel@lists.infradead.org, Conor Dooley <conor+dt@kernel.org>, 
	Geert Uytterhoeven <geert+renesas@glider.be>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Magnus Damm <magnus.damm@gmail.com>, Rob Herring <robh@kernel.org>, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-renesas-soc@vger.kernel.org
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
	FREEMAIL_CC(0.00)[lists.infradead.org,kernel.org,glider.be,gmail.com,vger.kernel.org];
	RCVD_TLS_LAST(0.00)[];
	DMARC_NA(0.00)[linux-m68k.org];
	TAGGED_FROM(0.00)[bounces-30326-lists,linux-renesas-soc=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-renesas-soc,renesas,dt];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[geert@linux-m68k.org,linux-renesas-soc@vger.kernel.org];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[6];
	R_DKIM_NA(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[10];
	DBL_BLOCKED_OPENRESOLVER(0.00)[linux-m68k.org:email,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,mail.gmail.com:mid,0.0.0.1:email,0.0.0.2:email,mailbox.org:email]
X-Rspamd-Queue-Id: 911E03336F2
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Hi Marek,

Thanks for your series!

On Thu, 26 Mar 2026 at 05:24, Marek Vasut
<marek.vasut+renesas@mailbox.org> wrote:
> Add missing cells and reg DT property into DTOs to fix warnings like this:
>
> "
> arch/arm64/boot/dts/renesas/draak-ebisu-panel-aa104xd12.dtso:30.10-34.5: Warning (unit_address_vs_reg): /fragment@2/__overlay__/ports/port@1: node has a unit name, but no reg or ranges property
> "

All of these are dtc W=1 warnings, right?

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

