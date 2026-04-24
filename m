Return-Path: <linux-renesas-soc+bounces-31623-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id yB0AC+wz62lfJwAAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-31623-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 24 Apr 2026 11:12:12 +0200
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 27EF845BF59
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 24 Apr 2026 11:12:11 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id ADA17300B554
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 24 Apr 2026 09:11:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C5D3F367F54;
	Fri, 24 Apr 2026 09:11:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="idXwK1lD"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 12EA338422E
	for <linux-renesas-soc@vger.kernel.org>; Fri, 24 Apr 2026 09:11:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.128.43
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777021902; cv=pass; b=sXVMGDCTaeqh3dK1lAtsvugFxeQnD3VJAKWsHK3s4dyhviURHxA5UjTWUZf5Qc6uCSqBFrf0AFq4gfaIi+YsH9ErOf8ARvkiuo+MKePlomrgqUfnOf/KFe64DouEqutzYUn/rYc6qaJ8fYryaW3Ek/B2PM+E2VhqkYOSn4PXMNg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777021902; c=relaxed/simple;
	bh=bCVvojzYqQuDyWp0cOp3N2y7Tu20jPoOeLNc1/1U9KY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ZxqOoo1vNymQOr01n1iuaTNMr2Jb4sY1QCUS+d9cSqN3aBd6m3GS6xXqIXs93xmLhYvVx5cKP3q6TAkCr2J6Ww4aeRyn0nlQ9+m98CeN0QBLOKLYO6Dn62+XJzUlAZerWf6YD1dPMXHhV18bMDLUBP+v7W52rZaPQ8e3yQrcffY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=idXwK1lD; arc=pass smtp.client-ip=209.85.128.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-4891e86fabeso73542005e9.1
        for <linux-renesas-soc@vger.kernel.org>; Fri, 24 Apr 2026 02:11:40 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1777021899; cv=none;
        d=google.com; s=arc-20240605;
        b=e2syY3KGNbYyXvV5llKwI9V8CKIinpb9zNEH5/zrCdVNHLVC5A5yty4E1W04wA/Gwd
         9K0aai0r/MhXAKtEE8rU/lWKfvciFsQIwEBY0N/+cjXV9kqOs4Ih3tZrddh4+t7eNTMG
         /jBk9jajdqHkt/RK/CX6gXtuCqVKblklAjEEp3ye4AER9yEUye8bGhCCCoaCRg4G7aU6
         8vGWr/aSLqMTOD0qxu42MKYrzYwFCr1HT0sgdewjvlGDkl5Pdw1yb2CYl4uIbKnwR6px
         lLuCf5kiHLr83ytEqo7oems0hQwwLP6VbI+KiiJ+IDxdSURmzeXdNxzeCm+2/kJ33aGi
         S7hg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=miy2q2ejB68ifuUHv9cL8PbvBuD8kpHsI5eemIqLjlU=;
        fh=QtZinXLJC+T4axhwhgrLb5mSARGjQhmdTEs0Y06qB1Q=;
        b=Mn68RGoIquTh/e5/2iO5m/3xQE+uVdsxbWCCPEx3bagZWA6sDWIWOuUaHFx96kFFZo
         IXeAlyOsPo3OoMh2KJ/2dlU8VDT8wFM/CcjqC1SLSc/ZqsV4l8YpOgHO2NtkOJrASvXu
         eBVbZRuxVlaWYUHBSS9R5K6J/NQJ6o3lMVuTOXx/K6GuuiSzgsvgSOkUY3nQXw1BxaHr
         bvs+6WwZmDHnIoVDPbLAVN9KBn3E7U/JcH7ERglv1+UyJQgYGPj3TB8dLOur4iRENaON
         lsBPjBXMXorh6jGS0cd9IvD3dy3bDQbibusswqR6FIUr2caUsEWNDaatV2TkLouMcWwd
         kUbw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1777021899; x=1777626699; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=miy2q2ejB68ifuUHv9cL8PbvBuD8kpHsI5eemIqLjlU=;
        b=idXwK1lD12vNoVUylAds0/gXrRAjkyzpM2BoobCyIMkKNiBLwu9RENwbRvusdELl60
         X8RcOs0o/M1vgnMQpI14zGHqdCnUnE6Wdn2SyMAQm3g54IAacXJ+DNPEHEuXAvS19cwJ
         lPeBP3Oz/ADBa7AVDmuY07Sf9RFxM0zzl14JxBS0QoXyD2WG4zdAbB4wgBmb45lhFob3
         nYu3+pBYmMWx8ImQir8iwOOJnO+iNDKQMxmH7Ss1psNRZU0XgJGHwYkLZ2I8kJsfB8df
         qOWENIo0qIMA9ZFBmKU/7y2ZcWNTDi8sJZMkL9MGi3lKvL+1Qw4VFuQmjj0CNDo3/PpU
         N/QQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777021899; x=1777626699;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=miy2q2ejB68ifuUHv9cL8PbvBuD8kpHsI5eemIqLjlU=;
        b=h3tm8E+BCOYopDrcckyfsElzZeoYdwe0ZbFYLxJQxAMJVNUYupjSzjWmXQNl8h/W5K
         Qimq0am/SdqEJ5OzixjVKd97IkLVoahgntNX0Nf+FwWhj5Vh8RzOXuMQBDh2uzqsJieg
         SlMP9ZdIlxrtxStHHHCfz/haGQ2vUNNvArxb1Q2jLRsuw5VdHVgtVHIczeKHRGPv/qt1
         o1XWt/hT3OkoEfcIj/oshcvLJUUdh9DNQfY2E12wWpLop6F4p3CBYFve3v7nz8NCR4ew
         cvHYEv+a+VpZJo25BFpOQ067VNp7eUjly4bFAzGw1N0PYvxdxlHU70Y2uyMIJUrcu/pl
         zN+g==
X-Forwarded-Encrypted: i=1; AFNElJ+L8GDJa+aJdAk3ke+iJ/mfDQJoejJzltAb6PyoFRP5K+hCq+BhoTH7HYgutEZNrCZ28gRaE9a+L5nArcM1UiXsRg==@vger.kernel.org
X-Gm-Message-State: AOJu0YzyJ5HCky/MSnVZHctjAleTUz4IuNGz7NmdT4s27UO2WToEJIk+
	jiZh6RFIixHtEBveT/v1AtWsGB3TNZSb5OikinWiud+8Wpb1owTXA3ujY/egxMYfnf3rP9FTct1
	49s2Hav+X75MiZaypIMNXKzTUWTLH7J0=
X-Gm-Gg: AeBDiesRAoz4NGvTpakxSjY+Ct/1EJQbhtIQRqAb9cVxR/ph874QsC4qsCrn/iGhI+K
	XTg7PYdcm6O8ZZ9XPMYvjnSn6B9hwNMD3mwJwY2nIOidv9kO5w3Tegu1vZSHWuyYbHMeYeROZlh
	/q+k+/fzkvR9EZ94/gh+Afo/+M+O6oWEVE+hAx7aO1D9JDgBo2dSD0clUupcgz209bo3dW1Vm0Z
	v2hahfv1IpiLFX6T4G8500kXZDuhGIjArr4syky+60OJ0uKLiCKYLbh4h1HOEylvKTfR5O9BLCI
	AvXmUuL1dHci4mAS+MHe7s/1T+/Dlc878+CNjzXOq/rFTH8TaRVxpJapXe7T+Ii/Jld4bYZHsnR
	ol6o=
X-Received: by 2002:a05:600c:3596:b0:48a:563c:c8c5 with SMTP id
 5b1f17b1804b1-48a563cd1b2mr218141245e9.8.1777021899224; Fri, 24 Apr 2026
 02:11:39 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260413182456.811543-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <20260413182456.811543-4-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <CAMuHMdWJCyurtvXfUFw8NA7RONgtf9XqqWvrcg0iWjPBCutSEA@mail.gmail.com>
 <CA+V-a8vpkh_+Ka5mk-kewRXJc34oXFc5_4VgHUY=RU5YAFS8uw@mail.gmail.com> <CAMuHMdXtccbEZ0Bd=A0kvC5sg3YzMdKmVuiYrVpJMXpT2zqUYg@mail.gmail.com>
In-Reply-To: <CAMuHMdXtccbEZ0Bd=A0kvC5sg3YzMdKmVuiYrVpJMXpT2zqUYg@mail.gmail.com>
From: "Lad, Prabhakar" <prabhakar.csengg@gmail.com>
Date: Fri, 24 Apr 2026 10:11:12 +0100
X-Gm-Features: AQROBzDFyS3biKTrtU7_Eq2n7MWHBnnukWxEIubfoSLdXNDL5SPcwM233GIlJdk
Message-ID: <CA+V-a8u7GRTZBq2AdPa0Hmm7MCGsNTkcrjRn9F0BkFeHHOOKzw@mail.gmail.com>
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
X-Rspamd-Queue-Id: 27EF845BF59
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
	TAGGED_FROM(0.00)[bounces-31623-lists,linux-renesas-soc=lfdr.de];
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,mail.gmail.com:mid,renesas.com:email]

Hi Geert,

On Fri, Apr 24, 2026 at 9:27=E2=80=AFAM Geert Uytterhoeven <geert@linux-m68=
k.org> wrote:
>
> Hu Prabhakar,
>
> On Fri, 24 Apr 2026 at 10:22, Lad, Prabhakar <prabhakar.csengg@gmail.com>=
 wrote:
> > On Wed, Apr 22, 2026 at 1:04=E2=80=AFPM Geert Uytterhoeven <geert@linux=
-m68k.org> wrote:
> > > On Mon, 13 Apr 2026 at 20:25, Prabhakar <prabhakar.csengg@gmail.com> =
wrote:
> > > > From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> > > >
> > > > Include PIN_CFG_IOLH_RZV2H in the IOLH capability checks when savin=
g
> > > > and restoring pin configuration registers.
> > > >
> > > > On RZ/V2H(P), the IOLH configuration is defined by the
> > > > PIN_CFG_IOLH_RZV2H capability. The previous implementation did not
> > > > account for this, causing the IOLH registers to be skipped during P=
M
> > > > save/restore.
> > > >
> > > > Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.c=
om>
> > >
> > > Thanks for your patch!
> > >
> > > > --- a/drivers/pinctrl/renesas/pinctrl-rzg2l.c
> > > > +++ b/drivers/pinctrl/renesas/pinctrl-rzg2l.c
> > > > @@ -3033,7 +3033,8 @@ static void rzg2l_pinctrl_pm_setup_regs(struc=
t rzg2l_pinctrl *pctrl, bool suspen
> > > >                 }
> > > >
> > > >                 caps =3D FIELD_GET(PIN_CFG_MASK, cfg);
> > > > -               has_iolh =3D !!(caps & (PIN_CFG_IOLH_A | PIN_CFG_IO=
LH_B | PIN_CFG_IOLH_C));
> > > > +               has_iolh =3D !!(caps & (PIN_CFG_IOLH_A | PIN_CFG_IO=
LH_B |
> > > > +                                     PIN_CFG_IOLH_C | PIN_CFG_IOLH=
_RZV2H));
> > >
> > > Unless I am missing something, PIN_CFG_IOLH_RZV2H is only ever set fo=
r
> > > dedicated pins on RZ/V2H and RZ/G3E, so this change does not have any
> > > impact for now?
> > >
> > Agreed I will drop the changes from rzg2l_pinctrl_pm_setup_regs() and
> > send a v3 for this patch only.
>
> No need to resend, I will drop it while applying.
> Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
> i.e. will queue in renesas-pinctrl for v7.2 with this fixed.
>
Thank you for taking care of it.

Cheers,
Prabhakar

