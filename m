Return-Path: <linux-renesas-soc+bounces-28434-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id SJqPKbrFnWkRSAQAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-28434-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 24 Feb 2026 16:37:30 +0100
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id 489911891FF
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 24 Feb 2026 16:37:30 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 88F44303AC80
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 24 Feb 2026 15:37:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3FADA288535;
	Tue, 24 Feb 2026 15:37:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="KGiR7UUB"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-wr1-f45.google.com (mail-wr1-f45.google.com [209.85.221.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DC12827B353
	for <linux-renesas-soc@vger.kernel.org>; Tue, 24 Feb 2026 15:37:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.221.45
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771947448; cv=pass; b=NL8OM7SLDHn7tMQB9y0st4PdqsRuPrho+bSb7iXXxYZ0mr42hehwbcpcHjfENQpwM4kvJiIShwDembo28B2YIjwQNy6NWpWKeFTAMuHICA7XpLK5gAyxT+FNo8dHER3hR9mwPwhiUH6UgzuwzMU4TPBF2aC6UjcHYIzOwh9p0Kc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771947448; c=relaxed/simple;
	bh=qYjo0DiKv1b13O4Ma+wEhagLLrmulc+GzpMOHAc5Hog=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=rrhojFyeoV/BoKbmaGgsjEFdzqRLA5VXFuSnXdoM+UNXJJv2FN6H4PNR5X42w4bVC2OR8Czb7aZKSWF/V0NvwHHQRiVPVjd0pE0JVb2GL9gTGDZzxTfPq6k6Tpw6BV7hsmWtq9OCa3/0RbbC7jyjcNhEXcpqwlrM5joKq4hXA/4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=KGiR7UUB; arc=pass smtp.client-ip=209.85.221.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wr1-f45.google.com with SMTP id ffacd0b85a97d-43767807cf3so4250818f8f.1
        for <linux-renesas-soc@vger.kernel.org>; Tue, 24 Feb 2026 07:37:26 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1771947445; cv=none;
        d=google.com; s=arc-20240605;
        b=EIVzcXPMjHd+53jZ74LxgFXrBJFJCcFxGmpidwLFJR6i4OgI9F9RbLDdv/ZcmGDEFx
         qDZ8vKn+AbnRy5xvCS4jvnJ04VZfDvAlXhXwwMyNV/gkPBUTCBbld56ASEH4w0AqFJh8
         Nd5W2b0g4nP7i0QL4ZroJdw052QrqXQn9NYa1FgT0UW05ccZ9wBeULaDZTVr664ftBTv
         EkOgZ+Md6gArfzdv9Xu+iyrrE5E0retNXNW+Fl09VSx4niekUUUu4R3kebPyIeLwyvXJ
         xLLMXPIcxf2CKa8le+IUBCyFA5vKGX+e/VIKtHjh+bqkRmOpIpyzX3Pvm1dDJT03xV2J
         cu/Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=01tmSYpl5MaevmdqpJiG/+c3fnTc7/mPhbm0SdC8R2w=;
        fh=IHObi2e9HWE4JUpBly/u/evY69XM0rTyp/2qyQhtbco=;
        b=OufPGzUL8h1ahXlo31Txud8P2BE3R4BT/G6kAh6mb7I3oWxUYgGF77D7TSQgqqEgEo
         IXr9iiGU6iilQwyAZrrnz3aWk8oTzrHV3EQnAq3sGc2xjZ2nXKoPqodaP0+UlhFr6ukv
         CfDH7F73JUpnxFEAUaD42MpB3aswqTjDDSRWgSq3SJeeYD4j6sp4GeXfa3Lm2sxzrp6E
         sDO3is++9BX62xK6EzyrXBpr5IxdlZYZoShCazWl3mL/gFuA6XLLE4HeiYqc5N84ANTw
         AAPtIXOcUAj5HmO21HpJQtPzD6MtAZrVnRxgtyYyj47meq43MJHYG4MAyi4TQbjnx91n
         2OHQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1771947445; x=1772552245; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=01tmSYpl5MaevmdqpJiG/+c3fnTc7/mPhbm0SdC8R2w=;
        b=KGiR7UUBOEf+brl/SrFdj9woZx15c9aJT/sADeeH2v4xyAAXiTf61+R4PDZtAY4WLU
         1DWMIxCALZ1RPTJAV7UrikIwDCmzn+zqk7vNxRChKEyx0NUd+vd+ajcJ8uLXBLdm+qtH
         EpDsr3myRNMs3Rt/PHsQ/6av+7mIvq8VN0uaqdA4qaOWMLzjcANu9na00/hMXWEqabMc
         coqFK1gBP4Qm57yk8SQx25f8q+xo092ChXnB7RIHzq8bRuS0E1G44R4E4BvHqu1tweuH
         ZO2R/KNO/awZObFAtC0nzJes0eDuAh4hBHExqEer/OSRt37yQrOfnsw7AD/saVSU+020
         pjUw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771947445; x=1772552245;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=01tmSYpl5MaevmdqpJiG/+c3fnTc7/mPhbm0SdC8R2w=;
        b=AdfquhfPgGDrtlqoNu4SNN3nknJ37HbZ9pfvOUUeOB4J5gm56FFSAMGmQYiNIWMMpq
         23zLypGMpEsLZ0PLfxLADLvkdpPmkQJOekOsjdlZQxu5VDTv75Ev4w7Y9Ju1A/9RWtCq
         k6eS/rQ3ZbpO06T36lE/UrwgYo+1QbKQZD+TPO17nhwDM2yzc/TzSt+wp3LfByaXdlOz
         6WX9BtUHO9OkW8Wyg2BBg+cfYSrFf6VH8JZ4RF6EFoUjezeDwGRhCSxllHp2HCTb5X1C
         zuBMXngj9rRl+cH4dsBXMTsYp1Yw0SIYmIZC6fpIUP1jfu2DS76TAVkB4YLHITYhDPwQ
         fsHg==
X-Forwarded-Encrypted: i=1; AJvYcCXxeoM9pt+AePY1Yk1TgqMWPxCus2wz3x88wPmbpTOgCVP69En3Vj9dNoQPPXdpawtWj/kRRr5sVRNM/HfA1xzlgQ==@vger.kernel.org
X-Gm-Message-State: AOJu0Yx7LrkRiLuLXQnxPJyp600KGEDdozCquDMyXPWQzjKh7Pl12g3m
	wQ+UfglRGHUf98Ie4MSeyyvZFLYuB/Lwhs5zbqVqcCsjIQpnwqBriowARuqAAZFWhfNGIfkycsQ
	j2Hncb9o0j5T0c09WkMBLbX7aKG8nXlA=
X-Gm-Gg: ATEYQzwqLyLrEc3KbLf07j0gC3oFsy+abKfW+THivN08D1MqfpibJRgI/uVb8ZxhPZj
	4Q32YKlOM62RM1QJtty5EEVSG21DWSNOPSsTWosi7ud41fvwHn26zPpmkyaVUW+XZI+B5yddYy2
	iZzf0kTEPhR1iCcRLQyml2p0FrBMogP2JyUGfdIcZSWRTPP1Bb6B6uZj8cmzy/SN1gvRxjNnR0w
	MuifRXvB9qhEXegX6IsDqyfh0OIG8FViLnZ2DCJ3Iv1/cQa2TAXkBOBAAYP8led2V01Ds2FMrMA
	eyn1/JIzOYbzHGTcRtMNAR2n36KyeU7uJo/kjpDgxKfcNS8KSGhBgekP+WFGABpVGXLD6RdFjWA
	+X5/ezqHm1CEt7UTWmmOQZZP0Sg==
X-Received: by 2002:a05:6000:2312:b0:439:8bff:3638 with SMTP id
 ffacd0b85a97d-4398bff367fmr2067441f8f.30.1771947445063; Tue, 24 Feb 2026
 07:37:25 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260209104121.26172-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <20260209104121.26172-6-prabhakar.mahadev-lad.rj@bp.renesas.com> <87bjhevbly.ffs@tglx>
In-Reply-To: <87bjhevbly.ffs@tglx>
From: "Lad, Prabhakar" <prabhakar.csengg@gmail.com>
Date: Tue, 24 Feb 2026 15:36:58 +0000
X-Gm-Features: AaiRm52zTQ0YuU1rBNBcdj-UcKOM7U5K93Af3PwOWwvBqDae9YRe0wQz9hWFckw
Message-ID: <CA+V-a8uhJOWmWnyJfcrG8=y9eHmfrcZ7SGsnoQNDVOG5fyw2RQ@mail.gmail.com>
Subject: Re: [PATCH v3 5/6] irqchip/renesas-rzv2h: Add CA55 software interrupt support
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
	TAGGED_FROM(0.00)[bounces-28434-lists,linux-renesas-soc=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_CC(0.00)[pengutronix.de,glider.be,gmail.com,vger.kernel.org,bp.renesas.com,renesas.com];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-0.999];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[prabhakarcsengg@gmail.com,linux-renesas-soc@vger.kernel.org];
	DKIM_TRACE(0.00)[gmail.com:+];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	TAGGED_RCPT(0.00)[linux-renesas-soc,renesas];
	RCPT_COUNT_SEVEN(0.00)[9];
	FREEMAIL_FROM(0.00)[gmail.com];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns,mail.gmail.com:mid]
X-Rspamd-Queue-Id: 489911891FF
X-Rspamd-Action: no action

Hi Thomas,

Thank you for the review.

On Tue, Feb 24, 2026 at 7:34=E2=80=AFAM Thomas Gleixner <tglx@kernel.org> w=
rote:
>
> On Mon, Feb 09 2026 at 10:41, Prabhakar wrote:
> >  static int rzv2h_icu_set_type(struct irq_data *d, unsigned int type)
> >  {
> > +     unsigned int gic_type =3D IRQ_TYPE_LEVEL_HIGH;
> >       unsigned int hw_irq =3D irqd_to_hwirq(d);
> >       int ret;
> >
> > @@ -445,6 +475,11 @@ static int rzv2h_icu_set_type(struct irq_data *d, =
unsigned int type)
> >               /* TINT */
> >               ret =3D rzv2h_tint_set_type(d, type);
> >               break;
> > +     case ICU_CA55_INT_START ... ICU_CA55_INT_LAST:
> > +             /* CA55 Software Interrupts have EDGE_RISING type */
> > +             gic_type =3D IRQ_TYPE_EDGE_RISING;
>
> So this unconditionally selects EDGE_RISING independent of the type
> provided by the caller. Interesting choice and compatible with the rest
> of the code - _not_.
>
Ok, I will update it to use the type which has been passed.

> > +
> > +static int rzv2h_icu_setup_irqs(struct platform_device *pdev,
> > +                             struct irq_domain *irq_domain)
>
> I told you before that you have 100 characters. Get rid of these line bre=
aks.
>
Ok.

> > +{
> > +     bool irq_inject =3D IS_ENABLED(CONFIG_GENERIC_IRQ_INJECTION);
> > +     static const char * const rzv2h_swint_names[] =3D {
> > +             "int-ca55-0", "int-ca55-1",
> > +             "int-ca55-2", "int-ca55-3",
> > +     };
> > +     static const u8 swint_idx[] =3D { 0, 1, 2, 3 };
> > +     struct device *dev =3D &pdev->dev;
> > +     struct irq_fwspec fwspec;
> > +     unsigned int virq;
> > +     unsigned int i;
>
> Coalesce same types into a single line. See Documentation/....
>
Ok.

> > +     int ret;
> > +
> > +     for (i =3D 0; i < ICU_CA55_INT_COUNT && irq_inject; i++) {
> > +             fwspec.fwnode =3D irq_domain->fwnode;
> > +             fwspec.param_count =3D 2;
> > +             fwspec.param[0] =3D ICU_CA55_INT_START + i;
> > +             fwspec.param[1] =3D IRQ_TYPE_EDGE_RISING;
> > +
> > +             virq =3D irq_create_fwspec_mapping(&fwspec);
> > +             if (!virq)
> > +                     return dev_err_probe(dev, -EINVAL, "failed to cre=
ate IRQ mapping for %s\n",
> > +                                          rzv2h_swint_names[i]);
>
> This lacks curly brackets on the if(). See Documentation/.....
>
Ok.

Cheers,
Prabhakar

