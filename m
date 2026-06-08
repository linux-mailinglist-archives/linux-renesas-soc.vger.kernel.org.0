Return-Path: <linux-renesas-soc+bounces-33648-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id 2Zf4NwJ3JmqJWwIAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-33648-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 08 Jun 2026 10:02:10 +0200
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 058AB653C6B
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 08 Jun 2026 10:02:10 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=none;
	spf=pass (mail.lfdr.de: domain of "linux-renesas-soc+bounces-33648-lists+linux-renesas-soc=lfdr.de@vger.kernel.org" designates 172.234.253.10 as permitted sender) smtp.mailfrom="linux-renesas-soc+bounces-33648-lists+linux-renesas-soc=lfdr.de@vger.kernel.org";
	dmarc=none;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 3BB0C304C628
	for <lists+linux-renesas-soc@lfdr.de>; Mon,  8 Jun 2026 07:55:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 81C24352009;
	Mon,  8 Jun 2026 07:55:58 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-vk1-f173.google.com (mail-vk1-f173.google.com [209.85.221.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3EEA938F945
	for <linux-renesas-soc@vger.kernel.org>; Mon,  8 Jun 2026 07:55:57 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780905358; cv=none; b=BSK1yL/MMYP8+D/LIcAHCO8ecRXtCwpwPTF5amfNmLsd6nXfnyZyJ54tMWXHNwHu5m7w2K7as1/pIf2ijDO0aCkwaLkSoVmGk6JWbmzHcY9y8sA1TThY9VufYOR3ELT4pOluyGjIHAfOcFZ61Vxt9KwNc+K7aEsE0GYIR5cb8T0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780905358; c=relaxed/simple;
	bh=EZ6O3f1jsPsrFY5TdW32+0NSqE5O+fh0ngad37h91dc=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=TqJHO7z2pNIpZ1NLflgIyzqwum69k4nOh8PbbJDA3VbfO6kVf/5NUIAWAVAMkas9A2Uza93FyBpv2bfwFxbNUwgnW2e5sFv9/M82As7cQDFAZkXMHBkTzWJGw7AZLmUOB2cXkRY/1gV5DYzLBCp/Skoo2lvz+8ZlZgmaKzdyr7w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.221.173
Received: by mail-vk1-f173.google.com with SMTP id 71dfb90a1353d-59c627b53a0so1112661e0c.3
        for <linux-renesas-soc@vger.kernel.org>; Mon, 08 Jun 2026 00:55:57 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780905356; x=1781510156;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=2Cmn669Tthf2NAdP9bTtgq4iWIUzugLFW7aAuo6G0Ww=;
        b=cxoTz1QC9CBbuBk1F90lh9un2Vqwa3kde92G0SYf1Y3HWxcMKdLN6NTgPtP5ZT318Y
         Gx8Jby3SgD8f4SZqhnsvVUkDm4txuPD+p3pCyrTSXgGwV3PdZb+MiCarABpX+EXfiY7S
         mbRK7Kjc/jZkZZ6AMxqEjLiXieOyGj50SHnw2w0ftfOQGeZB+k8qMSUubrRORKDitXjo
         lO1MA2Dfar/Wj+IeX61mjJ3EqpJjQxF6lJfGrCJEe09FGTWHyzH3hBJc13ppeFVKK4uW
         rgDkZqlunZbkcauBRWPAbLebCMbZSLkjjmXtiU3d71MuSTCUcEMkA35JwCLBPeLDrn7o
         Gi5g==
X-Forwarded-Encrypted: i=1; AFNElJ9EnGwBTME7s23sNVrKKE0vjxvqAoWC6tMoQ1vVo3lsis//SRZhlr6ChaJGIrM/IEmdxU45NfPxUDjM0CdBdO71Jw==@vger.kernel.org
X-Gm-Message-State: AOJu0YyyUdb5Pj4Wg4W5VZ1W/vnuuob3z5cLv+fQziDSlMXLueVu2Fd8
	7waRq+faUQ1k8tX8+/CJMlZxQwVsgUJEk1OMtDDvcpwAt0vgSH4kNbAPcjB8cukh
X-Gm-Gg: Acq92OEUn6m4Ni/JRoPxuEIfEV0qLngKmgX4kh9/ijnqWmvXNrSihin9zaFU8XuWEQE
	sb5CUFgb/a3/xqm9YyfgY95+iRAMCxa5NQtiVfWWuuKt7dX9v/sj26YKrXggqvcdZ5rt6dixvor
	iNz2eWl83sUgJupdzu8+RMOCqcxRSXWk6sO2kpvNKWlSrLP3+tRY+js9Z98tlg2XgTAkoh5M2nj
	3OMyDIH58n7/cWMSCrhQoiW7Zddx9q4g3FdyZIAqqVYBS5beZ63gSS1njbUdYO0t/ramsIkSy3+
	lcZ977rI6mCQ1orzOk4kPoSSNkQqIprSKyvlchvpXhwc+/zLzTnbYSfdAsp+qodnXbPxVlQRV1X
	xZ0K5P6XfsY3fk9xWkXeFYR/p9DJMB1rfrhAO4yPUjGVZBqqokVX4n5+j7faG3BTiEqtc4yiL0C
	jgWT4TW/3UzUfw3hprOqUTaulqnSuHhQXcB+UvD3J6uWphDp++tGlX1olR7Lbt21Gs3aRepdXZK
	fQ=
X-Received: by 2002:a05:6122:1d94:b0:5ab:26f:49e3 with SMTP id 71dfb90a1353d-5ac4dcf273emr6178664e0c.3.1780905356188;
        Mon, 08 Jun 2026 00:55:56 -0700 (PDT)
Received: from mail-vk1-f181.google.com (mail-vk1-f181.google.com. [209.85.221.181])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-5a6d777996csm13452708e0c.7.2026.06.08.00.55.55
        for <linux-renesas-soc@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 08 Jun 2026 00:55:55 -0700 (PDT)
Received: by mail-vk1-f181.google.com with SMTP id 71dfb90a1353d-59c627b53a0so1112657e0c.3
        for <linux-renesas-soc@vger.kernel.org>; Mon, 08 Jun 2026 00:55:55 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AFNElJ/PfJoMbo2S7SLW3n/PBkftDHYmxrMqelg+wXV0yAEzyU9Hm5z6YN+eKlcjXaA+yk2ff5MkDe3yPWxW6Bn605wWew==@vger.kernel.org
X-Received: by 2002:a05:6122:4692:b0:5a6:7838:d679 with SMTP id
 71dfb90a1353d-5ac52c09f1amr6196587e0c.13.1780905355135; Mon, 08 Jun 2026
 00:55:55 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260605-rzv2h-rspi-v1-1-c1d5ed562249@gmail.com>
In-Reply-To: <20260605-rzv2h-rspi-v1-1-c1d5ed562249@gmail.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Mon, 8 Jun 2026 09:55:44 +0200
X-Gmail-Original-Message-ID: <CAMuHMdVEYciUYq6savTuOqDUQp6AqHGkeP30s6Z7PoZ3q-Pqvg@mail.gmail.com>
X-Gm-Features: AVVi8CcmuQ7XmWIeu3kjbwGuTATRPoxdKm42xnuPXVpABMXaapDScD6SCIjYH5M
Message-ID: <CAMuHMdVEYciUYq6savTuOqDUQp6AqHGkeP30s6Z7PoZ3q-Pqvg@mail.gmail.com>
Subject: Re: [PATCH] spi: rzv2h-rspi: fix incorrect readl() accessor for 8-bit
 RX path
To: Felix Gu <ustc.gu@gmail.com>
Cc: Fabrizio Castro <fabrizio.castro.jz@renesas.com>, Mark Brown <broonie@kernel.org>, 
	linux-spi@vger.kernel.org, linux-renesas-soc@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-Rspamd-Action: no action
X-Spamd-Result: default: False [0.04 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	DMARC_NA(0.00)[linux-m68k.org];
	TAGGED_FROM(0.00)[bounces-33648-lists,linux-renesas-soc=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:ustc.gu@gmail.com,m:fabrizio.castro.jz@renesas.com,m:broonie@kernel.org,m:linux-spi@vger.kernel.org,m:linux-renesas-soc@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:ustcgu@gmail.com,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[geert@linux-m68k.org,linux-renesas-soc@vger.kernel.org];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_TO(0.00)[gmail.com];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	MISSING_XM_UA(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	RCVD_COUNT_FIVE(0.00)[6];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[geert@linux-m68k.org,linux-renesas-soc@vger.kernel.org];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	TAGGED_RCPT(0.00)[linux-renesas-soc];
	R_DKIM_NA(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCPT_COUNT_FIVE(0.00)[6]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 058AB653C6B

Hi Felix,

On Fri, 5 Jun 2026 at 17:26, Felix Gu <ustc.gu@gmail.com> wrote:
> The RZV2H_RSPI_RX macro instantiation for u8 data incorrectly uses
> readl(). It performs a 32-bit read which can consume excess data and
> cause corruption.
>
> Fixes: 8b61c8919dff ("spi: Add driver for the RZ/V2H(P) RSPI IP")
> Signed-off-by: Felix Gu <ustc.gu@gmail.com>

Thanks for your patch!

> --- a/drivers/spi/spi-rzv2h-rspi.c
> +++ b/drivers/spi/spi-rzv2h-rspi.c
> @@ -137,7 +137,7 @@ RZV2H_RSPI_TX(writew, u16)
>  RZV2H_RSPI_TX(writeb, u8)
>  RZV2H_RSPI_RX(readl, u32)
>  RZV2H_RSPI_RX(readw, u16)
> -RZV2H_RSPI_RX(readl, u8)
> +RZV2H_RSPI_RX(readb, u8)
>
>  static void rzv2h_rspi_reg_rmw(const struct rzv2h_rspi_priv *rspi,
>                                 int reg_offs, u32 bit_mask, u32 value)
>

According to Chapter 7.5 Serial Peripheral Interface (RSPI) Subsection
7.5.2.1 List of Registers, the SPI Data Register supports access sizes
of 8, 16, and 32 bits.

However, the "Access Size [bits]*1" column header has a foot note:

    "Note 1.  The read access size is fixed at 32 bits."

Hence that means the rzv2h_rspi_rx_u8() function as generated by the
RZV2H_RSPI_RX() macro is correct, but rzv2h_rspi_rx_u16() is not?

Also, readw() in rzv2h_rx_irq_handler() is wrong, too?

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

