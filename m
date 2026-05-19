Return-Path: <linux-renesas-soc+bounces-32808-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id mBxGCqNoDGpXggUAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-32808-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 19 May 2026 15:41:55 +0200
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 845A357FDE7
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 19 May 2026 15:41:54 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 0E4D730A239B
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 19 May 2026 13:34:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E50EE369D74;
	Tue, 19 May 2026 13:34:41 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-vs1-f44.google.com (mail-vs1-f44.google.com [209.85.217.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A701040960D
	for <linux-renesas-soc@vger.kernel.org>; Tue, 19 May 2026 13:34:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.217.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779197681; cv=none; b=gQtuOSpcW7dWaawv2dT8WqZFWeofntjw8OH87n8xUJ+0y0VG0Ap7bkwEbI8G7Y0fTd5aOkyBtM2VXgju4VGWbCVb91dbEI3Ysu8Flwz7F7CjAvc+FiP7yrbLERqFWSN9XFM4aeUokKj0lt5aKjTtpKxQp5O0ypeNlMIeFTHMi+M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779197681; c=relaxed/simple;
	bh=9xmreuXX4OZRwbshJEWIm0npDYKfIXX0w6soI7Hy82M=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=OnMwXL2/YxGirci6zuhu7X6UBz1/AEhYlePMF2ubIeyedmRvxhQ29khul1jOWH2K2ryYe5Fi68GNcLsU9Fe9yJShnwXNAG7QtAu1h/pbZ6aIKoHPjejNdHeRmBrxkayNhNxT30uNPe39JmvR7TPW/dq+7PlBFVOFeoKvdlO5YaI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.217.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vs1-f44.google.com with SMTP id ada2fe7eead31-632a055fa9fso1218572137.1
        for <linux-renesas-soc@vger.kernel.org>; Tue, 19 May 2026 06:34:39 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779197678; x=1779802478;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=pFTXmUfGllClZ3AjkTxvr6AJKDsibhiDcNnm6JqqsT0=;
        b=Mp7LPJQjdQ2K3WM0u9B1t6CloBuawd/Q4wfn/xkFKxCGwKJmjM6lOsoCES2T2qzR2m
         G/VL3IfZpGHALLGgdljZHa4R3bKimRLOgdJ+piLfMJircEMNNURXIy8ncwynJKvKCtVa
         vHGaBS9+rls+AT1nGqElKNLRNuE0AYjHpswWL4WkgnG7L09gM8mSRGkNDAODVNnTAWLB
         zErv0kkAWsnh2TdtHFOwxqCZLHRgiSo5jlcVZJ3VyeBRELFAGqUP9U706ffjAE+iP9dY
         L/vCj8DA3vToFHdKKcWCP/y14CLgALrIao3Z+KGmcS/OEabOrEH/Gwck4TZo4SiNDpOB
         1k2w==
X-Forwarded-Encrypted: i=1; AFNElJ/efqrfANyBwmBUkIZ/t4KvGrcTe2F/hUwz/Eq2e7uLBXg+/iUs+BPS34kGrpiUhT/p91cZuk/cbdIDjGEhGo/m3Q==@vger.kernel.org
X-Gm-Message-State: AOJu0YyhKV7+VRADaWwvs9mmQtfUE9b2D13qg62rvingNpzyHon+DRVL
	NbcC7EXR5f5DM6z2wkt5QrL4dA88nzmV2MykhkZvMVjWz3WP4ab4yKpb60P/eGAO
X-Gm-Gg: Acq92OH0LVs7gC+UBF70HffxYwhLnajd2PPPkpMjgkLy6/04ZUYwYAJo01y2GN14vBm
	ejx/NVwq39WwX2w8fjsCMyvm6jlXzKVGxDjY2vMJmraLzMMzHPCIvSCBMSqUr5REDoZHl6EJdsU
	bOp6fge830IfE1ifblxG6GvlMSf7+HYS1C7O6RRfUSU3Duhy73SLfhYBDpoW756mOUgd3zLnY20
	SzsaktDQRXijaOpncIfeDVNoz3n98uIJ13OFT30uYqCsljfs0UONTHgPYMUGR5Uh9xMAvbUFoVY
	ViZ12FAezUfddNxB26ECWzmKeskApejd2+TJTa/d20EO8lT5VBeRP1H38FhdtyDsdwFB6pXfR9p
	V9hcSeGkh0fNFXFsHjlb2A69HAwN7p0ApVk1IkHFTH1eDj1Js7l3W+ErgEe+5CJmZdw3GNG3XCD
	IupoJ+NWL+3hMJwxr4xet+/SQpbKb5zpYpd3pq8ROa9JrT1JiOhnSXGRBhaSsMFR0F
X-Received: by 2002:a05:6102:32c1:b0:607:798d:8083 with SMTP id ada2fe7eead31-63a3ee80766mr8438425137.15.1779197678476;
        Tue, 19 May 2026 06:34:38 -0700 (PDT)
Received: from mail-vk1-f174.google.com (mail-vk1-f174.google.com. [209.85.221.174])
        by smtp.gmail.com with ESMTPSA id ada2fe7eead31-63cd19e0bf4sm6159532137.6.2026.05.19.06.34.37
        for <linux-renesas-soc@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 19 May 2026 06:34:37 -0700 (PDT)
Received: by mail-vk1-f174.google.com with SMTP id 71dfb90a1353d-575171b1ce7so982052e0c.1
        for <linux-renesas-soc@vger.kernel.org>; Tue, 19 May 2026 06:34:37 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AFNElJ/Jyf9uOFxdoeN6Y9vEWkakxk3lyEs0kWXcE1weVa8xvlzNLfVzZq6g7pkutMlvdeNmHmd+y/ltTsgck9bEnlpTcg==@vger.kernel.org
X-Received: by 2002:a05:6122:338f:b0:56e:e68e:9fc2 with SMTP id
 71dfb90a1353d-5760c013b50mr11245780e0c.10.1779197677423; Tue, 19 May 2026
 06:34:37 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260519133025.618255-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
In-Reply-To: <20260519133025.618255-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Tue, 19 May 2026 15:34:26 +0200
X-Gmail-Original-Message-ID: <CAMuHMdVKOdzThVMOcQ1K9crUkyDutvuZsP2-5v5++SVFHkgtOA@mail.gmail.com>
X-Gm-Features: AVHnY4LojIxsw5qMq3Y5Vfna_ILMHrHCSLgg2NltrAvQXVuBSgCgEDdy5WadACI
Message-ID: <CAMuHMdVKOdzThVMOcQ1K9crUkyDutvuZsP2-5v5++SVFHkgtOA@mail.gmail.com>
Subject: Re: [PATCH v2] mmc: mmc_test: Fix counter tracking in mmc_test_alloc_mem()
To: Prabhakar <prabhakar.csengg@gmail.com>
Cc: Ulf Hansson <ulfh@kernel.org>, Kees Cook <kees@kernel.org>, 
	"Gustavo A. R. Silva" <gustavoars@kernel.org>, Wolfram Sang <wsa+renesas@sang-engineering.com>, 
	Geert Uytterhoeven <geert+renesas@glider.be>, linux-mmc@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-hardening@vger.kernel.org, 
	linux-renesas-soc@vger.kernel.org, Biju Das <biju.das.jz@bp.renesas.com>, 
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>, 
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Content-Type: text/plain; charset="UTF-8"
X-Spamd-Result: default: False [-1.46 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-32808-lists,linux-renesas-soc=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[13];
	DMARC_NA(0.00)[linux-m68k.org];
	FREEMAIL_TO(0.00)[gmail.com];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MISSING_XM_UA(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[geert@linux-m68k.org,linux-renesas-soc@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	RCVD_COUNT_FIVE(0.00)[6];
	TAGGED_RCPT(0.00)[linux-renesas-soc,renesas];
	R_DKIM_NA(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[mail.gmail.com:mid,renesas.com:email,linux-m68k.org:email,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo]
X-Rspamd-Queue-Id: 845A357FDE7
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Hi Prabhakar,

On Tue, 19 May 2026 at 15:30, Prabhakar <prabhakar.csengg@gmail.com> wrote:
> From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
>
> Fix an counter tracking in mmc_test_alloc_mem() that causes a kernel panic
> during error unwinding.
>
> The `struct mmc_test_mem` uses the `__counted_by(cnt)` annotation on its
> flexible array member `arr`. While kzalloc_flex() initially sets the
> counter field (`cnt`) to `max_segs`, the allocation loop needs to track
> how many elements have actually been populated.
>
> Previously, leaving `mem->cnt` at `max_segs` meant that if the loop failed
> midway (e.g., "Failed to map sg list"), the error unwinding path in
> mmc_test_free_mem() would attempt to clean up uninitialized trailing
> array slots. This resulted in passing NULL pointers to __free_pages(),
> triggering a kernel panic:
>
>   [   66.172845] mmc0: Failed to map sg list
>   [   66.176722] Unable to handle kernel NULL pointer dereference at virtual address 0000000000000000
>   ...
>   [   66.432747] Call trace:
>   [   66.435191]  ___free_pages+0x1c/0xc4 (P)
>   [   66.439119]  __free_pages+0x14/0x20
>   [   66.442608]  mmc_test_area_cleanup+0x58/0x84 [mmc_test]
>
> Fix this by explicitly resetting `mem->cnt` to 0 immediately after
> allocation. Then, move the existing `mem->cnt` increment so that it occurs
> prior to populating each array slot, using `mem->cnt - 1` for the actual
> assignment index. This guarantees that the counter accurately tracks
> initialized entries for safe error cleanup, while dynamically expanding
> the `__counted_by` validation boundary ahead of each flexible array write.
>
> Additionally, rewrite the cleanup loop in mmc_test_free_mem() to use a
> standard forward for-loop. This addresses the unsafe post-decrement logic
> in the original `while (mem->cnt--)` loop which evaluated and decremented
> the counter field before indexing the array, and avoids a potential integer
> underflow/wrap-around of the counter field if the cleanup path is invoked
> when `mem->cnt` is 0.
>
> Fixes: c3126dccfd7b ("mmc: mmc_test: use kzalloc_flex")
> Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> ---
> v1->v2:
> - Started with cnt = 0 and incremented before assignment to ensure
>   accurate tracking of initialized entries in mmc_test_alloc_mem().
> - In mmc_test_free_mem(), replaced the while loop with a forward for-loop to
>   safely iterate over initialized entries without risking underflow.
> - Updated commit message to clarify the issue and the fix.

Thanks for your patch!

> --- a/drivers/mmc/core/mmc_test.c
> +++ b/drivers/mmc/core/mmc_test.c
> @@ -318,9 +318,8 @@ static void mmc_test_free_mem(struct mmc_test_mem *mem)
>  {
>         if (!mem)
>                 return;
> -       while (mem->cnt--)
> -               __free_pages(mem->arr[mem->cnt].page,
> -                            mem->arr[mem->cnt].order);
> +       for (unsigned int i = 0; i < mem->cnt; i++)
> +               __free_pages(mem->arr[i].page, mem->arr[i].order);
>         kfree(mem);
>  }
>
> @@ -356,6 +355,7 @@ static struct mmc_test_mem *mmc_test_alloc_mem(unsigned long min_sz,
>         mem = kzalloc_flex(*mem, arr, max_segs);
>         if (!mem)
>                 return NULL;
> +       mem->cnt = 0;

This is not needed, as it is set to zero by kzalloc_flex().

>
>         while (max_page_cnt) {
>                 struct page *page;

The rest LGTM.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

