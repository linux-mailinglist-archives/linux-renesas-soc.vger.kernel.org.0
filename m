Return-Path: <linux-renesas-soc+bounces-1478-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 1518A829A1D
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 10 Jan 2024 13:05:04 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id B904928A690
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 10 Jan 2024 12:05:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A897D47F74;
	Wed, 10 Jan 2024 12:04:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ragnatech.se header.i=@ragnatech.se header.b="cvdTa2Yk"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-lf1-f45.google.com (mail-lf1-f45.google.com [209.85.167.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B975F47A57
	for <linux-renesas-soc@vger.kernel.org>; Wed, 10 Jan 2024 12:04:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ragnatech.se
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ragnatech.se
Received: by mail-lf1-f45.google.com with SMTP id 2adb3069b0e04-50e7b273352so4244094e87.1
        for <linux-renesas-soc@vger.kernel.org>; Wed, 10 Jan 2024 04:04:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ragnatech.se; s=google; t=1704888294; x=1705493094; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=Tv8y2dLeDjaY4Ft9G4cwSSAq1DW6ZNjqvX8osZdzC4Q=;
        b=cvdTa2YkekTxrtVfxOIJYpWPYX1dOs2hqkCfqQcNYtlOD63O4E4aCZrKA4WyudMPAz
         kIW9GZCIo3XGUm+VghPag8VeBTcx1bp2ha4BL5L8mi8UX9YUHgTD15J36wCNLzj5PYq5
         L5rL7tVL7b7SSExQAfwtAxJlfb0eRp1c4f4iChZxfkIYEhCxHy62NBsj6sMjXLL2rFyd
         mhcgnbUn/Qi8w/QDLz9/SWQidj3/HYogCx3mwIVtaodGt5ImsZFjzZz2MLKgUAChMeT7
         lSIPPRUqJ4s7A3tfqPzvtcs7nKAxgvKw4Yj3Wja8YS/amx0pUubVZQ7JJI4bDE3b+xlg
         yGhw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1704888294; x=1705493094;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Tv8y2dLeDjaY4Ft9G4cwSSAq1DW6ZNjqvX8osZdzC4Q=;
        b=iz270iJscvCkYAJfZzJA7NlW6owyxN2WZU8vDWUy4mIzu4TnsiTx3NHWFlddcdt+Sh
         ilAoAuAakU7P6Rjzr1DaDrX/LOCPXyoOVHWgo3TZiFY3PiGDBhZ6e02b9E7TTOq0JAJU
         J4ryWZMXm3as8akBRnm/yBa31oWVUOChwGjm8Czp15FnnJrTJqW541SmO0Z0NwsH552v
         IQCHAv5qte6fTI7Ywi87k+020VUh4k3rqU28fg2Xd6W3Q1a3E1v7KlOaISwKp6wJJIPB
         cN9qqSsLidI4olKpOuaeWOrJAWY1OazypqPLbBROrb8WRiDV6ZhvpOQK2Ks1XtSNCAEP
         ypAg==
X-Gm-Message-State: AOJu0YzcePAQ0qa5rTjgM4mLr94hzviyeJ6omHKp3BFTUKBuFeWCmOVx
	QHBaffUlENffdEsCbLQvgyK3YQI6h16ziw==
X-Google-Smtp-Source: AGHT+IEkgQbzIoo2UUdvDbMmqFkbFawHI8AGeesCvZn+sbtVNpwNj67SS3ECouPVFPGwrwBa8ieOPA==
X-Received: by 2002:a19:6514:0:b0:50e:8ed1:cf10 with SMTP id z20-20020a196514000000b0050e8ed1cf10mr298084lfb.42.1704888293920;
        Wed, 10 Jan 2024 04:04:53 -0800 (PST)
Received: from localhost (h-46-59-36-113.A463.priv.bahnhof.se. [46.59.36.113])
        by smtp.gmail.com with ESMTPSA id be30-20020a056512251e00b0050e68f05d00sm654260lfb.18.2024.01.10.04.04.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 10 Jan 2024 04:04:53 -0800 (PST)
Date: Wed, 10 Jan 2024 13:04:52 +0100
From: Niklas =?utf-8?Q?S=C3=B6derlund?= <niklas.soderlund@ragnatech.se>
To: Geert Uytterhoeven <geert+renesas@glider.be>
Cc: Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Magnus Damm <magnus.damm@gmail.com>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>, Ulf Hansson <ulf.hansson@linaro.org>,
	Cong Dang <cong.dang.xn@renesas.com>,
	Duy Nguyen <duy.nguyen.rh@renesas.com>,
	Hai Pham <hai.pham.ud@renesas.com>,
	Linh Phung <linh.phung.jy@renesas.com>,
	linux-renesas-soc@vger.kernel.org, linux-clk@vger.kernel.org,
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-pm@vger.kernel.org
Subject: Re: [PATCH 04/15] dt-bindings: power: Add r8a779h0 SYSC power domain
 definitions
Message-ID: <20240110120452.GD1625657@ragnatech.se>
References: <cover.1704726960.git.geert+renesas@glider.be>
 <1285e6a9fb423c8d6fff0c7faef157a1ea172d70.1704726960.git.geert+renesas@glider.be>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <1285e6a9fb423c8d6fff0c7faef157a1ea172d70.1704726960.git.geert+renesas@glider.be>

Hello Geert,

Thanks for your work.

On 2024-01-08 16:33:43 +0100, Geert Uytterhoeven wrote:
> From: Duy Nguyen <duy.nguyen.rh@renesas.com>
> 
> Add power domain indices for the Renesas R-Car V4M (R8A779H0) SoC.
> 
> Signed-off-by: Duy Nguyen <duy.nguyen.rh@renesas.com>
> Signed-off-by: Hai Pham <hai.pham.ud@renesas.com>
> Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>

Reviewed-by: Niklas Söderlund <niklas.soderlund+renesas@ragnatech.se>

> ---
>  include/dt-bindings/power/r8a779h0-sysc.h | 49 +++++++++++++++++++++++
>  1 file changed, 49 insertions(+)
>  create mode 100644 include/dt-bindings/power/r8a779h0-sysc.h
> 
> diff --git a/include/dt-bindings/power/r8a779h0-sysc.h b/include/dt-bindings/power/r8a779h0-sysc.h
> new file mode 100644
> index 0000000000000000..29f05f0401a13336
> --- /dev/null
> +++ b/include/dt-bindings/power/r8a779h0-sysc.h
> @@ -0,0 +1,49 @@
> +/* SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause) */
> +/*
> + * Copyright (C) 2023 Renesas Electronics Corp.
> + */
> +#ifndef __DT_BINDINGS_POWER_R8A779H0_SYSC_H__
> +#define __DT_BINDINGS_POWER_R8A779H0_SYSC_H__
> +
> +/*
> + * These power domain indices match the Power Domain Register Numbers (PDR)
> + */
> +
> +#define R8A779H0_PD_A1E0D0C0		0
> +#define R8A779H0_PD_A1E0D0C1		1
> +#define R8A779H0_PD_A1E0D0C2		2
> +#define R8A779H0_PD_A1E0D0C3		3
> +#define R8A779H0_PD_A2E0D0		16
> +#define R8A779H0_PD_A3CR0		21
> +#define R8A779H0_PD_A3CR1		22
> +#define R8A779H0_PD_A3CR2		23
> +#define R8A779H0_PD_A33DGA		24
> +#define R8A779H0_PD_A23DGB		25
> +#define R8A779H0_PD_C4			31
> +#define R8A779H0_PD_A1DSP0		33
> +#define R8A779H0_PD_A2IMP01		34
> +#define R8A779H0_PD_A2PSC		35
> +#define R8A779H0_PD_A2CV0		36
> +#define R8A779H0_PD_A2CV1		37
> +#define R8A779H0_PD_A3IMR0		38
> +#define R8A779H0_PD_A3IMR1		39
> +#define R8A779H0_PD_A3VC		40
> +#define R8A779H0_PD_A2CN0		42
> +#define R8A779H0_PD_A1CN0		44
> +#define R8A779H0_PD_A1DSP1		45
> +#define R8A779H0_PD_A2DMA		47
> +#define R8A779H0_PD_A2CV2		48
> +#define R8A779H0_PD_A2CV3		49
> +#define R8A779H0_PD_A3IMR2		50
> +#define R8A779H0_PD_A3IMR3		51
> +#define R8A779H0_PD_A3PCI		52
> +#define R8A779H0_PD_A2PCIPHY		53
> +#define R8A779H0_PD_A3VIP0		56
> +#define R8A779H0_PD_A3VIP2		58
> +#define R8A779H0_PD_A3ISP0		60
> +#define R8A779H0_PD_A3DUL		62
> +
> +/* Always-on power area */
> +#define R8A779H0_PD_ALWAYS_ON		64
> +
> +#endif /* __DT_BINDINGS_POWER_R8A779H0_SYSC_H__ */
> -- 
> 2.34.1
> 
> 

-- 
Kind Regards,
Niklas Söderlund

