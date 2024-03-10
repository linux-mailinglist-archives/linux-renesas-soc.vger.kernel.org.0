Return-Path: <linux-renesas-soc+bounces-3659-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 018E68775D8
	for <lists+linux-renesas-soc@lfdr.de>; Sun, 10 Mar 2024 09:44:57 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 2529B1C21010
	for <lists+linux-renesas-soc@lfdr.de>; Sun, 10 Mar 2024 08:44:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 654121D69E;
	Sun, 10 Mar 2024 08:44:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="PKuWnHAy"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-ej1-f50.google.com (mail-ej1-f50.google.com [209.85.218.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 71CFD17556
	for <linux-renesas-soc@vger.kernel.org>; Sun, 10 Mar 2024 08:44:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1710060291; cv=none; b=NBr92n/5kJj4712U11T1SXtoQJGxc1UH5Kp4rlUCCD2GFIXRBiAwXNtawcvJIVMoo7lujl9PLdqDXmgG1fVsx712MZjm8xl/AKYtBkNvvsR6sHPMjOdua6HdQuC8J2A8u41XyTTqSZXAoh+eCq5JgVw19gSSVJ8R75STdzZpWO8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1710060291; c=relaxed/simple;
	bh=HSQ8ESQPklTKLCf3m3sU8WH2pEDTKzKfenduepWXpqw=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=s8GOlaOpgxlJjpSdjXk5fcy7ib426LF/iGoovJfgpjCEDJOj4mkHdrODVoAkihDOa0rtwTg3DbMBBPUTzYPRGiTGqqrhqlZ7CN7jDeW2OpuzoeB8XMFfZEi+lAXYYn7L2LGQ0XdHienqs5Sreu4/Y1VEsCT89Zj8hn+CeAcjPN4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=PKuWnHAy; arc=none smtp.client-ip=209.85.218.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-ej1-f50.google.com with SMTP id a640c23a62f3a-a36126ee41eso456485466b.2
        for <linux-renesas-soc@vger.kernel.org>; Sun, 10 Mar 2024 00:44:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1710060288; x=1710665088; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=3jiQ5qQPdyYdX3mYgTew5eH9b3GM9SSnnTUQ4aps42I=;
        b=PKuWnHAyvIGwhWF62O8lk55smjiRbNd21QCxJVRUxlgi1pcorkFDxnRyIRrYh5Jniy
         QyewbC28zX6HLxt/sPAHtmbMHfXU3RxRUyfV8xwrMsWhaAnWAaGulq3CYWPZtC/VniQQ
         dW+8uTKXFxDtJrytI6/rmRc4eBIe0UFONe8b8a4xbZYqxkCl3RALwKJ6SpwYes7rEovx
         k6fJRXPxxToauRok4eUbwp9c3LyrFfMHzxRFf5atFS+uLvRyYZ7biflTkhw6xKIyxHuu
         aLjWibECz+MnQobTxS4Nl3XoGuf/zPZbnUzv7sv2X4U995uLNiS/J20XuoSMh5gsYqh8
         Zd7w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1710060288; x=1710665088;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=3jiQ5qQPdyYdX3mYgTew5eH9b3GM9SSnnTUQ4aps42I=;
        b=uN+z7WQmjp0++23yJMvC6bbSFR6mClxja84ak4n2zuq3oc3DFCBQqcD96woHCuOY6Q
         STGVVWhyHk9s5/+rRew++7FoRJksNfK0saSIo8A8lfBzbeFTRCqqp0GPZrUKdNH+xZQf
         eu2kgTjV7Cam+jg/Aqw7TMZMKGzANmB0dJdmgsW+KxRifKPywDpNLQVaMfWVRzoL874d
         QmzzY0m9GAHHAV58S7rNJ955JTLkIi5NHbVbajUQcqWQiligwhhs2oZ/cT53qyKa1Yne
         Card5RVyi8RGK3XhYkh8SzDxlM4OQ1akQAr4cTPTmZJNp9j62tIa3581ep+I3OG6SlqG
         PfSA==
X-Gm-Message-State: AOJu0YwsgVArk+K1QpXr1BgkEXlr4sclSswIfLYQ5L4ec2LkHRaO2VXx
	yQo1dSdCB+r6P9ijrbnclf+twLeAzg14vy+guwZLnco9+O0B7DlsRlzMNAVjlyc=
X-Google-Smtp-Source: AGHT+IF06tUR6ZJ6UF9MF9DwypYyaj6kp5s4rW+QjEi2nKEcT4GCcipUL2GIFocpt6f5ylkvxGG1Uw==
X-Received: by 2002:a17:907:d045:b0:a45:27bd:e1ff with SMTP id vb5-20020a170907d04500b00a4527bde1ffmr2138965ejc.6.1710060287809;
        Sun, 10 Mar 2024 00:44:47 -0800 (PST)
Received: from [192.168.1.20] ([178.197.222.97])
        by smtp.gmail.com with ESMTPSA id u23-20020a170906409700b00a42ed7421b8sm1735370ejj.93.2024.03.10.00.44.45
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 10 Mar 2024 00:44:47 -0800 (PST)
Message-ID: <cb8f85de-c1cd-4742-b8a4-2533482ee3b6@linaro.org>
Date: Sun, 10 Mar 2024 09:44:45 +0100
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [net-next 1/2] dt-bindings: net: renesas,etheravb: Add optional
 MDIO bus node
Content-Language: en-US
To: =?UTF-8?Q?Niklas_S=C3=B6derlund?=
 <niklas.soderlund+renesas@ragnatech.se>, Sergey Shtylyov
 <s.shtylyov@omp.ru>, "David S. Miller" <davem@davemloft.net>,
 Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>,
 Paolo Abeni <pabeni@redhat.com>, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Geert Uytterhoeven <geert+renesas@glider.be>,
 Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>,
 Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>,
 Biju Das <biju.das.jz@bp.renesas.com>, netdev@vger.kernel.org,
 devicetree@vger.kernel.org
Cc: linux-renesas-soc@vger.kernel.org
References: <20240309155334.1310262-1-niklas.soderlund+renesas@ragnatech.se>
 <20240309155334.1310262-2-niklas.soderlund+renesas@ragnatech.se>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Autocrypt: addr=krzysztof.kozlowski@linaro.org; keydata=
 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
 D2GYIS41Kv4Isx2dEFh+/Q==
In-Reply-To: <20240309155334.1310262-2-niklas.soderlund+renesas@ragnatech.se>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 09/03/2024 16:53, Niklas Söderlund wrote:
> The Renesas Ethernet AVB bindings do not allow the MDIO bus to be
> described. This has not been needed as only a single PHY is
> supported and no MDIO bus properties have been needed.
> 
> Add an optional mdio node to the binding which allows the MDIO bus to be
> described and allow bus properties to be set.
> 
> Signed-off-by: Niklas Söderlund <niklas.soderlund+renesas@ragnatech.se>
> ---

I believe this is v2. Mark your patchsets clearly (git format-patch -v2
or use b4) and provide changelog under --- or in the cover letter.


>  Documentation/devicetree/bindings/net/renesas,etheravb.yaml | 4 ++++
>  1 file changed, 4 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/net/renesas,etheravb.yaml b/Documentation/devicetree/bindings/net/renesas,etheravb.yaml
> index de7ba7f345a9..5345ad8e1be4 100644
> --- a/Documentation/devicetree/bindings/net/renesas,etheravb.yaml
> +++ b/Documentation/devicetree/bindings/net/renesas,etheravb.yaml
> @@ -93,6 +93,10 @@ properties:
>      description: Number of size cells on the MDIO bus.
>      const: 0
>  
> +  mdio:
> +    $ref: /schemas/net/mdio.yaml#
> +    unevaluatedProperties: false
> +

Please fixup the phy pattern, so it will be obvious it is for
ethernet-phy and probably deprecate it. The phy goes to mdio bus, right?


Best regards,
Krzysztof


