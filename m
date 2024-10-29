Return-Path: <linux-renesas-soc+bounces-10193-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id D680F9B49CE
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 29 Oct 2024 13:37:30 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 8B2CE1F22F04
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 29 Oct 2024 12:37:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DC1E1C2ED;
	Tue, 29 Oct 2024 12:37:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b="UvLaKqzW"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-wr1-f51.google.com (mail-wr1-f51.google.com [209.85.221.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 814F2204F6C
	for <linux-renesas-soc@vger.kernel.org>; Tue, 29 Oct 2024 12:37:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730205438; cv=none; b=AgZ5KXB5RyEZYunfqrdqD5Qu0yff9ahbSNeLfwP292/LuOwu4t2I1inNjp0DbvF7OtZ2fxHRjnQSRIF8v3eAti89hGmENuhUhGPhisyQUYHyrY114rFXgFSxZrVPrNAFsKj0jYzf+uDPrr7946mrkdNC8GdSEPEBqzkjd+fa3t0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730205438; c=relaxed/simple;
	bh=FZupF2iD7kfxaR3KKKJqyQpVnPKYpKS8+01BJjHzlyA=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=BFlFO678ceNjcbqzWHyt4n/kBED1Hp2pUWra6JelVJxPXnllukwDeMFEGahlQCqD11o+MhX5MTF+q3n9/k0HrnEKETvvPvDwAZ3B5WPfZ3KZ+2+TcCXVkdcizSehxdYJPzp8Mqr/fcWP8Ejof6TZT6Aha1LMokFyw0sivTgjFYQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev; spf=pass smtp.mailfrom=tuxon.dev; dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b=UvLaKqzW; arc=none smtp.client-ip=209.85.221.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=tuxon.dev
Received: by mail-wr1-f51.google.com with SMTP id ffacd0b85a97d-37d4fd00574so3480758f8f.0
        for <linux-renesas-soc@vger.kernel.org>; Tue, 29 Oct 2024 05:37:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tuxon.dev; s=google; t=1730205435; x=1730810235; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=SKrUgSOUxnIh3q3e4Z2f0c72Gp6Ecggg0tzc6ohRH2M=;
        b=UvLaKqzWFxb5Ty323zmEiZnegJ8HOZdsBdgZKs5V+MaWY5SOUgj03MgGwaKRI1AOo2
         jsJsjcHUQWU6aoHYi+iUpjOeMhzj+C3z5HBqFwEgRIIyGaFv8pWYbx8soYglUWY/9QuQ
         eYV0cic4NxLcMZOe9bHnYDO2+vPPtvckPdryZyo01CY1pfTnZwQsWJ/ViwL3kZxNO83D
         mxRRBzoBopnV599t6vVMpc37dJMX+sgM0AoaWzSwddZ7JhD+kUz5K3vJ98UvM4PpExqX
         MQDrhZ3bOvAUtuRp4XnLeDHLm3zpVW9FEZZY/B1eVsJGhguO7mUBdM+9GjjFEo4Dvzi7
         Z/mw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730205435; x=1730810235;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=SKrUgSOUxnIh3q3e4Z2f0c72Gp6Ecggg0tzc6ohRH2M=;
        b=kCG73erzR2k5amVCEqPMsSP7jCOHSU426LVGelUfRMZ7zxkAfKdyq/fHffRFf+lL9J
         g8kMFlqY/Di7nJnAs8X1DZWgDoj8IXD1wdu9YLjyBJvrwBaSIQYC6/3FWSE4Tr66SBh9
         TbEC9Z9AY7VcX3jXGbF8OgVNROw6dP0Up1+1bRUpaCqwf9etOA3ITKM0vIj5ELMHFbSP
         VhbZMzy1/OnUSNXezPlSymJ7ZIpTnt/Ou20RAETE6k4JrAovu5rSdIbRac7U4nhTPO5K
         V4jOyi0oa6GmA4hjWobCt+vb3CrRvDGQXnllp/PxDGwp4IMkmUbiEdmqpEni8Q7yaD/B
         ppHA==
X-Gm-Message-State: AOJu0YwdFnmD2K/xJZpL5EeqXQMrj0hB3CdK33AmwOAYstOEtYCcxQ+v
	PWuZ00bSwPKreka9gUKZQj4MsbX8D/0wVSigK5bvGQryTW4G66WyE4RrK5Nx6hSHXPHyZrhl6uu
	g
X-Google-Smtp-Source: AGHT+IFEbYVOveGst9KWA5oPzBLhzFiKooQTvMFPL4MtunAPaDwMDkZFYzsRBozZtnKTUn8MLA6f7Q==
X-Received: by 2002:adf:f844:0:b0:37d:3baa:9f34 with SMTP id ffacd0b85a97d-38173e61331mr1789406f8f.1.1730205434495;
        Tue, 29 Oct 2024 05:37:14 -0700 (PDT)
Received: from [192.168.50.4] ([82.78.167.190])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-38058b70c73sm12585846f8f.72.2024.10.29.05.37.13
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 29 Oct 2024 05:37:14 -0700 (PDT)
Message-ID: <1b5f9e16-4c82-4093-8950-12188b662c39@tuxon.dev>
Date: Tue, 29 Oct 2024 14:37:08 +0200
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 0/6] pinctrl: rzg2l: Fix releasing of IRQ and status
 reported in pinmux-pins
To: Prabhakar <prabhakar.csengg@gmail.com>,
 Geert Uytterhoeven <geert+renesas@glider.be>,
 Magnus Damm <magnus.damm@gmail.com>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Linus Walleij <linus.walleij@linaro.org>
Cc: linux-renesas-soc@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org,
 Biju Das <biju.das.jz@bp.renesas.com>,
 Fabrizio Castro <fabrizio.castro.jz@renesas.com>,
 Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
References: <20241025114914.714597-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
From: Claudiu Beznea <claudiu.beznea@tuxon.dev>
Content-Language: en-US
In-Reply-To: <20241025114914.714597-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi, Prabhakar,

On 25.10.2024 14:49, Prabhakar wrote:
> From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> 
> Hi All,
> 
> This patch series aims to fix the reporting of pin status in the
> `pinmux-pins` file and properly free up the IRQ line when using a GPIO
> pin as an interrupt via the `interrupts`/`interrupts-extended` property.

With this series, the Ethernet PHYs IRQs switch to poll mode after a
suspend to RAM cycle. I've added the logs here:
https://p.fr33tux.org/3e8193

Thank you,
Claudiu Beznea

