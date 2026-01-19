Return-Path: <linux-renesas-soc+bounces-27042-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id E64AAD3AB21
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 19 Jan 2026 15:06:12 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id D0890300F1B1
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 19 Jan 2026 14:03:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 772D036C0AF;
	Mon, 19 Jan 2026 14:03:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b="oijIVXgQ"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7C06F36D4E1
	for <linux-renesas-soc@vger.kernel.org>; Mon, 19 Jan 2026 14:03:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768831433; cv=none; b=t/IFq8/87j9fC6KTa8duXFWfRKoMcnYby0W055q1pkhXY4zVnCEIazXPUTjMztryuUVX4JzoqJIK69ZLEgsjp08sAwu7G2HuQpYNqtjoDXPPRywNBRYDL4z/wD6G60T8ys6WWiK48KdRv826zFjQ7D8fHDXB4FSC6M6fumL0Hj8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768831433; c=relaxed/simple;
	bh=mTAE+Uz1BGS1b5G0yeV0TYVfbfqnRu+U7F6kK79xBH4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=h19swCfx9Jnd1zgIuccdWyyPy1kxcMbb3BHywUHPUUPjj9EUnSi+TLdHUUmqPKt0xxmbnTHb+9D+GejGrarMLvMvHEOrRYcVvtjFng3hajXoI/ZFWQ3n/MCmi5lxQOAbBjmpbREiP8GlZI4Sk1bTPX/kuCsnepGytpYVhXIf92o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev; spf=pass smtp.mailfrom=tuxon.dev; dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b=oijIVXgQ; arc=none smtp.client-ip=209.85.128.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=tuxon.dev
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-47ee974e230so35202955e9.2
        for <linux-renesas-soc@vger.kernel.org>; Mon, 19 Jan 2026 06:03:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tuxon.dev; s=google; t=1768831429; x=1769436229; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Qi0fMsnbGNNAqeW2KXFtzgi15jKwvRfrQtKC+NHQLH0=;
        b=oijIVXgQ4xqiS2NrmPLq6TR0f50MbnFwamEvVEThd4u5/cgjFxI8Fpocc0jELJE8Un
         wzvavK7XRcjYMvB11KowGsyzSBDjqwkxWPYeBGg3vb6zoCSfcvuvxqk4VvVngzLEblPe
         Q62S41vvzGwYYP/wqJlp2PvMr6Uq10aOT4gO+2lj39uGKOsACT3+oBnNPeH9aB+gErew
         6Km1zv/o/EhoBpzf+u273glZp17hZLZB+jjPOy/FEz2+x3P5WMpUaeehYmsWAK1SxkmZ
         YTV1PyclP+6opjHTt9Y/AsH4McuFDDSi78LsqpYdLxP6EuyYphQB1hlB245BmCzbm8zu
         gXpQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768831429; x=1769436229;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Qi0fMsnbGNNAqeW2KXFtzgi15jKwvRfrQtKC+NHQLH0=;
        b=V1ge1rz3hxne8h4ISd1WcH1w6vLp1g5FG+DTia4BeaXL+kPIThxxP6I5WSejWOnSwN
         wr51XbJCPqR/GJr5ttD/RAQc94gErh98uY+3WyC0jXrdrqtokWiZO589NkP3gqN3ntJ4
         1JjPdT2oyRmOZD6d50pDCtvC0LN5DN97rZ9VFuJKLa9PD2DlhBk47tR5Zv5U2gbmYiV7
         Uf3xrfPVO0/WJCMHQ/0UA+WFt16ImPtEJDOWYHyE2BeeKAspmpx+gb/Ssou8bn9npMZy
         NcKsRBVj/Z3qTsE/M4a35+Tx+lZbmeTTXGCv1eVNYIE35X8skpdAahaO5UZh0KKzom8F
         VNhg==
X-Forwarded-Encrypted: i=1; AJvYcCUCmpnwLATE+d0p36XWyoNpI9JKtOT2RSbJTGd739Fb2dApX9RdwE+DoU4WHmfPKTv2KemCYpH55/8BJ0OZg0/MuQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YyH5gKLK1dht/myZUVPdxYPzxDc1UZUz6UlO+fXMw2c/XO+EThd
	rHkT8+D1lcpsbvPXm6TJdWmwf/PKh2x32jSCzKkB3eeTa8leVc4DJhGrgrB520dVwYFEtN4L6fp
	XvmHA
X-Gm-Gg: AY/fxX6EQVi3Nxcan1zt+3nyCtlXPJ4L1iXAMfu7PMDlIHul8/bH2M1rzDmAQ2hjLTI
	TcpTzEcoPjMtB9nGHqSvFTAv09ai4gJVIOhaa+xsvPrKst1ajPLQOcDq8FKv7TeEIALfNQPI+zr
	aY6zvzqrXMBI5S/0juo6j5dUTCk79H81ERhQICm9wR4NKUSKWYTIJytzUlKR9ci0a8LG7uEJApZ
	a4LxbDdKpCyo9aizkmKGMYGqEZb4IFzFntGCqzqi99hn0yg3WdHKOsBzgVZzmMlntJP2+uk+cJA
	MoYQGNqU5oZzw40X4sW7+I/i7VMqK8HOdpnINBrFwz7u4Ud1fdTUh/AcHiQl7pjZ75ZYDc6CYrx
	XFLWL+dNuK49vPd8Y3amB/8VNtk9ntQsdgsdvubBFHzlaalk1IkRkcMGIbGBM/8TBwpUgdrktgJ
	qqjLDvtz2feguV4VjOJw==
X-Received: by 2002:a05:600c:c48e:b0:47e:e970:b4e4 with SMTP id 5b1f17b1804b1-4801e3494b7mr155374755e9.29.1768831428511;
        Mon, 19 Jan 2026 06:03:48 -0800 (PST)
Received: from [192.168.50.4] ([82.78.167.31])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-47f3b7a5f94sm266035795e9.0.2026.01.19.06.03.46
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 19 Jan 2026 06:03:47 -0800 (PST)
Message-ID: <fb7ec096-372b-48f4-b6ed-e224a05d55e2@tuxon.dev>
Date: Mon, 19 Jan 2026 16:03:45 +0200
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 01/16] PCI: rzg3s-host: Fix reset handling in probe error
 path
To: John Madieu <john.madieu.xa@bp.renesas.com>,
 claudiu.beznea.uj@bp.renesas.com, lpieralisi@kernel.org,
 kwilczynski@kernel.org, mani@kernel.org, geert+renesas@glider.be,
 krzk+dt@kernel.org
Cc: robh@kernel.org, bhelgaas@google.com, conor+dt@kernel.org,
 magnus.damm@gmail.com, biju.das.jz@bp.renesas.com,
 linux-pci@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
 devicetree@vger.kernel.org, linux-clk@vger.kernel.org, john.madieu@gmail.com
References: <20260114153337.46765-1-john.madieu.xa@bp.renesas.com>
 <20260114153337.46765-2-john.madieu.xa@bp.renesas.com>
Content-Language: en-US
From: Claudiu Beznea <claudiu.beznea@tuxon.dev>
In-Reply-To: <20260114153337.46765-2-john.madieu.xa@bp.renesas.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi, John,

On 1/14/26 17:33, John Madieu wrote:
> Fix incorrect reset_control_bulk_deassert() call in the probe error
> path. When unwinding from a failed pci_host_probe(), the configuration
> resets should be asserted to restore the hardware to its initial state,
> not deasserted again.
> 
> Fixes: 7ef502fb35b2 ("PCI: rzg3s-host: Add Renesas RZ/G3S SoC host driver")

The title of the commit with SHA1 7ef502fb35b2 is "PCI: Add Renesas RZ/G3S host 
controller driver". With that addressed:

Reviewed-by: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>

> Signed-off-by: John Madieu <john.madieu.xa@bp.renesas.com>
> ---
>   drivers/pci/controller/pcie-rzg3s-host.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/pci/controller/pcie-rzg3s-host.c b/drivers/pci/controller/pcie-rzg3s-host.c
> index 5aa58638903f..c1053f95bc95 100644
> --- a/drivers/pci/controller/pcie-rzg3s-host.c
> +++ b/drivers/pci/controller/pcie-rzg3s-host.c
> @@ -1588,7 +1588,7 @@ static int rzg3s_pcie_probe(struct platform_device *pdev)
>   
>   host_probe_teardown:
>   	rzg3s_pcie_teardown_irqdomain(host);
> -	reset_control_bulk_deassert(host->data->num_cfg_resets,
> +	reset_control_bulk_assert(host->data->num_cfg_resets,
>   				    host->cfg_resets);
>   rpm_put:
>   	pm_runtime_put_sync(dev);


