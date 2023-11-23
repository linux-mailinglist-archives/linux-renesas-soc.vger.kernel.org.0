Return-Path: <linux-renesas-soc+bounces-222-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id D00E57F685C
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 23 Nov 2023 21:18:13 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id F36841C208F5
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 23 Nov 2023 20:18:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6EB554D127;
	Thu, 23 Nov 2023 20:18:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dkim=none
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-il1-f177.google.com (mail-il1-f177.google.com [209.85.166.177])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A4F90D46;
	Thu, 23 Nov 2023 12:18:05 -0800 (PST)
Received: by mail-il1-f177.google.com with SMTP id e9e14a558f8ab-3580b94ac2eso3742455ab.0;
        Thu, 23 Nov 2023 12:18:05 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1700770685; x=1701375485;
        h=date:subject:message-id:references:in-reply-to:cc:to:from
         :mime-version:content-transfer-encoding:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=RZhnChZzrbhIvmRhOFaFpuCSZmpiqDmB28b17aZVcDg=;
        b=ZRbyS45/pl0/nD5oNgFRh5cn+SeG9sr3C6u/BtUkyG7i89bn36y+S/1c/F50YLOPfP
         NIH+fc5FkBclQpy/XlTlBC8ryOLsPinKer9wVigYqkh9NyL0dMKUjq+uPdVZdpPcnpbG
         S3Mwcm6uUZVounfxWzQ3lTKlRZuVgAkqdKljW7EQRuyhDoRKZRODr9lkm7YP6Yj4VFFN
         47BQWBGJ+KSbvXl+QtS10tWYa3Np+vUPLL20zXOvPaeSM3HiP1+PNePEBGQoAFoqF8st
         fs0Ym+cdSuGHPcusA4RZvSPGlG8M7+zQUefkc11CfRnW2CZiimQ+SsT0xQQMQchi91v0
         hQyw==
X-Gm-Message-State: AOJu0YyLeofkYFyCNqd+RQivbd+LhvBx1f2pp2rXEHxwhAdLcekwCBzC
	6zyMUrd1O9pLxIhRdUAg/Q==
X-Google-Smtp-Source: AGHT+IGDFz1VoxeIi4p1N73Z6ixP8PZnLbhwbX1EgEXgNCS60tLIEw0/jgWdeoIYUAEJBNg2XA4uJA==
X-Received: by 2002:a05:6e02:1a65:b0:34f:c7f7:18b with SMTP id w5-20020a056e021a6500b0034fc7f7018bmr619622ilv.2.1700770684797;
        Thu, 23 Nov 2023 12:18:04 -0800 (PST)
Received: from herring.priv ([64.188.179.252])
        by smtp.gmail.com with ESMTPSA id k14-20020a92c9ce000000b0035b0ad262e2sm557205ilq.47.2023.11.23.12.18.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 23 Nov 2023 12:18:04 -0800 (PST)
Received: (nullmailer pid 2062268 invoked by uid 1000);
	Thu, 23 Nov 2023 20:18:02 -0000
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
From: Rob Herring <robh@kernel.org>
To: =?utf-8?q?Niklas_S=C3=B6derlund?= <niklas.soderlund+renesas@ragnatech.se>
Cc: Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, linux-renesas-soc@vger.kernel.org, Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>, devicetree@vger.kernel.org, Geert Uytterhoeven <geert+renesas@glider.be>, Conor Dooley <conor+dt@kernel.org>, Rob Herring <robh+dt@kernel.org>
In-Reply-To: <20231123190612.2427668-1-niklas.soderlund+renesas@ragnatech.se>
References: <20231123190612.2427668-1-niklas.soderlund+renesas@ragnatech.se>
Message-Id: <170077068263.2062229.12353898342101477995.robh@kernel.org>
Subject: Re: [RFC] dt-bindings: renesas: Document preferred compatible
 naming
Date: Thu, 23 Nov 2023 13:18:02 -0700


On Thu, 23 Nov 2023 20:06:12 +0100, Niklas Söderlund wrote:
> Compatibles can come in two formats. Either "vendor,ip-soc" or
> "vendor,soc-ip". Add a DT schema file documenting Renesas preferred
> policy and enforcing it for all new compatibles, except few existing
> patterns.
> 
> Suggested-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> Signed-off-by: Niklas Söderlund <niklas.soderlund+renesas@ragnatech.se>
> ---
> Hello,
> 
> I have mixed up the order of soc and ip a few times. The last time I did
> Krzysztof suggested a schema could help catch this, and this is my
> attempt to create one.
> 
> One thing to note is that the select clause matches on all renesas
> related bindings, including ones that are SoC agnostic and a few that
> are Renesas IP that are not related to a SoC e.g. a Renesas regulator.
> 
> For this reason these two classes of compatibles have been added to this
> schema. An alternative solution would be to change the select clause to
> "^renesas,.+-.+$" and drop these two classes from the schema.
> 
> I have tested this schema with all DTBs built for ARM using the in tree
> shmobile_defconfig and ARM64 using the renesas_defconfig found in
> Geert's renesas-drivers tree [1].
> 
> 1.  https://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-drivers.git
> 
> ---
>  .../devicetree/bindings/arm/renesas-soc.yaml  | 85 +++++++++++++++++++
>  1 file changed, 85 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/arm/renesas-soc.yaml
> 

My bot found errors running 'make DT_CHECKER_FLAGS=-m dt_binding_check'
on your patch (DT_CHECKER_FLAGS is new in v5.13):

yamllint warnings/errors:

dtschema/dtc warnings/errors:
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/remoteproc/renesas,rcar-rproc.example.dtb: cr7: compatible: 'oneOf' conditional failed, one must be fixed:
	'renesas,rcar-cr7' does not match '^renesas,emev2-[a-z0-9-]+$'
	'renesas,rcar-cr7' does not match '^renesas,r7s[0-9]+-[a-z0-9-]+$'
	'renesas,rcar-cr7' does not match '^renesas,r8a[a-z0-9]+-[a-z0-9-]+$'
	'renesas,rcar-cr7' does not match '^renesas,r9a[0-9]+g[0-9]+-[a-z0-9-]+$'
	'renesas,rcar-cr7' does not match '^renesas,rzn1-[a-z0-9-]+$'
	'renesas,rcar-cr7' does not match '^renesas,rzv2m-[a-z0-9-]+$'
	'renesas,rcar-cr7' does not match '^renesas,sh73a0-[a-z0-9-]+$'
	'renesas,rcar-cr7' is not one of ['renesas,bsid', 'renesas,fcpf', 'renesas,fcpv', 'renesas,fdp1', 'renesas,prr', 'renesas,smp-sram', 'renesas,vsp1', 'renesas,vsp2']
	'renesas,rcar-cr7' does not match '^renesas,du-[a-z0-9]+$'
	'renesas,rcar-cr7' does not match '^renesas,ether-[a-z0-9]+$'
	'renesas,rcar-cr7' does not match '^renesas,gether-[a-z0-9]+$'
	'renesas,rcar-cr7' does not match '^renesas,ipmmu-[a-z0-9]+$'
	'renesas,rcar-cr7' does not match '^renesas,pfc-[a-z0-9]+$'
	'renesas,rcar-cr7' does not match '^renesas,sata-[a-z0-9]+$'
	'renesas,rcar-cr7' does not match '^renesas,scif-[a-z0-9]+$'
	'renesas,rcar-cr7' does not match '^renesas,sdhi-[a-z0-9]+$'
	'renesas,rcar-cr7' does not match '^renesas,thermal-[a-z0-9]+$'
	'renesas,rcar-cr7' does not match '^renesas,usb2-phy-[a-z0-9]+$'
	'renesas,rcar-cr7' does not match '^renesas,vin-[a-z0-9]+$'
	'renesas,rcar-cr7' is not one of ['renesas,dbsc-r8a73a4', 'renesas,dbsc3-r8a7740', 'renesas,em-gio', 'renesas,em-sti', 'renesas,em-uart', 'renesas,iic-emev2', 'renesas,sbsc-sh73a0', 'renesas,sdhi-mmc-r8a77470']
	'renesas,rcar-cr7' is not one of ['renesas,5p35023', 'renesas,r2a11302ft', 'renesas,raa215300']
	from schema $id: http://devicetree.org/schemas/arm/renesas-soc.yaml#
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/iio/potentiometer/renesas,x9250.example.dtb: potentiometer@0: compatible: 'oneOf' conditional failed, one must be fixed:
	'renesas,x9250t' does not match '^renesas,emev2-[a-z0-9-]+$'
	'renesas,x9250t' does not match '^renesas,r7s[0-9]+-[a-z0-9-]+$'
	'renesas,x9250t' does not match '^renesas,r8a[a-z0-9]+-[a-z0-9-]+$'
	'renesas,x9250t' does not match '^renesas,r9a[0-9]+g[0-9]+-[a-z0-9-]+$'
	'renesas,x9250t' does not match '^renesas,rzn1-[a-z0-9-]+$'
	'renesas,x9250t' does not match '^renesas,rzv2m-[a-z0-9-]+$'
	'renesas,x9250t' does not match '^renesas,sh73a0-[a-z0-9-]+$'
	'renesas,x9250t' is not one of ['renesas,bsid', 'renesas,fcpf', 'renesas,fcpv', 'renesas,fdp1', 'renesas,prr', 'renesas,smp-sram', 'renesas,vsp1', 'renesas,vsp2']
	'renesas,x9250t' does not match '^renesas,du-[a-z0-9]+$'
	'renesas,x9250t' does not match '^renesas,ether-[a-z0-9]+$'
	'renesas,x9250t' does not match '^renesas,gether-[a-z0-9]+$'
	'renesas,x9250t' does not match '^renesas,ipmmu-[a-z0-9]+$'
	'renesas,x9250t' does not match '^renesas,pfc-[a-z0-9]+$'
	'renesas,x9250t' does not match '^renesas,sata-[a-z0-9]+$'
	'renesas,x9250t' does not match '^renesas,scif-[a-z0-9]+$'
	'renesas,x9250t' does not match '^renesas,sdhi-[a-z0-9]+$'
	'renesas,x9250t' does not match '^renesas,thermal-[a-z0-9]+$'
	'renesas,x9250t' does not match '^renesas,usb2-phy-[a-z0-9]+$'
	'renesas,x9250t' does not match '^renesas,vin-[a-z0-9]+$'
	'renesas,x9250t' is not one of ['renesas,dbsc-r8a73a4', 'renesas,dbsc3-r8a7740', 'renesas,em-gio', 'renesas,em-sti', 'renesas,em-uart', 'renesas,iic-emev2', 'renesas,sbsc-sh73a0', 'renesas,sdhi-mmc-r8a77470']
	'renesas,x9250t' is not one of ['renesas,5p35023', 'renesas,r2a11302ft', 'renesas,raa215300']
	from schema $id: http://devicetree.org/schemas/arm/renesas-soc.yaml#
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/timer/renesas,tpu.example.dtb: tpu@ffffe0: compatible: 'oneOf' conditional failed, one must be fixed:
	'renesas,tpu' does not match '^renesas,emev2-[a-z0-9-]+$'
	'renesas,tpu' does not match '^renesas,r7s[0-9]+-[a-z0-9-]+$'
	'renesas,tpu' does not match '^renesas,r8a[a-z0-9]+-[a-z0-9-]+$'
	'renesas,tpu' does not match '^renesas,r9a[0-9]+g[0-9]+-[a-z0-9-]+$'
	'renesas,tpu' does not match '^renesas,rzn1-[a-z0-9-]+$'
	'renesas,tpu' does not match '^renesas,rzv2m-[a-z0-9-]+$'
	'renesas,tpu' does not match '^renesas,sh73a0-[a-z0-9-]+$'
	'renesas,tpu' is not one of ['renesas,bsid', 'renesas,fcpf', 'renesas,fcpv', 'renesas,fdp1', 'renesas,prr', 'renesas,smp-sram', 'renesas,vsp1', 'renesas,vsp2']
	'renesas,tpu' does not match '^renesas,du-[a-z0-9]+$'
	'renesas,tpu' does not match '^renesas,ether-[a-z0-9]+$'
	'renesas,tpu' does not match '^renesas,gether-[a-z0-9]+$'
	'renesas,tpu' does not match '^renesas,ipmmu-[a-z0-9]+$'
	'renesas,tpu' does not match '^renesas,pfc-[a-z0-9]+$'
	'renesas,tpu' does not match '^renesas,sata-[a-z0-9]+$'
	'renesas,tpu' does not match '^renesas,scif-[a-z0-9]+$'
	'renesas,tpu' does not match '^renesas,sdhi-[a-z0-9]+$'
	'renesas,tpu' does not match '^renesas,thermal-[a-z0-9]+$'
	'renesas,tpu' does not match '^renesas,usb2-phy-[a-z0-9]+$'
	'renesas,tpu' does not match '^renesas,vin-[a-z0-9]+$'
	'renesas,tpu' is not one of ['renesas,dbsc-r8a73a4', 'renesas,dbsc3-r8a7740', 'renesas,em-gio', 'renesas,em-sti', 'renesas,em-uart', 'renesas,iic-emev2', 'renesas,sbsc-sh73a0', 'renesas,sdhi-mmc-r8a77470']
	'renesas,tpu' is not one of ['renesas,5p35023', 'renesas,r2a11302ft', 'renesas,raa215300']
	from schema $id: http://devicetree.org/schemas/arm/renesas-soc.yaml#
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/clock/renesas,9series.example.dtb: clock-generator@6a: compatible: 'oneOf' conditional failed, one must be fixed:
	'renesas,9fgv0241' does not match '^renesas,emev2-[a-z0-9-]+$'
	'renesas,9fgv0241' does not match '^renesas,r7s[0-9]+-[a-z0-9-]+$'
	'renesas,9fgv0241' does not match '^renesas,r8a[a-z0-9]+-[a-z0-9-]+$'
	'renesas,9fgv0241' does not match '^renesas,r9a[0-9]+g[0-9]+-[a-z0-9-]+$'
	'renesas,9fgv0241' does not match '^renesas,rzn1-[a-z0-9-]+$'
	'renesas,9fgv0241' does not match '^renesas,rzv2m-[a-z0-9-]+$'
	'renesas,9fgv0241' does not match '^renesas,sh73a0-[a-z0-9-]+$'
	'renesas,9fgv0241' is not one of ['renesas,bsid', 'renesas,fcpf', 'renesas,fcpv', 'renesas,fdp1', 'renesas,prr', 'renesas,smp-sram', 'renesas,vsp1', 'renesas,vsp2']
	'renesas,9fgv0241' does not match '^renesas,du-[a-z0-9]+$'
	'renesas,9fgv0241' does not match '^renesas,ether-[a-z0-9]+$'
	'renesas,9fgv0241' does not match '^renesas,gether-[a-z0-9]+$'
	'renesas,9fgv0241' does not match '^renesas,ipmmu-[a-z0-9]+$'
	'renesas,9fgv0241' does not match '^renesas,pfc-[a-z0-9]+$'
	'renesas,9fgv0241' does not match '^renesas,sata-[a-z0-9]+$'
	'renesas,9fgv0241' does not match '^renesas,scif-[a-z0-9]+$'
	'renesas,9fgv0241' does not match '^renesas,sdhi-[a-z0-9]+$'
	'renesas,9fgv0241' does not match '^renesas,thermal-[a-z0-9]+$'
	'renesas,9fgv0241' does not match '^renesas,usb2-phy-[a-z0-9]+$'
	'renesas,9fgv0241' does not match '^renesas,vin-[a-z0-9]+$'
	'renesas,9fgv0241' is not one of ['renesas,dbsc-r8a73a4', 'renesas,dbsc3-r8a7740', 'renesas,em-gio', 'renesas,em-sti', 'renesas,em-uart', 'renesas,iic-emev2', 'renesas,sbsc-sh73a0', 'renesas,sdhi-mmc-r8a77470']
	'renesas,9fgv0241' is not one of ['renesas,5p35023', 'renesas,r2a11302ft', 'renesas,raa215300']
	from schema $id: http://devicetree.org/schemas/arm/renesas-soc.yaml#
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/clock/renesas,versaclock7.example.dtb: clock-controller@9: compatible: 'oneOf' conditional failed, one must be fixed:
	'renesas,rc21008a' does not match '^renesas,emev2-[a-z0-9-]+$'
	'renesas,rc21008a' does not match '^renesas,r7s[0-9]+-[a-z0-9-]+$'
	'renesas,rc21008a' does not match '^renesas,r8a[a-z0-9]+-[a-z0-9-]+$'
	'renesas,rc21008a' does not match '^renesas,r9a[0-9]+g[0-9]+-[a-z0-9-]+$'
	'renesas,rc21008a' does not match '^renesas,rzn1-[a-z0-9-]+$'
	'renesas,rc21008a' does not match '^renesas,rzv2m-[a-z0-9-]+$'
	'renesas,rc21008a' does not match '^renesas,sh73a0-[a-z0-9-]+$'
	'renesas,rc21008a' is not one of ['renesas,bsid', 'renesas,fcpf', 'renesas,fcpv', 'renesas,fdp1', 'renesas,prr', 'renesas,smp-sram', 'renesas,vsp1', 'renesas,vsp2']
	'renesas,rc21008a' does not match '^renesas,du-[a-z0-9]+$'
	'renesas,rc21008a' does not match '^renesas,ether-[a-z0-9]+$'
	'renesas,rc21008a' does not match '^renesas,gether-[a-z0-9]+$'
	'renesas,rc21008a' does not match '^renesas,ipmmu-[a-z0-9]+$'
	'renesas,rc21008a' does not match '^renesas,pfc-[a-z0-9]+$'
	'renesas,rc21008a' does not match '^renesas,sata-[a-z0-9]+$'
	'renesas,rc21008a' does not match '^renesas,scif-[a-z0-9]+$'
	'renesas,rc21008a' does not match '^renesas,sdhi-[a-z0-9]+$'
	'renesas,rc21008a' does not match '^renesas,thermal-[a-z0-9]+$'
	'renesas,rc21008a' does not match '^renesas,usb2-phy-[a-z0-9]+$'
	'renesas,rc21008a' does not match '^renesas,vin-[a-z0-9]+$'
	'renesas,rc21008a' is not one of ['renesas,dbsc-r8a73a4', 'renesas,dbsc3-r8a7740', 'renesas,em-gio', 'renesas,em-sti', 'renesas,em-uart', 'renesas,iic-emev2', 'renesas,sbsc-sh73a0', 'renesas,sdhi-mmc-r8a77470']
	'renesas,rc21008a' is not one of ['renesas,5p35023', 'renesas,r2a11302ft', 'renesas,raa215300']
	from schema $id: http://devicetree.org/schemas/arm/renesas-soc.yaml#
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/sound/renesas,idt821034.example.dtb: audio-codec@0: compatible: 'oneOf' conditional failed, one must be fixed:
	'renesas,idt821034' does not match '^renesas,emev2-[a-z0-9-]+$'
	'renesas,idt821034' does not match '^renesas,r7s[0-9]+-[a-z0-9-]+$'
	'renesas,idt821034' does not match '^renesas,r8a[a-z0-9]+-[a-z0-9-]+$'
	'renesas,idt821034' does not match '^renesas,r9a[0-9]+g[0-9]+-[a-z0-9-]+$'
	'renesas,idt821034' does not match '^renesas,rzn1-[a-z0-9-]+$'
	'renesas,idt821034' does not match '^renesas,rzv2m-[a-z0-9-]+$'
	'renesas,idt821034' does not match '^renesas,sh73a0-[a-z0-9-]+$'
	'renesas,idt821034' is not one of ['renesas,bsid', 'renesas,fcpf', 'renesas,fcpv', 'renesas,fdp1', 'renesas,prr', 'renesas,smp-sram', 'renesas,vsp1', 'renesas,vsp2']
	'renesas,idt821034' does not match '^renesas,du-[a-z0-9]+$'
	'renesas,idt821034' does not match '^renesas,ether-[a-z0-9]+$'
	'renesas,idt821034' does not match '^renesas,gether-[a-z0-9]+$'
	'renesas,idt821034' does not match '^renesas,ipmmu-[a-z0-9]+$'
	'renesas,idt821034' does not match '^renesas,pfc-[a-z0-9]+$'
	'renesas,idt821034' does not match '^renesas,sata-[a-z0-9]+$'
	'renesas,idt821034' does not match '^renesas,scif-[a-z0-9]+$'
	'renesas,idt821034' does not match '^renesas,sdhi-[a-z0-9]+$'
	'renesas,idt821034' does not match '^renesas,thermal-[a-z0-9]+$'
	'renesas,idt821034' does not match '^renesas,usb2-phy-[a-z0-9]+$'
	'renesas,idt821034' does not match '^renesas,vin-[a-z0-9]+$'
	'renesas,idt821034' is not one of ['renesas,dbsc-r8a73a4', 'renesas,dbsc3-r8a7740', 'renesas,em-gio', 'renesas,em-sti', 'renesas,em-uart', 'renesas,iic-emev2', 'renesas,sbsc-sh73a0', 'renesas,sdhi-mmc-r8a77470']
	'renesas,idt821034' is not one of ['renesas,5p35023', 'renesas,r2a11302ft', 'renesas,raa215300']
	from schema $id: http://devicetree.org/schemas/arm/renesas-soc.yaml#

doc reference errors (make refcheckdocs):

See https://patchwork.ozlabs.org/project/devicetree-bindings/patch/20231123190612.2427668-1-niklas.soderlund+renesas@ragnatech.se

The base for the series is generally the latest rc1. A different dependency
should be noted in *this* patch.

If you already ran 'make dt_binding_check' and didn't see the above
error(s), then make sure 'yamllint' is installed and dt-schema is up to
date:

pip3 install dtschema --upgrade

Please check and re-submit after running the above command yourself. Note
that DT_SCHEMA_FILES can be set to your schema file to speed up checking
your schema. However, it must be unset to test all examples with your schema.


