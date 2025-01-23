Return-Path: <linux-renesas-soc+bounces-12395-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 37025A1A59E
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 23 Jan 2025 15:18:15 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 9C150188BC77
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 23 Jan 2025 14:18:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3B584211700;
	Thu, 23 Jan 2025 14:18:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b="ffZXEtj8"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-wr1-f49.google.com (mail-wr1-f49.google.com [209.85.221.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2CF5A20F972
	for <linux-renesas-soc@vger.kernel.org>; Thu, 23 Jan 2025 14:18:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737641885; cv=none; b=NqBQm+IYNT8/JEP/kiio5F1DVTp9tlamztYnu+8j+NLY+VoLCA0wP7tFn22r597UKYMWT4l6ov1rpdJJjPHJf8RDK6Apkt2FE/4nBsVsVoqNCRpr7dPyhXhS8r9xOp0WaOojq0FU+LCO85iA4BhZPkgxhHf5cq1wfj+i4lAiDiU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737641885; c=relaxed/simple;
	bh=Gme88OIa9d0Zm1YT4RizarMW6jToxRUammK6/HTQlh4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=WwA3qIg3Z1RaIRL6yqAOFm3oQrZ1Fu6/3GxloNLUPOOJomPLW//My8EheIzY9WblB+4+ao1wNqT4Hqfd6ffcAtejAwL1GF032kXMtAB375xzxYheNoGQO+KW87ks9MwNDr6W774jbuuAMx4+8H5UegKIRQpIv3IK4XM7VvJDfuw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev; spf=pass smtp.mailfrom=tuxon.dev; dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b=ffZXEtj8; arc=none smtp.client-ip=209.85.221.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=tuxon.dev
Received: by mail-wr1-f49.google.com with SMTP id ffacd0b85a97d-385e3621518so491590f8f.1
        for <linux-renesas-soc@vger.kernel.org>; Thu, 23 Jan 2025 06:18:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tuxon.dev; s=google; t=1737641880; x=1738246680; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=f8mkGjg257bx62zgZ81/jO5L5DyJuTeIxv/nJ1/7iVk=;
        b=ffZXEtj8bvvuBzHuB+jfxJdrX2FI6bUys+AvyWV8sRsOnJNE1/amzEvrXBpusrGobm
         Kx8xDYKgjIy0dlTXbt7QHXYt3UHkhfxmEBzC0Bl2Ekd92Xom2wT+fpkPi9OPqveuAOMg
         l/N8KWgz7PbWNEgU2IZiLfo69+6VaR3B/Y6HwdCQ9YdcwPRtbF1KY66TIMr2n5hzOBcG
         EXCO2cZcJ9GglIVdM/hQuGgmS/W3f/Ms066aY99A1xfduAaacTF2WAL3v2a9UdlbeCFx
         7pqs0pQaCOu85IvmBuT/x1RehBPlyeHqYpt0IpKDruWiijPNRZ+L2rnZdbQaLByO9HMH
         it9w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1737641880; x=1738246680;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=f8mkGjg257bx62zgZ81/jO5L5DyJuTeIxv/nJ1/7iVk=;
        b=tpzi5IOrmDTapPXcyCILnhQJtxo+bxwehFk+CJUZvGnrRy5vFZYlN+X7uNTtgw5aDG
         1/z0rGa+nZTWC43090ljUhMN33HMw7ZWpL8XCqCqZugIYYyDD6iBaq6/bG6uhohV5nxu
         AfjrFYaASJtDuCVILxwnG3xSkKE0PhL5L27wzZz//HaYWm4lvs1aaGEDCDjRCWSuivVA
         x3FjU2hSEtG49AoivtwqANWUmXNHFJ2ygLYiI6uhqgJGDnfzg5egjWtN+t547YFScgCO
         gq/ap6nVGalQGDiQTVKICKKx6AW1FHzdOEo9IfDxbPahIenESuqT1U6K0PRKPEbygfc5
         g/YA==
X-Forwarded-Encrypted: i=1; AJvYcCXoqmTBOdJiLNAQSXR/o0aMQdTGP2AYYOcgfJmbKKY7Muq+1j75jJws6YwtOkq6Cdx7H/vOOQZNeM/tLyGdxOBmPQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YxSlqcSDz8m6rNR8rL0Vbch23LDlpyWUqR0F7mHDkJ7KCLljjzg
	TACO8A6Dzg9tdN8DuLo3w553BqKeiYiB/j5pnvqkwpnzykAT92v5wCvdvcyamMg=
X-Gm-Gg: ASbGncvxRKgtdoVEhyGBOVeP4FXeSBgx9V89XZBoHwOV2bC0wkPoWKJWIrctluCs/jl
	EQkhTyCmL/vNoqzu47Uz7ZgvX2b6mbwyg9spD+H4WX9DE383NPDBRqYrbTbr7xjOKyzz8DG9NwD
	V5m3PM9+nPLr+Gj3fTV/bmHOR27b4ugw2hg8u+XYVlvKN2Ihl5lXt/xZWWTturmjfsxZWn7+K3p
	WO9CDf6enSbRX8Jlgyu5zuIrqAbwGHTLTHgXddrW4S2kbm7OcYU72SSe8haGIiDTdKhz0rQE1Fz
	3Nzu6DyK1IHg
X-Google-Smtp-Source: AGHT+IFtr57UosG2pGmiCVthkL+VSFTHskgbZcS4A6RQRj6ApFRIOhESzT0gUQDfT5RyorhUri1ywQ==
X-Received: by 2002:a05:6000:1bca:b0:386:4a0d:bb21 with SMTP id ffacd0b85a97d-38bf5663c0emr17993931f8f.22.1737641880264;
        Thu, 23 Jan 2025 06:18:00 -0800 (PST)
Received: from [192.168.50.4] ([82.78.167.35])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-38bf327e06asm19687029f8f.95.2025.01.23.06.17.58
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 23 Jan 2025 06:17:59 -0800 (PST)
Message-ID: <cdf4e312-92bc-44f3-a049-bd3ddf3222e1@tuxon.dev>
Date: Thu, 23 Jan 2025 16:17:58 +0200
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH net 1/2] net: ravb: Fix missing rtnl lock in suspend path
To: Kory Maincent <kory.maincent@bootlin.com>
Cc: Paul Barker <paul.barker.ct@bp.renesas.com>,
 =?UTF-8?Q?Niklas_S=C3=B6derlund?= <niklas.soderlund@ragnatech.se>,
 Andrew Lunn <andrew+netdev@lunn.ch>, "David S. Miller"
 <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>,
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
 Mikhail Ulyanov <mikhail.ulyanov@cogentembedded.com>,
 Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 =?UTF-8?Q?Niklas_S=C3=B6derlund?= <niklas.soderlund+renesas@ragnatech.se>,
 Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>, netdev@vger.kernel.org,
 linux-renesas-soc@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20250122-fix_missing_rtnl_lock_phy_disconnect-v1-0-8cb9f6f88fd1@bootlin.com>
 <20250122-fix_missing_rtnl_lock_phy_disconnect-v1-1-8cb9f6f88fd1@bootlin.com>
 <806d2df6-68d3-4319-8ce6-7049563508cf@tuxon.dev>
 <20250123150814.6c46ec9a@kmaincent-XPS-13-7390>
From: Claudiu Beznea <claudiu.beznea@tuxon.dev>
Content-Language: en-US
In-Reply-To: <20250123150814.6c46ec9a@kmaincent-XPS-13-7390>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit



On 23.01.2025 16:08, Kory Maincent wrote:
> On Thu, 23 Jan 2025 13:33:30 +0200
> Claudiu Beznea <claudiu.beznea@tuxon.dev> wrote:
> 
>> Hi, Kory,
>>
>> On 22.01.2025 18:19, Kory Maincent wrote:
>>> Fix the suspend path by ensuring the rtnl lock is held where required.
>>> Calls to ravb_open, ravb_close and wol operations must be performed under
>>> the rtnl lock to prevent conflicts with ongoing ndo operations.
> 
>>
>> I've test it. Looks good.
>>
>> Thank you for your patch. However, I think this could be simplified. The
>> locking scheme looks complicated to me. E.g., this one works too:
>>
>> diff --git a/drivers/net/ethernet/renesas/ravb_main.c
>> b/drivers/net/ethernet/renesas/ravb_main.c
>> index bc395294a32d..cfe4f0f364f3 100644
>> --- a/drivers/net/ethernet/renesas/ravb_main.c
>> +++ b/drivers/net/ethernet/renesas/ravb_main.c
>> @@ -3217,10 +3217,16 @@ static int ravb_suspend(struct device *dev)
>>
>>         netif_device_detach(ndev);
>>
>> -       if (priv->wol_enabled)
>> -               return ravb_wol_setup(ndev);
>> +       if (priv->wol_enabled) {
>> +               rtnl_lock();
>> +               ret = ravb_wol_setup(ndev);
>> +               rtnl_unlock();
>> +               return ret;
>> +       }
> 
> What happen if wol_enabled flag changes it state between the rtnl_lock and the
> if condition? We will be in the wrong path.

wol_enabled flag can't change in this suspend phase. The user space tasks
are fronzen when ravb_suspend() is called.

Thank you,
Claudiu

> 
> Regards,


