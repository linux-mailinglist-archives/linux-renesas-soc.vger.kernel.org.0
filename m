Return-Path: <linux-renesas-soc+bounces-30239-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id UAUwICjgw2kgugQAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-30239-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 25 Mar 2026 14:16:24 +0100
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 526843258CF
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 25 Mar 2026 14:16:23 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id B1B4E311EE12
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 25 Mar 2026 12:45:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2EDD13D5236;
	Wed, 25 Mar 2026 12:45:35 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-vk1-f181.google.com (mail-vk1-f181.google.com [209.85.221.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A4B11391842
	for <linux-renesas-soc@vger.kernel.org>; Wed, 25 Mar 2026 12:45:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774442735; cv=none; b=TylYnqpCir9XHfA0al8wVO9KvgprsLCk06wDWG1rK8vDJm8yXxgWp+80RNbPUQEHlgLFnT4Q5gKp/E9c+6P54jqazw+f9D7hYCzmAqkCX0Ir6LCWUzIcjHld/WP9qLat979VHmYpQF1MT7J3XlcKMQSS3OLygVe7gwkmUBOy/as=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774442735; c=relaxed/simple;
	bh=XBr/cba/Zlc6n5bcrHvESQz0mtn5yxY2rSA1hEofdBs=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=mwog668hDguwYxvi+yDxziJmerPI4rFtwEceTSUdXL6N5TgdA+Ll0Y1osvH5t/O5fpcH42yFUESrdkXlQT2bH/+LnubQYDbAUKmDqQXHgormj0HLH6QX6MI3xJvbe9/9d38iIcXIj5Rb1kleaXmaObNwKLXx5CnrBSmrMPIZqhA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.221.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vk1-f181.google.com with SMTP id 71dfb90a1353d-56b890d1687so1956727e0c.3
        for <linux-renesas-soc@vger.kernel.org>; Wed, 25 Mar 2026 05:45:33 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774442732; x=1775047532;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/1RZxkj8eIoN6WQ6j7coP9y9yKKmcQFtqClsMwvMZgA=;
        b=jiTFTtWqq1xrxLzUZdmFY1i/8ATDngOXSIECCwyec/UzqKXOZ/9U3SJaoN99MnEznt
         nCrWK7UyDQj2U4idGL5bQ69m2YGG/3qMKPFqe85txy/rIunJ09UUXX7ojl7s78zu0tRn
         VDYS+C+XhiQ/veNPvDY0Q0HvJndoBqjb72Nn9IgIJHXnM2rpZJhLcN+F5NfUOeNgXePC
         Yq+GkeC8YKIuKArKryGHbiDP2GEANbkSZbuPPPyJaRqPNWzhVyI/c8AY6NdgAZEMr/RF
         HsemeMLciZlSJ/+I6j1clnJ26B/evjzOpGSNs+0VW5EpUP97gJVJktOagwAKjB3n4pN2
         EFjA==
X-Forwarded-Encrypted: i=1; AJvYcCVUu9CJPgR6gjtaUS7N+Pjk+35/tZT52My4YIGDFJ+Qr/zxY2emuSdNFAbDXNfPw3g4z1Hf1J5t6OIUC2xV2SzpKQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YzFOOd8IxreuSrA4bgTeFbUvxfg8Du2/vx0hA1gHCnxB7cndnRN
	tFXGlw+Er8RzlxMf1O0w6SqydWE60q8rycA7kHN2b+VTTSzAxWo3Ga01Hroe8h4wgN4=
X-Gm-Gg: ATEYQzwh8CmDB9Ow2WKxl0M+RBAfdFuKdONZdkXrnKeeSSjdjqv2lhVvHDEdku+qvvg
	jDVSadijmBi4quPg5nwRozc2P/HiOftYR7pcuGmjlQWSyahk5DoHLdK77oN7epgHXLMGegEvtYA
	0XtctlwKM2IfI463VkJCXWzuqTqunt0hU0n5LYfKUi+5eE3FprPf6sT6tCecmEfPGDtAy+1pe15
	U8BtW3jXW1/VVf3XVHsTGxByynmViObLDrp+72M0lxYMkYVK1t8td5VauC5bLPqCRil0Lz+u4f2
	2hVc9OzN0uxfp5Rs9iZOamu0hPSww1OSWbWbv+L2KCyPdRZvWCjd4ls1YXMyN4Ll2P0CZ2EiISQ
	+b9h7pYdEC91kMpShBhnigaZqKnBl6/9L8n11/IcnKz7iA2S9zauqpxNpdQbE4m+G58YEP+pULj
	IYWawwI2c5RtmSCN2MC9r5LvkydVjX8voeajMgEZlcCxevrgYFNB6hy5Nh4uLHt7rv
X-Received: by 2002:a05:6122:400c:b0:56b:5952:9157 with SMTP id 71dfb90a1353d-56d220e05afmr1639032e0c.15.1774442732520;
        Wed, 25 Mar 2026 05:45:32 -0700 (PDT)
Received: from mail-vk1-f170.google.com (mail-vk1-f170.google.com. [209.85.221.170])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-56cddc7f877sm20114891e0c.10.2026.03.25.05.45.31
        for <linux-renesas-soc@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 25 Mar 2026 05:45:31 -0700 (PDT)
Received: by mail-vk1-f170.google.com with SMTP id 71dfb90a1353d-56b890d1687so1956704e0c.3
        for <linux-renesas-soc@vger.kernel.org>; Wed, 25 Mar 2026 05:45:31 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCWwPIHdshUzs1fRgnVStmJPQ2A44HO8aWIv2YcmFA9Hd5D6ZsA0QQBK9DigXDGZX241w2HIgZ+ViG33Yw7HdPBqyA==@vger.kernel.org
X-Received: by 2002:a05:6122:3784:b0:55e:452f:7af0 with SMTP id
 71dfb90a1353d-56d21f36647mr1622399e0c.2.1774442730756; Wed, 25 Mar 2026
 05:45:30 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260324120435.243641-1-herve.codina@bootlin.com> <20260324120435.243641-2-herve.codina@bootlin.com>
In-Reply-To: <20260324120435.243641-2-herve.codina@bootlin.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Wed, 25 Mar 2026 13:45:19 +0100
X-Gmail-Original-Message-ID: <CAMuHMdXQVRH4vt_or2V2V4Ph8RGQ_CSPJtnK7iWiDcK5SxTC0w@mail.gmail.com>
X-Gm-Features: AQROBzDfv2p-HOz70T6PfmXIvlHiKxqYHY4VCUiyQuUAkOP4Br1NI9NmB94eAak
Message-ID: <CAMuHMdXQVRH4vt_or2V2V4Ph8RGQ_CSPJtnK7iWiDcK5SxTC0w@mail.gmail.com>
Subject: Re: [PATCH v3 1/1] clk: renesas: r9a06g032: Enable watchdog reset sources
To: "Herve Codina (Schneider Electric)" <herve.codina@bootlin.com>
Cc: Wolfram Sang <wsa+renesas@sang-engineering.com>, 
	Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, 
	linux-renesas-soc@vger.kernel.org, linux-clk@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Pascal Eberhard <pascal.eberhard@se.com>, 
	Miquel Raynal <miquel.raynal@bootlin.com>, Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: text/plain; charset="UTF-8"
X-Spamd-Result: default: False [0.04 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	DMARC_NA(0.00)[linux-m68k.org];
	TAGGED_FROM(0.00)[bounces-30239-lists,linux-renesas-soc=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-renesas-soc,renesas];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[geert@linux-m68k.org,linux-renesas-soc@vger.kernel.org];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[6];
	R_DKIM_NA(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[10];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns,mail.gmail.com:mid,sang-engineering.com:email,linux-m68k.org:email,bootlin.com:email,glider.be:email]
X-Rspamd-Queue-Id: 526843258CF
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Tue, 24 Mar 2026 at 13:04, Herve Codina (Schneider Electric)
<herve.codina@bootlin.com> wrote:
> The watchdog timeout is signaled using an interrupt and, on this
> interrupt, a software initiated reset is performed.
>
> This software initiated reset performs, in the end, a hardware system
> reset using SWRST_REQ of RSTCTRL register.
>
> The watchdog itself is able to control directly the hardware system
> reset without any operation done by the interrupt handler. This feature
> allows the watchdog to not depend on the software to reset the system
> when a watchdog timeout occurs.
>
> Indeed, when the watchdog timeout occurs, the watchdog requests a system
> reset using its own hardware dedicated line but this reset source is
> disabled at the reset controller level.
>
> To benefit of this feature and be robust against software issues, enable
> watchdogs reset sources.
>
> Suggested-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
> Signed-off-by: Herve Codina (Schneider Electric) <herve.codina@bootlin.com>
> Reviewed-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
> Tested-by: Wolfram Sang <wsa+renesas@sang-engineering.com>

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
i.e. will queue in renesas-clk for v7.1.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

