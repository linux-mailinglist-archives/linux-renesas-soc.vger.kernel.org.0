Return-Path: <linux-renesas-soc+bounces-12729-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 1EB81A2296D
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 30 Jan 2025 09:11:48 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 2DAF83A6279
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 30 Jan 2025 08:11:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 999061AB52F;
	Thu, 30 Jan 2025 08:11:46 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 79A5A1AA1D8;
	Thu, 30 Jan 2025 08:11:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738224706; cv=none; b=rVIr0CoBgjch8BKoQs/9C5zeFZ8lzzZip+FRC9GUi1IzX8IrvVlYmmaQzFss59NhDKBI80EmRejTb+Vgrp+maDjqK3heU/V/2m8HWMP99Zfb5d5Gzb0pqbN43UG2dJt0X2N4aJpKdpvmZonr1pYQp6z5i4qUu1ibCSKGpt9oHm8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738224706; c=relaxed/simple;
	bh=5ibgvNJRxKb2Pfkr8dER/RDHUmhrh0V0GZgzJhgmu7c=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=HImovOOY7nhuAd7Q8aKNzevjShP7sLgONzaiMmN08CMunqv51Q0HaoOGAehjW/XbMuUitzAZ91ayv0opv2wxv7UcF/1KECbKjt31At9rSAqGNFio4gHDxZBOeCtWkKbOMRn8XhDcpxYET6CngBkRRXWJbdTuhguL4yaucqaTtnM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 43938C4CED2;
	Thu, 30 Jan 2025 08:11:44 +0000 (UTC)
Date: Thu, 30 Jan 2025 09:11:41 +0100
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To: Thierry Bultel <thierry.bultel.yh@bp.renesas.com>
Cc: Geert Uytterhoeven <geert+renesas@glider.be>, 
	Magnus Damm <magnus.damm@gmail.com>, Conor Dooley <conor+dt@kernel.org>, linux-kernel@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-renesas-soc@vger.kernel.org, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>
Subject: Re: [PATCH 03/14] dt-bindings: soc: Document the Renesas RZ/T2H
 Evaluation board for the R9A09G077 SoC
Message-ID: <enfypgxezp7tyyiio3yhc43mj3drbqxtgdiesyxqjf65xnuxoa@zxcvv6yltnrf>
References: <20250129165122.2980-1-thierry.bultel.yh@bp.renesas.com>
 <20250129165122.2980-4-thierry.bultel.yh@bp.renesas.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20250129165122.2980-4-thierry.bultel.yh@bp.renesas.com>

On Wed, 29 Jan 2025 16:37:39 +0000, Thierry Bultel wrote:
> Add the RZ/T2H Evaluation board (r9a9g077m44-dev) in documentation.
> 
> Signed-off-by: Thierry Bultel <thierry.bultel.yh@bp.renesas.com>
> ---
>  Documentation/devicetree/bindings/soc/renesas/renesas.yaml | 2 ++
>  1 file changed, 2 insertions(+)
> 

My bot found errors running 'make DT_CHECKER_FLAGS=-m dt_binding_check'
on your patch (DT_CHECKER_FLAGS is new in v5.13):

yamllint warnings/errors:
./Documentation/devicetree/bindings/soc/renesas/renesas.yaml:543:13: [warning] wrong indentation: expected 14 but found 12 (indentation)

dtschema/dtc warnings/errors:

doc reference errors (make refcheckdocs):

See https://patchwork.ozlabs.org/patch/2040353

This check can fail if there are any dependencies. The base for a patch
series is generally the most recent rc1.

If you already ran 'make dt_binding_check' and didn't see the above
error(s), then make sure 'yamllint' is installed and dt-schema is up to
date:

pip3 install dtschema --upgrade

Please check and re-submit.

