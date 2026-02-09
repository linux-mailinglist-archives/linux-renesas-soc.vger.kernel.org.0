Return-Path: <linux-renesas-soc+bounces-28066-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id +OiFKlHYiWn+CQAAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-28066-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 09 Feb 2026 13:51:29 +0100
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id E115610F13D
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 09 Feb 2026 13:51:28 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id E6A2D303EAA1
	for <lists+linux-renesas-soc@lfdr.de>; Mon,  9 Feb 2026 11:32:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9D0A236F422;
	Mon,  9 Feb 2026 11:32:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="NF/aN/bJ"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 78BF63019A4;
	Mon,  9 Feb 2026 11:32:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770636768; cv=none; b=PEayCTUNZV4mm7fecdUcVHe6DZifl8I6gldcPniwcqsBTrsk9vABdX2wCjJVsLMfROfBsfW7aAk8vSNoAAxsGKx6GkQ6TnILXq7WXbkNLoJebbhstKmYzjKt1Tv+Em5xLURbnQWci3i6lEWcDKIRSpUKxBCUHuGPZIDLt/yj89g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770636768; c=relaxed/simple;
	bh=Mvbxx1LculKOJSfhOUjjeKWJ+RH827nTj9tMh9urmcY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=mUOvevs5EPqMiJtaHBcyM5GoYegD430GBrSBGD3Bj9TBtH3kYnt8Qu9cTmWWSdMdWN0zmsjcKUzVMe5EoB8H9GoWiiVYB/BGxbmvu/4T2QmWX6IhkK0bLOzbZfot5yzIXT6+Z6+h5bLN6q/MJ0i9w3FjbGGNF/6/ixge8G42hj4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=NF/aN/bJ; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CD80DC116C6;
	Mon,  9 Feb 2026 11:32:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1770636767;
	bh=Mvbxx1LculKOJSfhOUjjeKWJ+RH827nTj9tMh9urmcY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=NF/aN/bJfvaU2iTMSDgj3uD7JPZ1zmqGCHDbA2+bWM0KSnL7yGXXxDdLMNRR/XJH/
	 TGKh/9UgZFiJJrwzNzuNkd19ppiOs3FbsZC9pOL2zDAiXM8ia63LzJ+mZ+IKOPLuuV
	 ZIBk2WGfjlD2zEvMNJEaBXq/mIUzIEfkDEDTx45LtghJsZPnGWsmhWx2Ailp7UtR4U
	 C6XAbOKQaprgS5OowBjRXO2j3Axk4jnmqrsbrw6NrmFFc1aY26DuBq+jgSkZWBP3k2
	 nAY7E3K8G0bEGtesr/I0Jjwj0PRkhiqBiaT5GBnHFBP6/+gNOLV0pAC7FR2/PdZi4n
	 gRco2BT8AxXwg==
Date: Mon, 9 Feb 2026 17:02:38 +0530
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
Subject: Re: [PATCH v3 5/9] arm64: defconfig: enable pci-pwrctrl-generic as
 module
Message-ID: <aiqugfosf722bus23ma4kagmnldmvyi3pb2ddrxvo46cfevwml@pmp2t3untn5i>
References: <20260206-topic-sm8650-ayaneo-pocket-s2-base-v3-0-5b79c5d61a03@linaro.org>
 <20260206-topic-sm8650-ayaneo-pocket-s2-base-v3-5-5b79c5d61a03@linaro.org>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260206-topic-sm8650-ayaneo-pocket-s2-base-v3-5-5b79c5d61a03@linaro.org>
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
	TAGGED_FROM(0.00)[bounces-28066-lists,linux-renesas-soc=lfdr.de];
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
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[linaro.org:email,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: E115610F13D
X-Rspamd-Action: no action

On Fri, Feb 06, 2026 at 03:50:33PM +0100, Neil Armstrong wrote:
> Enable the generic power control driver module since it's required
> to power up the PCIe USB3 controller found on the Ayaneo Pocket S2
> gaming console.
> 
> Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>

Acked-by: Manivannan Sadhasivam <mani@kernel.org>

- Mani

> ---
>  arch/arm64/configs/defconfig | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/arch/arm64/configs/defconfig b/arch/arm64/configs/defconfig
> index 35e9eb180c9a..5efcd4943a4b 100644
> --- a/arch/arm64/configs/defconfig
> +++ b/arch/arm64/configs/defconfig
> @@ -250,6 +250,7 @@ CONFIG_PCIE_LAYERSCAPE_GEN4=y
>  CONFIG_PCI_ENDPOINT=y
>  CONFIG_PCI_ENDPOINT_CONFIGFS=y
>  CONFIG_PCI_EPF_TEST=m
> +CONFIG_PCI_PWRCTRL_GENERIC=m
>  CONFIG_DEVTMPFS=y
>  CONFIG_DEVTMPFS_MOUNT=y
>  CONFIG_FW_LOADER_USER_HELPER=y
> 
> -- 
> 2.34.1
> 

-- 
மணிவண்ணன் சதாசிவம்

