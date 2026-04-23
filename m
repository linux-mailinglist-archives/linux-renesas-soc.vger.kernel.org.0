Return-Path: <linux-renesas-soc+bounces-31560-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id oMFfB77p6Wm2nAIAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-31560-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 23 Apr 2026 11:43:26 +0200
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 8A56E44FEAA
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 23 Apr 2026 11:43:25 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 531E23051EAE
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 23 Apr 2026 09:37:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9C4AC3E4C6F;
	Thu, 23 Apr 2026 09:37:40 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-ua1-f53.google.com (mail-ua1-f53.google.com [209.85.222.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5E10D352C58
	for <linux-renesas-soc@vger.kernel.org>; Thu, 23 Apr 2026 09:37:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776937060; cv=none; b=Kg9EjtZxh3n9PXXizFRn5Iwwos9QYzC+BiIvDU3l+F9y0D24qkCP/BO8B62zlGwQzaOx4mBZ8alTsmFFz1KZ6UJF/TgTG2Jcasi+HDFZTCFsI8Vx1qMdPzc0EK3WT8uv5zH2Ucok9hk12nPk9KHq1ipnDLFsA5t8y2W3IPJ0OVY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776937060; c=relaxed/simple;
	bh=49P1ANy6/XGJGB1NNommdNWD+0xmIT+v6QWy7dtyDN4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=YOe4nHyzbKJ8Q7wmSXShUqRyuMR7oVcSvCRMGsf52bYkJiOEGjDfznbnkN0JSxPDkS1lsfRKRh6DlkyO7y2+b4HbJnSEjL5pf8zJREmf2sVPz+kAA7PDMoSCduivXoGfDmy4KCJ2n6YLgy+qh9TQhsMX4gngGi3lXAm+CLWBE8E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.222.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ua1-f53.google.com with SMTP id a1e0cc1a2514c-95687f6ce13so1927854241.2
        for <linux-renesas-soc@vger.kernel.org>; Thu, 23 Apr 2026 02:37:39 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776937058; x=1777541858;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=J4avnyk2r/thqEE/8ekAW8GXrcxQQiB8UiCWb8+JQfs=;
        b=IdoUwux70yKH+/hpXjA3Bj+Wk6bAOZoGCkjxvY/rcI5ypYSS28qYsy0G4h/+VIMzJh
         HNnp0mUNy7jWvCPZObYOf70WkdX/UhvKBCxdknrT1oQo0Y6pjUwpawZiYx+s7Qu3k5zR
         q4TzSIsaBtiV6oLTwb2LSq4CPU+vbkyY4WAKn9FS2+F7v6ZYfhPNVyGTFgM/bJf5zDxH
         BizICkKYzrwRvO7uLCkrL661m1HSx5TBTG6UCWigFlUXJiI78SN5R1wy89+R5pRDbvEz
         XcmxM51SOrEt3jpowc8AzIuSU/enhGLR6ug+K50pn0lUHE/hUkgdinjzbnTxJQyomiIk
         9/Qw==
X-Forwarded-Encrypted: i=1; AFNElJ+c6K+meIhKSnODbVkyZnuuDlLsYrN62GdAkTuPJ4ZC6Oi84gbyXb9IxZXosYfoJkV/jsVvKBIqAF4BU0d+O4hVxQ==@vger.kernel.org
X-Gm-Message-State: AOJu0Ywq3T9Xb7p6pX1qdFkPByb1FdlBmLfcN/wTJW/AUVrY2VEJ/Wl7
	MClAxQixZ20DLLP6nOmexCXvzCrvYPRPUORQOx0XafHPdyaN0c3tc6wStxdk+UjlvHQ=
X-Gm-Gg: AeBDievykZfeJ5uBEVY0fqinNC4VDYKi8fto/gpwq0HGeuvJHcoC7x2g8pUSBJ9RSaI
	rLNg3WNAnWUnHwTuxniIYxBawhw+Lyg0gMc45LR9gl2JhKVM654r39qzFJSJau9jBUt3w0K/Qgn
	JMMKdPZX+R4EdvEsT6YDGdKiFyRryUWrz7H3ubJt0N9Kda80eOm0Qp93bdFFURPquUlWPhS0WIz
	YAB1yLvXCYm4pnZqVPX8qnzp13YV2fyzQdRwWM4AasETX+t6/qpd241XA0hkFG/oHVosJ9ZORPe
	/PZdaUlwrh2kHWlzUA38GZJxLlwdapnqDW0Mt+MrGQCfd2OGhBj3MxOYxEbkbSjsu1XZWL/zb3M
	++in2CEdf25BjznOcY7jartC0zkrfa7uPekE4Yf6TvfM7CtT8hVQqyFs9wJtyMy0djXZZsPjLYB
	HbKfS4V1DlF6qSp7d/k/5SvT5t9kOqz9H2r6wW22tOkd2t8xVWD9PssZDR8S1E8wtflVagPPM=
X-Received: by 2002:a05:6102:80a8:b0:607:a215:5b7e with SMTP id ada2fe7eead31-616f4d7cfcdmr13362844137.7.1776937058193;
        Thu, 23 Apr 2026 02:37:38 -0700 (PDT)
Received: from mail-vs1-f43.google.com (mail-vs1-f43.google.com. [209.85.217.43])
        by smtp.gmail.com with ESMTPSA id ada2fe7eead31-621983b414asm167348137.2.2026.04.23.02.37.37
        for <linux-renesas-soc@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 23 Apr 2026 02:37:38 -0700 (PDT)
Received: by mail-vs1-f43.google.com with SMTP id ada2fe7eead31-60579b9c0ccso4988599137.3
        for <linux-renesas-soc@vger.kernel.org>; Thu, 23 Apr 2026 02:37:37 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AFNElJ+qa15/Ypp6Vh6CUNzZZMfDWyWIrVsfxPVgu+zfBP2mWndlYXCIeGUDRf6On/67LQalH+AZSJhx9gMTjBpN0hDXIg==@vger.kernel.org
X-Received: by 2002:a05:6102:dcd:b0:612:b3af:39f1 with SMTP id
 ada2fe7eead31-616f68d1bafmr13648560137.18.1776937057736; Thu, 23 Apr 2026
 02:37:37 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260326110648.29389-1-biju.das.jz@bp.renesas.com> <20260326110648.29389-4-biju.das.jz@bp.renesas.com>
In-Reply-To: <20260326110648.29389-4-biju.das.jz@bp.renesas.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Thu, 23 Apr 2026 11:37:26 +0200
X-Gmail-Original-Message-ID: <CAMuHMdWEQpg8biC1BFJx1n4byXDWGDK+QZdLkpHFypX3zYFWCQ@mail.gmail.com>
X-Gm-Features: AQROBzBb1MKj-k5CTCdcl13Ho8NscavUFViNzxMLmeCGP4nXMPTVcdPIbSR_3Lo
Message-ID: <CAMuHMdWEQpg8biC1BFJx1n4byXDWGDK+QZdLkpHFypX3zYFWCQ@mail.gmail.com>
Subject: Re: [PATCH v5 3/4] clk: renesas: r8a08g046: Add support for PLL6 clk
To: Biju <biju.das.au@gmail.com>
Cc: Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, 
	Biju Das <biju.das.jz@bp.renesas.com>, linux-renesas-soc@vger.kernel.org, 
	linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>
Content-Type: text/plain; charset="UTF-8"
X-Spamd-Result: default: False [0.04 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-31560-lists,linux-renesas-soc=lfdr.de];
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
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	NEURAL_HAM(-0.00)[-0.999];
	RCPT_COUNT_SEVEN(0.00)[8];
	R_DKIM_NA(0.00)[];
	TAGGED_RCPT(0.00)[linux-renesas-soc];
	DBL_BLOCKED_OPENRESOLVER(0.00)[glider.be:email,linux-m68k.org:email,renesas.com:email,mail.gmail.com:mid,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 8A56E44FEAA
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Thu, 26 Mar 2026 at 12:06, Biju <biju.das.au@gmail.com> wrote:
> From: Biju Das <biju.das.jz@bp.renesas.com>
>
> Add support for PLL6 clk by registering with rzg2l-cpg driver.
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

