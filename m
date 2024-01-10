Return-Path: <linux-renesas-soc+bounces-1475-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 57C21829A0F
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 10 Jan 2024 13:01:33 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id E3E97289DD2
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 10 Jan 2024 12:01:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EFA3047F6F;
	Wed, 10 Jan 2024 11:59:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ragnatech.se header.i=@ragnatech.se header.b="HCp4vY2Z"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-lj1-f169.google.com (mail-lj1-f169.google.com [209.85.208.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0A02E47F72
	for <linux-renesas-soc@vger.kernel.org>; Wed, 10 Jan 2024 11:59:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ragnatech.se
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ragnatech.se
Received: by mail-lj1-f169.google.com with SMTP id 38308e7fff4ca-2cd0f4f306fso47858521fa.0
        for <linux-renesas-soc@vger.kernel.org>; Wed, 10 Jan 2024 03:59:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ragnatech.se; s=google; t=1704887985; x=1705492785; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=ISdmhcRR/GVAZSppZHeKDEjXMJ9voCrSTY/WHRDPz+M=;
        b=HCp4vY2ZbZply1USFWqt5b1iDJTqh9TcJVVGasPNOnnLkwh/B9r0B8EUOs97IU9FuH
         Syyrp/QnIoStZWzbsfL6JXH4vsA9V5TuuHNFLqyx7XBRrjtA67E2NxWnIWzCDkRYi1a4
         4XZteIjckrLT1p7YJnvBHSJox7xyLsd2TLVBdC8HzuRJOhx4AKFe/frNq54aa1oNPOU4
         uJn8+oLiFt98RdODFEUzRRxdcOTktSbJsNZZ+CJJgwY7ErPI3VDNj2DlfKjzoPSOlHP5
         HFhNiq2nVpuqPkdst6eZKP2CrTKEQwG40j+Uq7Npc+fo0uwc4/a3vWUw7DgnxWu1jKf+
         /qUA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1704887985; x=1705492785;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ISdmhcRR/GVAZSppZHeKDEjXMJ9voCrSTY/WHRDPz+M=;
        b=YgqXGkTgOnO6mgTvyeDdw2bx/vHXIbtmBFb+QXyx7XXHbMGx8H5YmsFspTNrQrzlEF
         g1I0BuQtuV2tupriqax/zbLXkPGHG7LyZPga/y4mH6X1jGgiJ6NjQ22tEDioCJ1sk0c+
         4w5M/U1s4qGugXlixVUr/Yfpx09n8mNLYfzG72CG0iuD4XfoOj8e7Z1Pj+k49KdRsIk9
         BqSobSULPBMTBQBViVeuiBM77jWjXNp7vyWKwFZp5gtX+aI6oh/7vgd1KLAlYBNg49uu
         Fx3IgEhG6lZBmoPdueI94RMbFMmyAdNbRiJt6rtf/J9xKVhIpUVpGu4Np17UmbeuC+am
         lHzg==
X-Gm-Message-State: AOJu0YykKMZIfNpKtIY1Ij6Nxcvda1fik4YDw4famHhtHNOWZAiJFn39
	bdor9mKsfC+d0GFKLS4S1V2kgk/mt1ReEg==
X-Google-Smtp-Source: AGHT+IGRceqNc3d0nTVh7e6+mL9Lw5I93LQLv+D4klCI5dK4DBKjF4S3gi0+1qjOna0v/0HlpNqqng==
X-Received: by 2002:a2e:a305:0:b0:2c8:39fc:acf5 with SMTP id l5-20020a2ea305000000b002c839fcacf5mr513508lje.2.1704887984601;
        Wed, 10 Jan 2024 03:59:44 -0800 (PST)
Received: from localhost (h-46-59-36-113.A463.priv.bahnhof.se. [46.59.36.113])
        by smtp.gmail.com with ESMTPSA id u1-20020a2eb801000000b002cd39846d92sm724889ljo.103.2024.01.10.03.59.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 10 Jan 2024 03:59:44 -0800 (PST)
Date: Wed, 10 Jan 2024 12:59:43 +0100
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
Subject: Re: [PATCH 01/15] dt-bindings: clock: renesas,cpg-mssr: Document
 R-Car V4M support
Message-ID: <20240110115943.GA1625657@ragnatech.se>
References: <cover.1704726960.git.geert+renesas@glider.be>
 <81f5a2b55795af06f6fd54b3d566156e91138a17.1704726960.git.geert+renesas@glider.be>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <81f5a2b55795af06f6fd54b3d566156e91138a17.1704726960.git.geert+renesas@glider.be>

Hi Geert,

Thanks for your work.

On 2024-01-08 16:33:40 +0100, Geert Uytterhoeven wrote:
> Document support for the Clock Pulse Generator (CPG) and Module Standby
> Software Reset (MSSR) module on the Renesas R-Car V4M (R8A779H0) SoC.
> 
> Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>

Reviewed-by: Niklas Söderlund <niklas.soderlund+renesas@ragnatech.se>

> ---
>  Documentation/devicetree/bindings/clock/renesas,cpg-mssr.yaml | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/Documentation/devicetree/bindings/clock/renesas,cpg-mssr.yaml b/Documentation/devicetree/bindings/clock/renesas,cpg-mssr.yaml
> index 9c3dc6c4fa94218c..084259d30232aa68 100644
> --- a/Documentation/devicetree/bindings/clock/renesas,cpg-mssr.yaml
> +++ b/Documentation/devicetree/bindings/clock/renesas,cpg-mssr.yaml
> @@ -50,6 +50,7 @@ properties:
>        - renesas,r8a779a0-cpg-mssr # R-Car V3U
>        - renesas,r8a779f0-cpg-mssr # R-Car S4-8
>        - renesas,r8a779g0-cpg-mssr # R-Car V4H
> +      - renesas,r8a779h0-cpg-mssr # R-Car V4M
>  
>    reg:
>      maxItems: 1
> -- 
> 2.34.1
> 
> 

-- 
Kind Regards,
Niklas Söderlund

