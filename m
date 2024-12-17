Return-Path: <linux-renesas-soc+bounces-11424-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 0A9609F40B3
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 17 Dec 2024 03:25:43 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 02222169C5C
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 17 Dec 2024 02:25:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1F6AF13D504;
	Tue, 17 Dec 2024 02:24:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="JkCmpGee"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-yw1-f172.google.com (mail-yw1-f172.google.com [209.85.128.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 07B6B13B2BB;
	Tue, 17 Dec 2024 02:24:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734402289; cv=none; b=PQfdVFVYaeFxbn1mTi26tEAMHOK0zjTVYQNl05Z22dcUhcXUIIMd6g0u/dZWOELScD+qKhN8CQCvr3zNW7GuTlNyLJFgZQvZf19KPDQj4qMgQPJELj7Wc0EYrDSLVZaQVmn65heoSmtVdFtdGn7dMWe1YznMlWXYgt4eZElyw6w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734402289; c=relaxed/simple;
	bh=g78BIc0qeArMDi2X/YRDz2EPjSruhLg4hdT2w8W6HXU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=mIEXq23RVj0IiqvyWvRzYRvni9ohQXRBGFn1WcIPAcdPiw9vPk8hpg72LErSfl8sEGQxJsP8cFV/55d18e9B5ZxSI1rQPMliQqKQ4pNy/5UBHzu5h7qP5nuYLiR6yQJA/nxq2pbye0qQw0KkxjmmYwTuq7Pj66Olrk5S8dvLRxk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=JkCmpGee; arc=none smtp.client-ip=209.85.128.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-yw1-f172.google.com with SMTP id 00721157ae682-6efea3c9e6eso34571127b3.0;
        Mon, 16 Dec 2024 18:24:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1734402286; x=1735007086; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=EP5ZynT312ZSNFnjiv1Wwj9DsR/r/HsJlceD3oHAYVs=;
        b=JkCmpGeelBIJdhPNfxptUWGzqomLjHM04Qyc/WSkZgsw5L3+xJ1vmW2mCFrO96sL5J
         fkKs6iE1bFMnLpLboIMQRI0q+GUQ6SMFqIje/k83G6aMj5tgcwv/Eo+6ek9xO+dbn2Gc
         mxuJnrJo4ptYxH2pZxRJ8R8XDdYGFqKHqwlJEc8T60y74tSKYdzAPbwRBwn1BolPP+en
         ofD+zmrOVGT630n6uS7/F3uGKFaRdkj7k1RBR0s9oX2kMjhW2OD+NL/QIrWJPkskkCTi
         uWGL9ldjb9uv9q95YT7tnxJR1U/lOlD5BgJLKoJ46mgRGPxePs5TVX1tYiWCUFqLaBIN
         tUDA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734402286; x=1735007086;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=EP5ZynT312ZSNFnjiv1Wwj9DsR/r/HsJlceD3oHAYVs=;
        b=oQ+9Jfjp7rgsPohPzqFX8pwdueqMjgU9XnoOnhoWWEYh1YZkhQohjF1ILXJRR26uJf
         pJhjsesQOTUcTX7NiNJ23urRnbz1A8Dn2F/hCn4kdkKVsirIc38S1FDhyOiro2vxO9cN
         e0akVRtQbj0OmA908hYe01k2NjxVehF6YGaASkUEFcg32y06Nr8/m/BjC1hCdrBKF1N4
         ZZErowIix/+wrBeBP/vqFhHytEsMTzsEcw8NrAriE7JOKC6tqVCcDd0J2Gd9aPbiW5gb
         N/1yyXzF6xE+d7C4Zwx5uNANMBUSdMKXrE2ABV/PBQuWTSD47Jtjn1g4l5jZ5QgTndzW
         TR6w==
X-Forwarded-Encrypted: i=1; AJvYcCWe7RXoRTPeDl4xEmTXhW/Z7eZow+TNvbP+66r55PxgtlVprCViHm5WivDxr+O1RPucJBKvCmvbph6dG/v3@vger.kernel.org, AJvYcCXbb7+hwKokM7gqvTAtkPeJBwviRHZpjgumxRiRjuRcR8SSil8eAdBJqEQRYgNBsEH01hI37y4naGC6tA==@vger.kernel.org
X-Gm-Message-State: AOJu0Yze7uoIF6kR0dIDS3fVvQXPGzP5qYWHu1RCtfqMSyAl6qBbcQGl
	gEmATvKzHUugA1xhy+InRcu/1wBFDpdtmfo969Q24ujMy/WPD9/N19Qt9g==
X-Gm-Gg: ASbGncvZsLgd3Vs8mmqkRKf5KRpT3jwGXWizkAO1faPoKF6qbjzXFS8cUdMTHhsM9/P
	3pPeSpNeXOR5Vo1ghlmTHExLp0HmkRdKWCn4HT5SlPA0ybIPp4baSqKuSABOmCl4SPAC00/Eck+
	mqfeuyxJdVA+66OKqtwXEZY+nG4nDqlT1FBnbOR3EWsXHYdtRsL3Ju7qsBosnw7jYOuebM04EJd
	bQ3Z649GXSBCIf8HoyYN9VpXATIERm4QGSN909zL8R8trcpJ7nyZvSP7W56uASbcmrorA8Q9Av2
	QpjjDNH226OP7BwL
X-Google-Smtp-Source: AGHT+IH8+H0qNEjMVGr3aGzEf3aDGSI1L0VYggMEu+ToZG6774zPVL9fENOA68MCpkfiOQd1uTvCqQ==
X-Received: by 2002:a05:6902:2789:b0:e35:d93a:c9bb with SMTP id 3f1490d57ef6-e52f9632992mr1794156276.10.1734402285854;
        Mon, 16 Dec 2024 18:24:45 -0800 (PST)
Received: from localhost (c-24-129-28-254.hsd1.fl.comcast.net. [24.129.28.254])
        by smtp.gmail.com with ESMTPSA id 3f1490d57ef6-e470e54d35esm1622919276.54.2024.12.16.18.24.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Dec 2024 18:24:44 -0800 (PST)
Date: Mon, 16 Dec 2024 18:24:43 -0800
From: Yury Norov <yury.norov@gmail.com>
To: Wolfram Sang <wsa+renesas@sang-engineering.com>
Cc: linux-renesas-soc@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-hwmon@vger.kernel.org,
	Rasmus Villemoes <linux@rasmusvillemoes.dk>
Subject: Re: [RFC PATCH 1/2] bitops: add generic parity calculation for u8
Message-ID: <Z2Dg6ydwN6CfxgTe@yury-ThinkPad>
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

Acked-by: Yury Norov <yury.norov@gmail.com>

Would you like me to move this patch in bitmap-for-next?

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

