Return-Path: <linux-renesas-soc+bounces-8396-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id E60069616D1
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 27 Aug 2024 20:21:37 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 24B421C22497
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 27 Aug 2024 18:21:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 29CAC1D04A0;
	Tue, 27 Aug 2024 18:21:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="Qkk/E5Bh"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 733491C57A5
	for <linux-renesas-soc@vger.kernel.org>; Tue, 27 Aug 2024 18:21:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724782894; cv=none; b=STht7938oqFH89PwQdL1x4DEqYsNOnEtzepfQUH6T9FkPB+wSl7smXCPA/wJvPvhhMhDVtwnO5nQWbo68k+cVD/DisFLGG/xcYYLxWG0eQfPgpvf4APXeRyK/mE05XPQ0yzgc3kphRaLiv05M1gt5oTnUpBfVjL98rWZiUKBVUw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724782894; c=relaxed/simple;
	bh=MpceHBZuHH3o2CueqUk5GDOo7VtJrr197q01MLuthFA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=GkB5FhGwSA+legwEhuaQ+IVRoZb0UsaUxS/YwXZli7Lt7MCOKwXCzHOtKktJWimrUqLD2fKdxJIdBN+qmu+JftW1ufNz51BIZ4KZKDphsH8O+bMhUCjjySpypYoIBNP2DdPiabvX5DWjxheDVGCMJjM9BY8OovenRizXx6oUgEk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=Qkk/E5Bh; arc=none smtp.client-ip=209.85.128.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-4280ca0791bso52510105e9.1
        for <linux-renesas-soc@vger.kernel.org>; Tue, 27 Aug 2024 11:21:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1724782891; x=1725387691; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=kqdvqJEmzWDPrKZyiAdNz0J2ROp2OO31etrcR1BLAWs=;
        b=Qkk/E5BhNTbRLvBwbNC0azY9GNZg/1WDwXdZRF+ItgxohfucYoEN/nKaFSd/tSbOzT
         zJirMTA/wDgFIEmwg8q9JXSpbFnYDNikwrwD1cOcoUsSomSXH/l1vzcLIytNmfPwI8Ky
         uR/QFS2+PGEgBSqD89DcR5asbM1HweLbLrgeeizyOlZil8OQI1KYaC6HfhGgOadXtxJM
         Jvm4slbi+628DresDQ+d+4mS8Ee5Mi2iuwNHMVbua0VAr6luJqxg6OR1xKWAFYvVAqSb
         mndE1zBfRP3XK2hmPHF6bFXnKt0zMXCb7NaD7DhZR5ClRrKDJBv09orSmxOXHhMSARzp
         apKQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724782891; x=1725387691;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=kqdvqJEmzWDPrKZyiAdNz0J2ROp2OO31etrcR1BLAWs=;
        b=N33xqs27UJKBf8X4WkeL+mXbi7DuIVIlxi5DGEJXM5uuckuJgWivNPDM63wJVID3+r
         L5vluYViy6fjv2JwNF9HayOsrOCkLsIWg680Xr272+pGQCLRrIdwsEF88n+yFndaAi8L
         wzgciGJwkcmjdhJZV6Qp9j1bPlmnTTTDMRVau1eILY7GHlBPLaloEOPD33WXDPqMKYdu
         t1LxgJlU4yTB4M1i+0HL5VDzYKUzs/RuBIjzGvz0il4runtdX4/suwG0mpXh9WaB5uGC
         Oscv6vRFYVMf7m8/v13Vf7ivvzTrJqFTdUnMF/aQvDTFALKl1X7JfARyx/wKw0K5c+2E
         hI0Q==
X-Forwarded-Encrypted: i=1; AJvYcCVuDFHvak5fETORMTWdx3yqtzBcvORQc2ACPeqtFUHwzz4cPQW7jqDFc8DdAEaG0O7myZ+b/5IHSo8qWR06v42oWw==@vger.kernel.org
X-Gm-Message-State: AOJu0YyqvVtZ4fibaeFZgPmU2Kk1UGo3+ND6NuqxGYRIR30NBV+eH0lC
	HwskUzc9qT63Pxb2Ox7ywFDo3SrVuQt7apmgewgNkpv5RyFa1pK6R8opfygEBPA=
X-Google-Smtp-Source: AGHT+IEn/urW2WYXErg3s6zWyW9m2P6dJY1Stz7H7aazJRw4zjfpDd/WN9qJrYv1mjZWFicmilsI7Q==
X-Received: by 2002:a05:600c:45d1:b0:429:e637:959e with SMTP id 5b1f17b1804b1-42b9add4764mr27914815e9.10.1724782890655;
        Tue, 27 Aug 2024 11:21:30 -0700 (PDT)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-42ac5180106sm198559695e9.41.2024.08.27.11.21.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 27 Aug 2024 11:21:29 -0700 (PDT)
Date: Tue, 27 Aug 2024 21:21:25 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Niklas =?iso-8859-1?Q?S=F6derlund?= <niklas.soderlund+renesas@ragnatech.se>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-media@vger.kernel.org, devicetree@vger.kernel.org,
	linux-staging@lists.linux.dev, linux-renesas-soc@vger.kernel.org
Subject: Re: [PATCH v2 2/2] media: staging: max96712: Add support for MAX96724
Message-ID: <44676cc2-a9e0-45b9-b08b-5280e8aa7a06@stanley.mountain>
References: <20240827131841.629920-1-niklas.soderlund+renesas@ragnatech.se>
 <20240827131841.629920-3-niklas.soderlund+renesas@ragnatech.se>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20240827131841.629920-3-niklas.soderlund+renesas@ragnatech.se>

On Tue, Aug 27, 2024 at 03:18:41PM +0200, Niklas Söderlund wrote:
> @@ -181,7 +186,8 @@ static void max96712_pattern_enable(struct max96712_priv *priv, bool enable)
>  	}
>  
>  	/* PCLK 75MHz. */
> -	max96712_write(priv, 0x0009, 0x01);
> +	if (!priv->max96724)
> +		max96712_write(priv, 0x0009, 0x01);
>  

I don't like this either.  The comment should move.  I didn't see the ! the
first couple times I read this.  I don't like the MAX96712_ID and
MAX96724_ID defines because when humans read they only see the general shape of
the words.

https://www.dictionary.com/e/typoglycemia/
https://en.wikipedia.org/wiki/Hamming_distance

I guess the best we can do is remove the _ID so at least the last characters are
different.

It should be something like:

	if (priv->id == MAX96712) {
		/* PCLK 75MHz. */
		max96712_write(priv, 0x0009, 0x01);
	}

Or maybe put in function.

regards,
dan carpenter


