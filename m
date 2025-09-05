Return-Path: <linux-renesas-soc+bounces-21533-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 617E5B46544
	for <lists+linux-renesas-soc@lfdr.de>; Fri,  5 Sep 2025 23:13:21 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 1C8873B28D0
	for <lists+linux-renesas-soc@lfdr.de>; Fri,  5 Sep 2025 21:13:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C06322EDD4A;
	Fri,  5 Sep 2025 21:13:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="EikHX6yi"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-pj1-f53.google.com (mail-pj1-f53.google.com [209.85.216.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E8E522EA493;
	Fri,  5 Sep 2025 21:13:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757106795; cv=none; b=SU+Tgipkg9RTOH1SOCbxmjkcb+mqW12LFOAc4CXScFSU0fYd2rXiR1j1BAzjlFl+v7lNKW7FkNs5rrOouWfgT0qKb4zhET/Y3kvRb9WBCAiD8kxdgSB65Z5CSRHe0HDiOK/LNRoUcuOYavoXFS4hrgOTLx9GOtSMEaoLnqzzZsQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757106795; c=relaxed/simple;
	bh=RlwKqg909CX+NpHSqX1q9pUBGhiNsmpdm3S0scY+pTw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=JVAazogVnwtlcuiBmbjNh5f6K5BS9ptu1xIPcVcNGe92yF+12oPGjj9ttRs5x9S0KS6uc6GXdw4GaV3u2MMdzK3zcWsHrY2rhQIr6SDrwZSRDc0fBXf1mGcLD46Pcs5PKWIJ/E19ecUpKxWQC/6j+4uXz1qQm+7/5xfdf2N3BsI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=EikHX6yi; arc=none smtp.client-ip=209.85.216.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pj1-f53.google.com with SMTP id 98e67ed59e1d1-323266d6f57so2847661a91.0;
        Fri, 05 Sep 2025 14:13:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1757106793; x=1757711593; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Wt89k0XBgFzx/FHmqRKN1OUvqwQkGaGj3DY4DDPojQo=;
        b=EikHX6yiUA4Nn5QmULqo06FOHurqQDYoDRSb9enCRI7hWuQ/nBkCni5VAjPYJubT8b
         yY+4jFcEivx7kUIfQeTn38poSR5x4GjMYncKS516XHrh13xCVL4BwLZNp4d56wVa9TJH
         rL1nqhGbFqblaxowP3tobI1ZbC8QZpOfHkZwWCpHlRABSWmOclfJWEHGLZA2mdMrmB07
         PVhigCrwTtkiHGBcCg2cilOXDlVGTSiE+VVa6fcuB6YKQkmwgPBqC3ceqotYg/k0CXYF
         MJNNzeqLYlOX1m5nhd0Ki4OpwKWREXzxPrkmWDWYtmtOHzpz81bU+93X96AO/VUv6jxn
         eVGA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757106793; x=1757711593;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Wt89k0XBgFzx/FHmqRKN1OUvqwQkGaGj3DY4DDPojQo=;
        b=NI50XtsVL9PnpBqrvAX5S7AD9hpmOXC16cxExDcQ/0rOlcpKDIvw9RrwlADqm3fqSC
         WKa9NxAl+AUMRbmd3dZTH9kvlN3icVDrBk7wqdxMqvkR2ubW52QYHgpf1GwUpwJF1I/l
         bO4m4DxpT/S5v76H8Bb90Bth+lfZniCY/mxp6Mev8NdvlzXDHvoAYvW8DpQCL3tP3qk6
         U43fLmmiyId2VOW49IFgB9s7LqnZBwH0n1uSKdeMD55+87LGCF/UAdKRY7YxJ4w9/HCJ
         9Rp9t9D2mBwvDJAzbpe13gOp2mToxt1EIGVi3anaVTOnWRsUKPTUhV3Q4q2KjByqD5am
         nI4Q==
X-Forwarded-Encrypted: i=1; AJvYcCVE4WyScNPf6ie8ax2PRs57IRCphoKUdJXCefGeEokT8LYEC/6OeatSLrONHjavGmhoJp1XxUm8j25t@vger.kernel.org, AJvYcCXSoDgmyIeSOefbbT1eHLlgcBIxhj+5+OsZ59xyVB9DIcg7J2IyudBsabbEEC3BbUwADu9co+3HAFFi1RONneZEPCk=@vger.kernel.org
X-Gm-Message-State: AOJu0YwdSKCpq5uCfS3oH7MW0AtZBUP/XSF7DIzbKnNr4RCtxrHF9gJV
	WBElHyJzvs3Js1Fm6kvsymKR4eBNC5V5p0kXVkFOud41gwqOjm9OKRk6Q4GHTLBE
X-Gm-Gg: ASbGncuCE2B9RrhkoXxJSg3m+Bp3Crx1UjM361uIPOsigr7UKYgeW08WH+YhmOWuANz
	B+FyrFfLLARsOUvQb6QNFRXaEZdWe2xdpTKcjgdOCH7NrvVyyiidfwiBNm2U+2N77K5zfUz19lW
	/78oRktVcA1tyYFxsKHvQ79NhfPW06o31uYqNIadRT2HOQOnkwP6mfNQU3uTXIsNRa6rr4cfXTE
	IsnRXEO7I6u12iHucXLD0DYmxnVrgBGiPqOL1P2WP66WGU2SKd/ngflmFOmL0G+5vAO/EGq6aQO
	wmQJPUg+k6wLq8ecLyAX8cwXy17Z1v0sfnvqjeWW/QaktPClRbp9Grfa1u8LCPmedfBeFX2Rnd/
	48htKqPC3Mi7UCvIus67gnfwAT1qYdasyaA2eYdrN1PpVaA==
X-Google-Smtp-Source: AGHT+IGHPAoba21oSfrXR79cKomGMllANxTwgE5CDYNR4WAdeDthg89dILYnej279gxhleHS7EcJ4A==
X-Received: by 2002:a17:90b:1343:b0:32b:ab1f:5113 with SMTP id 98e67ed59e1d1-32d43fadc67mr324923a91.28.1757106793113;
        Fri, 05 Sep 2025 14:13:13 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-32ba7900b46sm4656699a91.23.2025.09.05.14.13.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 05 Sep 2025 14:13:12 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Date: Fri, 5 Sep 2025 14:13:11 -0700
From: Guenter Roeck <linux@roeck-us.net>
To: Marek Vasut <marek.vasut+renesas@mailbox.org>
Cc: linux-hwmon@vger.kernel.org, Akinobu Mita <akinobu.mita@gmail.com>,
	Conor Dooley <conor+dt@kernel.org>,
	Jean Delvare <jdelvare@suse.com>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Rob Herring <robh@kernel.org>, devicetree@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org
Subject: Re: [RESEND PATCH 2/2] hwmon: (pwm-fan) Implement after shutdown fan
 settings
Message-ID: <79cbcb9b-3524-4334-82a4-9a162c2307e5@roeck-us.net>
References: <20250904202157.170600-1-marek.vasut+renesas@mailbox.org>
 <20250904202157.170600-2-marek.vasut+renesas@mailbox.org>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250904202157.170600-2-marek.vasut+renesas@mailbox.org>

On Thu, Sep 04, 2025 at 10:21:10PM +0200, Marek Vasut wrote:
> Add fan-shutdown-percent property, used to describe fan RPM in percent set
> during shutdown. This is used to keep the fan running at fixed RPM after
> the kernel shut down, which is useful on hardware that does keep heating
> itself even after the kernel did shut down, for example from some sort of
> management core. The current behavior of pwm-fan is to unconditionally
> stop the fan on shutdown, which is not always the safe and correct thing
> to do, so let the hardware description include the expected behavior.
> 
> Signed-off-by: Marek Vasut <marek.vasut+renesas@mailbox.org>
> Tested-by: Wolfram Sang <wsa+renesas@sang-engineering.com>

Applied.

Guenter

