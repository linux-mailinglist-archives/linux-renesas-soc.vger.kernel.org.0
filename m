Return-Path: <linux-renesas-soc+bounces-18295-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 5ECCCAD8F27
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 13 Jun 2025 16:17:11 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 6BFB13A131E
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 13 Jun 2025 14:11:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AE10B2E11A5;
	Fri, 13 Jun 2025 14:06:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ZB1rhHEH"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 887E62E11A2
	for <linux-renesas-soc@vger.kernel.org>; Fri, 13 Jun 2025 14:06:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749823615; cv=none; b=p/GToXxmmueEN4J8RaOWUHgbjerKUTZqeYjcL0V23D8CDjfxNLhQgxUvH59fbvZJam5QEKhtuiji78f2467SaR8wpcsKtyej1IzKlsB2ISukqXNcmgoto6+A1lETf3CEaR5ftbqYB4Y08jOCs1MT1v1WEHy4ff7ZMgav0luFwaw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749823615; c=relaxed/simple;
	bh=MJ3pg050ckkom2IWzbamy8Bp/18IoT/whEp03ZuhZFM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=FCdFIgynDTPhOWfe1NoCuIaKAwL4Bnv+ROPQCIMo4TWmzjd2vuC7PaVAZrHqNRqHCSeTyo5eojAFec/nNFvGD71AHZ2G9oNWGnNHmPtSpOf3yy6XyjqEPSfaEDHNZxwUAnwAqp9F1sArRmRtR6hkgk7kDW1h9OkkTLI4igCc2LE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ZB1rhHEH; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DE581C4CEE3;
	Fri, 13 Jun 2025 14:06:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1749823615;
	bh=MJ3pg050ckkom2IWzbamy8Bp/18IoT/whEp03ZuhZFM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=ZB1rhHEH8qpMFE1rdZhXBcdGhiw62Jho09jSdeg0tBHxSeWzUc1MCNNQYOmij70D7
	 pwZydXDpBNNmOG8L7fxHt//jk9acy5oQE/B9qmjNnPxaHKDC3K5phUV8iua2szZsoz
	 8xsa00t4oCsSgbxyeUrzylG1yPfgsVBQbQi2nzZ6eTONNlu6Jq6gtOUO0pvXPp8xx/
	 JJLsD2ONxpuqZWwKqaYnylqetueTU7ZLAG2XafdwG6+p5HXbVGc3sWBYjImDTNyvUS
	 0kyTvWX8ySZbSElMF9fljT3jjcd90d82WSNpvSF9CHGC8WOxsvO2a++zqtYcSK+/DS
	 XOm1xpZx2khaw==
Date: Fri, 13 Jun 2025 15:06:51 +0100
From: Lee Jones <lee@kernel.org>
To: Wolfram Sang <wsa+renesas@sang-engineering.com>
Cc: linux-renesas-soc@vger.kernel.org, Peter Rosin <peda@axentia.se>,
	Bartosz Golaszewski <bgolaszewski@baylibre.com>,
	Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
	Support Opensource <support.opensource@diasemi.com>
Subject: Re: [PATCH] mfd: da9063: occupy second I2C address, too
Message-ID: <20250613140651.GE897353@google.com>
References: <20250601112546.2136-2-wsa+renesas@sang-engineering.com>
 <20250613140603.GD897353@google.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250613140603.GD897353@google.com>

On Fri, 13 Jun 2025, Lee Jones wrote:

> On Sun, 01 Jun 2025, Wolfram Sang wrote:
> 
> > Even though we don't use it yet, we should mark the second I2C address
> > this device is listening to as used.
> 
> Could we have a bit more information please?
> 
> What happens if we don't do this?
> 
> > Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
> > Reviewed-by: Peter Rosin <peda@axentia.se>
> > Reviewed-by: Bartosz Golaszewski <bgolaszewski@baylibre.com>
> > Reviewed-by: Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>
> > ---
> > 
> > This patch could not be applied 6 years ago because of a missing
> > dependency. It has arrived meanwhile ;)

Link to dep for ease of review (and for the nosey).  =:-)

> >  drivers/mfd/da9063-i2c.c | 2 ++
> >  1 file changed, 2 insertions(+)
> > 
> > diff --git a/drivers/mfd/da9063-i2c.c b/drivers/mfd/da9063-i2c.c
> > index c6235cd0dbdc..c74702cf8a77 100644
> > --- a/drivers/mfd/da9063-i2c.c
> > +++ b/drivers/mfd/da9063-i2c.c
> > @@ -454,6 +454,8 @@ static int da9063_i2c_probe(struct i2c_client *i2c)
> >  		}
> >  	}
> 
> Maybe a comment for future readers wondering why we're obtaining this
> unused I2C address.  It may prevent others from removing it as
> superfluous.
> 
> > +	devm_i2c_new_dummy_device(&i2c->dev, i2c->adapter, i2c->addr + 1);
> > +
> >  	return da9063_device_init(da9063, i2c->irq);
> >  }
> >  
> > -- 
> > 2.47.2
> > 
> 
> -- 
> Lee Jones [李琼斯]

-- 
Lee Jones [李琼斯]

