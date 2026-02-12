Return-Path: <linux-renesas-soc+bounces-28173-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id +EEsOi7vjWlw8wAAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-28173-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 12 Feb 2026 16:18:06 +0100
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 616C912ED11
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 12 Feb 2026 16:18:06 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 0C9393041D4E
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 12 Feb 2026 15:18:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AD9E11E5714;
	Thu, 12 Feb 2026 15:18:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="klC2+tU5"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 856697E110;
	Thu, 12 Feb 2026 15:18:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770909480; cv=none; b=M3aj0hF63O/9l2u7TyIL4kWGPPrpURuywcCZOb8EOGA1wZF7FXUnO5pC32GAyeE6fzs2563TPbR6FLZ7TPmtsOCa2rmgSvbQhYFGgtBzFg6hBLOHAOz+zbeTi+upqOIqIN/bq/NKk8NFVlLTYBEUTFks7xt9GwGCaG7Tg+P6PHM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770909480; c=relaxed/simple;
	bh=GNWaPpbr53BU3Z840pm9s1F3R3YM8PUA8uCQhf9EXyk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=glkbaMrLkSkUZEuRob784FCaL61gftwxIWkBny/uTMt9oPSSuhypYVv4TG9LX0qYa1Dxk0EbM4R5O/oHr3wl+VJJR/K4gF7RjddA/nrRGgC2A6pgnLjyzVXC4aWp8Wmv1tHG9rQ0gKRJ9/WSjRPuD6ZInCgaffAOm+tlCcOU/jw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=klC2+tU5; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8C9A8C19425;
	Thu, 12 Feb 2026 15:17:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1770909480;
	bh=GNWaPpbr53BU3Z840pm9s1F3R3YM8PUA8uCQhf9EXyk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=klC2+tU5ThyeaPGiln5kckSlgVK801hTcmdB64aKcQtluNwnGEb+N29aJ4mrAqWIg
	 38Mm4pu/e7bYwLL0ujY6BYSMHD1nXV+t5CPpKSBrxFd4RX42863yQTuRcPpj6i+Nko
	 TXHo/7Yy136kkxCE9uNU01qQSPefY8yMTu5xYVQ/hSjqqtsRhLRi8QbeVPw/VXUPqx
	 3gpCSunUXMgOcb8B5nZDmmMWLmTOwnIlFrU6LMRu0daaCgmuTNTlO6xImpeni1QYJD
	 DXVigqwGyL4IkzMlc4auTqqCPa04NruKsLZEpCPQ9tPHYhY4+wSL0+00bDXj3zFtoh
	 TNjDhElNtAyEQ==
Date: Thu, 12 Feb 2026 09:17:56 -0600
From: Bjorn Andersson <andersson@kernel.org>
To: Neil Armstrong <neil.armstrong@linaro.org>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Geert Uytterhoeven <geert+renesas@glider.be>, 
	Magnus Damm <magnus.damm@gmail.com>, Bartosz Golaszewski <brgl@kernel.org>, 
	Manivannan Sadhasivam <mani@kernel.org>, Bjorn Helgaas <bhelgaas@google.com>, 
	Konrad Dybcio <konradybcio@kernel.org>, linux-usb@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-renesas-soc@vger.kernel.org, linux-pci@vger.kernel.org, 
	linux-arm-msm@vger.kernel.org
Subject: Re: [PATCH v3 1/9] dt-bindings: usb: document the Renesas
 UPD720201/UPD720202 USB 3.0 xHCI Host Controller
Message-ID: <7kkwkjnucx3cpvegilske2qd4u24vvjkykrljosi2uyknte4bz@3xvh57q5lpcv>
References: <20260206-topic-sm8650-ayaneo-pocket-s2-base-v3-0-5b79c5d61a03@linaro.org>
 <20260206-topic-sm8650-ayaneo-pocket-s2-base-v3-1-5b79c5d61a03@linaro.org>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260206-topic-sm8650-ayaneo-pocket-s2-base-v3-1-5b79c5d61a03@linaro.org>
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.16 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	MID_RHS_NOT_FQDN(0.50)[];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-28173-lists,linux-renesas-soc=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_CC(0.00)[linuxfoundation.org,kernel.org,glider.be,gmail.com,google.com,vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[17];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[andersson@kernel.org,linux-renesas-soc@vger.kernel.org];
	DKIM_TRACE(0.00)[kernel.org:+];
	TAGGED_RCPT(0.00)[linux-renesas-soc,dt,renesas];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	MISSING_XM_UA(0.00)[];
	TO_DN_SOME(0.00)[]
X-Rspamd-Queue-Id: 616C912ED11
X-Rspamd-Action: no action

On Fri, Feb 06, 2026 at 03:50:29PM +0100, Neil Armstrong wrote:
> Document the Renesas UPD720201/UPD720202 USB 3.0 xHCI Host Controller,
> which connects over PCIe and requires specific power supplies to
> start up.
> 
> Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>
> ---
>  .../bindings/usb/renesas,upd720201-pci.yaml        | 61 ++++++++++++++++++++++
>  1 file changed, 61 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/usb/renesas,upd720201-pci.yaml b/Documentation/devicetree/bindings/usb/renesas,upd720201-pci.yaml
> new file mode 100644
> index 000000000000..34acee62cdd2
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/usb/renesas,upd720201-pci.yaml
> @@ -0,0 +1,61 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/usb/renesas,upd720201-pci.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: UPD720201/UPD720202 USB 3.0 xHCI Host Controller (PCIe)
> +
> +maintainers:
> +  - Neil Armstrong <neil.armstrong@linaro.org>
> +
> +description:
> +  UPD720201 USB 3.0 xHCI Host Controller via PCIe x1 Gen2 interface.
> +  The UPD720202 supports up to two downstream ports, while UPD720201
> +  supports up to four downstream USB 3.0 rev1.0 ports.
> +
> +properties:
> +  compatible:
> +    const: pci1912,0014
> +
> +  reg:
> +    maxItems: 1
> +
> +  avdd33-supply:
> +    description: +3.3 V power supply for analog circuit
> +
> +  vdd10-supply:
> +    description: +1.05 V power supply
> +
> +  vdd33-supply:
> +    description: +3.3 V power supply
> +
> +required:
> +  - compatible
> +  - reg
> +  - avdd33-supply
> +  - vdd10-supply
> +  - vdd33-supply
> +
> +allOf:
> +  - $ref: usb-xhci.yaml
> +
> +additionalProperties: false

I'm trying to hang a onboard_hub off this controller and #address-cells,
#size-cells, and hub@ comes back as invalid children. 

I think this should be unevaluatedProperties instead.

Regards,
Bjorn

> +
> +examples:
> +  - |
> +    pcie@0 {
> +        reg = <0x0 0x1000>;
> +        ranges = <0x02000000 0x0 0x100000 0x10000000 0x0 0x0>;
> +        #address-cells = <3>;
> +        #size-cells = <2>;
> +        device_type = "pci";
> +
> +        usb-controller@0 {
> +            compatible = "pci1912,0014";
> +            reg = <0x0 0x0 0x0 0x0 0x0>;
> +            avdd33-supply = <&avdd33_reg>;
> +            vdd10-supply = <&vdd10_reg>;
> +            vdd33-supply = <&vdd33_reg>;
> +        };
> +    };
> 
> -- 
> 2.34.1
> 

