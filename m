Return-Path: <linux-renesas-soc+bounces-4696-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 03C5F8A922B
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 18 Apr 2024 06:54:56 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 6BC0FB220B5
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 18 Apr 2024 04:54:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CB3C1524D4;
	Thu, 18 Apr 2024 04:54:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b="kmAm/FmR"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-wr1-f51.google.com (mail-wr1-f51.google.com [209.85.221.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EFF184438F
	for <linux-renesas-soc@vger.kernel.org>; Thu, 18 Apr 2024 04:54:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1713416087; cv=none; b=jopS5kmQQTHW5VKMRCuCrV6VbyVd4gnR+8XWpyGQ9G8y+8nfHbzpitqcIkeqMhEMve3NlEFGGOyMV4oJ1UkYqb/6TgbpVsJe+TUXORUp82ROgAN7O2063llz5tCbrF2zLeLEd4ggrMT7NIv8XmUATuRsrM3gUD/TzkOgmk8wNPY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1713416087; c=relaxed/simple;
	bh=l+eY8tTDyqWyVXlISC7VFjgtUEuZI+FUR4T3V7xK5Ko=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=YHBhhUYF9f/6q0pC9COrePQUemf4p2EzGIy65sg03ZkUKMb5rCSJl+1KoALZ+tg5HN0PzATWx3Ap0WvNPQg2eNN2QqK12JQlcjRKJHejCJilVqajyobDRcXHTSIsL1+wbu8SloIjIqSWDe8mAeNKZeUek0BYvnayLpYZ6gXuNlA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev; spf=pass smtp.mailfrom=tuxon.dev; dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b=kmAm/FmR; arc=none smtp.client-ip=209.85.221.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=tuxon.dev
Received: by mail-wr1-f51.google.com with SMTP id ffacd0b85a97d-343b92e54f5so323587f8f.0
        for <linux-renesas-soc@vger.kernel.org>; Wed, 17 Apr 2024 21:54:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tuxon.dev; s=google; t=1713416083; x=1714020883; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=SEV1/iFjpmWtEmSKqFgeoYjXuzkyg2NXZjtp9IdqTXI=;
        b=kmAm/FmRb+83zYtuzhRcXZ6V79W1gOX9lY4UaGfhutfbdAnoHgr7BDEUlB4AHRijEH
         731Y/4Y5mzepyveuubE66lGeMr9XHYmS9zDtEZ+8tE33DJZP2yGUPiIXLtlgM35U1mSc
         gJk8a5Rij1jaEkp8oKnZ71wZcunqzJP15gN6mdo0C+e6sSPpXsdzjiazebwG0XQT+dzy
         vXEUzU/KOUUHLJH4ii0HsyZpacIl8xoMxDaWP/5gxc+lyc/OJDCyQjM1tD/VSgHp2aLd
         uRyfZhpefs6YWHU3ZxXmGN0V1L3FyAIBEwdtGZXEeSaItwHpSVqEURvZWftjXv2HG2yU
         LKAQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1713416083; x=1714020883;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=SEV1/iFjpmWtEmSKqFgeoYjXuzkyg2NXZjtp9IdqTXI=;
        b=QCqmZp6+5tFw0jjAXJjrKwf5h1egHmeuwE8mmL42WulXPnR7R7qEaGsqn9oEaT++hV
         grKj/HK1lMgckanBYkcthgVTC0RoYhB5GEkQw1cnlMRGcnj3MmdAjDYljiNdmq/IT9CH
         rnM08cklCnYJIP3+i5+5zUaIVqW2uQC4z/I5rSRiIrz3A2M0JE0Z+lPWUP1bMHEPS0Hc
         Mk0Mtu4Pn4YMp5jRBbBVoHw1lgsCMUUAW4Six3JXm8dzcJX6y9Fe5Ge/CFlSV6yD/5d2
         aHEVv1W6BqQ4Ouy9uIgXRcaq5b8KYUMsikvnStajDxDoHZoMasvMNz647CqnJz7GUwyh
         yigw==
X-Gm-Message-State: AOJu0Yyqm9oVraxYXnckKQjghEsqtaZphShDiBBFnXOIdgtZKOWO8Rhp
	N3lWxjCnUFPALkduNNnZYDmqlFb1LAvZ+r38/fFyc6+f57CTV9aTUURtMhq9PEU=
X-Google-Smtp-Source: AGHT+IFxe6+PaKuJ6n6lY0fFBN+EBx9jVKZ5r9lFREaHx80p6pKJXX/SI+I0pB85FB7OsDWzDIJXGA==
X-Received: by 2002:adf:f851:0:b0:345:223:2dd8 with SMTP id d17-20020adff851000000b0034502232dd8mr718339wrq.23.1713416083033;
        Wed, 17 Apr 2024 21:54:43 -0700 (PDT)
Received: from [192.168.50.4] ([82.78.167.185])
        by smtp.gmail.com with ESMTPSA id l6-20020adfa386000000b00349e2fab2a2sm799118wrb.12.2024.04.17.21.54.40
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 17 Apr 2024 21:54:42 -0700 (PDT)
Message-ID: <dd231ad2-06e7-4f8d-b7ed-d0e374a9561f@tuxon.dev>
Date: Thu, 18 Apr 2024 07:54:38 +0300
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] arm64: dts: renesas: rzg3s-smarc-som: Enable eMMC by
 default
Content-Language: en-US
To: Prabhakar <prabhakar.csengg@gmail.com>,
 Geert Uytterhoeven <geert+renesas@glider.be>,
 Magnus Damm <magnus.damm@gmail.com>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
Cc: linux-renesas-soc@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org,
 Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
References: <20240417112003.428348-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
From: claudiu beznea <claudiu.beznea@tuxon.dev>
In-Reply-To: <20240417112003.428348-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit



On 17.04.2024 14:20, Prabhakar wrote:
> From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> 
> Enable eMMC by default on the RZ/G3S SMARC platform, as previously done
> on RZ/G2L boards and other Renesas platforms.
> 
> The SW_CONFIG2 setting selects between the uSD0 card and eMMC. By setting
> SW_CONFIG2 to SW_OFF, we select eMMC by default.
> 
> Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>

Reviewed-by: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>

> ---
>  arch/arm64/boot/dts/renesas/rzg3s-smarc-som.dtsi | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/arch/arm64/boot/dts/renesas/rzg3s-smarc-som.dtsi b/arch/arm64/boot/dts/renesas/rzg3s-smarc-som.dtsi
> index 1f87150a2e0a..8a3d302f1535 100644
> --- a/arch/arm64/boot/dts/renesas/rzg3s-smarc-som.dtsi
> +++ b/arch/arm64/boot/dts/renesas/rzg3s-smarc-som.dtsi
> @@ -25,7 +25,7 @@
>   *	SW_OFF - SD2 is connected to SoC
>   *	SW_ON  - SCIF1, SSI0, IRQ0, IRQ1 connected to SoC
>   */
> -#define SW_CONFIG2	SW_ON
> +#define SW_CONFIG2	SW_OFF
>  #define SW_CONFIG3	SW_ON
>  
>  / {

