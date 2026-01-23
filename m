Return-Path: <linux-renesas-soc+bounces-27362-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id KCSpCgGWc2lgxQAAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-27362-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 23 Jan 2026 16:38:41 +0100
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id D5A2477D9E
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 23 Jan 2026 16:38:39 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 329113006930
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 23 Jan 2026 15:38:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 829902D0C9A;
	Fri, 23 Jan 2026 15:38:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="GdI2exVD"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4B01E27CCF0;
	Fri, 23 Jan 2026 15:38:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769182713; cv=none; b=HqCDG+zSadlJCuRn1IAeN5vsghmsf5d5bIM+nDYkcsgF9eWAKTyuzr4ELcEIZxrUBKoFPaKBeEmBzq1ycHh0TOE8hjZXSDWqNf1QYs3wdQHK+ZZvkB4uVf8MAXLBNnJjaGF/UK0qZUxfXnxAeyb5dYuzAou34vpb+B1xqa/JNHs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769182713; c=relaxed/simple;
	bh=USnlgfT/ZGNTEXTWlzmQfKhta1kQIV4DdpxEHcZH41I=;
	h=Date:Content-Type:MIME-Version:From:Cc:To:In-Reply-To:References:
	 Message-Id:Subject; b=rm0vDSqsV+KCqchXEcwoHKS2qLbFXPnHx6bXshLwAS7U0HxcwnrEuNeig+fddyPylPKDyVljX3ZFnBqXoUmJYC4uXvSQdDtiGUIRXbJgnV8b0yAROAHxvYYFtvDdMXugGm5JA3Zy2/k+FbNbv0wkUBgcoqfGnuH+5kq2g51+6fI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=GdI2exVD; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BFFE1C4CEF1;
	Fri, 23 Jan 2026 15:38:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1769182712;
	bh=USnlgfT/ZGNTEXTWlzmQfKhta1kQIV4DdpxEHcZH41I=;
	h=Date:From:Cc:To:In-Reply-To:References:Subject:From;
	b=GdI2exVDLt45OOmu3tLo20vyLFAUM1i0ZuPvouchQGcNnKp/iRfsrQBGOfmyUkayk
	 03+3a8LkMCdLns4Lbw09XWbX5iFHuC4ShYkQQhYjEQjIOQywK6PXiII7QRYQrBhxL5
	 ddBAOTzK3KPGvl77I2oYiWv7aMQv/ioIBtCsDT/UOnMkEPrs+3ztjjOegCdTnvKd87
	 U0o/Cbj6Xm0VdTdQ9IVpHlDoTlZGKrvrjomxP2ziTGR9mqxCl4CfYubNCue7ABl4O6
	 9CEwxNXCLyHASfE0jekDLsMCCdAidbSPcsMtctlulrwfTww5kOm5DaSjmH9Uv7pgSs
	 +VF/oVAnSayKQ==
Date: Fri, 23 Jan 2026 09:38:31 -0600
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
From: "Rob Herring (Arm)" <robh@kernel.org>
Cc: linux-clk@vger.kernel.org, biju.das.jz@bp.renesas.com, 
 john.madieu@gmail.com, linux-renesas-soc@vger.kernel.org, 
 kwilczynski@kernel.org, lpieralisi@kernel.org, mani@kernel.org, 
 bhelgaas@google.com, magnus.damm@gmail.com, devicetree@vger.kernel.org, 
 linux-pci@vger.kernel.org, geert+renesas@glider.be, 
 claudiu.beznea.uj@bp.renesas.com, krzk+dt@kernel.org, conor+dt@kernel.org
To: John Madieu <john.madieu.xa@bp.renesas.com>
In-Reply-To: <20260123140031.94752-7-john.madieu.xa@bp.renesas.com>
References: <20260123140031.94752-1-john.madieu.xa@bp.renesas.com>
 <20260123140031.94752-7-john.madieu.xa@bp.renesas.com>
Message-Id: <176918271191.2157131.3302295737226885391.robh@kernel.org>
Subject: Re: [PATCH v2 06/15] dt-bindings: PCI: renesas,r9a08g045s33-pcie:
 Document RZ/G3E SoC
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [0.34 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCPT_COUNT_TWELVE(0.00)[16];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_CC(0.00)[vger.kernel.org,bp.renesas.com,gmail.com,kernel.org,google.com,glider.be];
	TAGGED_FROM(0.00)[bounces-27362-lists,linux-renesas-soc=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-0.985];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[robh@kernel.org,linux-renesas-soc@vger.kernel.org];
	DKIM_TRACE(0.00)[kernel.org:+];
	TAGGED_RCPT(0.00)[linux-renesas-soc,renesas,dt];
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns,renesas.com:email,devicetree.org:url]
X-Rspamd-Queue-Id: D5A2477D9E
X-Rspamd-Action: no action


On Fri, 23 Jan 2026 15:00:22 +0100, John Madieu wrote:
> Extend the existing device tree bindings for Renesas RZ/G3S PCIe
> controller to include support for the RZ/G3E (renesas,r9a09g047e57-pcie) PCIe
> controller. The RZ/G3E PCIe controller is similar to RZ/G3S but has some key
> differences:
> 
>  - Uses a different device ID
>  - Supports PCIe Gen3 (8.0 GT/s) link speeds
>  - Uses a different clock naming (clkpmu vs clkl1pm)
>  - Has a different set of interrupts, interrupt ordering, and reset signals
> 
> Add device tree bindings for renesas,r9a09g047e57-pcie compatible IPs.
> 
> Signed-off-by: John Madieu <john.madieu.xa@bp.renesas.com>
> ---
> 
> Changes:
> 
> v2: Reuse G3S names
> 
>  .../bindings/pci/renesas,r9a08g045-pcie.yaml  | 127 +++++++++++++-----
>  1 file changed, 96 insertions(+), 31 deletions(-)
> 

My bot found errors running 'make dt_binding_check' on your patch:

yamllint warnings/errors:

dtschema/dtc warnings/errors:
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/pci/renesas,r9a08g045-pcie.yaml: properties:reset-names: {'minItems': 1, 'maxItems': 7, 'items': [{'const': 'aresetn'}, {'const': 'rst_b'}, {'const': 'rst_gp_b'}, {'const': 'rst_ps_b'}, {'const': 'rst_rsm_b'}, {'const': 'rst_cfg_b'}, {'const': 'rst_load_b'}]} should not be valid under {'required': ['maxItems']}
	hint: "maxItems" is not needed with an "items" list
	from schema $id: http://devicetree.org/meta-schemas/items.yaml

doc reference errors (make refcheckdocs):

See https://patchwork.kernel.org/project/devicetree/patch/20260123140031.94752-7-john.madieu.xa@bp.renesas.com

The base for the series is generally the latest rc1. A different dependency
should be noted in *this* patch.

If you already ran 'make dt_binding_check' and didn't see the above
error(s), then make sure 'yamllint' is installed and dt-schema is up to
date:

pip3 install dtschema --upgrade

Please check and re-submit after running the above command yourself. Note
that DT_SCHEMA_FILES can be set to your schema file to speed up checking
your schema. However, it must be unset to test all examples with your schema.


