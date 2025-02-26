Return-Path: <linux-renesas-soc+bounces-13715-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id D3D06A4634B
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 26 Feb 2025 15:44:13 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 8A5CF18993D0
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 26 Feb 2025 14:44:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6845E221711;
	Wed, 26 Feb 2025 14:44:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="JRz1SuiK"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 38ED81624C3;
	Wed, 26 Feb 2025 14:44:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740581049; cv=none; b=boQctjpJ0/c85paf0ldHGpRawm/K/DQgVybld5OOZ1B41yguhGikkfP8gM3U0aZe3nDF3qeIyXZ0bHHbIBmKNTjneeGD7NbuVo62xS23jODVqRqzAJY9fBHJnWYrsAHJgndLRra7MEOPo+UWpe/Z6gO4mbpYjsb34UlSnKf/iLM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740581049; c=relaxed/simple;
	bh=yY2+VjGEeTwmZIM7iym40A+OIkx7D2O9SW/yYcv9Av8=;
	h=Date:Content-Type:MIME-Version:From:Cc:To:In-Reply-To:References:
	 Message-Id:Subject; b=Jz2i5pfKGR30uHBjhUp4S0H0LSnutZuadjIXfQwcAoaegr92Hxcyu7gInALI1SLnbMqveacuiJFklM/nIhpMnl6BV2fXnyJbqdsdaRbKKSnBGA/wlvDmbaeEebhZYvJp/4MT4WsrgjwkbhcHqbLLL8qpoqaO0/kXvnIkDBmbnVM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=JRz1SuiK; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 81403C4CED6;
	Wed, 26 Feb 2025 14:44:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1740581048;
	bh=yY2+VjGEeTwmZIM7iym40A+OIkx7D2O9SW/yYcv9Av8=;
	h=Date:From:Cc:To:In-Reply-To:References:Subject:From;
	b=JRz1SuiK990namaZzUA1ZsJSgipZfTqZtZq5ODV20fRSZjfM+dzN6Fz0WnrsHOkOP
	 QdbOLAQBnnltwI3f6lfCNfcR2dOFIOdE2K18ELK9Z1fSqTYgz/OCHM1O3GP7GR9FZL
	 zAna3PNQGkziaQjEMnPNA9tIqyJ/UVoj6l7JF+Otpv8Hpugc9jFRlcu1DUb6C1f9n9
	 /oE/CeZMHuBLwGXnl2neI8jV4CdT7uq0D8/fJMVXDL4qJOzP6gAbaXvwtv4CevRWAu
	 cEtpWqCMGJNru1rFU1SzFiy0RI+6EA0EbR56qEceRk8bq2GxbLsY53aZN6/Op7Vmxl
	 ZxB6e+6bYW7qA==
Date: Wed, 26 Feb 2025 08:44:06 -0600
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
From: "Rob Herring (Arm)" <robh@kernel.org>
Cc: paul.barker.ct@bp.renesas.com, linux-renesas-soc@vger.kernel.org, 
 devicetree@vger.kernel.org, thierry.bultel@linatsea.fr, 
 Geert Uytterhoeven <geert+renesas@glider.be>, linux-kernel@vger.kernel.org, 
 geert@linux-m68k.org, linux-clk@vger.kernel.org
To: Thierry Bultel <thierry.bultel.yh@bp.renesas.com>
In-Reply-To: <20250226130935.3029927-3-thierry.bultel.yh@bp.renesas.com>
References: <20250226130935.3029927-1-thierry.bultel.yh@bp.renesas.com>
 <20250226130935.3029927-3-thierry.bultel.yh@bp.renesas.com>
Message-Id: <174058104659.2310461.12120269856378084685.robh@kernel.org>
Subject: Re: [PATCH v3 02/13] dt-bindings: clock: Add cpg for the Renesas
 RZ/T2H SoC


On Wed, 26 Feb 2025 14:09:21 +0100, Thierry Bultel wrote:
> Document RZ/T2H (a.k.a r9a09g077) cpg-mssr (Clock Pulse Generator) binding.
> 
> Signed-off-by: Thierry Bultel <thierry.bultel.yh@bp.renesas.com>
> Reviewed-by: Paul Barker <paul.barker.ct@bp.renesas.com>
> ---
>  .../bindings/clock/renesas,cpg-mssr.yaml      |  4 +-
>  .../clock/renesas,r9a09g077-cpg-mssr.h        | 49 +++++++++++++++++++
>  2 files changed, 52 insertions(+), 1 deletion(-)
>  create mode 100644 include/dt-bindings/clock/renesas,r9a09g077-cpg-mssr.h
> 

My bot found errors running 'make dt_binding_check' on your patch:

yamllint warnings/errors:

dtschema/dtc warnings/errors:
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/clock/renesas,cpg-mssr.example.dtb: clock-controller@e6150000: reg: [[3860135936, 4096]] is too short
	from schema $id: http://devicetree.org/schemas/clock/renesas,cpg-mssr.yaml#

doc reference errors (make refcheckdocs):

See https://patchwork.ozlabs.org/project/devicetree-bindings/patch/20250226130935.3029927-3-thierry.bultel.yh@bp.renesas.com

The base for the series is generally the latest rc1. A different dependency
should be noted in *this* patch.

If you already ran 'make dt_binding_check' and didn't see the above
error(s), then make sure 'yamllint' is installed and dt-schema is up to
date:

pip3 install dtschema --upgrade

Please check and re-submit after running the above command yourself. Note
that DT_SCHEMA_FILES can be set to your schema file to speed up checking
your schema. However, it must be unset to test all examples with your schema.


