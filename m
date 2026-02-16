Return-Path: <linux-renesas-soc+bounces-28265-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 0JnmItxGk2l83AEAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-28265-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 16 Feb 2026 17:33:32 +0100
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id E1AC614637D
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 16 Feb 2026 17:33:31 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id EE95D300A119
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 16 Feb 2026 16:27:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9D73133290B;
	Mon, 16 Feb 2026 16:27:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="DH2SgyPc"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 78A0A2C0F8C;
	Mon, 16 Feb 2026 16:27:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771259257; cv=none; b=HBmZq/4p7WCIHjV6lfMv11KCoIRMkzE7ZE3UZJwPxORWT6k2heLawUxci89zJp5YrjWD4W9bsNKAtq7m04x+7gLdZgk2OoOOav7fn/tn/C2tK7E2N+ARNh9O0w+yT4oYVJBDpeM3t27RntnS+QRPLAMLEOz7Turzg39NJ3dDzyI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771259257; c=relaxed/simple;
	bh=+H5mKMCDJNc/qLxDERdZhixKg4LKT1aSL3hlRSk0nms=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=uAPR/tML3G/M8OoFnKequHKQvoUoA3T9BpYTcu3e2tTIkn7IK2RJdlwtuS8fmHOCExbb3fQXljP7Yib4ZtxBg/2kyPAjGn1sdHfasvI9pzq5i8GsX0hjgZrWVaNOBR7qaUq0SxBOzoRQRHCEC56ZiU8UH9CT6zjl4VxeY5l30ug=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=DH2SgyPc; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1E482C19423;
	Mon, 16 Feb 2026 16:27:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1771259257;
	bh=+H5mKMCDJNc/qLxDERdZhixKg4LKT1aSL3hlRSk0nms=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=DH2SgyPcTjIShNu2OspU97jjLkn10EGuspVaZEYyGfyEhbBCrpV7WtR0MAkhpxNgH
	 +Th7sQX1+mio563yxt5C7CZM5CaYOEuzBI5HYARp3hpGGF39dRFZ+q1LlFDgIkw94W
	 9ge/NSVWYaRn8HK8sKNrjXe/r4+CiajQU+gfZqWqM24UdVJKoE0gr9C3/ZnmDOV+EK
	 nBoRVbYtIhGTaVrZ2+I4Xinc5zwtHOJjtuB6LWSZ4ws6lymdXiUmjKAOy9GBg7r34l
	 00NHCfem916fuCoG1Jk1nLIMCXtjann65OA9V70afR+McV9juCINMEnaNMFWek8FnQ
	 obBQcHnRvZ0kQ==
Date: Mon, 16 Feb 2026 21:57:20 +0530
From: Manivannan Sadhasivam <mani@kernel.org>
To: Neil Armstrong <neil.armstrong@linaro.org>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Geert Uytterhoeven <geert+renesas@glider.be>, 
	Magnus Damm <magnus.damm@gmail.com>, Bartosz Golaszewski <brgl@kernel.org>, 
	Bjorn Helgaas <bhelgaas@google.com>, Bjorn Andersson <andersson@kernel.org>, 
	Konrad Dybcio <konradybcio@kernel.org>, linux-usb@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-renesas-soc@vger.kernel.org, linux-pci@vger.kernel.org, 
	linux-arm-msm@vger.kernel.org, Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Subject: Re: [PATCH v4 2/9] pci: pwrctrl: slot: fix dev_err_probe() usage
Message-ID: <ly73vzmdqmk6xml2kz2u3klglmuscnttu4j6seguofdezqhjfh@vsrtpt2enetk>
References: <20260216-topic-sm8650-ayaneo-pocket-s2-base-v4-0-802c82795431@linaro.org>
 <20260216-topic-sm8650-ayaneo-pocket-s2-base-v4-2-802c82795431@linaro.org>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260216-topic-sm8650-ayaneo-pocket-s2-base-v4-2-802c82795431@linaro.org>
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.16 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	MID_RHS_NOT_FQDN(0.50)[];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-28265-lists,linux-renesas-soc=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	RCVD_COUNT_THREE(0.00)[4];
	RCPT_COUNT_TWELVE(0.00)[18];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[kernel.org:+];
	TO_DN_SOME(0.00)[];
	TAGGED_RCPT(0.00)[linux-renesas-soc,dt,renesas];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[mani@kernel.org,linux-renesas-soc@vger.kernel.org];
	FREEMAIL_CC(0.00)[linuxfoundation.org,kernel.org,glider.be,gmail.com,google.com,vger.kernel.org,oss.qualcomm.com];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:email,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,linaro.org:email]
X-Rspamd-Queue-Id: E1AC614637D
X-Rspamd-Action: no action

On Mon, Feb 16, 2026 at 03:21:46PM +0100, Neil Armstrong wrote:
> The code was not returning dev_err_probe() but dev_err_probe()
> returns the error code, so simplify the code.
> 
> Suggested-by: Bartosz Golaszewski <brgl@kernel.org>
> Reviewed-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
> Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>

Reviewed-by: Manivannan Sadhasivam <mani@kernel.org>

- Mani

> ---
>  drivers/pci/pwrctrl/slot.c | 12 ++++--------
>  1 file changed, 4 insertions(+), 8 deletions(-)
> 
> diff --git a/drivers/pci/pwrctrl/slot.c b/drivers/pci/pwrctrl/slot.c
> index 3320494b62d8..08e53243cdbd 100644
> --- a/drivers/pci/pwrctrl/slot.c
> +++ b/drivers/pci/pwrctrl/slot.c
> @@ -40,17 +40,14 @@ static int pci_pwrctrl_slot_probe(struct platform_device *pdev)
>  
>  	ret = of_regulator_bulk_get_all(dev, dev_of_node(dev),
>  					&slot->supplies);
> -	if (ret < 0) {
> -		dev_err_probe(dev, ret, "Failed to get slot regulators\n");
> -		return ret;
> -	}
> +	if (ret < 0)
> +		return dev_err_probe(dev, ret, "Failed to get slot regulators\n");
>  
>  	slot->num_supplies = ret;
>  	ret = regulator_bulk_enable(slot->num_supplies, slot->supplies);
>  	if (ret < 0) {
> -		dev_err_probe(dev, ret, "Failed to enable slot regulators\n");
>  		regulator_bulk_free(slot->num_supplies, slot->supplies);
> -		return ret;
> +		return dev_err_probe(dev, ret, "Failed to enable slot regulators\n");
>  	}
>  
>  	ret = devm_add_action_or_reset(dev, devm_pci_pwrctrl_slot_power_off,
> @@ -59,10 +56,9 @@ static int pci_pwrctrl_slot_probe(struct platform_device *pdev)
>  		return ret;
>  
>  	clk = devm_clk_get_optional_enabled(dev, NULL);
> -	if (IS_ERR(clk)) {
> +	if (IS_ERR(clk))
>  		return dev_err_probe(dev, PTR_ERR(clk),
>  				     "Failed to enable slot clock\n");
> -	}
>  
>  	pci_pwrctrl_init(&slot->ctx, dev);
>  
> 
> -- 
> 2.34.1
> 

-- 
மணிவண்ணன் சதாசிவம்

