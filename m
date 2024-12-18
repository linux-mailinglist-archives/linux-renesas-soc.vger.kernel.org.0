Return-Path: <linux-renesas-soc+bounces-11549-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 4B6609F6977
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 18 Dec 2024 16:09:06 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 2BFC3188C96B
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 18 Dec 2024 15:06:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7D0FE1D5CD1;
	Wed, 18 Dec 2024 15:06:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="g64DsoS5"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-pl1-f172.google.com (mail-pl1-f172.google.com [209.85.214.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5D5081B425F;
	Wed, 18 Dec 2024 15:06:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734534362; cv=none; b=E6TPPP5cYFlkTYSDQZ+m5vxWSyTGoD6R1ynPNccK96yxG/5cvhkoAPSd6hMKSCuax5zNh11OfdqPDO+Zv7YLV652tAPOOp8baTR4VGtV9LDtv8AYakq857fvioVE1voCGdKDcYbThf9cD4QgdTHZjIGOwGiD6WeSKJX7e+KX4og=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734534362; c=relaxed/simple;
	bh=DHIldNbPWVh0WfDcvXOyplG/B2LSNqtwt1yhIYDe6hU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=UzrDrzgBEwMob6jokji51tmSROlXqFAOAWBob5PlcKJo+ho8uGCzPaE/vajBW9uukHQE+Fw4CRYhQxp/l/fyg8aKa1cJ6Sp4QFFDWwJ8FJItHAcI4hHBMEHn4K23Uhl9ANVulVzHQiYSZTZBS++YMd+dIYlSId8/W15fHPqoWnk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=g64DsoS5; arc=none smtp.client-ip=209.85.214.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pl1-f172.google.com with SMTP id d9443c01a7336-21669fd5c7cso58916495ad.3;
        Wed, 18 Dec 2024 07:06:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1734534360; x=1735139160; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:from:to:cc:subject:date:message-id
         :reply-to;
        bh=qibi5O2ZnoY5qmCq6OMgMlOymzpbqvpfsxjibdO9a3Y=;
        b=g64DsoS56nEsKWPq5fxD/H3cIOMaQeIlziknkxnNdAL4PWykmsJdup9Pw4MOJFabcB
         k4ZjaGapFVD7mhBllhKsDNv5/9GPXEjifRN7FODwOKlfzYnS+ijrAnGop5p4hmDi84HZ
         RAnFW2lR6pen0DOF4USnk6M5+iixsx8b6MLwg+wuf5vuNPNBS3s2FJBj/cNBwI5EeF5e
         QsqNV3NUCXu1F+g7Nyj0+M3Ph5KcIz4du+Vml2Kuvo0hDIz/HwTP38s2rVjxKZktjPaY
         y7VBs9WRI3NCDcAWqxdy4p19+uswJwxs67EOPm4abtH2Sw+w1zUbhkOCZoGc76wZqcS4
         SL6Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734534360; x=1735139160;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=qibi5O2ZnoY5qmCq6OMgMlOymzpbqvpfsxjibdO9a3Y=;
        b=jnQmvHzcDcorD9nvTqGK0wGClZJbNZ102mT/rtFSYWW67xv7H19P+Sp01HYxMxYzmr
         LtsuMMDmMYP/vG2RoyJh8yXbo1/ulxLG+3vqeHzIScbtdSriCx6h8tCD4bop8k7fzsjH
         zE/hjYkYgDaFi6QCP9xU1JQ8zeexeXtbAWxdEh96bG1T0Rq768qx9KTubU3bfHFM1jvf
         IJY4tMb5JtkvsIbmgmR/TnGXpVnkOpVgqJ65DIxtE4N+4/c2JoSk4kMhsGQ97OpGEoPA
         a3pTv1rAZRlJNwRoXdiAjywoBWCd5UJXaBC35v0tEltP0gSLyQ1fsZbuiXyhgO+Dh3KE
         d7uw==
X-Forwarded-Encrypted: i=1; AJvYcCVaRTdJWRYO3tB0ylaY2Dw0enYyoYY6T7qcEdWziNTtI7CMi6uVWELPtbv9J7ycST1+fJOzxnpdYM1g@vger.kernel.org, AJvYcCXf3md9iCWVsexY8e0twA8YSK/wgH6XOWuFcMhMBfTFAydJBRLmKgVX4qYUe497FtOnvUWsWytDFEwETE8=@vger.kernel.org
X-Gm-Message-State: AOJu0YyY+J8krHWl4Wpt6W/wzgLPhE2N53E/8xUSydKJPKCK6gzPYnDc
	3gmnUSFpLC+Iq/YYeIZxb7NdPQGyC2bupPZh0V5ZkOz913106vyT
X-Gm-Gg: ASbGncsopVFC0C5Ha9WPrVEwUuVApX0GssUlyG2SmzQJct9vuzbZytJBS7JMWbHe/xQ
	u7BPa/vctao5N3BCoN3hbqEpvjZNIm+Kz+CoKPcczEk+Uy5yO/DPFtvUOsmFq2wXiBloX9P7Y0I
	MF2iV5HD0EnWOG1hlpgrFL/5RBAo9x8PUkMkFF7hwXY3QSqOf97XSZv3tVGepL0tUuEeset5V3/
	pIkE5hkeqIlGshqQ76llUQcxbKdHtwzEaV6CIA4x9QSp51NG8BvsHswwRaLX/bxIbAEjA==
X-Google-Smtp-Source: AGHT+IFDoy4ZnMrcFR2Hcwx11a6mF8FFXsKhuN9OgY/3CAkgFrHMR4T3s52V8nx16k7EXJFst9N1Zg==
X-Received: by 2002:a17:903:186:b0:212:40e0:9562 with SMTP id d9443c01a7336-218d7223373mr44837925ad.25.1734534359538;
        Wed, 18 Dec 2024 07:05:59 -0800 (PST)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-218a1e500b8sm75539075ad.123.2024.12.18.07.05.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Dec 2024 07:05:58 -0800 (PST)
Sender: Guenter Roeck <groeck7@gmail.com>
Date: Wed, 18 Dec 2024 07:05:57 -0800
From: Guenter Roeck <linux@roeck-us.net>
To: Wolfram Sang <wsa+renesas@sang-engineering.com>
Cc: linux-renesas-soc@vger.kernel.org, Jean Delvare <jdelvare@suse.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, linux-hwmon@vger.kernel.org,
	devicetree@vger.kernel.org
Subject: Re: [PATCH v2 1/3] dt-bindings: hwmon: lm75: Add NXP P3T1755
Message-ID: <07f2ec23-409b-4670-8cb3-7ef7e75ea5ae@roeck-us.net>
References: <20241218074131.4351-5-wsa+renesas@sang-engineering.com>
 <20241218074131.4351-6-wsa+renesas@sang-engineering.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241218074131.4351-6-wsa+renesas@sang-engineering.com>

On Wed, Dec 18, 2024 at 08:41:32AM +0100, Wolfram Sang wrote:
> Add this LM75 compatible sensor which needs a separate entry because of
> its default sampling time and SMBusAlert handling.
> 
> Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
> Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Applied.

Thanks,
Guenter

