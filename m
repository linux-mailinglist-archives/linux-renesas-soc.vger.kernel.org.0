Return-Path: <linux-renesas-soc+bounces-30173-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id WDQPI3qcwmm3fQQAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-30173-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 24 Mar 2026 15:15:22 +0100
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 4E2DC30A017
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 24 Mar 2026 15:15:22 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id B2D793036B1F
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 24 Mar 2026 14:15:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 597C13845B4;
	Tue, 24 Mar 2026 14:15:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="LpvSttzc"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-wr1-f49.google.com (mail-wr1-f49.google.com [209.85.221.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CF02E3FEB2C
	for <linux-renesas-soc@vger.kernel.org>; Tue, 24 Mar 2026 14:15:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.221.49
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774361710; cv=pass; b=lKYc3tdKziM97tRKu4b/NivNP4xGfGvT0OIMUx/XOPi7kedgpXZrPrhn0zHXypVfAcAQo/gBLaimP8m+OOXkBpycLPSNWAYMdEwC6As5rfm4N9vqLVftwdFNLZQbqn5TMYQoP39m020rX8lGTFluvmcdcJIPwzDbvnIvpLer+7Y=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774361710; c=relaxed/simple;
	bh=uBwDMfTBCb+LjtnAZMtmCvVkOtKPcFmjMhI4Bp4J4/I=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=sbaRIvlXDcMTXd0dislizBVsWqfATgdzbehS+UtXrW43hPCWMSVl7h3zSsRJadjVkXr8DU+2FkkENhjhCseUv49AGnLrtc7dPpcmVGWGbmRjdAvYSOFHBKXBENjNDNfpQ0OMIXBCCiG+PnmmbHLHW13OpcQf0pclACmpYGtT4V8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=LpvSttzc; arc=pass smtp.client-ip=209.85.221.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wr1-f49.google.com with SMTP id ffacd0b85a97d-43b467dcf0bso3864028f8f.0
        for <linux-renesas-soc@vger.kernel.org>; Tue, 24 Mar 2026 07:15:08 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1774361707; cv=none;
        d=google.com; s=arc-20240605;
        b=P9fSA4kbcrXAA+Dsz+BfUM9W0JSpw5KYbRbND+w+Emm4XJEWQi/lrPP7lTn/V68sPp
         8lSESrH/kzpaP8n3q5pOH5R9x3GLbYZZJoSOXA5suyFUeZ2JeOzjwAZ+Ca5VjuQMWlXB
         ctt9cq1X55Yx/LSSCcwqO9EUtqWSlf0mvthsHk9W0rnlidBydXeXAYiPA5wkdcUY4HDy
         igrCLAyoF/b7qV1gIWtzsl1az2vROrV9Z4BENgQgP0vurekEcnOAfsEGl9M2jochIzSI
         9URXMWZgFE3J3ffOO3+g8aVXROCr9DJIG1qkVXT2zhpAtqivniR1jQaEEttCFTNWst0d
         6KWQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=B2D0D4+AOw6I2d5eSn36/Uu9mBQlJgp6d//ZsHPIQmw=;
        fh=r+vQ1HzevUthZi0oz61i88Kxt9oM7rQrzi73GlRLzvA=;
        b=K4yPnz05Qrzm0Ku1sERUufAx35MNeDLkLiXIGjQgoTRXGThd1Yry3L5rtCfzP7rsZs
         KIOYXiKEFY5KmEpJfeN9bOFEgeRgPJVD5hXeJQ/3G4rRK8S8A5vHE9Io3pkE/I0UYgUo
         0BhjvmKmDkZoWZXOK/IvPGKsj0swzb3W1wH3UWdc/MhJULeCIn9zmM+HFELoQV3Dflhh
         uABr+1JeWsM25Mx0LOWsdchAHwk1Un8Mq0yDeQsEqLcdOGwiwUBh/VylNErCy4b9xgrc
         SwPchuolrUVHqQK01k+d5ohmC+ZPLF315nFmoedvvVa/szEZSTUmNkb8EFkzE7vjpNin
         VxNA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1774361707; x=1774966507; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=B2D0D4+AOw6I2d5eSn36/Uu9mBQlJgp6d//ZsHPIQmw=;
        b=LpvSttzcM/iFl8IzJ/tWS++8qhMZX8UrnmTiyGV3zcuwypUg8Rpgxlj5vUJuSGzhCh
         7lfASLntNXukAJ6PJ/xr2o7dNe8rTgVMIVl9U8SqgTj5EKsQ9Ray0iePdtARrluYYMfG
         7/lKmbkAlQeXYNU3p0q+pq1xi3aIFy3Xddhp+c8TZ6nR/Yqc6cmtp0vqIknuHb9dQS01
         CONuCrvMNbLNNZAhIEIh3yCSpE/HwkvFreoxtGZ/aQXFhVvXGZzhLDPwoHY8EOKiSZ59
         IIE/FFs3iIoQlquSDIIV7tbKz4/4Y989SVoNlT9oiwl5nfFCs+0lVDY+8X7RPp4ZsJdy
         DjsA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774361707; x=1774966507;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=B2D0D4+AOw6I2d5eSn36/Uu9mBQlJgp6d//ZsHPIQmw=;
        b=pt/NoqJsy/SBtRkM0CKyq5PZaLTSkKYR6ymYiC9GWYG5rRuVHeNdLvUPB7SjjEt1Km
         4YImpTKCJplRBX4N4B/hLRDHWt4zwxmsHriWJljVwPAwZLijacYmtVq9hjfpBLlm3cWB
         miNwSRNsHe7H5tIL1j172vV7ZDmLarhCpUkHguYEbH0bGGkeeMCkOYfS94kYkbN75Az7
         q1HVCV4gPw/AOYqe9qi1Z/We4GlnI74oBZvecwM1/1Q/d56XngxnrHIbF/ZtVNFkUjB3
         YCdN5etivtn7i+KURkv15w5i/F85GYAI0Cz/vH+1hRXBfbCvS4gV9lsQz2PuhMA6ImLp
         kiEw==
X-Forwarded-Encrypted: i=1; AJvYcCWpcP0Uvl3iyeSEVTEaWyGNy1Qhe420ucVoMY11t/ZyWA4spDUutoEEaM6Ex6HQB+/zl+eXD12Z8voVzpzDm7ipvg==@vger.kernel.org
X-Gm-Message-State: AOJu0YxXJZ/RSSTQXCSNhhLVtHFsGBA6wZ/LxKj1SKs0E4IAW2s2IXEU
	OQ8ejY5W61QKs9Ndla5oaj5AfS+PsfIv8UHKkMm6B6RYkvZVJxsr4Wxi+5ncgK/OLSM8sETjMVE
	eJvCZEPjMAh3pHVqVw+9zRkZqbfqK8Yg=
X-Gm-Gg: ATEYQzwMBvh4+NmaOwHC3WlRpcxOoYLCwM+dPLsHZ16Uju1IoBSuiXwjFKyiapFCSyH
	u/Gj1R88hXxZCcPBOIFB5CQR0c9v3vM2CugkL6EJzBu/kWt7VLh5xYE7y7ITw9fAF0KSajRDbXB
	x2XgnW9WNzSaf0eYp+3F9jzmW1rzqMi5atCSGPcuuby7uxjUj7x4cpMxisjUn6A9hyffnmFE9aH
	E7C8ORuPKSj/5H+IRs99iuTKke5REVN0U00xeGhH5u+9N8THIhk87Q6TV8o9819eH9+uGw1QZbH
	hgaT2O3aeqqNdPlLm5eO91ClVRDQXgqVDmW7Za8csBgR76zaOwMw3NHikB4n0GPtgJK3Nw==
X-Received: by 2002:a5d:5c8a:0:b0:43b:7481:f899 with SMTP id
 ffacd0b85a97d-43b8052efcbmr6038979f8f.7.1774361705907; Tue, 24 Mar 2026
 07:15:05 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260324121608.3444943-1-prabhakar.mahadev-lad.rj@bp.renesas.com> <CAMuHMdV_94xOmqRqDKW_e740ckmRoyW+oaHvorphNg27JNKUrw@mail.gmail.com>
In-Reply-To: <CAMuHMdV_94xOmqRqDKW_e740ckmRoyW+oaHvorphNg27JNKUrw@mail.gmail.com>
From: "Lad, Prabhakar" <prabhakar.csengg@gmail.com>
Date: Tue, 24 Mar 2026 14:14:39 +0000
X-Gm-Features: AQROBzBUPNwZp5gKyz8Dv35PHiHje_gQgwLV9LKjrD1-LD60-apIs2rcFkO59Dg
Message-ID: <CA+V-a8t+eH-40xRZOS1zvme3Nubj5b12M0qkTAiFVrswZX_omA@mail.gmail.com>
Subject: Re: [PATCH] phy: renesas: rcar-gen3-usb2: Simplify ID/VBUS detection logic
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>, Vinod Koul <vkoul@kernel.org>, 
	Neil Armstrong <neil.armstrong@linaro.org>, Magnus Damm <magnus.damm@gmail.com>, 
	Pavel Machek <pavel@nabladev.com>, linux-renesas-soc@vger.kernel.org, 
	linux-phy@lists.infradead.org, linux-kernel@vger.kernel.org, 
	Biju Das <biju.das.jz@bp.renesas.com>, 
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>, 
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=2];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-30173-lists,linux-renesas-soc=lfdr.de];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_CC(0.00)[renesas.com,kernel.org,linaro.org,gmail.com,nabladev.com,vger.kernel.org,lists.infradead.org,bp.renesas.com];
	RCPT_COUNT_TWELVE(0.00)[12];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[prabhakarcsengg@gmail.com,linux-renesas-soc@vger.kernel.org];
	DKIM_TRACE(0.00)[gmail.com:+];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	TAGGED_RCPT(0.00)[linux-renesas-soc];
	MISSING_XM_UA(0.00)[];
	TO_DN_SOME(0.00)[]
X-Rspamd-Queue-Id: 4E2DC30A017
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Hi Geert,

Thank you for the review.

On Tue, Mar 24, 2026 at 1:05=E2=80=AFPM Geert Uytterhoeven <geert@linux-m68=
k.org> wrote:
>
> Hi Prabhakar,
>
> On Tue, 24 Mar 2026 at 13:16, Prabhakar <prabhakar.csengg@gmail.com> wrot=
e:
> > From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> >
> > Read the USB2_ADPCTRL register once in rcar_gen3_check_id() and reuse
> > the value instead of performing multiple MMIO reads.
> >
> > Simplify the return logic by comparing the IDDIG and VBUSVALID bits
> > directly. This preserves the existing behaviour while improving code
> > clarity and avoiding redundant register accesses.
> >
> > Reported-by: Pavel Machek <pavel@nabladev.com>
> > Closes: https://lore.kernel.org/all/acJV-Xq-2uq_JFMn@duo.ucw.cz/
> > Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
>
> Thanks for your patch!
>
> > --- a/drivers/phy/renesas/phy-rcar-gen3-usb2.c
> > +++ b/drivers/phy/renesas/phy-rcar-gen3-usb2.c
> > @@ -314,13 +314,14 @@ static void rcar_gen3_init_from_a_peri_to_a_host(=
struct rcar_gen3_chan *ch)
> >  static bool rcar_gen3_check_id(struct rcar_gen3_chan *ch)
> >  {
> >         if (ch->phy_data->vblvl_ctrl) {
> > +               u32 val =3D readl(ch->base + USB2_ADPCTRL);
> >                 bool vbus_valid;
> >                 bool device;
> >
> > -               device =3D !!(readl(ch->base + USB2_ADPCTRL) & USB2_ADP=
CTRL_IDDIG);
> > -               vbus_valid =3D !!(readl(ch->base + USB2_ADPCTRL) & USB2=
_ADPCTRL_VBUSVALID);
> > +               device =3D !!(val & USB2_ADPCTRL_IDDIG);
> > +               vbus_valid =3D !!(val & USB2_ADPCTRL_VBUSVALID);
>
> Perhaps combine variable declarations and assignments?
> The "!!" is not needed when assigning to a bool.
>
Agreed, I will address it and send a v2.

Cheers,
Prabhakar

