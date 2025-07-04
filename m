Return-Path: <linux-renesas-soc+bounces-19197-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 3171FAF8E01
	for <lists+linux-renesas-soc@lfdr.de>; Fri,  4 Jul 2025 11:16:21 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 48F835A126F
	for <lists+linux-renesas-soc@lfdr.de>; Fri,  4 Jul 2025 09:12:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8F7A9328B0E;
	Fri,  4 Jul 2025 09:05:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=cogentembedded-com.20230601.gappssmtp.com header.i=@cogentembedded-com.20230601.gappssmtp.com header.b="H3U2ymWm"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-ej1-f45.google.com (mail-ej1-f45.google.com [209.85.218.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D51E82F5477
	for <linux-renesas-soc@vger.kernel.org>; Fri,  4 Jul 2025 09:05:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751619918; cv=none; b=ARWjVzigljITBUmNLd0DS2h6IcMWeKYzYJvU27P7it2A5fEUsbdte7Y98p4mr0FzwWB61Wa/vavsdSKR2KGUVPakUget97n7tlspS4kCghRcioGgleDrP4ArDSg3R1ckQ/Hvowkio/1Pktsd+EN3D2DO6zCCXATuNJ/Oz8FmufM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751619918; c=relaxed/simple;
	bh=lRw7yJVneIfUXB5qnJ6oSwcGV4RKbOy3n7DSX0pBpsM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=FRp73j2Bya9NKwhng9a9tzDa/W6eupSLHVVmDqbtlx9oA67/cbFAemZpzE6h++qQkKuwenyJiu4JmUFQv0h0HlO5mdIfpoFDXVPhnFCGlAElmKJsXKXOrG1zm1GBByf+3Ipg6gdjAe7X8wd+TfNLxaYv8pJkgCA8QrqnB9qq2F4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=cogentembedded.com; spf=pass smtp.mailfrom=cogentembedded.com; dkim=pass (2048-bit key) header.d=cogentembedded-com.20230601.gappssmtp.com header.i=@cogentembedded-com.20230601.gappssmtp.com header.b=H3U2ymWm; arc=none smtp.client-ip=209.85.218.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=cogentembedded.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=cogentembedded.com
Received: by mail-ej1-f45.google.com with SMTP id a640c23a62f3a-ae361e8ec32so157834766b.3
        for <linux-renesas-soc@vger.kernel.org>; Fri, 04 Jul 2025 02:05:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cogentembedded-com.20230601.gappssmtp.com; s=20230601; t=1751619915; x=1752224715; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=5lvqW25n8VSdsxeIbb6N6y1V/bckNRxGH4LVpn13n8M=;
        b=H3U2ymWmKJvzY6LVPa7qpM4oO2dpgixhT8WECCxKAxFXOafT6qAvJGd4nfO8CjUfxK
         aqXGukWxDg/2q/LUqBk7Btvs2Ml1HFqRo3+Kfo+p98HdrMzzvxAe1cy8/JZiSz0fnxuW
         X5eTKMlP4Pfk6I8mkB47Ya9AUeTLbl6fmcaiKF/6Pk2UzdwU8TcyPWlmEpzkSaWa5Vie
         BJHeDbf/9wk94WUn05wJ9zJOtbCOJ+NFQIlMQXATdR57st5dhs5l05A3zXn3jpj4DC5L
         yqMxKLiwbH/2IWxa5oQSjBWSQsr2tx76v9qzFAgWb0oQRRHCus7RJvyNFye2zFZYDeFQ
         iUfA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751619915; x=1752224715;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=5lvqW25n8VSdsxeIbb6N6y1V/bckNRxGH4LVpn13n8M=;
        b=kkUOYffhttieJmnX+3kHZfzAj9mPMHHdEvDY2G+je+fxS3aAtxKQzi1j2/XTamZGSW
         SVQImfPvy1imAZQxuw4tB5j5IRhCSmzs7opKWNN4wbREyaX3lUemK6OExvnZFwWKsEWH
         MJ1TAU91RDaZY+kKjc7CKVULmZkadn8QTS+WccNWG7PDjmlepbCUP7U6i00JW4wpzjok
         5fu9s2lt0fXNVKoFwf0m5Nzehm/8QLNeA7OpXxjN4XsVpKQ5wQx7jLXXJQ8pjLzsodx7
         9bLMHxq8agX6PKAp2EGnMXVmaNaw8EjaUWkNyXifDPRT2Vc+IxbC+lB7FIihNs3ggvtn
         niTQ==
X-Forwarded-Encrypted: i=1; AJvYcCW95aptCw8LP0fWbYSgKTl/9vkVGsQvUqHxtnE1R9GzVUrlwiGuYEtBrTCxAq0qUrAX3X8hT0Sm7uRKOV3bcJQZJA==@vger.kernel.org
X-Gm-Message-State: AOJu0YzrVfgOMQawY9I/+xPGMPjXlv2Rv0eYCbu0YLtuvW6VhVnKylwp
	jlu+LZFKxWh0ZuUKxULxXCG8+2Vc0iV/gDL+40H3DnFFIQ6Rj0u6EnN9Bv/WFlWa7p4=
X-Gm-Gg: ASbGncvor8afknF6NQHiQuAhQU/LfuUvDiQywt+4khozqTxK+mWeHqMA9Dz/ti3Zn+L
	v2dzYrrOkHInOJp7ekoqhp6qjNPgBQuDNnF4UMjWYgkElhyWda7OyyGk/y7XHzzRLp1v6wp778t
	6sNYVZB3bBM7fxGnGblI6V+5fYF6INbm+DpaVfsOHhsGZkw1ZN8rdq2Ve8++DxMyR2IxugQrGae
	5w7yUfXm4bwxDANuKFOSV+tvF/TMrPKxZj+f4hCPELz3vdMXVyjVNBPtozxiV4Si+PRC9TMvMk1
	q5JrYQL6T789oZaBD/9LjB7P7mWtb/K19wjAuCXLk0y+KsZzcJMHId5bx0+HVTM3Gbc3p/srqqi
	sAHYFechFnEky
X-Google-Smtp-Source: AGHT+IEZO1zxjcWXhdMMtE+CxCjQoXtX/7S5BwYI92EZAOfHlQnV8tIpwdxwwtnNSgAwSoG0neHl+w==
X-Received: by 2002:a17:906:c102:b0:ad4:8ec1:8fcf with SMTP id a640c23a62f3a-ae3fbd6c7d4mr177062566b.46.1751619915226;
        Fri, 04 Jul 2025 02:05:15 -0700 (PDT)
Received: from ?IPV6:2a02:810a:b98:a000::f225? ([2a02:810a:b98:a000::f225])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ae3f66d91cdsm137351766b.22.2025.07.04.02.05.14
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 04 Jul 2025 02:05:14 -0700 (PDT)
Message-ID: <79a57427-fd4a-4b9a-a081-cf09b649a20e@cogentembedded.com>
Date: Fri, 4 Jul 2025 11:05:14 +0200
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 0/3] net: renesas: rswitch: R-Car S4 add HW offloading for
 layer 2 switching
To: Andrew Lunn <andrew@lunn.ch>, Michael Dege <michael.dege@renesas.com>
Cc: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>,
 =?UTF-8?Q?Niklas_S=C3=B6derlund?= <niklas.soderlund@ragnatech.se>,
 Paul Barker <paul@pbarker.dev>, Andrew Lunn <andrew+netdev@lunn.ch>,
 "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>,
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
 netdev@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20250704-add_l2_switching-v1-0-ff882aacb258@renesas.com>
 <4310ae08-983a-49bb-b9fe-4292ca1c6ace@lunn.ch>
Content-Language: en-US, ru-RU
From: Nikita Yushchenko <nikita.yoush@cogentembedded.com>
In-Reply-To: <4310ae08-983a-49bb-b9fe-4292ca1c6ace@lunn.ch>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

> Looking at the code, it is not clear to me what would happen with:
> 
> ip link add name br0 type bridge
> ip link set dev tsn0 master br0
> ip link set dev br0 up
> ip link set dev tsn0 up
> ip link add name br1 type bridge
> ip link set dev tsn1 master br1
> ip link set dev br1 up
> ip link set dev tsn1 up

Per design, it shall enable hardware forwarding when two ports are in the same brdev.

