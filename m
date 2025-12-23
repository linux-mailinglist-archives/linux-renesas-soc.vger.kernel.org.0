Return-Path: <linux-renesas-soc+bounces-26078-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 5446DCD9A49
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 23 Dec 2025 15:31:01 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 73FBE300E3D6
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 23 Dec 2025 14:30:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3C2B2341079;
	Tue, 23 Dec 2025 14:30:39 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-vk1-f173.google.com (mail-vk1-f173.google.com [209.85.221.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A39F4340DAB
	for <linux-renesas-soc@vger.kernel.org>; Tue, 23 Dec 2025 14:30:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766500239; cv=none; b=O4tW+094w/eOP+8QFomink4GksDyoRA218nmbm05oFGv2Jh741GOSatw0ko7w0zQbm48NB0YU3Mh701ed5J9rae4eOd+oKJvmEIHPELK1Syaux8iER8XEamkmWlsEBxQpEIJmbgDEN7T6zRL2SKPtF8WEKZY6fkZ+XMvel4yTB0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766500239; c=relaxed/simple;
	bh=xRHgi78/9TJa6RE/uf2fUH6wEG9F+YXSAx9KnXSZTx4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=bmmdZmsQ4aBLvOL6qeqRAB6oLvqEiE6Agsup2VRF80mk3tuE4OhekB+j4fsz/cDb/Lm5+QwPE0RppZOrLC3/bmfu8mG5IMz2auBckylXH9dOWz0zQAeMcPs+j5w/WheZK82yv/eY+x+0IPd7pvWnFP5T7z6uFCwxSGnObtMAu6g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.221.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vk1-f173.google.com with SMTP id 71dfb90a1353d-55b1dde0961so3671402e0c.2
        for <linux-renesas-soc@vger.kernel.org>; Tue, 23 Dec 2025 06:30:37 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766500236; x=1767105036;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=V9KRWI7ek4fDakJL55ErZIsshqTMY6fNujiPa5ZpWhI=;
        b=Y120bJ397DsRZwSsIh5QgrZlkusJNEarWY+YJBca41PUZ6+mnRLP5AVRN5eYuw1MrS
         NCU/tbhY8Le/W8k5Gxzl34RJxA+COCG27c+nWPMtQYBQ6vWHQuQ6A7x0q2DO/gNqzIEO
         bsDfgqMv0N2S/HfwLxWWjPVfTGJ/tQP2L8ATawejtIC2nvEFOGzNjGPoeQ854ArCw2E3
         MdjtWFvUc5n0sDUNxtNqLbnR701xLIkDoGNbuFNzm6mg/QlhKsHwLju/Q3ouLMhm66m7
         HYSQKmMrqwbS4bl4wxvoosG/GgmUKJZ3qnU/6N0tjFsQQv782XprJV50YtzZp/rOEdB8
         mQsA==
X-Forwarded-Encrypted: i=1; AJvYcCU6+82LZWLGA6c/A3QH6hzVWZ/tYz+bhs70JfixlT8bVBF3p3ltBf2ZqxrUExdfPnreNkdvZjKWw+PqLMJDD1o3ag==@vger.kernel.org
X-Gm-Message-State: AOJu0Yx/VvU44lPSouQVNdHTsW5UUqBPhnqfEL1Rk/pSS8QgQjf7AdWe
	5LHzXdXMHwVdP8imwVCiP1+24+DHddvMUVlfkwLIc4RC/WsuUF3QK9fyrqEwMnGQyOU=
X-Gm-Gg: AY/fxX7vMLVxXUf2rdupiSosvZ2O9OukY2eWSGDAF94PX6uG6abOipMpQVps0WibKRI
	TjFfmCLv1TOke/79be+xp6hmxjJVhgFAakDsPjQfl4f9Q80g+/v+Z9tfdaafZJM1frMp5zpsEvW
	HDlJD2z76hpP/bv+REVpYDPxTNnXQn8K92eD9t4pej0HVho0kGLPE3NeSy7vH6DYKiIWIFEja8X
	fI5vPrPywoqyt7wAgjnB3QWtNw8SH/H6WhoHzjZ6QexMsm4NzGK4/cA89tshFtlVYvBKXQohH3q
	STbg6OmVzUMjYb/xCwjk++ADbixnY0AV5fc9r3OERxWLRMzl43Vb2KWNcozbIuaMnFPyudtg5xL
	Z4xU/lKgUvou30Xl5kDtMP2VqiUIbLvPa/XtVh0qabzqqr3HlucauOLzhIMhk6DoQLCODbH+HJw
	wT8UpbeeBbjrGYkEwOfwAzUEbVJmVFkN76vOwwBUy/hGLeIgu0KmNZ4dT6F36aCwQ=
X-Google-Smtp-Source: AGHT+IEsIprvY7BawzH9J4ysDu1E1B+AIrIrhca+bu7cxbnist2gXi1KG8jgzmGutD6xkyt7KmzNzA==
X-Received: by 2002:a05:6122:2209:b0:54b:bea5:87ee with SMTP id 71dfb90a1353d-5615bd0440cmr4882087e0c.7.1766500236369;
        Tue, 23 Dec 2025 06:30:36 -0800 (PST)
Received: from mail-vk1-f171.google.com (mail-vk1-f171.google.com. [209.85.221.171])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-5615d15fd35sm4368797e0c.19.2025.12.23.06.30.35
        for <linux-renesas-soc@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 23 Dec 2025 06:30:35 -0800 (PST)
Received: by mail-vk1-f171.google.com with SMTP id 71dfb90a1353d-55982d04792so3980505e0c.1
        for <linux-renesas-soc@vger.kernel.org>; Tue, 23 Dec 2025 06:30:35 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCXuBxsC0lnV6Ad2u7U9UXfszlZ8Ij2HApdjOEPa3KHBntvoX0XGDR9+alhhlQ2QFy8JKq0jWnAuPYQfxGAOIYXyyw==@vger.kernel.org
X-Received: by 2002:a05:6122:4f97:b0:557:c697:a30c with SMTP id
 71dfb90a1353d-5615be24746mr4492855e0c.15.1766500234851; Tue, 23 Dec 2025
 06:30:34 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20251201124911.572395-1-cosmin-gabriel.tanislav.xa@renesas.com>
 <20251201124911.572395-3-cosmin-gabriel.tanislav.xa@renesas.com>
 <CAMuHMdV=EW4YbEBiXH2p0SeC5Kw-YmYWuQwsudpGgM63pgqcfw@mail.gmail.com> <TYYPR01MB1395515AF65F8522AED6B591885B5A@TYYPR01MB13955.jpnprd01.prod.outlook.com>
In-Reply-To: <TYYPR01MB1395515AF65F8522AED6B591885B5A@TYYPR01MB13955.jpnprd01.prod.outlook.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Tue, 23 Dec 2025 15:30:23 +0100
X-Gmail-Original-Message-ID: <CAMuHMdU1+-o7AOjdJe7yCgU+4x3Kn6d8B5P-EWk6P5_qXsCOZg@mail.gmail.com>
X-Gm-Features: AQt7F2qE2AtxEG2BOxgdP_v34Yp6lChJ9ZLcTByA9b4yF0Q7ASGmqWvId4Nax_Q
Message-ID: <CAMuHMdU1+-o7AOjdJe7yCgU+4x3Kn6d8B5P-EWk6P5_qXsCOZg@mail.gmail.com>
Subject: Re: [PATCH v2 2/6] dmaengine: sh: rz_dmac: make register_dma_req() chip-specific
To: Cosmin-Gabriel Tanislav <cosmin-gabriel.tanislav.xa@renesas.com>
Cc: Vinod Koul <vkoul@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	"magnus.damm" <magnus.damm@gmail.com>, Fabrizio Castro <fabrizio.castro.jz@renesas.com>, 
	Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>, Johan Hovold <johan@kernel.org>, 
	Biju Das <biju.das.jz@bp.renesas.com>, 
	"dmaengine@vger.kernel.org" <dmaengine@vger.kernel.org>, 
	"devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, 
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, 
	"linux-renesas-soc@vger.kernel.org" <linux-renesas-soc@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"

Hi Cosmin,

On Tue, 23 Dec 2025 at 15:08, Cosmin-Gabriel Tanislav
<cosmin-gabriel.tanislav.xa@renesas.com> wrote:
> > From: Geert Uytterhoeven <geert@linux-m68k.org>
> > On Mon, 1 Dec 2025 at 13:52, Cosmin Tanislav
> > <cosmin-gabriel.tanislav.xa@renesas.com> wrote:
> > > The Renesas RZ/T2H (R9A09G077) and RZ/N2H (R9A09G087) SoCs use a
> > > completely different ICU unit compared to RZ/V2H, which requires a
> > > separate implementation.
> > >
> > > To prepare for adding support for these SoCs, add a chip-specific
> > > structure and put a pointer to the rzv2h_icu_register_dma_req() function
> > > in the .register_dma_req field of the chip-specific structure to allow
> > > for other implementations. Do the same for the default request value,
> > > RZV2H_ICU_DMAC_REQ_NO_DEFAULT.
> > >
> > > While at it, factor out the logic that calls .register_dma_req() or
> > > rz_dmac_set_dmars_register() into a separate function to remove some
> > > code duplication. Since the default values are different between the
> > > two, use -1 for designating that the default value should be used.
> > >
> > > Signed-off-by: Cosmin Tanislav <cosmin-gabriel.tanislav.xa@renesas.com>

> > > @@ -1067,9 +1068,18 @@ static void rz_dmac_remove(struct platform_device *pdev)
> > >         pm_runtime_disable(&pdev->dev);
> > >  }
> > >
> > > +static const struct rz_dmac_info rz_dmac_v2h_info = {
> > > +       .register_dma_req = rzv2h_icu_register_dma_req,
> > > +       .dma_req_no_default = RZV2H_ICU_DMAC_REQ_NO_DEFAULT,
> >
> > Since this is the only remaining user of RZV2H_ICU_DMAC_REQ_NO_DEFAULT,
> > and this structure does specify hardware, perhaps just hardcode 0x3ff?
>
> In my opinion we should let the macro live in the ICU header as the
> value is more tied to the ICU block than to the DMAC block, even if
> the DMAC driver is the only actual user. But if you think this is
> worth changing, I will change it.

I have no strong feelings about this.

If it is really more of an internal ICU thingy, an alternative would
be to remove all public *_ICU_DMAC_REQ_NO_DEFAULT definitions, and
just pass -1.  Then the ICU drivers become responsible for filling in
the appropriate default value.

> > > +};
> > > +
> > > +static const struct rz_dmac_info rz_dmac_common_info = {
> >
> > rz_dmac_classic_info, as this is not really common to all variants?
> > I am open for a different name ;-)
>
> rz_dmac_generic_info? I don't have a strong opinion, but I agree that
> common denotes that it would be shared across all variants, which is
> not the case.

Fine for me, too.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

