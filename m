Return-Path: <linux-renesas-soc+bounces-15281-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 238E7A78973
	for <lists+linux-renesas-soc@lfdr.de>; Wed,  2 Apr 2025 10:06:12 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 3904A3AD090
	for <lists+linux-renesas-soc@lfdr.de>; Wed,  2 Apr 2025 08:05:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CA4F32AE77;
	Wed,  2 Apr 2025 08:06:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="Y781sa9h"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-pl1-f182.google.com (mail-pl1-f182.google.com [209.85.214.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B85E7157A46
	for <linux-renesas-soc@vger.kernel.org>; Wed,  2 Apr 2025 08:06:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743581165; cv=none; b=TmSPjb+yIldZz8Ix+zk1Skb9wFFdBYbIN6UNd+uQ8tomyow0SPP8BC4PXEOShl1ay9XIPyyYA+RWET8KpWnBjJpxKTZR0znNqDNEm/7erqxspfBKLoQcVu0jb1wTzdy9fNf6P+X2szTzvwaFcLUJYiS3sh+fyHdFuYuFE3hLE6Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743581165; c=relaxed/simple;
	bh=N207eWCWUxkSP1EIvpo1j/kRarKKw70g0XhxUfCGvjc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=jk70J9uI2p9wjivEk50TKDd3bg/Ft2/tCN8R820Tci2WZYPuv0Q4ENabYssXl3V+c/fk1B4DooKxYj8W/sze/1uH1ruzODQvKqEnK8ZYqUeHKwmytvKSZplWW21o2hND4M6gBHSgeE3UeCfai1aXmKrjwwB6BcSIF0NL7tprT2k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=Y781sa9h; arc=none smtp.client-ip=209.85.214.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-pl1-f182.google.com with SMTP id d9443c01a7336-227aaa82fafso124758875ad.2
        for <linux-renesas-soc@vger.kernel.org>; Wed, 02 Apr 2025 01:06:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1743581163; x=1744185963; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=ECiII6vd3sPY61Owt8NhtZi2vZPZCQQbcTiouyTBaf0=;
        b=Y781sa9hhVxHtpPjoZye05SubiMchojlBHCiUCk7sz0dG/2tvzBpCXlmSh/HtI/1tc
         4/c1Jm7FVnLRCj5av48KwcSdqwGx8QWUTlMBDv50YAz4qsI+ipo0RR8L3MG0SNAtOruE
         e7Xr2y70L6DJiZZLeoFBDYBtEd9mMzhK8yqTDhwYFWY9df5G4clA5mKPVvqaaCvw3xgh
         OQR+tauxbLY6s7t0ITe6ADGGw7gKXK1vGp3CG+uCuH+WzvQpfR3dW8sBvdSV66mKiaFs
         WgYIXIZykjoU8MxcorWtYsMNrR879FsoXskzhm+JAz5igSCCVh/q4F3qKP8jabNmnsXH
         o7BA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743581163; x=1744185963;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ECiII6vd3sPY61Owt8NhtZi2vZPZCQQbcTiouyTBaf0=;
        b=PCMT0m5J+85T9wOTXi6pg1jrUJ+8N7ER6tMG63Rzma2kT3t3NHt+vp/gY88XQg4wFg
         5vtvgtO9mSI7iWljagL6AEO0wqF53+PDUbKoCvm5x2ROhpOQFswZJitg/VDK5GlebQIP
         pyMV7esYCw1jIW3daoIBzsBCe75mB70pq0TSSgTi9Yy6BiV38FnbomShJtO0KqlwGTb2
         QLkL5w04s7q1iMIY/UwfUPU9xkvBW5cG7nTxw0SzIhnCrHMbU7p/6NzOS45crSK0KDvY
         6QyNkj5Xr3jjfrQsk4BIF5nLQv0IFHeIexogRUpmnmebZZ1YS9nwxX3OlmrFL2m3mKuR
         a+5w==
X-Forwarded-Encrypted: i=1; AJvYcCUX8RymDiBboBBVl+757G+lYxHyr1oDyLtQVkmrtWCmTf4DS39wxxmgOJEQaesb8CYTHAoF8ABbvsxcKVM85cDRvQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YzdpzvrDusJLmeRFNIIKcVViFQ+VuS866XIXfXqY5M2ASF2tWrK
	QtDuihI2m3IEPdBByjyPrvttgRiDlnkkvPLQtxg/2MokWGwDQGxbY6QZgeYImQ==
X-Gm-Gg: ASbGncvBAGotw+FP03ESQ/79ci0rDsd9NZ6tnZFZuS3UmEHgkTPQSb9ew0+SBI05bij
	yy2+7etuOBJIVRwBhNpk7muMPUMZg0CdwzmRnCRmL3IvxVgjlzdyO/RjartIes8zizqJRP4Zgin
	irHJIqM01HHJhjrHfI9Eqkp4VuPSU2ZzFseRR8SiLuG47q8bn3O2Li5kFRKVl40moovbPbfsLcx
	M6g4toHzgkWk4OUHw1fwD4Owtik5XBExckxR9K2gcOx74Rzsjb0syXwHd3J394ENK2IgmL8/ies
	bqHw9mJm76Sqfz4LCqKFHvbbiUMeYL7eCcwM/3IMLWsTXepw+Vg8EIZb
X-Google-Smtp-Source: AGHT+IGVTpRRj5G1hd9jPU8e96BmRan6Ei7Kpo43greYxZi4zomLciodYcKOKqUyIfajjCtsvTFZxQ==
X-Received: by 2002:a17:902:d2cc:b0:21f:2ded:76ea with SMTP id d9443c01a7336-2292f9d4e12mr212345135ad.36.1743581163093;
        Wed, 02 Apr 2025 01:06:03 -0700 (PDT)
Received: from thinkpad ([120.56.205.103])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2291f1ef62asm102274055ad.217.2025.04.02.01.05.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 02 Apr 2025 01:06:02 -0700 (PDT)
Date: Wed, 2 Apr 2025 13:35:57 +0530
From: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
To: Jerome Brunet <jbrunet@baylibre.com>
Cc: Marek Vasut <marek.vasut+renesas@gmail.com>, 
	Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>, Lorenzo Pieralisi <lpieralisi@kernel.org>, 
	Krzysztof =?utf-8?Q?Wilczy=C5=84ski?= <kw@linux.com>, Rob Herring <robh@kernel.org>, 
	Bjorn Helgaas <bhelgaas@google.com>, Serge Semin <fancer.lancer@gmail.com>, 
	Krzysztof =?utf-8?Q?Wilczy=C5=84ski?= <kwilczynski@kernel.org>, linux-pci@vger.kernel.org, linux-renesas-soc@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Yuya Hamamachi <yuya.hamamachi.sx@renesas.com>
Subject: Re: [PATCH] PCI: rcar-gen4: set ep BAR4 fixed size
Message-ID: <53inwqbz7faoat5pwngx2rqgygt2ksg7yfjqkltxtde3jattvx@t2fdptqivmcn>
References: <20250328-rcar-gen4-bar4-v1-1-10bb6ce9ee7f@baylibre.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250328-rcar-gen4-bar4-v1-1-10bb6ce9ee7f@baylibre.com>

On Fri, Mar 28, 2025 at 03:30:44PM +0100, Jerome Brunet wrote:
> On rcar-gen4, the ep BAR4 has a fixed size of 256B.
> Document this constraint in the epc features of the platform.
> 
> Fixes: e311b3834dfa ("PCI: rcar-gen4: Add endpoint mode support")
> Signed-off-by: Jerome Brunet <jbrunet@baylibre.com>

Reviewed-by: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>

- Mani

> ---
> This was tested on rcar-gen4 r8a779f0-spider device.
> ---
>  drivers/pci/controller/dwc/pcie-rcar-gen4.c | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/drivers/pci/controller/dwc/pcie-rcar-gen4.c b/drivers/pci/controller/dwc/pcie-rcar-gen4.c
> index fc872dd35029c083da58144dce23cd1ce80f9374..02638ec442e7012d61dfad70016077d9becf56a6 100644
> --- a/drivers/pci/controller/dwc/pcie-rcar-gen4.c
> +++ b/drivers/pci/controller/dwc/pcie-rcar-gen4.c
> @@ -403,6 +403,7 @@ static const struct pci_epc_features rcar_gen4_pcie_epc_features = {
>  	.msix_capable = false,
>  	.bar[BAR_1] = { .type = BAR_RESERVED, },
>  	.bar[BAR_3] = { .type = BAR_RESERVED, },
> +	.bar[BAR_4] = { .type = BAR_FIXED, .fixed_size = 256 },
>  	.bar[BAR_5] = { .type = BAR_RESERVED, },
>  	.align = SZ_1M,
>  };
> 
> ---
> base-commit: dea140198b846f7432d78566b7b0b83979c72c2b
> change-id: 20250328-rcar-gen4-bar4-dccd1347fe38
> 
> Best regards,
> -- 
> Jerome
> 

-- 
மணிவண்ணன் சதாசிவம்

