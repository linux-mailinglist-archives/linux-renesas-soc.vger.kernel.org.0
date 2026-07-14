Return-Path: <linux-renesas-soc+bounces-35209-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id vqdPAGw7Vmqx1wAAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-35209-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 14 Jul 2026 15:36:44 +0200
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 611B575539F
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 14 Jul 2026 15:36:43 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=gmail.com header.s=20251104 header.b=gd1aObQl;
	spf=pass (mail.lfdr.de: domain of "linux-renesas-soc+bounces-35209-lists+linux-renesas-soc=lfdr.de@vger.kernel.org" designates 172.234.253.10 as permitted sender) smtp.mailfrom="linux-renesas-soc+bounces-35209-lists+linux-renesas-soc=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=none) header.from=gmail.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=2")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 6DEBB31687D2
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 14 Jul 2026 13:27:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BBD5C339B41;
	Tue, 14 Jul 2026 13:27:33 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-wr1-f54.google.com (mail-wr1-f54.google.com [209.85.221.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CFBC832B136
	for <linux-renesas-soc@vger.kernel.org>; Tue, 14 Jul 2026 13:27:31 +0000 (UTC)
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784035653; cv=pass; b=mWIbYvIgH+Jkgr2R20i1pRo9pHhfu26SSQrI4kzrmpnfWsKNp1J6TvqkYBYrOlZFPmXGb77k7bLQ7wMB5kVqYJksPmOqv7MTmkCDPzm3cNQd4Mv9uz41XldVgXGCPjInXi24ekm4p4yJxK+zi8ZsZkA4I34jDXjGytEVUnSi8q8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784035653; c=relaxed/simple;
	bh=JwVJDiR+cBjS+r4fEWc8OMyrK+FkqxIoisO4S0dbaKs=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=icmCjLiQPeMQk4fd8exUDyN/wT8H+lF6YarjD4iYnO8NvV4EDX182jczGNQsNkRhVSnDs3FW0ycbvwD8aQOaKEZAL5MRsyCoMo2BfI2ZMe9Aos3YOKSOcBgzoGLylt7dBrT1raZNav+XMcLJ19yVNenr/7L5eHGBlK3d+PWdpjc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=gd1aObQl; arc=pass smtp.client-ip=209.85.221.54
Received: by mail-wr1-f54.google.com with SMTP id ffacd0b85a97d-472326ca506so3534234f8f.2
        for <linux-renesas-soc@vger.kernel.org>; Tue, 14 Jul 2026 06:27:31 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1784035650; cv=none;
        d=google.com; s=arc-20260327;
        b=FoYIbhMHEQ25dbzWMnlK219/gUBB+rRA7AkwNgKCYBhbniIL8/E4av9f2xf3G8BQZO
         w7O73vwNKPE3dEmgQB1hySAvGA6axccbk7pSdfHiq4FXmKyr8LjPLV2DLDgmaEUNTPMT
         nui9b0kwjOHmZpywvtFbERknE2dNkaffRv0mDus/VKE/dE8gdIRIrIquxw1O/QDESN+C
         ySk37ThAnRPX95uH3d58mHOCoBcQ2g09J9KT2QMwd747wzdzlW19zultifgeIIUgbCnj
         vjnHuseefKiNzwJLcTmiMXLKUoGw1AwTZbdlWUIquG0qqQ1Czfi3D9hVOOVFUND3u9dH
         ZXFQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=WRj5C4BZ8aUAwy0UDz9tsH2p/apYNMhkYQtruEiLUFg=;
        fh=IwIg2FgtBtrMW9BX1iHn67drz/b4IOwPivzxtNzqqOg=;
        b=BBpqVeUvx/XqQE4OAVU4Vl+xjUU90JL3rDEuEFPvabzuqPzvrJ7H5l8Vpby9ZfyNaW
         f1MVff80FME4NX3/qOc+aD3S3t0zOXuaz6E/KhV1LhrNKJ/RoEocrXJ7Ca2ysiEfJxDH
         guRqGDJPEu4bnXlbYLxFWNCMTrFTh94SP1Hg2Z9IhyTJPlfXa2gMJm+p1WJTJq7CgJSs
         zdKlZtdh3xJk4PcfDW9PG2cvInt09Uo5ru9b6JT/gDrleXUv4HQW//jlSuqS9r+w7Nv9
         SkSNMbuZYBe/0tZK3P0duWn/V19iaMtrwACB0GjkOTXFFuAa1Aom0xL/WhSuUnQrq4KS
         26cQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784035650; x=1784640450; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=WRj5C4BZ8aUAwy0UDz9tsH2p/apYNMhkYQtruEiLUFg=;
        b=gd1aObQl+qjxD929Ebl9GEw5vMjRAD5Ra9FjKX70snWGrmmHxmsnIeVpMD18Erdzkp
         UKkux6CpyLniULXKsfExXEZboQQVJkbJeBHN/C8OmQTYdq7wSEDnf5sj0EdAIX1xDPWH
         45N61XtWPmVHa1wbOEUhCtCTfUfV/BiihBjoUjZMsm5ffpc4a+NttdzMekEBufsYzzYM
         q9lRJ6931LUKwD/wZDr8+ZkavKK7+vUJX0St/6vsN9ETG2Fnr4macCZxiosPf4iC0Ojh
         YMF0QbXrxTkWmzl5LCmZkvMdEteA7C0TWqyYda1VrNJmvlxsro2+WdSFl9sW0dDvtlJh
         h7Ig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784035650; x=1784640450;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=WRj5C4BZ8aUAwy0UDz9tsH2p/apYNMhkYQtruEiLUFg=;
        b=WlS6sTZx7GPWZSqNoXATZ5PpBFAY07AWHV+/uE4sUvoCj8TOcQXi790NzYXEPUE4ZJ
         loIKuS8FaiYKriEartHGREmPeotAg4ZqnMPhF8/jukNAQ1WWoJddwOGkPCQnLHETLhkM
         NV0/y6M8NK9zEAltvbjdc4J5dY1p7nREmp1r1G0/Us/bxtVEWZPzBTP8U11TxrWYcWzD
         Odg/ithIk+SnSv6v//rRgBWrfjStKIuAXoLnlOiCC6P4gqGuQ03Re+xgrm+fGZJuFS7u
         shphy1aGZX3C/ffQosrVXOwQkgXbvmlJiOmZKC+2wdttvN5cZ5A2Dh59ky8v+jyW8YC4
         AGZQ==
X-Forwarded-Encrypted: i=1; AHgh+RpXQGBabFjvDqbLdaAAM/MAS6JdroVFC3887MFHXLe26NzcbhXafbnP1/AP1rVmoxfSa/qPkyUBN1Ux/i8iH8gsDg==@vger.kernel.org
X-Gm-Message-State: AOJu0YxQrymVrQlI6GV9Ovd1DWgsnsCULAF/tdLLrka7UoKM/KsC5Pxm
	82mQCNLFTGmB7/41mzJO23jtQId2RX8OxKSEeBtzyU4K/hQcJOF+aFlh5lfFj0t6LIiwyEidACw
	LYu1mNlf9RTlFrclM34AUHiV0mdd56yI=
X-Gm-Gg: AfdE7ckG9LR+zfrjBmeO1seWCEmgZUqGrrPdfS2CftoiE0LZ2v5Wx8iKQhIYCv71zqc
	Cmxass2w93ijejwwmmTRAj2+0eg/RpkNRr0R2VTd/Tbt05f4McoWBtSuQMahZ6AEQ4lkAdrP2tu
	PenvtfzeStipQwpazCBcMD5RnV8CXwBRXTeoIwy+g1hZRTiFBaPSh2YrMDxyDYHafHB4YaG9vLl
	1BRFkAirB74jzFv/FTdIDu277qSW3CRCS7K/DXLZjJPAzImWcsMjs4u1+GD+lUbbDUhn376ufEx
	QNLjZlOwkT9EoqMSkIN9q9GenD6Kd7/ibozQk7G5huMHWD8JWsLOACWnYvOGJZFT2bYiiQ==
X-Received: by 2002:a05:6000:4693:b0:47f:4650:e45c with SMTP id
 ffacd0b85a97d-47f4650e4e6mr3694089f8f.12.1784035649771; Tue, 14 Jul 2026
 06:27:29 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260702123112.161160-1-prabhakar.mahadev-lad.rj@bp.renesas.com> <CAMuHMdUhiBAcJ6P7j0ZxL+0AbVqz88PMo7YX9UiYOK8jM61D1Q@mail.gmail.com>
In-Reply-To: <CAMuHMdUhiBAcJ6P7j0ZxL+0AbVqz88PMo7YX9UiYOK8jM61D1Q@mail.gmail.com>
From: "Lad, Prabhakar" <prabhakar.csengg@gmail.com>
Date: Tue, 14 Jul 2026 14:27:03 +0100
X-Gm-Features: AUfX_mz-bUh857aZKLRp6jCySBSNe_W4CR-bQsVZRSwNXqRoLizYQlsdmvEfzQc
Message-ID: <CA+V-a8uUxfDx2Xnb3uFg2=R+eYnzVmAv4PoEYeXGwAbANxG5Bg@mail.gmail.com>
Subject: Re: [PATCH RFC v2 0/9] Add System Controller support for RZ/T2H and
 RZ/N2H SoCs
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, 
	Brian Masney <bmasney@redhat.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Wim Van Sebroeck <wim@linux-watchdog.org>, Guenter Roeck <linux@roeck-us.net>, 
	Magnus Damm <magnus.damm@gmail.com>, Philipp Zabel <p.zabel@pengutronix.de>, 
	linux-renesas-soc@vger.kernel.org, linux-clk@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-watchdog@vger.kernel.org, 
	Prabhakar <prabhakar.csengg+renesas@gmail.com>, Biju Das <biju.das.jz@bp.renesas.com>, 
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>, 
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=2];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_RECIPIENTS(0.00)[m:geert@linux-m68k.org,m:mturquette@baylibre.com,m:sboyd@kernel.org,m:bmasney@redhat.com,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:wim@linux-watchdog.org,m:linux@roeck-us.net,m:magnus.damm@gmail.com,m:p.zabel@pengutronix.de,m:linux-renesas-soc@vger.kernel.org,m:linux-clk@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linux-watchdog@vger.kernel.org,m:prabhakar.csengg+renesas@gmail.com,m:biju.das.jz@bp.renesas.com,m:fabrizio.castro.jz@renesas.com,m:prabhakar.mahadev-lad.rj@bp.renesas.com,m:krzk@kernel.org,m:conor@kernel.org,m:magnusdamm@gmail.com,m:prabhakarcsengg@gmail.com,s:lists@lfdr.de];
	TAGGED_FROM(0.00)[bounces-35209-lists,linux-renesas-soc=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER(0.00)[prabhakarcsengg@gmail.com,linux-renesas-soc@vger.kernel.org];
	FORWARDED(0.00)[lists@lfdr.de];
	FREEMAIL_FROM(0.00)[gmail.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[20];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[gmail.com:+];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[prabhakarcsengg@gmail.com,linux-renesas-soc@vger.kernel.org];
	FREEMAIL_CC(0.00)[baylibre.com,kernel.org,redhat.com,linux-watchdog.org,roeck-us.net,gmail.com,pengutronix.de,vger.kernel.org,bp.renesas.com,renesas.com];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TAGGED_RCPT(0.00)[linux-renesas-soc,dt,renesas];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[mail.gmail.com:mid,renesas.com:email,linux-m68k.org:email,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,vger.kernel.org:from_smtp]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 611B575539F

Hi Geert,

Thank you for the review.

On Mon, Jul 13, 2026 at 5:00=E2=80=AFPM Geert Uytterhoeven <geert@linux-m68=
k.org> wrote:
>
> Hi Prabhakar,
>
> On Thu, 2 Jul 2026 at 14:31, Prabhakar <prabhakar.csengg@gmail.com> wrote=
:
> > From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> > This series adds support for the System Controller (SYSC) blocks found =
on
> > the Renesas RZ/T2H and RZ/N2H SoCs. These blocks handle critical low-po=
wer
> > management and access control functions.
> >
> > Hardware Architecture & Dependency Challenges:
> > ----------------------------------------------
> > The SYSC in these SoCs is a multi-functional block responsible for:
> >     - Clock & Reset Control
> >     - Low Power Management
> >     - Clock Monitor (CLMA)
> >     - Access Control
> >
> > A key architectural detail is that these SYSC blocks are physically loc=
ated
> > within the CPG/MSSR (Clock Pulse Generator / Module Standby Software Re=
set)
> > address space. While the CPG/MSSR driver is already implemented and
> > functional for these SoCs, the integration of SYSC adds a layer of
> > complexity due to a cyclic dependency:
> >     - SYSC requires CPG: The system controller needs a clock to operate=
.
> >     - CPG requires SYSC: Access control registers within the SYSC conta=
in
> >       bits necessary to control the PLLs managed by the CPG.
> >
> > If implemented as a completely separate top-level system controller nod=
e, we
> > would face a cyclic dependency between the CPG and SYSC drivers during =
the
> > boot process.
> >
> > Proposed Implementation
> > ----------------------------
> > To resolve this, the SYSC blocks are represented as child nodes of the
> > CPG/MSSR controller in the device tree. The SYSC regmap is registered
> > directly against the CPG device node. This hierarchy correctly models t=
he
> > hardware address space while allowing the drivers to share resources
> > without deadlock.
> >
> > I am sending this as an RFC specifically to get feedback on the
> > implementation of the SYSC as child nodes of the CPG to resolve the
> > dependency cycle.
>
> Personally, I am not a big fan of subnodes.  I assume you are using
> subnodes because you can register only a single regmap per syscon node?
Yes so that the consumers don't have to specify it by indexing.

> Would it be possible to just extend the existing clock-controller
> node with two more reg entries, and expose them through a single
> combined regmap?
>
That should be possible. Or would you prefer just to extend the sizes
and create a single regmap for it?

               cpg: clock-controller@80280000 {
                        compatible =3D "renesas,r9a09g077-cpg-mssr";
-                       reg =3D <0 0x80280000 0 0x10000>,
-                             <0 0x81280000 0 0x10000>;
+                       reg =3D <0 0x80280000 0 0x20000>,
+                             <0 0x81280000 0 0x20000>;

Cheers,
Prabhakar

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

