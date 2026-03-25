Return-Path: <linux-renesas-soc+bounces-30250-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id kNIlHZvyw2lZvAQAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-30250-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 25 Mar 2026 15:35:07 +0100
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id 5F0E4326D4E
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 25 Mar 2026 15:35:06 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id A07143073A25
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 25 Mar 2026 14:15:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5370E3DEAD7;
	Wed, 25 Mar 2026 14:15:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Nl56ZxuE"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-dy1-f180.google.com (mail-dy1-f180.google.com [74.125.82.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1712F3DE427
	for <linux-renesas-soc@vger.kernel.org>; Wed, 25 Mar 2026 14:15:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774448103; cv=none; b=nMna/mrRwvgbikBUr9y5rZuafDSTFQomoG50mKiBJGKBtWxiqBkWmu/0vqMtiHJjTNdCoyGzdCnibL0sBicyUXUWceb3lWVP1G11/zDtXNJGuuYHJLu/+Jvb2ozX62yzzBSkJ05AqB+466QFddhxnm28YnSaBzNkqSHG7vjQDAw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774448103; c=relaxed/simple;
	bh=ndRGJhASfV/L3jTg7ReiuFcxx6gZ79D9Btx0MKrmdc8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=pcFTKgDyfQmOphUKII7W73xCFuge+3xk8MR/uz58IKkh0RJtlYm0Vw6gNfEjSxdCODC0INjZuksAvie9ndp9TAZnZywBH0rnDXXpsdYbsmZBPRLqt5aBVVHbTri+pSrBN9/8LqKVeaE0erXva4yPRH1y1o2m3SS7UaJdGC6/Wvc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Nl56ZxuE; arc=none smtp.client-ip=74.125.82.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-dy1-f180.google.com with SMTP id 5a478bee46e88-2c1092cc08cso304794eec.1
        for <linux-renesas-soc@vger.kernel.org>; Wed, 25 Mar 2026 07:15:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1774448100; x=1775052900; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:from:to:cc:subject:date:message-id
         :reply-to;
        bh=/p/oHQQntdvJrq3bem71WhkRlm6GlLE1KCuSOKiT0mY=;
        b=Nl56ZxuE/vBA7ncQKV5IpGpVBuLR54k8YT3LyWdnZzhpCnK0GZhTyafsPGXpwuXSt7
         LDpHwwx2c2LV0BKJfwSMIe/mrrVJSCd2Ff67J57vIcBTtwNKEKbyHbN9Yf2PnuZZYnsO
         M+B+tqN8C/96P22VVCXNp2xOHJyXjpkbKWVJGUpnnBNaPAd9tgPoSKPuYDa4AdI9uYM2
         kwlgNdwO7sdVlxGWRKl18kT05x9emL5T1lRR8jZFoHoH8cHlNpHPiQU6QL+bfwKHX2sr
         vV0oX8t+TqFgyl/YPeK1t7505+knVhOIOKOYzuzypn/iow8msIKwJg+tK+6/ECPpW6h/
         jZkw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774448100; x=1775052900;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=/p/oHQQntdvJrq3bem71WhkRlm6GlLE1KCuSOKiT0mY=;
        b=posisp2kzs/v1CMdQGEzDLbSGIntY2W6JTKUJ0Eff8was4nEbIvp5D8Ffp+JEpyFBS
         nLVnVHv2M4bRdXwRGLMy2uEx065qPlsyd1Q2j0pVOUvUnGbQ4gobgs5JI0JY4T/0182V
         5OcdK/xqViyrcSzHY1G1qf86J/Xw675vTsuM9FgJn+jQrKgX4joKrV0KUNgFSPUp3n4Q
         K6SRLgxwgmNo20cWPA5hMGEev3yQ+f7Lj1AQcsZGAZi0ly+eTspzreXg6NaHAB4wfl/A
         i/HU4B3RI8Qm3pMZuRudnieUUQe1VjWGqr6CwasNt/ICMvWNvbuvPSp7QUfU9g78yjxE
         Zwow==
X-Forwarded-Encrypted: i=1; AJvYcCXYCPfhQS6sjox39uBGKvwrL3btL/r4/+qFmRkCzwsr93IPjrmbtr6Um0ZoXf5ZJVqKw7NtN7OSKSf3rcsvBlAz9w==@vger.kernel.org
X-Gm-Message-State: AOJu0YwcDPcB60eKbB3RY+cLLlSa7OygMEUV0h+RbavMC2Y7CxWeekB/
	QAmLb1CxrPtkKcz+JGZqkXVb/t5CfuFEzdph4/ZpNSBLckmbmA1TYJHQ
X-Gm-Gg: ATEYQzxqoSwRafTXx3GJ17etDpen5U9vNwSqbZcAu1emoM0Lgz91l0dX1aovUqfKfwA
	uKjycmz4JqH1T6Ldu/fHTfcYCI5frKHRiRke8r23LPTM7ZSxO+4SEHd+CX8Q7UgwBNPqw5cH++k
	+fYPtgwooHCPqW6Z3l1+VcZACP7wdeV8qIKb4stgAkRPWEiAjKzAuHxiwpZQw0yPJtH20m+peGM
	GZkmyGjsqGs5rt5hCpS5YYMQa6a6lkCDH4yBvcpeh2aFEEj4BMo/S+uar1MBb05egekpF/uNPMj
	voW/We23Pa3LWmZl7niLgWTUuI1FfzWMAHW+Wyv79G8wZbvJdRiuMZVpugIkWtAO9GakNQ5rf83
	FaQ29ibQS5zUaH7gfiLheTrXWxkravtxcDXFzOsozxGKkX1/3+N9UeVMTcwoUHX/fZwLvMGQPP4
	7FJWXQu8kzk3Vl503T+dAx22uzZULnSdIkpGR03FGImDICw24=
X-Received: by 2002:a05:7300:ac90:b0:2c1:778:d897 with SMTP id 5a478bee46e88-2c15d43ba66mr1797423eec.21.1774448099826;
        Wed, 25 Mar 2026 07:14:59 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2c10b29c757sm18183035eec.18.2026.03.25.07.14.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Mar 2026 07:14:59 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Date: Wed, 25 Mar 2026 07:14:58 -0700
From: Guenter Roeck <linux@roeck-us.net>
To: Dawei Liu <dawei.liu.jy@renesas.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Jonathan Corbet <corbet@lwn.net>,
	Shuah Khan <skhan@linuxfoundation.org>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Magnus Damm <magnus.damm@gmail.com>,
	Grant Peltier <grant.peltier.jg@renesas.com>,
	Linda Xin <linda.xin.jg@renesas.com>,
	Tabrez Ahmed <tabreztalks@gmail.com>, linux-hwmon@vger.kernel.org,
	devicetree@vger.kernel.org, linux-doc@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org, linux-kernel@vger.kernel.org,
	Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Subject: Re: [PATCH v5 1/2] dt-bindings: hwmon: isl68137: Add compatible
 strings for RAA228942 and RAA228943
Message-ID: <7d2c44e8-b831-4f83-9158-c157ae7bde9e@roeck-us.net>
References: <20260325090208.857-1-dawei.liu.jy@renesas.com>
 <20260325090208.857-2-dawei.liu.jy@renesas.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260325090208.857-2-dawei.liu.jy@renesas.com>
X-Spamd-Result: default: False [-0.16 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FROM_HAS_DN(0.00)[];
	TAGGED_FROM(0.00)[bounces-30250-lists,linux-renesas-soc=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	DMARC_NA(0.00)[roeck-us.net];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_CC(0.00)[kernel.org,lwn.net,linuxfoundation.org,glider.be,gmail.com,renesas.com,vger.kernel.org,oss.qualcomm.com];
	RCPT_COUNT_TWELVE(0.00)[17];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[gmail.com:+];
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	MISSING_XM_UA(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[linux@roeck-us.net,linux-renesas-soc@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-renesas-soc,dt,renesas];
	MID_RHS_MATCH_FROM(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns,qualcomm.com:email,renesas.com:email]
X-Rspamd-Queue-Id: 5F0E4326D4E
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Wed, Mar 25, 2026 at 05:02:07PM +0800, Dawei Liu wrote:
> RAA228942 and RAA228943 are Renesas digital dual-output
> 16-phase (X+Y <= 16) PWM controllers with 2-rail non-TC
> driver configuration. At the PMBus hwmon interface level,
> they are compatible with existing 2-rail non-TC controllers
> and use renesas,raa228244 as fallback compatible
> 
> Signed-off-by: Dawei Liu <dawei.liu.jy@renesas.com>
> Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>

Applied.

Thanks,
Guenter

> ---
>  .../bindings/hwmon/pmbus/isil,isl68137.yaml   | 93 ++++++++++---------
>  1 file changed, 50 insertions(+), 43 deletions(-)
> 
> diff --git a/Documentation/devicetree/bindings/hwmon/pmbus/isil,isl68137.yaml b/Documentation/devicetree/bindings/hwmon/pmbus/isil,isl68137.yaml
> index ae23a0537..8216cdf75 100644
> --- a/Documentation/devicetree/bindings/hwmon/pmbus/isil,isl68137.yaml
> +++ b/Documentation/devicetree/bindings/hwmon/pmbus/isil,isl68137.yaml
> @@ -16,49 +16,56 @@ description: |
>  
>  properties:
>    compatible:
> -    enum:
> -      - isil,isl68137
> -      - renesas,isl68220
> -      - renesas,isl68221
> -      - renesas,isl68222
> -      - renesas,isl68223
> -      - renesas,isl68224
> -      - renesas,isl68225
> -      - renesas,isl68226
> -      - renesas,isl68227
> -      - renesas,isl68229
> -      - renesas,isl68233
> -      - renesas,isl68239
> -      - renesas,isl69222
> -      - renesas,isl69223
> -      - renesas,isl69224
> -      - renesas,isl69225
> -      - renesas,isl69227
> -      - renesas,isl69228
> -      - renesas,isl69234
> -      - renesas,isl69236
> -      - renesas,isl69239
> -      - renesas,isl69242
> -      - renesas,isl69243
> -      - renesas,isl69247
> -      - renesas,isl69248
> -      - renesas,isl69254
> -      - renesas,isl69255
> -      - renesas,isl69256
> -      - renesas,isl69259
> -      - isil,isl69260
> -      - renesas,isl69268
> -      - isil,isl69269
> -      - renesas,isl69298
> -      - renesas,raa228000
> -      - renesas,raa228004
> -      - renesas,raa228006
> -      - renesas,raa228228
> -      - renesas,raa228244
> -      - renesas,raa228246
> -      - renesas,raa229001
> -      - renesas,raa229004
> -      - renesas,raa229621
> +    oneOf:
> +      - enum:
> +          - isil,isl68137
> +          - renesas,isl68220
> +          - renesas,isl68221
> +          - renesas,isl68222
> +          - renesas,isl68223
> +          - renesas,isl68224
> +          - renesas,isl68225
> +          - renesas,isl68226
> +          - renesas,isl68227
> +          - renesas,isl68229
> +          - renesas,isl68233
> +          - renesas,isl68239
> +          - renesas,isl69222
> +          - renesas,isl69223
> +          - renesas,isl69224
> +          - renesas,isl69225
> +          - renesas,isl69227
> +          - renesas,isl69228
> +          - renesas,isl69234
> +          - renesas,isl69236
> +          - renesas,isl69239
> +          - renesas,isl69242
> +          - renesas,isl69243
> +          - renesas,isl69247
> +          - renesas,isl69248
> +          - renesas,isl69254
> +          - renesas,isl69255
> +          - renesas,isl69256
> +          - renesas,isl69259
> +          - isil,isl69260
> +          - renesas,isl69268
> +          - isil,isl69269
> +          - renesas,isl69298
> +          - renesas,raa228000
> +          - renesas,raa228004
> +          - renesas,raa228006
> +          - renesas,raa228228
> +          - renesas,raa228244
> +          - renesas,raa228246
> +          - renesas,raa229001
> +          - renesas,raa229004
> +          - renesas,raa229621
> +
> +      - items:
> +          - enum:
> +              - renesas,raa228942
> +              - renesas,raa228943
> +          - const: renesas,raa228244
>  
>    reg:
>      maxItems: 1

