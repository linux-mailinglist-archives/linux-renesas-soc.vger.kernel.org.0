Return-Path: <linux-renesas-soc+bounces-34848-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id iLBSAJUeTmpXDgIAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-34848-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 08 Jul 2026 11:55:33 +0200
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 4697D723EE0
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 08 Jul 2026 11:55:32 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=gmail.com header.s=20251104 header.b=rd2TAGCz;
	dmarc=pass (policy=none) header.from=gmail.com;
	spf=pass (mail.lfdr.de: domain of "linux-renesas-soc+bounces-34848-lists+linux-renesas-soc=lfdr.de@vger.kernel.org" designates 172.234.253.10 as permitted sender) smtp.mailfrom="linux-renesas-soc+bounces-34848-lists+linux-renesas-soc=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=2")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 6EA23300DF7D
	for <lists+linux-renesas-soc@lfdr.de>; Wed,  8 Jul 2026 09:53:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 08E8C31D757;
	Wed,  8 Jul 2026 09:53:49 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-wr1-f43.google.com (mail-wr1-f43.google.com [209.85.221.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 97AF23403EB
	for <linux-renesas-soc@vger.kernel.org>; Wed,  8 Jul 2026 09:53:47 +0000 (UTC)
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783504428; cv=pass; b=SyeshTNnmjsBB0fTN/B+Jdn6j4gO52VLZrwL7LRKZXTmw6m4oAn9boPt1vIdXKpt2nd/EXBlk0hB+tmhD8YFOJ/BK7osOklGpcdO/hjhxeldvSm8Av/R1P2+RNoWeiD70eyBXwiCL7iGU7Kl9l4aACcs7/lOq7SM1kJ7M78CIqw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783504428; c=relaxed/simple;
	bh=Ks7XzET3IUpoV7ag/TFtxXbJ74oEA/3XNrqevgjNtlY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=jNPUUwDDV0TJmgHhL1AzAAAoKYouJid52+vOGxiaqxH0pGQc8AR2S5XlYjFrnLtgSpOd3aiEnNnX5/kYV2nrx1IEtJuRJZx20faVkQ6qap8F/UsuZ2/eWUgMnYiCxVs6q8t73mS18AIarlqVU5ZgwEL7+3BSNwF368oLPvenrck=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=rd2TAGCz; arc=pass smtp.client-ip=209.85.221.43
Received: by mail-wr1-f43.google.com with SMTP id ffacd0b85a97d-474560436c3so441691f8f.0
        for <linux-renesas-soc@vger.kernel.org>; Wed, 08 Jul 2026 02:53:47 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1783504426; cv=none;
        d=google.com; s=arc-20260327;
        b=fKPp3mthCNJUPqQ6ED32PKUAilrWzN46SnIRJBmiAg8/JIp4KR8Wt6aYi3AarOWsEr
         lFHzBwYB+yPbE5lLaDGpu8rLRo9MJU/azmveCYxKv/qYt1IbHmqqZORfBSU/i0cqzOIt
         J1s/s3+7UCLDnbpT4PCHoqU/hi+iDA+r6O3Q86aLlCSTOBh/0piYtC19iTqm7fEO59GR
         uO7eNciGqi/VkpomYy5Ks/0POmxdfzOwX962uzCJMF5vV1uNgw+BIq6FbE5GqE5dgc5H
         dkngSABeiFPhwzO/skFmIBD7IPyH/+9B+ZM1H7y+IqF4CdOugtiW3ZpelRnoksFOMghS
         egQg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=Lnxwxif0bl4rNG1a1oH1+okVYVcCPb++GJ0NNiWXP3k=;
        fh=GCJeA5rD0U5JHD7Pf6BkWkrEpju5zjOOWPKz+Byi+ds=;
        b=HmbSf4Vb6aouhMHbeMDJc1un4trxdGc6FCPZFtsH+1UWpaPcbtL1jE7jwbd3V4n+KV
         R0RDrn+EjwJL2YDNDQ7bYlcao04QMpNOSIrkn4ty9jpNjFtZmWYsllsD0BVskD7YuQVw
         yzfEtMYaxZ6GSXD7me8+4z+v5yiDkQjmWqVe0xTT7LKfHxLzpeqnS6sTqTbX4+MydBad
         PCd3sIAqyKJrKN8HbXg/epuIMJzDMwvlfCiW5sfzfiFpKL+V2auJjDdztx33EiDeTcKp
         2ZwOdI2toielb0g3AxahzthGF7XwXOnTri1lVglMrBQMw5mYITyEE8KgLB5xMvzcydYA
         S0eQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783504426; x=1784109226; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=Lnxwxif0bl4rNG1a1oH1+okVYVcCPb++GJ0NNiWXP3k=;
        b=rd2TAGCzV87CspoATNInvh3X0tk4sCF6Xxd75qlvRY0XEdWqamL96rSUaJThK/jYzi
         uOcGv0gYdqxP6Ld8gktYIOprfufe6Ii6TBG3UsSEQ/c0XZP1cuW7vp+zZitTR1hUNFc6
         VYPalev9Tvt/8E+zX5iReTUestkQjYO0j71qaQUGW0zBaHlINXGJJSD7h1+6W1Zkn8Ow
         LXYxa60K0iQDWnAU1RusOmwwCmbxuNk/iqm5ixspAREEsrXEXVtLWCGuoxawsec97t8j
         bWBSo4gpEoPlNVIEDi0CuOreo+heGVtlOu+dioJTrJktFFHUCUs6lKodWo5gzyDqTMMl
         Oa5Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783504426; x=1784109226;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Lnxwxif0bl4rNG1a1oH1+okVYVcCPb++GJ0NNiWXP3k=;
        b=OQ7UClBqOkzUavON21ZMW1CBbLcfuWNqwSJ8t/BI+S7tTMcfdkY0nXS6OaIy5WLK1H
         3golruutbcghtGkyTmoI+cvT9Aehg00YJNhoag4vjX4Ot6O0gA/unope4H2LaXl03xq5
         LnMvydFaCsrpxqFMF5is4CRvfuJdNsdHztjX7SotxFLJiTw/OVUnE+dgBmRg46RbXKIZ
         39JWRgPsoaokr8EwDpmGnqgxh29Mp83nDsCoabq9MAteDVHx0qcaY2POnf9T32ugk5oD
         fN0HXXvKpBfZQWfxdBEWiP2/VQMoLSTyccvd0bsLvDXLAwbM6+VyxB8i3mNdLhX5Jcee
         rv3Q==
X-Forwarded-Encrypted: i=1; AHgh+RppnzVCBNE7zSwPfieXmNQ73608FoHL3dDcsmSZCz6SrPdKfIMEfAXhR5pWMIczr0bwVViC9Ex9BOq0SphMLqAHbQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YzlzhUeKRhf869K6GpnXOHs1PcX6Om56M9FZIvHXLsSvsftMJpI
	Pn21T0v77NSoeMNGQ2Hv07lsz/+Kut6/8Vy8ZVOLr5cYuXBKgWxwz6O8VO3K8QIE9RnrFG2YdHA
	PDIuxQmxQKW9cStD8jwJmDz4TxuO+zME=
X-Gm-Gg: AfdE7cnSXAryW1nkmGKzSZpKrqHY4Ncy5Hdu/4D9imiZZCiW41w3fuibKXWD0jsYmGi
	xxCC0r6sFR5ikJgwBgjPOeQ3V1lUs/ZXJhSpiw5Sy1PBzqh2IJFaghQIZKEJDbHnxhvJKmB5WK+
	nqrX9gxq0ZHqpuCuOttkzrz6PmUWFlrBFK0W8PuLYCjlsJ6JNT+MBgoziaFd5uBkvn+hJu5kVly
	NK0uXVyH3QWnYIsskBwQIH0qpSHdoqbC5JQGMpxkfMa1NQYj7qbYMXnv+HGJ0/PPSYa5O7NSaMQ
	POwynKGTidgmqgDbVF2Ah/O7zv8nMjj+jX0jMu0UXf2s6pHnR3AfLDxoVXAtwzWJvD6D7g==
X-Received: by 2002:a5d:588a:0:b0:475:cd6f:721e with SMTP id
 ffacd0b85a97d-47df07a2965mr1747927f8f.44.1783504426013; Wed, 08 Jul 2026
 02:53:46 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260602204707.1920839-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <20260602204707.1920839-3-prabhakar.mahadev-lad.rj@bp.renesas.com> <CAMuHMdUCzxRRK8oZvHmHFHCUN2v_kn69_8pzCVrW9RPk9FRA0Q@mail.gmail.com>
In-Reply-To: <CAMuHMdUCzxRRK8oZvHmHFHCUN2v_kn69_8pzCVrW9RPk9FRA0Q@mail.gmail.com>
From: "Lad, Prabhakar" <prabhakar.csengg@gmail.com>
Date: Wed, 8 Jul 2026 10:53:19 +0100
X-Gm-Features: AVVi8CcSyjzG9IxRuudHCGVCrhR_ezqolIVqJdOXEOrM4qbZam9rfJ_ksfC5gRs
Message-ID: <CA+V-a8uxm__9pz2iSfdkbfwHFFEUpaY9nG-CzotAATV3U+Dv2w@mail.gmail.com>
Subject: Re: [PATCH 2/2] arm64: dts: renesas: r9a09g057h44-rzv2h-evk: Enable PCIe
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
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	TO_DN_SOME(0.00)[];
	TAGGED_FROM(0.00)[bounces-34848-lists,linux-renesas-soc=lfdr.de];
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
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,mail.gmail.com:mid,renesas.com:email,linux-m68k.org:email]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 4697D723EE0

Hi Geert,

Thank you for the review.

On Wed, Jul 1, 2026 at 3:49=E2=80=AFPM Geert Uytterhoeven <geert@linux-m68k=
.org> wrote:
>
> Hi Prabhakar,
>
> On Tue, 2 Jun 2026 at 22:47, Prabhakar <prabhakar.csengg@gmail.com> wrote=
:
> > From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> >
> > Enable the PCIE1 slot which is connected to PCIe0 channel.
> >
> > Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
>
> Thanks for your patch!
>
> > --- a/arch/arm64/boot/dts/renesas/r9a09g057h44-rzv2h-evk.dts
> > +++ b/arch/arm64/boot/dts/renesas/r9a09g057h44-rzv2h-evk.dts
>
> > @@ -430,6 +442,12 @@ i2c8_pins: i2c8 {
> >                          <RZV2H_PORT_PINMUX(0, 7, 1)>; /* I2C8_SCL */
> >         };
> >
> > +       pcie0_pins: pcie {
>
> pcie0
>
Agreed, I will fix this in v2.

Cheers,
Prabhakar

> > +               pins =3D "PCIE0_RSTOUTB";
> > +               slew-rate =3D <0>;
> > +               renesas,output-impedance =3D <2>;
> > +       };
> > +
> >         scif_pins: scif {
> >                 pins =3D "SCIF_TXD", "SCIF_RXD";
> >                 renesas,output-impedance =3D <1>;
>
> The rest LGTM.
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
>

