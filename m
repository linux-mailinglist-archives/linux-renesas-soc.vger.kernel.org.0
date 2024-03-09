Return-Path: <linux-renesas-soc+bounces-3638-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id DAFD58771AD
	for <lists+linux-renesas-soc@lfdr.de>; Sat,  9 Mar 2024 15:43:41 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 764B91F215A6
	for <lists+linux-renesas-soc@lfdr.de>; Sat,  9 Mar 2024 14:43:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 23A4A3FBB0;
	Sat,  9 Mar 2024 14:43:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ragnatech.se header.i=@ragnatech.se header.b="q2At2he+"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-lj1-f181.google.com (mail-lj1-f181.google.com [209.85.208.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3D8683399C
	for <linux-renesas-soc@vger.kernel.org>; Sat,  9 Mar 2024 14:43:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1709995417; cv=none; b=FVRBLenT8dncFv6NGhC2+7Y5LF2sEJPsJmkE4LJ6Ycr8gkdELbDMekAqZmhEUFw3OGOtc7F3xySI4dlfsh8A2RJ57sLrdBmDY/SETWXm9+svE1Q+4PzxC7yCZwCNf27Np6rMxVaq9jJFiDVIpbVQVxcRigzc9IqzgHEM591THZI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1709995417; c=relaxed/simple;
	bh=ZCY5JrSi4R89WpooannJGpIoBE4cj43USWy07YiOlz4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=LTWtkX97gnmjjLc2HV3561fsXrH5n7ItS7SN1j/uKOAXFhPQT3Kp8ZKxk1KJ3Mo571zD+o+UsEZh3YflgwQLy06aYDohybwj0lBvPftjStBh8TaHfFm7eHyMtsp6Q86fp4Ow4s2Db4aCzaWiYbaBti5UlVvI+rSuGEurPPmdah0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ragnatech.se; spf=pass smtp.mailfrom=ragnatech.se; dkim=pass (2048-bit key) header.d=ragnatech.se header.i=@ragnatech.se header.b=q2At2he+; arc=none smtp.client-ip=209.85.208.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ragnatech.se
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ragnatech.se
Received: by mail-lj1-f181.google.com with SMTP id 38308e7fff4ca-2d24a727f78so40072121fa.0
        for <linux-renesas-soc@vger.kernel.org>; Sat, 09 Mar 2024 06:43:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ragnatech.se; s=google; t=1709995413; x=1710600213; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=h0kW+Yjac8j5/LKoYqzeubelbIOefcn1QKUqPIQgTo8=;
        b=q2At2he+8KCg9MrniyX1ZLz5aK66+J6ohRz+bMqvkxtF1bZyfIDnccRvQx07RQLZjP
         pI1lUyvIaZCUG0KtRLjptwsG8ed6qVm7hLgBgRpDjH/64QBNfAbHiHWzCen9RHMGH3O/
         YvpSRF+J2nz8Mq2McP9QTwvLdHUGgSbxFzwuL3AJYc51Nql8j/wcjEabKU972h4+aotz
         VkihsSa9YK5dle63SL4FjqryeQFxt2O6m2HmGTX7lSUsmsA8IiQlpfeiOiv8X/8PjNWv
         E2YkoEYfnkEKZfpumfsPmHMO8hD5JiJougMcMSrCyKBbPe6XHA48X+ThakE9UBQxPDcK
         DaEQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1709995413; x=1710600213;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=h0kW+Yjac8j5/LKoYqzeubelbIOefcn1QKUqPIQgTo8=;
        b=g5JbaN0txbKwZjG/WETkfMbfWBFEe5wUivqIM4+FM++BTVebnhrpJDqschNM+wLH9h
         AuH1pLq/xzfBOWkvU+x2EodN4nTCztZsgqvF5Y6ZEV1RGJ/CO5O2+tkdr7nHrj05/X9F
         22MIoV7GWHt2LMf9dXh0jGfRO61D1isebIko0iDOjgzPmFuL32syCiCB4wcauRlIMAdw
         bc7iojAw3REWgULPy6mNerbvZJ7ddWm/xDmhd1pS2CX7r13h5PcA1s9JjOulq56VuWnQ
         Jn6Rrd07flV7EgOaQidHTwGyyp5698AQLfMgB71G7BNKDmW+q05chYGlg+1A8rR+yHT8
         dN6A==
X-Forwarded-Encrypted: i=1; AJvYcCXr64LAx2IDS50Kts2GJtH0PquXiGQf61sgZjH/cXp13Cdfe/eyoIQF8VFEHjcJHMf2aC3Qfh8+nG9P+Fcrgv3ewuZoZKn9PFM0bMC6NTwM7rQ=
X-Gm-Message-State: AOJu0YxC323U2Njmwm0DxSx9NJY4a6xZ5OKlQCTFpMvVGbH5eXRA33bJ
	mOdnt1Cr3hZCwc9VuyQwUuSno7LRiWgNu35MbFm3r9yJUYs8JX1ROTx3PRk+V1eyF7Ns7hhgQXK
	pjVc=
X-Google-Smtp-Source: AGHT+IFW2cnBAVhFZgw1YikO3bDpzTv5WTbqiwzGepCVZ9J1EVgmbWVLsoNajn5ktDhBFqGwt/Rgvw==
X-Received: by 2002:a05:651c:220c:b0:2d2:7e19:f6 with SMTP id y12-20020a05651c220c00b002d27e1900f6mr1586340ljq.23.1709995413333;
        Sat, 09 Mar 2024 06:43:33 -0800 (PST)
Received: from localhost (h-46-59-36-113.A463.priv.bahnhof.se. [46.59.36.113])
        by smtp.gmail.com with ESMTPSA id e8-20020a2e8188000000b002d42b09e307sm208232ljg.27.2024.03.09.06.43.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 09 Mar 2024 06:43:32 -0800 (PST)
Date: Sat, 9 Mar 2024 15:43:32 +0100
From: Niklas =?utf-8?Q?S=C3=B6derlund?= <niklas.soderlund+renesas@ragnatech.se>
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc: Geert Uytterhoeven <geert+renesas@glider.be>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>,
	linux-renesas-soc@vger.kernel.org, devicetree@vger.kernel.org
Subject: Re: [PATCH] arm64: dts: renesas: white-hawk: ethernet: Describe adv1
 and avb2
Message-ID: <20240309144332.GG3735877@ragnatech.se>
References: <20240309013006.723934-1-niklas.soderlund+renesas@ragnatech.se>
 <cde6ee0f-31ff-415b-8b77-47936f2a7158@linaro.org>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <cde6ee0f-31ff-415b-8b77-47936f2a7158@linaro.org>

Hi Krzysztof,

Thanks for your feedback.

On 2024-03-09 12:41:11 +0100, Krzysztof Kozlowski wrote:
> On 09/03/2024 02:30, Niklas Söderlund wrote:
> > +
> > +&pfc {
> > +	avb1_pins: avb1 {
> > +		mux {
> > +			groups = "avb1_link", "avb1_mdio", "avb1_rgmii",
> > +				 "avb1_txcrefclk";
> > +			function = "avb1";
> > +		};
> > +
> > +		pins_mdio {
> 
> You should not use underscores in node names.

My bad will fix in v2. Where I also as you suggest in the binding patch 
will use a separate mdio node to describe the bus.

-- 
Kind Regards,
Niklas Söderlund

