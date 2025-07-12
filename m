Return-Path: <linux-renesas-soc+bounces-19534-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 1CAFCB02C88
	for <lists+linux-renesas-soc@lfdr.de>; Sat, 12 Jul 2025 21:06:59 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 8AEB03AA078
	for <lists+linux-renesas-soc@lfdr.de>; Sat, 12 Jul 2025 19:06:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8B35127AC2A;
	Sat, 12 Jul 2025 19:06:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="XiP/zIAt"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5DB04183CB0;
	Sat, 12 Jul 2025 19:06:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752347214; cv=none; b=UnZSo9VRstH4mqayXWAMKrGh5tK3C102cpONkZOlBrPNgxZEWEacfXjYlQN1P0SMDACPrFRU6oTIlClzUXYhMdOiLUKSOlNjHn7IK8fTKhBDYGX6QKXYV/Hcgw3MQ3y4G+tY5t/OxtbZVmO77zoJAgL4VDq1f6K5w2Afa/ppS2U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752347214; c=relaxed/simple;
	bh=2cDLI+6d2t8/DuOIFZTlroviLAPEPg1elL5QTvHbT/c=;
	h=Date:Content-Type:MIME-Version:From:Cc:To:In-Reply-To:References:
	 Message-Id:Subject; b=p/1DJIikTsxXiZRMpMWAc8/bD1sWv8AEroTw1AcgYY4zQ6Qysu7C/jT2ZXJVyjk1Fi5IddDUMeq47DlflWr+MUHAAt+vNTg1TK8/ae9qZDSKA+DjacN1qrKo6xkpUpoL7Mz9O7xQj8Fy/FE23NX6M96eaubVkPqmf9wmKn+h7fY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=XiP/zIAt; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B25B2C4CEEF;
	Sat, 12 Jul 2025 19:06:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1752347212;
	bh=2cDLI+6d2t8/DuOIFZTlroviLAPEPg1elL5QTvHbT/c=;
	h=Date:From:Cc:To:In-Reply-To:References:Subject:From;
	b=XiP/zIAt91l4afZSPSKZYFzut01E3Mp6JRrMtzOdeoFB/D3AhcmbvD1XyZHTZ0pro
	 LA8rCZrPDOuv07AP97ZD7kjCCd1BIHU3Dk5J4KaFvMlSM4+5Lpv5v3bqRl00LV8eU0
	 S5ZrYGCHyvnwMTe/eYEHuFXDimf/gYV68dp+giuHJzsFARFDJlxHPype1cgXcc2Wxb
	 /xoB0beLlpj7Gsk0Mgv4qPcjdlIQGw5s5wuysJp1qZ47Lj4B3OUB4AoD9RKO14pUZZ
	 fsWv+44936WhANh0F70N44YKOzDTyk7FY6QeGKdsOcO8jS/6plCgLvrQlE/g0zGx1r
	 YXZEPAlZoS7GQ==
Date: Sat, 12 Jul 2025 14:06:51 -0500
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
From: "Rob Herring (Arm)" <robh@kernel.org>
Cc: linux-kernel@vger.kernel.org, wsa+renesas@sang-engineering.com, 
 devicetree@vger.kernel.org, geert+renesas@glider.be, p.zabel@pengutronix.de, 
 krzk@kernel.org, linux-renesas-soc@vger.kernel.org, 
 sergei.shtylyov@gmail.com, conor+dt@kernel.org
To: Magnus Damm <damm@opensource.se>
In-Reply-To: <175232756792.19062.3922882730162396395.sendpatchset@1.0.0.127.in-addr.arpa>
References: <175232755943.19062.8739774784256290646.sendpatchset@1.0.0.127.in-addr.arpa>
 <175232756792.19062.3922882730162396395.sendpatchset@1.0.0.127.in-addr.arpa>
Message-Id: <175234721189.1426581.6723570878637323009.robh@kernel.org>
Subject: Re: [PATCH v2 1/4] dt-bindings: memory-controllers:
 renesas,rpc-if: Add RZ/A1 and RZ/A2 compat strings


On Sat, 12 Jul 2025 15:39:27 +0200, Magnus Damm wrote:
> From: Magnus Damm <damm@opensource.se>
> 
> Add RZ/A1 and RZ/A2 compat strings for the renesas rpc-if device.
> 
> Signed-off-by: Magnus Damm <damm@opensource.se>
> ---
> 
>  Changes since v1:
>  - Moved RZ/A to top of RZ
> 
>  Applies to next-20250710
> 
>  Documentation/devicetree/bindings/memory-controllers/renesas,rpc-if.yaml |    5 +++++
>  1 file changed, 5 insertions(+)
> 
> --- 0001/Documentation/devicetree/bindings/memory-controllers/renesas,rpc-if.yaml
> +++ work/Documentation/devicetree/bindings/memory-controllers/renesas,rpc-if.yaml	2025-07-11 04:50:41.505855241 +0900
> @@ -50,6 +50,11 @@ properties:
> 
>        - items:
>            - enum:
> +	      - renesas,r7s72100-rpc-if       # RZ/A1H
> +	      - renesas,r7s9210-rpc-if        # RZ/A2M
> +
> +      - items:
> +          - enum:
>                - renesas,r9a07g043-rpc-if      # RZ/G2UL
>                - renesas,r9a07g044-rpc-if      # RZ/G2{L,LC}
>                - renesas,r9a07g054-rpc-if      # RZ/V2L
> 
> 

My bot found errors running 'make dt_binding_check' on your patch:

yamllint warnings/errors:
./Documentation/devicetree/bindings/memory-controllers/renesas,rpc-if.yaml:53:1: [error] syntax error: found character '\t' that cannot start any token (syntax)

dtschema/dtc warnings/errors:
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/memory-controllers/renesas,rpc-if.yaml: ignoring, error parsing file
./Documentation/devicetree/bindings/memory-controllers/renesas,rpc-if.yaml:53:1: found character that cannot start any token
make[2]: *** Deleting file 'Documentation/devicetree/bindings/memory-controllers/renesas,rpc-if.example.dts'
Documentation/devicetree/bindings/memory-controllers/renesas,rpc-if.yaml:53:1: found character that cannot start any token
make[2]: *** [Documentation/devicetree/bindings/Makefile:26: Documentation/devicetree/bindings/memory-controllers/renesas,rpc-if.example.dts] Error 1
make[2]: *** Waiting for unfinished jobs....
make[1]: *** [/builds/robherring/dt-review-ci/linux/Makefile:1525: dt_binding_check] Error 2
make: *** [Makefile:248: __sub-make] Error 2

doc reference errors (make refcheckdocs):

See https://patchwork.ozlabs.org/project/devicetree-bindings/patch/175232756792.19062.3922882730162396395.sendpatchset@1.0.0.127.in-addr.arpa

The base for the series is generally the latest rc1. A different dependency
should be noted in *this* patch.

If you already ran 'make dt_binding_check' and didn't see the above
error(s), then make sure 'yamllint' is installed and dt-schema is up to
date:

pip3 install dtschema --upgrade

Please check and re-submit after running the above command yourself. Note
that DT_SCHEMA_FILES can be set to your schema file to speed up checking
your schema. However, it must be unset to test all examples with your schema.


