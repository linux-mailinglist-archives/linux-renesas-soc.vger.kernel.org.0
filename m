Return-Path: <linux-renesas-soc+bounces-33333-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id cF7kGg1fGWpevwgAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-33333-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 29 May 2026 11:40:29 +0200
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id B3A8460010B
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 29 May 2026 11:40:27 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id A17253012C52
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 29 May 2026 09:37:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B89D53BED23;
	Fri, 29 May 2026 09:37:27 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-ua1-f49.google.com (mail-ua1-f49.google.com [209.85.222.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1D02E3BE65C
	for <linux-renesas-soc@vger.kernel.org>; Fri, 29 May 2026 09:37:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780047447; cv=none; b=GIF2FmcCUJv7r274kuE3YeDGUX7KM5IYsAS2JF3rWxxCZ6q7n0rdMle2fMF/TVlBhaAcfuF+mUsb/gCvquzhS/K2ZcbWLqAFu4wFZTt/EyiSXowsbpcCcRmiXxuREHaKZlxw4Q0KdvAJf2fBMrNRuSQp5aijyjxUdI+q/EQKJnc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780047447; c=relaxed/simple;
	bh=NjzYKxCVB3Ww0ir8y3x71SbSculisswHBsyqeOeMk7Y=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=K/7SSuM59O3VQ0o5gSFdzmLpVUJ+U0XO+nz+L04KOJAGmLNdCPPrRsEnMvTj5ILTfAVqmFPzIukmKQz3f+lV/IvJM8LAgySox04/Od58b9TjNmZW6B29Jdim49Xhf2lhJH0v+c1F/fYH2HB0pdsxrWe2+w1RvYtDhlwbMsoHl/c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.222.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ua1-f49.google.com with SMTP id a1e0cc1a2514c-9617940274bso2563521241.0
        for <linux-renesas-soc@vger.kernel.org>; Fri, 29 May 2026 02:37:23 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780047443; x=1780652243;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=O+d8LWmU67MgBeJBnGb9TH5zr/45ZW+LhVoWp74Yl0Q=;
        b=b7D0J50NqmTgB3G3QBVsQBNKNMk9eDJ0O4C16N+r8ZvWRGzkutuA/Bu202KOzOJTQd
         qfs/XyGaV2dZLZH4vgxge9Q8xas+p9Cn5BiT1l5N2xLZcpVPwKUiSx10JMtabXstTgZ5
         JCVhhu6IIoogkv2ZhADPtlRVPAzM+CXzXRWGnwMJOKgtaOQxuNNJazlr83gA9bhpOMI8
         x/XRULPF0qC0Vh8xe0EyXkaCV/+HZHpQI3YjSFgCcVsQNeYLcN2Dpm9KTNtlBWz3toXk
         ovBcZIzCVJJbT8TvGm4+L03REhOhgEnKjKqtk/ZKGtjj6ST1cKEuy2HBIMTR2CRqaLDB
         vHvQ==
X-Forwarded-Encrypted: i=1; AFNElJ9L7QrWFx/FSvqufOH19eL4I+Zre3ZhteO3bbKGQDI05bnYmvozbQBSWOSBs0m5L9VK8O7fKUo5tjCjmlvuISueVA==@vger.kernel.org
X-Gm-Message-State: AOJu0YxxrhewfUOjcnJKcE/ygAsqABA2H54ODPV0q4zOH/UnpWIOcYZs
	aFmb/GOPw3D1M5h2aS4TnAdU0PHQC1do0dxtQaKEjbgyjiEvyIWjjJNzybmCkTRZC4E=
X-Gm-Gg: Acq92OGA3jCO01U1Yxe+0aN2tHamk56NUghTi22GwINgE4dUuAOW56VwU7SV7cJeoGZ
	hYOw+TOeuFNNnpD3TJ8iNjBkJC7lCdIZG5MVh5us6ShXS5uHVMJXpbDnTyPEk39eG91aSW5VJXR
	jAF9WfYFqGcgsl1J0JaMnYtA2Na/KdOR3m5/1fuNwhCIUT1WpeY0n98AqN3Vu+zx6UfLJg3kueU
	ztTehNKnMIPBLl2W21XAEsY9xwlWIWsjY3n+ky25BrtD50Tf+FB72gQEpn0k7M7W1VD4fMHUz9V
	ub9W8hBc8heW0rZnFxd/CgTTTNoZwUvWPO03I+XGDv4dvSriLo3Q4eVd5F8f3PxyQ5Teb6Iftrp
	utS25ueUeR1Vou1kvwR6bCydIreUtE6WtO1Ih1pf1/T/Wm2EZ61e7alcg1DAHf4w++qRd5NpXV+
	bpP4y2mhg98KONi1z94FZXUDgV9rztx2ZopJXLCHnpbnO7TcIFGqR0SKTgZ8u5V2qNwwv4j7g=
X-Received: by 2002:a05:6102:688f:b0:6ae:dfe4:37e2 with SMTP id ada2fe7eead31-6bf3b0358b6mr650421137.17.1780047442674;
        Fri, 29 May 2026 02:37:22 -0700 (PDT)
Received: from mail-vs1-f49.google.com (mail-vs1-f49.google.com. [209.85.217.49])
        by smtp.gmail.com with ESMTPSA id a1e0cc1a2514c-963aba5f57csm571672241.4.2026.05.29.02.37.21
        for <linux-renesas-soc@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 29 May 2026 02:37:21 -0700 (PDT)
Received: by mail-vs1-f49.google.com with SMTP id ada2fe7eead31-63319183a49so5243702137.2
        for <linux-renesas-soc@vger.kernel.org>; Fri, 29 May 2026 02:37:21 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AFNElJ8QzrM2EBVboabMMb/7ta6rEpm5YXI9FOgxb06+Ffr8DGs0TRSb5v8EAWYvsS8QXchdxU3eXvIzAXPLBq4wuAtFhg==@vger.kernel.org
X-Received: by 2002:a05:6102:f9a:b0:631:e729:4575 with SMTP id
 ada2fe7eead31-6bf2d11021dmr630800137.5.1780047440701; Fri, 29 May 2026
 02:37:20 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260519111958.233194-1-biju.das.jz@bp.renesas.com>
 <20260519111958.233194-2-biju.das.jz@bp.renesas.com> <TY3PR01MB11346184DFE4986B5728406FD860D2@TY3PR01MB11346.jpnprd01.prod.outlook.com>
In-Reply-To: <TY3PR01MB11346184DFE4986B5728406FD860D2@TY3PR01MB11346.jpnprd01.prod.outlook.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Fri, 29 May 2026 11:37:09 +0200
X-Gmail-Original-Message-ID: <CAMuHMdVn4RHz7yf+kVXuLcz5ZNrhmJhoJ74BvY8mhDN8rik02w@mail.gmail.com>
X-Gm-Features: AVHnY4L0pu59j5vGR-f9mTsACKK13343vKlhDjyJoO21Kuxw6AQmS493XBXp4Eo
Message-ID: <CAMuHMdVn4RHz7yf+kVXuLcz5ZNrhmJhoJ74BvY8mhDN8rik02w@mail.gmail.com>
Subject: Re: [PATCH 1/2] arm64: dts: renesas: r9a08g046: Add RSPI{0..2} nodes
To: Biju Das <biju.das.jz@bp.renesas.com>
Cc: "biju.das.au" <biju.das.au@gmail.com>, "magnus.damm" <magnus.damm@gmail.com>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	"linux-renesas-soc@vger.kernel.org" <linux-renesas-soc@vger.kernel.org>, 
	"devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, 
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, 
	Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>
Content-Type: text/plain; charset="UTF-8"
X-Spamd-Result: default: False [-1.46 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FREEMAIL_CC(0.00)[gmail.com,kernel.org,vger.kernel.org,bp.renesas.com];
	TAGGED_FROM(0.00)[bounces-33333-lists,linux-renesas-soc=lfdr.de];
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
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	NEURAL_HAM(-0.00)[-0.998];
	RCPT_COUNT_SEVEN(0.00)[10];
	R_DKIM_NA(0.00)[];
	TAGGED_RCPT(0.00)[linux-renesas-soc,dt];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,mail.gmail.com:mid,linux-m68k.org:email,renesas.com:email,glider.be:email,100b0000:email]
X-Rspamd-Queue-Id: B3A8460010B
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Hi Biju,

On Sun, 24 May 2026 at 16:28, Biju Das <biju.das.jz@bp.renesas.com> wrote:
> > From: Biju Das <biju.das.jz@bp.renesas.com>
> >
> > Add device tree nodes for the three RSPI channels on the RZ/G3L
> > (R9A08G046) SoC.
> >
> > Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>

Thanks for your patch!

> > --- a/arch/arm64/boot/dts/renesas/r9a08g046.dtsi
> > +++ b/arch/arm64/boot/dts/renesas/r9a08g046.dtsi
> > @@ -442,6 +442,78 @@ rsci3: serial@100f3000 {
> >                       status = "disabled";
> >               };
> >
> > +             rspi0: spi@100b0000 {
> > +                     compatible = "renesas,r9a08g046-rspi";
> > +                     reg = <0 0x100b0000 0 0x400>;
>
> The size is 4K, so it should be 0x1000, same for othe nodes.

4K is rather cold ;-)

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
i.e. will queue in renesas-devel for v7.2, with the above fixed.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

