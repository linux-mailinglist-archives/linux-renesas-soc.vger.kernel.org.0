Return-Path: <linux-renesas-soc+bounces-31636-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 6H0mGatr62kcMwAAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-31636-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 24 Apr 2026 15:10:03 +0200
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id A261B45EDAA
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 24 Apr 2026 15:10:02 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 038FC301D070
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 24 Apr 2026 13:10:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3DE8C3B0AC2;
	Fri, 24 Apr 2026 13:10:00 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-ed1-f42.google.com (mail-ed1-f42.google.com [209.85.208.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C927F3A381D
	for <linux-renesas-soc@vger.kernel.org>; Fri, 24 Apr 2026 13:09:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777036200; cv=none; b=gb4/d1BeBV4qa0p/L+jOoBRwZhny8LHuGypjuKwQZanAFkCmmefccvmtBeGw33z1c4V0Cy3CfxZ/Y607KOMxycWcVCxwdIGT8Ics/HXw0W8RekkpGeGgAWbWt3gQlkCRfExgcXzANmTHHQqJJM8/Mx8oOq4dOfMy20psbggeJmI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777036200; c=relaxed/simple;
	bh=jK60j71r/PMCLKQKB8efHIPJARlwkjCBCLpWCUUQ5TU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=GzFlySpLk4V83Cf2+Brf8OozLMX95K1P0yY8iP3lbLdnAs0dIbM4LWvkxPRUXxsz2jVIJw34aiQVUtgF2TObcpxRX4958Ar31ChddkHSCr8fsCDBEumNNfqL4iTO3s2ZiBxIIvbseVGe+ZwhlZr9LQGrvwt7R4rxRmgAlDkUyXg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.208.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ed1-f42.google.com with SMTP id 4fb4d7f45d1cf-66e8cf72a93so9495999a12.0
        for <linux-renesas-soc@vger.kernel.org>; Fri, 24 Apr 2026 06:09:58 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777036197; x=1777640997;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=fUxa5Yac5JZ/JIOen5ChIgl6Jr4G3NyrY10W57+tI7U=;
        b=nA6Aw/9yyfX7tlDK+9hx9Svu9npjUojtjcIeK4QHjiY4HWydZrc6ctf7LGDjFfGrke
         mYpTKN+fjCqnXwl+VSOeBL2Xgy+EN27pSkfA4smI1zlNiFXu65WaTqm0VTj/yEfn8cEg
         dCvo6c+05yDp0q+DeRanh/TfAOLybTRWAsop1j2lNphskygAjtIX+zwk3ZUVQP078y81
         z3+gNmWyG9V7kgdbzGtQNQ5/mn4MKMjDHdqpGFfkGsBq1J3EXaABeOqRS2R+3JfsBbtm
         H5oM2c6cDirZQELs+Ld0vetvNfhXejON1uUbmgh9XgJqNK2tEeksaKmEDfRSgvqzejWF
         arDg==
X-Forwarded-Encrypted: i=1; AFNElJ+bYd7VBAk3ZIC2yuZoNIOchx4VjkIAgEQlc1DaWYrBewpyVQBjawBvW2Y+E5Ih9TYyCt+N2CIDFTaauYmbJu918g==@vger.kernel.org
X-Gm-Message-State: AOJu0YzIuVBfKO48WRyNHcr8EMdMQwEojLJZr55XzHLaCaPzkmkkSxcQ
	+ekRHh9VDRPAVfLqM05SRNliAP5Y2vjGnO1P48hcovhmP7HWejDSQ1z+lQVm+1TENvY=
X-Gm-Gg: AeBDievhRCsgHNUpddcENNeemnBAVODjTx+KfXWPpZ4kKPzj9d1qUt5UU/w6XqbY+xz
	LCIfSBJwBhn4qJtJnMC/6qgolplGeBPL4NWqVNRDsF15l9eelyfyLOBf46p7TP1IY0yBrnseJQk
	62/Brt6LZ5oaS9vwq/cYQjH86qAFgljmeSx6sS+gXJBCX0LMrvCdtF6fb9GpIbqkezUZ41TJD0k
	IHzoK55oS4U8i5DQLaMDzIXBCDwl5Oj3B+bSZKHyV/8p311cKN1QaWdG5V1Dfs9l7l1caTDprfJ
	QRLtfpWjaAe8m0MgEjybnUqe+YD6XwUHgZiZjNXeGWvGhCf0XD2LNJAhZB0143yCI1D7EjMs7ES
	grQQC8HEkxCLleHQAZU88YQ7coCFDJDVuLQrtha/apeg0wIcWkANOkKufxDSqwMGEsrXFk7ISPt
	9lS+NE3YBGo7VxfNxmf0e5QHPrk0h5wZ50AU8jtJ0VuGfQUs264bQsBeUH6OiV/9QVfO1Hk3s=
X-Received: by 2002:a17:907:a089:b0:bab:9f73:3b5a with SMTP id a640c23a62f3a-bab9f734073mr551012966b.16.1777036196550;
        Fri, 24 Apr 2026 06:09:56 -0700 (PDT)
Received: from mail-ed1-f43.google.com (mail-ed1-f43.google.com. [209.85.208.43])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ba454d1b379sm749837266b.39.2026.04.24.06.09.55
        for <linux-renesas-soc@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 24 Apr 2026 06:09:55 -0700 (PDT)
Received: by mail-ed1-f43.google.com with SMTP id 4fb4d7f45d1cf-670ab084a39so11902151a12.3
        for <linux-renesas-soc@vger.kernel.org>; Fri, 24 Apr 2026 06:09:55 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AFNElJ+kTzzxL7zNsx81TPm+2AtvTRxdIug7tXvTeH0eLd4iq9OYjYfs03y7figRZjvb4ZifDrpR3OQ24F0H9mMXvr7nqQ==@vger.kernel.org
X-Received: by 2002:a17:907:d07:b0:ba3:76b9:c3cd with SMTP id
 a640c23a62f3a-ba41b3de820mr1726472066b.42.1777035885959; Fri, 24 Apr 2026
 06:04:45 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260410163530.383818-1-cosmin-gabriel.tanislav.xa@renesas.com> <20260410163530.383818-2-cosmin-gabriel.tanislav.xa@renesas.com>
In-Reply-To: <20260410163530.383818-2-cosmin-gabriel.tanislav.xa@renesas.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Fri, 24 Apr 2026 15:04:32 +0200
X-Gmail-Original-Message-ID: <CAMuHMdUwdxVW9_xo-ivXWQHGe=6X=ZXyVGbxPf08Db2ryY0N+A@mail.gmail.com>
X-Gm-Features: AQROBzCYN8yQbUxpaU1BB5qpPqsbb7NS2Sh7I8H4Hxzs1kZXyoKXl2JLcJdS0KM
Message-ID: <CAMuHMdUwdxVW9_xo-ivXWQHGe=6X=ZXyVGbxPf08Db2ryY0N+A@mail.gmail.com>
Subject: Re: [PATCH v2 01/10] clk: renesas: r9a09g077: add MTU3 module clock
To: Cosmin Tanislav <cosmin-gabriel.tanislav.xa@renesas.com>
Cc: Biju Das <biju.das.jz@bp.renesas.com>, Daniel Lezcano <daniel.lezcano@kernel.org>, 
	Thomas Gleixner <tglx@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Magnus Damm <magnus.damm@gmail.com>, Michael Turquette <mturquette@baylibre.com>, 
	Stephen Boyd <sboyd@kernel.org>, Lee Jones <lee@kernel.org>, 
	Philipp Zabel <p.zabel@pengutronix.de>, linux-iio@vger.kernel.org, 
	linux-renesas-soc@vger.kernel.org, linux-kernel@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-clk@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-Rspamd-Queue-Id: A261B45EDAA
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [0.04 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[bp.renesas.com,kernel.org,gmail.com,baylibre.com,pengutronix.de,vger.kernel.org];
	TAGGED_FROM(0.00)[bounces-31636-lists,linux-renesas-soc=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	DMARC_NA(0.00)[linux-m68k.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[17];
	MIME_TRACE(0.00)[0:+];
	MISSING_XM_UA(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[6];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[geert@linux-m68k.org,linux-renesas-soc@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-renesas-soc,dt];
	R_DKIM_NA(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[linux-m68k.org:email,renesas.com:email,glider.be:email,mail.gmail.com:mid,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]

On Fri, 10 Apr 2026 at 18:36, Cosmin Tanislav
<cosmin-gabriel.tanislav.xa@renesas.com> wrote:
> The Renesas RZ/T2H (R9A09G077) and RZ/N2H (R9A09G087) SoCs have a MTU3
> block connected to the PCLKH and with a module clock controlled by
> register 0x308, bit 0.
>
> Add support for the module clock.
>
> Signed-off-by: Cosmin Tanislav <cosmin-gabriel.tanislav.xa@renesas.com>

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
i.e. will queue in renesas-clk for v7.2.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

