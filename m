Return-Path: <linux-renesas-soc+bounces-3639-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 0C6AD8771AE
	for <lists+linux-renesas-soc@lfdr.de>; Sat,  9 Mar 2024 15:44:45 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 3DCE21C20965
	for <lists+linux-renesas-soc@lfdr.de>; Sat,  9 Mar 2024 14:44:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 776093399C;
	Sat,  9 Mar 2024 14:44:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ragnatech.se header.i=@ragnatech.se header.b="HHx+ac5S"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-lf1-f44.google.com (mail-lf1-f44.google.com [209.85.167.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BCB7221A1C
	for <linux-renesas-soc@vger.kernel.org>; Sat,  9 Mar 2024 14:44:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1709995482; cv=none; b=EXj9P74MqmJMpc7jpJuKXu3l1zLBRvHdwvWp6YAaeLoZRd6Pu4wYg/CpKeW4Jn7x7N/rxzLiNjcRGC3PtIfqfq+kmngqA+N/40gdT8vPKiQ3Pvr1qL5d0fYIQJhabQdG3iKKK3ImDhRfRbqQgBhoFjilJx/W9jknYUiNWPsQur0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1709995482; c=relaxed/simple;
	bh=6GqHVDBrj8YKn1/IpxrLaQrkLLWux5IthJMd9uWOL/Q=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=fjhxazP106ffU7UfmSsA9sjE1fiKK04qThOPqZ1HQuedZYI04dMfQdzf5/xrhvDWgyUm1bqhnSLdJj0tj0AghbporW8KFKU/319mFlQvZaaQuUrW/WxhPYoW4mt9YPE/s6fxbFSrz6mxHf9zvhh5jIa9gk9lmXWb8iFg34pVSWI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ragnatech.se; spf=pass smtp.mailfrom=ragnatech.se; dkim=pass (2048-bit key) header.d=ragnatech.se header.i=@ragnatech.se header.b=HHx+ac5S; arc=none smtp.client-ip=209.85.167.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ragnatech.se
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ragnatech.se
Received: by mail-lf1-f44.google.com with SMTP id 2adb3069b0e04-51364c3d5abso3404938e87.2
        for <linux-renesas-soc@vger.kernel.org>; Sat, 09 Mar 2024 06:44:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ragnatech.se; s=google; t=1709995479; x=1710600279; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=WItnIVhzJupS/NyUTtGT6jr41h4emuWMVenWq8Wdc7M=;
        b=HHx+ac5S4Chw9s/zOKP7jf/4GhChLeDWdcRwiVimuvsyxog+nbUrWcsFHYY6OG58ag
         ZxmDtZ9ceFbUeKENEuLzkFAU1JyZeA0ozwGT2m5wZg0MEXNlr13XV5nY1lcJ/WuZ5tal
         HWb4k/AM/Lq8Hqan2pZhnDj+Fchc1wTwYLFhV4825oZ8FZxwbv/35DA+b2q+EVDrwIJj
         raTU0759bXkuwhDGwvAryeV2FsPFV79hXoTKXkpTGCJpXQsTKoFfAseEbyZ2Gp+rUQWO
         NC57cNrh10N/teqY+Zr2/AsxyshXxguzM1420oVepmIqiinzrXa1pbvRvQX+LEoTMCpL
         Vovg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1709995479; x=1710600279;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=WItnIVhzJupS/NyUTtGT6jr41h4emuWMVenWq8Wdc7M=;
        b=PZIYkTs3OB0TzIqgiFOOW/Bcw4jYiyFLZOjHkeAzSMvcUOX4dayN5NonuhdZXuIKBU
         W6Arhd1P3YEhk5UOds6RQLT2PMq4bM6hmTwwiPgYRTaOMnEj3dsfH+DsP+rBV4p08mQM
         Fjf39H30/QRcEbbBiQW7wL08PQmRXfvpKjmfgTBnJn564AG1sjmk7UjvIw1C07tGNJcn
         kckvlm5TRp1AMqgZ7Z0bCwzY/jInxjj+WHMLphwuzxL8b50s77vj7U9ohOmVOND9Nk9j
         9RmYkC1/qXes2jKP7uQjoEQj9HEOFXNXEu8LIbf1nskyTpOeRj6+pGbaSKQ1/6nyLMvM
         TY2A==
X-Forwarded-Encrypted: i=1; AJvYcCX3YuqaE6wIKDomFOX2b3u+5m9gssknJ3NidqPYJF259IUGN176ht3USjh43tWwUAqq71pSHOufN3N3DZni0lyzqEZ9eIP6LpKCSrFdR4AHq7Q=
X-Gm-Message-State: AOJu0YxUtRzKUYAdLeABAbCzuIj3iFYJ1gGz2o/znPIoBOwClq5LcFhQ
	CoqYa7qeAWmRhMmZVMOYiCkct228QRnhJDEo+MEjPdyuP/iQn9nk3R+cGWYQw+E=
X-Google-Smtp-Source: AGHT+IF06nfcwxxWY1OyKuANmdWzl+XoscvNck5T6b0zg2OAfS1X6aEa0uGLv/QQ9EkhSwYwZKQBiQ==
X-Received: by 2002:a05:6512:3986:b0:513:9c4a:a73 with SMTP id j6-20020a056512398600b005139c4a0a73mr1493613lfu.0.1709995478969;
        Sat, 09 Mar 2024 06:44:38 -0800 (PST)
Received: from localhost (h-46-59-36-113.A463.priv.bahnhof.se. [46.59.36.113])
        by smtp.gmail.com with ESMTPSA id m17-20020a056512015100b0051319dfe6d7sm334717lfo.75.2024.03.09.06.44.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 09 Mar 2024 06:44:38 -0800 (PST)
Date: Sat, 9 Mar 2024 15:44:37 +0100
From: Niklas =?utf-8?Q?S=C3=B6derlund?= <niklas.soderlund+renesas@ragnatech.se>
To: Biju Das <biju.das.jz@bp.renesas.com>
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>,
	"linux-renesas-soc@vger.kernel.org" <linux-renesas-soc@vger.kernel.org>,
	"devicetree@vger.kernel.org" <devicetree@vger.kernel.org>
Subject: Re: [PATCH] arm64: dts: renesas: white-hawk: ethernet: Describe adv1
 and avb2
Message-ID: <20240309144437.GH3735877@ragnatech.se>
References: <20240309013006.723934-1-niklas.soderlund+renesas@ragnatech.se>
 <cde6ee0f-31ff-415b-8b77-47936f2a7158@linaro.org>
 <OSAPR01MB1587F0B5CABF3DDD83E00BD486262@OSAPR01MB1587.jpnprd01.prod.outlook.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <OSAPR01MB1587F0B5CABF3DDD83E00BD486262@OSAPR01MB1587.jpnprd01.prod.outlook.com>

Hi Biju,

Thanks for your reply.

On 2024-03-09 11:54:39 +0000, Biju Das wrote:
> 
> 
> > -----Original Message-----
> > From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> > Sent: Saturday, March 9, 2024 11:41 AM
> > Subject: Re: [PATCH] arm64: dts: renesas: white-hawk: ethernet: Describe adv1 and avb2
> 
> Typo adv1->avb1??

Indeed, will fix.

> 
> Cheers,
> Biju
> 
> > 
> > On 09/03/2024 02:30, Niklas Söderlund wrote:
> > > +
> > > +&pfc {
> > > +	avb1_pins: avb1 {
> > > +		mux {
> > > +			groups = "avb1_link", "avb1_mdio", "avb1_rgmii",
> > > +				 "avb1_txcrefclk";
> > > +			function = "avb1";
> > > +		};
> > > +
> > > +		pins_mdio {
> > 
> > You should not use underscores in node names.
> > 
> > Best regards,
> > Krzysztof
> > 
> 

-- 
Kind Regards,
Niklas Söderlund

