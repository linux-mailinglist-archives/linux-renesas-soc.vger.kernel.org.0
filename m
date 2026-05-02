Return-Path: <linux-renesas-soc+bounces-31882-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id gF/7M11e9mmoUQIAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-31882-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Sat, 02 May 2026 22:28:13 +0200
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 78EF94B36F9
	for <lists+linux-renesas-soc@lfdr.de>; Sat, 02 May 2026 22:28:13 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 09471300D845
	for <lists+linux-renesas-soc@lfdr.de>; Sat,  2 May 2026 20:28:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 12FDC387345;
	Sat,  2 May 2026 20:28:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="FqBPVkO9"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DCD78273D6D;
	Sat,  2 May 2026 20:28:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777753689; cv=none; b=cWEXsaI+DkPWH96Bq615RAx8XllLJs3xgDvU7Qo07W/QZdXVWELvhiJ+HbMql2m9/Ro+kXo/Xv6P4SjqIPq/FRisEsbJFDSS7bCC2cVHHFnPYMRZq5fKYn38nh4AauzXLiFKdcKFvBGR+W6EDjHbEyPqW0v5MthlW3PLzussT64=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777753689; c=relaxed/simple;
	bh=wRbkd2E40k/miu3YkMKKA9nNsJMs+bJw1b3/I6M3AwQ=;
	h=Date:Content-Type:MIME-Version:From:Cc:To:In-Reply-To:References:
	 Message-Id:Subject; b=RJ2RvVzpXtTJVYgVorfqA09k28fM54/CijToxHBr67ZVIvD0a2ReT8MrrcCtLGWv1lDoTTgbhS2WTQCUTPKoa+5BOY1xhu65m1FNf9D8OK2zk8yW7A0VrkkiMvqcHlVhjRDUFiv+sT0kvhoqemQpg1J8CULAlCHHm/St7bNhO9o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=FqBPVkO9; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3B1DFC19425;
	Sat,  2 May 2026 20:28:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1777753689;
	bh=wRbkd2E40k/miu3YkMKKA9nNsJMs+bJw1b3/I6M3AwQ=;
	h=Date:From:Cc:To:In-Reply-To:References:Subject:From;
	b=FqBPVkO9/xwN4v0u+LK9FbfjH2K6r1xvKXFhR9duvAGEKl28e8z+4K5s9mOo+7KyE
	 WdbrTfuuK2B5FI3Gl6cC/toMDCfucqCXv+bn1MnyfgIwzUmpfOROWpPNrhRqH6cCCS
	 W0X2NREQgwwaEgk39QOsHTRmkTf5X6htBTFEqqZEr3sVtdrp+cYGlaqMiOfKUVkqQT
	 jSfy/+4jwA21QUsdcg433JALfIVt2ixqBDFRdRUQJlH2fGauRxrXKV6h7KjjvKFbWM
	 ccGsPmVAVh0GwiqoDsNcldvGF3Dnqzpa7pWXmwBO6d99csCMdkT+k2sTWhnS3pIhD4
	 FJIQxUwaQt6Pw==
Date: Sat, 02 May 2026 15:28:06 -0500
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
From: "Rob Herring (Arm)" <robh@kernel.org>
Cc: Michael Turquette <mturquette@baylibre.com>, devicetree@vger.kernel.org, 
 linux-clk@vger.kernel.org, linux-renesas-soc@vger.kernel.org, 
 Geert Uytterhoeven <geert+renesas@glider.be>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Stephen Boyd <sboyd@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Magnus Damm <magnus.damm@gmail.com>, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
To: Marek Vasut <marek.vasut+renesas@mailbox.org>
In-Reply-To: <20260502185557.93061-2-marek.vasut+renesas@mailbox.org>
References: <20260502185557.93061-1-marek.vasut+renesas@mailbox.org>
 <20260502185557.93061-2-marek.vasut+renesas@mailbox.org>
Message-Id: <177775368688.2906489.15956699735661007768.robh@kernel.org>
Subject: Re: [PATCH 1/4] dt-bindings: clock: renesas,cpg-clocks: Document
 ZT/ZTR trace clock on R-Mobile APE6
X-Rspamd-Queue-Id: 78EF94B36F9
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [0.34 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCPT_COUNT_TWELVE(0.00)[12];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_CC(0.00)[baylibre.com,vger.kernel.org,glider.be,kernel.org,gmail.com,lists.infradead.org];
	TAGGED_FROM(0.00)[bounces-31882-lists,linux-renesas-soc=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[robh@kernel.org,linux-renesas-soc@vger.kernel.org];
	DKIM_TRACE(0.00)[kernel.org:+];
	TAGGED_RCPT(0.00)[linux-renesas-soc,renesas,dt];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[glider.be:email]


On Sat, 02 May 2026 20:55:42 +0200, Marek Vasut wrote:
> Document ZT trace bus and ZTR trace clock on the R-Mobile APE6.
> These clock supply the coresight tracing modules, PTM, TPIU,
> ETB and replicator. Without these clock, the coresight tracing
> can not be operated. While this does change the ABI, it does so
> by extending the existing clock-output-names, therefore if an
> old software is used with new DT, the coresight tracing parts
> will likely fail to probe, otherwise if new software is used
> with an old DT, there is no impact.
> 
> Signed-off-by: Marek Vasut <marek.vasut+renesas@mailbox.org>
> ---
> Cc: Conor Dooley <conor+dt@kernel.org>
> Cc: Geert Uytterhoeven <geert+renesas@glider.be>
> Cc: Krzysztof Kozlowski <krzk+dt@kernel.org>
> Cc: Magnus Damm <magnus.damm@gmail.com>
> Cc: Michael Turquette <mturquette@baylibre.com>
> Cc: Rob Herring <robh@kernel.org>
> Cc: Stephen Boyd <sboyd@kernel.org>
> Cc: devicetree@vger.kernel.org
> Cc: linux-clk@vger.kernel.org
> Cc: linux-kernel@vger.kernel.org
> Cc: linux-renesas-soc@vger.kernel.org
> ---
>  Documentation/devicetree/bindings/clock/renesas,cpg-clocks.yaml | 2 ++
>  include/dt-bindings/clock/r8a73a4-clock.h                       | 2 ++
>  2 files changed, 4 insertions(+)
> 

My bot found errors running 'make dt_binding_check' on your patch:

yamllint warnings/errors:

dtschema/dtc warnings/errors:
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/clock/renesas,cpg-div6-clock.example.dtb: cpg_clocks@e6150000 (renesas,r8a73a4-cpg-clocks): clock-output-names: ['main', 'pll0', 'pll1', 'pll2', 'pll2s', 'pll2h', 'z', 'z2', 'i', 'm3', 'b', 'm1', 'm2', 'zx', 'zs', 'hp'] is too short
	from schema $id: http://devicetree.org/schemas/clock/renesas,cpg-clocks.yaml

doc reference errors (make refcheckdocs):

See https://patchwork.kernel.org/project/devicetree/patch/20260502185557.93061-2-marek.vasut+renesas@mailbox.org

The base for the series is generally the latest rc1. A different dependency
should be noted in *this* patch.

If you already ran 'make dt_binding_check' and didn't see the above
error(s), then make sure 'yamllint' is installed and dt-schema is up to
date:

pip3 install dtschema --upgrade

Please check and re-submit after running the above command yourself. Note
that DT_SCHEMA_FILES can be set to your schema file to speed up checking
your schema. However, it must be unset to test all examples with your schema.


