Return-Path: <linux-renesas-soc+bounces-12730-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 0CF81A22972
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 30 Jan 2025 09:12:02 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id D62107A20A3
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 30 Jan 2025 08:11:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 030641ADFE0;
	Thu, 30 Jan 2025 08:11:52 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D34B01AB507;
	Thu, 30 Jan 2025 08:11:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738224711; cv=none; b=FkZLkn55DFQe2iBUaZogRHu2MaMQ7Q+Mu3V0v7cajMHZ4jZqcc9FT/Xs67ArWye5qUmsUvWGKu+NFPCm5L+LDL2cq/H1DfKpoh/pl/S81cA6HIy0sxea5ReytZRUqZBGxmCszKjlT6gxpPOojN8vk8VwsUGS1Lijr6KxESOexdM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738224711; c=relaxed/simple;
	bh=gmJMnqvWJjR41FzgvAISrLhuHJZDi/z8KdxOtd/ihRU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=cwDylEAvU8bRPobO91rAD185e7WuaZopFyYLl55vK7MVItGYlYBEvQfI44zgWQUaY2h2bkDmq5FvvmGeuZXC4yDJ1U+URVx0nVIOmCq3CH//wJKcH5g869zr1e+TLgjJoW3u5LKOLQBA+C/5kHlf2ji/Iay7bEXj2L0vSSrYlPM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D03FDC4CED2;
	Thu, 30 Jan 2025 08:11:50 +0000 (UTC)
Date: Thu, 30 Jan 2025 09:11:48 +0100
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To: Thierry Bultel <thierry.bultel.yh@bp.renesas.com>
Cc: linux-serial@vger.kernel.org, Magnus Damm <magnus.damm@gmail.com>, 
	linux-renesas-soc@vger.kernel.org, Rob Herring <robh@kernel.org>, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Geert Uytterhoeven <geert+renesas@glider.be>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	Jiri Slaby <jirislaby@kernel.org>, Conor Dooley <conor+dt@kernel.org>
Subject: Re: [PATCH 02/14] dt-bindings: serial: Document sci bindings for the
 Renesas RZ/T2H (a.k.a r9a09g077) SoC
Message-ID: <qzm2oxp4kwzbnz3l2hau7ryzf6m53viffmjrwos6c6vei7lbn2@talcanugumdi>
References: <20250129165122.2980-1-thierry.bultel.yh@bp.renesas.com>
 <20250129165122.2980-3-thierry.bultel.yh@bp.renesas.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20250129165122.2980-3-thierry.bultel.yh@bp.renesas.com>

On Wed, 29 Jan 2025 16:37:38 +0000, Thierry Bultel wrote:
> Document RZ/T2H (a.k.a r9a09g077) in SCI binding.
> 
> Signed-off-by: Thierry Bultel <thierry.bultel.yh@bp.renesas.com>
> ---
>  .../bindings/serial/renesas,rzsci.yaml        | 100 ++++++++++++++++++
>  1 file changed, 100 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/serial/renesas,rzsci.yaml
> 

My bot found errors running 'make DT_CHECKER_FLAGS=-m dt_binding_check'
on your patch (DT_CHECKER_FLAGS is new in v5.13):

yamllint warnings/errors:

dtschema/dtc warnings/errors:
Documentation/devicetree/bindings/serial/renesas,rzsci.example.dts:24:18: fatal error: dt-bindings/clock/r9a09g077-cpg.h: No such file or directory
   24 |         #include <dt-bindings/clock/r9a09g077-cpg.h>
      |                  ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
compilation terminated.
make[2]: *** [scripts/Makefile.dtbs:131: Documentation/devicetree/bindings/serial/renesas,rzsci.example.dtb] Error 1
make[2]: *** Waiting for unfinished jobs....
make[1]: *** [/builds/robherring/dt-review-ci/linux/Makefile:1506: dt_binding_check] Error 2
make: *** [Makefile:251: __sub-make] Error 2

doc reference errors (make refcheckdocs):

See https://patchwork.ozlabs.org/patch/2040352

This check can fail if there are any dependencies. The base for a patch
series is generally the most recent rc1.

If you already ran 'make dt_binding_check' and didn't see the above
error(s), then make sure 'yamllint' is installed and dt-schema is up to
date:

pip3 install dtschema --upgrade

Please check and re-submit.

