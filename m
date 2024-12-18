Return-Path: <linux-renesas-soc+bounces-11550-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 61A149F697B
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 18 Dec 2024 16:09:14 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id ABED9189060E
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 18 Dec 2024 15:06:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 893D21E9B39;
	Wed, 18 Dec 2024 15:06:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ekFQbjfQ"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-pl1-f172.google.com (mail-pl1-f172.google.com [209.85.214.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 769561B0408;
	Wed, 18 Dec 2024 15:06:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734534408; cv=none; b=POadeHkm8wulLelj9SwkyaR/dJilp+XCKIqOUjWS7pUN/NTl+ch2LqVBrqocBqtl6fv/u5/dUZ9SBhEtldQUsu984X7+VvYfq9enkCyL65fuEDZi2qZ1zofhy4ivAwAXBupmVFd9BJMxSJMjbUccoko54EDfhMPxGCL12ozMkfA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734534408; c=relaxed/simple;
	bh=mAW7/pMD2PNgri84r4XNT1zI/xGw0w4ZJDPf+K41FTg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=jfyM9WL478kObhtJZmHworhbcspqH7yetzpA12qnNHhBsWZk9yN+c1T7lMh+heuWaRMUtCJuSFpPImvXnCgdP1bRjkcc8AZWFeN6c3r6yVfosjjueZctD7FfD/8kELVcdvwlZ/Gg/dS1RyqjIJ8juM9Rmm2HW29LublBP0zcYXg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ekFQbjfQ; arc=none smtp.client-ip=209.85.214.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pl1-f172.google.com with SMTP id d9443c01a7336-2161eb94cceso45472055ad.2;
        Wed, 18 Dec 2024 07:06:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1734534405; x=1735139205; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:from:to:cc:subject:date:message-id
         :reply-to;
        bh=MryO0T8HkYZmwGGtf15TLjavFtiSZ85mrCZOLWnxJaI=;
        b=ekFQbjfQTjAxtHOK2bjplB0ScEX6Lg43r/mIss8m4PsMgs4e33sdf+k9SG1yU5TG9B
         OIKRWof+k9br6C1DlJCmQzvnzA8bcW+Ck3aXiahTDOUYnSgPpAxvpXebIWCbyi0qaLn5
         QIChw0DQGRFgXo3EDZW3/1e4RPOxAHFYHJRNsUaCfakJwFRiEbM15AtKSvCitBwtZD/V
         ayxMWgVOtIMn1jHGTMG4HVOOi4FGYSBqQsNZyKGX8A0A2du1DviU1mttlHOaf/xuS7pW
         wc7WF6wPR13MefPsDjsGv3OKxCO3t6n5GucNvzfwGtxBljerntfosooA3xAqgUNCowSA
         zX/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734534405; x=1735139205;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=MryO0T8HkYZmwGGtf15TLjavFtiSZ85mrCZOLWnxJaI=;
        b=Hr53qiLdRP6yXABvbRKQUUfbilyyyzQkYXKX3WTUgOZWEERNLRIcIPtd1/ydzBLFGs
         lODJ+cZIFspReIl6+gOZyC2qkuT8xEBg/t9ebSf692nM3JRGyAyNJo03Ied3+3CXVqPy
         /1BrJueeScQZ5KX49tQlN6f5GVllkRKG2biWodrlchEhejISY/W3tvBLFBFhnJAmoWs2
         67wKoyZl5fB0OPvW8G5UrqqiXsqEG2Nd7h8ADp4pfNpjwfHDkOcCTrmLhic6UXckfYQn
         zyFMWroWMQ3+E0x5DnaTnQjTwoeVoaAMaC0aOT0W58lgXmzzt2apEYlfMaXEfhOXVSYb
         4glA==
X-Forwarded-Encrypted: i=1; AJvYcCWIzUAlXJRsYEPcW0Rt0mo0FQ754HPIn6AgbGLCbI1t8iuEpDmiuxDxFrSoGXNEhox2el6zAoCbL30=@vger.kernel.org, AJvYcCXG+ePFkTUzzcPe/m/Wj+KR5fBbcJSxsRIcLRq+R+1DQSA2isuDjqvBYbeJhzqnfXaj+9ABP6koXO6k4Wc=@vger.kernel.org
X-Gm-Message-State: AOJu0Yytaf7/XnZpgFa3EnD1kOdSv4R6soWCpqNPjRMEBqGzjeGAw2Vo
	/4FjCS5g4OdlvEOxMAGRgwJ5Yggix4XUz4vbqTYmpihuuU/ZFcDlShBYBg==
X-Gm-Gg: ASbGnctJF+82+6mfavfBaKNlgV7iAxLPlC/6m+X/hXZBpChYhsKiQZLxJt4fKOofrvE
	wMPLPIwOnSQ0/d0gSRO0t5fUh+nTkj+PqUj9GxHIkiJKwtqwU1Dm3gKbKyYH6Nr+Mr6Z74QuyMq
	dHFGLY/sV1YHMsxRC7FY1FQb3NVtcwsyUyzuXkrKXQ35H/KLFkTk1X0jBlNWdY9MYbTNOAgB5gn
	2P6uImeVRgqNjpQTaK7clm4Nq7u1/9+Gp7Ng/XjA9rc88BTaH2yQNzwlkTvmnEZiUW6QA==
X-Google-Smtp-Source: AGHT+IHa3PNmivYFqPiq44yDIge2XuWNel1wWMYOGKtbpP1e/IUXHkijPQ1zRjlCVrdsvEjHCBAu7Q==
X-Received: by 2002:a17:903:120e:b0:216:4a06:e87a with SMTP id d9443c01a7336-218d724b38dmr53351225ad.40.1734534405092;
        Wed, 18 Dec 2024 07:06:45 -0800 (PST)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-218a1dbadc1sm77395095ad.32.2024.12.18.07.06.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Dec 2024 07:06:44 -0800 (PST)
Sender: Guenter Roeck <groeck7@gmail.com>
Date: Wed, 18 Dec 2024 07:06:43 -0800
From: Guenter Roeck <linux@roeck-us.net>
To: Wolfram Sang <wsa+renesas@sang-engineering.com>
Cc: linux-renesas-soc@vger.kernel.org, Jean Delvare <jdelvare@suse.com>,
	Jonathan Corbet <corbet@lwn.net>, linux-hwmon@vger.kernel.org,
	linux-doc@vger.kernel.org
Subject: Re: [PATCH v2 2/3] hwmon: (lm75) Add NXP P3T1755 support
Message-ID: <d3d5eb04-4a65-4703-9de6-d556318c157f@roeck-us.net>
References: <20241218074131.4351-5-wsa+renesas@sang-engineering.com>
 <20241218074131.4351-7-wsa+renesas@sang-engineering.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241218074131.4351-7-wsa+renesas@sang-engineering.com>

On Wed, Dec 18, 2024 at 08:41:33AM +0100, Wolfram Sang wrote:
> Add this LM75 compatible sensor which needs a separate entry because of
> its default sampling time and SMBusAlert handling.
> 
> Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>

Applied.

Thanks,
Guenter

