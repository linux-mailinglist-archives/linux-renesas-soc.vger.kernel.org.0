Return-Path: <linux-renesas-soc+bounces-32810-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 6AIUFZtqDGo8hQUAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-32810-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 19 May 2026 15:50:19 +0200
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id AF88F580008
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 19 May 2026 15:50:18 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id B6C41307542E
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 19 May 2026 13:44:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 96A3B233959;
	Tue, 19 May 2026 13:44:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="UeY/hFnH"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-wr1-f47.google.com (mail-wr1-f47.google.com [209.85.221.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BC3AD370AEC
	for <linux-renesas-soc@vger.kernel.org>; Tue, 19 May 2026 13:44:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.221.47
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779198276; cv=pass; b=o1eBXHfAiUtpzzD+OUojEQPrxvfz16EZ+2w8sLMD4hQmFuNtRvYiuKzVlUvpBXVNZEI0b9LpM1moTEu+FpWDEGspplN+OGJUEsS/nfDFqtMsw5esKIqAdJuYI6shAFwQsrgV7qsteqlGSCl8+Hg+S6NM5ebw4FNM8vii7PpsKhY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779198276; c=relaxed/simple;
	bh=opOVFODQci9HR/5dFhKBBRniDOSVqW6FnIkz8KfOIxc=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=RzpE9rzcTlTDTASVKJTnKdyVUjZ091z4CjpdtNl4Rb3bjxAWTLiNf2QHdZwcVeLkM6kVoj8aUVJV9STpXyfmaVwGva7flhj7TwJgtxukgVVnznnyCqRp5Pk2MDebUmdj52gaciz9Dvw+X+xMPHsY78r7YcoUOpYaOSKHDTZqJbA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=UeY/hFnH; arc=pass smtp.client-ip=209.85.221.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wr1-f47.google.com with SMTP id ffacd0b85a97d-44e5624c053so2129560f8f.2
        for <linux-renesas-soc@vger.kernel.org>; Tue, 19 May 2026 06:44:34 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1779198273; cv=none;
        d=google.com; s=arc-20240605;
        b=Eler5W8sjsUvutpitfIwyP6qCRYiuYb9doFg4vg7nFJqTDXEVGs5X9efKdbDWjakoy
         Ie9yVZRbvJuGe5F/usK1fGZb/qyRw+SX7xqhfNsa1zR6ABGgz3iFnpfD5rDZ987YfK88
         Tsj7i+KQsDL7ZLF+ms+pGB+1YJHECB967RlH6/pc/vV3hkVJwFcBE7W36mlqiyZX2FNO
         beddj5XA+HXq6AOqjKRHbcOcRL2hrtYnY8aQ7FHT7fHT2fBF5ge0IPu2aAtGvwSYnO1c
         8H/vKY7eUL59ufd2EERtHcwgjxqXYCBtSeqwv75+lQyN8e6WaAzbeZlLzwass35fCoMz
         WCjA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=O+YkZX+39OPcemnQqAhpYtGbTbuu0be2yB+wxTeVaUo=;
        fh=g77IYmogZWMAE4Fk5wphOz7VbW05r+peI760iSpfe/o=;
        b=EUURtp+iRUcKndp7f3idwGCIm/TKzIjkCu8uRkTTMczfE5vPPry4/Z9zrAgctUi1UV
         bwZDm6zN83kVG23xh9zIcPHmZ6s8vstlqCk776nYVWQklQcVVOauG32i/FlNmEwc/AWk
         C3K3vqVxVXF5+hsIZaAsVpQRO1N6OYVC5IEv6E1zozAbguj1f+RVfcpKmRbkuzrfBE5O
         3kL6npG9j7G/77c40ljtmUVSwMzOiH21H+9fMLLFWCZuaXBXSncy4rWAbE3Ju8t3NkIY
         nx/H8lE59AuVmmxIEDkf4UZ0KgL4wRQwMI9VShwHstom6zjwHDAEVvah51rsNdXzDnIl
         DKlQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779198273; x=1779803073; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=O+YkZX+39OPcemnQqAhpYtGbTbuu0be2yB+wxTeVaUo=;
        b=UeY/hFnH5Fm3/Z+luDGQ6LJAttiECk9Esn624YcdJOtKUQe3FRzSTGJb3SWq1z9YHB
         cKTX+NwXMnzqbTGHg+hy4HP3wFndSIoYngLayx6hOifGmoxj8nKTBHBoe5AgyWznb/Y4
         jxNOr0Jg+3mh0exey/zr0wg4bQyli6qCXgeq2gHWm7MBU9NpTEbvzBS0XcYTeTQdn/sS
         /WJtHojhyd+VHFYNVvgDY4RZ8Hm2ay4QVxTBEf28g5uy02b7IOm5h/5JMIuxIbAYwbq/
         7VC6qV08pikIu53Wy3H0XpYJ1QuASddZAZZPd/lv/2prxgrm1CtSA0wBFQAs0NDq+5Wc
         wTQw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779198273; x=1779803073;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=O+YkZX+39OPcemnQqAhpYtGbTbuu0be2yB+wxTeVaUo=;
        b=TeveVs8wqIOPwm0NqtHjUNy9ymYM1z0AFvrH0eIGafmrhMsHCIqLP0zhJdlUmR9f8z
         VD3FfmdFjoviZtc8QpLXouKJ7kBmFV0QdB0nYdSwN6rUNzka1qnyAFWYdobxgutRJMaL
         3DIrTwBi/ihhVGrrs5WyoKpCT08EJFavO2IP8VdGcxdz+FY2T3o2+M8+rS6I+ySIENc9
         iLo/w1H+ffqDaE79CAGaugGf5UOBmKGJ5B9/UUHvC/pcNLYS+0BnTFPDhfwyHVJYdRp/
         NfeNSly0anMFwvO+g71xoAM5puFCVXE6doxzxZW6WWn+L0h03t50ynfyR5msxwNsareM
         0tmQ==
X-Forwarded-Encrypted: i=1; AFNElJ/8Y4mlSrp8nsko3/a6xrhhBy1CVJc3rP6oPvAAKlSXt2p1dSv9S7DcEc79tMMGbF7mDtrMSZNPZcpTiFBjmXgkqA==@vger.kernel.org
X-Gm-Message-State: AOJu0Ywh619io3hGJbM0Fh41IZ8gjP+f0274CUdPiO0SWZWQB38uu1sK
	ePAoQGQg49eqwZbuRco3FAdf7UUKqlYD+2gnqaPt0I90d0G9TJbrjwOabyih9eKmaL9iClLZMUt
	Y1Qny+rD662n9D50IL+e6oimyx+6jQjM=
X-Gm-Gg: Acq92OHcQOK9lx5JK+MIGjkDpwVQb+jfQsa0G3ZCFe2VljlffY2pWyk1/8idwZPYsnp
	hyBgfCHVehoTxqH3b3m4RwJr6OVZkTaXTTWIAww+ldB+BzMqNFE26JaXvGYdLlclhgubpzsY4oF
	ARFLUCE5+egda9Fk3yOWcB9G1jrl33NIfUvbOZGbetJGYkKrTpLSQzDUezocumq/Fcws3hqjYa5
	dBCCyovW4QJWTd0H3iNAV229p8yIk6zzo6yFbBFW0UJCvJKyT0w7EKy47b2sQvaQV6oQUd2R4+6
	n1+wBUapLy3ITmaZODi0cun457j+2EDX6nL9n9c6sZEbnPNYOY03zFdI/0LVk6whPsVh
X-Received: by 2002:a05:6000:25c7:b0:452:79c0:f7f1 with SMTP id
 ffacd0b85a97d-45e5c349e9amr32067188f8f.0.1779198273012; Tue, 19 May 2026
 06:44:33 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260519133025.618255-1-prabhakar.mahadev-lad.rj@bp.renesas.com> <CAMuHMdVKOdzThVMOcQ1K9crUkyDutvuZsP2-5v5++SVFHkgtOA@mail.gmail.com>
In-Reply-To: <CAMuHMdVKOdzThVMOcQ1K9crUkyDutvuZsP2-5v5++SVFHkgtOA@mail.gmail.com>
From: "Lad, Prabhakar" <prabhakar.csengg@gmail.com>
Date: Tue, 19 May 2026 14:44:05 +0100
X-Gm-Features: AVHnY4K_DFHUucHBZroz2WyX0_7Z_w5XdSocDRcWygqdYSVku2G-sqkFB5JtEaE
Message-ID: <CA+V-a8sFNjp9euEEfBf3BoscjU8W3isRT_pnzd7J4QsuiN6qfg@mail.gmail.com>
Subject: Re: [PATCH v2] mmc: mmc_test: Fix counter tracking in mmc_test_alloc_mem()
To: Geert Uytterhoeven <geert@linux-m68k.org>
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
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-32810-lists,linux-renesas-soc=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[13];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_FROM(0.00)[gmail.com];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[prabhakarcsengg@gmail.com,linux-renesas-soc@vger.kernel.org];
	DKIM_TRACE(0.00)[gmail.com:+];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	TAGGED_RCPT(0.00)[linux-renesas-soc,renesas];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[renesas.com:email,mail.gmail.com:mid,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,linux-m68k.org:email]
X-Rspamd-Queue-Id: AF88F580008
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Hi Geert,

Thank you for the review.

On Tue, May 19, 2026 at 2:34=E2=80=AFPM Geert Uytterhoeven <geert@linux-m68=
k.org> wrote:
>
> Hi Prabhakar,
>
> On Tue, 19 May 2026 at 15:30, Prabhakar <prabhakar.csengg@gmail.com> wrot=
e:
> > From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> >
> > Fix an counter tracking in mmc_test_alloc_mem() that causes a kernel pa=
nic
> > during error unwinding.
> >
> > The `struct mmc_test_mem` uses the `__counted_by(cnt)` annotation on it=
s
> > flexible array member `arr`. While kzalloc_flex() initially sets the
> > counter field (`cnt`) to `max_segs`, the allocation loop needs to track
> > how many elements have actually been populated.
> >
> > Previously, leaving `mem->cnt` at `max_segs` meant that if the loop fai=
led
> > midway (e.g., "Failed to map sg list"), the error unwinding path in
> > mmc_test_free_mem() would attempt to clean up uninitialized trailing
> > array slots. This resulted in passing NULL pointers to __free_pages(),
> > triggering a kernel panic:
> >
> >   [   66.172845] mmc0: Failed to map sg list
> >   [   66.176722] Unable to handle kernel NULL pointer dereference at vi=
rtual address 0000000000000000
> >   ...
> >   [   66.432747] Call trace:
> >   [   66.435191]  ___free_pages+0x1c/0xc4 (P)
> >   [   66.439119]  __free_pages+0x14/0x20
> >   [   66.442608]  mmc_test_area_cleanup+0x58/0x84 [mmc_test]
> >
> > Fix this by explicitly resetting `mem->cnt` to 0 immediately after
> > allocation. Then, move the existing `mem->cnt` increment so that it occ=
urs
> > prior to populating each array slot, using `mem->cnt - 1` for the actua=
l
> > assignment index. This guarantees that the counter accurately tracks
> > initialized entries for safe error cleanup, while dynamically expanding
> > the `__counted_by` validation boundary ahead of each flexible array wri=
te.
> >
> > Additionally, rewrite the cleanup loop in mmc_test_free_mem() to use a
> > standard forward for-loop. This addresses the unsafe post-decrement log=
ic
> > in the original `while (mem->cnt--)` loop which evaluated and decrement=
ed
> > the counter field before indexing the array, and avoids a potential int=
eger
> > underflow/wrap-around of the counter field if the cleanup path is invok=
ed
> > when `mem->cnt` is 0.
> >
> > Fixes: c3126dccfd7b ("mmc: mmc_test: use kzalloc_flex")
> > Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> > ---
> > v1->v2:
> > - Started with cnt =3D 0 and incremented before assignment to ensure
> >   accurate tracking of initialized entries in mmc_test_alloc_mem().
> > - In mmc_test_free_mem(), replaced the while loop with a forward for-lo=
op to
> >   safely iterate over initialized entries without risking underflow.
> > - Updated commit message to clarify the issue and the fix.
>
> Thanks for your patch!
>
> > --- a/drivers/mmc/core/mmc_test.c
> > +++ b/drivers/mmc/core/mmc_test.c
> > @@ -318,9 +318,8 @@ static void mmc_test_free_mem(struct mmc_test_mem *=
mem)
> >  {
> >         if (!mem)
> >                 return;
> > -       while (mem->cnt--)
> > -               __free_pages(mem->arr[mem->cnt].page,
> > -                            mem->arr[mem->cnt].order);
> > +       for (unsigned int i =3D 0; i < mem->cnt; i++)
> > +               __free_pages(mem->arr[i].page, mem->arr[i].order);
> >         kfree(mem);
> >  }
> >
> > @@ -356,6 +355,7 @@ static struct mmc_test_mem *mmc_test_alloc_mem(unsi=
gned long min_sz,
> >         mem =3D kzalloc_flex(*mem, arr, max_segs);
> >         if (!mem)
> >                 return NULL;
> > +       mem->cnt =3D 0;
>
> This is not needed, as it is set to zero by kzalloc_flex().
>
Actually, kzalloc_flex() automatically sets mem->cnt to max_segs
because cnt is annotated with __counted_by. Because of that implicit
initialization, we need this explicit reset to get it back to zero.

Cheers,
Prabhakar

