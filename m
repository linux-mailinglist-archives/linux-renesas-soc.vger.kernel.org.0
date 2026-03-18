Return-Path: <linux-renesas-soc+bounces-29817-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id UCGSAZEBu2mreAIAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-29817-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 18 Mar 2026 20:48:33 +0100
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 9E3D52C22C6
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 18 Mar 2026 20:48:32 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id DB5E2301DB97
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 18 Mar 2026 19:48:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9836C36A038;
	Wed, 18 Mar 2026 19:48:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="JISMVokk"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4A0D93612C7
	for <linux-renesas-soc@vger.kernel.org>; Wed, 18 Mar 2026 19:48:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.128.45
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773863310; cv=pass; b=lWNOADosWIUHn2T1yH91EslwTs0WNMTkf+Sykt5rU8vpT/zjfbYhRvWiwKiyH1+dzwR71dRFiZHbTgCrZHVklIGIiUKkRl7no5P2AZewKa5nRdIzCZdHpT7YC0VJ0v9vJeNg4r0MXaouPpz72jQIxLivgaHvd4IFazSN7T+BnP0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773863310; c=relaxed/simple;
	bh=FLa8rQzR9s19uAT/5ZIrsFfEc09f2snRTlaHdk1TKIU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ULTLbyiUl9pgQO7krtSgpsidz8LR3o1jjX19ZdqKwD5r1AvmgaZxTipR0lFnYBuU8OSiQXorP9iRuLO0svJJBtAwWc336TPuUmR3osYwAcSJzW8SxGV7cRlQ0+NzMlC0LAac/f+XC8KGxFCvNC97oMxJYr8Gn9WYbLV5U/RwrqQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=JISMVokk; arc=pass smtp.client-ip=209.85.128.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-4853aec185aso1773985e9.1
        for <linux-renesas-soc@vger.kernel.org>; Wed, 18 Mar 2026 12:48:29 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1773863308; cv=none;
        d=google.com; s=arc-20240605;
        b=TOU+VMGDg0FdWlHaCQXUKu8hHVbXaFAmJh6kBzvXxXLt934mhDIelTDmGHKC3vkWaL
         xpYckiNoBSwrCxn/KiBhj5tPdMbUv9VBfyF9o+1DP6olW0Ykq6ICjXS8csJORgJZ3CAc
         bDjQ1EUASCuQx7Fxi2z1eM5kgMOxA2NI/INNmVwYBs26YnK9aFvl8HuYiOayHF6EcFxo
         vIVNAV3uEJApR6gTHKbr4O8wCD65VztF5XiSuQBsyYJK1AH7y3IcDmKJsRZl3nmwoL8U
         /LFys5FWbkkqqzuext4O6tRWY+XC5BJm85RHrXqrMSGbok4h94f7oA0WYwnsZ8K3HLxJ
         rSFA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=qEEWh99a1X8WTNi6tZLCQlme3I6QdM9wUDMHyAHkv+c=;
        fh=DFnAEXJL2zYES2+zP8eMCE9+c1UTSBdjzCG4yCOILQE=;
        b=fr6pI33GwjSmDSJTpd6N/pumC5DPv9ODK8PcRPATa46S5h9Y1/iE746zGN41fPHuDe
         FzAwejYaZiPT7iXTA+Yy+5KKvInY6+ERqleQcbusZvKaJybJ7mYsaCN4g8yx+Pj35AGx
         2aLWpbeR4oeKc7OZAPYKqUK9KpbaZBVrl7wGT5JD2j75ITUfJO91RJhnyrCwxe4vsoNr
         SgJg2yf/4I94/ac2PbdU2qBjQ9Afw/o1aJJLZVuupNH4HMJMKrIOT+z+at/agafN2W4U
         y+gTyOpz8CAfM59Yl48zjVho+vkgQtkZAdezGYwUQn421xeW+3IrO8/kkXKJjqw2+yI9
         HhUg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1773863308; x=1774468108; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=qEEWh99a1X8WTNi6tZLCQlme3I6QdM9wUDMHyAHkv+c=;
        b=JISMVokk82zpY7CBSHsQIMw+3V7XeLIUZnh3S11XrflKRs35ho8iy3t9X5cm3beBYU
         xm3t5verRqzcb1YhkpuJBcpXx1suriQXyGbS5l2+wTqV98ad4ObJhmz57WilT6ZA+Fpd
         4o8i7A2UBofHdPu7En0VvRhl7qrhWUK+SijFXGlm+GUi6JfUX+MGIUgxpEb1QyB7o1BN
         oZ+LdOZOD6dWC2Tm79uPA1v1TZv4pyrt7xFLVUh5B40s16Zx+dB9iQOEWH/nKPGmabUV
         tbjwyahI/6X5H/JvW5qWMLzOINhPDuch7jKfImYx411QC/2Dt9FvlB0Tb65jCLuexIBx
         KIGw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773863308; x=1774468108;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=qEEWh99a1X8WTNi6tZLCQlme3I6QdM9wUDMHyAHkv+c=;
        b=Jf0CpC/6lpU6ZIPQRGcOpM8J4w0oKg8ERh++6vaiLK17pNv+XH/dR7fMwjDAq2snjg
         feS4CLnbcQTQ987Afw3H274NvpbwJt93wnY+WoESrK/NeEDRr/pArlhW9CWdOt5cZjGw
         PJTLrSrJKemcEQbXWhIB0P8sAAm5qMc5sHcyj99hBz07EJ5AmVE4hLVYU7s5lNxTBOA5
         Ai/pyKgNIAdLeqdNSkcyqE4GOh+Nu6NG41lERunmbzzr3VvjAzc1HD30h1pLgV9qM5Yu
         qIVWW9+RNDF4GfiXvpNV2KJfA45VxZbRGl6s1mUITYcW8JmFw2cNBiUMiR6JToopuxKp
         tmCw==
X-Forwarded-Encrypted: i=1; AJvYcCXQbYay5OHRavrMQ5ZMDjSVoFZWi11QHD676byt9gK/NJA2/JpZtDiKml0yqfuLnpn8vDE86BiiEPLCXgDAvD9cyg==@vger.kernel.org
X-Gm-Message-State: AOJu0YzfSD+X32I79OOvpRTmxVeFMe8Co0Byx0y6hsh6VPIXJvMA0bvh
	esSzMCuw+v48DQAr7Tbk+qACq7dEQDAgrckoPd2pHAXdsfMwHXJlxIQ2fWoK3izyvjsXZcx4s80
	sCn3EQkwSlewZStV78QeyEaFmWGKCeVQ=
X-Gm-Gg: ATEYQzyBxEqSb+96H26swhPtR2xJ9/Tlkesqn/gxFFODJVj2jNoV9y/SiQpVaoZp4pI
	IJoeJ4vxDBUIjglObQRq+M0Fcca9veQSurAqm49N9RvOyWf/dwiZeYz6t5xGLiHcGtyAOILdxbF
	vZGJPaigS/TpE6kwmwvKkmzZtQcjBv/Z6kCG8TujTled4wV8ilvED7wTgiGDswDP2tl/j/otxN4
	C0C1nDzTnMj6gIY3XQjuG6hOoYI9Sinzkgs0o/4yROgkeA9wxdewJqtLrm3CvSsYvreM4O6kXyy
	Dpl12RYwpLAKtxr5KSSajBOoCbMvLwPMrFeOSgvythXl3qofZ21rJSBrzQl8ifp629Q=
X-Received: by 2002:a05:600c:1f11:b0:485:41c4:e2e5 with SMTP id
 5b1f17b1804b1-486f445fad8mr75654535e9.27.1773863307397; Wed, 18 Mar 2026
 12:48:27 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260318124450.163471-4-prabhakar.mahadev-lad.rj@bp.renesas.com> <20260318163023.GA45848@bhelgaas>
In-Reply-To: <20260318163023.GA45848@bhelgaas>
From: "Lad, Prabhakar" <prabhakar.csengg@gmail.com>
Date: Wed, 18 Mar 2026 19:48:01 +0000
X-Gm-Features: AaiRm516n8YYRZ3VpTEDqe-zyE0F6jTjlgD123Nu8UmO-uhnFe2823Q784bfJqE
Message-ID: <CA+V-a8s=em8dZ5PHHx5hrkZkJeM_4NX7SpdZYdNpeyyx4PT8dQ@mail.gmail.com>
Subject: Re: [PATCH 3/5] PCI: rzg3s-host: Use shared reset controls for power
 domain resets
To: Bjorn Helgaas <helgaas@kernel.org>
Cc: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>, Bjorn Helgaas <bhelgaas@google.com>, 
	Lorenzo Pieralisi <lpieralisi@kernel.org>, =?UTF-8?Q?Krzysztof_Wilczy=C5=84ski?= <kwilczynski@kernel.org>, 
	Manivannan Sadhasivam <mani@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Philipp Zabel <p.zabel@pengutronix.de>, Geert Uytterhoeven <geert+renesas@glider.be>, 
	Magnus Damm <magnus.damm@gmail.com>, Wolfram Sang <wsa+renesas@sang-engineering.com>, 
	John Madieu <john.madieu.xa@bp.renesas.com>, linux-pci@vger.kernel.org, 
	linux-renesas-soc@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Biju Das <biju.das.jz@bp.renesas.com>, 
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>, 
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=2];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20230601];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-29817-lists,linux-renesas-soc=lfdr.de];
	FROM_HAS_DN(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	RCPT_COUNT_TWELVE(0.00)[21];
	FREEMAIL_CC(0.00)[bp.renesas.com,google.com,kernel.org,pengutronix.de,glider.be,gmail.com,sang-engineering.com,vger.kernel.org,renesas.com];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-0.338];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[prabhakarcsengg@gmail.com,linux-renesas-soc@vger.kernel.org];
	DKIM_TRACE(0.00)[gmail.com:+];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	TAGGED_RCPT(0.00)[linux-renesas-soc,dt,renesas];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[mail.gmail.com:mid,sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 9E3D52C22C6
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Hi Bjorn,

Thank you for the review.

On Wed, Mar 18, 2026 at 4:30=E2=80=AFPM Bjorn Helgaas <helgaas@kernel.org> =
wrote:
>
> On Wed, Mar 18, 2026 at 12:44:48PM +0000, Prabhakar wrote:
> > From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> >
> > Use shared reset controls for PCIe power resets to prepare for RZ/V2H(P=
)
> > support, where multiple PCIe channels share the same reset line.
>
> What is a "PCIe channel"?  Please use PCIe spec terminology if
> possible.
>
This refers to multiple PCIe controllers (Root Ports) sharing the same
reset line. I will update the commit message accordingly in the next
revision.

Cheers,
Prabhakar

