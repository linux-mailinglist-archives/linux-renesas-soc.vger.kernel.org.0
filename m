Return-Path: <linux-renesas-soc+bounces-11487-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 6AC249F59F4
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 18 Dec 2024 00:00:06 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id DBCC61891C0F
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 17 Dec 2024 23:00:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4EB211F76DA;
	Tue, 17 Dec 2024 22:59:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="M1VZFx6i"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-pf1-f179.google.com (mail-pf1-f179.google.com [209.85.210.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 867DE1D9A63;
	Tue, 17 Dec 2024 22:59:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734476394; cv=none; b=Uy7uRupHgHUaPSzO5/vv5oWJF8B8U9LnnTveK6iZhfdp+8AqHY08CWTgI8HvwlKrjh1WFoWFiVV0j+3Vf2+nR7MBStlqZXJDep7HtjmglU1r2TIBQ7hpPwbM685ht9vZegTGmFhGda3CBkfgFY4OHHDLkHJz5biDWGsM6O7wqhU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734476394; c=relaxed/simple;
	bh=t78D7F/eWdsE/Maj8r8gf4TmgL1mU/T2PrN4z5z7CBo=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=BwIOmV5mkHECuiYmY4jbyjk8Fw462bnZrrV84VilvsVlEZXEjY1ldkr0qqFdIHXgvNrX/fzVTLIPzCjU+eDYAEk4Zngz2jgenedZ+CvWOiKyAQG7iBd1/dG0qV2wn1PKzhDqbMyhEfU/tzJYeV8JAZcjOVtyS7ToEukfChnqomw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=M1VZFx6i; arc=none smtp.client-ip=209.85.210.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pf1-f179.google.com with SMTP id d2e1a72fcca58-728e78c4d7bso150831b3a.0;
        Tue, 17 Dec 2024 14:59:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1734476392; x=1735081192; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:from:to:cc:subject:date:message-id:reply-to;
        bh=t78D7F/eWdsE/Maj8r8gf4TmgL1mU/T2PrN4z5z7CBo=;
        b=M1VZFx6iufLC5/zQhWoR/rdy46I8EWzhNPDsomsTN41v0hrpH6vxKkOxvxNNwHi7xT
         Nr5FjCH8qFgybiNCxF4aBMM9H0XWne93gYsWSKqPgr7JVEf2V60lsEEKhjn8V4OVplY2
         sRdn4u17kzWlzUKUU1KEsPxjhB6wDHsmwPqUoMVwUt8bx6xGvgXp1ShWyQc3Ry2kA9Rk
         GhrTiKVX3Za3vJK+gCmxSTO7TVF3HpfV4mrH+E4uVTn43G2FdhBpTaokpNJJJpQPMHUX
         tcQBA2r/lWDMDWBIc6G6q/QHmyTiUUAyUng9r7e5gG/J6zK74Qw4HTfxvgdaEIS4iccu
         2c5A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734476392; x=1735081192;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=t78D7F/eWdsE/Maj8r8gf4TmgL1mU/T2PrN4z5z7CBo=;
        b=leN1qEv1ZfMMCc4ojvPMpzXhvPEm4NMkAiJtWHclxOC+aRwUEZxoeNLLrhsi+WcpwM
         mQTvVJQe6n5HD7zr4RsswcqfjeYB3aRs5GnA0lh1V3NonZpKaQ1FZj7EkBcULqC1SG9t
         sF003w44WvjKTmVJfH3gKT0Frw8qcIH+qBw4sh/pELsioiM+jELXDuaDmL6zFJ8y//2R
         A1dxGmrLB3IPr9gXEKvfun+u5Bo0BvnMTQcod3UUIZZnoBnhZBygc83osZeRCcY/yxVd
         rsgIV8EgstJzl3n90maBdsud3+IkRRcXYgJW+t5sDRVgGT9TV5rDv+aihih6HVX13ad2
         3xOg==
X-Forwarded-Encrypted: i=1; AJvYcCVYepvsbeKiad0gr/M2/O1jTDQvHG/g0KZsmLUsUpGbYUiXpm8BhzdFPzStqsgCghV9fjZDNcHk0Upu@vger.kernel.org, AJvYcCW99P7sJjJfNz5OFZ2IAj6PR37kf33UnLQDqkDlrKVb578WlNn+LKl5prspl1XvJkQX4Y7+FFI0qb6t7ac=@vger.kernel.org, AJvYcCWKZrfcBQxcnNKgKJdRJL5+TYB1epDyhvo50AOvmEwllUIg91Bm08LglgdXGCz9Ptzz6cu9ybRDJyUf@vger.kernel.org, AJvYcCWtOSFxJBjYg/Fgvy4S7lRkNeK8KNYywVaTB4HTMG2g6R8T/reny3ZLd05oW7VkBL05baLSI5Dz6osZKGxO7qpMkjo=@vger.kernel.org
X-Gm-Message-State: AOJu0Yz94NpixHmBNn7p/gFjj2s9BI8AaOsRYGxTW5H3O397k/5CoHj/
	aFedA33PkC1YmYxkfdyZ/p3wHROJ/NrmQMlxzwi2HL6MpV+G8Iir
X-Gm-Gg: ASbGncsw+BFVzIGyLRbL9ZZKqCDbiDH3pcccHWw3oo1JUuEF+ID+7mXvczL5ya2tsGj
	rnq3oZh8eng0tZ0pWm9x+JyjblelimtrnTyeBpqYat81p3ZbbMHC6R3OarhrmjoKTtI5CcwQdOM
	w8fSTvbum2HzDd0ugBV4sKDgvKbhskHiYw3tjaWNDf3ScffrAdInAW6erv7eydW27yRXJyjiunm
	OM/7IcAoi8OjTLcSlNnGi8QIDmkQO+XwwmIMfixEIBL71bp795wxCpfwkbm2aYV5CLITa64dcUU
	92G0jGDGHsMNfGdXuL+VgPiwuBGeYg==
X-Google-Smtp-Source: AGHT+IFkQ7rhpow00hjC5jhoNGdN4nxcPAMzRD8JzAKqjoD+wgVGjfHj339cneoZOE4aqyFypjlJvg==
X-Received: by 2002:a05:6a00:b86:b0:725:e957:1de6 with SMTP id d2e1a72fcca58-72a8fde103emr778734b3a.13.1734476391696;
        Tue, 17 Dec 2024 14:59:51 -0800 (PST)
Received: from ?IPV6:2600:1700:e321:62f0:da43:aeff:fecc:bfd5? ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-72918bad81asm7213662b3a.151.2024.12.17.14.59.50
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 17 Dec 2024 14:59:51 -0800 (PST)
Sender: Guenter Roeck <groeck7@gmail.com>
Message-ID: <b30a1b76-cad4-4d53-837f-64a72993d267@roeck-us.net>
Date: Tue, 17 Dec 2024 14:59:49 -0800
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 0/2] hwmon: (lm75) Add NXP P3T1755 support
To: Wolfram Sang <wsa+renesas@sang-engineering.com>,
 linux-renesas-soc@vger.kernel.org
Cc: Conor Dooley <conor+dt@kernel.org>, devicetree@vger.kernel.org,
 Jean Delvare <jdelvare@suse.com>, Jonathan Corbet <corbet@lwn.net>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, linux-doc@vger.kernel.org,
 linux-hwmon@vger.kernel.org, Rob Herring <robh@kernel.org>
References: <20241217120304.32950-4-wsa+renesas@sang-engineering.com>
Content-Language: en-US
From: Guenter Roeck <linux@roeck-us.net>
Autocrypt: addr=linux@roeck-us.net; keydata=
 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
 mDW4+i+XlNFUPUYMrIKi9joBhu18ssf5i5Q=
In-Reply-To: <20241217120304.32950-4-wsa+renesas@sang-engineering.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 12/17/24 04:03, Wolfram Sang wrote:
> This small series adds support for the above temp sensor. Ultimately, I
> want to support it via I3C. But for now, start simple and add I2C
> support, so we have something to compare against.

I just sent a RFC/RFT patch converting all chip access code to regmap
to the hwmon list. This should help with adding I3C support. It would
be great if you can have a look.

Thanks,
Guenter


