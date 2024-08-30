Return-Path: <linux-renesas-soc+bounces-8526-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 114D8965740
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 30 Aug 2024 08:01:53 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id C2B672869AB
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 30 Aug 2024 06:01:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A98CB14B978;
	Fri, 30 Aug 2024 06:01:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="bluGi6Iz"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EAF37136E3F
	for <linux-renesas-soc@vger.kernel.org>; Fri, 30 Aug 2024 06:01:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724997709; cv=none; b=PpA79750RUp2xvuh1O8K5gG9N4sQNn/baAS7YZfqI4XKoCSXI24T8m4MDSLLTX9x+zgl2tY6K9Q5MTgvSOS8PrFVYjUcq/MAQM1CCYCgrrI9yTPE/nYT6ZIusqrBhKJjOPbkRZZ+7kjKpBcDWFesgxMI5IXmAANZ5FoIhpPWjmc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724997709; c=relaxed/simple;
	bh=9DNY3ZFRE7CHnMwm1XSpzP3vVjD0l1buQ4MAKMyTHeQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=oOe0/bbx7PifRlvT0QARCFcIjjAEQYROkxLi3W+cjdMCFvQIFSgrz1CN/K8WSfhPd1QbHBxzi5frrIrfPo+JPfdOL9sleMj9pvC2hC5lMTdhO80IvsYoQJPveLWMWsxoyobs7VdLzXPiMDn303U4Ja8r5YMUcXETFJMVksmhGY4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=bluGi6Iz; arc=none smtp.client-ip=209.85.128.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-428101fa30aso13050935e9.3
        for <linux-renesas-soc@vger.kernel.org>; Thu, 29 Aug 2024 23:01:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1724997706; x=1725602506; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=Warkqu/1C4P7VyOObJRODovHA5t9+AmBIFpWfc0vrEs=;
        b=bluGi6IzrPPs1kP9+S4ERYLCvqEE7kib/yjS15JPjlOhI13XW1IQuP18Qz4yNvFxfb
         KyzuVwXJYp4/G4ddP5iEFyQXAeAbpzCSGdUq/nSZZ74Ff6rOSxBeEWbTxk7ZbU5Mjh1p
         n/Axb9GTB/QMrJPds49soJg3nJGy2c42QXtlevUmNgQuuZQQWeKty9jKSmxTtEuZRP57
         O7E3RyGnxhmMUR0ip/0CMgsbHHID3usfJO/s9RS3FQpLJrIohDtUsOAF8H0nedwmz2E9
         XhHEkFykf1zTJuJqb2vlBdpwmE89EPiCwdH+D8mf0EgVKH9SC6X5sWHQJ40ZSnxCaTNY
         l+zw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724997706; x=1725602506;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Warkqu/1C4P7VyOObJRODovHA5t9+AmBIFpWfc0vrEs=;
        b=bpGFI9Od/15PP5SLtCwUwiaKQBD9L54bevUjv7huWyHvO7I4xpSN291k6grBDgk9Tl
         hWPFe/DDyBMVMoLgPAIJ8h4Unjjq7oepuz0J35L4tSu98I0SKxgtOy39jnZNexeojOD8
         5P42mCZp+03M+587grTvcW7/YBz+av/15RIG2PxjEvu+rGJQ47rkEpZfH5slGsxx5hzw
         627rJrabDaTZHLku9wiBMgeY7k0K3EhQlZXgYg4MJNUczu7/dO/1wildyRx343qYJprx
         811jmkuKoHO1QemYxutqC8/i8a4RPnnoJ/q/DVdMt+Kfv++1H/1J+EZ7OvQ9eE4W/pGD
         5qhg==
X-Forwarded-Encrypted: i=1; AJvYcCWEWTynyr1jiSmEAk0ui69rLqiQbgXrnlaOWw47joyXLA649vif3ytj7s6uZwHMI2tS7Qk9B0HY934QKkBFiKeCXg==@vger.kernel.org
X-Gm-Message-State: AOJu0YyQhg9ooLDO0yKT225Hgm+Mu4KSlxgenDNkXoSJVx4HuoUj/pHU
	I56bcRFmOXGZ8ta6Q6WCjB5/ETXUipzVaBbWvrai75zSJpdJUEl9UyJ3PLbmwR4=
X-Google-Smtp-Source: AGHT+IEnYCMR+9YoUxCyT15AEnLKuXgg+ZtwpgefE7r0jjZu+IE1hb8+dWprd3QISNhgKpkxSgiOVA==
X-Received: by 2002:a05:600c:3c8e:b0:429:d0cb:950f with SMTP id 5b1f17b1804b1-42bb02c2031mr41008065e9.2.1724997706001;
        Thu, 29 Aug 2024 23:01:46 -0700 (PDT)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-42ba6425a13sm70170665e9.42.2024.08.29.23.01.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 29 Aug 2024 23:01:45 -0700 (PDT)
Date: Fri, 30 Aug 2024 09:01:41 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Niklas =?iso-8859-1?Q?S=F6derlund?= <niklas.soderlund+renesas@ragnatech.se>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Sakari Ailus <sakari.ailus@iki.fi>,
	Julien Massot <julien.massot@collabora.com>,
	linux-media@vger.kernel.org, devicetree@vger.kernel.org,
	linux-staging@lists.linux.dev, linux-renesas-soc@vger.kernel.org
Subject: Re: [PATCH v3 0/5] media: staging: max96712: Add support for MAX96724
Message-ID: <affa5481-b858-4f7c-9325-3bb56de4f538@stanley.mountain>
References: <20240829165051.2498867-1-niklas.soderlund+renesas@ragnatech.se>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240829165051.2498867-1-niklas.soderlund+renesas@ragnatech.se>

I don't feel qualified to review this, but it's a lot prettier than v2.  Thanks!

regards,
dan carpenter


