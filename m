Return-Path: <linux-renesas-soc+bounces-25066-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [213.196.21.55])
	by mail.lfdr.de (Postfix) with ESMTPS id A9E83C80982
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 24 Nov 2025 13:54:01 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id 776123477CD
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 24 Nov 2025 12:53:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D4A212FD675;
	Mon, 24 Nov 2025 12:51:52 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-qt1-f169.google.com (mail-qt1-f169.google.com [209.85.160.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 274B24414
	for <linux-renesas-soc@vger.kernel.org>; Mon, 24 Nov 2025 12:51:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763988712; cv=none; b=FOjmzTBpUlCCwVPwnNu1Czh74qU2uTmje9lPjbmVXS60TbuuGao9H23+/7S8ygjE/dZHi9SoN94ycZqiJ1VSQxjYWJdULWfLvrhQMVp31NQG3UoOp3tS4x2LTfe33RiQn19OeyIxh3sye3rcF6DbU3/U4rs8NMEdrzJP2PMs9Eg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763988712; c=relaxed/simple;
	bh=6ikZIvAH9OCQ6Wns4/V7XjJocQUcbG50xgS5dfJhh50=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=qIrpa+wdP/+2Q76C/7mnG+9vkewDsL6r4FMjT13CRmHegKwWKyx2TPREyu3nlpwWTFKOb6XYt2nAPo75TRhhxHPhheGmTtbaJtfuX/2siOsn0sfqASQ+BKaFYwypIT5JqIbNXHk1CKUWQf8ZXhir/jbR3tMoC6xaMw0P+j+Qv/w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.160.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-qt1-f169.google.com with SMTP id d75a77b69052e-4ed82ee9e57so63850911cf.0
        for <linux-renesas-soc@vger.kernel.org>; Mon, 24 Nov 2025 04:51:50 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763988710; x=1764593510;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=OD+BMZYNAgwSb9OdW8YWeL8m3yDdVApXfLl44Yo7CPA=;
        b=UDrIr9MWaJkZMa4Low5FmshWVqqsGj4lLF++KulhbODqIFvCfF5uxkg/fNJx8qfo0F
         LWAgqXvaF0nHMydaHUVTuNObwkeNYsMu/59ZUf+t0m/HoGjjfsVOT61E3nMdVGCn1OOO
         OO8avHSFFyLfE+qSHxll0YW5TjO1+Uy7XPitcTTCoBQjX3JlK2FYUbrfNd5OC7EBfC5d
         bACpucr8K8ex9jYRMW12TZARybsLuYkvll60r6bjBLpaR9BXstq4CX3n8GoOiYlKawfv
         YZqlFnQTXtxAo/ADy0UQvynI/XmXrV80uoi+Ho/HZMFeWpTR0gaNp5ZTHLPmAKzXKz6k
         AWWA==
X-Forwarded-Encrypted: i=1; AJvYcCVp5JTWdTFDKqq9elrVJ/MQza111NnkPHEfIxPsEH+Tq18i1IjqclUr6puLcYM6TLedM38r3BDOo1UMmjLDQ4XkRg==@vger.kernel.org
X-Gm-Message-State: AOJu0Ywm+p591aNCiYz9fpQxybMEyMAIjiuK55PpWhKVNWxyp4L5OZIS
	V+2/nfdhCJEXzLkJWUxVftbqlBnAXRAIprOP39Ky40AnwK5KUDypzr8PP3cgk+MS
X-Gm-Gg: ASbGncsPEHyvMkn/jcMTJeZe2QQRHwmKVcBF8HHf5H7W0OCyrkftPP+/nSWJq3C/eId
	QfIbEABZbu592uVxagMKIxHj148CEQwiic2ajMIyS89SbDq3JJm453V92yuiC36r+yxUh58xCTa
	RaA1EdhbV33FyQYXZKVgekjry3Y6ZXN9m431OHu7apTtLyubKdJfvzpkCtrh4gD+rvCBHEaJEpM
	p6y6+Av0Wz3uheNuKuuDbpyoGIldcW5JKDMPhOw1W5OPcQjktFcUKmbgEpwmf2O2WLDcagZVFP4
	W3aPbN3QmCZNDQkFLVQWMIPsYyTaXEwZvZSvUQHV3ew3VPQYS7r2T55wrPQeERw5mjNxuDS8xlx
	rERgWbqUHKsyQ/txDvXolOnULedWFfiBEvsIj4tfALi6tiz9iQUtPB2F5gBb+BSRZXyKmG5XkZo
	90C1q0IjgYK7S/5ZUoctwkTHLAjuek4BZPPMRkHU/iaZfdhM0IwpRx
X-Google-Smtp-Source: AGHT+IGGcASJrPX4H/RkEbS98I9gRSj9HSzw22TrHkP/C1I6wMBLPw0Yv1lHRCqpJUh9pLS9RquK0A==
X-Received: by 2002:ac8:5805:0:b0:4ee:24e8:c9ae with SMTP id d75a77b69052e-4ee58ad4c73mr176603091cf.53.1763988709912;
        Mon, 24 Nov 2025 04:51:49 -0800 (PST)
Received: from mail-qt1-f181.google.com (mail-qt1-f181.google.com. [209.85.160.181])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-4ee48d396b2sm87749431cf.5.2025.11.24.04.51.49
        for <linux-renesas-soc@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 24 Nov 2025 04:51:49 -0800 (PST)
Received: by mail-qt1-f181.google.com with SMTP id d75a77b69052e-4edaf8773c4so49705921cf.1
        for <linux-renesas-soc@vger.kernel.org>; Mon, 24 Nov 2025 04:51:49 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCUNKi3P2GMPG4gHH1jhbyeoY2flSbD/87RtmCKXAfczKdNfSNTvSKf1q11D2/Dx2jDsZX/j4rKPP3oAmggVYldLsQ==@vger.kernel.org
X-Received: by 2002:a05:6102:3594:b0:5db:23d0:65e7 with SMTP id
 ada2fe7eead31-5e1de3b25d5mr3839254137.27.1763988343849; Mon, 24 Nov 2025
 04:45:43 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20251121113553.2955854-1-prabhakar.mahadev-lad.rj@bp.renesas.com> <20251121113553.2955854-7-prabhakar.mahadev-lad.rj@bp.renesas.com>
In-Reply-To: <20251121113553.2955854-7-prabhakar.mahadev-lad.rj@bp.renesas.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Mon, 24 Nov 2025 13:45:32 +0100
X-Gmail-Original-Message-ID: <CAMuHMdXrkt0MXOBSvpdJwNVmGrnmt03mSGqj7EhqF16tf4i5Pg@mail.gmail.com>
X-Gm-Features: AWmQ_bkVR2IR-2-tuIChhhpMAiosiEEmcPQoTdpPEz707calSo8UIsTYAGe2Ino
Message-ID: <CAMuHMdXrkt0MXOBSvpdJwNVmGrnmt03mSGqj7EhqF16tf4i5Pg@mail.gmail.com>
Subject: Re: [PATCH net-next 06/11] net: dsa: rzn1-a5psw: Add support for
 optional timestamp clock
To: Prabhakar <prabhakar.csengg@gmail.com>
Cc: =?UTF-8?B?Q2zDqW1lbnQgTMOpZ2Vy?= <clement.leger@bootlin.com>, 
	Andrew Lunn <andrew@lunn.ch>, Vladimir Oltean <olteanv@gmail.com>, 
	"David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, 
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Simon Horman <horms@kernel.org>, Philipp Zabel <p.zabel@pengutronix.de>, 
	Russell King <linux@armlinux.org.uk>, Magnus Damm <magnus.damm@gmail.com>, 
	linux-renesas-soc@vger.kernel.org, netdev@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Biju Das <biju.das.jz@bp.renesas.com>, 
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>, 
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Content-Type: text/plain; charset="UTF-8"

Hi Prabhakar,

On Fri, 21 Nov 2025 at 12:36, Prabhakar <prabhakar.csengg@gmail.com> wrote:
> From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
>
> Add support for an optional "ts" (timestamp) clock to the RZN1 A5PSW
> driver. Some SoC variants provide a dedicated clock source for
> timestamping or time synchronization features within the Ethernet
> switch IP.
>
> Request and enable this clock during probe if defined in the device tree.
> If the clock is not present, the driver continues to operate normally.
>
> This change prepares the driver for Renesas RZ/T2H and RZ/N2H SoCs, where
> the Ethernet switch includes a timestamp clock input.
>
> Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>

Thanks for your patch!


> --- a/drivers/net/dsa/rzn1_a5psw.c
> +++ b/drivers/net/dsa/rzn1_a5psw.c
> @@ -1243,6 +1243,13 @@ static int a5psw_probe(struct platform_device *pdev)
>                 goto free_pcs;
>         }
>
> +       a5psw->ts = devm_clk_get_optional_enabled(dev, "ts");
> +       if (IS_ERR(a5psw->ts)) {
> +               dev_err(dev, "failed get ts clock\n");

I think the error can be -EPROBE_DEFER, so this should use
dev_err_probe() instead. Same for the existing calls.

> +               ret = PTR_ERR(a5psw->ts);
> +               goto free_pcs;
> +       }
> +
>         reset = devm_reset_control_get_optional_exclusive_deasserted(dev, NULL);
>         if (IS_ERR(reset)) {
>                 ret = PTR_ERR(reset);

> --- a/drivers/net/dsa/rzn1_a5psw.h
> +++ b/drivers/net/dsa/rzn1_a5psw.h
> @@ -236,6 +236,7 @@ union lk_data {
>   * @base: Base address of the switch
>   * @hclk: hclk_switch clock
>   * @clk: clk_switch clock
> + * @ts: Timestamp clock
>   * @dev: Device associated to the switch
>   * @mii_bus: MDIO bus struct
>   * @mdio_freq: MDIO bus frequency requested
> @@ -251,6 +252,7 @@ struct a5psw {
>         void __iomem *base;
>         struct clk *hclk;
>         struct clk *clk;
> +       struct clk *ts;

"ts" is only used inside a5psw_probe(), so it can be a local variable.

>         struct device *dev;
>         struct mii_bus  *mii_bus;
>         struct phylink_pcs *pcs[A5PSW_PORTS_NUM - 1];

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

