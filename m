Return-Path: <linux-renesas-soc+bounces-8955-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 2F63B97913B
	for <lists+linux-renesas-soc@lfdr.de>; Sat, 14 Sep 2024 16:00:10 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 5410D1C215C2
	for <lists+linux-renesas-soc@lfdr.de>; Sat, 14 Sep 2024 14:00:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2F5311CFEBF;
	Sat, 14 Sep 2024 14:00:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="XIdob3wP"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3BC281CFED2;
	Sat, 14 Sep 2024 14:00:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726322408; cv=none; b=RRWFhkqCpuKjzVynxt0fHApbfl9lY3fbwJZg2i4ctKyVNxmPSty7QlCer1hwMnzFD8HTSDpPG52X8Nd6Me+yP/XcO3Q3OA2llH0KhSPcA2PVo6KQMIrL6YMK6M568MLJIJsYGOfF2+466VxN3zDQLF55kvi+I0JZLRjNhOtkGDI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726322408; c=relaxed/simple;
	bh=/ro1QE77RMk/+Zgku9+hNHO2tJqdSDPk328IwWHlzS0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=UpmgXmPnJLGFeY11f9XD5kAZVkpDiXAtKZ6m+6YRZ4S+TUiCRo8ZYr+QIk6MQubU37QyfcL2yLnIRYk8L2b2h6VVkOKWGf5JbudJiG7/kORPfuALIcSPguRA1Nf48rfwawOGRRpCvA4YsAg49+7toj+ehpiD7ud7cECzkkwr0mY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=XIdob3wP; arc=none smtp.client-ip=209.85.128.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-42cb6f3a5bcso24569775e9.2;
        Sat, 14 Sep 2024 07:00:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1726322404; x=1726927204; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=6OKqg9zHPi2TKXxTEhsceclSFnxEg5WRa5BcXqy6l1E=;
        b=XIdob3wPpSvB2q/xUSU2loHN64aLfppBhaIj6Zr6tkNiyhhzPX1k8jpYMEzwGwC5up
         R3MX7b1EupnI8h8ixXGkU7r85dbk2Uoxz4T1IZWW6YZs3lbKvqSnNkIOhtcLZcF+71eX
         CyZGi9io+MpIs+1MroN4KiN+fNf41qQEmI7+lntSSus1uGu7fWKTEeKzsnIbWNHT7Y3y
         dfKg4dOD0RnT6OKTXEcrcsqUIf7EwKb8QJ/IZW4gpkCHFBSDH5AP7IgBdTU9XWwD/kJ4
         DcZAaSW7icycc75nMm26Tlq3lZWvj5+MAzwkwmCoWv2vA6WMmuOdYId4IzQU9vjvZwNo
         tcxw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1726322404; x=1726927204;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=6OKqg9zHPi2TKXxTEhsceclSFnxEg5WRa5BcXqy6l1E=;
        b=LtKMabDEBOMU3qHGgZBVeJRUtLqKKi1R5qeQ5DfCpZqA8BNimKvUgm2zD0+plgWN+s
         pqXQspePLwxAkeDGoyXiHkHNGvAxUryXx/MAo9glY07YL36sx6lrE+Biwl/0gi+ESvUt
         OrjFdCpzeEC2ed6LVyM1sgeMi1lf5nGNii9+K2AwcDmPyZeq9EoCmuHr2AQItMwHJO+D
         fOOq1gMxpgXeiM0baOkVeQ+ZSTQrC8V0hvziSAylQf/9SB5ER35XiJKq8qh1JOo5+vWW
         B5UArpkpNfsiJxwO4/rBvwWYjidFBhcba7xJxRxGDz+9Eynu9sdifpYY3+6keDNI3+mH
         CZ+A==
X-Forwarded-Encrypted: i=1; AJvYcCX8m18q2utkaBc9r41TdeJBxYpDumXeei1hPOMQv8f73WcEFoMCwQZPD4Qlvcn6JE5YAo+ZczhP@vger.kernel.org, AJvYcCXL6XRPgSxY1ojQVU7aBS3f8ni3JOFG6Xh1Mdeq0zkArB4XYSNyO5fY8XoOIsRDGxrwzhfDgJHt6wX7KfLgbZSAvw==@vger.kernel.org
X-Gm-Message-State: AOJu0YxUPxxHFfJ3HeopkpYUYiKiqWFeyfHBCXxL9ucjqL5NRexULwcZ
	FvI+MSrQhkZxkf1pBbGI6bdY0CSUICV0tAvylRfTCH1aUrokdxYK
X-Google-Smtp-Source: AGHT+IE7czWCipoBRR45XXkuEuD2rRRYPp7arfTAmdstDHZZIDHJHxkbHE/oVSk7cWThG+47kNLrUg==
X-Received: by 2002:a05:600c:4f01:b0:42c:aeaa:6b0d with SMTP id 5b1f17b1804b1-42d907205a5mr59895425e9.9.1726322404198;
        Sat, 14 Sep 2024 07:00:04 -0700 (PDT)
Received: from eichest-laptop ([2a02:168:af72:0:5e4c:4047:729b:2f6c])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-42cc1375c6esm130605285e9.1.2024.09.14.07.00.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 14 Sep 2024 07:00:03 -0700 (PDT)
Date: Sat, 14 Sep 2024 16:00:01 +0200
From: Stefan Eichenberger <eichest@gmail.com>
To: Andrew Lunn <andrew@lunn.ch>
Cc: Niklas =?iso-8859-1?Q?S=F6derlund?= <niklas.soderlund+renesas@ragnatech.se>,
	Heiner Kallweit <hkallweit1@gmail.com>,
	Russell King <linux@armlinux.org.uk>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	Dimitri Fedrau <dima.fedrau@gmail.com>,
	Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>,
	netdev@vger.kernel.org, linux-renesas-soc@vger.kernel.org
Subject: Re: [net-next 3/3] net: phy: marvell-88q2xxx: Enable auto
 negotiation for mv88q2110
Message-ID: <ZuWW4UOtOGI_KmSg@eichest-laptop>
References: <20240906133951.3433788-1-niklas.soderlund+renesas@ragnatech.se>
 <20240906133951.3433788-4-niklas.soderlund+renesas@ragnatech.se>
 <70b86181-7bcf-42d7-b5a8-d26ac0c4c573@lunn.ch>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <70b86181-7bcf-42d7-b5a8-d26ac0c4c573@lunn.ch>

Hi Niklas and Andrew,

On Tue, Sep 10, 2024 at 10:23:18PM +0200, Andrew Lunn wrote:
> On Fri, Sep 06, 2024 at 03:39:51PM +0200, Niklas Söderlund wrote:
> > The initial marvell-88q2xxx driver only supported the Marvell 88Q2110
> > PHY without auto negotiation support. The reason documented states that
> > the provided initialization sequence did not to work. Now a method to
> > enable auto negotiation have been found by comparing the initialization
> > of other supported devices and an out-of-tree PHY driver.
> > 
> > Perform the minimal needed initialization of the PHY to get auto
> > negotiation working and remove the limitation that disables the auto
> > negotiation feature for the mv88q2110 device.
> > 
> > With this change a 1000Mbps full duplex link is able to be negotiated
> > between two mv88q2110 and the link works perfectly. The other side also
> > reflects the manually configure settings of the master device.
> > 
> >     # ethtool eth0
> >     Settings for eth0:
> >             Supported ports: [  ]
> >             Supported link modes:   100baseT1/Full
> >                                     1000baseT1/Full
> >             Supported pause frame use: Symmetric Receive-only
> >             Supports auto-negotiation: Yes
> >             Supported FEC modes: Not reported
> >             Advertised link modes:  100baseT1/Full
> >                                     1000baseT1/Full
> >             Advertised pause frame use: No
> >             Advertised auto-negotiation: Yes
> >             Advertised FEC modes: Not reported
> >             Link partner advertised link modes:  100baseT1/Full
> >                                                  1000baseT1/Full
> >             Link partner advertised pause frame use: No
> >             Link partner advertised auto-negotiation: Yes
> >             Link partner advertised FEC modes: Not reported
> >             Speed: 1000Mb/s
> >             Duplex: Full
> >             Auto-negotiation: on
> >             master-slave cfg: preferred master
> >             master-slave status: slave
> >             Port: Twisted Pair
> >             PHYAD: 0
> >             Transceiver: external
> >             MDI-X: Unknown
> >             Link detected: yes
> >             SQI: 15/15
> > 
> > Before this change I was not able to manually configure 1000Mbps link,
> > only a 100Mpps link so this change providers an improvement in
> > performance for this device.
> > 
> >     [  5] local 10.1.0.2 port 5201 connected to 10.1.0.1 port 38346
> >     [ ID] Interval           Transfer     Bitrate         Retr  Cwnd
> >     [  5]   0.00-1.00   sec  96.8 MBytes   812 Mbits/sec    0    469 KBytes
> >     [  5]   1.00-2.00   sec  94.3 MBytes   791 Mbits/sec    0    469 KBytes
> >     [  5]   2.00-3.00   sec  96.1 MBytes   806 Mbits/sec    0    469 KBytes
> >     [  5]   3.00-4.00   sec  98.3 MBytes   825 Mbits/sec    0    469 KBytes
> >     [  5]   4.00-5.00   sec  98.4 MBytes   825 Mbits/sec    0    469 KBytes
> >     [  5]   5.00-6.00   sec  98.4 MBytes   826 Mbits/sec    0    469 KBytes
> >     [  5]   6.00-7.00   sec  98.9 MBytes   830 Mbits/sec    0    469 KBytes
> >     [  5]   7.00-8.00   sec  91.7 MBytes   769 Mbits/sec    0    469 KBytes
> >     [  5]   8.00-9.00   sec  99.4 MBytes   834 Mbits/sec    0    747 KBytes
> >     [  5]   9.00-10.00  sec   101 MBytes   851 Mbits/sec    0    747 KBytes
> > 
> > Signed-off-by: Niklas Söderlund <niklas.soderlund+renesas@ragnatech.se>
> 
> I will mark this one as 'change-requested', when in fact it is more a
> test-requested. Once we get a Tested-by: we can merge this next cycle.
> 

I was able to do a first basic test on my setup. I'm using the MV88Q2110
and connecting it to a Göpel media converter that I use as a reference.
However, with your patch applied, I can't get a link. When I set a fixed
link speed of 1GBit/s and the media converter is configured as the
master, I can normally do: 
ethtool -s end1 speed 1000 master-slave forced-slave
After that, the link came up. However, with the changes made, I can't do
this anymore. Can you reproduce this in your setup? What is your setup
like? Are you connecting two MV88Q2110 physically to each other? I'm out
of office again next week, afterwards I should be able to do some more
testing again. I think being able to set fixed link speeds is a must for
this PHY.

Regards,
Stefan

