Return-Path: <linux-renesas-soc+bounces-27871-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id CK0KIlIeg2nWhwMAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-27871-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 04 Feb 2026 11:24:18 +0100
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id 2AA99E4725
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 04 Feb 2026 11:24:18 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 8AA693004DF3
	for <lists+linux-renesas-soc@lfdr.de>; Wed,  4 Feb 2026 10:24:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6623E3D902A;
	Wed,  4 Feb 2026 10:24:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="kbCCuIpf"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-wr1-f41.google.com (mail-wr1-f41.google.com [209.85.221.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E81903D7D9D
	for <linux-renesas-soc@vger.kernel.org>; Wed,  4 Feb 2026 10:24:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.221.41
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770200656; cv=pass; b=GSR0M/DUjt0IU/0KtFMJlnTgzJfO+CvWPOXylxUagCDkShPFtKDX+H4+WiltWjRKai8xSY61AHV/ljpnlxsaqfUKDwVLB9hIJxWa2IDg3gCHxV21iWYO9K/9rMfCzVNLijombD6Zp5kNl1rDpSnK4TIYlO4T4QAE/dLS7wv//+0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770200656; c=relaxed/simple;
	bh=vXGB7bHAVBuVVZiy2s+gdsY4ntOkkOVKzudlXhWiu+M=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=uvXu3tzxv0gCth6TGa3V0IY7jZLczrNpeHbx1TBFH2XBT+gjSUytAIY4O/9ZwwZ3rFscPplhHqkEdYfBTVf8SEwnvpLUlvdPBUJoNhh9znEm1tQbDZTrj9AezTAk8e4G+jsYlDVXRzF+7M9QKaLQILdHMVegRbHBAChWJtnwLsc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=kbCCuIpf; arc=pass smtp.client-ip=209.85.221.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wr1-f41.google.com with SMTP id ffacd0b85a97d-42fbc305914so5958562f8f.0
        for <linux-renesas-soc@vger.kernel.org>; Wed, 04 Feb 2026 02:24:15 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1770200654; cv=none;
        d=google.com; s=arc-20240605;
        b=fxAe0gVHVykQ+06DPuEzTJZauuNL3/+lkPCrArrauIUkdJP9lopk5dflAjvIwGyFS4
         nKOZ7ksqWo7Bf/q1XPF6K9DgMcjZLR56qdK/i0lAPWeif7QaKBWOwgCaqBcoXrhiJrCq
         pVc/qyl8uZUl1W6OqbjgQwrubJlaruIbIcW6HCFRKIpxy0Gr6pVuQaCTevXWdDQPFUhx
         o5HaHypXPGDtb4kYEUdZrRdGdFqncgbjw+vzHIYS/23cTNVe7lFCdukH+TuYT7PBimXQ
         wwDLzfHvt0C8/DpXg3AB4Nn9oRBXPEFHK7SCbTmH3+pyn+6gInx4qnb7Vkz57oakTAIZ
         PMAw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=tgcb4OGHhZ+btZ8qY4cbsk5u3dOLo0nCnPlfAj5FzpQ=;
        fh=Cc/xAEiJjh3G8qYzulnv2uPPa9xEPPZZQo2BOP6M8lM=;
        b=QXNH+bFuibi8RGAGjKbSR1Tiqo8Aov8KYUYxcgGZo6eKHhfsgcEB6A0tXaBNENsFN1
         cJPLLGA0SIcW9wIZK5s3XjweSmzytHW0hxH3pPPhZEdjke5wRhy7Hl7q4A5Admulta5G
         uyijvAtddp7BUL7SEcN/avCnzljL8YCm0Akt4Ux2SDftibcwGHzfX5Zn0fmoJDuKVlvk
         qeLvVcaz/rr6KlqNrhYj3Y2Qp3NiICBi5q2JuxEmRhHn1eDFqifZ2M5kE9GyZ7K8FuBY
         YJa8RYHV0ftWjAkA7aDmi6M88DatZQLVzXSy3kUv5bplgGwXuhJd5HrWJk5f9yFu8Dxx
         l9jg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1770200654; x=1770805454; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=tgcb4OGHhZ+btZ8qY4cbsk5u3dOLo0nCnPlfAj5FzpQ=;
        b=kbCCuIpfhWio56kPPcAY8QeanIM+hdmUZlL7NcURyr9NOqTXQQBk4bdmTs7JoeWCVV
         HjJNi85dr929tNimpJqi1dAzZdZWsfh71zVTtfSCWqO2u+vgnGyqiBeLPYt9mMeK2xG7
         RmfLtBynh8bCsSPPVRY59G4SMVA71kSReI5vyXZVYXTKHNDY68V1awj1mfr1fcJ0/nqX
         353CL5vWCDhDsfsINaDwOkz8myED7+wRmgcgyMrua6Cd5SeA3hYpBY33NissHZQGpb7c
         PaKdh2JTFMr04UOL428hFKsC7O/iYF+0cZ0aZ3/daz6rmu7JpC74duR1EWaeDWnwBizk
         /KkQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770200654; x=1770805454;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=tgcb4OGHhZ+btZ8qY4cbsk5u3dOLo0nCnPlfAj5FzpQ=;
        b=liAyb/AIbgq3uh0rEPO/UkhFH4W75h99wiSK3XOdF5iO/YMEZ+lzS2HfIiz/l+/O8G
         WabtqFmXIbjfL+ZEWD+4bIF5WjqEGkYEfRfQZO7x7/b4+GFXbvIWh8f1Hyh570kuM2YU
         E+7BlGgA8Qfqc4R9NhUcB2/R54AgmVGkKOyt2uMzYn2s3nwc6bT4cAUC0ODJLox22Pz9
         o416UAN303IT4+5ywyLvvZ2yxCtzD10jTozrV3N3kf6+Qm881HakzJnU+GPlDyCSTVfP
         RcdCbmfV75C3VGVdnHI00N4P6nkluRoHDJM8BCikKoxHkkIgYnmOE7pMKmfypi5dbSPY
         ZS9g==
X-Forwarded-Encrypted: i=1; AJvYcCX47fxizDR3Avtr+VxtXl1EqhJE/tn1tCqMC2jkvC2cuy/2OnfCZ624SrWo2sEO9ur/6PzBmq5sj2udoqUZqfzhsg==@vger.kernel.org
X-Gm-Message-State: AOJu0YwTxhFt0Z7MRyzOjKBeGqmXWvoUVivwSU0ukmsnLKzM1KB/nL+C
	pEpD/0KzD0DMHx89LuB59mDNCn5CKvNLb/kV2etAg3e+qZj5KsQek7JuoG9BtwaQ3GMdBhhcbZa
	qtmMjrAb/v8b81s984TV4UEnUgaw0/V8=
X-Gm-Gg: AZuq6aIGvJ4PQ5Padv3bFxM6ZOloR309t037FsbeRk+DhyZ24pPQ2eWaq6kMD0A+9pp
	YTUXJF0ZWAD/1mTSlh+juU/v6PlmMQ6Fkzo/qmM9OH7Hn6DTI4POBpxKu20ER+25MYYoxYlZxO+
	sKPZ/vpsySmftc1IOo2zrKv/0iI1Lh5UNbsWkE2GdyhGRHtWJLG2m7NIcma3LJigSO6GKoEPKLu
	x1Vl1waMvdklJQBWWa0SVAETjVJKr73sQGbEFAsFJ0pz3AFVrkZOkgR0v8ZuF8+/QSIfDQHNtNE
	gYU8NjQFJ5VzI8eq810B2MhMnWsB39Xgw7yw9jtkAAqmXdOldNSFD9wSMFnUNeFDhGEPdbUutQ9
	0dQcRL9x2MlN7MQ==
X-Received: by 2002:a05:6000:40cd:b0:42f:f627:3aa3 with SMTP id
 ffacd0b85a97d-4361805edb7mr3933035f8f.56.1770200654099; Wed, 04 Feb 2026
 02:24:14 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260203231823.208661-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <20260203231823.208661-6-prabhakar.mahadev-lad.rj@bp.renesas.com> <TY3PR01MB1134655D9D775609DDD421DA48698A@TY3PR01MB11346.jpnprd01.prod.outlook.com>
In-Reply-To: <TY3PR01MB1134655D9D775609DDD421DA48698A@TY3PR01MB11346.jpnprd01.prod.outlook.com>
From: "Lad, Prabhakar" <prabhakar.csengg@gmail.com>
Date: Wed, 4 Feb 2026 10:23:47 +0000
X-Gm-Features: AZwV_QgYKos7mNAJOPPYGIajBSVDRuJb3J_1GtjjaOo9aW_we1f01IvyXM6tFuI
Message-ID: <CA+V-a8tCb4puraPLZKxoro-FemWshDdZa_vagoKguvMLcj9NCg@mail.gmail.com>
Subject: Re: [PATCH v2 5/6] irqchip/renesas-rzv2h: Add CA55 software interrupt support
To: Biju Das <biju.das.jz@bp.renesas.com>
Cc: Thomas Gleixner <tglx@kernel.org>, Philipp Zabel <p.zabel@pengutronix.de>, 
	Geert Uytterhoeven <geert+renesas@glider.be>, "magnus.damm" <magnus.damm@gmail.com>, 
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, 
	"linux-renesas-soc@vger.kernel.org" <linux-renesas-soc@vger.kernel.org>, 
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>, 
	Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=2];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20230601];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-27871-lists,linux-renesas-soc=lfdr.de];
	RCVD_COUNT_THREE(0.00)[4];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	FREEMAIL_CC(0.00)[kernel.org,pengutronix.de,glider.be,gmail.com,vger.kernel.org,renesas.com,bp.renesas.com];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[prabhakarcsengg@gmail.com,linux-renesas-soc@vger.kernel.org];
	DKIM_TRACE(0.00)[gmail.com:+];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	TAGGED_RCPT(0.00)[linux-renesas-soc,renesas];
	RCPT_COUNT_SEVEN(0.00)[9];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[mail.gmail.com:mid,sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 2AA99E4725
X-Rspamd-Action: no action

Hi Biju,

On Wed, Feb 4, 2026 at 7:08=E2=80=AFAM Biju Das <biju.das.jz@bp.renesas.com=
> wrote:
>
>
> Hi Prabhakar,
>
> > -----Original Message-----
> > From: Prabhakar <prabhakar.csengg@gmail.com>
> > Sent: 03 February 2026 23:18
> > Subject: [PATCH v2 5/6] irqchip/renesas-rzv2h: Add CA55 software interr=
upt support
> >
> > From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> >
> > The Renesas RZ/V2H ICU provides a software interrupt register (ICU_SWIN=
T) that allows software to
> > explicitly assert interrupts toward individual
> > CA55 cores. Writing BIT(n) to ICU_SWINT triggers the corresponding inte=
rrupt.
> >
> > Extend the RZ/V2H ICU IRQ domain to include CA55 software interrupts as=
 part of the hierarchical IRQ
> > numbering, backed by the ICU_SWINT register.
> >
> > SW interrupts can now be triggered when GENERIC_IRQ_INJECTION is enable=
d.
> >
> > Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> > ---
> > v1->v2:
> > - Made CA55 SW interrupt as part of ICU IRQ domain.
> > - Implemented rzv2h_icu_irq_set_irqchip_state() to trigger SWINT.
> > - Updated commit message accordingly.
> > ---
> >  drivers/irqchip/irq-renesas-rzv2h.c | 89 ++++++++++++++++++++++++++++-
> >  1 file changed, 86 insertions(+), 3 deletions(-)
> >
> > diff --git a/drivers/irqchip/irq-renesas-rzv2h.c b/drivers/irqchip/irq-=
renesas-rzv2h.c
> > index 6c7bbb04c6e4..a2ff7524889c 100644
> > --- a/drivers/irqchip/irq-renesas-rzv2h.c
> > +++ b/drivers/irqchip/irq-renesas-rzv2h.c
> > @@ -12,6 +12,7 @@
> >  #include <linux/bitfield.h>
> >  #include <linux/cleanup.h>
> >  #include <linux/err.h>
> > +#include <linux/interrupt.h>
> >  #include <linux/io.h>
> >  #include <linux/irqchip.h>
> >  #include <linux/irqchip/irq-renesas-rzv2h.h>
> > @@ -29,7 +30,10 @@
> >  #define ICU_TINT_START                               (ICU_IRQ_LAST + 1=
)
> >  #define ICU_TINT_COUNT                               32
> >  #define ICU_TINT_LAST                                (ICU_TINT_START +=
 ICU_TINT_COUNT - 1)
> > -#define ICU_NUM_IRQ                          (ICU_TINT_LAST + 1)
> > +#define ICU_CA55_INT_START                      (ICU_TINT_LAST + 1)
>
> Maybe define this after defining GPT IRQ macros[1] for continuity, when
> CONFIG_GENERIC_IRQ_INJECTION is disabled ??
>
This cannot be done, as these macros need to match the DT binding [0].
They index the interrupt names defined in the DT, so their placement
must remain aligned with the binding.

[0] https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git/tre=
e/Documentation/devicetree/bindings/interrupt-controller/renesas,rzv2h-icu.=
yaml?h=3Dnext-20260203#n105

Cheers,
Prabhakar

