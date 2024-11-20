Return-Path: <linux-renesas-soc+bounces-10640-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id C862A9D3EB5
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 20 Nov 2024 16:13:54 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 8311B1F2190F
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 20 Nov 2024 15:13:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6B9201BE23C;
	Wed, 20 Nov 2024 15:02:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="gu6DDrAs"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-pl1-f177.google.com (mail-pl1-f177.google.com [209.85.214.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CE4551AAE19;
	Wed, 20 Nov 2024 15:02:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732114967; cv=none; b=ucSA1mTfqqK1pgoiKmOn1db6LE4nvszjaKk/rRcc3xRwGLXh8D+Kb3rL8Zj5fXh/SipG42ZK2rw/jci4561HNTs7eA2Vfbouj/HTSXJwZ7+o21QpGuXreSQRKBH2+f1/mm0FAoRprfvAplpamV4iPKqC7ij4+DU3ErKOR5lvBws=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732114967; c=relaxed/simple;
	bh=gewwdbDdfBuYDPfjSejtHBmpDvC/bHH3uNTgzoPQulQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=B1/j3cJ9Nx7YdXnS3CldikfTKSjjHka+qa57GDhj0BdGHZ8aEfGkafx1/25Z7YEtRjvk1/pZlhzCPyZMGHA16jZi4T27tS8zXr/n6JFg1lApKO7SCIoJ3XN2XZHCoCDZNKH/zV9GlXqVikhuL3jKVN0fz5DYNf78eNqDHqETiKs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=gu6DDrAs; arc=none smtp.client-ip=209.85.214.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pl1-f177.google.com with SMTP id d9443c01a7336-20cdbe608b3so68153485ad.1;
        Wed, 20 Nov 2024 07:02:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1732114965; x=1732719765; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:from:to:cc:subject:date:message-id
         :reply-to;
        bh=f8t1tKsC5QCE0EfWLBsQoRMZ7UvNk3oOZOvBBNTReCA=;
        b=gu6DDrAshYAMtpsAoa2ByFIkJkzqfGWf0fXFXXQOWNcdWQhhSuJv3xQ4ErIxpdwKRG
         IW3g4JponHwaa+pvj7/wKP/X0yoFom5aizThVaBq+1DJsUsphQmd/LLt9ZeHlm1JIBXR
         82T0UKM5stFGjP+XvIO6R5V6DQZ80DMep+cCRQKwVJshsnmQxkKMhTZ/A36JRq0mr6br
         9RBt0Pz3PORyuj9i3zsUDaswEOyPbOoRraEUR90+KsVDUkGqycA6Za7cLHZ9suWC8mPM
         33uGkcmsnyW7GxLaIY7cnZ1lq53ul7TguICISpO1saX/NW/4RyQVXVH+G/A+3TNKcbNu
         hGrQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1732114965; x=1732719765;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=f8t1tKsC5QCE0EfWLBsQoRMZ7UvNk3oOZOvBBNTReCA=;
        b=bU1z3P1yEMfnPR4O+T7WcaPNF+JzVoTdLzyoGO6ZNCTlAMfL+va45djPT42PTjQt5A
         fkpDCXbnNpGjivHdgm2GxBsKXKoE5b3REKOqUKqzLTigr/0Sx1dGkJ2W5rorT996km2I
         IbEAdPBB7STgyzArkmy2wCp6ldoKqXH+b+oOLaM3M+2QzDAl+rhO+tLcAbAgbtPdjIW4
         rIk1OUwF8IJ8LMyCV2O2Ve5UYzTM3hd2+ve3WdpdETBylWnr3uRtXzS52qt+lr9dOV+2
         L0C1dgMSXwYzT+/XET40ZMpVrAx34s2rBdsxyvCmB7vPh+lhaEM3/uRbebnHxNe09xoF
         rfug==
X-Forwarded-Encrypted: i=1; AJvYcCUKxnrYpg8rTcXC5BeAQdk/4u768eED08nN5NYKEJlFh/+dFMgzHTx4PCO0UJE242FQ+odd0eBqbempjVQ=@vger.kernel.org, AJvYcCXlGgVwG0oiI9LJektbdZp/MWp61cSlpab+7fp/qKGYr/EMb12osQHpsdFHYBuL2aZNhcub/JphU1E=@vger.kernel.org
X-Gm-Message-State: AOJu0YxH7T++xQ9NsgwmNTqqj6N14By3gEKJWMNTKQygUYFiOYBvxLbh
	hkr5EcFySGAvYXtrBJbxOyMT2ILY9TbnKl2u3ouMiJL0VUSAerlE
X-Google-Smtp-Source: AGHT+IGBcaGnrhtol4rWglZty8fa0xROVuWqIkth4C1sGIA1lnw5bkE2kpwjFVYO0qkyNxMyuEN2tA==
X-Received: by 2002:a17:902:f64e:b0:20c:a19b:8ddd with SMTP id d9443c01a7336-2126cb3c32emr28707515ad.51.1732114965069;
        Wed, 20 Nov 2024 07:02:45 -0800 (PST)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-21270d53ab1sm12387545ad.258.2024.11.20.07.02.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 20 Nov 2024 07:02:44 -0800 (PST)
Sender: Guenter Roeck <groeck7@gmail.com>
Date: Wed, 20 Nov 2024 07:02:43 -0800
From: Guenter Roeck <linux@roeck-us.net>
To: Wolfram Sang <wsa+renesas@sang-engineering.com>
Cc: linux-renesas-soc@vger.kernel.org,
	Carsten =?iso-8859-1?Q?Spie=DF?= <mail@carsten-spiess.de>,
	Jean Delvare <jdelvare@suse.com>, Jonathan Corbet <corbet@lwn.net>,
	linux-hwmon@vger.kernel.org, linux-doc@vger.kernel.org
Subject: Re: [PATCH 2/3] hwmon: (isl28022) document shunt voltage channel
Message-ID: <37e7ca90-50e7-44e5-97f3-bbd34a3b23dc@roeck-us.net>
References: <20241120083349.22226-5-wsa+renesas@sang-engineering.com>
 <20241120083349.22226-7-wsa+renesas@sang-engineering.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241120083349.22226-7-wsa+renesas@sang-engineering.com>

On Wed, Nov 20, 2024 at 09:33:51AM +0100, Wolfram Sang wrote:
> During the upstreaming process, the driver has been extended to report
> the shunt voltage as well. Document that.
> 
> Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>

Applied.

Thanks,
Guenter

