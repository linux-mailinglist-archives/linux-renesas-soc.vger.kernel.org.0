Return-Path: <linux-renesas-soc+bounces-29267-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id kKSfA7ySsmnONgAAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-29267-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 12 Mar 2026 11:17:32 +0100
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 6C00E2703FB
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 12 Mar 2026 11:17:31 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 70F0231747CF
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 12 Mar 2026 10:13:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E8D3B38C2C4;
	Thu, 12 Mar 2026 10:13:13 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-vk1-f181.google.com (mail-vk1-f181.google.com [209.85.221.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A59F92264C7
	for <linux-renesas-soc@vger.kernel.org>; Thu, 12 Mar 2026 10:13:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773310393; cv=none; b=p86wN4DHTKCQuK4GbF65WquGGgN9feMwbppcLB4Q5AV3XFdDeXJu3n7CBNeuRB8L6iiR4TdBxd0/sgxNr5TIGDl+C12FYKy+K/l64Ms3drTR+PwLoHszl5DBCEHrrkAgooEv9iaTJD58fAlJLdkEtPb9r6GKlQnOQoKDyHRrzQ0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773310393; c=relaxed/simple;
	bh=anBT9rHzajcp5J37Vaca7h+6VrrR9T6D0lZFYoavTjs=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=p8IETrWUYXVWGj2wjv38+J9TSgnu+kh8RgMae8/gYAz0GLHrCYXMXrKPlBLWwitZNZzy34jMOA95rgj4TgiCkk2POypXNyUUt2GaSB734/1MtrWYbOz+1xwEAhqFKZzCsQtvxrk/t4YspnL3b848TkaBIUaCS05+VqF8FedN2IM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.221.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vk1-f181.google.com with SMTP id 71dfb90a1353d-5637886c92aso492171e0c.0
        for <linux-renesas-soc@vger.kernel.org>; Thu, 12 Mar 2026 03:13:10 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773310389; x=1773915189;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=mRUIGhDHBmpDT5lNoF1B+T5NZ6zsaWhp+bjML87d5C0=;
        b=EF2/sUbYMmCHSGPXz0xSV3yHJ+94UeaaiuRCDGtwasupnJPfS+dkV1hFKV5RFPCx1o
         uRTbt68uzTpWHJjXlS7gFBvKVDDZd/xVhed7b8Z68nutCj22dITwhbrM0MFZ9BkYNVGD
         dgYprt/058ASNuZHy+Zk4AO5MsxFKgXQyU5kI2XroL9b2y0WEdXwheloE38JQUVJBv23
         TVefeI5zXbunWZT+SIRH7vggVkjCJSAPCUMLhJ058xhgf8aPZOkaCO0Lt2saapFrPtRY
         ai/ecuU84imy0JL1lX60DzaQgev14V9X5vNSvoX9xOz8ykXs6gpsvsFWdNYoiqlqA1ng
         6BnQ==
X-Gm-Message-State: AOJu0YzIuBezkJWveFBOSQ2Mm+hajViVFcVkTUlBvTR91dG5DjrNZCiY
	qJ68OO04LWSJvBMP2rCUr/PC2xMcxE4cFYKP7Ej3IupLTL/S2jSX0TZTcevGVOdQeXA=
X-Gm-Gg: ATEYQzxj+W1DHETzevkHFIosoT0e0WA9WTLJGiJWz8qXzEBHseAB94Kb/W/KgmaJc9P
	GRk++LSQ3wSmhOz/5P30r9ZLGi0Ot7wkC5YlD9kubb5OXxns8nAg3YpqEBhCavw9fdtU19oXUIW
	sLq2nfUWQPiyfH2BHkUM4h7fyO2Fx55Kg6GOz5LdyfVFTUFVyJGUNd4Fd4U8ueKlFVmvF7GCr4Y
	UaldRAcuKrUBTDsigRJPgfqTVlGCaDIAQFiMTwTU/tMH3pFQDgby6xms5YMnpikbDwx5oihGiaK
	RF/EPd1uG/9HLgOnof+cW3QQpFnkyTzYzQWHIE2aBhmaMPuW9AsOdIRneITFEfKj1R/cjCWvy7T
	W2qhRVjeTw1d1GLzBUlD60LM9+rxathVXBw6QhO3mmmzoMLMSYn9McUGYXgytIPaW0OCG3f/W6O
	AjeCI6CvOQQor3SxT7jwq+CnLTQTM7z/scvBDTyaqM+9p3RKmn1qNb9iRJ+3CH
X-Received: by 2002:a05:6102:3a10:b0:5f5:503e:c76d with SMTP id ada2fe7eead31-601deb70155mr2033158137.4.1773310389265;
        Thu, 12 Mar 2026 03:13:09 -0700 (PDT)
Received: from mail-vs1-f53.google.com (mail-vs1-f53.google.com. [209.85.217.53])
        by smtp.gmail.com with ESMTPSA id ada2fe7eead31-601de74a9a5sm1776939137.5.2026.03.12.03.13.08
        for <linux-renesas-soc@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 12 Mar 2026 03:13:08 -0700 (PDT)
Received: by mail-vs1-f53.google.com with SMTP id ada2fe7eead31-5ff05af29b4so252073137.1
        for <linux-renesas-soc@vger.kernel.org>; Thu, 12 Mar 2026 03:13:08 -0700 (PDT)
X-Received: by 2002:a05:6102:6c8:b0:5fd:f509:c97 with SMTP id
 ada2fe7eead31-601ded4f6bcmr1922271137.18.1773310387815; Thu, 12 Mar 2026
 03:13:07 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260311200307.16034-2-wsa+renesas@sang-engineering.com>
In-Reply-To: <20260311200307.16034-2-wsa+renesas@sang-engineering.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Thu, 12 Mar 2026 11:12:55 +0100
X-Gmail-Original-Message-ID: <CAMuHMdVT9WoXN=9SCXr-rBoTn8tG8uQptuVEkA2Bnamaky6wJw@mail.gmail.com>
X-Gm-Features: AaiRm50l5HVFmnjSkJzKh_VBVP91gGl5Lzdoyu5m4T1kcOaEkTPJSpDpnqS3aEo
Message-ID: <CAMuHMdVT9WoXN=9SCXr-rBoTn8tG8uQptuVEkA2Bnamaky6wJw@mail.gmail.com>
Subject: Re: [PATCH v3] ARM: dts: renesas: r9a06g032-rzn1d400-db: use
 interrupt for Micrel PHYs
To: Wolfram Sang <wsa+renesas@sang-engineering.com>
Cc: linux-renesas-soc@vger.kernel.org, Herve Codina <herve.codina@bootlin.com>, 
	Magnus Damm <magnus.damm@gmail.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, devicetree@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-Spamd-Result: default: False [-1.46 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FROM_HAS_DN(0.00)[];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FREEMAIL_CC(0.00)[vger.kernel.org,bootlin.com,gmail.com,kernel.org];
	RCVD_TLS_LAST(0.00)[];
	DMARC_NA(0.00)[linux-m68k.org];
	TAGGED_FROM(0.00)[bounces-29267-lists,linux-renesas-soc=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-renesas-soc,renesas,dt];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[geert@linux-m68k.org,linux-renesas-soc@vger.kernel.org];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[6];
	R_DKIM_NA(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[8];
	DBL_BLOCKED_OPENRESOLVER(0.00)[mail.gmail.com:mid,glider.be:email,linux-m68k.org:email,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,sang-engineering.com:email,bootlin.com:email]
X-Rspamd-Queue-Id: 6C00E2703FB
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Wed, 11 Mar 2026 at 21:03, Wolfram Sang
<wsa+renesas@sang-engineering.com> wrote:
> Make use of the interrupts wired to the Micrel PHYs via the GPIO IRQ
> mux.
>
> Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
> Reviewed-by: Herve Codina <herve.codina@bootlin.com>
> ---
> Changes since v2:
>
> * use pull-up bias (much better now)
> * keep pinmux sorting correct

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
i.e. will queue in renesas-devel for v7.1.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

