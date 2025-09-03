Return-Path: <linux-renesas-soc+bounces-21251-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 59D2AB41ADD
	for <lists+linux-renesas-soc@lfdr.de>; Wed,  3 Sep 2025 11:58:57 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 8730C681FC9
	for <lists+linux-renesas-soc@lfdr.de>; Wed,  3 Sep 2025 09:58:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 26A312EFDB1;
	Wed,  3 Sep 2025 09:56:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="X6YvxDXH"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3F9142E8B9F;
	Wed,  3 Sep 2025 09:56:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756893410; cv=none; b=jlzWSUVjYr8+PJcj6JJpTPfybsPwvDXH5L9ruhRM8S+bHdjSHOHc1NGdTygy6txJQk++7vXtINrGAk6XHrVESm6vY1CSgbx4quJQ9LYJGX0WKxIl69HK9954pjgWa+ojoT5cdlFYloCFARve065S3rBii6qxElXygMNoOLzvx2Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756893410; c=relaxed/simple;
	bh=CBkbAgCSIBtNmPrkKyufTZ+wJwvnVAL7IJT/lQYlQCk=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=gQvhyo9AyYAMrgNW14W77mKH4GHIky6Ggq9dp08I0dzmom0fZumYhiiDQfH63kRAQ/Y9KdSsMP6ofLFTNhzNQ6+i8GANr3zpws+AihDVsAmhKWNBmQQ2tW8WvMife1ZOnyfJC2xWyDUi+Peq/TBcfF0M0Jugoxo0oJNoHP3CyOo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=X6YvxDXH; arc=none smtp.client-ip=209.85.128.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-45b8b1a104cso30076025e9.2;
        Wed, 03 Sep 2025 02:56:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1756893406; x=1757498206; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=wRGL+yvGCt5Y/YQJFhgCAidgUtWHfFyrPOfmPr2jchE=;
        b=X6YvxDXHNpo3dRHmnX2/rPjRDJKC+CY6HUmeDIuCQf1GD678pUpw6sCi+0by+f/+Hh
         hL0+pK75UqGNHKhZWoz2t8ICUyf5zCt1D6hkgwm9l1FnmZOCB54l7dyCSUeaB2AM1HzX
         MZJjW0YcyRgvEMDZQCoEH6kkttOosCBf7DUOKx1oYvD/s8AGcbcs7PH3CvB94O48aily
         X2inf4OgCprD0ffmfBA6tjOFcfvYC5HVmVbHKojz1Gr3P9K4C1BD3bO3tDEYQ9qEbYPv
         tf5QdRmXHE2BbleT5+Ielb8B1MHtzKpOy0rclRKOvxUFSdbDT9WJP+jR/lnUss2lm8yA
         llmg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756893406; x=1757498206;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=wRGL+yvGCt5Y/YQJFhgCAidgUtWHfFyrPOfmPr2jchE=;
        b=L8euMQ4QJBClqFLlJ92kMoYzwHpIQUG9seOJXevjeHqFA+lbZT4Vdv9dkUdVFZmHTr
         gEwTOGTPtjaxZAzqrUVvjiMWOrm6I4rksFhnI5fQs96CdvS8CA6F+6zAO/BBADch5+mn
         5F/WWBIY8Yqzr2pit0+KI6akR/8Wz82N6sTz0zbUp/E0jyRI+UlhK07yLSl8QHaR974T
         dYSdj+vviSW+QOYSRlr1DI0MHcw0VaoWhFKYp96YHonGJalFRH/veSZbfVlhWT7Vhgz4
         gzmYtUzj2ldxqsVlGPW9Z9r3RmEQAHsvZVMxEVAkX/OLRxbf2tq5K7+zW/pQOlIyr78Z
         QksQ==
X-Forwarded-Encrypted: i=1; AJvYcCVfre1zirnjj0k4D2pFl4wlJgeRgLHUAlvZSglGEcH9+agmHBSLZ+ywX1gGeJO7jo7bkjAGA1V27hjB@vger.kernel.org, AJvYcCVxu/FWkXIxfU8iy/lOeH2R8je+5TJD6PbNFUl9hqn4V4DHK+gEe1KmyKkrUaFzHUaJWNd4G/Lj@vger.kernel.org, AJvYcCXWKfGuaVfewxu7VoYwm4CswBeDpAgu0qLNsi6//dZ6reZ/IlhGnovT3WcAqk8SHD97UPHeWO7HU4VwHIMwf4B2Eq8=@vger.kernel.org, AJvYcCXj+xg2sMDR99KbOXyAUKPhM3L68hYWX/JxFWR2zGbgHMcDZRZZmTXFNqDxr2Zir5nWb2OBz09NvWf5dr6t@vger.kernel.org
X-Gm-Message-State: AOJu0YxkvO2IVKKiiIM2XY0zp8y0Jd+ChccPWjoKGiHLI2XV0fx5UV2t
	R6+fss64Rl+h+7Yzy/Lbrc8ijGDGasiEFOn37KnBQ2BwD//zwzl19vEtTZAGgYffLfBwTzkqX1r
	MQUt75LJJr4P8g/SUGszn9HP7J+DZFR0=
X-Gm-Gg: ASbGncvZs5nyHz8LQF5UWyEZMCB1bC7Jf2j92gBfrgKxxmFoh+ELW+ZJUnuG4Rl5s5A
	qh4pZhnkkUnHGOroq7o5DyHjJ06vjP9fbiYfyaUurk5eG81vpssTGVu9vxgjm/c0zpibZwDZpy1
	yIATvUdRv/KKQJPVroBCsGc8dbzUUs2aecz70OZ3MrK26WMF1sjojbaUBJdT+6KKc+iVGAJdoEL
	vOkEY1qA+o8eEH3B9g=
X-Google-Smtp-Source: AGHT+IEQUqA1qdyBjSIqEH7yyO8Yto1g3IUsn6wF/lfNaBELqiermAkFpi4/ZOCBGDgVSpzOqFCGaE8gu4cJp0yyq2U=
X-Received: by 2002:a05:600c:8b17:b0:45b:8d61:9d02 with SMTP id
 5b1f17b1804b1-45b8e52fa48mr86888605e9.30.1756893406116; Wed, 03 Sep 2025
 02:56:46 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250902001302.3823418-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <20250902001302.3823418-3-prabhakar.mahadev-lad.rj@bp.renesas.com> <CAMuHMdU_BHtHznN8C7s0Yf=nxBaXb94MLFD-Pcz73W8hJhxc-w@mail.gmail.com>
In-Reply-To: <CAMuHMdU_BHtHznN8C7s0Yf=nxBaXb94MLFD-Pcz73W8hJhxc-w@mail.gmail.com>
From: "Lad, Prabhakar" <prabhakar.csengg@gmail.com>
Date: Wed, 3 Sep 2025 10:56:19 +0100
X-Gm-Features: Ac12FXzyrhXt8ty31ymC76K4PCsLmoMNIPvsEjNtyJoctbgrdUIEhn5oIWhc6mE
Message-ID: <CA+V-a8sUgu9YgtnkCYEzGtfH=2dQCyj9Q7Wu1+WaKrDWy3vjiw@mail.gmail.com>
Subject: Re: [PATCH net-next 2/4] dt-bindings: net: renesas,rzv2h-gbeth:
 Document Renesas RZ/T2H and RZ/N2H SoCs
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: Andrew Lunn <andrew+netdev@lunn.ch>, "David S. Miller" <davem@davemloft.net>, 
	Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Maxime Coquelin <mcoquelin.stm32@gmail.com>, Alexandre Torgue <alexandre.torgue@foss.st.com>, 
	Russell King <linux@armlinux.org.uk>, Giuseppe Cavallaro <peppe.cavallaro@st.com>, 
	Jose Abreu <joabreu@synopsys.com>, Philipp Zabel <p.zabel@pengutronix.de>, 
	Magnus Damm <magnus.damm@gmail.com>, linux-renesas-soc@vger.kernel.org, 
	netdev@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com, 
	linux-arm-kernel@lists.infradead.org, Biju Das <biju.das.jz@bp.renesas.com>, 
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>, 
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Geert,

Thank you for the review.

On Wed, Sep 3, 2025 at 10:09=E2=80=AFAM Geert Uytterhoeven <geert@linux-m68=
k.org> wrote:
>
> Hi Prabhakar,
>
> Thanks for your patch!
>
> On Tue, 2 Sept 2025 at 02:13, Prabhakar <prabhakar.csengg@gmail.com> wrot=
e:
> > From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> >
> > Document the Ethernet MAC (GMAC) IP present on the Renesas RZ/T2H
> > (R9A09G077) and RZ/N2H (R9A09G087) SoCs. The GMAC IP on RZ/N2H is
> > identical to that found on the RZ/T2H SoC.
> >
> > While the RZ/V2H(P), RZ/T2H, and RZ/N2H SoCs all integrate the Synopsys
> > DesignWare MAC (version 5.20), the hardware is synthesized with differe=
nt
> > options compared to the RZ/V2H(P):
> >   - RZ/T2H requires only 3 clocks instead of 7
> >   - RZ/T2H supports 8 RX/TX queue pairs instead of 4
> >   - RZ/T2H needs 2 reset controls with reset-names property, vs. a sing=
le
> >     unnamed reset
> >   - RZ/T2H has the split header feature enabled, while it is disabled o=
n
> >     RZ/V2H(P)
> >
> > To accommodate these differences, introduce a new generic compatible
> > string `renesas,rzt2h-gbeth`, used as a fallback for both RZ/T2H and
> > RZ/N2H SoCs.
>
> Until now, we didn't have any family-specific "renesas,rzt2h-*"
> compatible values.  Instead, we always used " renesas,r9a09g077-<foo>"
> as a fallback for "renesas,r9a09g087-<foo>".
> Is there any good reason to start deviating from this?
>
Right, I missed that! I 'll switch back to the previous approach.

Cheers,
Prabhakar

