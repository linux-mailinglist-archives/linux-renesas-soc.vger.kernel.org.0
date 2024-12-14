Return-Path: <linux-renesas-soc+bounces-11346-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 86E9F9F1F8E
	for <lists+linux-renesas-soc@lfdr.de>; Sat, 14 Dec 2024 16:10:48 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id B30097A05C0
	for <lists+linux-renesas-soc@lfdr.de>; Sat, 14 Dec 2024 15:10:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 714C8194AC7;
	Sat, 14 Dec 2024 15:10:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="hS8LkW4q"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-pl1-f177.google.com (mail-pl1-f177.google.com [209.85.214.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 166AD1E502;
	Sat, 14 Dec 2024 15:10:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734189040; cv=none; b=ItPg/qSOTFq+meElkcCqRV7ILnrFbncGPhusV5D+xkOIKKJ6U6IkPr3i9xk6h7DFbW86V5+O0CJHgW7KB1sAYo2pP3G/t4nap7+o+yyVUK37w9tA8L7qvnriG59PDNhu8enLwKFCabb+PLvRLDFDdteC+p7fvSSh1dVGx95lUAI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734189040; c=relaxed/simple;
	bh=++lyCknnrByc5PICn6mT5Pj+9Mrp+Y/132YiDXL1BME=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=uNG+WTjsaO+WfhC6ShvB6Bm4k/JNReo/28w8s3mFqExxOxnnsyxLOx6xIk4AaWEUIze05n+YOkiejaHMgtoRU03mleoFs2fSaWz5Rjg8Fg+lmZTFSGSLMLo5Q5St3m+pLEXo5wycsID07nPRvumQ8yXt5hz+8OtCSTOSA0bb/LY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=hS8LkW4q; arc=none smtp.client-ip=209.85.214.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pl1-f177.google.com with SMTP id d9443c01a7336-21145812538so26490525ad.0;
        Sat, 14 Dec 2024 07:10:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1734189037; x=1734793837; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:from:to:cc:subject:date:message-id
         :reply-to;
        bh=zV2B70S7pLnjROnyTCe5zaBvkKuSEO0PMS+9FZyJN3c=;
        b=hS8LkW4q/a7Og6uztHfoAxl9sUdcqd3NysJNv8tnHR/bYw4RRBucpBuO5WfhlJrZZj
         2twY4gU+lW83XXTOySO3Hs8d5sxOzhObq+BdJXJBu9qAYgucmO90D10CwU3qp51Tzioc
         I60ZCAIHxFud+tPYlMU8Bx3u8I/pdZjYGmppAuTOwbogHDVLMBK4uS//ehor1DelRwtD
         tnCFFKRW+si1ym+sKufPDSjiZa2bE0q01+JFWnarIKAW/Ny1Cx46w7MrnN6ZJdUKueZh
         rFWdTcovlsT70LcjkFiAtMhpm2tiZ5E3mSr/CHCNPjkPfM21GXWNErf0zkwhIlxphvji
         Fh8A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734189037; x=1734793837;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=zV2B70S7pLnjROnyTCe5zaBvkKuSEO0PMS+9FZyJN3c=;
        b=Ll7HD/gVCTHNarKEgNlDaH3lNbm9DUAWTUgDAZxAIljlICl2MHPnsJM5fIY1eebCoD
         zc9YssG4iO2XcOgeeP/T+HiL28k5rvusOjSq/ff+Dixqgb05qa6Z1kwSiRsspn6aNizY
         yCE0bwv3UftNzopi06Cgdzi3VjtMtCPIGjZ72wggGLWoFhbgINpxwFHRIh4lbubulQEM
         TRMzP7ulM0Pl8fxSsn1gTTNRmD7cE9yp4M88kDs1o3BZb1KfoVW6LgMlS2LvQz0KtYs1
         XEcCmACmHGU/dOFIZjnv5AO+HSeYxOSEdehz0vckKcjVPaIJ4//pUaoiPe1G4Y4VCojb
         ZM/w==
X-Forwarded-Encrypted: i=1; AJvYcCWP3hIcbWD41DWxuhRqC7AQFLrkJyB72QCkEuuosyNRhBm4KMN01XdxHx89fr/yjfgYF4l7iX6ZyvzqlA==@vger.kernel.org, AJvYcCXHf3itkbA8dFM65lYi40anhqnfksz8fkwpDXILB5Jb048bSNfsIwzpRZulxBnAv8jrlpWKRx0J+vsmVT+M@vger.kernel.org
X-Gm-Message-State: AOJu0Yyu9Jdn9xG2NA8DCJOCnoNG2oys/MK0JDk3S9EHuiwWBK+5KqGS
	L51X71nRr4Z7KFcvx+hpFQe6eYV8xn1q5IHM+bPAKvo+Mt3P3wCw
X-Gm-Gg: ASbGnctB2OX7HP50xzA//eBwaMEGg/CLFeYimF2DGMTi6aTX/5/1SSuqAIrdRIgt1oo
	tI97iJF7Y08yAw8rtH78ACRP+lM8ZqhuFoWqliCdWhcIIEH8nQGsrNGdww9TdDjToiuh9eEJoD5
	CxwFNFHB5a1ZeZ1ioZEC1koPZ/YFxI5gH+rKc8I9RW3v6eiGoktysylUqwzTcf31JT3oQP8v+D9
	JXfxcczX53OoFPny8YiygbBU4Ynk4IxGSDAurG1O1HZ4JfVecZhy+k1E39ap4M1sUvj0g==
X-Google-Smtp-Source: AGHT+IFOQjHLMR7zWVVYP3VWlTeG0+c5fyzpyZlGUvRMTi2ICPTaWtM3uCP2XBsvL4rnc/z8e1ptMQ==
X-Received: by 2002:a17:903:41c9:b0:215:3661:747e with SMTP id d9443c01a7336-21892999566mr93292195ad.8.1734189037277;
        Sat, 14 Dec 2024 07:10:37 -0800 (PST)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-218a1e64161sm13637895ad.221.2024.12.14.07.10.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 14 Dec 2024 07:10:36 -0800 (PST)
Sender: Guenter Roeck <groeck7@gmail.com>
Date: Sat, 14 Dec 2024 07:10:35 -0800
From: Guenter Roeck <linux@roeck-us.net>
To: Wolfram Sang <wsa+renesas@sang-engineering.com>
Cc: linux-renesas-soc@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-hwmon@vger.kernel.org, Yury Norov <yury.norov@gmail.com>,
	Rasmus Villemoes <linux@rasmusvillemoes.dk>
Subject: Re: [RFC PATCH 1/2] bitops: add generic parity calculation for u8
Message-ID: <0f4bb1d6-19f1-4999-b09c-e514c18364b2@roeck-us.net>
References: <20241214085833.8695-1-wsa+renesas@sang-engineering.com>
 <20241214085833.8695-2-wsa+renesas@sang-engineering.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241214085833.8695-2-wsa+renesas@sang-engineering.com>

On Sat, Dec 14, 2024 at 09:58:31AM +0100, Wolfram Sang wrote:
> There are multiple open coded implementations for getting the parity of
> a byte in the kernel, even using different approaches. Take the pretty
> efficient version from SPD5118 driver and make it generally available by
> putting it into the bitops header. As long as there is just one parity
> calculation helper, the creation of a distinct 'parity.h' header was
> discarded. Also, the usage of hweight8() for architectures having a
> popcnt instruction is postponed until a use case within hot paths is
> desired. The motivation for this patch is the frequent use of odd parity
> in the I3C specification and to simplify drivers there.
> 
> Changes compared to the original SPD5118 version are the addition of
> kernel documentation, switching the return type from bool to int, and
> renaming the argument of the function.
> 
> Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>

Tested-by: Guenter Roeck <linux@roeck-us.net>

> ---
>  include/linux/bitops.h | 31 +++++++++++++++++++++++++++++++
>  1 file changed, 31 insertions(+)
> 
> diff --git a/include/linux/bitops.h b/include/linux/bitops.h
> index ba35bbf07798..4ed430934ffc 100644
> --- a/include/linux/bitops.h
> +++ b/include/linux/bitops.h
> @@ -229,6 +229,37 @@ static inline int get_count_order_long(unsigned long l)
>  	return (int)fls_long(--l);
>  }
>  
> +/**
> + * get_parity8 - get the parity of an u8 value
> + * @value: the value to be examined
> + *
> + * Determine the parity of the u8 argument.
> + *
> + * Returns:
> + * 0 for even parity, 1 for odd parity
> + *
> + * Note: This function informs you about the current parity. Example to bail
> + * out when parity is odd:
> + *
> + *	if (get_parity8(val) == 1)
> + *		return -EBADMSG;
> + *
> + * If you need to calculate a parity bit, you need to draw the conclusion from
> + * this result yourself. Example to enforce odd parity, parity bit is bit 7:
> + *
> + *	if (get_parity8(val) == 0)
> + *		val |= BIT(7);
> + */
> +static inline int get_parity8(u8 val)
> +{
> +	/*
> +	 * One explanation of this algorithm:
> +	 * https://funloop.org/codex/problem/parity/README.html
> +	 */
> +	val ^= val >> 4;
> +	return (0x6996 >> (val & 0xf)) & 1;
> +}
> +
>  /**
>   * __ffs64 - find first set bit in a 64 bit word
>   * @word: The 64 bit word
> -- 
> 2.45.2
> 
> 

