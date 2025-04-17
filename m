Return-Path: <linux-renesas-soc+bounces-16122-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 39A5BA91F11
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 17 Apr 2025 16:04:54 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id ADF7F19E6954
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 17 Apr 2025 14:05:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 36C4D23A99F;
	Thu, 17 Apr 2025 14:04:50 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-oa1-f44.google.com (mail-oa1-f44.google.com [209.85.160.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ABA5315A8;
	Thu, 17 Apr 2025 14:04:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744898690; cv=none; b=B/7DAvWFqKOyx91nv2zL0BejSOMO2mL7g8s8oPBq7BqraTLkDQN1682oksAmQpTAOlK3I6bPHAjtIZ0OGTh+OZIH7rtkfrbnPBxmUQeEGqlVywlp2oIRUv7KiA308nUf43cuzKMq1iyOSgaaBXgnoVKdAfqpteeIGteNRhEMWu0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744898690; c=relaxed/simple;
	bh=Yk+wZFNaFDZKvswPt07qohNns+m610liX4+96rtDdD4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=p0xQUa66k1RZXTSy+vaP6GkKQ16LZkVYykNzkdsqzQpchUC3/zC/fJoMRbLXSzztLbf67kDoRHKT1WQ1PlqcW+4LeoP3D3auHtXuKvx6SBeaGrQpQAIYecyomIqIIbvF5HmlPG9EAhg/6fflMAWxXQDWKNOcX31hzqOnIfoXHMQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.160.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-oa1-f44.google.com with SMTP id 586e51a60fabf-2c759bf1b2eso348512fac.1;
        Thu, 17 Apr 2025 07:04:48 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744898687; x=1745503487;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ZvFyF+BBvF0HVX/Uomd5Xk9bwcsXrKluPPWDQNN673E=;
        b=WjopAnTUCZa/pCzyPm0JSnW+7XG05g2HdxRUoy5eHHQV7cb17uLp/4kizn8j/fOs6P
         3k3zTSueINq4orhdaTH5mMA2AFBLuCq+UsDbslo07L9obTi3rF57/82NRUy/p0ObE0Eo
         Qgmz+NlHP81tYyQlphVr36CdlvhlP/FUSJQydhLWc2cK+zuhDNmewtTp7PJ2AULsauRL
         JQ8zGxuqqnkfGmLEObq4JCfN7mXMXxL1P6QsGQbQFKpOlRWvTdLBN7s4HkGH6dJ2TAeI
         lUN3vIU4PtJ2k5+IBQIW60D6u8WQjhkCsTnfzzJGLRP8BTOInJ/MK3RacU634crD0ioE
         2Qwg==
X-Forwarded-Encrypted: i=1; AJvYcCUlSTMaJJMNq3rz19RC5Ey8e2MwdO6OJIcI+cRXhDZWXXlRD56KvxpHH8lRRXXkM0wS/n8bxv21igfM@vger.kernel.org, AJvYcCW67FW75Jfq+19z3ivpAPk1zOAEHveYwwouvZp9CkwXLBFeP6iM1srAx9hqpu9HjMhoKQswcbH6F5WPXNy0GLWrCv4=@vger.kernel.org, AJvYcCWV5icnVm5qExSImawhvK0JeiR49oiNzBVVTBPzzdko0fUt+MHzq7SYUu3bQQ/KkYvlCCaKcUGxcK2sVQuq@vger.kernel.org, AJvYcCWokPnzKR3nVgBhSbhyp8Xe5A1NqlTJdepb77R6M2xfgcpS1/TiYOCk0ceZCKfSecRQX11YQBhzSuUbUmTU@vger.kernel.org
X-Gm-Message-State: AOJu0YwC79U8LQUu0afr+ADu8scAepqhwboqnC2lmkXDHhUi6GP6fo6y
	gKHHpP3HiFrMotrsMMTkN9sDkKKZVy51knfkww8RkeNzAdrBoK3L1sq0d4tS
X-Gm-Gg: ASbGncuhXw+/2tjWyus5cEuE6hyQ9CUBUezxrj+6xn/z8RmvKy7HPawPEl5ouFkgGDC
	F6ZBlf6oVOzT6hjY4a7eLGKX5+hMRsRSAsw/LLzB/Ax/U1O9dtVca8TESd8YiCEy4hH6SKxs2H8
	4nx+qqgwW7aHr2F5K5613+zgr0Lqp4ppPSZOWXapxmhz9XtnJy+/n6TsVI04AQ3olxDsvE0aC52
	VbgOQbkOQ5bWtLC2LSu89RTkc9CJG8DLPCSat9sojVtz+TDJto8Aidwp8mjmUJYFv8pM1iMciNO
	MZxfjHJQcRxl4wmBYpNrC+n7Ww7gR7MW4h4tFRSLBffE7vjbHRxceg2L+JCWBTnEiRod7rTWI2q
	Z4huaaBA=
X-Google-Smtp-Source: AGHT+IE8Sn1aeEhsQaOUt4SdflvykCARKukOOVnpz8ozpC03b/WBhy4luTc10bEhwWXCO+YKbVsLGg==
X-Received: by 2002:a05:6871:9c02:b0:2c2:371a:2b4e with SMTP id 586e51a60fabf-2d4d2d60206mr3887068fac.32.1744898687175;
        Thu, 17 Apr 2025 07:04:47 -0700 (PDT)
Received: from mail-oi1-f182.google.com (mail-oi1-f182.google.com. [209.85.167.182])
        by smtp.gmail.com with ESMTPSA id 586e51a60fabf-2d096cd2528sm3882376fac.36.2025.04.17.07.04.46
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 17 Apr 2025 07:04:46 -0700 (PDT)
Received: by mail-oi1-f182.google.com with SMTP id 5614622812f47-3fea67e64caso445732b6e.2;
        Thu, 17 Apr 2025 07:04:46 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCVVe3UEPrlUQYTGX8MAExwxvEagykmhZWjxOU7iXhAFVwLTItyd2FjcllMWhZ4wsQZOlxBNfNVVPRBt@vger.kernel.org, AJvYcCVlU1Ts6dH6vawZqT3e+6YmAZnPw5qYhMsun2M81SYC7ssoh8oXisHum58sYqOdasQ6dczp0LJz1PCCH7R8@vger.kernel.org, AJvYcCWYgCJihGlZkeIDz0weoGFD6Xpt4Hs5lUYlRNpqe5mGo4UhmZNyWvdWKlu9wMPiBssXymyDCleipEoKaWHB4JgTNFU=@vger.kernel.org, AJvYcCWmNrQbxiEM6Pt60c6mCa+/9exn6eHANDv40864e/QalkGR7RuVYLmw2NqfSwjBYXz50FdJsb7/P0gAq1BI@vger.kernel.org
X-Received: by 2002:a05:6808:2a0b:b0:3fb:2e8f:4dd8 with SMTP id
 5614622812f47-400b01cfdc8mr2774727b6e.15.1744898686644; Thu, 17 Apr 2025
 07:04:46 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250403212919.1137670-1-thierry.bultel.yh@bp.renesas.com> <20250403212919.1137670-4-thierry.bultel.yh@bp.renesas.com>
In-Reply-To: <20250403212919.1137670-4-thierry.bultel.yh@bp.renesas.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Thu, 17 Apr 2025 16:04:35 +0200
X-Gmail-Original-Message-ID: <CAMuHMdVaE7uk_5yyVTmZJGu3cOzPu9UPCwJNdXM9S1VBjfWK7Q@mail.gmail.com>
X-Gm-Features: ATxdqUEUOz646on2in1vPvmLuXpNy4v_-5FFuAqji-VFYjOUXpEOS1iB-FBTrpM
Message-ID: <CAMuHMdVaE7uk_5yyVTmZJGu3cOzPu9UPCwJNdXM9S1VBjfWK7Q@mail.gmail.com>
Subject: Re: [PATCH v7 03/13] dt-bindings: serial: Add compatible for Renesas
 RZ/T2H SoC in sci
To: Thierry Bultel <thierry.bultel.yh@bp.renesas.com>
Cc: thierry.bultel@linatsea.fr, linux-renesas-soc@vger.kernel.org, 
	paul.barker.ct@bp.renesas.com, Rob Herring <robh@kernel.org>, 
	Geert Uytterhoeven <geert+renesas@glider.be>, linux-kernel@vger.kernel.org, 
	linux-serial@vger.kernel.org, devicetree@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Hi Thierry,

On Thu, 3 Apr 2025 at 23:29, Thierry Bultel
<thierry.bultel.yh@bp.renesas.com> wrote:
> RSCI of RZ/T2H SoC (a.k.a r9a09g077), as a lot
> of similarities with SCI in other Renesas SoC like G2L, G3S, V2L;
> However, it has a different set of registers, and in addition to serial,
> this IP also supports SCIe (encoder), SmartCard, i2c and spi.
> This is why the 'renesas,sci' fallback for generic SCI does not apply for it.
>
> Reviewed-by: Rob Herring (Arm) <robh@kernel.org>
> Signed-off-by: Thierry Bultel <thierry.bultel.yh@bp.renesas.com>
> ---
> Changes v6->v7:
>   - Moved all rsci in a separate file
>   - Added example

Thanks for your patch, which is now commit 25422e8f46c1fd14
("dt-bindings: serial: Add compatible for Renesas RZ/T2H SoC in sci")
in tty/tty-next.

> --- /dev/null
> +++ b/Documentation/devicetree/bindings/serial/renesas,rsci.yaml

> +examples:
> +  - |
> +    #include <dt-bindings/interrupt-controller/arm-gic.h>
> +    #include <dt-bindings/clock/renesas-cpg-mssr.h>
> +
> +    aliases {
> +        serial0 = &sci0;
> +    };

Aliases are not really needed in examples; the DT janitors may send
a patch to remove this ;-).

> +
> +    sci0: serial@80005000 {
> +        compatible = "renesas,r9a09g077-rsci";
> +        reg = <0x80005000 0x400>;
> +        interrupts = <GIC_SPI 590 IRQ_TYPE_LEVEL_HIGH>,
> +                     <GIC_SPI 591 IRQ_TYPE_EDGE_RISING>,
> +                     <GIC_SPI 592 IRQ_TYPE_EDGE_RISING>,
> +                     <GIC_SPI 593 IRQ_TYPE_LEVEL_HIGH>;
> +        interrupt-names = "eri", "rxi", "txi", "tei";
> +        clocks = <&cpg CPG_MOD 108>;

Shouldn't that be 8 instead of 108?
Doesn't matter much, as this file is just an example...

> +        clock-names = "fck";
> +        power-domains = <&cpg>;
> +    };

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

