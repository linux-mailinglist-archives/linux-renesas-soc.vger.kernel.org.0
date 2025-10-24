Return-Path: <linux-renesas-soc+bounces-23567-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 72B49C04B48
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 24 Oct 2025 09:25:12 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 284D81B83B44
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 24 Oct 2025 07:24:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E7BD62C15A2;
	Fri, 24 Oct 2025 07:24:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ht+RB1WQ"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B5BFA2C17B2;
	Fri, 24 Oct 2025 07:24:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761290666; cv=none; b=e8ANyOWLnnzoB+oxLcv6ggDu+GKAJADiSFijxDopxgR8Sua1UBmJtGoIzmt+xW5xVAcw1lZ3iY16eZfz0BRZKxXxeo8PE3fXYfqeMlJA6Sz6mdPCwU0AoMSrenbfkxcy3SXAzMU6RyFW92IgiEQRVv13h7M3glNFGRVLG2Gckv8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761290666; c=relaxed/simple;
	bh=/+iVZvQGKLCjJzivsf6ZdBYrYGaAvtC11M0ZNDgvHXQ=;
	h=Date:Content-Type:MIME-Version:From:Cc:To:In-Reply-To:References:
	 Message-Id:Subject; b=B992H3DxI7wtraG/3HwHOX4BWLQENpHrjKIHX86HLmTLNKur/vk3XkuP9p3TEWLlvd3TpYDrxPlTuqX1BKhPc46UxIXiAC//SMG6Za28i0NPdJeXB0Sg6IB5k8tyj9Gc4gM/L1WdeX3iZJyuHPsll3lmK8bPVknKPBaRzy5A5b4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ht+RB1WQ; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 04638C4CEF1;
	Fri, 24 Oct 2025 07:24:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1761290666;
	bh=/+iVZvQGKLCjJzivsf6ZdBYrYGaAvtC11M0ZNDgvHXQ=;
	h=Date:From:Cc:To:In-Reply-To:References:Subject:From;
	b=ht+RB1WQjzl3r2LGJtTfZbUi5x6phiIAVfhL8vc2JaHuPCt2BaoW1RAZjXR7PFUdB
	 KCPhiYJTfO3UJTAYoDP05ubFeJMEIhQvHrd34Qcsgd0T2MpHT/WDk+RwGPPTepv4Nv
	 V7JIExd6xyvizCKN8hVBzEvLkTVjdJ3yttkutceJLm8EX6GSHd3jAr7Cv/vhYx+odI
	 hZCMHqAkbMbeIVtBTctA15YBSkhfutZi6wT23A1pW9qAF/oKt8JXT+clohmMJPE5Q8
	 HQy85DlX7cM+IdRhx0rGmdz0gbnfOEzRNm4gMnskkpNJkEYTQd/uenzX8OSUQCnTVs
	 4eZEHJWhft3Wg==
Date: Fri, 24 Oct 2025 02:24:24 -0500
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 8bit
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
From: "Rob Herring (Arm)" <robh@kernel.org>
Cc: Jassi Brar <jassisinghbrar@gmail.com>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Geert Uytterhoeven <geert+renesas@glider.be>, devicetree@vger.kernel.org, 
 linux-renesas-soc@vger.kernel.org
To: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
In-Reply-To: <87bjlwn7j9.wl-kuninori.morimoto.gx@renesas.com>
References: <87frb8n7kl.wl-kuninori.morimoto.gx@renesas.com>
 <87bjlwn7j9.wl-kuninori.morimoto.gx@renesas.com>
Message-Id: <176129066419.661728.14767654389778601283.robh@kernel.org>
Subject: Re: [PATCH 3/3] dt-bindings: mailbox: Add Renesas MFIS Mailbox


On Fri, 24 Oct 2025 06:22:18 +0000, Kuninori Morimoto wrote:
> Add device tree bindings for the Renesas Multifunctional Interface
> (MFIS) a mailbox controller.
> 
> Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
> ---
>  .../mailbox/renesas,mfis-mailbox.yaml         | 49 +++++++++++++++++++
>  1 file changed, 49 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/mailbox/renesas,mfis-mailbox.yaml
> 

My bot found errors running 'make dt_binding_check' on your patch:

yamllint warnings/errors:

dtschema/dtc warnings/errors:
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/mailbox/renesas,mfis-mailbox.example.dtb: mfis_mbox@18842000 (renesas,mfis-mbox): compatible:0: 'anyOf' conditional failed, one must be fixed:
	'renesas,mfis-mbox' does not match '^renesas,(emev2|r(7s|8a|9a)[a-z0-9]+|rcar|rmobile|rz[a-z0-9]*|sh(7[a-z0-9]+)?|mobile)-[a-z0-9-]+$'
	'renesas,mfis-mbox' does not match '^renesas,(condor|falcon|gr-peach|gray-hawk|salvator|sk-rz|smar(c(2)?)?|spider|white-hawk)(.*)?$'
	'renesas,mfis-mbox' does not match '^renesas,(can|cpg|dmac|du|(g)?ether(avb)?|gpio|hscif|(r)?i[i2]c|imr|intc|ipmmu|irqc|jpu|mmcif|msiof|mtu2|pci(e)?|pfc|pwm|[rq]spi|rcar_sound|sata|scif[ab]*|sdhi|thermal|tmu|tpu|usb(2|hs)?|vin|xhci)-[a-z0-9-]+$'
	'renesas,mfis-mbox' does not match '^renesas,(d|s)?bsc(3)?-(r8a73a4|r8a7740|sh73a0)$'
	'renesas,mfis-mbox' does not match '^renesas,em-(gio|sti|uart)$'
	'renesas,mfis-mbox' does not match '^renesas,fsi2-(r8a7740|sh73a0)$'
	'renesas,mfis-mbox' does not match '^renesas,hspi-r8a777[89]$'
	'renesas,mfis-mbox' does not match '^renesas,sysc-(r8a73a4|r8a7740|rmobile|sh73a0)$'
	'renesas,mfis-mbox' is not one of ['renesas,imr-lx4', 'renesas,mtu2-r7s72100']
	'renesas,mfis-mbox' is not one of ['renesas,smp-sram']
	'renesas,mfis-mbox' does not match '^(?!renesas,.+-.+).+$'
	from schema $id: http://devicetree.org/schemas/soc/renesas/renesas-soc.yaml

doc reference errors (make refcheckdocs):

See https://patchwork.ozlabs.org/project/devicetree-bindings/patch/87bjlwn7j9.wl-kuninori.morimoto.gx@renesas.com

The base for the series is generally the latest rc1. A different dependency
should be noted in *this* patch.

If you already ran 'make dt_binding_check' and didn't see the above
error(s), then make sure 'yamllint' is installed and dt-schema is up to
date:

pip3 install dtschema --upgrade

Please check and re-submit after running the above command yourself. Note
that DT_SCHEMA_FILES can be set to your schema file to speed up checking
your schema. However, it must be unset to test all examples with your schema.


