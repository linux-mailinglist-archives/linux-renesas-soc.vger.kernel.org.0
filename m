Return-Path: <linux-renesas-soc+bounces-17370-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 2FB9BAC0BDA
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 22 May 2025 14:46:38 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 0DEEA3A6572
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 22 May 2025 12:46:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 92C492356CF;
	Thu, 22 May 2025 12:46:34 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-vk1-f169.google.com (mail-vk1-f169.google.com [209.85.221.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D45E87485;
	Thu, 22 May 2025 12:46:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747917994; cv=none; b=IWz6YujM81VrbPzYOZCFDg5butY/R+lK3TW52IDXvQmG08yNktqwGspWRBWpQlTh3dtVTKM9IagX7YcDCa1eFO/MvhTHFlEgP8COeUnkyRrB4aX3DLp45pknAJ5ZviFheAhve0MrHLx31fCIvcbZvtMX9vhWHKemtj6YvikLz7U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747917994; c=relaxed/simple;
	bh=EysInhQSl27VwcL14mClTEtrEtXOOmZ9eLkBhpkarHo=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Fd54HEAU8hUADaYv8APUvYsGFB7QLmDHZYHXupLJa2mw0YEpxg0X0cCkCz3dEJNVfqa8Dlrgvq2t/xEzMtheYrrZxGd+DaUlGRo/jD/5xXZtVkTGthVaS2SYbmJas3wQ6J5uueTZ3H0dJj4Wl8K+PqVrmYjvt56mEzkUutoQ2gw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.221.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vk1-f169.google.com with SMTP id 71dfb90a1353d-528ce9731dbso1864145e0c.0;
        Thu, 22 May 2025 05:46:31 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747917990; x=1748522790;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=SJiKM9rofxYKhAilzOdaWle5ny4V76IGW8ct0sAqOb4=;
        b=nlsdcZNHzgtmV3fuGYrkbtAnLCwo8wAuPRACRHN1203nvim6qUX2ua8KyvXB/QzJPl
         rT/4XNcH85APSZdzICnv5sC4fvIFC1yCV5/ToSTKUsB8A+DeZaPZ9cO5aA3AmV6AKBpp
         ugfJ21jnYlCn+FyuF/0FD4d3Y5oEtzCPoLBF/VHC5HrwULhj5oYEqj6tSnmmEf6v7W4B
         UHCBgKCYoHEdXwNRziFHvM192WZ6HraXQNwaWcBMJyuiaWQwu1KIbYv+oWzP0gMCa8xC
         HrQMIRNSwh6gDRRCIU+Qss8Vy0jW0SwGX8ydBwKqHgSk0EBcG9n92SjP68d1p5Oj2ozg
         w2jg==
X-Forwarded-Encrypted: i=1; AJvYcCUaPeb2ZY74sweQ5qPOCEl0IgLYXmEcXafiwo3LS9mt+o41+Fk2Ud57wiFb97R5mFS7VI6IGyFRFtMmb/Ip@vger.kernel.org, AJvYcCWcD8YbWPjGPXtQ75PX2Hre4kGjhlKeA2TZpj7N7r9NkSGQZVcXFAa4QhGOrAoPey8HNwPCV0msexM7O/daKyVBf/4=@vger.kernel.org, AJvYcCXho+7KZopWkZ049W+HLRPrrYRJW2isHuXWsFEP/RKuJuIR3hkVtSQFIo7luYrmkBRuLHfQZrvEh8Qn@vger.kernel.org
X-Gm-Message-State: AOJu0YwmZ9t9BtL2Xfjcyjs/yARpvLJgcMNP295uEikO/rXjiSHMSMQb
	IIMkmo69B/qSqDgD8mxDbs3EXwZzB1acvqQz3ko/K6jJwKeGfoBcF2oFXHy2E4mJ
X-Gm-Gg: ASbGncs+L446hDUtR2uVcNjh2hkz1JCL7LUMCTdZNBWtkDujy0Jp/Bd3uovjD0lAQXv
	v3ilix166Aux4iOKUcxfDbiiRM09zyhjdjIJyu4PSpNfJ4Zc776zWr2WFd09+P9x0acCiwlPHk6
	sch0CPfe4a+DfZCXx8rHfJH+pfg9dT7z9F6gSzWI31r1u8pyHMG82po/za6NfZOMISNxbzjV4fv
	6AZuDFU74KRSGNpSdw1tcwoa+ge+qD11e8TRNqtdslJHQqIGZCoAt05G9/yZyhWNaNsHuN3+F9J
	ufKxqf7yumD7gEh/FLehtCD0etKAII8SuM+iNtoV+qygcpimfuRViEOPDXK0PaAvBgVRyQK60hl
	3MHvnEqwpj97BLQ==
X-Google-Smtp-Source: AGHT+IEjaORb6kf2KWS6O7l74Wr2504cGpBzsN2eAskoRV5Sib9jZDEe0ryWJ3B/XyQBFLrBVR2GYA==
X-Received: by 2002:a05:6122:16a7:b0:52c:7abb:efee with SMTP id 71dfb90a1353d-52dba94ea76mr23069170e0c.9.1747917990139;
        Thu, 22 May 2025 05:46:30 -0700 (PDT)
Received: from mail-vs1-f41.google.com (mail-vs1-f41.google.com. [209.85.217.41])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-52dbab4e9a7sm11642397e0c.35.2025.05.22.05.46.29
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 22 May 2025 05:46:29 -0700 (PDT)
Received: by mail-vs1-f41.google.com with SMTP id ada2fe7eead31-4c4fa0bfca2so2607640137.0;
        Thu, 22 May 2025 05:46:29 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCUxFlej8NFQjWno7R8CApYYBlvfy6jOPKfEPbjux3aho0fRdLmkY7ilTofCsRV17eepa6Uw1N6SACmrtQKWIkJSeNM=@vger.kernel.org, AJvYcCVBFny4vmMcUDvENiHm97ulPkXHRM68/keBqORTEWg6Vr22QS6N+j+5yVANReH4XpuRsC8ciWmI+1OYEtMW@vger.kernel.org, AJvYcCXcQqiN1w3jz83kQj2G0kHKR/SNacATBOlbRypfb/6IcucSX7arV3pnHgAEcka2hwFKq3pj9L6FZwCZ@vger.kernel.org
X-Received: by 2002:a05:6102:26c2:b0:4e2:ac09:fba2 with SMTP id
 ada2fe7eead31-4e2ac09fd1amr10115538137.24.1747917989636; Thu, 22 May 2025
 05:46:29 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250514162422.910114-1-tommaso.merciai.xr@bp.renesas.com> <20250514162422.910114-2-tommaso.merciai.xr@bp.renesas.com>
In-Reply-To: <20250514162422.910114-2-tommaso.merciai.xr@bp.renesas.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Thu, 22 May 2025 14:46:17 +0200
X-Gmail-Original-Message-ID: <CAMuHMdWJQm7bhfFAWvsU2SweCrPGDCSHd_rw5+oTXWWdV9mZQw@mail.gmail.com>
X-Gm-Features: AX0GCFvFZmJWoQFNTktApWkdu4Hy0K7UFQ4QW-qQEpvKXIbg7IrEW7CM1rMfM34
Message-ID: <CAMuHMdWJQm7bhfFAWvsU2SweCrPGDCSHd_rw5+oTXWWdV9mZQw@mail.gmail.com>
Subject: Re: [PATCH 1/4] arm64: dts: renesas: r9a09g047: Add CRU, CSI2 nodes
To: Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>
Cc: tomm.merciai@gmail.com, linux-renesas-soc@vger.kernel.org, 
	biju.das.jz@bp.renesas.com, prabhakar.mahadev-lad.rj@bp.renesas.com, 
	Magnus Damm <magnus.damm@gmail.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, 
	=?UTF-8?Q?Niklas_S=C3=B6derlund?= <niklas.soderlund+renesas@ragnatech.se>
Content-Type: text/plain; charset="UTF-8"

Hi Tommaso,

On Wed, 14 May 2025 at 18:25, Tommaso Merciai
<tommaso.merciai.xr@bp.renesas.com> wrote:
> Add CRU, CSI2 nodes to RZ/RZG3E SoC DTSI.
>
> Signed-off-by: Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>

Thanks for your patch!

> --- a/arch/arm64/boot/dts/renesas/r9a09g047.dtsi
> +++ b/arch/arm64/boot/dts/renesas/r9a09g047.dtsi
> @@ -669,6 +669,75 @@ sdhi2_vqmmc: vqmmc-regulator {
>                                 status = "disabled";
>                         };
>                 };
> +
> +               cru: video@16000000 {
> +                       compatible = "renesas,r9a09g047-cru";
> +                       reg = <0 0x16000000 0 0x400>;
> +                       clocks = <&cpg CPG_MOD 0xd3>,
> +                                <&cpg CPG_MOD 0xd4>,
> +                                <&cpg CPG_MOD 0xd2>;
> +                       clock-names = "video", "apb", "axi";
> +                       interrupts = <GIC_SPI 838 IRQ_TYPE_LEVEL_HIGH>,
> +                                    <GIC_SPI 839 IRQ_TYPE_LEVEL_HIGH>,
> +                                    <GIC_SPI 840 IRQ_TYPE_EDGE_RISING>,
> +                                    <GIC_SPI 841 IRQ_TYPE_EDGE_RISING>,
> +                                    <GIC_SPI 842 IRQ_TYPE_LEVEL_HIGH>;
> +                       interrupt-names = "image_conv", "axi_mst_err",
> +                                         "vd_addr_wend", "sd_addr_wend",
> +                                         "vsd_addr_wend";
> +                       resets = <&cpg 0xc5>, <&cpg 0xc6>;
> +                       reset-names = "presetn", "aresetn";
> +                       power-domains = <&cpg>;
> +                       status = "disabled";
> +
> +                       ports {
> +                               #address-cells = <1>;
> +                               #size-cells = <0>;
> +
> +                               port@1 {
> +                                       #address-cells = <1>;
> +                                       #size-cells = <0>;

I think the plan was to get rid of #{address,size}-cells...

> +
> +                                       reg = <1>;
> +                                       crucsi2: endpoint@0 {
> +                                               reg = <0>;

... and of the unit address and reg property here...

> +                                               remote-endpoint = <&csi2cru>;
> +                                       };
> +                               };
> +                       };
> +               };
> +
> +               csi2: csi2@16000400 {
> +                       compatible = "renesas,r9a09g047-csi2", "renesas,r9a09g057-csi2";
> +                       reg = <0 0x16000400 0 0xc00>;
> +                       interrupts = <GIC_SPI 837 IRQ_TYPE_LEVEL_HIGH>;
> +                       clocks = <&cpg CPG_MOD 0xd3>, <&cpg CPG_MOD 0xd4>;
> +                       clock-names = "video", "apb";
> +                       resets = <&cpg 0xc5>, <&cpg 0xc7>;
> +                       reset-names = "presetn", "cmn-rstb";
> +                       power-domains = <&cpg>;
> +                       status = "disabled";
> +
> +                       ports {
> +                               #address-cells = <1>;
> +                               #size-cells = <0>;
> +
> +                               port@0 {
> +                                       reg = <0>;
> +                               };
> +
> +                               port@1 {
> +                                       #address-cells = <1>;
> +                                       #size-cells = <0>;

... and here...

> +                                       reg = <1>;
> +
> +                                       csi2cru: endpoint@0 {
> +                                               reg = <0>;

... and here[1].
As that still hasn't happened, and the example in the bindings wasn't
updated either, I will keep it like this.

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
i.e. will queue in renesas-devel for v6.17.

> +                                               remote-endpoint = <&crucsi2>;
> +                                       };
> +                               };
> +                       };
> +               };
>         };
>
>         timer {

[1] "[PATCH] arm64: dts: renesas: r9a07g0{43,44,54}: Drop
#address-cells/#size-cells from single child node 'endpoint@0'"
    https://lore.kernel.org/all/20240609095049.17193-1-biju.das.jz@bp.renesas.com/

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

