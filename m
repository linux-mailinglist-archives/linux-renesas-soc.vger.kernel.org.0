Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6DD8C42AB9E
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 12 Oct 2021 20:07:15 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232532AbhJLSJN (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Tue, 12 Oct 2021 14:09:13 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53988 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232740AbhJLSJM (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 12 Oct 2021 14:09:12 -0400
Received: from mail-lf1-x132.google.com (mail-lf1-x132.google.com [IPv6:2a00:1450:4864:20::132])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A982DC061570;
        Tue, 12 Oct 2021 11:07:10 -0700 (PDT)
Received: by mail-lf1-x132.google.com with SMTP id u18so445760lfd.12;
        Tue, 12 Oct 2021 11:07:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=DRCwLgEAONvFgKey07j1rJr2zlgk68fuh0WGNXA5pUI=;
        b=Iw8u6Vdeo6bEQ4D38jIkZxsrMgohnIDf38LukDy4SSHQre/9hBhur8Xkf8xpsj2INU
         ZVXBRBaMhSXUYynfft/6fDHD2hlHgDIjiV0iunFWJKRCxdcUT6lYhZfCRey2t3aaeZqQ
         qLFxH2yP3BAsVyy6lpyPiaM1avc+mj5EfFCEWZmnwWxMGmbtEYEUgYeSbPcbQou7ELXH
         pMGUDSc+VrZ+S+R4mPZ30aHQ/fy5FJ9y1D/TxCS1U0QojpfqTCm48vhGasNmQmwSMhXD
         ZXqRW0g9gbJl7sgydv8S3NsguJmiEwy1V/7xZS7FiidoKrnvTEBEOFWLdoNxOvS6bkYz
         wXEA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=DRCwLgEAONvFgKey07j1rJr2zlgk68fuh0WGNXA5pUI=;
        b=PnfPYfLrOhoXuijA2o5Fn533AQb7OYboTuea/ZGnpq56ZeDcGOj9OtwzyzofCk3XJ1
         +Hy8DDrYgy9xVqFHOpnNT9DKdo6VmkYaYmi1oBQIDUi2QlxTieQbh3flwTagWMHK+97J
         /g+W13LvGFAw/HdSVmFmXGSXaeBNEq8gf5FussLrwd/FIFtv6+B+HtJEeHK00zjOjm8T
         37MnEznsHgE6/91LgLI8YR4YsTQbL/jrDB8XEgl0AsSZgxEMRA5KFkq5+d0pZJh77g96
         XL2PLj+97mfLz8UjYirgru0D1muZC4eseddgTOiowXaxOTFpPpOLTuuYb8Fbr2iLxt8e
         Qxig==
X-Gm-Message-State: AOAM532UqM+iCcRocP4+UfTozxquBt25ySnVMNcRvS10puPwngIjHr6H
        aL973vaW0te1hNaCL+16p9U=
X-Google-Smtp-Source: ABdhPJw8bBVaGEztANZDCouYtkxQg87MaokItd0sNAjgSPWbs0J3GCtmafb5QyOODTlHvvzK4VQeSA==
X-Received: by 2002:a05:6512:3189:: with SMTP id i9mr35822457lfe.152.1634062009591;
        Tue, 12 Oct 2021 11:06:49 -0700 (PDT)
Received: from [192.168.1.103] ([31.173.83.90])
        by smtp.gmail.com with ESMTPSA id s18sm1095372lfg.27.2021.10.12.11.06.48
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 12 Oct 2021 11:06:49 -0700 (PDT)
Subject: Re: [PATCH 1/2] arm64: dts: renesas: r9a07g044: Add GbEthernet nodes
To:     Biju Das <biju.das.jz@bp.renesas.com>,
        Rob Herring <robh+dt@kernel.org>
Cc:     Geert Uytterhoeven <geert+renesas@glider.be>,
        Magnus Damm <magnus.damm@gmail.com>,
        linux-renesas-soc@vger.kernel.org, devicetree@vger.kernel.org,
        Chris Paterson <Chris.Paterson2@renesas.com>,
        Biju Das <biju.das@bp.renesas.com>,
        Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>
References: <20211012165144.30350-1-biju.das.jz@bp.renesas.com>
 <20211012165144.30350-2-biju.das.jz@bp.renesas.com>
From:   Sergei Shtylyov <sergei.shtylyov@gmail.com>
Message-ID: <f37fb863-92bc-79b1-26e4-1336874041d1@gmail.com>
Date:   Tue, 12 Oct 2021 21:06:47 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.1
MIME-Version: 1.0
In-Reply-To: <20211012165144.30350-2-biju.das.jz@bp.renesas.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

On 10/12/21 7:51 PM, Biju Das wrote:

> Add Gigabit Ethernet{0,1} nodes to SoC DTSI.
> 
> Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
> ---
>  arch/arm64/boot/dts/renesas/r9a07g044.dtsi | 40 ++++++++++++++++++++++
>  1 file changed, 40 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/renesas/r9a07g044.dtsi b/arch/arm64/boot/dts/renesas/r9a07g044.dtsi
> index 0b0372a02515..93e1ec271ff1 100644
> --- a/arch/arm64/boot/dts/renesas/r9a07g044.dtsi
> +++ b/arch/arm64/boot/dts/renesas/r9a07g044.dtsi
> @@ -488,6 +488,46 @@
>  			status = "disabled";
>  		};
>  
> +		eth0: ethernet@11c20000 {
> +			compatible = "renesas,r9a07g044-gbeth",
> +				     "renesas,rzg2l-gbeth";
> +			reg = <0 0x11c20000 0 0x10000>;
> +			interrupts = <GIC_SPI 84 IRQ_TYPE_LEVEL_HIGH>,
> +				     <GIC_SPI 85 IRQ_TYPE_LEVEL_HIGH>,
> +				     <GIC_SPI 86 IRQ_TYPE_LEVEL_HIGH>;
> +			interrupt-names = "mux", "fil",  "arp_ns";

   Why 2 spaces before "arp_ns"?

[...]

MBR, Sergey
