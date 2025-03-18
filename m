Return-Path: <linux-renesas-soc+bounces-14582-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id C0277A6731C
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 18 Mar 2025 12:49:47 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id CF6053A8185
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 18 Mar 2025 11:48:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 556F020A5D8;
	Tue, 18 Mar 2025 11:49:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="hHK1V7mI"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 855DC204C16
	for <linux-renesas-soc@vger.kernel.org>; Tue, 18 Mar 2025 11:49:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742298548; cv=none; b=VzNb9sXmPjg8BxrtglbGKAauWKLXCvWz5XX7qBm40MzepxhS/ZOuHUhSaMa4FNSvpPe5X83ySqyDo1cEkU6QUle71Jqt6PGsoBN0B8t5zq9Ljlyaqv0SgdnT4a+LD9oDOYgwn36vRUq5hR7a6/oZ6gFBRH/2cB5yFZDjpEVH3k4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742298548; c=relaxed/simple;
	bh=KxoYITn417uyN3i8B3pdy3asxQq3DsyDyfN10Wrb9IY=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Nt6TDwp9RoF0QBy6FiOBkpNKOMD/8jIjxwiohHWcKTkBl2glkHKusqnpiQZb5C3QNw15AS4xNEVLYhfM72iRjZ+e1wCjcvpTl9TYi/2plk/pXilGQ4mA670ULXsUNty9hunGh5utE1wviG7e3nSbRCaEHDXdZ3R0O9kP/GE1Zkw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=hHK1V7mI; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1742298545;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=+98WTI3qimtBwRWvbDj1dFBf/uuxSj736wvi5kpnIIE=;
	b=hHK1V7mIC3REeRhg7MxFYEVPbmsgJXDSqYYxOEHIPDSpjFfe+VIN3FsWVLtcOO2GffmDz0
	FelcUgIW2yEleNjoS1GXdySPhjSDxs8tUhW0vwFuEJz1s4Olp8Hhi2UvUbppKYgrLGBSkO
	SyrFsGJMoUhq/TJBbCCrfzlRWWypqYA=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-460-wnCOUXm7Mc6ffz2cuO9dfw-1; Tue, 18 Mar 2025 07:49:04 -0400
X-MC-Unique: wnCOUXm7Mc6ffz2cuO9dfw-1
X-Mimecast-MFC-AGG-ID: wnCOUXm7Mc6ffz2cuO9dfw_1742298543
Received: by mail-wr1-f72.google.com with SMTP id ffacd0b85a97d-3912b54611dso3752186f8f.1
        for <linux-renesas-soc@vger.kernel.org>; Tue, 18 Mar 2025 04:49:04 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742298543; x=1742903343;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=+98WTI3qimtBwRWvbDj1dFBf/uuxSj736wvi5kpnIIE=;
        b=kuM8rc15jI3xKPvX5JfM3EaWsMGvmqp7O3vzdr2rlPzZA145rY0xxCuR4JB2I3k/Pi
         RgYVzF72kEyg77s9rj+92sez8PRpWQhPLtRgaY+Ac5KRyBR2+c+4tSHfvpflxUenv0Sf
         JCjyWvui8lOak8y75J1gJWTQfyGMGBlCYuCgY92jOQ3xETaMAR1ut7/syTKfzPR519Ab
         s9Qnx1kV+dGTtG2gVjzK9iG8ds9Zg1JxByQA/t6rD0NTda/W6FRCh//11EeTiSqUxvnk
         FXG6BdPTX7pAGscYMIQ5l/fzitXLLC+sxXMF/V54EpNNkjpw/+YcHemxSK4DCGcGQhmr
         /7Og==
X-Forwarded-Encrypted: i=1; AJvYcCXVVjU8tSJZ5J5W2+XqPlDU4M/xxAa1BUaGw0syXfb2jZfIqK0cng0tqY5h0MGwWyyeRz6fHIk6sIGBFcJJxfXFtQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YwRD0exwuB2ppAhLH/45Zz7GKIp0VN5lYQTuzvpEVPZ+8H9Ij2b
	Fer7FysfViz6ZHZ3u072qO/zr+RcA1qGf00kr4acqZA+4AvQ6mFJ82BFuzBgv7D6UhRyPkZHenf
	NJYMTwMp29Ly7U3HfoldLoxUEEr9eShWPARQBvLfb5LNHlAB7jp3KS5FClEtzmljvkNaU
X-Gm-Gg: ASbGncvNYSxLV9rc3bAUxrzfP0HJxct6u4ZV3VTy74wSXYkoItxC4ac3ZJ2cdVif3ss
	bu2VPe6/S3XvV/oCu/8EvIF6L3z+UqfY7J4dSrKKqeqNn29IaFnwJNLb+JR9Las3UstXsoPNg7d
	SJ1bc+i6VSjLvFhnCFa71E0G6RsNUJkXrmCOOPNn27qx06J/UCp8r28XXBDyh3ebvBV2YdhO6yA
	q9TVQeHUcqdiuFiusjf1EjETSa29z0dyJAsLpRLN1B8fmdqiwq7SrNPf/rUC09tGxafVcvHF0Sw
	7UBIdh9q/L8igpgCzV5rc8JTv2Mvfw7Mz7xTVSZl+baILg==
X-Received: by 2002:adf:8bdb:0:b0:391:1923:5a91 with SMTP id ffacd0b85a97d-3971fadd9e3mr13002762f8f.55.1742298542984;
        Tue, 18 Mar 2025 04:49:02 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGx0IeMONgddVVQsqatQ0bl5f81F+UWy6bvMWzQp6yAeocvppNFdnjEe8Tw47M/ZBSdf4PCXg==
X-Received: by 2002:adf:8bdb:0:b0:391:1923:5a91 with SMTP id ffacd0b85a97d-3971fadd9e3mr13002740f8f.55.1742298542568;
        Tue, 18 Mar 2025 04:49:02 -0700 (PDT)
Received: from [192.168.88.253] (146-241-10-172.dyn.eolo.it. [146.241.10.172])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-395c8975b83sm18462397f8f.52.2025.03.18.04.49.00
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 18 Mar 2025 04:49:02 -0700 (PDT)
Message-ID: <8e804715-3123-4ab5-94ce-625060df4835@redhat.com>
Date: Tue, 18 Mar 2025 12:49:00 +0100
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH net-next v3 3/3] net: stmmac: Add DWMAC glue layer for
 Renesas GBETH
To: Prabhakar <prabhakar.csengg@gmail.com>,
 Andrew Lunn <andrew+netdev@lunn.ch>, "David S. Miller"
 <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>,
 Jakub Kicinski <kuba@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Philipp Zabel <p.zabel@pengutronix.de>,
 Geert Uytterhoeven <geert+renesas@glider.be>,
 "Russell King (Oracle)" <rmk+kernel@armlinux.org.uk>,
 Giuseppe Cavallaro <peppe.cavallaro@st.com>,
 Jose Abreu <joabreu@synopsys.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>
Cc: netdev@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
 Biju Das <biju.das.jz@bp.renesas.com>,
 Fabrizio Castro <fabrizio.castro.jz@renesas.com>,
 Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
References: <20250311221730.40720-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <20250311221730.40720-4-prabhakar.mahadev-lad.rj@bp.renesas.com>
Content-Language: en-US
From: Paolo Abeni <pabeni@redhat.com>
In-Reply-To: <20250311221730.40720-4-prabhakar.mahadev-lad.rj@bp.renesas.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 3/11/25 11:17 PM, Prabhakar wrote:
> @@ -0,0 +1,166 @@
> +// SPDX-License-Identifier: GPL-2.0+
> +/*
> + * dwmac-renesas-gbeth.c - DWMAC Specific Glue layer for Renesas GBETH
> + *
> + * The Rx and Tx clocks are supplied as follows for the GBETH IP.
> + *
> + *                         Rx / Tx
> + *   -------+------------- on / off -------
> + *          |
> + *          |            Rx-180 / Tx-180
> + *          +---- not ---- on / off -------
> + *
> + * Copyright (C) 2025 Renesas Electronics Corporation
> + */
> +
> +#include <linux/clk.h>
> +#include <linux/device.h>
> +#include <linux/module.h>
> +#include <linux/platform_device.h>
> +#include <linux/reset.h>
> +
> +#include "dwmac4.h"
> +#include "stmmac_platform.h"
> +
> +struct renesas_gbeth {
> +	struct plat_stmmacenet_data *plat_dat;
> +	struct reset_control *rstc;
> +	struct device *dev;
> +	void __iomem *regs;
> +};
> +
> +static const char *const renesas_gbeth_clks[] = {
> +	"tx", "tx-180", "rx", "rx-180",
> +};
> +
> +static struct clk *renesas_gbeth_find_clk(struct plat_stmmacenet_data *plat_dat,
> +					  const char *name)
> +{
> +	for (unsigned int i = 0; i < plat_dat->num_clks; i++)
> +		if (!strcmp(plat_dat->clks[i].id, name))
> +			return plat_dat->clks[i].clk;
> +
> +	return NULL;
> +}
> +
> +static int renesas_gbeth_clks_config(void *priv, bool enabled)
> +{
> +	struct renesas_gbeth *gbeth = priv;
> +	struct plat_stmmacenet_data *plat_dat = gbeth->plat_dat;

Minor nit: please respect the reverse christmas tree order above:

	struct plat_stmmacenet_data *plat_dat;
	struct renesas_gbeth *gbeth = priv;

and init plat_dat later.

> +	int ret;
> +
> +	if (enabled) {
> +		ret = reset_control_deassert(gbeth->rstc);
> +		if (ret) {
> +			dev_err(gbeth->dev, "Reset deassert failed\n");
> +			return ret;
> +		}
> +
> +		ret = clk_bulk_prepare_enable(plat_dat->num_clks, plat_dat->clks);
> +		if (ret)
> +			reset_control_assert(gbeth->rstc);
> +	} else {
> +		clk_bulk_disable_unprepare(plat_dat->num_clks, plat_dat->clks);
> +		ret = reset_control_assert(gbeth->rstc);
> +		if (ret)
> +			dev_err(gbeth->dev, "Reset assert failed\n");
> +	}
> +
> +	return ret;
> +}
> +
> +static int renesas_gbeth_probe(struct platform_device *pdev)
> +{
> +	struct plat_stmmacenet_data *plat_dat;
> +	struct stmmac_resources stmmac_res;
> +	struct device *dev = &pdev->dev;
> +	struct renesas_gbeth *gbeth;
> +	unsigned int i;
> +	int err;
> +
> +	err = stmmac_get_platform_resources(pdev, &stmmac_res);
> +	if (err)
> +		return dev_err_probe(dev, err,
> +				     "failed to get resources\n");
> +
> +	plat_dat = devm_stmmac_probe_config_dt(pdev, stmmac_res.mac);
> +	if (IS_ERR(plat_dat))
> +		return dev_err_probe(dev, PTR_ERR(plat_dat),
> +				     "dt configuration failed\n");
> +
> +	gbeth = devm_kzalloc(dev, sizeof(*gbeth), GFP_KERNEL);
> +	if (!gbeth)
> +		return -ENOMEM;
> +
> +	plat_dat->num_clks = ARRAY_SIZE(renesas_gbeth_clks);
> +	plat_dat->clks = devm_kcalloc(dev, plat_dat->num_clks,
> +				      sizeof(*plat_dat->clks), GFP_KERNEL);
> +	if (!plat_dat->clks)
> +		return -ENOMEM;
> +
> +	for (i = 0; i < plat_dat->num_clks; i++)
> +		plat_dat->clks[i].id = renesas_gbeth_clks[i];
> +
> +	err = devm_clk_bulk_get(dev, plat_dat->num_clks, plat_dat->clks);
> +	if (err < 0)
> +		return err;
> +
> +	plat_dat->clk_tx_i = renesas_gbeth_find_clk(plat_dat, "tx");
> +	if (!plat_dat->clk_tx_i)
> +		return dev_err_probe(dev, -EINVAL,
> +				     "error finding tx clock\n");
> +
> +	gbeth->rstc = devm_reset_control_get_exclusive(dev, NULL);
> +	if (IS_ERR(gbeth->rstc))
> +		return PTR_ERR(gbeth->rstc);
> +
> +	gbeth->dev = dev;
> +	gbeth->regs = stmmac_res.addr;
> +	gbeth->plat_dat = plat_dat;
> +	plat_dat->bsp_priv = gbeth;
> +	plat_dat->set_clk_tx_rate = stmmac_set_clk_tx_rate;
> +	plat_dat->clks_config = renesas_gbeth_clks_config;
> +	plat_dat->flags |= STMMAC_FLAG_HWTSTAMP_CORRECT_LATENCY |
> +			   STMMAC_FLAG_EN_TX_LPI_CLK_PHY_CAP |

The above does not compile:

../drivers/net/ethernet/stmicro/stmmac/dwmac-renesas-gbeth.c:124:7:
error: use of undeclared identifier 'STMMAC_FLAG_EN_TX_LPI_CLK_PHY_CAP'


> +			   STMMAC_FLAG_SPH_DISABLE;
> +
> +	err = renesas_gbeth_clks_config(gbeth, true);
> +	if (err)
> +		return err;
> +
> +	err = stmmac_dvr_probe(dev, plat_dat, &stmmac_res);
> +	if (err) {
> +		renesas_gbeth_clks_config(gbeth, false);
> +		return err;

Just:

	if (err)
		renesas_gbeth_clks_config(gbeth, false);

	return err;

Thanks,

Paolo


