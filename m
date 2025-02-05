Return-Path: <linux-renesas-soc+bounces-12880-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id B7C15A2962F
	for <lists+linux-renesas-soc@lfdr.de>; Wed,  5 Feb 2025 17:26:18 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 1E6B83A0F81
	for <lists+linux-renesas-soc@lfdr.de>; Wed,  5 Feb 2025 16:26:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7156E1D7E52;
	Wed,  5 Feb 2025 16:26:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=cogentembedded-com.20230601.gappssmtp.com header.i=@cogentembedded-com.20230601.gappssmtp.com header.b="eo9OKL0E"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-ed1-f47.google.com (mail-ed1-f47.google.com [209.85.208.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AD8341ADC7C
	for <linux-renesas-soc@vger.kernel.org>; Wed,  5 Feb 2025 16:26:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738772774; cv=none; b=JzWqkJZzQUgQxC3gK86Nb8RcJ5Tj0CxX2YnqsyjDYShwblGPl5Py9LtaXOuLezsDZsOB+gm7cZqvN1/EsO09hf5WHNWIx8I3VrqAlrSKW0UgydcyurggrbbwTScM7TJg/wu3a+pbp1eLmbrbgFOYt+1JZSUtcGitkaK3qz3D44g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738772774; c=relaxed/simple;
	bh=Exj6/iLsqKjT++8PyLK8qSV53oYrBJ/Cz6ENaqGdg5k=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=B6fQkqG5f4z89wnocSnVR8nVGEp8YTwptiaPIwprzbwkwfnCBvVmb9+DwBL+J3+w0Il4sYHgMnr86uEAQh3oE5bvhsjk6RyQCUD3kjFBIDTuGVS3vP58GJK4sRAwo4S+wQLxqtfFTKtwc80cvIfSY/0UMVbbVsKhX+clUY+rzdU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=cogentembedded.com; spf=pass smtp.mailfrom=cogentembedded.com; dkim=pass (2048-bit key) header.d=cogentembedded-com.20230601.gappssmtp.com header.i=@cogentembedded-com.20230601.gappssmtp.com header.b=eo9OKL0E; arc=none smtp.client-ip=209.85.208.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=cogentembedded.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=cogentembedded.com
Received: by mail-ed1-f47.google.com with SMTP id 4fb4d7f45d1cf-5dcd3454922so2964137a12.1
        for <linux-renesas-soc@vger.kernel.org>; Wed, 05 Feb 2025 08:26:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cogentembedded-com.20230601.gappssmtp.com; s=20230601; t=1738772771; x=1739377571; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=JEkTrAbO0UDjwP1xozi6/RouQ1l2PHhSoABPJp8WjCc=;
        b=eo9OKL0EOXaQNvPtam9F7fSc0F+4L4q7BRkirWx+72fmgnU1Zat6EaWI1omriSPd7h
         /vxTa/l0y9xBuK0G2MCHYAB776LbW64J7DUCfBRI+hgzQyaOYWY76O4B6h9qxHZlpyD+
         aB+ruzryhbc+LnwNEHriWPXIHvSAZ5q4kpFvMU8GkEL0JHN8kwMQNGq9MPWt+Spemnvx
         4/0WwKgEXma3eHaf2d2TV3MEhCgQ3wumfa5u9a2SVG15BqBxrlTp7jTRwMLPuN+qZX9G
         4m6Skj/2rIWuiqsaL1eIEiV4wzNtnSdHlJ7ockA8uPVEyn3D0S8zf98J7Y9AB064AMCS
         73cA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738772771; x=1739377571;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=JEkTrAbO0UDjwP1xozi6/RouQ1l2PHhSoABPJp8WjCc=;
        b=ruZgx02uo/MeedYpvEUAJ4j5EyyjcAbYhX9WCrZNINZrQiPbfF3D9hemjGYDoOyoWz
         B2eeG9ZG4XTNYk5ULYs0/ORjllx/QMwWxHIEpoQGcxvGNJncrFwd1hH5VCgSk+efkdBJ
         fufmTA3EqGvSGEmOPcX3lnZaJ8AohsPOLrXxeWfNPUph3AZInSQnPfa7zOORrCwOv0WV
         q06Y5lfn7VGM3wNXFjMcrwf/e2y+Qx0oOr29qeEvUUzWBeF0emzMRGn85A1bsTErm3OP
         adel86S1nsBmoUBwaNkmdq8RUVQvDWOoU5b8R2Z6hC6xPI5xTh9PYSskRC5KugqywoXc
         D1nw==
X-Forwarded-Encrypted: i=1; AJvYcCXWm/LdLLSqWiQdoyzFnfLxZeN5O63kpj+/bENLEj6kXJYJXkEZhzSEUQTX1R5vdHfRtdV8TBd35W9TYQzNofFQmQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YxWyAIu6EBM/Rw0X7+uK9EVwOrfvLpn2ENopHMfwgDVboK1iW5a
	XxGX7WhjH7HMli+zsZUeptIKhV9lsThbjlGyrtbyu926JUTZs0/5BrZC7CaJP7c=
X-Gm-Gg: ASbGncsVomz3TZwH3irrJgHmiwmrcaZpJD1MQIn7+6TzIIFyqdUgRvZeOwitTQGk6pZ
	TLlje9XGpkaQZ3CGX+ocEY7wM+QueBjb8xH2ZHxKAop9o6OtAhHi4WmETHu20dyE3KR5w8w9WFe
	zdg1p4bxRIBunJQbJzjE+ve0UTJZd+B/+Z5fsS2+bsYTSOUjT0w7swFAip4pvtbsS4I1ylyUFjf
	O0cx12D/+wDgg9+6sm2ekRtbu6akOKi9zLLdn03GoaiWJN7jFxAQ749DMdsv2jMT9sVWvW4e0OV
	lVhqxjYiB6hWN+c6i0BJuj4yPVPT7v2LLMpaJENtQQ==
X-Google-Smtp-Source: AGHT+IHQU9XwliJKLbkw6xcS14nU3Y0+jNhk8cZapY0yaL3g0neVr0hGvfA/2DmqbTj/6CV3WAg1Ag==
X-Received: by 2002:a05:6402:2110:b0:5dc:80d5:ff28 with SMTP id 4fb4d7f45d1cf-5dcdb71b9eamr3733183a12.14.1738772770788;
        Wed, 05 Feb 2025 08:26:10 -0800 (PST)
Received: from ?IPV6:2a02:810a:b83:a100::2e88? ([2a02:810a:b83:a100::2e88])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5dc72404887sm11649731a12.38.2025.02.05.08.26.10
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 05 Feb 2025 08:26:10 -0800 (PST)
Message-ID: <af3fb019-48fa-42e0-9e02-a4b0d3a724bc@cogentembedded.com>
Date: Wed, 5 Feb 2025 17:26:09 +0100
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH net-next] net: renesas: rswitch: cleanup max_speed setting
To: Andrew Lunn <andrew@lunn.ch>
Cc: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>,
 Andrew Lunn <andrew+netdev@lunn.ch>, "David S. Miller"
 <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>,
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
 Geert Uytterhoeven <geert+renesas@glider.be>, netdev@vger.kernel.org,
 linux-renesas-soc@vger.kernel.org, linux-kernel@vger.kernel.org,
 Michael Dege <michael.dege@renesas.com>,
 Christian Mardmoeller <christian.mardmoeller@renesas.com>,
 Dennis Ostermann <dennis.ostermann@renesas.com>
References: <20250203170941.2491964-1-nikita.yoush@cogentembedded.com>
 <59bc0c2b-0ece-427e-80c5-5b6920132989@lunn.ch>
Content-Language: en-US, ru-RU
From: Nikita Yushchenko <nikita.yoush@cogentembedded.com>
In-Reply-To: <59bc0c2b-0ece-427e-80c5-5b6920132989@lunn.ch>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

> You should only need max-speed when you have a PHY which can do more
> than the MAC.

This is exactly the case.

Unfortunately I don't have the spider schematics nearby, but AFAIU (one of flavours of) the board has 
PHYs capable of 5G but connected over SGMII.  When two such boards are connected to each other, on 
mainline kernel auto-negotiation takes noticeably longer than with the Renesas BSP kernel.

> Also, phylink handles this a lot better than phylib. So you might want
> to change rswitch to phylink, especially if you have link speeds > 1G.

The reverse switch happened in commit c16a5033f77b ("net: renesas: rswitch: Convert to phy_device").
I did not check the tech details of that, but decided not to touch it.

Nikita

