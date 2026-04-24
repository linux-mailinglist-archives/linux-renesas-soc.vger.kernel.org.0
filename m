Return-Path: <linux-renesas-soc+bounces-31617-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id sA0/CHYo62muJAAAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-31617-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 24 Apr 2026 10:23:18 +0200
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 91F5345B632
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 24 Apr 2026 10:23:17 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 42F453012BC0
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 24 Apr 2026 08:22:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2693F21CC5A;
	Fri, 24 Apr 2026 08:22:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="QqQ8tzoa"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-wr1-f45.google.com (mail-wr1-f45.google.com [209.85.221.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 859393290A5
	for <linux-renesas-soc@vger.kernel.org>; Fri, 24 Apr 2026 08:22:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.221.45
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777018963; cv=pass; b=Y+S5B9NZ5jm0cTC4mefG+Ar+0BBy7yqrYMhTJ2RZBf4xcYj3U7ZXjLxjvuATlqmb8t1VyV0chBI1CsPaWCLSI5JAh7j+UmRVaBFs/qGO4ZfJztgdtAn7uJ9vZur97hRVK8Q7LpeU0SviqfFv4e0EYdUlecz97J15gLgZCVH9LTk=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777018963; c=relaxed/simple;
	bh=U15MUQNp/Vg5gRXQmcgEvyxU9xGyfihO8rMHHQH04SU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=IXQV6qzBYe57DxnGSBlYSD3db/8hVRYeYNxIiFdMiZgmsfmpgBB45aTuo3ag8+Ys/7n4JOpFxdnIl7QwYMQAK/C4OpW3jZ2L+ebjORWFA3STtHAE6GqAqUmsVQAAOCwajGsnszSHhgxwSvD/ptIG+8SHuPKomyOsJvcw8W73lFs=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=QqQ8tzoa; arc=pass smtp.client-ip=209.85.221.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wr1-f45.google.com with SMTP id ffacd0b85a97d-43cfd1f9fd1so4630976f8f.3
        for <linux-renesas-soc@vger.kernel.org>; Fri, 24 Apr 2026 01:22:41 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1777018960; cv=none;
        d=google.com; s=arc-20240605;
        b=HCj1ZHYU2xa+S20OiaPs98PuJhrqY2SlR2BnB42EcQYQAeSsYQtUVDEKtcnniqIWjr
         5IfFxwKqj12bC7izjOTFI1QwXzJph9hyCiZh6fG/Tzr/H0yczZRqOY8vcldjrzKey5bl
         ZF5WFK6pnMqdZOs/+ARF89toe9WfRihkuf35NpCBKf5DTwpLo+ESbjw7gsFdHlWJ+RDs
         vKe/HleWHCmlSxqTyJXWiMeDrYGcysH9BOnphd+llkkWm8aZ3XtPCsGQ2IxGILAkRE6u
         9uHbs90bCduc/g540bt8wFrtUrIer6zJGgKihkN/b3ykwu8BvmDPk8vho2nRYthZgFUU
         lqLA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=ocfPqMySXfGq9CYZZR5wpH3s/fCoW5ug2WTENUP6b+c=;
        fh=rH+gwuD734x1aN+qtxgG66RWOBQQBECbwnDCiEgYC3M=;
        b=Fi5Uty+pTUIRIGRG97T1PG5npjbjqq03chi0DhqXDPWPCRZveUz2LE2AbJFbkIRVBu
         JqJhQ6pSk3pBsMe2XjAT9auJFWV2Pexd7lK1jN/6aM9cvjnT4tZ1GqQZBy+umbZEoyvO
         pgRew/SdfrLaG95S69q2FJ8hG8ij+lB3QxTjw4xc5cm9fhHmfgLn+8dr8CJa9cQ2UoIV
         WjD8G6Ufsrl0aCaUeFh6pDznsQ0Q/FGJzGwHJ1sZBWtBKsOcNcqIk13S83wTAZynUm9H
         7XpAksbz1br4m3kXaby7vtl37HRt0Puq7GW5QevDXu+0z5lAsQ0PBLmMEVtX2BuruT+T
         Ymrg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1777018960; x=1777623760; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ocfPqMySXfGq9CYZZR5wpH3s/fCoW5ug2WTENUP6b+c=;
        b=QqQ8tzoas9Dt9+AgNDTF8Kck8ag3HZ5xHmH1tEOrR91AtAve4hopdo1N7E8kIfk6/+
         ACPvzcDghGz61hQ0erc8R/8NpBDNzzTC/YbLD2EIWtSabnHJFk8POmb+A5QhZFziHUkq
         iEQWc6Fs0cL27BO1SY91O5DD0OiVOv2myrVcUCkI7EoXUb2zuAnfI+Muy+9hvJlFuOsp
         Nlk7ndpDLFT+srz5KHDgDaQRNyCS0P/I7KhKDZd0yIK1e2CzXegjDuEXX70KAZs3WhZG
         gL0/WAfknufrHhVqOgoLNbK0K/PWEDM7cNwwzwTWsxqY0CXoK+Z1AmFuAln+6glBg8ya
         7n9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777018960; x=1777623760;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=ocfPqMySXfGq9CYZZR5wpH3s/fCoW5ug2WTENUP6b+c=;
        b=TfAuRLmXyrZIfA/AFYeBKxsV7uZkRfdp2WIyy2/7uTuncxXp+wyHE1skzYO8v2hVjE
         q1yV1ZJCV2/jzm38sYaSJY2mJJRrJtpmtn4yYj20l1BwgQ91UrIm1/PoPfbNRMVNJt5A
         o1kIwvsIDvNPzl44FmLaF5YJB8lOII7mRZjG/GwK99ae4ERwWNxQA0xL+jsxm1XUe7yM
         Aykf7Tfr13IN744DKAkbqysMh93jbG32QjThMgNzQPiZbLG3I3FdwiC6DRH+xzzoWybw
         z3q14Gxk/+HtupAYexaoy4oswXCnluaNPbHiiVmV9QMFqB4hYkTDW5RlSimjiIUioyc3
         oFow==
X-Forwarded-Encrypted: i=1; AFNElJ97X+GmOuopzwt8czWUq4S7L7IHO+96J99RbFovf8P2lykMtCut8unEI4COv5ghc3bLiJG0xs3rD1+iMsvYAKA7HA==@vger.kernel.org
X-Gm-Message-State: AOJu0YwTl76j70lsYiEoH1nIyIzQUZBI4PH7NiI4cRdDxLc57ut1jYxz
	Bn3I9hUsQtIat0eKXcoY+T6Kbt4HhKhZZrQOrZG/qeOEId/C1AqMRloElTMnv+qK3XdghXHu3dP
	mKK5PmjS8Ypl5rxDXABsPnCLXYdg9MXs=
X-Gm-Gg: AeBDietJxhAJbS7rvdd8BpsFb7/DTkT+18fjziWs53AiUkCAhX/nYlEbsIkftNp1zUY
	g+oOikfGLwNMNtUVp2spe8g9nzgupqY87Ktub+6UEAchwpKh3To1T2Vy6gUE8qfMlka2hlINecx
	gn6lO9BIVuoSqkkxCiHHGgtrH3KFjSh12+6sKBpS8+eYt2MVcDGwiy2cUg8pCIWw45h+GBQvzGM
	oXnAJ/NemB6Ua3wFCpvLOqzBeOSHMKaV4Ip38KxVmrDIH+6VeBvWXPeiL/blJm3FkfIDQXVY0zt
	gutlQcs3ZBQe8/CTjlbn2RRnzvNfR6OoJ4+AQjTezyKjiB9pWfUvk3Ltbj9qTKbkhX1aPkDrL1b
	ZU08=
X-Received: by 2002:a5d:588f:0:b0:43d:1c7a:8b5b with SMTP id
 ffacd0b85a97d-43fe3e11665mr46548982f8f.40.1777018959695; Fri, 24 Apr 2026
 01:22:39 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260413182456.811543-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <20260413182456.811543-4-prabhakar.mahadev-lad.rj@bp.renesas.com> <CAMuHMdWJCyurtvXfUFw8NA7RONgtf9XqqWvrcg0iWjPBCutSEA@mail.gmail.com>
In-Reply-To: <CAMuHMdWJCyurtvXfUFw8NA7RONgtf9XqqWvrcg0iWjPBCutSEA@mail.gmail.com>
From: "Lad, Prabhakar" <prabhakar.csengg@gmail.com>
Date: Fri, 24 Apr 2026 09:22:12 +0100
X-Gm-Features: AQROBzCe_y0xJkh_iknnWGLgTWBp15MEf8lCfi-JNcPd0UMlYdHSQ3OhKSAYFFg
Message-ID: <CA+V-a8vpkh_+Ka5mk-kewRXJc34oXFc5_4VgHUY=RU5YAFS8uw@mail.gmail.com>
Subject: Re: [PATCH v2 3/5] pinctrl: renesas: rzg2l: Handle RZ/V2H(P) IOLH
 configuration in PM cache
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: Linus Walleij <linusw@kernel.org>, linux-renesas-soc@vger.kernel.org, 
	linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Biju Das <biju.das.jz@bp.renesas.com>, 
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>, 
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Rspamd-Queue-Id: 91F5345B632
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=2];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FROM_HAS_DN(0.00)[];
	TAGGED_FROM(0.00)[bounces-31617-lists,linux-renesas-soc=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	DKIM_TRACE(0.00)[gmail.com:+];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	MISSING_XM_UA(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[prabhakarcsengg@gmail.com,linux-renesas-soc@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	TAGGED_RCPT(0.00)[linux-renesas-soc];
	RCPT_COUNT_SEVEN(0.00)[8];
	FREEMAIL_FROM(0.00)[gmail.com];
	DBL_BLOCKED_OPENRESOLVER(0.00)[mail.gmail.com:mid,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,renesas.com:email,linux-m68k.org:email]

Hi Geert,

Thank you for the review.

On Wed, Apr 22, 2026 at 1:04=E2=80=AFPM Geert Uytterhoeven <geert@linux-m68=
k.org> wrote:
>
> Hi Prabhakar,
>
> On Mon, 13 Apr 2026 at 20:25, Prabhakar <prabhakar.csengg@gmail.com> wrot=
e:
> > From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> >
> > Include PIN_CFG_IOLH_RZV2H in the IOLH capability checks when saving
> > and restoring pin configuration registers.
> >
> > On RZ/V2H(P), the IOLH configuration is defined by the
> > PIN_CFG_IOLH_RZV2H capability. The previous implementation did not
> > account for this, causing the IOLH registers to be skipped during PM
> > save/restore.
> >
> > Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
>
> Thanks for your patch!
>
> > --- a/drivers/pinctrl/renesas/pinctrl-rzg2l.c
> > +++ b/drivers/pinctrl/renesas/pinctrl-rzg2l.c
> > @@ -3033,7 +3033,8 @@ static void rzg2l_pinctrl_pm_setup_regs(struct rz=
g2l_pinctrl *pctrl, bool suspen
> >                 }
> >
> >                 caps =3D FIELD_GET(PIN_CFG_MASK, cfg);
> > -               has_iolh =3D !!(caps & (PIN_CFG_IOLH_A | PIN_CFG_IOLH_B=
 | PIN_CFG_IOLH_C));
> > +               has_iolh =3D !!(caps & (PIN_CFG_IOLH_A | PIN_CFG_IOLH_B=
 |
> > +                                     PIN_CFG_IOLH_C | PIN_CFG_IOLH_RZV=
2H));
>
> Unless I am missing something, PIN_CFG_IOLH_RZV2H is only ever set for
> dedicated pins on RZ/V2H and RZ/G3E, so this change does not have any
> impact for now?
>
Agreed I will drop the changes from rzg2l_pinctrl_pm_setup_regs() and
send a v3 for this patch only.

Cheers,
Prabhakar
> >                 has_ien =3D !!(caps & PIN_CFG_IEN);
> >                 has_pupd =3D !!(caps & PIN_CFG_PUPD);
> >                 has_smt =3D !!(caps & PIN_CFG_SMT);
> > @@ -3131,7 +3132,8 @@ static void rzg2l_pinctrl_pm_setup_dedicated_regs=
(struct rzg2l_pinctrl *pctrl, b
> >                 }
> >
> >                 /* And apply them in a single shot. */
> > -               has_iolh =3D !!(caps & (PIN_CFG_IOLH_A | PIN_CFG_IOLH_B=
 | PIN_CFG_IOLH_C));
> > +               has_iolh =3D !!(caps & (PIN_CFG_IOLH_A | PIN_CFG_IOLH_B=
 |
> > +                                     PIN_CFG_IOLH_C | PIN_CFG_IOLH_RZV=
2H));
> >                 has_ien =3D !!(caps & PIN_CFG_IEN);
> >                 has_sr =3D !!(caps & PIN_CFG_SR);
> >                 pincnt =3D hweight8(FIELD_GET(RZG2L_SINGLE_PIN_BITS_MAS=
K, cfg));
>
> This part LGTM.
>
> Gr{oetje,eeting}s,
>
>                         Geert
>
> --
> Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m6=
8k.org
>
> In personal conversations with technical people, I call myself a hacker. =
But
> when I'm talking to journalists I just say "programmer" or something like=
 that.
>                                 -- Linus Torvalds

