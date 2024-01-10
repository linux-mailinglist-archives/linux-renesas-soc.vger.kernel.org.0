Return-Path: <linux-renesas-soc+bounces-1479-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id AA4D3829A21
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 10 Jan 2024 13:05:47 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 357491F24679
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 10 Jan 2024 12:05:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E97B547F56;
	Wed, 10 Jan 2024 12:05:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ragnatech.se header.i=@ragnatech.se header.b="ZVTbv1/v"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-lf1-f47.google.com (mail-lf1-f47.google.com [209.85.167.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 32E3E3FB18
	for <linux-renesas-soc@vger.kernel.org>; Wed, 10 Jan 2024 12:05:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ragnatech.se
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ragnatech.se
Received: by mail-lf1-f47.google.com with SMTP id 2adb3069b0e04-50ea8fbf261so4498614e87.2
        for <linux-renesas-soc@vger.kernel.org>; Wed, 10 Jan 2024 04:05:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ragnatech.se; s=google; t=1704888335; x=1705493135; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=K7vyzY84VKTlUDz0Z+W+psuOPOLlEvpxgZy/UxbfPxQ=;
        b=ZVTbv1/vha2O5XlrnkwCbwA2r2mF0zfC5N0NCBRHanitAs7WG6FeTGL5Q3SJhndc1j
         aVm0ODJTa3oU0vf5kXc+uuq35v5USkftZA9smt50yjhw8tVRWyIWyfY/o2E5RZXC/aW5
         X96UpUEzxO8r0SeuWKiwf+vY2abVWmaj0x67r7DKEq0u9h4GoXAJ4ZRCD7FhRjcWTvaB
         aXm9aqfOw1IQNNzu39YEUjzYhI750T3bkYVU49XHhjKToVXnrvbpvF9wipq0ZJE6wEtn
         +BEBSZ08zKIH1nqhnCL4N/Slbzdj7HuzN8hvNE+aAasKD4NJ2mEhHKBlAJqZ3Xonoenh
         YdOQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1704888335; x=1705493135;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=K7vyzY84VKTlUDz0Z+W+psuOPOLlEvpxgZy/UxbfPxQ=;
        b=OIWGm7RBpkOl5qE1D2ZpxuMhJI2/OAjZ5pM/DQtjQE0TuzIypjLM0tubyg3yMDTY33
         cAopYwllseowaW8pPIPp3uA1yNHuuOnchmOER2bwZd9gdw8neGYUhL6umBID0NtzQ0kr
         6cc5icwrVHPU5j4qFNpNB8CcuMmJV9O5+xn+2IJSoVm2W3UezwbJ/jL3FHSOoMh6Ukdb
         EtxEa8WxOzmUk02iM5s1DTzb+a9JIB83RrPGKOaSnFmUyX3zzH4bwqYVcFsrAlYlqp7x
         yu6FYjphX04fYCEyUQltaTEdBBZ+FB0lpDGE7TZfNh6PZsD4mEb8EYjX0wHFbQkBc/PT
         1ybA==
X-Gm-Message-State: AOJu0YzVhN2ANmiCKHMHSYXPO/YTvUcTj+28C70pfzFGF45iEqYEpizd
	fe12pNWodKbvNk5KL8GMxXgr1qZlIW05hg==
X-Google-Smtp-Source: AGHT+IGWto/Zlbm7AYd/ByITUGqJT8iSVvxUBcGc1tvTwlEf8LGJQUBOJ1f6HQXycvfjTWkWbSNZyQ==
X-Received: by 2002:a05:6512:3d22:b0:50e:a975:119e with SMTP id d34-20020a0565123d2200b0050ea975119emr553343lfv.20.1704888335513;
        Wed, 10 Jan 2024 04:05:35 -0800 (PST)
Received: from localhost (h-46-59-36-113.A463.priv.bahnhof.se. [46.59.36.113])
        by smtp.gmail.com with ESMTPSA id z9-20020ac24f89000000b0050ebc47986fsm646375lfs.141.2024.01.10.04.05.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 10 Jan 2024 04:05:35 -0800 (PST)
Date: Wed, 10 Jan 2024 13:05:34 +0100
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
Subject: Re: [PATCH 05/15] dt-bindings: reset: renesas,rst: Document R-Car
 V4M support
Message-ID: <20240110120534.GE1625657@ragnatech.se>
References: <cover.1704726960.git.geert+renesas@glider.be>
 <1d35a435db17a240abafb091751255379825b750.1704726960.git.geert+renesas@glider.be>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <1d35a435db17a240abafb091751255379825b750.1704726960.git.geert+renesas@glider.be>

Hi Geert,

Thanks for your patch.

On 2024-01-08 16:33:44 +0100, Geert Uytterhoeven wrote:
> Document support for the Reset (RST) module in the Renesas R-Car V4M
> (R8A779H0) SoC.
> 
> Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>

Reviewed-by: Niklas Söderlund <niklas.soderlund+renesas@ragnatech.se>

> ---
>  Documentation/devicetree/bindings/reset/renesas,rst.yaml | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/Documentation/devicetree/bindings/reset/renesas,rst.yaml b/Documentation/devicetree/bindings/reset/renesas,rst.yaml
> index e7e4872477517b2d..58b4a45d338006ff 100644
> --- a/Documentation/devicetree/bindings/reset/renesas,rst.yaml
> +++ b/Documentation/devicetree/bindings/reset/renesas,rst.yaml
> @@ -50,6 +50,7 @@ properties:
>        - renesas,r8a779a0-rst      # R-Car V3U
>        - renesas,r8a779f0-rst      # R-Car S4-8
>        - renesas,r8a779g0-rst      # R-Car V4H
> +      - renesas,r8a779h0-rst      # R-Car V4M
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

