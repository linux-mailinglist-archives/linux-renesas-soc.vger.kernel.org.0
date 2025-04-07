Return-Path: <linux-renesas-soc+bounces-15517-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id D6A4BA7E976
	for <lists+linux-renesas-soc@lfdr.de>; Mon,  7 Apr 2025 20:10:19 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 721EE188D2F7
	for <lists+linux-renesas-soc@lfdr.de>; Mon,  7 Apr 2025 18:09:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4391621ABAC;
	Mon,  7 Apr 2025 18:08:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Hyy16AvU"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-vk1-f178.google.com (mail-vk1-f178.google.com [209.85.221.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 80C3E21ABA5;
	Mon,  7 Apr 2025 18:08:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744049298; cv=none; b=jyPEQbwgKjBlwmb3CTzsgfVvSH7q6tYydYsXSyKxxoNqAbznUjMhqDU3jB6UEzxRgYsRZFmEevKFB/GIR3vvunXTca10gTXjRgzSsl4/akDPLFYuU80kxBYjXiWKPDxotXOf8vc8ko8q15RP9rcFJjl5E1+QgBTXtIns7dGaf1k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744049298; c=relaxed/simple;
	bh=zppETyWlX1xNN0UfvJJbIMgschxxq5W1Ofqr3d0nTg0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=eNKFgjHU1ye/KzhdqH+/v7AH4ifp0V3N8X3S9UOj1rEWkr+tJ48LDcJI/rNxucGA6ovpWAeFV0YfwXCT01h1QyO/lq1cSYldKl7PB5FL/xQRpW6nbBo5ZM1NGZRjoNUKwQeDkGusZEcfumhoDxuV73mHUunUizSdEplQBTcRIQQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Hyy16AvU; arc=none smtp.client-ip=209.85.221.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vk1-f178.google.com with SMTP id 71dfb90a1353d-52617ceae0dso1510383e0c.0;
        Mon, 07 Apr 2025 11:08:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1744049295; x=1744654095; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=jUuYsrCNZuom26Ku72dSBPeeyC8punlJl9ufLVLiqm4=;
        b=Hyy16AvUUxNdjxie6HwpuoyqWdGa6x6rVCUZdPYusm36/eSAlSm7RH3m5cPvcgfOfI
         ryAZy3VpnhWo4WZf1Sc68+2o/HRMej+01ajPqpgT0Vf3GZBWgVEUsVBTwMWTCcwJfGb7
         +womiQRQJifSgdJUp4Co03sV2M2qEcwE+y29EpBPUhC2p8sxEdPmbokFE9mJxKzg8a3J
         Q+2S9jSOV5O0sxTYMK/2EAw/Pes1EweMMBSa/MbzdioyuQzQMgLdy4qLL3Fmgf+6A6pR
         P8E43Ki0PQ+QBxqY0zdEB0yr70xACV2yYwPYP2Vq+I9h6c9DO25EwcQcgoND5Sp5ZEZq
         Xw/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744049295; x=1744654095;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=jUuYsrCNZuom26Ku72dSBPeeyC8punlJl9ufLVLiqm4=;
        b=PSjpmu+P2EMo6mQ0488v7cU/It1Pq0CVdNQ8qn35jdLS/TjK4XZlvfQUCE0y7nhd+j
         9/Hq0M2pNZMyn9xW6SXua4CapwRThmrqKiFdBpf1zWB+MH4e6zFdvWqOVZ3TXjx/tYC5
         HmiwzIBOMNqjCyDExb37XF40rX+jiwDjb6L/KiePHQEdJ90zpHAzPDtCxCL0dMyByymC
         5farixpcRMJvtz6vnSI8wbHFfZ8Pi4q7hiX1QtHOTnquhkxjo8iMKqhrCAQefm32gSXW
         woSK9EvO6kG7Zm3QaZtFiHkArURk/DdgFujalqgCC7M02d/jTqeLU+JiHAau2UfDSgBE
         SX8g==
X-Forwarded-Encrypted: i=1; AJvYcCVSMGXb03Tlw9TghAeM4wGBiMlv8/CG76BD7xbvUG34CWm29hrrT+ka7LHu6iFxyKHrJCpxhXfV@vger.kernel.org, AJvYcCW5YbdiVCfxpYTpzC2+a//y8UlEjKadTQ4Knuthh9Z/RrFkgaBai1lxTLJ1ICezU9oluF3DoYW9l1PgkJKY@vger.kernel.org, AJvYcCWkUAjmH0fBMvI+MbFdGjhgQMZcxEeKI/JZ8Qyf/VrqAD3t5Ojce7SIPEDYgMOXTlOUWM0xyS9gvNulz/ztOC/uViE=@vger.kernel.org, AJvYcCX6wbBRndkRNeRPiNGdNaOOV0w7NyiifBNN6Xm/Q6mhQmmzFR5QdI6FQKcY21Y55hYWDKR1TIKBxHm5@vger.kernel.org
X-Gm-Message-State: AOJu0YyYKcew5zV7pkMid/bdoHOCkeFijS8jGZtmdYt/DhknI6KiApgc
	lK7eWT0rXUeCEa8B1YVBrd1BcYqzpju+SvtZE4BpEEEhhrTfCsF2itC/3p2ARzxj0EPCyuBPj+j
	NSORhIgjv++1bNrMM4ZROVLOPbMo=
X-Gm-Gg: ASbGncv5WKvQyas9K+vD0qp4+1awTT1HAC+QzrtAZJWfZG9luV8K1zSgYq007rDxQcz
	9ysgk/jFB67keCgmqA0sOBLZUsQcQwTLThdrky3lrmjiEpPBQXRXjfHq4Q3OVtcc2VR2ZnpAy77
	VQGZ0UOtQ/X4M2xtSXfX5nvMJGbbgNAKaZCGkxVLogLhlfNEqFw4CyZEIBk/4=
X-Google-Smtp-Source: AGHT+IEN6rDHodvyUoowo8BFuQsI+M3qkHprXMun6ue2nFvUns/xZBc98c1/xylp9Sz4+dM00gUNYRdzmCwmGkE0JHw=
X-Received: by 2002:a05:6122:16a6:b0:526:1ddd:8953 with SMTP id
 71dfb90a1353d-527642e498emr8513099e0c.0.1744049295202; Mon, 07 Apr 2025
 11:08:15 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250407120317.127056-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <20250407120317.127056-4-prabhakar.mahadev-lad.rj@bp.renesas.com> <Z_QSHpvSK7I--xPq@shell.armlinux.org.uk>
In-Reply-To: <Z_QSHpvSK7I--xPq@shell.armlinux.org.uk>
From: "Lad, Prabhakar" <prabhakar.csengg@gmail.com>
Date: Mon, 7 Apr 2025 19:07:49 +0100
X-Gm-Features: ATxdqUGJm_OgZHRFfu9Amyd2UVOtmAsyuknbI3Y7Xd-HEEICL3GbzjhydkDONtY
Message-ID: <CA+V-a8vgavmN7c9KYjc-3tm-9GC1_aVUkF-dF=Ws9axTBmSa5g@mail.gmail.com>
Subject: Re: [PATCH net-next v5 3/3] net: stmmac: Add DWMAC glue layer for
 Renesas GBETH
To: "Russell King (Oracle)" <linux@armlinux.org.uk>
Cc: Andrew Lunn <andrew+netdev@lunn.ch>, "David S. Miller" <davem@davemloft.net>, 
	Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Maxime Coquelin <mcoquelin.stm32@gmail.com>, Alexandre Torgue <alexandre.torgue@foss.st.com>, 
	Richard Cochran <richardcochran@gmail.com>, Philipp Zabel <p.zabel@pengutronix.de>, 
	Geert Uytterhoeven <geert+renesas@glider.be>, Magnus Damm <magnus.damm@gmail.com>, 
	Giuseppe Cavallaro <peppe.cavallaro@st.com>, Jose Abreu <joabreu@synopsys.com>, netdev@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-stm32@st-md-mailman.stormreply.com, 
	linux-arm-kernel@lists.infradead.org, linux-renesas-soc@vger.kernel.org, 
	Biju Das <biju.das.jz@bp.renesas.com>, 
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>, 
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Apr 7, 2025 at 6:58=E2=80=AFPM Russell King (Oracle)
<linux@armlinux.org.uk> wrote:
>
> On Mon, Apr 07, 2025 at 01:03:17PM +0100, Prabhakar wrote:
> > +static struct clk *renesas_gbeth_find_clk(struct plat_stmmacenet_data =
*plat_dat,
> > +                                       const char *name)
> > +{
> > +     for (unsigned int i =3D 0; i < plat_dat->num_clks; i++)
> > +             if (!strcmp(plat_dat->clks[i].id, name))
> > +                     return plat_dat->clks[i].clk;
> > +
> > +     return NULL;
> > +}
>
> In addition to Jakub's request, I'll ask that you hold off for a week
> because I have the following that I'd like to submit:
>
Ack, please add me in Cc while you post this patch.

Cheers,
Prabhakar

> bbc73b8b6dfd net: stmmac: provide stmmac_pltfr_find_clk()
>
> diff --git a/drivers/net/ethernet/stmicro/stmmac/stmmac_platform.c b/driv=
ers/net/ethernet/stmicro/stmmac/stmmac_platform.c
> index c73eff6a56b8..43c869f64c39 100644
> --- a/drivers/net/ethernet/stmicro/stmmac/stmmac_platform.c
> +++ b/drivers/net/ethernet/stmicro/stmmac/stmmac_platform.c
> @@ -709,6 +709,17 @@ devm_stmmac_probe_config_dt(struct platform_device *=
pdev, u8 *mac)
>  #endif /* CONFIG_OF */
>  EXPORT_SYMBOL_GPL(devm_stmmac_probe_config_dt);
>
> +struct clk *stmmac_pltfr_find_clk(struct plat_stmmacenet_data *plat_dat,
> +                                 const char *name)
> +{
> +       for (int i =3D 0; i < plat_dat->num_clks; i++)
> +               if (strcmp(plat_dat->clks[i].id, name) =3D=3D 0)
> +                       return plat_dat->clks[i].clk;
> +
> +       return NULL;
> +}
> +EXPORT_SYMBOL_GPL(stmmac_pltfr_find_clk);
> +
> ...
>
> which will avoid glue drivers duplicating this functionality. This will
> be part of the first sets of patches I'm going to be submitting.
>
> Thanks.
>
> --
> RMK's Patch system: https://www.armlinux.org.uk/developer/patches/
> FTTP is here! 80Mbps down 10Mbps up. Decent connectivity at last!

