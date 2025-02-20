Return-Path: <linux-renesas-soc+bounces-13440-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 88305A3E392
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 20 Feb 2025 19:16:03 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 710B819C1068
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 20 Feb 2025 18:16:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 921BC214212;
	Thu, 20 Feb 2025 18:15:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="HN+Fu6ow"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5E3DA212D83;
	Thu, 20 Feb 2025 18:15:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740075356; cv=none; b=KuDwyU1InR2cra8ZhxYY6fQrGShgxcILTb4rdHCmgwOhjm4C8vAgenCshhs6sH5X929yO02Qp6iZ9yhVK7tBUk5B2MumNBhUYTpaQBYcfUQKnfHMAKYz3tWAemRV9MH7wU7h9d172f+Kb8QAxQBKCUACGLygZWJT+1DYvSRHgZ0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740075356; c=relaxed/simple;
	bh=pXZMKzzYYg2ZzL6hhYg/dSMY9TOUI17UUV6T2oswPNU=;
	h=Date:Content-Type:MIME-Version:From:Cc:To:In-Reply-To:References:
	 Message-Id:Subject; b=T7BNFvilq5NhSfrbHLcidEyZlwMc1SGE7SSmIcyeHcrCcrQX34i4/Cd/25cfzPdR0nu/xKYSxcHuSZ6ONuIOBcBFhqbvajZwS5fBY+q0nUazZzgIlXgCQMsJv+m42Agneym8Kc7leqRCq6AONOTW9/u9JEwebXzyHNbhKocynvU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=HN+Fu6ow; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8EE9EC4CED1;
	Thu, 20 Feb 2025 18:15:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1740075355;
	bh=pXZMKzzYYg2ZzL6hhYg/dSMY9TOUI17UUV6T2oswPNU=;
	h=Date:From:Cc:To:In-Reply-To:References:Subject:From;
	b=HN+Fu6owbbSdAO12UCxvkCKglYK6ULsESp0b5X4bmkghqjDvD2Af4kblKeQqxFwNk
	 cBtkfqu5PiA3Z6DfAWszErsIQ+DSeRS3nVW48RBqX+d9+NV5jhLrJkLiOHW7vM9pQa
	 Y/Q1HLb3bvVfnWTWXeroU9uF3dJa8TNtAfHZzqGRskh2roiC8IMoMaA8DASYo1UtJU
	 lB5noWBLe6UMIVvqDIHOjMhdb4xYqgZrio1Pvn0bVKqqEx9fHI8wBby806DswVdLHt
	 9G8HH2E8t8jr4j6U8AfoJIYt37pQ1dN3GuhEk5TN6R3Sfrq085w00opmRbbGuBIVnF
	 3xZL0//vZBqZQ==
Date: Thu, 20 Feb 2025 12:15:54 -0600
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
From: "Rob Herring (Arm)" <robh@kernel.org>
Cc: claudiu.beznea.uj@bp.renesas.com, geert+renesas@glider.be, 
 rui.zhang@intel.com, sboyd@kernel.org, linux-renesas-soc@vger.kernel.org, 
 biju.das.jz@bp.renesas.com, devicetree@vger.kernel.org, 
 p.zabel@pengutronix.de, lukasz.luba@arm.com, rafael@kernel.org, 
 conor+dt@kernel.org, mturquette@baylibre.com, john.madieu@gmail.com, 
 linux-kernel@vger.kernel.org, krzk+dt@kernel.org, magnus.damm@gmail.com, 
 linux-clk@vger.kernel.org, daniel.lezcano@linaro.org
To: John Madieu <john.madieu.xa@bp.renesas.com>
In-Reply-To: <20250220152640.49010-4-john.madieu.xa@bp.renesas.com>
References: <20250220152640.49010-1-john.madieu.xa@bp.renesas.com>
 <20250220152640.49010-4-john.madieu.xa@bp.renesas.com>
Message-Id: <174007535477.3240838.6529561683095110061.robh@kernel.org>
Subject: Re: [PATCH 3/7] dt-bindings: thermal: r9a09g047-tsu: Document the
 TSU unit


On Thu, 20 Feb 2025 16:26:08 +0100, John Madieu wrote:
> The Renesas RZ/G3E SoC includes a Thermal Sensor Unit (TSU) block designed
> to measure the junction temperature. The device provides real-time temperature
> measurements for thermal management, utilizing a single dedicated channel
> (channel 1) for temperature sensing.
> 
> Signed-off-by: John Madieu <john.madieu.xa@bp.renesas.com>
> ---
>  .../thermal/renesas,r9a09g047-tsu.yaml        | 123 ++++++++++++++++++
>  1 file changed, 123 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/thermal/renesas,r9a09g047-tsu.yaml
> 

My bot found errors running 'make dt_binding_check' on your patch:

yamllint warnings/errors:

dtschema/dtc warnings/errors:
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/thermal/renesas,r9a09g047-tsu.example.dtb: thermal@14002000: reg: [[0, 335552512], [0, 4096]] is too long
	from schema $id: http://devicetree.org/schemas/thermal/renesas,r9a09g047-tsu.yaml#

doc reference errors (make refcheckdocs):

See https://patchwork.ozlabs.org/project/devicetree-bindings/patch/20250220152640.49010-4-john.madieu.xa@bp.renesas.com

The base for the series is generally the latest rc1. A different dependency
should be noted in *this* patch.

If you already ran 'make dt_binding_check' and didn't see the above
error(s), then make sure 'yamllint' is installed and dt-schema is up to
date:

pip3 install dtschema --upgrade

Please check and re-submit after running the above command yourself. Note
that DT_SCHEMA_FILES can be set to your schema file to speed up checking
your schema. However, it must be unset to test all examples with your schema.


