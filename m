Return-Path: <linux-renesas-soc+bounces-32840-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id kDvLCelmDWquwgUAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-32840-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 20 May 2026 09:46:49 +0200
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 83C9B5891EE
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 20 May 2026 09:46:48 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 81243307FDC5
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 20 May 2026 07:41:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5161137D128;
	Wed, 20 May 2026 07:41:28 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-vk1-f181.google.com (mail-vk1-f181.google.com [209.85.221.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BB6F233A032
	for <linux-renesas-soc@vger.kernel.org>; Wed, 20 May 2026 07:41:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779262888; cv=none; b=Ti+FYVBO4YWl5l315UQmlMycoUoL10X1/pPyegbOB4tq5xVdg+vm2fl8wbCWwX5b09iNum4f5Zoh/yYeN725yWTSjVIn9b5AAybOG1SOyZmd7I5fgUx96jXE2g6mf+PX/YPtN5Mo3/LKmv0ivgytCM9jQKGwWYe92ykkC3aA+5A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779262888; c=relaxed/simple;
	bh=GGC3bFBP/3ByVZ/MY3UquCkN0tW0C4a1P7AtWMjyi9A=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=dGJcJI1kv+8CoIHstfg+I1Pbu1qIoNqzNLXn43JrbkJ+IfxL6H09pnB9eHPhN18gppiQAZlJo50yErV5ki3+WvEDyeYpOEc9wytMm43EZJ03ISU5sVq36GwfMHBtfytuNhIs/cwVDwbOb9yK+Hly/0KYBs75IR5P9P2iGQ/VFMk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.221.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vk1-f181.google.com with SMTP id 71dfb90a1353d-575602688deso1518117e0c.1
        for <linux-renesas-soc@vger.kernel.org>; Wed, 20 May 2026 00:41:26 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779262886; x=1779867686;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=UZhaROgHXzu5fMLFg999WSqpULkYuqJChVRCQj6qLHE=;
        b=X4wakTXxL+6R81HiiGtwrD6V5/K7WrwgjZN/6UmZGQShmPk8HlJT0/mpfBCNTbw+Y8
         9zIFU7V15NJ6X6EtYpHSHvQ+ptHLwCg60mCkN9lnzhRG6CJ2hYT4hpW78df2ZpX3FuIM
         VWMRjkxfMOSUwxuDZjN01ln7jINn8YLYkJqJNQC5XQmZYPyixcO1g1dIs2TfL0/MQtqA
         ODGuLzd2fzs55Tx3ZtukMBjipMtqR08Se5dNJiayyTO4WOlxkcxT4BLCnTakKHLjsJgR
         8KP1A0xu7v3DJ7ke8zUQtA7sM94GDTDOJcUsA5sQBJLpIlKcnXfqlJqrpI18blnF65MI
         r5hA==
X-Forwarded-Encrypted: i=1; AFNElJ/GKcSJ+BxfFXXnzNhwWA62ZwgF43u0wgapk1qhpIm3jWY6MR1nAHFWM7M2zCljR2bCzoPnXN2g4j6ezE8Bfxha/A==@vger.kernel.org
X-Gm-Message-State: AOJu0YwcoLAkD7bvGmshR5ejkHi0WDfFxACGabeC5e6SuN8nFaztKQo4
	Aeowk3SK0z7Iday+RJ8gsfoyrq4aIu646vvxB1LWTaIIFKSEj2uBIMnf5yVx75fyUm8=
X-Gm-Gg: Acq92OG/G+yRbBUikSJeCEkhiWaZmP/CQgDKyo8RIAeP9/VTU/y7Q+TUMBPQZJncWOL
	aATQTPutzsJ6s4Bz15CIRH6dNvne2BLaxbgtSAc1PpNw7He2uAoDba2OOpGUORKC9ovPodEQJ67
	qV2TgrV3b9AvVRaUXAFG4xTHKeOqpLEl2+h10yL9fiiIyJoRF7hoxFWYeoEgURc37B/tgwgtwsC
	rP/1lf1ukTgJPNghA4n0P0Ns7qaHWvGLxPHUJUA4JKBGv20APECeQCrPRnbBm1I389eLY2tuOlt
	rHMy9d4eF7Wf3r6UnCw8KdyfjxhlAqKTKVk/1MqMRk4DFF3zW9SyzAaKDkJpFPxFhdysJMajvD5
	jT9wyCogGe1UKMJOIjoJbPMLclfNtMNhKU5P4RFzxV9msFVJI3sAFCcbNvGZ2AaCC2U8YGIEvVW
	sC6ollvoIQ2D1raqxELmvqdXi0WwzLgOVV/0WOmMaP9zXpSogTA6/H7g6ordwn
X-Received: by 2002:a05:6122:d86:b0:56f:6d11:b962 with SMTP id 71dfb90a1353d-5760beb256cmr11673016e0c.2.1779262885741;
        Wed, 20 May 2026 00:41:25 -0700 (PDT)
Received: from mail-vs1-f51.google.com (mail-vs1-f51.google.com. [209.85.217.51])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-5760f622b05sm10008469e0c.8.2026.05.20.00.41.24
        for <linux-renesas-soc@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 20 May 2026 00:41:24 -0700 (PDT)
Received: by mail-vs1-f51.google.com with SMTP id ada2fe7eead31-6314a0eefb1so1292708137.2
        for <linux-renesas-soc@vger.kernel.org>; Wed, 20 May 2026 00:41:24 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AFNElJ+ayvhOZ36CB+IZa8x77uCHJeg0KWvbTPKxLEyMYg4wngT77qQAiXj7fDAqF01ze2Q+imoTHzfugbEIPWgEJMYLmw==@vger.kernel.org
X-Received: by 2002:a05:6102:f85:b0:631:4d87:ba5f with SMTP id
 ada2fe7eead31-63a3d0182e9mr12079127137.3.1779262883651; Wed, 20 May 2026
 00:41:23 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260519133025.618255-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <CAMuHMdVKOdzThVMOcQ1K9crUkyDutvuZsP2-5v5++SVFHkgtOA@mail.gmail.com>
 <CA+V-a8sFNjp9euEEfBf3BoscjU8W3isRT_pnzd7J4QsuiN6qfg@mail.gmail.com> <18c41409-e1d1-4877-87a6-1c3156f943aa@embeddedor.com>
In-Reply-To: <18c41409-e1d1-4877-87a6-1c3156f943aa@embeddedor.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Wed, 20 May 2026 09:41:11 +0200
X-Gmail-Original-Message-ID: <CAMuHMdVznvSLr+ap3QwawZdu8fc4dZjpkWi7wgUA815KRfCgEQ@mail.gmail.com>
X-Gm-Features: AVHnY4IbN4gvBXfEdCbvoV1Bz24wCmRs3C2Yr4J_UWX62ZxMsTA07ZYlhMORYx0
Message-ID: <CAMuHMdVznvSLr+ap3QwawZdu8fc4dZjpkWi7wgUA815KRfCgEQ@mail.gmail.com>
Subject: Re: [PATCH v2] mmc: mmc_test: Fix counter tracking in mmc_test_alloc_mem()
To: "Gustavo A. R. Silva" <gustavo@embeddedor.com>
Cc: "Lad, Prabhakar" <prabhakar.csengg@gmail.com>, Ulf Hansson <ulfh@kernel.org>, 
	Kees Cook <kees@kernel.org>, "Gustavo A. R. Silva" <gustavoars@kernel.org>, 
	Wolfram Sang <wsa+renesas@sang-engineering.com>, 
	Geert Uytterhoeven <geert+renesas@glider.be>, linux-mmc@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-hardening@vger.kernel.org, 
	linux-renesas-soc@vger.kernel.org, Biju Das <biju.das.jz@bp.renesas.com>, 
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>, 
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spamd-Result: default: False [0.04 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[gmail.com,kernel.org,sang-engineering.com,glider.be,vger.kernel.org,bp.renesas.com,renesas.com];
	TAGGED_FROM(0.00)[bounces-32840-lists,linux-renesas-soc=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	DMARC_NA(0.00)[linux-m68k.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[14];
	MIME_TRACE(0.00)[0:+];
	MISSING_XM_UA(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[6];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[geert@linux-m68k.org,linux-renesas-soc@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-renesas-soc,renesas];
	R_DKIM_NA(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[linux-m68k.org:email,embeddedor.com:url,embeddedor.com:email,renesas.com:email,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,mail.gmail.com:mid]
X-Rspamd-Queue-Id: 83C9B5891EE
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Hi Gustavo,

On Tue, 19 May 2026 at 20:44, Gustavo A. R. Silva
<gustavo@embeddedor.com> wrote:
> On 5/19/26 07:44, Lad, Prabhakar wrote:
> > On Tue, May 19, 2026 at 2:34=E2=80=AFPM Geert Uytterhoeven <geert@linux=
-m68k.org> wrote:
> >> On Tue, 19 May 2026 at 15:30, Prabhakar <prabhakar.csengg@gmail.com> w=
rote:
> >>> From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> >>>
> >>> Fix an counter tracking in mmc_test_alloc_mem() that causes a kernel =
panic
> >>> during error unwinding.
> >>>
> >>> The `struct mmc_test_mem` uses the `__counted_by(cnt)` annotation on =
its
> >>> flexible array member `arr`. While kzalloc_flex() initially sets the
> >>> counter field (`cnt`) to `max_segs`, the allocation loop needs to tra=
ck
> >>> how many elements have actually been populated.
> >>>
> >>> Previously, leaving `mem->cnt` at `max_segs` meant that if the loop f=
ailed
> >>> midway (e.g., "Failed to map sg list"), the error unwinding path in
> >>> mmc_test_free_mem() would attempt to clean up uninitialized trailing
> >>> array slots. This resulted in passing NULL pointers to __free_pages()=
,
> >>> triggering a kernel panic:
> >>>
> >>>    [   66.172845] mmc0: Failed to map sg list
> >>>    [   66.176722] Unable to handle kernel NULL pointer dereference at=
 virtual address 0000000000000000
> >>>    ...
> >>>    [   66.432747] Call trace:
> >>>    [   66.435191]  ___free_pages+0x1c/0xc4 (P)
> >>>    [   66.439119]  __free_pages+0x14/0x20
> >>>    [   66.442608]  mmc_test_area_cleanup+0x58/0x84 [mmc_test]
> >>>
> >>> Fix this by explicitly resetting `mem->cnt` to 0 immediately after
> >>> allocation. Then, move the existing `mem->cnt` increment so that it o=
ccurs
> >>> prior to populating each array slot, using `mem->cnt - 1` for the act=
ual
> >>> assignment index. This guarantees that the counter accurately tracks
> >>> initialized entries for safe error cleanup, while dynamically expandi=
ng
> >>> the `__counted_by` validation boundary ahead of each flexible array w=
rite.
> >>>
> >>> Additionally, rewrite the cleanup loop in mmc_test_free_mem() to use =
a
> >>> standard forward for-loop. This addresses the unsafe post-decrement l=
ogic
> >>> in the original `while (mem->cnt--)` loop which evaluated and decreme=
nted
> >>> the counter field before indexing the array, and avoids a potential i=
nteger
> >>> underflow/wrap-around of the counter field if the cleanup path is inv=
oked
> >>> when `mem->cnt` is 0.
> >>>
> >>> Fixes: c3126dccfd7b ("mmc: mmc_test: use kzalloc_flex")
> >>> Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com=
>
> >>> ---
> >>> v1->v2:
> >>> - Started with cnt =3D 0 and incremented before assignment to ensure
> >>>    accurate tracking of initialized entries in mmc_test_alloc_mem().
> >>> - In mmc_test_free_mem(), replaced the while loop with a forward for-=
loop to
> >>>    safely iterate over initialized entries without risking underflow.
> >>> - Updated commit message to clarify the issue and the fix.
> >>
> >> Thanks for your patch!
> >>
> >>> --- a/drivers/mmc/core/mmc_test.c
> >>> +++ b/drivers/mmc/core/mmc_test.c
> >>> @@ -318,9 +318,8 @@ static void mmc_test_free_mem(struct mmc_test_mem=
 *mem)
> >>>   {
> >>>          if (!mem)
> >>>                  return;
> >>> -       while (mem->cnt--)
> >>> -               __free_pages(mem->arr[mem->cnt].page,
> >>> -                            mem->arr[mem->cnt].order);
> >>> +       for (unsigned int i =3D 0; i < mem->cnt; i++)
> >>> +               __free_pages(mem->arr[i].page, mem->arr[i].order);
> >>>          kfree(mem);
> >>>   }
> >>>
> >>> @@ -356,6 +355,7 @@ static struct mmc_test_mem *mmc_test_alloc_mem(un=
signed long min_sz,
> >>>          mem =3D kzalloc_flex(*mem, arr, max_segs);
> >>>          if (!mem)
> >>>                  return NULL;
> >>> +       mem->cnt =3D 0;
> >>
> >> This is not needed, as it is set to zero by kzalloc_flex().
> >>
> > Actually, kzalloc_flex() automatically sets mem->cnt to max_segs
> > because cnt is annotated with __counted_by. Because of that implicit
> > initialization, we need this explicit reset to get it back to zero.
>
> An auxiliary variable could be used to avoid having to update the
> counter too early[1][2].

Thank you!
In light of this, Prabhakar's v1[3] is the better solution.
But perhaps that the addition of "mem->cnt =3D max_segs;" after the
kzalloc_flex() should be dropped, as it is done automatically by
compilers that support __counted_by, but is irrelevant for compilers
that do not support it (the correct value is set at the end anyway).

Gustavo, what do you think?

> I think it'll eventually become best practice to defer updating the
> counter until after the flexible array has been fully initialized, or
> after every major update that requires changing its boundaries.

In case the update is a _decrease_.
If the update is an _increase_, it must be done first?

> [1] https://git.kernel.org/linus/ea9e148c803b24eb
> [2] https://embeddedor.com/blog/2024/06/18/how-to-use-the-new-counted_by-=
attribute-in-c-and-linux/
> (I'm in the process of updating this blogpost with some *alloc_flex() exa=
mples and more.)

[3] "[PATCH] mmc: mmc_test: Fix __counted_by handling after
kzalloc_flex() conversion"
    https://lore.kernel.org/20260513201315.3186621-1-prabhakar.mahadev-lad.=
rj@bp.renesas.com

Gr{oetje,eeting}s,

                        Geert

--=20
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k=
.org

In personal conversations with technical people, I call myself a hacker. Bu=
t
when I'm talking to journalists I just say "programmer" or something like t=
hat.
                                -- Linus Torvalds

