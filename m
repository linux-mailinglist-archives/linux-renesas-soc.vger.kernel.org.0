Return-Path: <linux-renesas-soc+bounces-17611-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 87500AC689F
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 28 May 2025 13:51:07 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id E83C33AFE0B
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 28 May 2025 11:50:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4C2F3283C92;
	Wed, 28 May 2025 11:50:55 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-ua1-f50.google.com (mail-ua1-f50.google.com [209.85.222.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 43BDA1C54A2;
	Wed, 28 May 2025 11:50:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748433055; cv=none; b=Zf1SAP2bp/D7CVL9aN/YfpbWobf1cuEorFLBldB92xKtjrV+5kDvoUlOtb1LUZyH99Erb0sBHa87q/JHmlUpHiBpkzfAvxCw3GfGK2PEibG3J3BxR8BcoG7h+U/bL3cSt0XxP+VU3iyr65kWpR2lopVYy1r+ZAQGQLnuXYd6E70=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748433055; c=relaxed/simple;
	bh=jnBA2vy6brg7qcYWAqNXi9fDqoOzyQWhlaWks6xrX+o=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=CcCYM/i2KDZjP4h13CHJ0GrOX3WP0PDQINrMffacxRDq88wlHKJuXjoG0WW4G79VRKJQl1auYFpIiJ1ciZIvNztgTBDdZnX0rEmSTP90DIzyfrBvsOa0JW69cN8FfRgLeKNsd7rl/tXaTpFz8OmJocXoqnl76w14W0zGulagpxk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.222.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ua1-f50.google.com with SMTP id a1e0cc1a2514c-87ded9c6eb4so516744241.0;
        Wed, 28 May 2025 04:50:52 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748433052; x=1749037852;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=qi3vD3S+nX/QcexFRov6QeC8OODrBI1qA67zGZMFfDM=;
        b=NIBZGFP/sr1yTPkhK+qbb+McT9dLvfPyt2QConmHkcrgI5qO9K0DcMuzBxbbS1zhRd
         7feLo6E8+5CWhfSUjf60jOD0tSuwm1ivbwyTK0E6qOmtU2koA4QNz/0+3IFYIQyMLPpf
         5a9/m7U/QRpOOJdvAfTGCBfBVJhkS6w2AZ696HhB+DRSetLzqXXVeVW7MyF+ps9gNdLE
         NBacGCNVEAxM7NDIejRGednrUtxCa9PhDGz9e+/eQeVH/s4JifaGJkeVjuTr5mlnaV5f
         tjDpLnZmrX91JlDhYOipnchS92y+hxRM0gMhSoBqr0L8WERfpdQKzzO4Pa18ShYNUSdF
         VrPQ==
X-Forwarded-Encrypted: i=1; AJvYcCU1Zv6EtTnHgB6Pv0pJ1ghP8uWgXXhPctfe9CUCM//zBvozIdqWsd2uLoMamYD0VVQ3GG1LFIM8wz8TEKwg@vger.kernel.org, AJvYcCVRztj4njCBF1HG+a8qy2RVikol9dPLPPAKOFdP/1olmuBZ6/kx/0F3FbPGTUGX/xyS6jyVBtXWSg7y24WRpJj5mdE=@vger.kernel.org, AJvYcCVW5XSJhVH20sQSXX8CPemKBqZAwFOJHt4jCxpCujTHSHSH9YymFBwie+XI4Xz6B1JW4lY0sDXMKHbY@vger.kernel.org
X-Gm-Message-State: AOJu0YxZ8XFYZPfFxjx4Ext2PE435owhiXIFhWIdTLQ7o83BzxuMZKyB
	GOgXSTC/BVpUIGKaz4t8a7gTljDH8ojMRxV+Hr7JeBltdE0xMQ4s0p5ONovnrsGE
X-Gm-Gg: ASbGnctZyeNgJB8HhalDyAH/X5Yo5BBAGeY2TRzrqkfjCc9P7HkOvqC7ew+YqO9H+pK
	aWdYCgeFqE7Ref6L21E+lsErRwz+oM5uwNIL3ftLZaia73T+iK+B1KZ6r6UyEoMY5BW/6VGFcpZ
	iD6mKKF7QxNWWH5Hbgl1CnWP3MWSFa5DoAOjbu3qqpTDLx39WxGkCvKd+wXTUZaMUQxBxAK6RwO
	EAxTxb44eP5womgcrZZFO326RBg6itk4y5UNue8/LPobSU47NoDvMgew2oSoT66QZAImK1rwmGD
	zktPAv7hHdJqb0T2I6EGLi535VTndtVz6thYIfM5IwVdsA6KbzQUPqpLfIp4wCIqDEutN+6Fy72
	oJAlUx2TD2Lqn2Q==
X-Google-Smtp-Source: AGHT+IFTOsiA6XhyKtFAciT0iUMbIRg2b8jyHZ1IEMyPaiKKYUHSkv18sy/tnHwCyz/dHqT76IVrWw==
X-Received: by 2002:a67:f288:0:b0:4e1:5132:67c9 with SMTP id ada2fe7eead31-4e597961feamr2712050137.0.1748433051758;
        Wed, 28 May 2025 04:50:51 -0700 (PDT)
Received: from mail-ua1-f51.google.com (mail-ua1-f51.google.com. [209.85.222.51])
        by smtp.gmail.com with ESMTPSA id a1e0cc1a2514c-87e23df8b53sm243338241.33.2025.05.28.04.50.51
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 28 May 2025 04:50:51 -0700 (PDT)
Received: by mail-ua1-f51.google.com with SMTP id a1e0cc1a2514c-86d6fd581f4so468142241.1;
        Wed, 28 May 2025 04:50:51 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCVV3S/LTEW8bYCzyUwFKZE2wFqVtF4PiTAEn5aq+SrATiL2Vub5FcwuvL/O1ZzKlkQZb2p8YzwkoCSj@vger.kernel.org, AJvYcCVXl7o+1m6p9NdZoJqHjThQgpo4Z9VwcfT0zGqCjkAuNFmkNDPhEnUxBpeikuA/3NOVI1BBYVRR22znfwfv@vger.kernel.org, AJvYcCX/tmRcEhAlQoVgEcJm2Z8A82g6pi1HEfFrcXccxiDdGuOaaUt10SeJUCOg0r+7taTWVPCzEYsczsMB6yQ7sMSIxeQ=@vger.kernel.org
X-Received: by 2002:a67:f857:0:b0:4e4:3c3a:f163 with SMTP id
 ada2fe7eead31-4e597db44bcmr2629330137.7.1748433051413; Wed, 28 May 2025
 04:50:51 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250519215734.577053-1-thierry.bultel.yh@bp.renesas.com> <20250519215734.577053-4-thierry.bultel.yh@bp.renesas.com>
In-Reply-To: <20250519215734.577053-4-thierry.bultel.yh@bp.renesas.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Wed, 28 May 2025 13:50:39 +0200
X-Gmail-Original-Message-ID: <CAMuHMdVLktxp5EC1P56Y0SYcMOHsnpMeW+joYTEj4_amoQoHHA@mail.gmail.com>
X-Gm-Features: AX0GCFvh54g40zEsfgecMYJZc5x8Vr4fnqVT6gNM6K_YWYoSqBMvdXzavV5U1gw
Message-ID: <CAMuHMdVLktxp5EC1P56Y0SYcMOHsnpMeW+joYTEj4_amoQoHHA@mail.gmail.com>
Subject: Re: [PATCH 3/3] arm64: dts: renesas: Add pinctrl for renesas RZ/T2H SoC
To: Thierry Bultel <thierry.bultel.yh@bp.renesas.com>
Cc: thierry.bultel@linatsea.fr, linux-renesas-soc@vger.kernel.org, 
	paul.barker.ct@bp.renesas.com, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Hi Thierry,

On Mon, 19 May 2025 at 23:57, Thierry Bultel
<thierry.bultel.yh@bp.renesas.com> wrote:
> Add pinctrl node for r9a09g077
>
> Signed-off-by: Thierry Bultel <thierry.bultel.yh@bp.renesas.com>

Thanks for your patch!

> --- a/arch/arm64/boot/dts/renesas/r9a09g077.dtsi
> +++ b/arch/arm64/boot/dts/renesas/r9a09g077.dtsi
> @@ -101,6 +101,15 @@ cpg: clock-controller@80280000 {
>                         #power-domain-cells = <0>;
>                 };
>
> +               pinctrl: pinctrl@812c0000 {

The unit address does not match the first reg property.

> +                       compatible = "renesas,pfc-r9a09g077";
> +                       reg = <0 0x802c0000 0 0x2000>,
> +                             <0 0x812c0000 0 0x2000>;
> +                       gpio-controller;
> +                       #gpio-cells = <2>;
> +                       gpio-ranges = <&pinctrl 0 0 287>;

No (optional?) clock, no interrupts...

> +               };
> +
>                 gic: interrupt-controller@83000000 {
>                         compatible = "arm,gic-v3";
>                         reg = <0x0 0x83000000 0 0x40000>,

Gr{oetje,eeting}s,

                        Geert


--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

