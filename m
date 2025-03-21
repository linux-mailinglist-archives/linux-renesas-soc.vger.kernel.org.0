Return-Path: <linux-renesas-soc+bounces-14729-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 67226A6C458
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 21 Mar 2025 21:37:35 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 561533BCEB0
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 21 Mar 2025 20:37:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 457C7137C37;
	Fri, 21 Mar 2025 20:37:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="dlrUOX2S"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 976C32309A1
	for <linux-renesas-soc@vger.kernel.org>; Fri, 21 Mar 2025 20:37:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742589444; cv=none; b=p5QPZ/2blTB1wgpxTg5zRhBUVUDIXp+ViFKKI7OR/3X+J8kaq090SmIqDUyUmS3pBiweSHM6qBEacsOUuilqvBdEcH9rbxYQ/YfldeNg3gqmtAJ7C6zb+szBRT4wRuDhd4nQ6xuGcGHcN5uqBwwyKG446MKbUx0YgSswJivOr5I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742589444; c=relaxed/simple;
	bh=JqLC8Hx0DambRc2RFuJvdQgKgMpMaa69lYJq4p8fPoA=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=S/QdgvaRb+j7TNGLfkRKjWMOMXa5fo6Sm+e++hUzWuyv5kI3jXQpz/hLxGeR3Ck7cByLxIOXfmCRfepasKVC1Cw+Kn1++SQTv6XnZv2lX7/sQ2VTY0+ZIsZykUrhD8S7t6pXOqqFqUiuuWAnXaFi66O7bY9thg/92O4LMynr56U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=dlrUOX2S; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1742589441;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=c3nrAPNCqv+uMph7FOR38ygPrAkDx5/grua1l5sijvE=;
	b=dlrUOX2S/WH9X+7VTzyxi0sJGwYgo1zDs6PQteO3nQ/uH5GXSxnrlEQlPfdK/ZjWP2xB6H
	f6v7WQqnzZyroG5U7zteT+fs3XfYEXTVZwxFyaoC3MwdgSf6TBMOch0Qt+F5ufBCRf5fBd
	gD1l4eMTKBlvK2UxNTK6OvFtqLss3Eg=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-136-iKd5ZCMyOAuTWk0KirPdEw-1; Fri, 21 Mar 2025 16:37:20 -0400
X-MC-Unique: iKd5ZCMyOAuTWk0KirPdEw-1
X-Mimecast-MFC-AGG-ID: iKd5ZCMyOAuTWk0KirPdEw_1742589439
Received: by mail-wr1-f72.google.com with SMTP id ffacd0b85a97d-39126c3469fso1053616f8f.3
        for <linux-renesas-soc@vger.kernel.org>; Fri, 21 Mar 2025 13:37:19 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742589439; x=1743194239;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=c3nrAPNCqv+uMph7FOR38ygPrAkDx5/grua1l5sijvE=;
        b=VPTQ6olHKRwke52oGqdaOsODBLqm1y/0+rYFU1F5ZcCLp0QsYFrZz4ViwmQe0beLCU
         pU2FLP/KxemLreWRZlPQCmpjPl3uTIolGfPUDP/ZB6pYYyUCT1EXM8vBw79dQ97HdjfI
         pK1kXCAk6RCyvhUwIqq5IoeunwJw+kVhOHfsOJydLY6xS+K/IauUW76dFJLNNC4lMPih
         gA5Qi/9apDF9ElrSIiKvjG3sfG8KTygFWzP5KBRkgFnfVIEkH3qCuoE7cfQ1wwTVSRUk
         JXBEJnMp9GqPijmjoaTvZ1tIOBjo3N8oEP2hR4IQQ4Zohzp0IUrtDgsAeLDIUgvpAR4j
         Dr5w==
X-Forwarded-Encrypted: i=1; AJvYcCVJRaEAb4wsS8KpnhNVVpgBjn04kkiOB/SNVH+jDkMpzEj/5tvvV8QQPC3+1CavjLQvH4kwzQkoUjRpTh8MfDt/DA==@vger.kernel.org
X-Gm-Message-State: AOJu0YycTRQjzRpJw3Bw4dhX1F3QzCsyV1Z1p2M/2TPuu+d/KHrOQ7KY
	nG0NNPbByK9woTPkGrJz7CgTg9pT3xDTtQ+8mspaytNHtiL+8UsEtbhqUdJgBa0TXihjN7foduO
	O4V3x/q3sJJnkWxTjNwbch0J0/j+/3rMgDELFzqpU9BaJTC87UwWg39P7QbdNlc7RAm4O
X-Gm-Gg: ASbGnctu2u+FQE2yGk32lfoh+7TDjUddGKzFFmNzRn2TBd8EQ1cAl3fIW7dGYCfjvqQ
	NuILHVda5jGvzKUcqDYrGiePLN+vcuhykil025Xxqrfxmp3wU+joN5uYVq0qJbKVOZ8eQtcSYKJ
	68Bv5fklChrJT4EKHH8NJg4xqnDCeWXwTTQwJ6qk2KEY9EqizjzjZrjiyTQWJe0b4vyFEctUt5C
	bUC93iJTRygnUW8zBGERxBfmBgLfV8fRoNdTt8DUIUzLL4K+1Sj905n37ZviEtWUtozNH4ZM6RL
	KDMa6N6KRono/MMOr/bNKg8ENAN1bG1V2vSS+ntpe0jfOA==
X-Received: by 2002:a05:6000:1867:b0:391:2eb9:bdc5 with SMTP id ffacd0b85a97d-3997f90d2bdmr4543348f8f.23.1742589438709;
        Fri, 21 Mar 2025 13:37:18 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGJGJ04UqTM5mJpscFLEySJ8yQ0dp9I9ZT9RgN2HjfsRDgC7ejFbHBNNNgZWfsMQqglWX4Y3Q==
X-Received: by 2002:a05:6000:1867:b0:391:2eb9:bdc5 with SMTP id ffacd0b85a97d-3997f90d2bdmr4543325f8f.23.1742589438306;
        Fri, 21 Mar 2025 13:37:18 -0700 (PDT)
Received: from [192.168.88.253] (146-241-77-210.dyn.eolo.it. [146.241.77.210])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-43d4fd181b6sm36766785e9.9.2025.03.21.13.37.16
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 21 Mar 2025 13:37:17 -0700 (PDT)
Message-ID: <9fe63634-9961-451a-b98d-0a9df1eef8b4@redhat.com>
Date: Fri, 21 Mar 2025 21:37:16 +0100
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [net-next] net: phy: marvell-88q2xxx: Enable temperature sensor
 for mv88q211x
To: =?UTF-8?Q?Niklas_S=C3=B6derlund?=
 <niklas.soderlund+renesas@ragnatech.se>,
 Heiner Kallweit <hkallweit1@gmail.com>
Cc: Andrew Lunn <andrew@lunn.ch>, Russell King <linux@armlinux.org.uk>,
 "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>,
 Jakub Kicinski <kuba@kernel.org>, Dimitri Fedrau <dima.fedrau@gmail.com>,
 netdev@vger.kernel.org, linux-renesas-soc@vger.kernel.org
References: <20250316112033.1097152-1-niklas.soderlund+renesas@ragnatech.se>
 <c17d4b58-9efd-4c09-8e20-e4f9e2e10100@gmail.com>
 <20250316120214.GA360499@ragnatech.se>
Content-Language: en-US
From: Paolo Abeni <pabeni@redhat.com>
In-Reply-To: <20250316120214.GA360499@ragnatech.se>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Hi,

On 3/16/25 1:02 PM, Niklas Söderlund wrote:
> On 2025-03-16 12:47:55 +0100, Heiner Kallweit wrote:
>> On 16.03.2025 12:20, Niklas Söderlund wrote:
>>> The temperature sensor enabled for mv88q222x devices also functions for
>>> mv88q211x based devices. Unify the two devices probe functions to enable
>>> the sensors for all devices supported by this driver.
>>>
>>> The same oddity as for mv88q222x devices exists, the PHY must be up for
>>> a correct temperature reading to be reported.
>>>
>> In this case, wouldn't it make sense to extend mv88q2xxx_hwmon_is_visible()
>> and hide the temp_input attribute if PHY is down? 
>> Whatever down here means in detail: Link down? In power-down mode?
> 
> These are good suggestions, this issue is being worked on [1]. I just 
> wanted to highlight that this entablement behaves the same as the 
> current models that support the temperature sensor and log how this was 
> tested on mv88q211x.
> 
> 1.  https://lore.kernel.org/all/20250220-marvell-88q2xxx-hwmon-enable-at-probe-v2-0-78b2838a62da@gmail.com/

My take is that you should at least clarify in the commit message the
state required for a correct reading - e.g. link up vs power-up.

Thanks,

Paolo


