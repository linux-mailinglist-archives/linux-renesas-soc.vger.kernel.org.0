Return-Path: <linux-renesas-soc+bounces-17654-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id BF880AC74C2
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 29 May 2025 02:01:53 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 7B5AA5011FA
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 29 May 2025 00:01:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4AEDA5228;
	Thu, 29 May 2025 00:01:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=fastly.com header.i=@fastly.com header.b="DV50x740"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-pf1-f171.google.com (mail-pf1-f171.google.com [209.85.210.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1D3BBB67A
	for <linux-renesas-soc@vger.kernel.org>; Thu, 29 May 2025 00:01:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748476906; cv=none; b=SEBxCPwrK2DkjQ8CdoIjv24I31XTyF8IP6FUcuAQaEYHbBEwlWUgIsIMupBHEq+HFWmXkx85jhwqgQ+kGpeWArY4PaAFN1EtRpAqPZ+wZ1swSwOF9aKs4UxxxU+t+/85fxprZfOtAqnnWrUa6sqL8+dz+dSRKOSoCG3LmASibQI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748476906; c=relaxed/simple;
	bh=T3juE1hOUm6DFe5iT/pHd3UmRK7XfYewH+PUs5EwYN8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=rKJcXggNpbjd79DmadLE+r1mgwwwO7LJDhGOUSiOWOktUd6WgnQPUY8h5EmceFkK8elmX2fIuM26wXY50vMiwAWMyAV4c580ztc8ij3OxUw3ZNeO5zWu06pFSuFTgHlB0T8DgBPcxYOKU0NFkd/YRObBrWZ7vOrkpFgpczNFSYw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=fastly.com; spf=pass smtp.mailfrom=fastly.com; dkim=pass (1024-bit key) header.d=fastly.com header.i=@fastly.com header.b=DV50x740; arc=none smtp.client-ip=209.85.210.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=fastly.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fastly.com
Received: by mail-pf1-f171.google.com with SMTP id d2e1a72fcca58-742c035f2afso170259b3a.2
        for <linux-renesas-soc@vger.kernel.org>; Wed, 28 May 2025 17:01:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=fastly.com; s=google; t=1748476903; x=1749081703; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references
         :mail-followup-to:message-id:subject:cc:to:from:date:from:to:cc
         :subject:date:message-id:reply-to;
        bh=HHrYl8KlTDJV9fZehVT6wNYFoGVLZmH/YM7SP1Otey4=;
        b=DV50x740ZiLdVCWqwMXcv60Mn8RJ2GTIDm9RssFMLLKlsTVJ7qvZwzKSQvTUMFKcDm
         pX9NFcvIoO6gQTqCB/XXC+I4YTZDJf2DJaP1h2NtUzIB009Rr8fxhRLWX0mbOhsFihZJ
         Ipefk4NVQBOSKfNa6+g3fpZlkts8X2YOoSY5s=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748476903; x=1749081703;
        h=in-reply-to:content-disposition:mime-version:references
         :mail-followup-to:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=HHrYl8KlTDJV9fZehVT6wNYFoGVLZmH/YM7SP1Otey4=;
        b=CpGiezQuT8OJ0MlGfS8zl9gEsHDZk4FXL+l/LcIGxUqKLkhGXa/B266LRnjlz/SVhB
         mo6hfZ0F4fslJnZGxqY6bUnwvyt7ddxwRB2R5ZZWK6jkGdXct5PmUYjoPD0oQarqozW3
         /aPPTN4yTPgkKzjzOisSlOiDv5Df2HrVqkc/88xRIplx8t0qxyG+po1hFlVipT9EMzqB
         qrL2zN+awLkB96lUnMm+Oh46oxEBNWmkYm+Q78HLVfk7UxWBruVoNPeGdWLdwJ1rd9gw
         mjOQXZ5tFyU49Ssurmjq9OYT6RM5Bn1gScOtwchL/qf+gH9i9ipJUR7Hda4AZSj193aY
         H8/Q==
X-Forwarded-Encrypted: i=1; AJvYcCUzN77JW00x6Lkz1FrQ+Cu59RWxx+aCbwvX8M6ma5pN1+NmaasdhAZxepWbx/LWqd5d+00P6JC65tXXlvMt2T5IGQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YxOfV/m350ba/cirG1WkrcN2YErXiCT05YVfdkNrOHBsC6NRmtg
	DRck7NIKZsTo2Rx70Dwc79d81JKd1NyjKSAvmATlZ0THiuOx7JZsGewTA1d2vgMxh5I=
X-Gm-Gg: ASbGncsY2lxnIR2MpRl8partzh5hURF8tgMffMSToArca+3NGwfUsQz3yBALLoXyXlh
	Rhf9jGqkOzR6j32OvEDwyqq5M0YbuEW/SBEjXIADk3XOcEq2C+OthqdnuWnbd55d2g5u8P/z8B7
	57QxNiUvo9crP6F13vVIVqRbtDL/COrIXMyL7Jl5raWMbAjy0qgPIZyMBt58F6n6H7Ys9C/NGTy
	NI2aGzfiIoyAyBukdv5BNppeENfqyw385H4TT4KCbtyy6dSUvVroQHgzLiDg1czgM3HBHiguQHO
	psR2GMK53HjVWqpwojkybU/fQaiQYH8ZABHvrLwW0OZ2NY23MAHQzZKU615x61I0h8jTpbQPy8d
	2I7mskhqxw60p12MfWI3vXko=
X-Google-Smtp-Source: AGHT+IGh6QFynq+YuUMFZqTG/73Ufan/2rkYRYNy6qC4rW91iir86PkvuJN/O02OksGF7UPuPg4WFQ==
X-Received: by 2002:a05:6a00:1407:b0:742:a77b:8c3 with SMTP id d2e1a72fcca58-747b0c72ba6mr275550b3a.4.1748476901844;
        Wed, 28 May 2025 17:01:41 -0700 (PDT)
Received: from LQ3V64L9R2 (c-24-6-151-244.hsd1.ca.comcast.net. [24.6.151.244])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-747affafaebsm165546b3a.87.2025.05.28.17.01.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 28 May 2025 17:01:41 -0700 (PDT)
Date: Wed, 28 May 2025 17:01:38 -0700
From: Joe Damato <jdamato@fastly.com>
To: Haoxiang Li <haoxiang_li2024@163.com>
Cc: niklas.soderlund@ragnatech.se, andrew+netdev@lunn.ch,
	davem@davemloft.net, edumazet@google.com, kuba@kernel.org,
	pabeni@redhat.com, richardcochran@gmail.com, netdev@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org, linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: Re: [PATCH] net: ethernet: rtsn: Fix a null pointer dereference in
 rtsn_probe()
Message-ID: <aDej4pD_ZzB8ZQdP@LQ3V64L9R2>
Mail-Followup-To: Joe Damato <jdamato@fastly.com>,
	Haoxiang Li <haoxiang_li2024@163.com>,
	niklas.soderlund@ragnatech.se, andrew+netdev@lunn.ch,
	davem@davemloft.net, edumazet@google.com, kuba@kernel.org,
	pabeni@redhat.com, richardcochran@gmail.com, netdev@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org, linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
References: <20250524075825.3589001-1-haoxiang_li2024@163.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250524075825.3589001-1-haoxiang_li2024@163.com>

On Sat, May 24, 2025 at 03:58:25PM +0800, Haoxiang Li wrote:
> Add check for the return value of rcar_gen4_ptp_alloc()
> to prevent potential null pointer dereference.

Was the null deref observed in the wild? Asking because I am
wondering if this is clean up instead of a Fixes ?

> Fixes: b0d3969d2b4d ("net: ethernet: rtsn: Add support for Renesas Ethernet-TSN")
> Cc: stable@vger.kernel.org
> Signed-off-by: Haoxiang Li <haoxiang_li2024@163.com>
> ---
>  drivers/net/ethernet/renesas/rtsn.c | 4 ++++
>  1 file changed, 4 insertions(+)
> 
> diff --git a/drivers/net/ethernet/renesas/rtsn.c b/drivers/net/ethernet/renesas/rtsn.c
> index 6b3f7fca8d15..f5df3374d279 100644
> --- a/drivers/net/ethernet/renesas/rtsn.c
> +++ b/drivers/net/ethernet/renesas/rtsn.c
> @@ -1260,6 +1260,10 @@ static int rtsn_probe(struct platform_device *pdev)
>  	priv->pdev = pdev;
>  	priv->ndev = ndev;
>  	priv->ptp_priv = rcar_gen4_ptp_alloc(pdev);
> +	if (!priv->ptp_priv) {
> +		ret = -ENOMEM;
> +		goto error_free;
> +	}
>  
>  	spin_lock_init(&priv->lock);
>  	platform_set_drvdata(pdev, priv);
> -- 
> 2.25.1
> 
> 

