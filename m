Return-Path: <linux-renesas-soc+bounces-28427-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id EON7CbGqnWmgQwQAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-28427-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 24 Feb 2026 14:42:09 +0100
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id B6600187E52
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 24 Feb 2026 14:42:08 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 1DD6930058FB
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 24 Feb 2026 13:42:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3D2B839E186;
	Tue, 24 Feb 2026 13:41:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="nan6Fd9+"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D034D39E16A
	for <linux-renesas-soc@vger.kernel.org>; Tue, 24 Feb 2026 13:41:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.128.47
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771940518; cv=pass; b=TzHqD9VVmOWt9B2y59HQ6Xn6WmzOi+i4mT7Ry/YSgpTkgctWS/epnovhErXN7UJJo9KtO0gL7tPs+3iZrgjdV/9nHBrqQaNHhS9dgnA1bcCAsfn3++aaVa/ho516s7iizSI0CICOGHa2GsB5+XLUxNl7jWon7P1NIJx9tyKRgzk=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771940518; c=relaxed/simple;
	bh=mS9DrL2stmMKn/9Wjt0j3gd1vrdPtN5RQQyXm7lREBs=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Os2BKFdrOF7W2gXaulcFpXYTr3lDp7HrLt1cf+7la1cTUpUIU5Va8I8a3zR1OitpyUuhzCBuXxvpb3AW2xGWL7ZsPtwbnxZHrScnxFka+UAbam5+LTh2ceHKY0n4P6S0Gf253DhJCB2eSnyb4acqXC9k5GL0aUcLXgrtNiVe8WQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=nan6Fd9+; arc=pass smtp.client-ip=209.85.128.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-48373a4bca3so33680995e9.0
        for <linux-renesas-soc@vger.kernel.org>; Tue, 24 Feb 2026 05:41:56 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1771940515; cv=none;
        d=google.com; s=arc-20240605;
        b=MhnzF+hEO0Rb+oRRc7XG4JoFRLLVGSg1OVOG7VQg+3N7SqvEfx5AZBOefHIEZtoTjw
         NB3vcYZxAQHifeWa+t5l03fv1VCleG49t0zcx33UWCWAotCDRYESWsTfHdS01USAcMTd
         f67OaxVuLxL5NMcywNM+Dy26PL74fvtINvT93efXKI5w5uRPvRmhErrPwakpmOTdgLcX
         UFGNIgbql8tBgg3pF4tVmuKsc7DSwiM51NM8GdGGvFI26rLHGlh9Muw7T6N76ZQuCakF
         BaQbOmp4SNBe7oF6NAUhDkRGjfi3J4phYyjASOJ838sV2QAeD60YY4q8RAnNMmQ6nInv
         Hi8g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=kSu2/qsgPa+J02kwm9s9uKyxWBqpWPCxKoDB2yjuD1Y=;
        fh=LaH9YV7ndvZ92lYHCSGxzvhQi/wEYLV8jGGnSfxk+5M=;
        b=iI6246du/b6NXdx9DAKMXOdK+0kS8wbk9KQp/W+kycWY/gyKdjPBQDrWlQiQcVFskt
         k8yjzJBIz8D12IfZ54HVL6KGcNru3oL4abnPebT9PtS60iPjzrNlMlBzywrZBQRMgj9x
         ynUBVinHvc8Ex4Ww6HJrCwdWLOwfbd9mXwJONYHYW1sDP0fgH0r0AN7ihPT0bwxCruuL
         gRQ92crXEQvRZxGTLly8912g6SU5Aa55vYKBEV6JpcNybxgWq7YK99g3vPTwj4WU6SId
         18GNq3c+t86QEh7Hqh24anyNeetzkJrO1NmNQr2y01iA2ce07Tx6U4aAOcW4K9T6fOLR
         vthg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1771940515; x=1772545315; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=kSu2/qsgPa+J02kwm9s9uKyxWBqpWPCxKoDB2yjuD1Y=;
        b=nan6Fd9++ECmK+VcWK2KHocB6A2J+0TuFWOhvrnyYRpDng1Nyj9sZgwJUWuuwDDsQ+
         oYSGyIK5GCM13hmZ03zyclMQrHvEa2JATC1qQb/++qNDCAuH0D5zd2ZFfaF2uzdQXPUo
         /udA6AmhnL6AvxVqxYbI9QZDZq7BKQrO/xNNIhERfmYrWCp9xLSJS1ELRZt3bVEN89DC
         K8m71Hwmdt1BEmRSkjyt9uN9q6xaZEJERsYcNHTU5Pn+tnehezD0iSEnYFNHYdmHGr3x
         9L0JaSMEyPs6LnpPSYaE9k9iMNzp9++ROqkpd4rNUjiitOSFBiZHKKJrLxGdnEm0Mp7e
         NPIA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771940515; x=1772545315;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=kSu2/qsgPa+J02kwm9s9uKyxWBqpWPCxKoDB2yjuD1Y=;
        b=OQZDhVu5mc+h2tVeIULV12OEQtVG6g06EE0GnZ8AKKasB4bdbouboKG+qzQ9Nvf2Vz
         09euSlnRSqKzIMkaxu6KdWt+WmZG3X2A3+5SDczfqVvXKvLq6Vj1NAhspVGZofSzoQaM
         Z62U6FfL0sM9llayDSTb7EZh2d37Tpd0ZI0GE1/UXJMTnrMubEN1FH4EDTfr8zzPqydb
         h5QbCq1GFLmhgK4jpKCDfXrx/0FuncONlFVxm5M0iDjQ3qLveCEqklPsikO9vxnnE+Br
         6drgRcMKd/0nAszx2U9yWfPxNlBy7zy3enT5hE/D5W56SiVJFpFh9eRrVS68ru+y6Kkr
         XiJQ==
X-Forwarded-Encrypted: i=1; AJvYcCXs8tP6thQ2hoRxgLg4LusJqPvLqQHhEGzx5w1A5gP7bF2ttBBGF77dQ7pTCN5kKAoeulh7zAZj0XgeuCXDGGrqzw==@vger.kernel.org
X-Gm-Message-State: AOJu0Yy3cmyTNzS7QLNd9HzF/zZRYSsaGP9lQ1KVCcA5sLJLfLFbct1a
	wOU7Y8Xenzdar5UuGSnEcZf9rzkXpAA/jabIdpmk4SIr6Z3ePkhvDc6DhPzgGBGU0DpdUBAEbT9
	ABsy96LNVWAudQX4X/nj4k0WM2NFvlxY=
X-Gm-Gg: AZuq6aJ8u71mar2HRwCk60pVb31+sqIQvxgs75Qt9xQxYwABfBtFahx+VzK5NtuCNyQ
	c6DsjfC/VAmLlHuJbrz3mmA41xf62pb3zPd5ZeU4dEGtqKOVuMNNMaU2eGYEnotJPul+WQ0lERc
	9CcF6yKT014mpGp4iXVSW7L1v3swzpbqjBojz7OgO3CnacJrthM7TzIP1UjDDEz+5IBr37iOOmj
	Z08/Lweqxc+3f996qVxNgwO68Ij/1ZEeliKbnkqjGl8M10/4voVnGAwNvSo1GyGp2V08cPO2r0A
	Hsdoa0o4lY4BARvU3tE67oCnFTA60R/sUAPKV3x6h7pDlsWx9225xv5ONKkup9PzpGgxKhO8ABi
	IY7mvdFyvwhHiuKLokoGD0kqAoA==
X-Received: by 2002:a05:600c:608f:b0:477:7ae0:cd6e with SMTP id
 5b1f17b1804b1-483a95bd7e8mr198553905e9.5.1771940515017; Tue, 24 Feb 2026
 05:41:55 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260209104121.26172-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <20260209104121.26172-5-prabhakar.mahadev-lad.rj@bp.renesas.com> <87ecmavbs0.ffs@tglx>
In-Reply-To: <87ecmavbs0.ffs@tglx>
From: "Lad, Prabhakar" <prabhakar.csengg@gmail.com>
Date: Tue, 24 Feb 2026 13:41:28 +0000
X-Gm-Features: AaiRm538_5sV0YA_JgHvXySKpqWgyzKSvN1iu34q-E5miLmWW1hPTcZXZsToOBU
Message-ID: <CA+V-a8vOuGWjT6=1U8X9Qj34tVj7wbxhpOLYtMtfHDR_brJcEQ@mail.gmail.com>
Subject: Re: [PATCH v3 4/6] irqchip/renesas-rzv2h: Make IRQ type handling range-aware
To: Thomas Gleixner <tglx@kernel.org>
Cc: Philipp Zabel <p.zabel@pengutronix.de>, Geert Uytterhoeven <geert+renesas@glider.be>, 
	Magnus Damm <magnus.damm@gmail.com>, linux-kernel@vger.kernel.org, 
	linux-renesas-soc@vger.kernel.org, Biju Das <biju.das.jz@bp.renesas.com>, 
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>, 
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
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
	TAGGED_FROM(0.00)[bounces-28427-lists,linux-renesas-soc=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_CC(0.00)[pengutronix.de,glider.be,gmail.com,vger.kernel.org,bp.renesas.com,renesas.com];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-0.997];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[prabhakarcsengg@gmail.com,linux-renesas-soc@vger.kernel.org];
	DKIM_TRACE(0.00)[gmail.com:+];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	TAGGED_RCPT(0.00)[linux-renesas-soc,renesas];
	RCPT_COUNT_SEVEN(0.00)[9];
	FREEMAIL_FROM(0.00)[gmail.com];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[mail.gmail.com:mid,sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns,renesas.com:email]
X-Rspamd-Queue-Id: B6600187E52
X-Rspamd-Action: no action

Hi Thomas,

Thank you for the review.

On Tue, Feb 24, 2026 at 7:30=E2=80=AFAM Thomas Gleixner <tglx@kernel.org> w=
rote:
>
> On Mon, Feb 09 2026 at 10:41, Prabhakar wrote:
> > From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> >
> > Refine IRQ type handling to explicitly bound IRQ and TINT ranges and
> > dispatch based on the hardware IRQ number.
>
> Changelog should not start with an explanation of the what. See
>
> https://www.kernel.org/doc/html/latest/process/maintainer-tip.html#change=
log
>
> > This restructures the logic to clearly separate NMI, IRQ, and TINT
>
> Restructure the ...
>
Sure, I will update it.

>
> > @@ -175,18 +177,27 @@ static void rzv2h_icu_eoi(struct irq_data *d)
> >       u32 bit;
> >
> >       scoped_guard(raw_spinlock, &priv->lock) {
> > -             if (hw_irq >=3D ICU_TINT_START) {
> > -                     tintirq_nr =3D hw_irq - ICU_TINT_START;
> > -                     bit =3D BIT(tintirq_nr);
> > -                     if (!irqd_is_level_type(d))
> > -                             writel_relaxed(bit, priv->base + priv->in=
fo->t_offs + ICU_TSCLR);
> > -             } else if (hw_irq >=3D ICU_IRQ_START) {
> > +             switch (hw_irq) {
> > +             case 0:
> > +                     /* Clear NMI */
> > +                     writel_relaxed(ICU_NSCLR_NCLR, priv->base + ICU_N=
SCLR);
> > +                     break;
> > +             case ICU_IRQ_START ... ICU_IRQ_LAST:
> > +                     /* Clear IRQ */
> >                       tintirq_nr =3D hw_irq - ICU_IRQ_START;
> >                       bit =3D BIT(tintirq_nr);
> >                       if (!irqd_is_level_type(d))
> >                               writel_relaxed(bit, priv->base + ICU_ISCL=
R);
> > -             } else {
> > -                     writel_relaxed(ICU_NSCLR_NCLR, priv->base + ICU_N=
SCLR);
> > +                     break;
> > +             case ICU_TINT_START ... ICU_TINT_LAST:
> > +                     /* Clear TINT */
> > +                     tintirq_nr =3D hw_irq - ICU_TINT_START;
> > +                     bit =3D BIT(tintirq_nr);
> > +                     if (!irqd_is_level_type(d))
> > +                             writel_relaxed(bit, priv->base + priv->in=
fo->t_offs + ICU_TSCLR);
> > +                     break;
> > +             default:
> > +                     break;
> >               }
> >       }
>
> TBH, I personally do not care about the performance of your platform at
> all, but are you really serious about having a switch case like that in
> a hotpath function?
>
> Instead of sprinkling this switch case gunk all over the place you can
> simply have separate interrupt chips for each region and install the
> proper one at setup time. Then the functions are clearly separated and
> just handling the type they are written for and nothing else. No?
>
Agreed, I will split them up in separate irq chips, thank you for the
suggestion.

Cheers,
Prabhakar

