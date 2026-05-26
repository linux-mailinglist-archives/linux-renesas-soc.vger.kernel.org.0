Return-Path: <linux-renesas-soc+bounces-33176-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id IJi8K9zJFWpEbgcAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-33176-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 26 May 2026 18:27:08 +0200
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 2D21E5D9AA3
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 26 May 2026 18:27:08 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 83C793042C57
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 26 May 2026 16:25:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C53CF3B6BFE;
	Tue, 26 May 2026 16:25:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="PQR473VU"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-wr1-f51.google.com (mail-wr1-f51.google.com [209.85.221.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ABDD83AEF33
	for <linux-renesas-soc@vger.kernel.org>; Tue, 26 May 2026 16:24:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.221.51
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779812700; cv=pass; b=OfB0uHkFKsQSKkk4Jhje210m/cxRmuv3NxmWffK2kUlj3BsJ3oPQTSnZFB22dIzhe80FWivTb4WfTj4zDplJNj7MzqMBWnl2nkjPxMyxLM2ga020ai0UelYSoI6HAAtDaHrCiTEYiK0l9CDRHP0QanxrEJ/aNpTKWyEw8n78XLQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779812700; c=relaxed/simple;
	bh=wqD3bt6Kl6xYQ2OceSau18FGXwySTFWbI4PmzPjOUUk=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=CKYkIzGaSWfYCrwKNHaoEcEdOy0HoWDlvmOeSkVyKBJcmGTMx//a7qVim2K2MHuViVa/PWo67PXKR3moLHSrW8/TSXXfPv3/dJvLEJdOwwE9VhY4mO9RFKMYJsBJZ9pfuDEk730XyFyVLRLBKZHgFcNacSz40G/BD7AIJ05aNvk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=PQR473VU; arc=pass smtp.client-ip=209.85.221.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wr1-f51.google.com with SMTP id ffacd0b85a97d-444826c16ffso9172199f8f.1
        for <linux-renesas-soc@vger.kernel.org>; Tue, 26 May 2026 09:24:58 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1779812697; cv=none;
        d=google.com; s=arc-20240605;
        b=VWYefbpiEAL01ZoYn/ETbJSPPJQoQX5mR+4Jxj47/0eJ4VsGbfgMDXu94m4XkRFZPQ
         4gXt8WkpXOLgUFy7iTmEEo2PRtzM+58JwmQpsnzQVJStKenLETm8vYia+ttlEXFZv1A9
         kBQlrHVyL0M9jlSBSFBq+hkoWsm4D5JiMSbH5hVFo38mLLyBIOyK9eSdBZVn2WGJxkec
         1QSc/nUvA6csoXaIOV0ZW/kwApwiOERB6mK7+J6bkHnw+RYIf3P34qfegyyUlyGQcV3F
         Xmj7mTC3Ze5F8CSljeJy1xayZP9rJ2+Yjwe0snJ73sMWZ7sTSYr2HXyxT0No+T9HaQUC
         U74A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=4oammD2Vn2GS7tgFaMZOeQPZHe3j9rfMWe0E1YbLoz8=;
        fh=ZPm40f3O178qhUCzenNQCbcIEbu8A2wmlZPhi5MqKdU=;
        b=bYSuvxZ0LrWmSsGxbRIsZHxBnXis/a00xK75ZaYjWJrfX8G/VjbwIUTxoeAEUdeNkS
         IWWFSsiRc2/4twJHnr5XhpLu/zilyXSBRUQ0myQUMODIZzw/486jyxVNJRFNmn2w7GKm
         YiTpjKMW6USHzcBLq8H/5Dc1DC+0DDcKdKQGVrUy4EkT+ZsdGO/Q7+UFrMs2/Alb7/NZ
         3vbwc6ySgkxlb2bgMaElkASkl86vELImO3nNjvWHKBqay6IcjK6DogIVGAWfw6QIDs6b
         kASmRnI1Y0p4SPTb4aweORV3eT58HF6iYD5njhyzocYDcyYBCK0wBk2IgXjOewXtHmMb
         6q7Q==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779812697; x=1780417497; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=4oammD2Vn2GS7tgFaMZOeQPZHe3j9rfMWe0E1YbLoz8=;
        b=PQR473VU+k2XTlDUwROgrUZIB1W0/ryGF9IkahAIVNFOEnc7PjIe/krRmrHFyNc1O6
         mnMjEvuF04PmtjfdCImJMk8gT8iUYJAq/kq/W2B/SZkRgPHO0c1ABjfqSXuu5oL+Qb9F
         xHG6D59WEd+NQ+R6f3THzkKx+B5f1xMDyj4jlj250lr1fATmFAwnEoOl2TADiZjjD6Y3
         TF1EQITDgVHILbsMlSyfZBowjvIpODweDZfpOrpNzeKf/XX42zCYJ/J7MiMonlOny5lW
         rHon1tkVoazKkFuho1vh4H04njZfdp3WlfVm2wPOGAiPLCe5eWQOlRRdj3bpmtyYiqfR
         LcSA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779812697; x=1780417497;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=4oammD2Vn2GS7tgFaMZOeQPZHe3j9rfMWe0E1YbLoz8=;
        b=YV7Hjf07JGqCkzcvMlDYau8To+q5BOzWMYj7/M3FaZYUW7ra7jdNc0YIKIV7EqidrE
         1r+UvWZngdIjjrMcyfIXyvHS5JTgOnnfB1tXQTVqEow/wjs4F//Ug6fkSdABj+fBnJj/
         guEjOryIPy9YiDOUD0uosfGRSOB0fJ0vhmvjrA8SsJgYfXnjJxH0/XdCje6+Ss7hFjjs
         BaDuGMuPQrBQJKzXnlyWdiluD4q3NpE0GIA1VyREpcdtqfM8qUKfreOVJ1FRPZhZUkrU
         JzA/u+GzYpDXHDU7iIV8RHOamg3seUGCumXweuf6MyhIgB8gcjjMHC+cNRxqMWu9x1uj
         gLmw==
X-Forwarded-Encrypted: i=1; AFNElJ8BHTvdW0P25wGcZBMV05GqPkBxNqgGy5fzcHOmXc/eFs/QAMOmSD49gXndFxFLFQFZbo31Vttjn1GVA/IjojZBLQ==@vger.kernel.org
X-Gm-Message-State: AOJu0Yxd928m9POxPLaSb4a5hrQ08fvcFTB1vkTe6j4N09OUmR1DSFE/
	LZCeXbN01Sv9Joi9SdyyxIefsTqvCEm9yQLQwdnGzqboMWvFI3nX8hB4JAzZwtNmo+wbnX4HRpq
	yUFoHV82+2whRve3tRjB3pQGCq9ACH3g=
X-Gm-Gg: Acq92OGV+omuts+561106YwYM1pU2rgOSJVsUjQAxl7/tVQHNtv043YB/3gOWxOUQG+
	TTaF0rXJ7auapTu6McjUZHb2VbjZCuCb830yz6CT0UwmYuBPCJ/E0k77O1dkaodEbXQ4Tl10oNA
	jZnmayIsuRGz/XEfXscqsZEwaBzXPApFH1fIJr/LH6XmDHn1k44VxyE3AYqxkGcCtv+GARudnFI
	L2ZO4ONF7uXz1PP3Xt0i2AyQ6XDPZz1wRQO9ZI8yUiolS+XUCjxoib2NUTKpQhjh893aVIdqeTH
	PBOkzll5klgXDuYmHcWnRYmvwpxZhsmMvUuvuRUAjKyDbl5tQEkJ9+D6W13cvXL1O1w=
X-Received: by 2002:a5d:64e4:0:b0:449:c5e2:a8b7 with SMTP id
 ffacd0b85a97d-45eb38c19b5mr33050060f8f.30.1779812696769; Tue, 26 May 2026
 09:24:56 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260519133025.618255-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <CAMuHMdVKOdzThVMOcQ1K9crUkyDutvuZsP2-5v5++SVFHkgtOA@mail.gmail.com>
 <CA+V-a8sFNjp9euEEfBf3BoscjU8W3isRT_pnzd7J4QsuiN6qfg@mail.gmail.com>
 <18c41409-e1d1-4877-87a6-1c3156f943aa@embeddedor.com> <CAMuHMdVznvSLr+ap3QwawZdu8fc4dZjpkWi7wgUA815KRfCgEQ@mail.gmail.com>
In-Reply-To: <CAMuHMdVznvSLr+ap3QwawZdu8fc4dZjpkWi7wgUA815KRfCgEQ@mail.gmail.com>
From: "Lad, Prabhakar" <prabhakar.csengg@gmail.com>
Date: Tue, 26 May 2026 17:24:30 +0100
X-Gm-Features: AVHnY4K6-krW10j45FFrHmg7LOI21ztwu2LQ8TKbK1nF96GjbpuuFdl7Xhmc4k4
Message-ID: <CA+V-a8szZoKSb1SszB_0pGW+jU+8mUVJrL-uiTZ844DQ=ZB9qg@mail.gmail.com>
Subject: Re: [PATCH v2] mmc: mmc_test: Fix counter tracking in mmc_test_alloc_mem()
To: "Gustavo A. R. Silva" <gustavo@embeddedor.com>, Geert Uytterhoeven <geert@linux-m68k.org>
Cc: Ulf Hansson <ulfh@kernel.org>, Kees Cook <kees@kernel.org>, 
	"Gustavo A. R. Silva" <gustavoars@kernel.org>, Wolfram Sang <wsa+renesas@sang-engineering.com>, 
	Geert Uytterhoeven <geert+renesas@glider.be>, linux-mmc@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-hardening@vger.kernel.org, 
	linux-renesas-soc@vger.kernel.org, Biju Das <biju.das.jz@bp.renesas.com>, 
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>, 
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=2];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-33176-lists,linux-renesas-soc=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	RCVD_COUNT_THREE(0.00)[4];
	FREEMAIL_FROM(0.00)[gmail.com];
	RCPT_COUNT_TWELVE(0.00)[14];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-0.999];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[prabhakarcsengg@gmail.com,linux-renesas-soc@vger.kernel.org];
	DKIM_TRACE(0.00)[gmail.com:+];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	TAGGED_RCPT(0.00)[linux-renesas-soc,renesas];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[mail.gmail.com:mid,tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo,renesas.com:email,linux-m68k.org:email]
X-Rspamd-Queue-Id: 2D21E5D9AA3
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Hi Gustavo,

On Wed, May 20, 2026 at 8:41=E2=80=AFAM Geert Uytterhoeven <geert@linux-m68=
k.org> wrote:
>
> Hi Gustavo,
>
> On Tue, 19 May 2026 at 20:44, Gustavo A. R. Silva
> <gustavo@embeddedor.com> wrote:
> > On 5/19/26 07:44, Lad, Prabhakar wrote:
> > > On Tue, May 19, 2026 at 2:34=E2=80=AFPM Geert Uytterhoeven <geert@lin=
ux-m68k.org> wrote:
> > >> On Tue, 19 May 2026 at 15:30, Prabhakar <prabhakar.csengg@gmail.com>=
 wrote:
> > >>> From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> > >>>
> > >>> Fix an counter tracking in mmc_test_alloc_mem() that causes a kerne=
l panic
> > >>> during error unwinding.
> > >>>
> > >>> The `struct mmc_test_mem` uses the `__counted_by(cnt)` annotation o=
n its
> > >>> flexible array member `arr`. While kzalloc_flex() initially sets th=
e
> > >>> counter field (`cnt`) to `max_segs`, the allocation loop needs to t=
rack
> > >>> how many elements have actually been populated.
> > >>>
> > >>> Previously, leaving `mem->cnt` at `max_segs` meant that if the loop=
 failed
> > >>> midway (e.g., "Failed to map sg list"), the error unwinding path in
> > >>> mmc_test_free_mem() would attempt to clean up uninitialized trailin=
g
> > >>> array slots. This resulted in passing NULL pointers to __free_pages=
(),
> > >>> triggering a kernel panic:
> > >>>
> > >>>    [   66.172845] mmc0: Failed to map sg list
> > >>>    [   66.176722] Unable to handle kernel NULL pointer dereference =
at virtual address 0000000000000000
> > >>>    ...
> > >>>    [   66.432747] Call trace:
> > >>>    [   66.435191]  ___free_pages+0x1c/0xc4 (P)
> > >>>    [   66.439119]  __free_pages+0x14/0x20
> > >>>    [   66.442608]  mmc_test_area_cleanup+0x58/0x84 [mmc_test]
> > >>>
> > >>> Fix this by explicitly resetting `mem->cnt` to 0 immediately after
> > >>> allocation. Then, move the existing `mem->cnt` increment so that it=
 occurs
> > >>> prior to populating each array slot, using `mem->cnt - 1` for the a=
ctual
> > >>> assignment index. This guarantees that the counter accurately track=
s
> > >>> initialized entries for safe error cleanup, while dynamically expan=
ding
> > >>> the `__counted_by` validation boundary ahead of each flexible array=
 write.
> > >>>
> > >>> Additionally, rewrite the cleanup loop in mmc_test_free_mem() to us=
e a
> > >>> standard forward for-loop. This addresses the unsafe post-decrement=
 logic
> > >>> in the original `while (mem->cnt--)` loop which evaluated and decre=
mented
> > >>> the counter field before indexing the array, and avoids a potential=
 integer
> > >>> underflow/wrap-around of the counter field if the cleanup path is i=
nvoked
> > >>> when `mem->cnt` is 0.
> > >>>
> > >>> Fixes: c3126dccfd7b ("mmc: mmc_test: use kzalloc_flex")
> > >>> Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.c=
om>
> > >>> ---
> > >>> v1->v2:
> > >>> - Started with cnt =3D 0 and incremented before assignment to ensur=
e
> > >>>    accurate tracking of initialized entries in mmc_test_alloc_mem()=
.
> > >>> - In mmc_test_free_mem(), replaced the while loop with a forward fo=
r-loop to
> > >>>    safely iterate over initialized entries without risking underflo=
w.
> > >>> - Updated commit message to clarify the issue and the fix.
> > >>
> > >> Thanks for your patch!
> > >>
> > >>> --- a/drivers/mmc/core/mmc_test.c
> > >>> +++ b/drivers/mmc/core/mmc_test.c
> > >>> @@ -318,9 +318,8 @@ static void mmc_test_free_mem(struct mmc_test_m=
em *mem)
> > >>>   {
> > >>>          if (!mem)
> > >>>                  return;
> > >>> -       while (mem->cnt--)
> > >>> -               __free_pages(mem->arr[mem->cnt].page,
> > >>> -                            mem->arr[mem->cnt].order);
> > >>> +       for (unsigned int i =3D 0; i < mem->cnt; i++)
> > >>> +               __free_pages(mem->arr[i].page, mem->arr[i].order);
> > >>>          kfree(mem);
> > >>>   }
> > >>>
> > >>> @@ -356,6 +355,7 @@ static struct mmc_test_mem *mmc_test_alloc_mem(=
unsigned long min_sz,
> > >>>          mem =3D kzalloc_flex(*mem, arr, max_segs);
> > >>>          if (!mem)
> > >>>                  return NULL;
> > >>> +       mem->cnt =3D 0;
> > >>
> > >> This is not needed, as it is set to zero by kzalloc_flex().
> > >>
> > > Actually, kzalloc_flex() automatically sets mem->cnt to max_segs
> > > because cnt is annotated with __counted_by. Because of that implicit
> > > initialization, we need this explicit reset to get it back to zero.
> >
> > An auxiliary variable could be used to avoid having to update the
> > counter too early[1][2].
>
> Thank you!
> In light of this, Prabhakar's v1[3] is the better solution.
> But perhaps that the addition of "mem->cnt =3D max_segs;" after the
> kzalloc_flex() should be dropped, as it is done automatically by
> compilers that support __counted_by, but is irrelevant for compilers
> that do not support it (the correct value is set at the end anyway).
>
> Gustavo, what do you think?
>
Do you want me to send a v3 based on v1 [0] dropping  "mem->cnt =3D max_seg=
s;"?

[0] https://lore.kernel.org/all/20260513201315.3186621-1-prabhakar.mahadev-=
lad.rj@bp.renesas.com/


Cheers,
Prabhakar

