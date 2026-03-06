Return-Path: <linux-renesas-soc+bounces-28916-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id GHLwL1WWqmmIUAEAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-28916-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 06 Mar 2026 09:54:45 +0100
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 6C2DD21D7D8
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 06 Mar 2026 09:54:45 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id E007B30CF71D
	for <lists+linux-renesas-soc@lfdr.de>; Fri,  6 Mar 2026 08:51:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5251E329C7F;
	Fri,  6 Mar 2026 08:51:06 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-vk1-f171.google.com (mail-vk1-f171.google.com [209.85.221.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F3919221540
	for <linux-renesas-soc@vger.kernel.org>; Fri,  6 Mar 2026 08:51:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772787066; cv=none; b=ktjqV3JSw3je6XRbGu+1NV3ZceJBHQjs7WnCAkP1usGqK3TqLyovVYIHx3rhgAO/6Tx14j70ZPU3xSLg1iZMykIeO8sOaVI11Nht5MEH8UydYuRnYdbN5DSVz5TuTvuPQYInfT/6v5G1mAeXPEhvj958mjZyV1MbmsyvJn8Ml/k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772787066; c=relaxed/simple;
	bh=6/mMZ+MgPEeLwb1d3/FQsDG0e2BICfOtY4c5Gb44pYM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=GJKNjGk+9kOVu1XL4MEZPRF5Ez8eZmtqeTTbxNox0f4MpG7/UoWvatVLPRBUcStX34TrLOPWFiLzUVD9M2sKWxtFNL/UET4ycJDGH2+iXl+VKlVazivACCSZWrv61MqpW4b8p4O5DtLx42nf0E8IMc0Q5aa92afkpzrFIMWb1Ag=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.221.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vk1-f171.google.com with SMTP id 71dfb90a1353d-56b069fed64so168753e0c.2
        for <linux-renesas-soc@vger.kernel.org>; Fri, 06 Mar 2026 00:51:04 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772787064; x=1773391864;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ePV9psSdR4DIeo2PZEv+MlIoxsc+MKL5m0kUhXFRmHs=;
        b=sehA57IbtbL4D/drpc7w0/31D6MPh+zBgtYnK8AKm57hgDjiN/sWUgCRmuhKq9Bjwg
         Py1EtEyLnN8ZSRlxTueXAHUY8SJ7/9lBgrwu60czaaPWmI2MYa5VSQJK0aYDV0ab3SKB
         6ZL/+yeztgQH7YwOcLF0/8xhJJsdxKIsXWsoblK61ud0GQXHnQ9TqZ4vKCAjbSIF5SY8
         Dh9JsRGQZN0wDNimMjt74p5mKk9K3aHj9RqF4Yp5d4y7unXdv0+BJb/XUWZsWEALkI//
         1TilEAEpvOdnPNBhr1mG/Ecx8AeTwgfU5fqIy1wo7IH+Icrqu89fjdZaFzI1a9OpfVak
         Un0A==
X-Forwarded-Encrypted: i=1; AJvYcCXgOQbJfimnyNawvInKXrL8lUjB2tu4rBmnYr3bf4+xSUwLT7kTHxaPDrZ5gNY2Td7Qq4P0OJduWIzWP7WiAuUTVQ==@vger.kernel.org
X-Gm-Message-State: AOJu0Yy5U9dL791Lkdj4/L6u4A2NnhUaKnMG9YHG4d4gEa2uyXuk7Anf
	EyBTUxFZZHJdpGDwPIrCY+27Ih1KbTtIRI2MA0nQgxx81XSkKdk2G/Cr79ExNoWFKIU=
X-Gm-Gg: ATEYQzzdB2+ps+lySca1aYy38eiYk5rLH/nH2y/KZDozVH8ECINhT8pkFgZ1NaZNS9g
	iopEgZ7VlyjrsWI41X5JuSgatMIsDOhUHUiTMObaCFbr9X1zNUNXm5FN8Gd4BST/0OmeZCidM33
	wzn1r/jGXDEnaVytU4cKJxCG5IQw9HhfvsOxxPGzr75OgtlFKbmnFSrpafwyWBROq5w2HIMQLyX
	dnZJN9anFeSX68azzee+11Z3gV8r7CUo+gPnCZDCnv45E9oiPp1n1kfOXb52pg4O/djRvxfcvQm
	s+CMBG3LYn6ZnobpdteDnam6reomTY0OSNkDkrWy12XcWH7WbIWiM4a1W9e8Auui253CJdIrFaP
	W0NoWTVPwpZlF9AJ4bk2mEkxV4NkE5Hot6XaO3CGwNmC5phtoFOxhHxBvrpGRTMbaoV4/VDOinr
	xPVqxgRp2ZVKKDChBFvvdB7KYkl0j+VkWqSKMjHzxCZDRToBiLquoFTUN2m9Mz5rgGzs9MpMGyu
	KU=
X-Received: by 2002:a05:6102:c87:b0:5ff:8b8:9f89 with SMTP id ada2fe7eead31-5ffe6217fb9mr395208137.35.1772787063702;
        Fri, 06 Mar 2026 00:51:03 -0800 (PST)
Received: from mail-vk1-f178.google.com (mail-vk1-f178.google.com. [209.85.221.178])
        by smtp.gmail.com with ESMTPSA id ada2fe7eead31-5ffe8bd67bbsm808419137.8.2026.03.06.00.51.02
        for <linux-renesas-soc@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 06 Mar 2026 00:51:03 -0800 (PST)
Received: by mail-vk1-f178.google.com with SMTP id 71dfb90a1353d-56b069fed64so168744e0c.2
        for <linux-renesas-soc@vger.kernel.org>; Fri, 06 Mar 2026 00:51:02 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCUcXnB2eZtm69UVj75espZgrN0jREnn6CiuLBd1QcXajZmJnS+kFpoX5PbUD7SdP3gmDva1OJm58WyX4Ymbl9UDJA==@vger.kernel.org
X-Received: by 2002:a05:6122:4d05:b0:56a:feae:fc2c with SMTP id
 71dfb90a1353d-56b07f210d7mr358876e0c.14.1772787062507; Fri, 06 Mar 2026
 00:51:02 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260203103031.247435-1-biju.das.jz@bp.renesas.com>
 <20260203103031.247435-8-biju.das.jz@bp.renesas.com> <CAMuHMdW20h=D9Tk5T=6rxNanEiON1ZL35CJ6cqzrX12UeDcdPg@mail.gmail.com>
 <TY3PR01MB11346EEC0D9D7391EEE7ED27C867DA@TY3PR01MB11346.jpnprd01.prod.outlook.com>
In-Reply-To: <TY3PR01MB11346EEC0D9D7391EEE7ED27C867DA@TY3PR01MB11346.jpnprd01.prod.outlook.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Fri, 6 Mar 2026 09:50:51 +0100
X-Gmail-Original-Message-ID: <CAMuHMdV_WiB8graMNeJRVbNZczDetd+fA_4yxt5MV-h7Htzoeg@mail.gmail.com>
X-Gm-Features: AaiRm51qt1E27KD9Lsk97oOtY587H6FKJzOmGVnYf1lOMFnKJRu2iLrNOBXxz1M
Message-ID: <CAMuHMdV_WiB8graMNeJRVbNZczDetd+fA_4yxt5MV-h7Htzoeg@mail.gmail.com>
Subject: Re: [PATCH v3 07/10] arm64: dts: renesas: Add initial DTSI for RZ/G3L SoC
To: Biju Das <biju.das.jz@bp.renesas.com>
Cc: "biju.das.au" <biju.das.au@gmail.com>, "magnus.damm" <magnus.damm@gmail.com>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	"linux-renesas-soc@vger.kernel.org" <linux-renesas-soc@vger.kernel.org>, 
	"devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, 
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, 
	Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>
Content-Type: text/plain; charset="UTF-8"
X-Rspamd-Queue-Id: 6C2DD21D7D8
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.46 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FREEMAIL_CC(0.00)[gmail.com,kernel.org,vger.kernel.org,bp.renesas.com];
	TAGGED_FROM(0.00)[bounces-28916-lists,linux-renesas-soc=lfdr.de];
	DMARC_NA(0.00)[linux-m68k.org];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	MISSING_XM_UA(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[6];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[geert@linux-m68k.org,linux-renesas-soc@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	NEURAL_HAM(-0.00)[-0.978];
	RCPT_COUNT_SEVEN(0.00)[10];
	R_DKIM_NA(0.00)[];
	TAGGED_RCPT(0.00)[linux-renesas-soc,dt];
	DBL_BLOCKED_OPENRESOLVER(0.00)[renesas.com:email,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,linux-m68k.org:email,mail.gmail.com:mid,0.180.91.224:email]
X-Rspamd-Action: no action

Hi Biju,

On Thu, 5 Mar 2026 at 17:58, Biju Das <biju.das.jz@bp.renesas.com> wrote:
> > From: Geert Uytterhoeven <geert@linux-m68k.org>
> > On Tue, 3 Feb 2026 at 11:30, Biju <biju.das.au@gmail.com> wrote:
> > > Add the initial DTSI for the RZ/G3L SoC.
> > > The files in this commit have the following meaning:
> > >   - r9a08g046.dtsi:    RZ/G3L family SoC common parts
> > >   - r9a08g046l48.dtsi: RZ/G3L R0A08G046L{46,48} SoC specific parts
> > >
> > > Added place holders to reuse the code for Renesas SMARC II carrier
> > > board.
> > >
> > > Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>

> > > --- /dev/null
> > > +++ b/arch/arm64/boot/dts/renesas/r9a08g046.dtsi
=
> > > +               dmac: dma-controller@11820000 {
> >
> > Unused. Surely you can wire up scif0?
>
> Yes, but I don't get login prompt, as SCIF0 interrupts have dependency on
> DMA reset/clocks to route the interrupts to CPU.

Aha ;-)

So you need to enable the DMA clock and deassert the DMA reset in the
clock/reset driver, and mark them critical.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

