Return-Path: <linux-renesas-soc+bounces-11551-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 692529F6980
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 18 Dec 2024 16:09:24 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 7221F18966B8
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 18 Dec 2024 15:07:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 07F291B0408;
	Wed, 18 Dec 2024 15:07:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="byknd3ay"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-pl1-f177.google.com (mail-pl1-f177.google.com [209.85.214.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 71188182C5;
	Wed, 18 Dec 2024 15:07:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734534456; cv=none; b=NYIsFZ4iIa+LriVkW5o7tCFABlVyossE+BzBTrBenMjh4RlDC+2cxmvK7xmQ10ys9xFVIliPblHWL0xHyKFLb+dvL7c6i7Sun+60zZKPNxjOSNApiu1ZnMpRrzhmKQTBni8vi8kHvwcEpsqpbveLlG9XhITmPvU6ltotmLkXdig=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734534456; c=relaxed/simple;
	bh=vUUv4pHPzbU2Z7UBYHQT8WBZujH4OK47PXybzG23u1M=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ChpSBNJgR+LxROy5M2oYI29ymO1WAu2VFJJs+2mJtb2u2FylurG+LVYjCXQBobhpU5kck7S2HH28JxVoJf2SR+LJGsOnPSKbTGfLDw2JyVhJAWCt/zZuPBtEacaFzJ3VcreKiysov6UmS3W6WucLoe+3ZGFzijTD89TuuNGpKbM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=byknd3ay; arc=none smtp.client-ip=209.85.214.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pl1-f177.google.com with SMTP id d9443c01a7336-21654fdd5daso56102675ad.1;
        Wed, 18 Dec 2024 07:07:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1734534454; x=1735139254; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:from:to:cc:subject:date:message-id
         :reply-to;
        bh=THk00mPCL3bmmt46Arb7cUVZHSSDIGbhq/stMjGiFyI=;
        b=byknd3aywJUbnIO/YG2svw7Sjjp/UJELvxZS+mOjggfwz6eHoynBWhELagXu504ZZB
         nPUadeZmB/6lSAu/xuwPSQ81MRohppEjKVtnJhrIfAKsRT2zjJgDtYD78FbMYUH51Iyr
         HnLfUht4+YdWeCUM0SDnMhVtzo1AmWzn1+yt1K41Q7DVJQwSrNfza6kMywVc+LsKv8Pg
         JA199MXjuPDtKYYtu6zaQDkxzESwlzv7j44FwIEX8gqaNOtQrdMjMjD2jurq4u0AuMQU
         QCvtJg3vbDzgppRs/Uo0UAbXca9JVsh+2J84Ae7qRCZCfaHVIr/TCXign2mnbh6yA4km
         cE3g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734534454; x=1735139254;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=THk00mPCL3bmmt46Arb7cUVZHSSDIGbhq/stMjGiFyI=;
        b=COahBXfhXs/pxQ/BA8m6CLWetWVCczwoK0CaUOxppRwQtWnnK6nEQqnxsP23erzRLX
         P4c6v+6RAN1po2GyQWz+CJ01PWXe2ZOg7IMcp7k/f+4Xh2vbRJEQUOITLMdyUDrQq3lg
         bnE/fCBeosABVZi6Nq3EdpJdT2M/UgPI2KljJMtHYTE7sJkSfOKkJryoIDgK9hr5E8hx
         SatiFQ2iNIoRZKXbu/JMh4bQ46/uMlw2hEB5J7jOCI9zDnJTvryPevfSzSEg8E+zzgcD
         erpRpZt1KHWFbu0Wi5gHHjsW735/VNn/WbPGJMPhkM32a4S7tZUmSHJbCNGCGtzNI8Rl
         js9g==
X-Forwarded-Encrypted: i=1; AJvYcCUYcWWfLU9ES1uHbGLJJ6uQLlz7rQ85Zi+gWG9ZTZ38y4jZ8eFAGD/EhAByAycuL23Vju6+A6fFo7G8728=@vger.kernel.org, AJvYcCV9rfxJtYn4QuauDjIgCzuI0znsNxov5cR+brCr1GDg3Nzocd0uRvvjV0ulm2PwTCk178aV2vjTuq8=@vger.kernel.org
X-Gm-Message-State: AOJu0YxU5tU/QIHFN0QTewXlMoYYC4mz2t8SvXIo/pzTCWqOtNz2Kroq
	ccrVbrtymL7BkVrLwn9Uh8t1G99pROcY8uzzCT0c33YSJTyZNp9qiAIgAg==
X-Gm-Gg: ASbGncutGqsqCzO7ZXVkZImLezXLl66NZp5otF0Fy6jF/U7+yepvbUlR7Z6iPO9ysXS
	PCvwpX+MbzFVMTO+ww3LLWWp5CKG6KpuSb5TNx9a4exovA48lY/eiz3RWyzF8pUh6HxOgjUirqT
	M86UIUHXj9UyjlbwVfZ4N6gqFu/E5jYtOXaAYcp6AYqwPjZINOmkA1GUHoiyui6ABKw2Gzyf29k
	mQXZJnHrNBIJnViprpmRmdyhaRj5Qpp3EA1t5adJzjs3sCzLbqMjXfs4DstB6zvtUgSTQ==
X-Google-Smtp-Source: AGHT+IH/5vo/fUVb46dkRl0wElPs7u4QyYc5dAOhFZ4/+LiIf33p+klzewgqTvHJoGgOJN0ZFaRnHA==
X-Received: by 2002:a17:902:e745:b0:216:51b0:6600 with SMTP id d9443c01a7336-218d722277emr48536105ad.24.1734534453538;
        Wed, 18 Dec 2024 07:07:33 -0800 (PST)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-218a1db5e1bsm77471145ad.46.2024.12.18.07.07.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Dec 2024 07:07:32 -0800 (PST)
Sender: Guenter Roeck <groeck7@gmail.com>
Date: Wed, 18 Dec 2024 07:07:31 -0800
From: Guenter Roeck <linux@roeck-us.net>
To: Wolfram Sang <wsa+renesas@sang-engineering.com>
Cc: linux-renesas-soc@vger.kernel.org, Jean Delvare <jdelvare@suse.com>,
	Jonathan Corbet <corbet@lwn.net>, linux-hwmon@vger.kernel.org,
	linux-doc@vger.kernel.org
Subject: Re: [PATCH v2 3/3] hwmon: (lm75) Fix LM75B document link
Message-ID: <9ffa3589-6173-451f-9e2f-bf34b43ae001@roeck-us.net>
References: <20241218074131.4351-5-wsa+renesas@sang-engineering.com>
 <20241218074131.4351-8-wsa+renesas@sang-engineering.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241218074131.4351-8-wsa+renesas@sang-engineering.com>

On Wed, Dec 18, 2024 at 08:41:34AM +0100, Wolfram Sang wrote:
> NXP reorganized their website. Update the link for the LM75B datasheet.
> 
> Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>

Applied.

Thanks,
Guenter

