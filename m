Return-Path: <linux-renesas-soc+bounces-17290-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id CF469ABF147
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 21 May 2025 12:17:22 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 8AEEC4E5370
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 21 May 2025 10:17:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 16FA72405F5;
	Wed, 21 May 2025 10:17:20 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-vk1-f173.google.com (mail-vk1-f173.google.com [209.85.221.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A0BE824BBFA;
	Wed, 21 May 2025 10:17:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747822640; cv=none; b=mbrTldyS6ZSawZ5emcl/y9Tssf75rvwhgS/Qj8HHn5v2zjjGjG4botQ/rugkmPUjLb8j1ojh+yac4vXIjTLbFoCaZ2QVEsSvn+7obH0g0ORAI4Ospk/9Lvx+Wc+lROlZlIZ3aZLm99yVtsXt3H2JE8hCv3GVly/0HftIJ6vxt08=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747822640; c=relaxed/simple;
	bh=uJK95ugA0HSoGYOFlI28Y1sjfGBHT7L/o9KnriVaucE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=P7VjIk8j6WakftCbBVFbiwsMklhKVUn3EWt/LXsIWslHijv4DdV511kkreZubYUIsqbrvF+Dbkqp4V2nQjJKOM4mnJKVK2q5QuS05wEP/x5QDsIxZvRb07nWxMM41PEOjh1/KODgw6ssHLoaOjZwnpHdzdbLOWEJOQBWlpJkhO4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.221.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vk1-f173.google.com with SMTP id 71dfb90a1353d-5240764f7c1so1940938e0c.2;
        Wed, 21 May 2025 03:17:17 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747822635; x=1748427435;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Pl0dTytafVhoCB0H0aa0pIPSG1UF8OiXB5MtAo2OXlg=;
        b=PhtvUVL7hQkiKSb0qdGDZ1fe60TrBVeHyBJNDrFFf9Z3v71wrzBR4Je+U97yIH8lIi
         E+3wIm3n11ICMhyCBJ3hPmaHuEcweOcm566zsO9YMpbdflhjgWAhL72AzIXH284K4tX5
         1n+0u2nlM+Vlski2jnZeMC2UlPEoSai1OoH2eRyPBq66iDVV30/JLsxWVNIyNaR0LO6z
         QWNq/tTyb9IUhmtIjPqDL786ZqfsGGfBGVKGGH12SK4m9hxTnMQN+ksmmmNjEj2KdrBg
         6Y9DmlA/OiNMoq1/Lov5I2wsRI+CHbxzWDC+89nUytWr9YTyG7o6BE9dF802tfmYCmRS
         0llQ==
X-Forwarded-Encrypted: i=1; AJvYcCV9oRZDLW6h1PDOtp0YhgaP9+7C8Gi73FBx7RI+v9f8BaKNlT7P2MyzUtlFNrT4Cb2PjPuP0t0njJPg1m3s4DmCnQ0=@vger.kernel.org, AJvYcCVJLU1kUsuaua52PAXqlSkXYrTd+z3kC7TBo9aLVOs9QD2C43faag+2jcq0ZKp7H3swJtkFHo8vQ3Gg@vger.kernel.org, AJvYcCVzJmOSE9xWIve2DtGaDPpYMk45exmjJ85hF9uAzTmyfevCaY/t5XQmH7or4CRBiaDivcKLCR/eowlR5CfS@vger.kernel.org
X-Gm-Message-State: AOJu0YwLtTiJP2hrLz/B4+kQ3mbmjB8+A295mXSX2S1OXqNOAuLmtRlt
	P1LkORTdnu9wH77VGqSjiqtn5SfDnK/49Nw5FHi1lBHc4RFUbN25C2UB0nJGB8ae
X-Gm-Gg: ASbGnctiU38UBo/Ypmn10asAYfwTiE+PT5RwY63Q1gRjn2uo2qukeKI1mHXy6QM24QC
	NMZdzpl8QP3GjpSYVs0KUKRa6YiOANdPMA8/aimQxNToEW2DcmRr6eVvB+EUXOJq0dWHE7PQDB4
	OoHiy9bKBDtbbkWxrKLWHLhoV+iPjrBCcsnUmT+yos6w459nniym3H9bxpSL1myVR9XqNl5ZEs2
	2mzx1dylDeaDBnqclfQD2Zt1djYaPkQk8vJon0dNhH2zmyt4RiJ3r0LMxE7Dhve0TKVxjGzoiXp
	b/QjEc4YzFgpe+3Yr7fx5btGcukbtWjA11RMalDmet+em6bt+f920tXDcKxbM2TmEhBb+75CkU9
	7/L7GjwU2V34hQw==
X-Google-Smtp-Source: AGHT+IGX6d+ZVKWaADCU+OWm0aUNQ4iMjbHIYa9e2dH/6HJEzytKvQzfH9DI8ycTaSchtRefhx+wNw==
X-Received: by 2002:a05:6122:885:b0:526:42c2:8453 with SMTP id 71dfb90a1353d-52dba9649b2mr17818459e0c.7.1747822635320;
        Wed, 21 May 2025 03:17:15 -0700 (PDT)
Received: from mail-vs1-f49.google.com (mail-vs1-f49.google.com. [209.85.217.49])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-52dba96a3efsm9872256e0c.26.2025.05.21.03.17.14
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 21 May 2025 03:17:14 -0700 (PDT)
Received: by mail-vs1-f49.google.com with SMTP id ada2fe7eead31-4e041582fd2so1917244137.0;
        Wed, 21 May 2025 03:17:14 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCVKv6pQDLyjhwIefWpMXGTb0F6g45eekpaH14KlprK3QzG9vp76tmsxJRZpnH8+tI+0vDUBm+pl3yI1zzFVg5HxvX8=@vger.kernel.org, AJvYcCVwNbIl3Plr1nD/BiRn3H+5icNw3LaXE/1dZgB32oIFnWcbf4D2rxEgyVPO7HomHye5YyoOsCg102hR@vger.kernel.org, AJvYcCX6xZ4GKPrsvZ3uMw2753ZMijedgIGHKfW8zPK+AUzTM0lMTVf07c9rqB8WKzphLUqPx9nUUyMABV4Hki+4@vger.kernel.org
X-Received: by 2002:a05:6102:c0e:b0:4bd:22d5:fbd7 with SMTP id
 ada2fe7eead31-4dfa6b9be4fmr20657171137.11.1747822634503; Wed, 21 May 2025
 03:17:14 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250513131412.253091-1-prabhakar.mahadev-lad.rj@bp.renesas.com> <20250513131412.253091-2-prabhakar.mahadev-lad.rj@bp.renesas.com>
In-Reply-To: <20250513131412.253091-2-prabhakar.mahadev-lad.rj@bp.renesas.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Wed, 21 May 2025 12:17:02 +0200
X-Gmail-Original-Message-ID: <CAMuHMdU+NBJNcijYCK3SJrqL7xEyW9wveT40iHoH7n_E1o+R-w@mail.gmail.com>
X-Gm-Features: AX0GCFtxmB0B30CkwBMhEHZGJnl-GCxoFG6iXqHAFR1FCnIMGsgF4hqdZ1BWFk4
Message-ID: <CAMuHMdU+NBJNcijYCK3SJrqL7xEyW9wveT40iHoH7n_E1o+R-w@mail.gmail.com>
Subject: Re: [PATCH v3 1/2] arm64: dts: renesas: r9a09g057: Add GBETH nodes
To: Prabhakar <prabhakar.csengg@gmail.com>
Cc: Magnus Damm <magnus.damm@gmail.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	linux-renesas-soc@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Biju Das <biju.das.jz@bp.renesas.com>, 
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>, 
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Content-Type: text/plain; charset="UTF-8"

Hi Prabhakar,

On Tue, 13 May 2025 at 15:14, Prabhakar <prabhakar.csengg@gmail.com> wrote:
> From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
>
> Renesas RZ/V2H(P) SoC is equipped with 2x Synopsys DesignWare Ethernet
> Quality-of-Service IP block version 5.20. Add GBETH nodes to R9A09G057
> RZ/V2H(P) SoC DTSI.
>
> Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> ---
> v2->v3:
> - Added the mdio0/1 nodes to SoC DTSI.

Thanks for the update!

> --- a/arch/arm64/boot/dts/renesas/r9a09g057.dtsi
> +++ b/arch/arm64/boot/dts/renesas/r9a09g057.dtsi
> @@ -701,6 +701,215 @@ sdhi2_vqmmc: vqmmc-regulator {
>                                 status = "disabled";
>                         };
>                 };
> +
> +               eth0: ethernet@15c30000 {

> +                       mdio0: mdio {
> +                               compatible = "snps,dwmac-mdio";
> +                               #address-cells = <0x1>;

1

> +                               #size-cells = <0x0>;

0

The rest LGTM, so
Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
i.e. will queue in renesas-devel for v6.17 with the above fixed.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

