Return-Path: <linux-renesas-soc+bounces-17284-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 6BA46ABEB5E
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 21 May 2025 07:41:51 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id B07767A5241
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 21 May 2025 05:41:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9632F230BD5;
	Wed, 21 May 2025 05:41:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b="JKkEMKAh"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-ej1-f49.google.com (mail-ej1-f49.google.com [209.85.218.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9974E22FE19
	for <linux-renesas-soc@vger.kernel.org>; Wed, 21 May 2025 05:41:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747806099; cv=none; b=pdMfV50Ca15TDlG37658CtpM2m2TL0pKFus4eNWfjYMH0juRAl9sQ2bZm6gI75Gjhcjx7KPQ5We6wGOXReuVG4tkYRXHoFPbv8JGfe/YLUMG5DgwzoNsk72bTPS8gwsFIYjVZT+m8PqPsB/kZ+fLD8Lt0kEcQ69k+SoKkTnsId4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747806099; c=relaxed/simple;
	bh=gVMYi2KXFIxkgo1AzUtu6TFWb8Gd28Rl9AtJgWeGwxA=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=aiAlbJ8w6tBtkJLdBn1gNgceFUt0pvkfPXgYYQMoPTww0GwGFdmNqGWkvn+WwoQpFWjoom9x+JAOs5C0Xxhy30nj4DvdLUvDQdegU/jMxJPUMbZ6zFlwSRmJkJFTMGCyY+LqKaxYKG4TnSuqXCxeRebGoMU1Vt1e1xKBXqMpOO0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev; spf=pass smtp.mailfrom=tuxon.dev; dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b=JKkEMKAh; arc=none smtp.client-ip=209.85.218.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=tuxon.dev
Received: by mail-ej1-f49.google.com with SMTP id a640c23a62f3a-ad574992fcaso519911566b.1
        for <linux-renesas-soc@vger.kernel.org>; Tue, 20 May 2025 22:41:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tuxon.dev; s=google; t=1747806096; x=1748410896; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Xfw7r6IjPRXEXEyQv9Fnmp9CqnD74IPvRrDSDuZuNUA=;
        b=JKkEMKAh5qq6km3th1iaqQdRpQt04GB+8oDFKIvzCm543Ff/bizd63oLYAr4Qg2404
         bWHPzcqMgzUU9QNnfCvgg6avHuNZ1vMl+YOCHSxivCN700JW3XSGezAVKgd8OLzfD61H
         FgtHo0CC9C93j8KEC0eWCLcjEHVt0DMmzppCBPhjFTc2AMHK9ksozkPHEmGwLkV81Cy/
         xBqh/XUWZO2HUY9K2nSE/+OJP1agT0id6zhHVpBhr/eJmouEvqO5gEfpdz3tcWP4hoXW
         VMOsKa63zORjJzR8NDz696yFYuAYKb6DiGXhJsba7rBXjXsy6PXc4PJZkAotPSgZizFZ
         ve5g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747806096; x=1748410896;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Xfw7r6IjPRXEXEyQv9Fnmp9CqnD74IPvRrDSDuZuNUA=;
        b=bTZen4C07HWT0IpC7S63eRErmr2btBLunYpR8c6DduUR3Ci696C0N8qJUVewCVU1QJ
         bU/s0kOd9mzqAfLAY64P29IlcdsX3gpHKAQn5TFeRM+os94K/ffec+4phytSA8CfkdQp
         4fvxphKdx3RMJviDFgrjO6r+xTKLpmpkqYFrYRbkIeLgjcDE2pKzhWv4wKI2u6GDhePE
         dlkJIn2+k6nT+CQ/Pea9ZgnM1u0m9NDgcaPOiPXSSHeIeqTN7U/Yeh/8IUZbwb1Ed7En
         hMWRYwYnONu3rzV9R/k8GGYQEp/ppwT4qGlfRW7TFVI0Rtt3NFIynutgy4HL4cBZk8eA
         SB2Q==
X-Forwarded-Encrypted: i=1; AJvYcCVzUFECnqv0ByBecNklV2ZoxJLFUBeXnTxjeviZ4m41osKaN/p0AQQe2rdOBXgxl6u6HYLVgez2rlGhYYCqCGl24Q==@vger.kernel.org
X-Gm-Message-State: AOJu0YyM3Mu09c5yNNGzpSZdAvUbKmhNfF/yZKxVzKTP5SXqf4FPhM3D
	GzOrtNJx5vKwas9nPhBPeG1qCmfN9wMjLpd0AVM+HV3o/MY6WRc+Uivhen3HjlnmJi7O0J7QWcG
	+TTVI
X-Gm-Gg: ASbGncsq+cE50kP3EeUoS7/SnQGrKe2lNCrPq5Et9JhDhKhGzBZTtoftJ5/Fc6nNJ1A
	lmCW5IrmpLO9BF7CKfmsOLACa22ZtMFmX13hmauQ0xMrJF22QXcr8s2ILoQ5+8+pR+nLQgd6Jm+
	R0IqlyE4sQl8xL5bEtbyg+paaGpf1baYN2cIf+ytfvV5r3Tpy2IUbD6WzeVq1jwX4HoD9PoglPC
	uOX6UTDVGVMtLP5/Gxor7xORiHjO4KdiC/dLvZJA+UhVWpOP+NghRy9IbYQuCrV0WrWASI1mFMh
	w/rV5hfZPcp35Ay2SG4KYguUV6DT49tIKH/Sp/VeFS2v/bEmkcvCXYd2TMg=
X-Google-Smtp-Source: AGHT+IEHcpkHL7FVjfhOCs3RSSgST9xKyVYzTeL//ZqimrYsmpvzaIYc2ltC9ry3ZT20xorhYqoUSw==
X-Received: by 2002:a17:907:7d86:b0:ad5:61fb:265 with SMTP id a640c23a62f3a-ad561fb301dmr1098617466b.47.1747806095547;
        Tue, 20 May 2025 22:41:35 -0700 (PDT)
Received: from [192.168.50.4] ([82.78.167.58])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ad52d06d299sm843248766b.48.2025.05.20.22.41.34
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 20 May 2025 22:41:35 -0700 (PDT)
Message-ID: <a20fc6ee-c6c3-4013-b175-4918b9a44380@tuxon.dev>
Date: Wed, 21 May 2025 08:41:33 +0300
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] driver core: platform: Use devres group to free driver
 probe resources
To: Ulf Hansson <ulf.hansson@linaro.org>,
 Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc: Jonathan Cameron <jic23@kernel.org>, "Rafael J. Wysocki"
 <rafael@kernel.org>, Daniel Lezcano <daniel.lezcano@linaro.org>,
 dakr@kernel.org, linux-kernel@vger.kernel.org, linux-pm@vger.kernel.org,
 linux-renesas-soc@vger.kernel.org, geert@linux-m68k.org,
 Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-iio@vger.kernel.org,
 bhelgaas@google.com
References: <8d83ea72-bb81-4c63-bf69-28cf5848ae20@tuxon.dev>
 <20250305140309.744866b2@jic23-huawei> <Z8k8lDxA53gUJa0n@google.com>
 <f74085be-7b14-4551-a0a7-779318a5dc70@tuxon.dev>
 <20250330163129.02f24afb@jic23-huawei>
 <5bca6dfd-fe03-4c44-acf4-a51673124338@tuxon.dev>
 <95f5923f-7a8f-4947-b588-419525930bcb@tuxon.dev>
 <CAPDyKFoMqmCFBoO8FwQe2wHh2kqQi4jUZNFyiNckK7QhGVgmvg@mail.gmail.com>
 <c3a2950a-17ff-444a-bee7-af5e7e10e2bf@tuxon.dev>
 <CAPDyKFozR4qDq4mzcZBK-LcoPf=fGyuJTXwdt=Ey+_DcQOAp0g@mail.gmail.com>
 <4o3wo76st7w6qwyye3rrayuo2qx773i6jfzcnbkhdj76ouh7ds@3e2mblehkgwf>
 <CAPDyKFqMB7XutXba73YHx1X4rm6uc3Fz6yMZ8yM=wgduEmgUDg@mail.gmail.com>
From: Claudiu Beznea <claudiu.beznea@tuxon.dev>
Content-Language: en-US
In-Reply-To: <CAPDyKFqMB7XutXba73YHx1X4rm6uc3Fz6yMZ8yM=wgduEmgUDg@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi, Ulf,

On 20.05.2025 15:09, Ulf Hansson wrote:
> For example, even if the order is made correctly, suppose a driver's
> ->remove() callback completes by turning off the resources for its
> device and leaves runtime PM enabled, as it relies on devres to do it
> some point later. Beyond this point, nothing would prevent userspace
> for runtime resuming/suspending the device via sysfs. 

If I'm not wrong, that can't happen? The driver_sysfs_remove() is called
before device_remove() (which calls the driver remove) is called, this
being the call path:

device_driver_detach() ->
  device_release_driver_internal() ->
    __device_release_driver() ->
      driver_sysfs_remove()
      // ...
      device_remove()

And the driver_sysfs_remove() calls in the end __kernfs_remove() which
looks to me like the place that actually drops the entries from sysfs, this
being a call path for it:

driver_sysfs_remove() ->
  sysfs_remove_link() ->
    kernfs_remove_by_name() ->
      kernfs_remove_by_name_ns() ->
        __kernfs_remove() ->

activating the following line in __kernfs_remove():

pr_debug("kernfs %s: removing\n", kernfs_rcu_name(kn));

leads to the following prints when unbinding the watchdog device from its
watchdog driver (attached to platform bus) on my board:
https://p.fr33tux.org/935252

Thank you,
Claudiu

