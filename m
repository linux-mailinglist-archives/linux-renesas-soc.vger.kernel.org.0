Return-Path: <linux-renesas-soc+bounces-30685-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id MOqzE7zpzGk/XwYAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-30685-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 01 Apr 2026 11:47:40 +0200
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id A5847377F14
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 01 Apr 2026 11:47:39 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id BC1D930B29A0
	for <lists+linux-renesas-soc@lfdr.de>; Wed,  1 Apr 2026 09:34:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AB2B83CEB9E;
	Wed,  1 Apr 2026 09:34:52 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-vk1-f178.google.com (mail-vk1-f178.google.com [209.85.221.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3A09B3C9ECC
	for <linux-renesas-soc@vger.kernel.org>; Wed,  1 Apr 2026 09:34:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775036092; cv=none; b=Ft9wNxB29FPT0r/BUynVE9/0hLA3RurrRnUbporBBFHwn/a8ny5LeNuZim3pUPDz0+3SecKQti686Lju01y5EES8cUFujdNv3vqPVuPp0UVqdufmxowN8JwO8qvrdgxpsuTE9cfkq+YV7EIKxESlzpMTIiohV+UB04lGHhOHloY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775036092; c=relaxed/simple;
	bh=qX+RMRlwABZzEU4CdDw6pgruqPE0ihLxkJIHdndSmmM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=FlWltYoCzCshnwcDaNEMOZ112RW5GNjtXxXo9kbKQRVn5Yj3FSLEWs1O5YAnKCb+Sm782QO/kahV7r1CnMzNb8iN3OFxr6cjvtbHFWAsgPpCqr/HRkZqAEZNNdbNrE1u3st7+2wDizToxgvo4i22uuzmb4fJq+tehxSa57EgKTQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.221.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vk1-f178.google.com with SMTP id 71dfb90a1353d-56d95bc93e3so48253e0c.1
        for <linux-renesas-soc@vger.kernel.org>; Wed, 01 Apr 2026 02:34:46 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775036085; x=1775640885;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=vDD9JuQPJag3NVnr40z7vDuKn79biHYjGFx+vlRYmW4=;
        b=h9MspFX3N9uVlZX9+RN4QhYITYlIlnD5akVjTDRY9737/mTAZClfVq7STEKeWkWiU9
         wm+bw+Zo53ZsvwsammHzl7xLQREBFlCQ4XH4bSxISu2AsgGGu/loarK4ZtAyHlCkFkGd
         UdbNtOpv9DfvEYtgkae0i9l599bDHMmimruNaIGwauX6sD5u2IJR7M7qfJL/m3BuqHYD
         G9s+pfo4Erp2bV+xwI+KK6Kleap/0Qr4mWJLtaWAxzJRd/KfaHArCz3OIsiYhuJylgK+
         C0rvgIv2hYAwvyTsdb1AodX7Ckwe7L0SAKHpTHDMa0eYhgAVPkQUQLqLybm2knfXO6K5
         AS8Q==
X-Gm-Message-State: AOJu0Yxkj0gDRSOuvYQc++X0C5FORpg5WxlAjB+WXeyOupKNQShxXc95
	c2KR36iBgIZOzqjy7TfSc3OHnPCXFfBioKPpothG1FHshbhcn2YY9Y2Gjp66ZmeT
X-Gm-Gg: ATEYQzwCe4U50NPS/zrgxbw6hbUoUbRHTVHGGoqD4YnQ9uHRbK8JGJboAqH5JJ6ar93
	btVQKsaG3/+GrritP1BatHkPXUvrmntchiaFiKmwBCP0iW/14JEgchVkqlNphw2OAG2Po9n3Aig
	aTelFwZ6Hnd+Gd6nZgQxRQkTaoZDIE5AWSCncCeWAWJ038EXkSaCcfTZTSY3bmQiJRuDpUyl8Us
	lf/qo4TTGz2EAQ0tgMYNixYZ6ROs5Y+6HnIG2R4hgH7D8ENJiTQ476BNGuK2g9RKwLx1a9Hn0Qw
	k9jRouBTcor0gGjDtBk4MiZBmqpX3RNv956x/aF4+Ho4FcAjP6ukabtmOE0JRwwkJ4+yr7NmndS
	1nGKRvTzhAiTSiNDfKetgjDFndptUALeb9ELHtLWVZs+FuXMGWreCSxHeOznIs3p1V7gV2f2IkS
	un33NkhNST3SysEG9ZvbFE4i4lwySPnHI2V/jXmOmVlGXsjyfmGEXQ04cVSCi2
X-Received: by 2002:a05:6122:469a:b0:56b:7ec9:f54 with SMTP id 71dfb90a1353d-56d8a90078cmr1318752e0c.9.1775036085060;
        Wed, 01 Apr 2026 02:34:45 -0700 (PDT)
Received: from mail-vs1-f50.google.com (mail-vs1-f50.google.com. [209.85.217.50])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-56d58a33bf3sm15614338e0c.14.2026.04.01.02.34.44
        for <linux-renesas-soc@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 01 Apr 2026 02:34:44 -0700 (PDT)
Received: by mail-vs1-f50.google.com with SMTP id ada2fe7eead31-604dfcc9892so4437512137.1
        for <linux-renesas-soc@vger.kernel.org>; Wed, 01 Apr 2026 02:34:44 -0700 (PDT)
X-Received: by 2002:a05:6102:4a82:b0:605:19ce:9ccf with SMTP id
 ada2fe7eead31-60567e8794emr1127407137.13.1775036084615; Wed, 01 Apr 2026
 02:34:44 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260331104527.29170-1-wsa+renesas@sang-engineering.com> <20260331104527.29170-3-wsa+renesas@sang-engineering.com>
In-Reply-To: <20260331104527.29170-3-wsa+renesas@sang-engineering.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Wed, 1 Apr 2026 11:34:33 +0200
X-Gmail-Original-Message-ID: <CAMuHMdU6_6TtkSwCbg-ts7Vsn8yB_m6CvAEObtH6bXe3x5bUOg@mail.gmail.com>
X-Gm-Features: AQROBzDLwt1f6P5fKu-UIGkP_mz68aFxwhT58q-vRY24c5nDCX0KeI9-0uvsonA
Message-ID: <CAMuHMdU6_6TtkSwCbg-ts7Vsn8yB_m6CvAEObtH6bXe3x5bUOg@mail.gmail.com>
Subject: Re: [PATCH v3 2/3] soc: renesas: Add Renesas R-Car MFIS driver
To: Wolfram Sang <wsa+renesas@sang-engineering.com>
Cc: linux-renesas-soc@vger.kernel.org, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Marek Vasut <marek.vasut@mailbox.org>, 
	Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>, Jassi Brar <jassisinghbrar@gmail.com>, 
	Magnus Damm <magnus.damm@gmail.com>
Content-Type: text/plain; charset="UTF-8"
X-Spamd-Result: default: False [0.04 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FREEMAIL_CC(0.00)[vger.kernel.org,kernel.org,mailbox.org,renesas.com,gmail.com];
	FROM_HAS_DN(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	DMARC_NA(0.00)[linux-m68k.org];
	TAGGED_FROM(0.00)[bounces-30685-lists,linux-renesas-soc=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	MISSING_XM_UA(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[6];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[geert@linux-m68k.org,linux-renesas-soc@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	NEURAL_HAM(-0.00)[-0.959];
	RCPT_COUNT_SEVEN(0.00)[7];
	R_DKIM_NA(0.00)[];
	TAGGED_RCPT(0.00)[linux-renesas-soc,renesas,dt];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,glider.be:email,mail.gmail.com:mid]
X-Rspamd-Queue-Id: A5847377F14
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Tue, 31 Mar 2026 at 12:45, Wolfram Sang
<wsa+renesas@sang-engineering.com> wrote:
> Renesas R-Car MFIS offers multiple features but most importantly
> mailboxes and hwspinlocks. Because they share a common register space
> and a common register unprotection mechanism, a single driver was chosen
> to handle all dependencies. (MFD and auxiliary bus have been tried as
> well, but they failed because of circular dependencies.)
>
> In this first step, the driver implements common register access and a
> mailbox controller. hwspinlock support will be added incrementally, once
> the subsystem allows out-of-directory drivers.
>
> Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
> Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
> Acked-by: Jassi Brar <jassisinghbrar@gmail.com>

Tested-by: Geert Uytterhoeven <geert+renesas@glider.be>

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

