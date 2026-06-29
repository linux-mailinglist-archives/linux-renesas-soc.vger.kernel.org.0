Return-Path: <linux-renesas-soc+bounces-34526-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id fMlqOFiLQmr49QkAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-34526-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 29 Jun 2026 17:12:24 +0200
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id D72F36DC7E7
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 29 Jun 2026 17:12:23 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=gmail.com header.s=20251104 header.b=CqXNDHUQ;
	spf=pass (mail.lfdr.de: domain of "linux-renesas-soc+bounces-34526-lists+linux-renesas-soc=lfdr.de@vger.kernel.org" designates 2600:3c15:e001:75::12fc:5321 as permitted sender) smtp.mailfrom="linux-renesas-soc+bounces-34526-lists+linux-renesas-soc=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=none) header.from=gmail.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=2")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 3323D311EE3F
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 29 Jun 2026 14:56:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A3F18423156;
	Mon, 29 Jun 2026 14:56:11 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-wr1-f49.google.com (mail-wr1-f49.google.com [209.85.221.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2E9754218A9
	for <linux-renesas-soc@vger.kernel.org>; Mon, 29 Jun 2026 14:56:09 +0000 (UTC)
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782744971; cv=pass; b=dBcZuIVJPEMwuyjQceyeABZOFhDTZuU9tYEvUD+QaZdvoPGdHNlPNCJQFl51nsEtj4WayPUxWyGJwU1mc8HwvFmhsimH+CXCUTv2zxkyx/OLkTlyo29uic/T/0Tucdb3oUG2pO37b9fUOHWuaEqa06C2WKc9uBhNlqwnSR3oTd0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782744971; c=relaxed/simple;
	bh=+/9wgcUIWX9IAAUfj8TCtTHYJM6EUs1rELw9Q2zMQWg=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ES+a5VNMpSJOEeyCGekbxedmxmPiToZ7Dx72G5lhf8G8mDG4N71hwPANCqyQWRvKaWkf4c5BF3ID7DkcfhaWCG8tI2NG00UiGBPiWONwq50w2bqhGVFGxPzmfQxDGmVI4OXslSk8gl0noDQGFo/feI5MBmW6/chcfWKSLu9y4HI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=CqXNDHUQ; arc=pass smtp.client-ip=209.85.221.49
Received: by mail-wr1-f49.google.com with SMTP id ffacd0b85a97d-4624a44e152so3141077f8f.2
        for <linux-renesas-soc@vger.kernel.org>; Mon, 29 Jun 2026 07:56:08 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1782744967; cv=none;
        d=google.com; s=arc-20260327;
        b=gqK57sK+eLvEG5uvzlFIvvFF5WoFa7N/MCQZmzTFuEiMNOUpYutiHYJ+3rT4rJviMq
         6rD73cmn3GE1rQGQ5p9ikL3t7RJOXFs8rd8Q1D/8vMylCkOy1WEJMLG0SH2Cg79RJXi0
         ecxwqGMdV3YakrGrZm+jUlO1K9OkU20omfzLtjQx4o6RffrIpQoYa5ugeZ7ovDdC0CYe
         PAEgarb3pKTZZBncz8SAGzWtLpe/E29tP3cQPO2IoBI0JcXYFnAV/kQcUKG2vj721s5x
         5WovsXbQ+Pd62fRaSmLPNYYSZpgSYQBU1AA0PJ52vRqJfNohVQRBVO/aR7g9NrBScAR6
         xARA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=cg0nj+nO7raxM91vFADNla65NdWnOShdokPbAPfZ4QA=;
        fh=iJZTijm6QPoLnU9RdcuJXV7vF+gh/2TIdsbqX4F1CP0=;
        b=bBLaqIlIQuYPEqeIco38Nv5Z+Ktf+Aw0CJFtfQri+bFgPqgshmnYzZpj2NNFfFZ8gh
         tZho8uhQkqwfQeABbkbRU/iDutYTFXe1EjgqCOUGChowY5+AxdBVO9/TSaCODy2zLBma
         h9kbX+BEwlVepHSyF8l5MqxmD3+npqJ06JWNMxKOaNrRrq/IAxaWc4wIeHV7nP0nno2R
         DZfPJrXEs13FRhJdwWZn4vN0qQwTUHTirynMwUGzT9ciaVzOUNPhWKG9nLDePb6IugbC
         1JQkhok++OVk2JjhToJHhHoSVXfFZSrVT6SL64CfXFBHOVMpyGXbil2prohDFtahqxon
         LP+Q==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1782744967; x=1783349767; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=cg0nj+nO7raxM91vFADNla65NdWnOShdokPbAPfZ4QA=;
        b=CqXNDHUQGycD8TWc5Y829JYP/JedyVL5xNDdeV+MYl3nzObEwx7uplne30eoNOH/M/
         9UNrr1NK9cWIpKRaRAVEQK84HXKMIztG6wWYs5EBZ5J8SlFRGmSUo1PPYE5iCr+QRose
         T26AURsUxEarpwb/xY1WP07OeYJrK8C2ZUknI9V50alafJ7dSv+rJwVxQLQCOmyFtpL5
         I15zxAa4g4d5DLDVDDSNqYFZPcBe8dIcLZL0fHf+7Judz7WJo5trAtsmeYXe3p1Oip5K
         y4Sgeia7FO2jBBhC6qZ2Ul7akMyWgJHWXYlU2saQF7YxsLx3cBaRwfxF4UTvhR4FfZsp
         WODg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782744967; x=1783349767;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=cg0nj+nO7raxM91vFADNla65NdWnOShdokPbAPfZ4QA=;
        b=cCWBb5pgqPsrDQUgtTXv9x+9AC5KOt3YTY3v2nJMSvT4QFUwuddXunuMj8xgqV4mL7
         ZPkhhXjm8StmQSybmfGqqjUlux3220MiftLChe106UGJyDlHow2b9yjVziac54KPuLQx
         LHY1/Uc3Xk49D5J4+ARA1rwR1yVFOsJx4z/4xO+hQKAoMD08wF6M9LPV5k4/AsWIyLl+
         HuWVSUwGFriucem5rnc8smvaFg9wC/uG4P6KlkYHPO6PUPb3WzYyE3M79BpjDDiA+k1E
         WSNuPJU+hMuP4i5E9y/2NAqX80s2HIrTnTpP54LLooBGaX2G/EC4Y+Vl2GHX+sxa+tLF
         cRUg==
X-Forwarded-Encrypted: i=1; AHgh+RrVHERKE1lEbxwAibfN5nxlEIp0ldGMs08KUBFgP4j+sp++hIw4yNbCd/IUALM1+Jdld/CdnGWkQxFuxWGDKF/o+A==@vger.kernel.org
X-Gm-Message-State: AOJu0YwKq3CrvPIdZ4q3fUja+PSHSVilIKt7pCPHqVuZNfVwixR4B/+2
	ysfarPAB1bjVGByQHqlRs7931LQk7AzpzVO29WE+QfUFJOugbDrUFzEJlyfbTyYCxgvog7hnMyI
	eknHWhCOZSYbcjvs/wUBTSf3qDvowvqY=
X-Gm-Gg: AfdE7cmgTL1qOm0dCV+deqYX+WZWkXqmLsF471yJURUjk2FE51fyhe8X2Kq/CEJOUdu
	ANzSNnYhBiLKjtOzBdq/lFmtiJMevTnyBGr+0qMpscFLe85FS9Y2p1SOKt64X+7tMGxOvEz7wON
	wz+nJHrSrwiinAwkhhjmb4hSy5aTBffYOyuLv0zFqyUGi8YBKhCmwb8owas4pOGqwEwKknVrXWt
	YhcSeBUwTYMDeIP+0VDG12+d56xYt4PrT4Arb36rp3Hy1R9qNywSfVJ5JlTCBo7rERM/d+k5bOT
	BhSuC6LkwJX7gLYyPqpKC9ueC5ti47tb4kAh+A65+GAK2j1m6SHb7HmNVyk8z9fx7LN7nQ4C76x
	BY08mXxJ6UFmZLv8=
X-Received: by 2002:a05:6000:4208:b0:441:1e41:194 with SMTP id
 ffacd0b85a97d-46dbfab53a2mr26248348f8f.17.1782744967392; Mon, 29 Jun 2026
 07:56:07 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260622170733.1703585-1-prabhakar.mahadev-lad.rj@bp.renesas.com> <CAMuHMdV-OWEd732BpM1XSJiu+7d+ABGYpxYUe8OUSkVV5X2Wdg@mail.gmail.com>
In-Reply-To: <CAMuHMdV-OWEd732BpM1XSJiu+7d+ABGYpxYUe8OUSkVV5X2Wdg@mail.gmail.com>
From: "Lad, Prabhakar" <prabhakar.csengg@gmail.com>
Date: Mon, 29 Jun 2026 15:55:40 +0100
X-Gm-Features: AVVi8Cflxc-TFENMnQmfkdpU70UG_4X31nRwUCCV4ZYKWZbAtMO-azM9MIk3nT4
Message-ID: <CA+V-a8t=PGgB5-o5=oHVXE63_nZj5nA-ZmacPSBA4dx-99qaRA@mail.gmail.com>
Subject: Re: [PATCH] arm64: dts: renesas: rzt2h-n2h-evk-common: Add memory nodes
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: Magnus Damm <magnus.damm@gmail.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	linux-renesas-soc@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Biju Das <biju.das.jz@bp.renesas.com>, 
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>, 
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=2];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	TO_DN_SOME(0.00)[];
	TAGGED_FROM(0.00)[bounces-34526-lists,linux-renesas-soc=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	FREEMAIL_CC(0.00)[gmail.com,kernel.org,vger.kernel.org,bp.renesas.com,renesas.com];
	FORGED_RECIPIENTS(0.00)[m:geert@linux-m68k.org,m:magnus.damm@gmail.com,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:linux-renesas-soc@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:biju.das.jz@bp.renesas.com,m:fabrizio.castro.jz@renesas.com,m:prabhakar.mahadev-lad.rj@bp.renesas.com,m:magnusdamm@gmail.com,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[prabhakarcsengg@gmail.com,linux-renesas-soc@vger.kernel.org];
	RCVD_COUNT_THREE(0.00)[4];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	FORGED_SENDER_FORWARDING(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[prabhakarcsengg@gmail.com,linux-renesas-soc@vger.kernel.org];
	DKIM_TRACE(0.00)[gmail.com:+];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	TAGGED_RCPT(0.00)[linux-renesas-soc,dt];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[11];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sin.lore.kernel.org:rdns,sin.lore.kernel.org:helo,mail.gmail.com:mid,vger.kernel.org:from_smtp,linux-m68k.org:email,glider.be:email,renesas.com:email]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: D72F36DC7E7

Hi Geert,

Thank you for the review.

On Mon, Jun 29, 2026 at 2:03=E2=80=AFPM Geert Uytterhoeven <geert@linux-m68=
k.org> wrote:
>
> Hi Prabhakar,
>
> Thanks for your patch!
>
> On Mon, 22 Jun 2026 at 19:07, Prabhakar <prabhakar.csengg@gmail.com> wrot=
e:
> > From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> >
> > Add memory nodes for the RZ/T2H and RZ/N2H EVK boards.
> >
> > These boards populate 8GB of DDR memory, which is exposed through two
>
> GiB
>
Thanks for taking care of this (and below).

Cheers,
Prabhakar

> > address ranges.
> >
> > Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> > ---
> >  arch/arm64/boot/dts/renesas/rzt2h-n2h-evk-common.dtsi | 11 +++++++++++
> >  1 file changed, 11 insertions(+)
> >
> > diff --git a/arch/arm64/boot/dts/renesas/rzt2h-n2h-evk-common.dtsi b/ar=
ch/arm64/boot/dts/renesas/rzt2h-n2h-evk-common.dtsi
> > index 1f575ea23db4..a0e1e4b1f23d 100644
> > --- a/arch/arm64/boot/dts/renesas/rzt2h-n2h-evk-common.dtsi
> > +++ b/arch/arm64/boot/dts/renesas/rzt2h-n2h-evk-common.dtsi
> > @@ -30,6 +30,17 @@ chosen {
> >                 stdout-path =3D "serial0:115200n8";
> >         };
> >
> > +       memory@c8000000 {
> > +               device_type =3D "memory";
> > +               /* first 128MB is reserved for secure area. */
>
> MiB.
>
> > +               reg =3D <0x0 0xc8000000 0x0 0x38000000>;
> > +       };
> > +
> > +       memory@240000000 {
> > +               device_type =3D "memory";
> > +               reg =3D <0x2 0x40000000 0x1 0xc0000000>;
> > +       };
> > +
> >         reg_1p8v: regulator-1p8v {
> >                 compatible =3D "regulator-fixed";
> >                 regulator-name =3D "fixed-1.8V";
>
> Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
> i.e. will queue in renesas-devel for v7.3, with the above fixed.
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

