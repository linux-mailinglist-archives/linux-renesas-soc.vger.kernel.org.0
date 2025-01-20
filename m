Return-Path: <linux-renesas-soc+bounces-12264-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 3950FA16ACB
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 20 Jan 2025 11:32:58 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id D9A9418895F7
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 20 Jan 2025 10:33:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6EF551B423E;
	Mon, 20 Jan 2025 10:32:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="wwuJqPaa"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8D7021B218A
	for <linux-renesas-soc@vger.kernel.org>; Mon, 20 Jan 2025 10:32:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737369173; cv=none; b=RZoOt+BDPV8HcNN7Ku/zge6Fgo48SRXCvOHC6gER5Fm4MAOwTfRSJw5oUau6biFz23UUcXbox6iZhN5YCx6B4jlvKzpII/DrARBd5A3hdwSerxjjnXnElWqgQWuB95fZyjbK0+1oZUkteBO8p+WNqJx9dzB2BmBRufyWTQyDFKs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737369173; c=relaxed/simple;
	bh=1pUBp7jq7n1DF8msh+TCFHLKFmD0Ys19ztKEMSeVWm8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=KjG54Zh1DuuiMbASgQTKNpTj9w7izycDgZ+kIpJdYLSUgXvRNKLyJSbTjAf20TCKJCMUpjOy1mdPRPxUVDVIpCYnsak9z+AUE9dvJ2x7y+bC7ef4XAlDplk+u4ypqksGTI5udIR1uYPOVWZkMZZC5vYL20LB+AgmVajNrLO3ekg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=wwuJqPaa; arc=none smtp.client-ip=209.85.128.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-437a92d7b96so42612095e9.2
        for <linux-renesas-soc@vger.kernel.org>; Mon, 20 Jan 2025 02:32:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1737369170; x=1737973970; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=XxJc+Gn91nAPEbZKkkYM0Lfyo+ldiMC9cjcLHUqTWxk=;
        b=wwuJqPaaTIy+yBgXwUBOzYoeKvlr1oV+320U2tAeCesEum4J3L86l2GbYlX0UL8b30
         FSJOLjHYqi9IriqvtZCS5iHsD0X6O4b2JWkjD16yC/iDExSs436I+C1TRtjfBgP1XqCs
         7rVCwvBim9SQ8N/TUf4lKYq4q2xJXNomyagLtyLUhDKO89h73FZTgxrqLzyhkndd9vL5
         +fOOrMN6S51ZNsZf4NgHSq8hFUMr3gd9q112DETk+G0CLlju0krXP5j0DKQaBm29ekum
         MaYiN6S8Pz2ABfyvQZzMZ+9htO50NmNPYLcaGSss3WK0FxnxLSZLqDjG+zi9VCktDeQ8
         cxKQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1737369170; x=1737973970;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=XxJc+Gn91nAPEbZKkkYM0Lfyo+ldiMC9cjcLHUqTWxk=;
        b=lhGtKcLdGIRYiJV/bfFBWEk9vcObaYVJXsh3m2rnV7qjc2l7IfOERP3i62mn/suZyv
         7XXJPBUxwhK48Z+ZUaLesUlPAHpE5Y195CNltcqDqzW/BnxJ3Wd9zAYmtU11Y9kkIStF
         sYK3dFvU0aCiveKuCHMT7bIl/OuqASUJIqVIIwUq8eG1CdmLvuDfbKztz2tKGh3FWrNm
         67nBmqtQS3mw3lNYrjz+a91xIS/+6XCNWeYSHIMbwM1GVQ3tn4EX0R35S7beBAiOPp5O
         lMrwjWkghcupRH26bmksfclsXNduZwKtwAG0f5qDjlxt7jcVWhwIH2wHrBHL3AoxBEku
         3PsQ==
X-Forwarded-Encrypted: i=1; AJvYcCW6nHAsaXw0aXwzPl11Qu3q8wT0OG6aXjbe8E4Zmp3eq74dxQC2PwMQAPRpxKMmwD25POIKh++4dejvNi1v57jSKw==@vger.kernel.org
X-Gm-Message-State: AOJu0Yz5hnX4V0C/QAwxm12CEWusCERr7ipMejbe1MLMwOfLEEreGiOd
	kYsEJC2WFnK+cZ3tXPc6KPKkybu+jw7G/ai7gKMTNZpTa+oWijzuWn19CcRx5qw=
X-Gm-Gg: ASbGncvYc0udwFHPIsmNbYLhhp7cF6UClp2US0zVBO+xU3AZk8YnAeQkOo9jb2Ct6uf
	DTLPM9c5Onldtyn0o7WFZe83PQxgFxpKyk3NuKUpC+v6iH7VoalrlRc1Z1eFE3Q7TdQ6CGN1gLp
	SR3VscNlbZPa24wbnPEhl+fSPiVfDPqkvC5tEZvXGRMrwIRzxFiIQGB+Tw0j2ZdbpndNwWKe78b
	O73U111zK4V5wmHC3Z6yEGGjvkHCUPrdimDGaJEyRe9tKipcT03SHT9W1n432v09RM0ruWcNpg=
X-Google-Smtp-Source: AGHT+IFcY0UGosBx3D8sfwLbECoAj4d1l3/mXNOd5C9+XD97kTzyQQ2O5y6u6GWa2aOYIx6spIaEJA==
X-Received: by 2002:a05:600c:468d:b0:436:4708:9fb6 with SMTP id 5b1f17b1804b1-43891437546mr104492065e9.20.1737369169823;
        Mon, 20 Jan 2025 02:32:49 -0800 (PST)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-43890408523sm133098145e9.8.2025.01.20.02.32.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 20 Jan 2025 02:32:49 -0800 (PST)
Date: Mon, 20 Jan 2025 13:32:46 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Claudiu Beznea <claudiu.beznea@tuxon.dev>
Cc: Biju Das <biju.das.jz@bp.renesas.com>,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>, Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>, linux-sound@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org, linux-kernel@vger.kernel.org,
	kernel-janitors@vger.kernel.org
Subject: Re: [PATCH] ASoC: renesas: rz-ssi: Clean up on error in probe()
Message-ID: <b8a7f1d6-be84-4387-9ef9-b6ec91da69f7@stanley.mountain>
References: <14864a18-c256-4c7d-b064-ba1400bed894@stanley.mountain>
 <8ff70298-8a9c-4228-b064-f46ec81f6d15@tuxon.dev>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <8ff70298-8a9c-4228-b064-f46ec81f6d15@tuxon.dev>

On Fri, Jan 17, 2025 at 01:51:55PM +0200, Claudiu Beznea wrote:
> > -			if (ret < 0)
> > -				return dev_err_probe(dev, ret,
> > -						"irq request error (dma_rx)\n");
> > +			if (ret < 0) {
> > +				dev_err_probe(dev, ret,
> > +					      "irq request error (dma_rx)\n");
> > +				goto err_release_dma_chs;
> > +			}
> >  		}
> >  	}
> 
> The code block ending here is entered only if !rz_ssi_is_dma_enabled(). If
> that is true there are no DMA channel to be released. Maybe better would be
> to move this code block on the failure path of the rz_ssi_dma_request() as
> also proposed here:
> https://lore.kernel.org/all/CAMuHMdU+_NuLp2FuwwcLfJRe2ssMtp=z7fqcsANgYfFehTNJGg@mail.gmail.com/
> 

Aw crud...  Thanks for the review.  Cut and pasting the code seems like
probably the right answer.  It's not a hard patch to write, but I don't
have the hardware so I can't test it.  The existing ordering feels tricky
enough that there is probably a reason for it which I just can't see off
the top of my head...

Let me think about this some more.

regards,
dan carpenter

