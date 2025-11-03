Return-Path: <linux-renesas-soc+bounces-24053-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [IPv6:2605:f480:58:1:0:1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id E54EEC2E256
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 03 Nov 2025 22:25:08 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id BFCC74E253C
	for <lists+linux-renesas-soc@lfdr.de>; Mon,  3 Nov 2025 21:25:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 949752C327C;
	Mon,  3 Nov 2025 21:25:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="M3O0vVKu"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 69BEC1C8631;
	Mon,  3 Nov 2025 21:25:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762205105; cv=none; b=Ro5ZW6ae9GjKTEkG3VsT51sim6b3yjdfIeZBf7wE5gfQjZyQcvYIR9q8q9Cb3fRNdoaOR85giC+haRZX9reqRpFVtu4VXu5vt3k3gFsDuQ0nKUXXpqOMrHZSigb5d4lozrmRI/I+JLvwCHIpEN+bbJU6syVXEAd43mE50CIYJF4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762205105; c=relaxed/simple;
	bh=5SW+M+piEdcut7wiZauOpMLcAQB1GEqW+ZFiV8x/4ns=;
	h=Date:Content-Type:MIME-Version:From:Cc:To:In-Reply-To:References:
	 Message-Id:Subject; b=mP3RswhLCPZszhmmcxkzGUjP4l3KxTgLekB+UZtJa2cEak1kGYIsCjLtHlHQqufZfEGUYZbkkc8ypnv27ICnBFpNZuR3fBLDsM9sNxXKmz+sXcjRRU3ZoU+5Zr47gNDOEYr+VKtuRLUY9/HALmBj6sL93jsmZe5whbbyCTOClaQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=M3O0vVKu; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A9BE0C4CEE7;
	Mon,  3 Nov 2025 21:25:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1762205104;
	bh=5SW+M+piEdcut7wiZauOpMLcAQB1GEqW+ZFiV8x/4ns=;
	h=Date:From:Cc:To:In-Reply-To:References:Subject:From;
	b=M3O0vVKurqo7mlr+paY9tACQTmH5nqB6A04gSAEo9iIeKvDyVXKS7NYXEaTQ96Byz
	 4eX21Rnuuw1qVwzeG/MWUvMnVg82mVX04J4ha+MQEFCcxGHuBZ+f2MpUP3nea9cIBp
	 Nc17otO3497TIo1YfTnmy8gfSvFeHiRsUEIZm9c6cOfqaFcPG3utA/IDfoCuuMMIJd
	 W97wX9guG62HdhlrVYzO6F08ctijcGTLgrH/oQYye0Evm2EKQHrJ9UApdI5dUtDxvX
	 CMvjQcUMSrEpTGN/aK5qFdx93/Ec7zYDozXTphoukr19N3AlxUMS83X/kWbMfMyzW6
	 Vm7aCsox7sAUw==
Date: Mon, 03 Nov 2025 15:25:03 -0600
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
From: "Rob Herring (Arm)" <robh@kernel.org>
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Frank Binns <frank.binns@imgtec.com>, David Airlie <airlied@gmail.com>, 
 Magnus Damm <magnus.damm@gmail.com>, 
 Geert Uytterhoeven <geert+renesas@glider.be>, 
 Thomas Zimmermann <tzimmermann@suse.de>, 
 =?utf-8?q?Niklas_S=C3=B6derlund?= <niklas.soderlund@ragnatech.se>, 
 devicetree@vger.kernel.org, dri-devel@lists.freedesktop.org, 
 Conor Dooley <conor+dt@kernel.org>, linux-renesas-soc@vger.kernel.org, 
 Simona Vetter <simona@ffwll.ch>, Maxime Ripard <mripard@kernel.org>, 
 linux-arm-kernel@lists.infradead.org, Matt Coster <matt.coster@imgtec.com>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>
To: Marek Vasut <marek.vasut+renesas@mailbox.org>
In-Reply-To: <20251103200800.173440-1-marek.vasut+renesas@mailbox.org>
References: <20251103200800.173440-1-marek.vasut+renesas@mailbox.org>
Message-Id: <176220510312.151857.16110569802113794225.robh@kernel.org>
Subject: Re: [PATCH 1/2] dt-bindings: gpu: img,powervr-rogue: Document
 GE7800 GPU in Renesas R-Car M3-N


On Mon, 03 Nov 2025 21:07:35 +0100, Marek Vasut wrote:
> Document Imagination Technologies PowerVR Rogue GE7800 BNVC 15.5.1.64
> present in Renesas R-Car R8A77965 M3-N SoC.
> 
> Signed-off-by: Marek Vasut <marek.vasut+renesas@mailbox.org>
> ---
> Cc: Conor Dooley <conor+dt@kernel.org>
> Cc: David Airlie <airlied@gmail.com>
> Cc: Frank Binns <frank.binns@imgtec.com>
> Cc: Geert Uytterhoeven <geert+renesas@glider.be>
> Cc: Krzysztof Kozlowski <krzk+dt@kernel.org>
> Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
> Cc: Magnus Damm <magnus.damm@gmail.com>
> Cc: Matt Coster <matt.coster@imgtec.com>
> Cc: Maxime Ripard <mripard@kernel.org>
> Cc: "Niklas Söderlund" <niklas.soderlund@ragnatech.se>
> Cc: Rob Herring <robh@kernel.org>
> Cc: Simona Vetter <simona@ffwll.ch>
> Cc: Thomas Zimmermann <tzimmermann@suse.de>
> Cc: devicetree@vger.kernel.org
> Cc: dri-devel@lists.freedesktop.org
> Cc: linux-renesas-soc@vger.kernel.org
> ---
>  .../devicetree/bindings/gpu/img,powervr-rogue.yaml          | 6 ++++++
>  1 file changed, 6 insertions(+)
> 

My bot found errors running 'make dt_binding_check' on your patch:

yamllint warnings/errors:
./Documentation/devicetree/bindings/gpu/img,powervr-rogue.yaml:107:1: [warning] too many blank lines (2 > 1) (empty-lines)

dtschema/dtc warnings/errors:

doc reference errors (make refcheckdocs):

See https://patchwork.ozlabs.org/project/devicetree-bindings/patch/20251103200800.173440-1-marek.vasut+renesas@mailbox.org

The base for the series is generally the latest rc1. A different dependency
should be noted in *this* patch.

If you already ran 'make dt_binding_check' and didn't see the above
error(s), then make sure 'yamllint' is installed and dt-schema is up to
date:

pip3 install dtschema --upgrade

Please check and re-submit after running the above command yourself. Note
that DT_SCHEMA_FILES can be set to your schema file to speed up checking
your schema. However, it must be unset to test all examples with your schema.


