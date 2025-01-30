Return-Path: <linux-renesas-soc+bounces-12759-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id E5E63A230D6
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 30 Jan 2025 16:08:48 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id E5B063A5902
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 30 Jan 2025 15:08:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5D4441E9B27;
	Thu, 30 Jan 2025 15:08:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="dtqFVdOP"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-pl1-f175.google.com (mail-pl1-f175.google.com [209.85.214.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C44CC1E9B23;
	Thu, 30 Jan 2025 15:08:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738249725; cv=none; b=EH9K7s1l9QYT6XYmHDUBPsQTmGE8xD4Bx4G5xxarQ6giTDFZVircfUAs0wenKR1UWS0LwLsQKec4A4lpMJlNWGr5lRWUr3q4pfY1zsxnAEL8sGT/K8mlxYvMjE4lLOXn6yIfTExqGrXuPsh2Nelc6DomdLRuUYsVyro6Yhno8nM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738249725; c=relaxed/simple;
	bh=ehlDKGSvHEXQcQcITg8bjoe3OHetQL/W8ZDVKEIvrNE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=oXkmToaD4/RsPIMzFHr1coyC616N3jl4jUdwBc811BxVXx6b7DARGKZ6jT+9dpYK9p5WMPhrwq19yAR6vDqNhXd+4GNUqXn4YVJzjzV+3n+Zfc+V5vjPoYUGA+dVw32rnhyMDIc3yV7pYJCYa06HCWx/f/Kx+ikNrRVULvq/MCU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=dtqFVdOP; arc=none smtp.client-ip=209.85.214.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pl1-f175.google.com with SMTP id d9443c01a7336-21628b3fe7dso17286865ad.3;
        Thu, 30 Jan 2025 07:08:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1738249723; x=1738854523; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:from:to:cc:subject:date:message-id
         :reply-to;
        bh=29a4hWq1s4gIhvsi9TMH7OKq7ctJu4jjQdTlMwZxJUA=;
        b=dtqFVdOP5BrEhwVDRgFTDFP/cElB84WvWiMaMNYZYP89TZhojbSACvlETz9TBmWM0a
         mKsdKJlLtV69NdnjR05dNBduPoE6IJ0kooAQ3sWQnXTlmvZiHA9q/nSOD6Xg0s390FsV
         sad3slzZsRcJZNf0M+Ri9p/7d+TrRVVZ/P9xVDNOImB+YGETKRi/27lQlRcXU9E0FycW
         JZNHNDBhAh4BoN+j4E/nGHfl14QV53v63VWMkjdV8mxcYcSZI8lVDGoxnidsMLHwgctB
         SKz+h+8PxDHpDe+nKuGFQsXQYFbR3eVOSh7MhhX+0qd/l4z6M6zjN3LPd61bOTau6+jM
         Ciug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738249723; x=1738854523;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=29a4hWq1s4gIhvsi9TMH7OKq7ctJu4jjQdTlMwZxJUA=;
        b=IfrmbiY9mczW94OgKnnCgyQxfsN0h9CCVv+euT8buSooh1XtHUvgeZLX5qxbl4dPd8
         JwzThlgJfgi19ajs75TrBFGsJXeU0Tzf+XUVAgVvf//3GN0kr9/CUUmxOP16Ikb9bG16
         0DxxBaMy3SEaq+jxgv4cHHq1ayUdaJVpBczzD5g8Peq7I9gwFzA+fpl7cwDxxLv2lXio
         toBtlZiYQfbWXNlObKS+aehDtixtjP7GvqaSl26EyIYEGvQpZ72UPEoVOQPmGcwtTlPd
         GmNlf6GEwrHr9w+FpIcAiAnrSXhu0EJgAUyscRuRIGMfsPFecbju1XZuS2K4euOYRCgC
         MqyA==
X-Forwarded-Encrypted: i=1; AJvYcCWZ8yQe91iMjuvGkeLXLHfeTBOsbIYD3R4ZbRFJTFaBhSavsT04hXh8lsMfy2EJbt14ht068odeAJ288A==@vger.kernel.org
X-Gm-Message-State: AOJu0YwVyDdlKzS2S1PFySqm5XUW12fOw9VBq9Huu/7XROhOP3PVXABS
	C69A9JEnRn6vGnM/7KVRZATbjkPG6dFN3t7sc55PHWIm7mSOUTCk
X-Gm-Gg: ASbGncv1dalLDBVE1l2bEjrlZ+Dd6+cjmJutcKpbbEqsNEHfcrk0/Wu83KDzUe0RzEV
	cW1TwcCTMK7BpLSVOVOdqCFo6JXw5zUjL3UzS8WVAUrEdic0/JRamqrPY9pxBDepun99Juu50tF
	g8zlyoYrC81fQhgxv0yygINynoWbmh9hytywT08Ht3HZcuEfjd+B99gWxH1hVyus3GH73S624tQ
	b/K2ePd9Mc/NgzyT0opEjBBPA/wHlKJhpa0RN4In0AWo244tBLO7J0CpbriVrlHp6S7R7FHTgg0
	5uuCj6/CGmPnjOIufpFer/61gH7p
X-Google-Smtp-Source: AGHT+IEd8jfh8JBWKHifrlmk0BwQFjyO0P0QTMec1+vTmSVwFFszoZ1w1WwCX4xV1vFyGUc63/Dr7A==
X-Received: by 2002:a17:902:db02:b0:216:69ca:7714 with SMTP id d9443c01a7336-21dd7c46297mr109680735ad.11.1738249721968;
        Thu, 30 Jan 2025 07:08:41 -0800 (PST)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-21de31f64casm15024465ad.53.2025.01.30.07.08.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 30 Jan 2025 07:08:41 -0800 (PST)
Sender: Guenter Roeck <groeck7@gmail.com>
Date: Thu, 30 Jan 2025 07:08:40 -0800
From: Guenter Roeck <linux@roeck-us.net>
To: Wolfram Sang <wsa+renesas@sang-engineering.com>
Cc: linux-renesas-soc@vger.kernel.org,
	Robert Marko <robert.marko@sartura.hr>,
	Luka Perkov <luka.perkov@sartura.hr>,
	Jean Delvare <jdelvare@suse.com>, linux-hwmon@vger.kernel.org
Subject: Re: [PATCH RFT 6/6] hwmon: (tps23861) Use per-client debugfs entry
Message-ID: <8a7a776a-23cf-4c3c-a3b2-a8e877582b99@roeck-us.net>
References: <20250125123941.36729-8-wsa+renesas@sang-engineering.com>
 <20250125123941.36729-14-wsa+renesas@sang-engineering.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250125123941.36729-14-wsa+renesas@sang-engineering.com>

On Sat, Jan 25, 2025 at 01:39:46PM +0100, Wolfram Sang wrote:
> The I2C core now offers a debugfs-directory per client. Use it and
> remove the custom handling.
> 
> Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
> ---

Applied to hwmon-next.

Note that the branch will only be pushed to linux-next after the commit
window closed.

Thanks,
Guenter

