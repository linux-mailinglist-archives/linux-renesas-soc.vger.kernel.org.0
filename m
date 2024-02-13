Return-Path: <linux-renesas-soc+bounces-2719-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id BFBE8853C20
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 13 Feb 2024 21:21:11 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 681101F26689
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 13 Feb 2024 20:21:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 25BF760B91;
	Tue, 13 Feb 2024 20:21:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="WE2gFmlg"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F029D1CD10;
	Tue, 13 Feb 2024 20:21:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1707855666; cv=none; b=WnG5VXEAKdVl2rWtenqsxnEfDDwBMzm6zTq0tnfCbd28nPK9sSodGV651WMTq5m7RYjilYI65uE/PveEYvRA2Q3Ny3+R6OZ64ZC2MtTsGIy3DfxPCep6CPL0NK01iZhXXBnnrnt0gsYOPz+aqYlsAC+/txF70Bu/0VnT5DPMFwQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1707855666; c=relaxed/simple;
	bh=NC4XhaOdHJS9ruYUKoeAr7zc6tZbtNyyxJjF6AwNkAc=;
	h=Date:Content-Type:MIME-Version:From:To:Cc:In-Reply-To:References:
	 Message-Id:Subject; b=s3WRvsvdSSZZnnwqHtOULhxmyr9KV/dNM88oWZbdPhu/mYFT3ajrsrJww8/H7W0K+0SF+R5x+4mrPRvgT2bg85/hpgXONxZ0jsH46Lrt1+HecPegi/NI27pTZCTXrcxNqfloNoM0e+NrM/ch8j50/BrYJMn/GKpqcsFk8E0w3Qo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=WE2gFmlg; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 30DF8C433C7;
	Tue, 13 Feb 2024 20:21:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1707855665;
	bh=NC4XhaOdHJS9ruYUKoeAr7zc6tZbtNyyxJjF6AwNkAc=;
	h=Date:From:To:Cc:In-Reply-To:References:Subject:From;
	b=WE2gFmlgS/RiE9JZomlqwwufF7ZLenOhKzRJF6fa+Oq95Wqu5Lh1uG493NOR1UbSf
	 HaVdEi+JsqaVRJfIByrx5WPS1IpYtF0SoLewK1SlSSM2VWnKv4/Ss3HS3RUR/Fhcbh
	 TpI2cMweRAmbqrGA/GfRRspeTYzrO5SU3vIM/f/a8MtB+0hW4+Z0AtLB87xYhjNXUF
	 5e7R8kobLs3lhyWo8r9Pa4ezKLcoKyagKbjZnB/FuETiDKhC8YpdM3ti2s+1eS3EKB
	 OH/iIMThLpjG3md8HQX2+yMOdL9rnPrG2nYsdktmiND1fBYDQKytPqtW9mXRpWmVFs
	 BlpxlVRFDWLjg==
Date: Tue, 13 Feb 2024 14:21:04 -0600
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
Cc: Conor Dooley <conor+dt@kernel.org>, 
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, 
 Rob Herring <robh+dt@kernel.org>, devicetree@vger.kernel.org, 
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>, 
 linux-renesas-soc@vger.kernel.org, 
 Geert Uytterhoeven <geert+renesas@glider.be>
In-Reply-To: <20240213192340.2786430-1-niklas.soderlund+renesas@ragnatech.se>
References: <20240213192340.2786430-1-niklas.soderlund+renesas@ragnatech.se>
Message-Id: <170785566315.2270051.17137975742792836119.robh@kernel.org>
Subject: Re: [PATCH v3] dt-bindings: renesas: Document preferred compatible
 naming


On Tue, 13 Feb 2024 20:23:40 +0100, Niklas Söderlund wrote:
> Compatibles can come in two formats. Either "vendor,ip-soc" or
> "vendor,soc-ip". Add a DT schema file documenting Renesas preferred
> policy and enforcing it for all new compatibles, except few existing
> patterns.
> 
> Suggested-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> Signed-off-by: Niklas Söderlund <niklas.soderlund+renesas@ragnatech.se>
> ---
> * Changes since v2
> - Improve the select so it matches on any compatible containing a
>   component specific Renesas value.
> - Make the regexps more compact.
> - Define MaxItems to allow the increased selection to work.
> - Add rmobile and shmobile prefixes.
> - I did not take Rob's ack from v2 as the schema changed a lot after
>   Geerts review.
> 
> * Changes since v1
> - Split the "SoC agnostic compatibles" section into two to make it's
>   intent clearer.
> - Improved the documentation for each group of compatibles.
> - Reduced the number of regexp to create a larger target area. As
>   suggested by Krzysztof the goal is not to validate each SoC name but
>   check for the correct order of SoC-IP.
> 
> * Changes since RFC
> - Moved to Documentation/devicetree/bindings/soc/renesas.
> - Changed the pattern in the initial select to match on .*-.*.
> - Added a lot of missing compatible values.
> ---
>  .../bindings/soc/renesas/renesas-soc.yaml     | 72 +++++++++++++++++++
>  1 file changed, 72 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/soc/renesas/renesas-soc.yaml
> 

My bot found errors running 'make DT_CHECKER_FLAGS=-m dt_binding_check'
on your patch (DT_CHECKER_FLAGS is new in v5.13):

yamllint warnings/errors:

dtschema/dtc warnings/errors:
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/soc/renesas/renesas-soc.yaml: properties:compatible:items: {'anyOf': [{'pattern': '^renesas,(emev2|r(7s|8a|9a)[a-z0-9]+|rcar|rmobile|rz[a-z0-9]*|sh(7[a-z0-9]+)?|mobile)-[a-z0-9-]+$'}, {'pattern': '^renesas,(condor|falcon|gr-peach|salvator|sk-rz|smar(c(2)?)?|spider|white-hawk)(.*)?$'}, {'pattern': '^renesas,(can|cpg|dmac|du|(g)?ether(avb)?|gpio|hscif|(r)?i[i2]c|imr|intc|ipmmu|irqc|jpu|mmcif|msiof|mtu2|pci(e)?|pfc|pwm|[rq]spi|rcar_sound|sata|scif[ab]*|sdhi|thermal|tmu|tpu|usb(2|hs)?|vin|xhci)-[a-z0-9-]+$'}, {'pattern': '^renesas,(d|s)?bsc(3)?-(r8a73a4|r8a7740|sh73a0)$'}, {'pattern': '^renesas,em-(gio|sti|uart)$'}, {'pattern': '^renesas,fsi2-(r8a7740|sh73a0)$'}, {'pattern': '^renesas,hspi-r8a777[89]$'}, {'pattern': '^renesas,sysc-(r8a73a4|r8a7740|rmobile|sh73a0)$'}, {'enum': ['renesas,imr-lx4', 'renesas,mtu2-r7s72100']}, {'enum': ['renesas,smp-sram']}, {'pattern': '^(?!renesas,.+-.+).+$'}]} is not of type 'array'
	from schema $id: http://devicetree.org/meta-schemas/string-array.yaml#

doc reference errors (make refcheckdocs):

See https://patchwork.ozlabs.org/project/devicetree-bindings/patch/20240213192340.2786430-1-niklas.soderlund+renesas@ragnatech.se

The base for the series is generally the latest rc1. A different dependency
should be noted in *this* patch.

If you already ran 'make dt_binding_check' and didn't see the above
error(s), then make sure 'yamllint' is installed and dt-schema is up to
date:

pip3 install dtschema --upgrade

Please check and re-submit after running the above command yourself. Note
that DT_SCHEMA_FILES can be set to your schema file to speed up checking
your schema. However, it must be unset to test all examples with your schema.


