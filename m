Return-Path: <linux-renesas-soc+bounces-3461-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id DC8D68719F5
	for <lists+linux-renesas-soc@lfdr.de>; Tue,  5 Mar 2024 10:50:50 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 107C61C208C7
	for <lists+linux-renesas-soc@lfdr.de>; Tue,  5 Mar 2024 09:50:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1B73054799;
	Tue,  5 Mar 2024 09:50:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ragnatech.se header.i=@ragnatech.se header.b="tN36sE1u"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-lf1-f50.google.com (mail-lf1-f50.google.com [209.85.167.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9511153E03
	for <linux-renesas-soc@vger.kernel.org>; Tue,  5 Mar 2024 09:50:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1709632233; cv=none; b=o5lVyNBzDeB1Ono1yl3vcBAyb7zWLpOBA7HHHGXC2e5aY2UBqwgfs0anpNBTyaHS9KWw6BrLic0fiN23aQd0EVsEum8cuMe2XvGCEKOrzZUF67YUh/vFQNpjIyPsv1ujoNNpK0OmfDJp7shkOOqnjGqzsp0DdcqHRkqGOfeTNHk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1709632233; c=relaxed/simple;
	bh=2fhwATG4WHPso3XAPD9VO1JFzmBMZgKGhumAvtbQh8M=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=U9x8xbttHFNm4SX4YhvwCZOX/RIQhrtdG5lE8hHrt3CnzUNLpuXxD+4hJaFueW7xB11gQHko80QRYc4iGumw++c9PS1kO1HoxMF9uEPJWhcJTexgD4f+8wYtxQYHRKPsqS14w+ebpxOHp6KDqh8/x41t5nTxUrzP4jQvxfdee3c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ragnatech.se; spf=pass smtp.mailfrom=ragnatech.se; dkim=pass (2048-bit key) header.d=ragnatech.se header.i=@ragnatech.se header.b=tN36sE1u; arc=none smtp.client-ip=209.85.167.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ragnatech.se
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ragnatech.se
Received: by mail-lf1-f50.google.com with SMTP id 2adb3069b0e04-5131c48055cso624554e87.1
        for <linux-renesas-soc@vger.kernel.org>; Tue, 05 Mar 2024 01:50:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ragnatech.se; s=google; t=1709632227; x=1710237027; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=yR9ysqVa4zKnV7VmPq6yjzQWBoW3x0dbDvRJJf/Wmqg=;
        b=tN36sE1uGIibwW1OwiVoHv15QJpvmRlltFExK6ScjjTA3ZCmgIRTKKiwy47OZi71+H
         IDv7MMfQD13BUqJ7h3c5dg4DUyHZFlDZsT3TOmNZ6RJxV7xH5bcLOAL/MvLjsAFDKBYP
         VG2II8vYLKQdPmBMa8bRJR/pUUJRg96htvY/c4IAXUQ/pUCV05V1XF26haGeMPs/BBt/
         N8T1dStfiOQrYN8g7U1NkuGvN7Bi7SGF3Kxr4ZtcqPM+h8kLP2zCwpfoeU2GgGfBe0Gc
         75VpwFzEoOrEfJBXprLDcS1QIqVpMky9Yj9tPPekxDnYfEC/SrHzPiTQ0HO+0DJeaszS
         mB6w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1709632227; x=1710237027;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=yR9ysqVa4zKnV7VmPq6yjzQWBoW3x0dbDvRJJf/Wmqg=;
        b=APpynbADMayl/CrRJ9URBm5NKdqFqiQkJegBxra+GNAJgtZHc+7ViK25eBQn4M0emJ
         YjVkflx7yhN84pDgcT6KdHZDF3U+4T34NP9R8vv54Fmf8C1yRhh2kqABPezIpusQ5RUE
         BuGHgnwJ/iNvaz2X30BgxXQaQkq9WKZyzfhCPy2gjpF/iMpqvL3g53TeI/ocEHljYWPB
         dIwaLDWBylfdMticho4qlKZPYnUBbd6OgNmAXz+SG6/Eu4ZB5x3pPqwLYuHslnfVEvz5
         x7Emzub1/afTtyR8kbz2fLKAjYXuC81mqxaiKwJwMsZMmB5ImUy/9/+jdLvRVei2C62e
         rpsQ==
X-Forwarded-Encrypted: i=1; AJvYcCU1eiVPcgY7nQV8n1wyZ7FQWqj57FVROTIG/EX/e/QTD8CFL4pgzumxTNb8DrJFs7s1Ig+7eyH4ZM1AIadVVY933QRZLS2JJLUOsV8tcTUXEj8=
X-Gm-Message-State: AOJu0YzJUNnvbXcGp1jtm8U/EcwNMiRJHXCuWFkR1TtJU1AbbDdIBfK4
	05s9KONiiAdABbpu3RG4W65f1fo+A76y5u1tgkJc7xt382xLyTU5Q0Ltky9mMksPwC7x/c1qBcd
	3
X-Google-Smtp-Source: AGHT+IHmzDWX0iNGQ1bsRL3fssFFcv3Ett/EhCFtb1XJb/4drwplrDvHwpcC5At3KOGR/c77/MRFjg==
X-Received: by 2002:a05:6512:3e5:b0:512:f2c5:6 with SMTP id n5-20020a05651203e500b00512f2c50006mr824925lfq.6.1709632227301;
        Tue, 05 Mar 2024 01:50:27 -0800 (PST)
Received: from localhost (h-46-59-36-113.A463.priv.bahnhof.se. [46.59.36.113])
        by smtp.gmail.com with ESMTPSA id s12-20020a056512202c00b005131816bbf8sm2122206lfs.87.2024.03.05.01.50.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 05 Mar 2024 01:50:26 -0800 (PST)
Date: Tue, 5 Mar 2024 10:50:26 +0100
From: Niklas =?utf-8?Q?S=C3=B6derlund?= <niklas.soderlund@ragnatech.se>
To: Geert Uytterhoeven <geert+renesas@glider.be>
Cc: Sergey Shtylyov <s.shtylyov@omp.ru>,
	"David S . Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Sergei Shtylyov <sergei.shtylyov@gmail.com>, netdev@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org, devicetree@vger.kernel.org,
	Thanh Quan <thanh.quan.xn@renesas.com>
Subject: Re: [PATCH net-next] dt-bindings: net: renesas,etheravb: Add support
 for R-Car V4M
Message-ID: <20240305095026.GA2876042@ragnatech.se>
References: <0212b57ba1005bb9b5a922f8f25cc67a7bc15f30.1709631152.git.geert+renesas@glider.be>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <0212b57ba1005bb9b5a922f8f25cc67a7bc15f30.1709631152.git.geert+renesas@glider.be>

Hi Geert,

Thanks for your work.

On 2024-03-05 10:37:18 +0100, Geert Uytterhoeven wrote:
> From: Thanh Quan <thanh.quan.xn@renesas.com>
> 
> Document support for the Renesas Ethernet AVB (EtherAVB-IF) block in the
> Renesas R-Car V4M (R8A779H0) SoC.
> 
> Signed-off-by: Thanh Quan <thanh.quan.xn@renesas.com>
> Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>

Reviewed-by: Niklas Söderlund <niklas.soderlund+renesas@ragnatech.se>

> ---
>  Documentation/devicetree/bindings/net/renesas,etheravb.yaml | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/Documentation/devicetree/bindings/net/renesas,etheravb.yaml b/Documentation/devicetree/bindings/net/renesas,etheravb.yaml
> index 890f7858d0dc4c79..de7ba7f345a93778 100644
> --- a/Documentation/devicetree/bindings/net/renesas,etheravb.yaml
> +++ b/Documentation/devicetree/bindings/net/renesas,etheravb.yaml
> @@ -46,6 +46,7 @@ properties:
>            - enum:
>                - renesas,etheravb-r8a779a0     # R-Car V3U
>                - renesas,etheravb-r8a779g0     # R-Car V4H
> +              - renesas,etheravb-r8a779h0     # R-Car V4M
>            - const: renesas,etheravb-rcar-gen4 # R-Car Gen4
>  
>        - items:
> -- 
> 2.34.1
> 
> 

-- 
Kind Regards,
Niklas Söderlund

