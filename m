Return-Path: <linux-renesas-soc+bounces-29283-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id kLgpJLTDsmmvPAAAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-29283-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 12 Mar 2026 14:46:28 +0100
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 3CA3F272DA1
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 12 Mar 2026 14:46:28 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 71197302E798
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 12 Mar 2026 13:45:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 17786347BD7;
	Thu, 12 Mar 2026 13:45:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="eCzbkQnJ"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-wr1-f42.google.com (mail-wr1-f42.google.com [209.85.221.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 338EA25DB0D
	for <linux-renesas-soc@vger.kernel.org>; Thu, 12 Mar 2026 13:45:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773323122; cv=none; b=ez/FRJ5a+QGo52YGqbXAeSQ+/7FkmUquiU9ycV/rPYkdYQjY5gx4Gmj40BdRLzjz8jBtg8+yPsGG4rLwC3H9revKAleqWn9VKaHdxZLmvG1nnNqSB3z7M8f4RU4ZK+Tc93ENch3qWEshmswTqdd0nycttQ/MkYjLUeOaXeROTcM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773323122; c=relaxed/simple;
	bh=1tD5pPrvMnoCHzCtJiuVn5kZFGViWPXFoe6999PS/To=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=j9ZYtEsWv1XXEIbrPJXRDPXHYTD2Oa4E2gjMiCuD/p03x3z9M91vjEaRVeq515Y8xts7KmukajJCDAvpZfnUG12SGfgrdpT8HmR5sVtoWACZ0GY56Iav4VqYrLB6wdosbCwC97MVYJCJMKHggE8KySJ+cBgfOb0ppN14LlkyYgA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=eCzbkQnJ; arc=none smtp.client-ip=209.85.221.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wr1-f42.google.com with SMTP id ffacd0b85a97d-439fe4985efso904887f8f.3
        for <linux-renesas-soc@vger.kernel.org>; Thu, 12 Mar 2026 06:45:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1773323119; x=1773927919; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=X/MzT9OXjxJMGmMrqTMakhYaBCjsIpZiUbODg9e6XnE=;
        b=eCzbkQnJYFpB6tkUtprN5SkiVZK1pdfH8+sZAgLKDpwpF6RnYSnm5ctNVkDz8sLAFP
         7AtQGYEfKVrbWGOSb0UwYNluYtFrZqSdXm1fDI4wfgsdhQ17Lpz7BiK/CIwWPIO80glU
         lM39fphWPQLImWtp4bsctGSlhBPxbLIHlo8CQuBTMhR0W3lZLtMHs6yfEpc3NJOg6QU3
         nXD9L+MMfveoTaWOn/qy4mr/IKqeeDHoNAn5mtl36FeNZ0QhCLO4EiMEb3/V07KT2JbQ
         B079rIQker7ZnlLWX2ZRHVfkSQKq7VSHknrTy3tJNAuR8dxVyF8vhIVsspUwolsDGoVQ
         jJUw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773323119; x=1773927919;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=X/MzT9OXjxJMGmMrqTMakhYaBCjsIpZiUbODg9e6XnE=;
        b=Vd2+vh3G/vhIFNsQTAff0zOqs5sBYLeg3BQna/jcEEUuWdJHzl1jZXWXWFJXOtqCs5
         hu2OEl3LFQjXD6w7nb0XMyPwq6SVlzy497jY13cYY7+K2U1ArHJN/BM72gBUY0kzQLEg
         DEaRSyWMe3m+MLabvcBC9UnFhjMJeGhhhMZm8TDfXLKjM7NdljEoIfLwRYpjd8fHtkDB
         slkWRkv5ZyiPWgeetpT67IGwTwEVM4aRO6WjFfjaFs/rgUfR+/XvhneNzF7mm3mxeTF7
         bd3V1uW22W5AHjKWeRi8ohCQE0OuzhLGQ53CUg7SVq2/o0c2yX+Nj7C5CNuO2Xadq/IK
         /uCg==
X-Forwarded-Encrypted: i=1; AJvYcCUEJ0BsB4oZ+0W92nr25umreJ45+1DUweI4qvAxvztDFrS5KKMdkdNAH9p0xcZ/JRtLAuGo0mpsLQVIF3Ypici7dA==@vger.kernel.org
X-Gm-Message-State: AOJu0YySuymvpeEBL+6smHwEyxzq81ZhtwPqTdMxKhQPYP0NPFfFLdUZ
	2Q050Vh/tCxV0dWW60r/7hPaxEMRQgXyEdoT5hHsMoW/qPvtEfRmLHJs
X-Gm-Gg: ATEYQzx8q5AMmVUiu9mK0rmkh5l+5kQmnp/LdnAdSgnMe+lS8yBh9PgK0aZIVDod1WX
	HkEJIa1SCsXjgPCHYF08qGD5OrkPdz8dNmCRNMrK0RNnL3z97BOxtRRgq6m/QDh/2QVN+bxSfGe
	y89ptHQvvIlwFooKMaGBEN+6+UcJwzPmb64LHNfAfkhHBgGnLaWyxJVG+X8NqMxdN/e/lF4klC3
	IeGgAmROVhpgagSpF3b2Av4xGaFo7N9mrc7m/X2UXl1moc1Io5QpzgyjcHbuEGkm9n1iec+ry6u
	U1EyoSizEzMCVcVq0adUoeHPKtozSMbhSSCOU7b4cw6Cbw4QwAVb+nIbl6d7yEO2Jbq/kkyILZN
	9GHHl6d6km6XFBu+L6TWAQ3dmuZnsgHLhdYXcIIvAiERlc7tkunCBrFqNmgnBtMFk+N/Lz5nWm9
	LO4mHqfOdjuObtzR+GsHOkotYd5V7rRJUSxw==
X-Received: by 2002:a05:6000:2204:b0:439:b940:8bfb with SMTP id ffacd0b85a97d-439f81ec76cmr12353254f8f.15.1773323119226;
        Thu, 12 Mar 2026 06:45:19 -0700 (PDT)
Received: from eichest-laptop ([77.109.188.37])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-439fe19ac34sm9090650f8f.3.2026.03.12.06.45.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Mar 2026 06:45:18 -0700 (PDT)
Date: Thu, 12 Mar 2026 14:45:17 +0100
From: Stefan Eichenberger <eichest@gmail.com>
To: Geert Uytterhoeven <geert+renesas@glider.be>
Cc: Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S . Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, netdev@vger.kernel.org,
	devicetree@vger.kernel.org, linux-renesas-soc@vger.kernel.org
Subject: Re: [PATCH 2/2] dt-bindings: net: micrel: KSZ8041RNLI supports LED
 mode
Message-ID: <abLDbbgox24m76Fw@eichest-laptop>
References: <cover.1773321267.git.geert+renesas@glider.be>
 <6ccda7a00f250e87b0457e276ac1070cb0708d71.1773321267.git.geert+renesas@glider.be>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <6ccda7a00f250e87b0457e276ac1070cb0708d71.1773321267.git.geert+renesas@glider.be>
X-Spamd-Result: default: False [-0.16 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	MID_RHS_NOT_FQDN(0.50)[];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20230601];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-29283-lists,linux-renesas-soc=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[12];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_FROM(0.00)[gmail.com];
	FROM_HAS_DN(0.00)[];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[eichest@gmail.com,linux-renesas-soc@vger.kernel.org];
	DKIM_TRACE(0.00)[gmail.com:+];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-renesas-soc,renesas,netdev,dt];
	TO_DN_SOME(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,devicetree.org:url,0.0.0.1:email,glider.be:email]
X-Rspamd-Queue-Id: 3CA3F272DA1
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Thu, Mar 12, 2026 at 02:27:36PM +0100, Geert Uytterhoeven wrote:
> Micrel KSZ8041RNLI supports LED mode, just like KSZ8041.
> 
> This fixes (a.o.) the following "make dtbs_check" warning:
> 
>     arch/arm/boot/dts/renesas/r8a7791-koelsch.dtb: ethernet-phy@1 (ethernet-phy-id0022.1537): False schema does not allow 1
> 	    from schema $id: http://devicetree.org/schemas/net/micrel.yaml
> 
> Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
> ---
>  Documentation/devicetree/bindings/net/micrel.yaml | 2 ++
>  1 file changed, 2 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/net/micrel.yaml b/Documentation/devicetree/bindings/net/micrel.yaml
> index 5d25f0d0a508a6df..7fb61c78d16cd801 100644
> --- a/Documentation/devicetree/bindings/net/micrel.yaml
> +++ b/Documentation/devicetree/bindings/net/micrel.yaml
> @@ -54,6 +54,7 @@ properties:
>        KSZ8021: register 0x1f, bits 5..4
>        KSZ8031: register 0x1f, bits 5..4
>        KSZ8041: register 0x1e, bits 15..14
> +      KSZ8041RLNI: register 0x1e, bits 15..14
>        KSZ8051: register 0x1f, bits 5..4
>        KSZ8081: register 0x1f, bits 5..4
>        KSZ8091: register 0x1f, bits 5..4
> @@ -80,6 +81,7 @@ allOf:
>              contains:
>                enum:
>                  - ethernet-phy-id0022.1510
> +                - ethernet-phy-id0022.1537
>                  - ethernet-phy-id0022.1550
>                  - ethernet-phy-id0022.1555
>                  - ethernet-phy-id0022.1556

Looks also good to me, thanks for the fix.

Reviewed-by: Stefan Eichenberger <eichest@gmail.com>

