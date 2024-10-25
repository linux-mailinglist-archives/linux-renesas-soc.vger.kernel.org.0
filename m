Return-Path: <linux-renesas-soc+bounces-10162-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 987F29B0E08
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 25 Oct 2024 21:10:47 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 3AB161F25D60
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 25 Oct 2024 19:10:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 15A4B20EA43;
	Fri, 25 Oct 2024 19:10:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="IBX+aYAx"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-lf1-f46.google.com (mail-lf1-f46.google.com [209.85.167.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D9C1D18D62A;
	Fri, 25 Oct 2024 19:10:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729883436; cv=none; b=tlRm3AcQKpmL+2H4nUAuu9Olx0FymS9I3vVV+vuwFpNOC4+arrUKYtAazl81yNaAWmeJFYqNIEEKp2U8d1Mp96pdAo3i9NJ36hOtySEUFSYMK/1hRoX06AH8HljBNSvO0xUbYET+JZ8CQtnE/ylbDz6TZm/zHUat6BUpmXm4TvU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729883436; c=relaxed/simple;
	bh=ZBt5OhE51PYgb5zT1r6cA5t4S9z8syCutBGZSs4TQsY=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Dwsp6RJN0jc5NFG9jrzhPHwnRaUuRoS1UvaWvDLCzm4tUNM2uefjU/F8cmu2kDM6TpAE55QtqQ7zrFAJuTC9349IshHrUJ3/q5uUd/GVnwn6FF25ghk7Z+XAGrUh6TqaF5+dna9BgWz//UiqLzp9QM93af+pgT5+M3B8CIim3OI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=IBX+aYAx; arc=none smtp.client-ip=209.85.167.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-lf1-f46.google.com with SMTP id 2adb3069b0e04-539eb97f26aso2560574e87.2;
        Fri, 25 Oct 2024 12:10:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1729883432; x=1730488232; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=VESagVfD3e5GDgh2PnVD1fegOORhBmcVPa9A/q/1cMU=;
        b=IBX+aYAxRtSpiB5CJ+V+JlOfaAXwFT89i9KrxRDUTIGnBc16M1sfxCptqCq435Ds/f
         4vJflyh0aeLe1/dffKPPPZFFJwr6Ylx83wLUHZInXbFMtbPF6STsJ5BbXXl0YZsUfj21
         IH9ekrwe7WPYAwK7UgraTIGlPb61dQdPDwSRGwdRnItlg+fnxQB9Tti0wF32pSZkzxBi
         gHMskB90lxQVYncO9FhMzcxBpN5AMnOMWaTp9rL32qwhjgbZ/iQR7sI1s4knidkiSlv/
         wVXigG3GhFR+UCIe67mHTQbit0NdkxNomR6p+9gMg+WBSz2N70jbqDtfEMcES0AhSuT3
         Ci8g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729883432; x=1730488232;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=VESagVfD3e5GDgh2PnVD1fegOORhBmcVPa9A/q/1cMU=;
        b=bR+FLmovm1/1Qk9tkqjT1GIxy4ordgmjZ8MjtI8oBZ8WbX9/mYNhaYHDhkklNGmccs
         H/zLKWAXSxT82Xz3wPzNcVinXrZz1dGG8cU7Mydb2JHYX/SqY3tHCLXCgl/ZmeW/le+S
         ayVsAFf8qgghIaWOa+HHoIQuQB/cqmwZjOsB9gcDMDU9kKGXkQiSHEkrtztShiKxJ/iI
         vRVIzUZL+Zw5WP3xVdMKZ5i680xrkxuzn4ovmfpUdvDZlugQgOPkJk9WEyh1WLJ2/+/O
         MtEBNtNwg/DGGwdJBN+6jZWd2g50U21fLyP8+ONMmSto7vzpqur4gEpGDlviyxTdTynx
         h5HQ==
X-Forwarded-Encrypted: i=1; AJvYcCUNSdcwSXPJX5yPUBtEI/2FbI2sNFDcCYLJgYtd+c+N6CV4KkCuzTEh5eH4t9TcUIvFaDapjEf7+PbxrwBTGYcw1d8=@vger.kernel.org, AJvYcCXtdzaIs8i9vgV3PDLMdPEJFoDFKy5U3qi0AzI9aXBOB/3SO3az0PBpuhzKFqn8hdWKc8v/o2IRgq/R@vger.kernel.org
X-Gm-Message-State: AOJu0YzOFJaq2n33E94m0Zumn3UqglqA0mcM/vn+QDBKjSYfq+760NEF
	zb++WW9x39ur/8M0NtnMpeeRsCPwkVNeyuq4LNUjBTR9SgRA2jWQ
X-Google-Smtp-Source: AGHT+IHap190jsggvy1J+9MTsqxB5rsoXSP5ESWXdf9T85K+rXQG2pkpj+TJ/2oeNxF4olOlZ6yCuQ==
X-Received: by 2002:a05:6512:308d:b0:539:f8cb:f5e3 with SMTP id 2adb3069b0e04-53b34a31bf7mr151438e87.48.1729883431775;
        Fri, 25 Oct 2024 12:10:31 -0700 (PDT)
Received: from ?IPV6:2a00:1fa0:421a:f26e:c952:2dc6:8a58:f996? ([2a00:1fa0:421a:f26e:c952:2dc6:8a58:f996])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-53b2e10c0casm276122e87.51.2024.10.25.12.10.30
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 25 Oct 2024 12:10:31 -0700 (PDT)
Message-ID: <b4cf024a-43e4-4c9a-b645-b07137add0d4@gmail.com>
Date: Fri, 25 Oct 2024 22:10:27 +0300
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] dt-bindings: net: renesas,ether: Add iommus property
To: Geert Uytterhoeven <geert+renesas@glider.be>,
 Paul Barker <paul.barker.ct@bp.renesas.com>,
 =?UTF-8?Q?Niklas_S=C3=B6derlund?= <niklas.soderlund+renesas@ragnatech.se>,
 "David S . Miller" <davem@davemloft.net>, Eric Dumazet
 <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>,
 Paolo Abeni <pabeni@redhat.com>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>
Cc: netdev@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
 devicetree@vger.kernel.org
References: <2ca890323477a21c22e13f6a1328288f4ee816f9.1729868894.git.geert+renesas@glider.be>
Content-Language: en-US
From: Sergei Shtylyov <sergei.shtylyov@gmail.com>
In-Reply-To: <2ca890323477a21c22e13f6a1328288f4ee816f9.1729868894.git.geert+renesas@glider.be>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 10/25/24 6:12 PM, Geert Uytterhoeven wrote:

> make dtbs_check:
> 
>     arch/arm64/boot/dts/renesas/r8a77980-condor.dtb: ethernet@e7400000: 'iommus' does not match any of the regexes: '@[0-9a-f]$', 'pinctrl-[0-9]+'
> 	    from schema $id: http://devicetree.org/schemas/net/renesas,ether.yaml#
> 
> Ethernet Controllers on R-Car Gen2/Gen3 SoCs can make use of the IOMMU,
> so add the missing iommus property.
> 
> Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>

Reviewed-by: Sergei Shtylyov <sergei.shtylyov@gmail.com>

[...]

MBR, Sergey


