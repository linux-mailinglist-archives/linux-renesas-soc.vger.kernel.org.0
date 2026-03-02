Return-Path: <linux-renesas-soc+bounces-28616-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id wPUhGYNApWm36gUAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-28616-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 02 Mar 2026 08:47:15 +0100
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id BC1FA1D41CF
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 02 Mar 2026 08:47:14 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 1BC503006952
	for <lists+linux-renesas-soc@lfdr.de>; Mon,  2 Mar 2026 07:47:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 94913387340;
	Mon,  2 Mar 2026 07:47:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="EFjC6SVc"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-lj1-f182.google.com (mail-lj1-f182.google.com [209.85.208.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1F9ED3859F7
	for <linux-renesas-soc@vger.kernel.org>; Mon,  2 Mar 2026 07:47:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772437632; cv=none; b=KXBrmIHYDGQKfWFCtCEDxMinhPXL3j/OfjxZ7X3NBGw9GkeZ1daqMn8zoDK+uim/yq1YDr3pkvRWT/YRDvuWYaYTOAJnLRMlOZJlJCuC8JRhlWyD96I8Hw/9/idkecFCq1TyYYzooO3mH8whISLsmGTcR8FOFjVNCPXZS9UJwcU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772437632; c=relaxed/simple;
	bh=xSIZpSl0bzT5ncKHIOJrQHcDCKTg9OSZ3st72BWj5dQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=six0DyQaneuQHOQVwW7GqzDTRob8yIKc2jtxcrgSh2gc5sEBhs87RuThxiCtrzzfNZx0mhyA8iZ3g57C96edzuyxhvZN5BNmsWenzh6XDIkUrg7cIE1zH+TGG8ueb5oGHyxFNvLy0ol9F2lBsnsZWrhkDVT6k3rql++Gye35ofw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=EFjC6SVc; arc=none smtp.client-ip=209.85.208.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-lj1-f182.google.com with SMTP id 38308e7fff4ca-3871a08189aso65325001fa.1
        for <linux-renesas-soc@vger.kernel.org>; Sun, 01 Mar 2026 23:47:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1772437629; x=1773042429; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=e68qiM5Z/tLR2me+b5hOCaInO/EcJkXq3qS1H6cb7Bs=;
        b=EFjC6SVc9p/eFXdAZNIgST336R2XCOSFernJ/n2gRKzFc1U2hrJxIruAKk4yhUIS+q
         H2nMCLm7FRMSFxb1533zLePDJ0iEUu/BpOfAdJs47hQQyhMrW8ONnrhEM9TGZqUST6HG
         ZKGJTe+3WIfVLmhjjd2AeCQb70W/CO7IONLAhiQTo/9XJd/s5N4u2Dz/6QTxBUvXfjH8
         bM7ZejXHZMcGJ483hrWMsLalhV7cPIvSvyyINI8x8SCgJDI0K68Fy8uRAucfqeSYQeEe
         vZcqcWj1aAZCf2B1hCLw/UieKQ5Y3GWj5E7rZoOYKTaSCwOizhXxV29SEWvKJaWqyKIp
         ho1Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772437629; x=1773042429;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=e68qiM5Z/tLR2me+b5hOCaInO/EcJkXq3qS1H6cb7Bs=;
        b=jeOpwkENtJcqYZa+HXa3VO71UoxO8ZVXwprtJilnB/BimdaLe8pk00df8zhA2Wneye
         D0zsHmfB7jUTc7D8YfbzpBeQlUymbf4R8gC1iCe6aKuAUIuSuzrFuyFqQSvrI1XKLYvA
         Q0UcZnHj5Bn/TucQYgCG2gSOLZdCBfKu0QTAJkRBCacTtqx4oCb5tEVHuciMarde/eR1
         yA2DH+qM531n8CA0auSoXrnelVWT3SVuyMcK1/bCUaeiyoulRSN5LYWmbpj9FvTmavCd
         wsRfbioMLVD38oOAv5fiopSSDySC8Z/bX+SCsw8Bb2Sq8QJcbb6MtAhxuHvJ+LS/Tcvh
         4ykQ==
X-Forwarded-Encrypted: i=1; AJvYcCUxkD1/cRZLI0y4wkjO3VMPKugl4XdqzUrYp42N2buZhQeDIL9HaI7SAQY8rqIM2i5ROK5JBgkzuFEXsPsfG/cPlQ==@vger.kernel.org
X-Gm-Message-State: AOJu0Yx6KVIlT6uprDzs1cJARaDtEjgO6+bItVq/HhYaXhUul8eJbhnr
	XEgG0e6O4A2cPBzbFYueaylEFWLaXrubAZQcqrftawNlh7p9qhipb1tm
X-Gm-Gg: ATEYQzyMxuZft5CXIMWBCWDXV2H4s/stRufb7wReyU59/FpAOpmQSdZYCSFfmBB3xM1
	AUt/DxH3nx60XSG7lvGgSVgqXEvtOfvBkFEmpTBhzrYOfev0JdmqqyFydtWUC/jtu7N/1gZWwWK
	ZKF9QbsUKSo2bz2P421BvLxAUbFvdP4gttCKSF0iqjdxzdDHY+OCnDgYJtg4PznTx+9lcDLHSBF
	bOIRP7kDISFZe8Qfhadf6644B/HXxcQZ+2iMJnKyJj09lA1fPTRag5v43FWcO40bvfwgQq3+N7M
	n7IUa8jZJc+6GDfmF0DERD+naihGlZ0cZD7XdpBxqMVFfyhG6ubBpNahmUbEwslfkps1JJVWCsx
	Tu3xps0BwbzmHXpF/4AaOvQzf7EUFLEYsoYukRV4SH1D5e8mi8EjAcV5YAgSAExfrmPu/JCN/HZ
	3bnh97dI8gqHr+bnsLR+M2a2jzWA==
X-Received: by 2002:a05:651c:1c7:b0:383:1c5f:84c7 with SMTP id 38308e7fff4ca-389ff130e18mr78428611fa.12.1772437628986;
        Sun, 01 Mar 2026 23:47:08 -0800 (PST)
Received: from [10.38.18.76] ([213.255.186.37])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5a10a319f05sm3299418e87.50.2026.03.01.23.47.07
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 01 Mar 2026 23:47:08 -0800 (PST)
Message-ID: <ac23aec1-6dce-4dd5-8990-9fad40998478@gmail.com>
Date: Mon, 2 Mar 2026 09:47:05 +0200
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 01/12] i2c: allow setting the parent device and OF node
 through the adapter struct
To: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>,
 Wolfram Sang <wsa+renesas@sang-engineering.com>,
 Mukesh Kumar Savaliya <mukesh.savaliya@oss.qualcomm.com>,
 Viken Dadhaniya <viken.dadhaniya@oss.qualcomm.com>,
 Andi Shyti <andi.shyti@kernel.org>,
 Florian Fainelli <florian.fainelli@broadcom.com>, Ray Jui
 <rjui@broadcom.com>, Scott Branden <sbranden@broadcom.com>,
 Broadcom internal kernel review list
 <bcm-kernel-feedback-list@broadcom.com>, Vignesh R <vigneshr@ti.com>,
 Aaro Koskinen <aaro.koskinen@iki.fi>,
 Janusz Krzysztofik <jmkrzyszt@gmail.com>, Tony Lindgren <tony@atomide.com>,
 Andreas Kemnade <andreas@kemnade.info>, Kevin Hilman <khilman@baylibre.com>,
 Roger Quadros <rogerq@kernel.org>,
 Geert Uytterhoeven <geert+renesas@glider.be>,
 Magnus Damm <magnus.damm@gmail.com>,
 Patrice Chotard <patrice.chotard@foss.st.com>,
 Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Fabio Estevam <festevam@gmail.com>, Linus Walleij <linusw@kernel.org>,
 Frank Li <Frank.Li@nxp.com>
Cc: Bartosz Golaszewski <brgl@kernel.org>, linux-i2c@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 linux-omap@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, imx@lists.linux.dev,
 linux-rpi-kernel@lists.infradead.org,
 Matti Vaittinen <mazziesaccount@gmail.com>
References: <20260223-i2c-adap-dev-config-v2-0-d78db0a6fcf7@oss.qualcomm.com>
 <20260223-i2c-adap-dev-config-v2-1-d78db0a6fcf7@oss.qualcomm.com>
Content-Language: en-US
From: Kalle Niemi <kaleposti@gmail.com>
In-Reply-To: <20260223-i2c-adap-dev-config-v2-1-d78db0a6fcf7@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20230601];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-28616-lists,linux-renesas-soc=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_TO(0.00)[oss.qualcomm.com,sang-engineering.com,kernel.org,broadcom.com,ti.com,iki.fi,gmail.com,atomide.com,kemnade.info,baylibre.com,glider.be,foss.st.com,pengutronix.de,nxp.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	FREEMAIL_CC(0.00)[kernel.org,vger.kernel.org,lists.infradead.org,lists.linux.dev,gmail.com];
	RCPT_COUNT_TWELVE(0.00)[35];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[kaleposti@gmail.com,linux-renesas-soc@vger.kernel.org];
	DKIM_TRACE(0.00)[gmail.com:+];
	NEURAL_HAM(-0.00)[-0.999];
	TAGGED_RCPT(0.00)[linux-renesas-soc,renesas];
	MID_RHS_MATCH_FROM(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,qualcomm.com:email]
X-Rspamd-Queue-Id: BC1FA1D41CF
X-Rspamd-Action: no action

On 2/23/26 11:05, Bartosz Golaszewski wrote:
> In order to stop i2c bus drivers from dereferencing the struct device
> embedded in struct i2c_adapter, let's allow configuring the parent
> device and OF-node of the adapter directly through dedicated fields.
> 
> Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
> ---
>   drivers/i2c/i2c-core-base.c | 5 +++++
>   include/linux/i2c.h         | 4 ++++
>   2 files changed, 9 insertions(+)
> 
> diff --git a/drivers/i2c/i2c-core-base.c b/drivers/i2c/i2c-core-base.c
> index 9c46147e3506d15d53b9b7d6b592709de56e41b9..dd8cec9b04c64b8340d20e018ab5ba28f1f7f5c9 100644
> --- a/drivers/i2c/i2c-core-base.c
> +++ b/drivers/i2c/i2c-core-base.c
> @@ -1561,6 +1561,11 @@ static int i2c_register_adapter(struct i2c_adapter *adap)
>   	adap->dev.type = &i2c_adapter_type;
>   	device_initialize(&adap->dev);
>   
> +	if (!adap->dev.parent)
> +		adap->dev.parent = adap->parent;
> +	if (!adap->dev.of_node)
> +		adap->dev.of_node = adap->of_node;
> +
>   	/*
>   	 * This adapter can be used as a parent immediately after device_add(),
>   	 * setup runtime-pm (especially ignore-children) before hand.
> diff --git a/include/linux/i2c.h b/include/linux/i2c.h
> index 20fd41b51d5c85ee1665395c07345faafd8e2fca..72677f29aff161530bc3c497d1e07144a44eb9e4 100644
> --- a/include/linux/i2c.h
> +++ b/include/linux/i2c.h
> @@ -761,6 +761,10 @@ struct i2c_adapter {
>   	struct irq_domain *host_notify_domain;
>   	struct regulator *bus_regulator;
>   
> +	/* Device configuration. */
> +	struct device *parent;
> +	struct device_node *of_node;
> +
>   	struct dentry *debugfs;
>   
>   	/* 7bit address space */
> 

Hello,

Automated driver test system bisected this commit to be the first bad 
commit, linux-next next-20260227 was tested. Failed tests include driver 
tests for ROHM PMIC and accelerometers, which are connected to 
BeagleBone Black.

The failed driver tests all fail to first i2cget and the tests stop 
there: "Could not open file '/dev/i2c-2' or 'dev/i2c/2': No such file or 
directory".

BR
Kalle Niemi


