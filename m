Return-Path: <linux-renesas-soc+bounces-456-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id C20A97FEFD3
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 30 Nov 2023 14:17:17 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 204F1B20D71
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 30 Nov 2023 13:17:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 472FD3E47A;
	Thu, 30 Nov 2023 13:17:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ragnatech-se.20230601.gappssmtp.com header.i=@ragnatech-se.20230601.gappssmtp.com header.b="c1zz94ao"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-lj1-x22d.google.com (mail-lj1-x22d.google.com [IPv6:2a00:1450:4864:20::22d])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1E700B5
	for <linux-renesas-soc@vger.kernel.org>; Thu, 30 Nov 2023 05:17:06 -0800 (PST)
Received: by mail-lj1-x22d.google.com with SMTP id 38308e7fff4ca-2c9b8363683so11545381fa.3
        for <linux-renesas-soc@vger.kernel.org>; Thu, 30 Nov 2023 05:17:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ragnatech-se.20230601.gappssmtp.com; s=20230601; t=1701350224; x=1701955024; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=NNu7981w+b/EsarpnTnNbtY/sRZQqtfWb3hWpd3oycg=;
        b=c1zz94aoCFk2x8YbXh+aDxQnQ2iV5kB1rzFIFrDBuPUxqOqQ+C33mh1MZMD4aw30ef
         NxRQAkp7yPfFnZB2fpjv5zMEwIPsXZi7aSsvb99EvUXiYmO7ho/3UOv82zw0r1ZGAVFh
         rch9lO/w7GInVTOGSOrqaOTTcMpoOY5VMiLZXtWvNqe85tUIHvJg7o2AbarwQyO6xlHb
         tSb2mUyz8io4oWc8E+1qGuYyTxY3LbpKbmfBs+CSuC3zpDe6c+BgTk/O2X0BHmudoBTg
         HyH6+a6y238cg2lmbPq4pL7t5q+4sEcmpgO8QcQihKGnOiHaxMV7EzsWOOtVM7ilrSxQ
         m0jQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701350224; x=1701955024;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=NNu7981w+b/EsarpnTnNbtY/sRZQqtfWb3hWpd3oycg=;
        b=dmSuX15wyT6iT+9GLndKVu5XX22VSh9LFxMoVlAYbsnGV1R4hRq7MW4XwpiLG+BANf
         oDUqjtZp4q20N5fmrLGrxQggtfniJRlTcEUY9c5w5qffQZzfpvXKLtoeVd6FNBEY0IZc
         C/E9Q+05WFj0hfzSstkdUj1GyPtue8rOZWDgGclmZLT0N3qkJVosp6xQeWErW8czN1eV
         fYJ6hT/CJiBW+IsZiLrRNV3plxskd4GUP5BOEnJqIwYo5EkGf/aRbH03QjSb2nkTwH9p
         lHbimBeUf/BnANn7Hp7ddwNk5Kgj23WWSmDKag0LjwPKyfJ2243/tUKjNrSrRHO+QbMM
         LiOQ==
X-Gm-Message-State: AOJu0YxQINSXmi+zWyw6v8yZvA032WyV/Y9q9zW19gKMoOiLCc7WggAy
	bn5Txy+sHhXItFnpLmdSWR2xMg==
X-Google-Smtp-Source: AGHT+IE6Fk5mUymExBFFbYGMykHg37q2l+bapF/at/yPgH4L69vguyhE9w1VT0LcWJ9+IM+shvK/5A==
X-Received: by 2002:a2e:9d91:0:b0:2c9:c0c5:ab7d with SMTP id c17-20020a2e9d91000000b002c9c0c5ab7dmr3263228ljj.13.1701350224208;
        Thu, 30 Nov 2023 05:17:04 -0800 (PST)
Received: from localhost (h-46-59-36-206.A463.priv.bahnhof.se. [46.59.36.206])
        by smtp.gmail.com with ESMTPSA id u3-20020a2e9b03000000b002c9c61cdcbasm140981lji.5.2023.11.30.05.17.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 30 Nov 2023 05:17:02 -0800 (PST)
Date: Thu, 30 Nov 2023 14:17:01 +0100
From: Niklas =?utf-8?Q?S=C3=B6derlund?= <niklas.soderlund+renesas@ragnatech.se>
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc: Geert Uytterhoeven <geert+renesas@glider.be>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>, devicetree@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org
Subject: Re: [PATCH] dt-bindings: renesas: Document preferred compatible
 naming
Message-ID: <ZWiLTYU_Hj0bl1gn@oden.dyn.berto.se>
References: <20231125232821.234631-1-niklas.soderlund+renesas@ragnatech.se>
 <deacc7ea-6fad-47d6-978b-3f639aa5da35@linaro.org>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <deacc7ea-6fad-47d6-978b-3f639aa5da35@linaro.org>

Hi Krzysztof,

On 2023-11-28 10:51:03 +0100, Krzysztof Kozlowski wrote:
> > +properties:
> > +  compatible:
> > +    oneOf:
> > +      # Preferred naming style for compatibles of SoC components:
> > +      - pattern: "^renesas,emev2-[a-z0-9-]+$"
> > +      - pattern: "^renesas,r7s[0-9]+-[a-z0-9-]+$"
> > +      - pattern: "^renesas,r8a[a-z0-9]+-[a-z0-9-]+$"
> > +      - pattern: "^renesas,r9a[0-9]+g[a-z0-9]+-[a-z0-9-]+$"
> > +      - pattern: "^renesas,rcar-[a-z0-9-]+$"
> > +      - pattern: "^renesas,rz-[a-z0-9-]+$"
> > +      - pattern: "^renesas,rza-[a-z0-9-]+$"
> > +      - pattern: "^renesas,rza1-[a-z0-9-]+$"
> > +      - pattern: "^renesas,rza2-[a-z0-9-]+$"
> > +      - pattern: "^renesas,rzg2l-[a-z0-9-]+$"
> > +      - pattern: "^renesas,rzn1[a-z0-9]*-[a-z0-9-]+$"
> > +      - pattern: "^renesas,rzv2m-[a-z0-9-]+$"
> > +      - pattern: "^renesas,sh-[a-z0-9-]+$"
> > +      - pattern: "^renesas,sh7[a-z0-9]+-[a-z0-9-]+$"
> 
> Why so many different patterns? Why it cannot be for example:
> "^renesas,rz[a-z0-9]*-[a-z0-9-]+$" to cover multiple entries?
> 
> The point is not to validate the devices. Other bindings do it. The
> point is to have one or two patterns to enforce ordering of SoC-block.
> 
> The size of this file suggests you either over-complicated the thing or
> there is little benefit of adding it.

As you point out below there is a lot of patterns that use the style not 
preferred and the idea to detect future additions of this I thought it a 
good idea to make these more specialized. If we think that is a bad idea 
I can try to make fewer more generic ones.

> 
> > +
> > +      # SoC agnostic compatibles - new compatibles are OK:
> 
> Why new compatibles are ok?
> 
> > +      - enum:
> > +          - renesas,cpg-div6-clock
> > +          - renesas,cpg-mstp-clocks
> > +          - renesas,intc-irqpin
> > +          - renesas,smp-sram
> 
> smp-sram can have new compatibles? I am sorry, but this needs explanation...

The intention is to list SoC agnostic compatibles here, or put another 
way false positives to the generic pattern "renesas,.*-.*". So no 
"renesas,smp-sram" can't have new compatibles but there might be new 
renesas compatible strings that hit the pattern that is not related to a 
SoC. Does this make sens?

> 
> > +
> > +      # Legacy namings - variations of existing patterns/compatibles are OK,
> > +      # but do not add completely new entries to these:
> > +      - pattern: "^renesas,can-[a-z0-9]+$"
> > +      - pattern: "^renesas,dmac-[a-z0-9]+$"
> > +      - pattern: "^renesas,du-[a-z0-9]+$"
> > +      - pattern: "^renesas,ether-[a-z0-9]+$"
> > +      - pattern: "^renesas,etheravb-[a-z0-9]+$"
> > +      - pattern: "^renesas,etheravb-rcar-gen[0-9]$"
> > +      - pattern: "^renesas,gether-[a-z0-9]+$"
> > +      - pattern: "^renesas,gpio-[a-z0-9]+$"
> > +      - pattern: "^renesas,hscif-[a-z0-9]+$"
> > +      - pattern: "^renesas,i2c-[a-z0-9]+$"
> > +      - pattern: "^renesas,iic-[a-z0-9]+$"
> > +      - pattern: "^renesas,intc-ex-[a-z0-9]+$"
> > +      - pattern: "^renesas,intc-irqpin-[a-z0-9]+$"
> > +      - pattern: "^renesas,ipmmu-[a-z0-9]+$"
> > +      - pattern: "^renesas,irqc-[a-z0-9]+$"
> > +      - pattern: "^renesas,jpu-[a-z0-9]+$"
> > +      - pattern: "^renesas,mmcif-[a-z0-9]+$"
> > +      - pattern: "^renesas,msiof-[a-z0-9]+$"
> > +      - pattern: "^renesas,pci-[a-z0-9]+$"
> > +      - pattern: "^renesas,pci-rcar-gen[0-9]$"
> > +      - pattern: "^renesas,pcie-[a-z0-9]+$"
> > +      - pattern: "^renesas,pcie-rcar-gen[0-9]$"
> > +      - pattern: "^renesas,pfc-[a-z0-9]+$"
> > +      - pattern: "^renesas,pwm-[a-z0-9]+$"
> > +      - pattern: "^renesas,qspi-[a-z0-9]+$"
> > +      - pattern: "^renesas,rcar_sound-[a-z0-9]+$"
> > +      - pattern: "^renesas,riic-[a-z0-9]+$"
> > +      - pattern: "^renesas,rspi-[a-z0-9]+$"
> > +      - pattern: "^renesas,sata-[a-z0-9]+(-es1)?$"
> > +      - pattern: "^renesas,scif-[a-z0-9]+$"
> > +      - pattern: "^renesas,scifa-[a-z0-9]+$"
> > +      - pattern: "^renesas,scifb-[a-z0-9]+$"
> > +      - pattern: "^renesas,sdhi-[a-z0-9]+$"
> > +      - pattern: "^renesas,thermal-[a-z0-9]+$"
> > +      - pattern: "^renesas,tmu-[a-z0-9]+$"
> > +      - pattern: "^renesas,tpu-[a-z0-9]+$"
> > +      - pattern: "^renesas,usb-phy-[a-z0-9]+$"
> > +      - pattern: "^renesas,usb2-phy-[a-z0-9]+$"
> > +      - pattern: "^renesas,usbhs-[a-z0-9]+$"
> > +      - pattern: "^renesas,vin-[a-z0-9]+$"
> > +      - pattern: "^renesas,xhci-[a-z0-9]+$"
> 
> No, wait, you basically listed most of the SoC as exceptions. What SoC
> blocks exactly are you going to cover in such case with your rules?

As Geert points out these exists for historical reasons, but we don't 
want any more of this style.

You ask in your reply to Geert that we should reconsider if this is 
still useful. I think it is as it achieves the over all goal, detect if 
any new of the not preferred style is added. But I won't press it, if 
you or Geert think this is a bad route I won't spend more time on this 
work.

@Geert: What do you think?

-- 
Kind Regards,
Niklas Söderlund

