Return-Path: <linux-renesas-soc+bounces-29863-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 6GBFJr2+u2n1ngIAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-29863-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 19 Mar 2026 10:15:41 +0100
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 9915D2C873C
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 19 Mar 2026 10:15:40 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id DAC673046D8D
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 19 Mar 2026 09:05:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7F5672D29B7;
	Thu, 19 Mar 2026 09:04:56 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-vs1-f46.google.com (mail-vs1-f46.google.com [209.85.217.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3E9F636F41C
	for <linux-renesas-soc@vger.kernel.org>; Thu, 19 Mar 2026 09:04:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.217.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773911096; cv=none; b=IeuNyj6Q64nT+aBENjVOUUwUcKfpvrezZtYTf88qyHjx1ZuYepVn8dvPeR+IXLa5rPTQhkvzsSyS288R1WHYsze1NCBzXayT6iT5vJO8UOLYrIiaiKN6fsFn6fFirDJDOPpUlaH7GXTSKqrhymhRavML8O02e2eIx/6FnZenecM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773911096; c=relaxed/simple;
	bh=wxAIUgRjGbXKrAa5cwitqSQUjhFgKERFwqnogoq6uds=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Ya1yUsSntzPIYA9ebrDLVhcsFlmBj4UWmNBEuzNacW5PXio30adblX54LB2hJ5vKRN9usx8U/p0EhImBrSLHmt1cg9MGkRGQo5VQgxZfGofm1TNPeFkp5cjenBRrmISFU/4YNVQicbWhLQ1IDiyh+GVFDus5QFgTf1m1a1WHzII=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.217.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vs1-f46.google.com with SMTP id ada2fe7eead31-5fff18d44fbso260244137.1
        for <linux-renesas-soc@vger.kernel.org>; Thu, 19 Mar 2026 02:04:55 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773911094; x=1774515894;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=CU1vlNwfncJsQjzGdPyk2n6LDlvXFD35aR83pXBnxYc=;
        b=M2KXsxDr85NpVZ5t3usLNJySB49bjmwzAoZg/Gq4znwDeSTnVfWnlUOAd5AbN+nS3X
         r23mSdwcaTgW2ShVhn0r3IpdnGQC2n+nTogRi9fTjfSRlULqFx8GWG78t16eZlViIddQ
         HKP60PV8SbBGxsh9YQHUzCAHPuNQj9nYVwZ0k4nfG6po/fnWTU2ctJK2R1Oj0ciE00op
         y0U2drwkVfKEj449F0V6/88uyaS2tRt5zbUx1YfjPPgEY/uIfQAPy7GOEpAq7f6r1Znz
         q9NxYz3jzzJIlvaOTd2akPybDbg9p/+kbsatXTFaTa13tYZCKKf8m+u8pO5RdnWRErH6
         ilPQ==
X-Gm-Message-State: AOJu0YwrakECXh9/4XXDS2kCSHuZJ+bz5BZ34q8R7WQMnPjEdVdXsK1p
	lT6JDkrzaNLsH8M2y1rmiAFmLuI6FOisnFV8zCHgOXhtv/BR5zewiDHmgc9yWus3
X-Gm-Gg: ATEYQzxkaZeE7kYr7rtB2AEvDJhZycNJgSjiO5Zme3rE4ZSIYTy3QV+7rJ1H+jKG3UG
	mB7teB/Cn8Rm2oVEXMvZOwyPGMDu3WdE+7u/eEMHAT0/8K1vayuhJIVxRftjMqDvCJZ/HlU+22P
	hU1Dmf04868BHLZXJrcQlBGZ+O58fkjQHaMzYlSWkhAeQ5wwr6XwbAgTXJucaH2yQ8N1Wg9q/xt
	4H/YQ12REZm/AKWD+aSZbCU4tluHlySCNXXUJonW2Gq0tY3qGSlbJQmUJSN7P26oVOiD+5rBclh
	nXJo7Pn5ciA20BH0vldBwwQidCXSbi4whgQCihYXRuUjoYpBNcK3RGXJbT9UG8QDPpAs1ip5Fdr
	OLmO05kM2wiGEawTswsWGutGg5pBXcJAQ5SW07Ei+wq7tP9yQFaytYfa/0o/oCkrUZ4vBDy10lE
	KX4pUamFD0muyhPXaIOZk+Jq9bIQhcV58ailCw8Ji/sUe0pUiBg0oXxDdz7flryi/7
X-Received: by 2002:a05:6102:5091:b0:5ff:1d94:b746 with SMTP id ada2fe7eead31-6027d39c846mr3268876137.27.1773911094269;
        Thu, 19 Mar 2026 02:04:54 -0700 (PDT)
Received: from mail-vk1-f175.google.com (mail-vk1-f175.google.com. [209.85.221.175])
        by smtp.gmail.com with ESMTPSA id a1e0cc1a2514c-9510328ff0csm2568265241.5.2026.03.19.02.04.53
        for <linux-renesas-soc@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 19 Mar 2026 02:04:53 -0700 (PDT)
Received: by mail-vk1-f175.google.com with SMTP id 71dfb90a1353d-56b65ffbda3so392575e0c.1
        for <linux-renesas-soc@vger.kernel.org>; Thu, 19 Mar 2026 02:04:53 -0700 (PDT)
X-Received: by 2002:a05:6102:20dd:b0:602:8fef:d734 with SMTP id
 ada2fe7eead31-6028fefec58mr1664811137.15.1773911093236; Thu, 19 Mar 2026
 02:04:53 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260317130638.2804-1-wsa+renesas@sang-engineering.com> <20260317130638.2804-4-wsa+renesas@sang-engineering.com>
In-Reply-To: <20260317130638.2804-4-wsa+renesas@sang-engineering.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Thu, 19 Mar 2026 10:04:41 +0100
X-Gmail-Original-Message-ID: <CAMuHMdUauKW=EuEgO4y3H2s770d2dv2Fiw3Oakto0cSgx6efyQ@mail.gmail.com>
X-Gm-Features: AaiRm53660wbzpGwq8jppltV0Ed_oVqUNAk3jOPzlGAHe7bKiqgrhKHzKURY0Sc
Message-ID: <CAMuHMdUauKW=EuEgO4y3H2s770d2dv2Fiw3Oakto0cSgx6efyQ@mail.gmail.com>
Subject: Re: [PATCH 3/3] soc: renesas: add X5H PRR support
To: Wolfram Sang <wsa+renesas@sang-engineering.com>
Cc: linux-renesas-soc@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Jassi Brar <jassisinghbrar@gmail.com>, Geert Uytterhoeven <geert+renesas@glider.be>, 
	Magnus Damm <magnus.damm@gmail.com>
Content-Type: text/plain; charset="UTF-8"
X-Spamd-Result: default: False [-1.46 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[vger.kernel.org,gmail.com,glider.be];
	FORGED_SENDER_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	TAGGED_FROM(0.00)[bounces-29863-lists,linux-renesas-soc=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	DMARC_NA(0.00)[linux-m68k.org];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MISSING_XM_UA(0.00)[];
	FROM_HAS_DN(0.00)[];
	RCPT_COUNT_FIVE(0.00)[6];
	RCVD_COUNT_FIVE(0.00)[6];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[geert@linux-m68k.org,linux-renesas-soc@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	NEURAL_HAM(-0.00)[-0.507];
	TAGGED_RCPT(0.00)[linux-renesas-soc,renesas];
	R_DKIM_NA(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[glider.be:email,mail.gmail.com:mid,linux-m68k.org:email,sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns,sang-engineering.com:email]
X-Rspamd-Queue-Id: 9915D2C873C
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Tue, 17 Mar 2026 at 14:06, Wolfram Sang
<wsa+renesas@sang-engineering.com> wrote:
> On this SoC, PRR is now inside the MFIS memory block, so we need to
> access it similar to e.g. RZ/G2L.
>
> Suggested-by: Geert Uytterhoeven <geert+renesas@glider.be>
> Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
i.e. will queue in renesas-devel, pending acceptance of the DT bindings.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

