Return-Path: <linux-renesas-soc+bounces-6672-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id DE27091417D
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 24 Jun 2024 06:56:23 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 0C6F31C213E1
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 24 Jun 2024 04:56:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 271A210A1E;
	Mon, 24 Jun 2024 04:56:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b="L13ZlCSE"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-ed1-f41.google.com (mail-ed1-f41.google.com [209.85.208.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 100481094E
	for <linux-renesas-soc@vger.kernel.org>; Mon, 24 Jun 2024 04:56:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719204980; cv=none; b=q/ADiND+Yr1XK9JkijyT0QNAJhfa4gf1Rf5H1Qz84WB5JfuxZ5mTzbGk4clUOfgsnrSt9/xFMST7oyYPAEC6f+OYMCcytIKF+kNUiYx86d1UX44PWtmNkHRcPLjfbbgT9j24WzBJae00I8VINymA4d9B3HbomPKiyOXs385Aww4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719204980; c=relaxed/simple;
	bh=XRn8z5Dc6gxQd4rxv6QKMWa5eM7X3d9KBWZ48fMrMNo=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=pyyo8NWQJUxKBGc54HPBUvPJwyUUA2bo8n7OK/9SoVLl5UGBQui18rsTBnV9t+37C6r3yO1df05+mqBZFGRZGgZSA48/qjqwgehQ8l5S/D3987zvINB2QC3Op+MQXKV3IFsNc0IZ9zFpOnUCaOIVghdQ9xYPgvKfyJdiDgxM1tg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev; spf=pass smtp.mailfrom=tuxon.dev; dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b=L13ZlCSE; arc=none smtp.client-ip=209.85.208.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=tuxon.dev
Received: by mail-ed1-f41.google.com with SMTP id 4fb4d7f45d1cf-57ccd1111b0so2057058a12.3
        for <linux-renesas-soc@vger.kernel.org>; Sun, 23 Jun 2024 21:56:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tuxon.dev; s=google; t=1719204976; x=1719809776; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=GwS8nRsUi4Pi7NDswPTZeRQSelgo4Wf8y2x/G7MWwUI=;
        b=L13ZlCSEz0L52j5idCKiUv24KfqDbND0hYG8A5wPlb9cGlUiyDKkD8EhbLv2TXnfk6
         +aIiT2nFICoXZlEn38F8uqadzyH3BbniOniEPMLdKFXumcDRJtSTRMUli/4QWR6TDEIu
         64yv9//ctg99W6KcPblqVoFHLYbr1flGtRpPFBZfiqW4+VdsSWldQRZ1TPRQyDmAEBnJ
         KT8pdThmmIk/0NXPFaBet4PU4f2TcRQp2gji9bcH3VKsJuHcv91CVMQM+Fw6KL6/BNM6
         Z3XVDDkx11tnmUYrR6ezjvIRnUqFTV81ul1GHsZIEsir6P5S6od2MlpghCJ1NVoPx27k
         Yj3w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719204976; x=1719809776;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=GwS8nRsUi4Pi7NDswPTZeRQSelgo4Wf8y2x/G7MWwUI=;
        b=VuQqEGMq7nXDlQMQhZmnYLrh3FWDE3UrVRyRt27hIjWtvCPPQd0J/b/aIzqRNldoY0
         ojRphGERZASgbpSgb64Em5yl8gWHX/671QCX91LikpinqNyfJrJDgaSvFtnKi0mnDvHU
         GVk/SGWRZmrOjq+dY8Z9XKoC8dkHD/MyIOUdSP23MFo7l5rvpC0ILJ1iOOLd+VNfFkuq
         AjBnoHEyTOI51Riz0pFnDpXJyiKE2vbvThnr1AnP7LGFaSU0x5ylc91KCiVjhHq5lkiR
         MAsSz+ihsp0L25Menc0y/ROS7Xf6elPjGgpQeGUVaECozvxnFSTZ9h2I1jtgDVMI7xYI
         SmsQ==
X-Forwarded-Encrypted: i=1; AJvYcCWGzfwcFURL+MZn1vQYPkshjNz7rIhm+7TApuXpbKfo4PCWG95D1fSz00XCz9F9hkLX5L3Ti+QPGbABFPGNrRy6om4ZT7Dn8kEfD8TtDXITrR4=
X-Gm-Message-State: AOJu0YwZxeg4TZ/t2cZZWzFFEduqxAKBsxzDWlA0ll/eWAMe++RkR7tx
	fFAdPVHzpWJ10Kamw7SiKGHBFNfnoCWnlDxNi3VBY3ldql4Aq852Zw0XA1s3ilc=
X-Google-Smtp-Source: AGHT+IFkAj6+lAcyOS1W5Z8hDAd6EAdxwsjmhe+7pNcvGnK4bEvsilu7KOvy0QwEDrh3qaUYkYkcjQ==
X-Received: by 2002:a50:a69d:0:b0:57c:5d4a:4122 with SMTP id 4fb4d7f45d1cf-57d4bd59fbamr2512691a12.9.1719204976341;
        Sun, 23 Jun 2024 21:56:16 -0700 (PDT)
Received: from [192.168.50.4] ([82.78.167.70])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-57d303d7aecsm4209761a12.20.2024.06.23.21.56.14
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 23 Jun 2024 21:56:15 -0700 (PDT)
Message-ID: <cec78633-8cfe-4e79-819c-7f9ff07cdfcd@tuxon.dev>
Date: Mon, 24 Jun 2024 07:56:13 +0300
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 7/9] arm64: dts: renesas: r9a08g045: Add missing
 hypervisor virtual timer IRQ
To: Geert Uytterhoeven <geert+renesas@glider.be>,
 Magnus Damm <magnus.damm@gmail.com>,
 Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>,
 Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>,
 Biju Das <biju.das.jz@bp.renesas.com>,
 Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
Cc: Mark Rutland <mark.rutland@arm.com>, Marc Zyngier <maz@kernel.org>,
 linux-renesas-soc@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 devicetree@vger.kernel.org
References: <cover.1718890849.git.geert+renesas@glider.be>
 <884c683fb6c1d1bf7d0d383a8df8f65a0a424dc7.1718890849.git.geert+renesas@glider.be>
From: claudiu beznea <claudiu.beznea@tuxon.dev>
Content-Language: en-US
In-Reply-To: <884c683fb6c1d1bf7d0d383a8df8f65a0a424dc7.1718890849.git.geert+renesas@glider.be>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit



On 20.06.2024 16:57, Geert Uytterhoeven wrote:
> Add the missing fifth interrupt to the device node that represents the
> ARM architected timer.  While at it, add an interrupt-names property for
> clarity,
> 
> Fixes: e20396d65b959a65 ("arm64: dts: renesas: Add initial DTSI for RZ/G3S SoC")
> Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>

Reviewed-by: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
Tested-by: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>

> ---
>  arch/arm64/boot/dts/renesas/r9a08g045.dtsi | 5 ++++-
>  1 file changed, 4 insertions(+), 1 deletion(-)
> 
> diff --git a/arch/arm64/boot/dts/renesas/r9a08g045.dtsi b/arch/arm64/boot/dts/renesas/r9a08g045.dtsi
> index 2162c247d6deb170..0d5c47a65e46c584 100644
> --- a/arch/arm64/boot/dts/renesas/r9a08g045.dtsi
> +++ b/arch/arm64/boot/dts/renesas/r9a08g045.dtsi
> @@ -294,6 +294,9 @@ timer {
>  		interrupts-extended = <&gic GIC_PPI 13 IRQ_TYPE_LEVEL_LOW>,
>  				      <&gic GIC_PPI 14 IRQ_TYPE_LEVEL_LOW>,
>  				      <&gic GIC_PPI 11 IRQ_TYPE_LEVEL_LOW>,
> -				      <&gic GIC_PPI 10 IRQ_TYPE_LEVEL_LOW>;
> +				      <&gic GIC_PPI 10 IRQ_TYPE_LEVEL_LOW>,
> +				      <&gic GIC_PPI 12 IRQ_TYPE_LEVEL_LOW>;
> +		interrupt-names = "sec-phys", "phys", "virt", "hyp-phys",
> +				  "hyp-virt";
>  	};
>  };

