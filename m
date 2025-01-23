Return-Path: <linux-renesas-soc+bounces-12393-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 986CDA1A4C0
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 23 Jan 2025 14:18:15 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 7429B169759
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 23 Jan 2025 13:18:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0747E20F078;
	Thu, 23 Jan 2025 13:18:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ragnatech.se header.i=@ragnatech.se header.b="jI2Y5Xxu";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="gqUxT90L"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from fout-b6-smtp.messagingengine.com (fout-b6-smtp.messagingengine.com [202.12.124.149])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8069D20E6EE;
	Thu, 23 Jan 2025 13:18:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=202.12.124.149
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737638291; cv=none; b=ofxzL7nUEUBWrRm+HVLK4gFbcmQERolvJQtdXMwchOmOz8uy01dzhTiPnDJcOZSYEsyR2NTimA/I6TJVPeOnZcjQ2lUN4Y9vATw61uZqcLPSfcKwc3EEWi+kHG0sw3VfUKAFLGtqmbA0DKa8fKUablp+33NvfpNE7GbNDDxLigs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737638291; c=relaxed/simple;
	bh=cjEAjAiRLVsTTvub2LJsuZuIZT444uLJ7AxCbIr4/+E=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Kyh/tr/BbauSrtOoxFwfe2+UHJIy7QiMNJ+MEsJi/fIj1PtxM+cZORU+SbFXMl/xJTFj0HkoHir7JrbUZvwx1by20OBP+Pk6+DCLvU4Lk9qGu7zvZFpQJPyGYVptwSzPvKsOwFK0QYt9QrTdXvAEjRiQiTxWiZthmHaEHAcecIw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ragnatech.se; spf=pass smtp.mailfrom=ragnatech.se; dkim=pass (2048-bit key) header.d=ragnatech.se header.i=@ragnatech.se header.b=jI2Y5Xxu; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=gqUxT90L; arc=none smtp.client-ip=202.12.124.149
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ragnatech.se
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ragnatech.se
Received: from phl-compute-08.internal (phl-compute-08.phl.internal [10.202.2.48])
	by mailfout.stl.internal (Postfix) with ESMTP id 4B0B3114013F;
	Thu, 23 Jan 2025 08:18:08 -0500 (EST)
Received: from phl-mailfrontend-01 ([10.202.2.162])
  by phl-compute-08.internal (MEProxy); Thu, 23 Jan 2025 08:18:08 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ragnatech.se; h=
	cc:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm2; t=1737638288;
	 x=1737724688; bh=Uh4goQMXKVWayIS6AI2jPNKTPmhjtRQoTdZkg1sGjgM=; b=
	jI2Y5XxujmrJMweJL208rrEQMNTfSwj08STxy/16zUvdrXkSgo3gij86BTNhc6o/
	hegZ11gOYU+VI3rSiyMZYTYIGvoN49EBahkcgKDegJuOvt4ZTc/cL9D/qFc1Lrbr
	INJUXeJ3ljP644thrQgAyOdu18kGMjguEN+HPzXMNWS+HCzgvGLrrnkKU3HpMhQQ
	qf8SKO5zqOf455he6RcOSj+GWLSw1YlZI9LAj+AoVcn+5sX/NqoPyqdS/fQAvGLq
	Rg6jYk6T7EjgCEJRn+TyzjH1Y74sZuaISE3PPyQmifJdtEMBDSiycm3+GDVGWOKM
	WY90fRVBIGO7YVBeNu6x9A==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; t=1737638288; x=
	1737724688; bh=Uh4goQMXKVWayIS6AI2jPNKTPmhjtRQoTdZkg1sGjgM=; b=g
	qUxT90L9pYiqqIIe2iPlIFVbYQCSA5rNnDZSeFQPAxiE5lvTGbMCdWU/L4FrLIf7
	D1aBMhPoThPqrM7OsyjUZWQRq3XGRP0CKCZhCxfstuc83xIwmpiwvEUY3rJo/6c3
	ESIJgRU0q/ylD/Tx59skfI/7bWy7NOCxX6yWm17kMwgUjA14PKP+Lc2F1UW35pNu
	lr8gAg4lzGfpKH1gVx0LcF3aHFaj8BpJWLwmF/t287n7xYsWhLho/WSzWRYJyL4t
	W8h165y4+UBlkTHSrYv9Y860d25kROckhOfs3DtCcPSDanRs9h/lFQ85RXzcc315
	EILA6p7YvEeVpZGl1WQJA==
X-ME-Sender: <xms:j0GSZ-wGeLzee8z4YKBjF-7OKaKUosURApuBPN8l1uH00xMZWUM8Sw>
    <xme:j0GSZ6QW2Wagu161qJ6kdMnYALmPyOVPW4pUm2dDeRQqm-B_hOU73bydTu_0WcKis
    KtUkUuAWxz8qrP7xTQ>
X-ME-Received: <xmr:j0GSZwVUVuNp4w4w5laOnnJVhNCUm577xd_LDC6wB18XT_1rLPpPEhpaAj2XkjXR1xofzFOt5FKcegYO_wfnq-Am48vOcXD0-g>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefuddrudejgedgudejiecutefuodetggdotefrod
    ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpggftfghnshhusghstghrihgsvgdp
    uffrtefokffrpgfnqfghnecuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivg
    hnthhsucdlqddutddtmdenucfjughrpeffhffvvefukfhfgggtugfgjgesthekredttddt
    jeenucfhrhhomheppfhikhhlrghsucfunpguvghrlhhunhguuceonhhikhhlrghsrdhsoh
    guvghrlhhunhguodhrvghnvghsrghssehrrghgnhgrthgvtghhrdhsvgeqnecuggftrfgr
    thhtvghrnhepfefhleelhfffjefgfedugfegjeelhfevheeikefhueelgfdtfeeuhefftd
    dvleeinecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomhep
    nhhikhhlrghsrdhsohguvghrlhhunhguodhrvghnvghsrghssehrrghgnhgrthgvtghhrd
    hsvgdpnhgspghrtghpthhtohepjedpmhhouggvpehsmhhtphhouhhtpdhrtghpthhtohep
    mhgrrhgvgiesuggvnhigrdguvgdprhgtphhtthhopehgvggvrhhtsehlihhnuhigqdhmie
    ekkhdrohhrghdprhgtphhtthhopehrohgshheskhgvrhhnvghlrdhorhhgpdhrtghpthht
    ohepkhhriihkodgutheskhgvrhhnvghlrdhorhhgpdhrtghpthhtoheptghonhhorhdoug
    htsehkvghrnhgvlhdrohhrghdprhgtphhtthhopehlihhnuhigqdhrvghnvghsrghsqdhs
    ohgtsehvghgvrhdrkhgvrhhnvghlrdhorhhgpdhrtghpthhtohepuggvvhhitggvthhrvg
    gvsehvghgvrhdrkhgvrhhnvghlrdhorhhg
X-ME-Proxy: <xmx:j0GSZ0iwvWp6SpmuFpml3xnscU4UBor2233QlT_1ONoKaj6bbvkDFA>
    <xmx:j0GSZwCDyA1Sup-2f9rOhOEwTSk2Flx7yh7sjHVtNByRoHgbGBZTLg>
    <xmx:j0GSZ1Jj-Eh-RqBAAjlt1yNku_PjczTOOfDrlXh6UmnfE38zTBRfjQ>
    <xmx:j0GSZ3CHM1ltUJeIKrer4O1VTBGDfAQU88hED_LWFRMU1QNZOwlX8A>
    <xmx:kEGSZ-CRBYSJPWZWhz9rT6LaualE09gV8MCN4wW0g-Tg1nJqhaHJFbR2>
Feedback-ID: i80c9496c:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Thu,
 23 Jan 2025 08:18:07 -0500 (EST)
Date: Thu, 23 Jan 2025 14:18:05 +0100
From: Niklas =?utf-8?Q?S=C3=B6derlund?= <niklas.soderlund+renesas@ragnatech.se>
To: Marek Vasut <marex@denx.de>, Geert Uytterhoeven <geert@linux-m68k.org>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	linux-renesas-soc@vger.kernel.org, devicetree@vger.kernel.org
Subject: Re: [PATCH] arm64: dts: renesas: white-hawk-cpu: Move avb0 reset
 gpio to mdio node
Message-ID: <20250123131805.GJ3436806@ragnatech.se>
References: <20241015144810.GD2838422@ragnatech.se>
 <825e3b22-340c-4618-8d80-5d1b004fc0e4@denx.de>
 <CAMuHMdV9XoJHHUM42YFwackdM+oRgP4k-SwZOTwqg0RJGETViw@mail.gmail.com>
 <d6b35a1b-3f42-4071-99c1-dc87999c5cce@denx.de>
 <CAMuHMdXW332YZahLw=vzfB6fZwc_9jL8uY-Uxj=Qyfov5vYQFw@mail.gmail.com>
 <2f9df6fa-2474-4f35-af29-a1c280d5fe6f@denx.de>
 <CAMuHMdUH32upHwwY7dXqk085LDWzkOz9cBv83FezVUbi27Ygpw@mail.gmail.com>
 <4d7d6a7d-cbe8-4cbf-9fb1-2cdec0f11ce2@denx.de>
 <CAMuHMdVnJPMLx=39=f+7S4vdRAC-0q0hKS6Ww=ELYEaLBx+gZw@mail.gmail.com>
 <021aee32-795a-42c8-80e7-89cb8a45f935@denx.de>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <021aee32-795a-42c8-80e7-89cb8a45f935@denx.de>

Hello Geert, Marek,

On 2024-10-30 15:45:30 +0100, Marek Vasut wrote:
> On 10/29/24 9:26 AM, Geert Uytterhoeven wrote:
> 
> [...]
> 
> > > > > > > revision, we can revisit this discussion ? Maybe bootloader-applied DTOs
> > > > > > > could work then ?
> > > > > > 
> > > > > > So, what would you suggest when the PHY nodes would not have compatible
> > > > > > strings?
> > > > > I hope I already answered that question before.
> > > > 
> > > > Sorry, I may have missed that?
> > > > 
> > > > I really prefer not having the PHY compatible strings, as DT should
> > > > describe only what cannot be auto-detected.
> > > See paragraph above (*). My take on this is the exact opposite, better
> > > describe the PHY in DT fully, including compatible strings, so that if
> > > the PHY driver needs to do some sort of bring up tweak/fix/errata
> > > workaround/... , it can do so by matching on the compatible string
> > > without trying to bring the PHY up in some generic and potentially
> > > problematic way.
> > > 
> > > The MDIO bus is not discoverable the same way as PCIe or USB is, so I
> > > don't think the "DT should describe only what cannot be detected" is
> > > really applicable to MDIO bus the same way it applies to PCIe or USB.
> > 
> > So you think this is similar to SPI NOR, where most FLASHes can be
> > discovered with the JEDEC READ ID opcode?
> 
> Possibly, if you take broken-flash-reset DT property into account somehow.
> Even SPI NOR does require a proper reset after all, else the READ ID opcode
> may not work.
> 
> > See commit 4b0cb4e7ab2f777c
> > ("dt-bindings: mtd: spi-nor: clarify the need for spi-nor compatibles"),
> > which clarified why no new compatible values are accepted.
> This works as long as your SPI NOR reset works.

Seems we can't find a way forward with this. The core argument as I 
understand it more about if we shall use device specific compatibles, or 
probe the MDIO bus when possible.

As that issue would require more changes then the one done here. This 
patch was more to align all nodes to behave the same and not adding any 
new feature or fixing a bug. I will drop this patch from my backlog. I 
did find the discussion informative and I learnt a bit, thanks for 
taking time for that!

If the larger question ever is settled I'm happy to pick this up at that 
point.

-- 
Kind Regards,
Niklas Söderlund

