Return-Path: <linux-renesas-soc+bounces-28267-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 4PNGHAtHk2mi3AEAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-28267-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 16 Feb 2026 17:34:19 +0100
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id 76ABD1463C2
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 16 Feb 2026 17:34:18 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id A63F13002D0D
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 16 Feb 2026 16:34:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C410F330D58;
	Mon, 16 Feb 2026 16:34:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="PFFnijLk"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9EAD32DB7BA;
	Mon, 16 Feb 2026 16:34:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771259654; cv=none; b=swhf/0WAKps7jVzftwyTd0L/EPYpzhswJy56Or+IeMlNdvruDE5IaLjGXTwam3OCX5cEAqN84jq8HFj6Y0rXShUz4EwGXOIKO04b1FT9Nu0eaEwwep4cELYHBfYCDhih7iEtoVD+g/HKYmzSiFvd8JY97n2LhDHbxdkZ87MdKaU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771259654; c=relaxed/simple;
	bh=DSO7juqfmfW7oKAhFKPvUWiA+uzAywrPCsZ2T4u2n+s=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=nSNbjCAKlqrj1XXDghsQOmpnuDDLvgNBK/Ho9n+V6Wo4nd46hc5MCuF3ugfPrmZWMn5XDWLEFY0cHfO8QwPzfZxgwz0oYLkMhv24WG5trbd+IM2b9fKz9NFuNCr/HgLm8FG9rk+WG/ER1Uq1Ly8zhyj/g/aCam8FXkGMrZcViu4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=PFFnijLk; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 68A93C116C6;
	Mon, 16 Feb 2026 16:34:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1771259654;
	bh=DSO7juqfmfW7oKAhFKPvUWiA+uzAywrPCsZ2T4u2n+s=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=PFFnijLk1WOlnUFZZQuP3Y4lVX5VXZrNUnlMD7ytlxmN1LoxdVSzk+5k+kSh1VH6t
	 ffUid6aicbm7y/3w4iEMR0HiMZ59v8zpzv0E3JC9Q+W0HvyihMyF9/suIjdC2E74r+
	 xN/Pf9UpZlALcBHXIrTP4CGpDliOH2GTcHL62SVbGn4YfRc0bBx3coS9KRbRb54uXq
	 TuYaWUdHJnkTLz/ygLBoMguZjekWXAZnv7G7GVuzclHnP7UETXQzbDb6DJhnctxqpX
	 VxDm7sUVJG5izooNAtqU4zOX+ldO/Rsr2g34pPcy9bb9dohe3uEvpZOcstUDNOICHC
	 bkgaqJtV8utqA==
Date: Mon, 16 Feb 2026 22:03:56 +0530
From: Manivannan Sadhasivam <mani@kernel.org>
To: Neil Armstrong <neil.armstrong@linaro.org>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Geert Uytterhoeven <geert+renesas@glider.be>, 
	Magnus Damm <magnus.damm@gmail.com>, Bartosz Golaszewski <brgl@kernel.org>, 
	Bjorn Helgaas <bhelgaas@google.com>, Bjorn Andersson <andersson@kernel.org>, 
	Konrad Dybcio <konradybcio@kernel.org>, linux-usb@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-renesas-soc@vger.kernel.org, linux-pci@vger.kernel.org, 
	linux-arm-msm@vger.kernel.org
Subject: Re: [PATCH v4 4/9] pci: pwrctrl: generic: support for the
 UPD720201/UPD720202 USB 3.0 xHCI Host Controller
Message-ID: <hovswnih526tvtuc2s4vktrhb7co2oha5r64fvf4wpx5ixp4c7@ydt4es7bkwq7>
References: <20260216-topic-sm8650-ayaneo-pocket-s2-base-v4-0-802c82795431@linaro.org>
 <20260216-topic-sm8650-ayaneo-pocket-s2-base-v4-4-802c82795431@linaro.org>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260216-topic-sm8650-ayaneo-pocket-s2-base-v4-4-802c82795431@linaro.org>
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.16 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	MID_RHS_NOT_FQDN(0.50)[];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-28267-lists,linux-renesas-soc=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	RCVD_COUNT_THREE(0.00)[4];
	RCPT_COUNT_TWELVE(0.00)[17];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[kernel.org:+];
	TO_DN_SOME(0.00)[];
	TAGGED_RCPT(0.00)[linux-renesas-soc,dt,renesas];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[mani@kernel.org,linux-renesas-soc@vger.kernel.org];
	FREEMAIL_CC(0.00)[linuxfoundation.org,kernel.org,glider.be,gmail.com,google.com,vger.kernel.org];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns,linaro.org:email]
X-Rspamd-Queue-Id: 76ABD1463C2
X-Rspamd-Action: no action

On Mon, Feb 16, 2026 at 03:21:48PM +0100, Neil Armstrong wrote:
> Enable the generic pwrctrl driver to control the power of the
> PCIe UPD720201/UPD720202 USB 3.0 xHCI Host Controller.
> 
> Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>

Reviewed-by: Manivannan Sadhasivam <mani@kernel.org>

- Mani

> ---
>  drivers/pci/pwrctrl/generic.c | 4 ++++
>  1 file changed, 4 insertions(+)
> 
> diff --git a/drivers/pci/pwrctrl/generic.c b/drivers/pci/pwrctrl/generic.c
> index a5b7b7965f46..1afda639f0c4 100644
> --- a/drivers/pci/pwrctrl/generic.c
> +++ b/drivers/pci/pwrctrl/generic.c
> @@ -73,6 +73,10 @@ static const struct of_device_id pci_pwrctrl_generic_of_match[] = {
>  	{
>  		.compatible = "pciclass,0604",
>  	},
> +	/* Renesas UPD720201/UPD720202 USB 3.0 xHCI Host Controller */
> +	{
> +		.compatible = "pci1912,0014",
> +	},
>  	{ }
>  };
>  MODULE_DEVICE_TABLE(of, pci_pwrctrl_generic_of_match);
> 
> -- 
> 2.34.1
> 

-- 
மணிவண்ணன் சதாசிவம்

