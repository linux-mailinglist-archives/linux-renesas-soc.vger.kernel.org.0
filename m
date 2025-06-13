Return-Path: <linux-renesas-soc+bounces-18294-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 3073FAD8ED2
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 13 Jun 2025 16:11:04 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id CFA9B7AFE45
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 13 Jun 2025 14:09:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 64808230D14;
	Fri, 13 Jun 2025 14:06:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="AqoCFj/B"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3F908111BF
	for <linux-renesas-soc@vger.kernel.org>; Fri, 13 Jun 2025 14:06:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749823568; cv=none; b=qQsxmhKSOnZ2FUZrda3LYqPF2sRfpoWoDIpMxTRfGHDMqKuho3k23ohQ+xMpneVARVXd7sT//9W4hepMh+10i2riWvZQru02+GSyHh9TB6UXQXpklzhRUx7oywYF0Te8dPAuLQgpzjevc2ucl5xnXqV6lYaqaxVXaWjCsxkDOag=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749823568; c=relaxed/simple;
	bh=a/JzAVQ96iMQwHQo+45luBv5brJfZNxsR580I0t4r3g=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=o2a/e7/JkbqHd2xzGQyXwCEOCpr9xiCHh0irfX0u5pM9kn/TdEhyNvF7tK4m6e9zgYjZZST2biXY53lOLZxNa1uKiPDq83jVPQbtoonFqchG8twGp234CAboTWS/f3WR9boK+j8sjlrHcy2PQ61K6NOnOy+qfdW/aB8VZWjEpm0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=AqoCFj/B; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 66C05C4CEE3;
	Fri, 13 Jun 2025 14:06:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1749823567;
	bh=a/JzAVQ96iMQwHQo+45luBv5brJfZNxsR580I0t4r3g=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=AqoCFj/B+u44UfbDoWRCpsmdM9bdNkBv4+7swvMejPo6EewipKgyDeSkMwTr1KIAF
	 No6xCPRDv7fh4158L+lgiLMCiOzrjnfAaX3Q6hPjD3hN16Gvi2WiNiDKvztpg/9YpY
	 hzEaQbHQXUQ1mfMVeRaemmOIMCEOD8yuzcqRynbljAcqYqhBM4WGDFKYKn87rpS1tO
	 wQs41Mrbkjbs6GviaG6CLSEAUpft/IfrbbnD6Vh7cO2iJo3KviyNK2xWjd3ddkhDKW
	 uxdZ6LajeNEa2nDpTWeFiG21vEzxM1O2dY85WsuQENuCwccrIzTWfaUanyZgsX61KR
	 QOK8Y5Mq7dBkg==
Date: Fri, 13 Jun 2025 15:06:03 +0100
From: Lee Jones <lee@kernel.org>
To: Wolfram Sang <wsa+renesas@sang-engineering.com>
Cc: linux-renesas-soc@vger.kernel.org, Peter Rosin <peda@axentia.se>,
	Bartosz Golaszewski <bgolaszewski@baylibre.com>,
	Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
	Support Opensource <support.opensource@diasemi.com>
Subject: Re: [PATCH] mfd: da9063: occupy second I2C address, too
Message-ID: <20250613140603.GD897353@google.com>
References: <20250601112546.2136-2-wsa+renesas@sang-engineering.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250601112546.2136-2-wsa+renesas@sang-engineering.com>

On Sun, 01 Jun 2025, Wolfram Sang wrote:

> Even though we don't use it yet, we should mark the second I2C address
> this device is listening to as used.

Could we have a bit more information please?

What happens if we don't do this?

> Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
> Reviewed-by: Peter Rosin <peda@axentia.se>
> Reviewed-by: Bartosz Golaszewski <bgolaszewski@baylibre.com>
> Reviewed-by: Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>
> ---
> 
> This patch could not be applied 6 years ago because of a missing
> dependency. It has arrived meanwhile ;)
> 
>  drivers/mfd/da9063-i2c.c | 2 ++
>  1 file changed, 2 insertions(+)
> 
> diff --git a/drivers/mfd/da9063-i2c.c b/drivers/mfd/da9063-i2c.c
> index c6235cd0dbdc..c74702cf8a77 100644
> --- a/drivers/mfd/da9063-i2c.c
> +++ b/drivers/mfd/da9063-i2c.c
> @@ -454,6 +454,8 @@ static int da9063_i2c_probe(struct i2c_client *i2c)
>  		}
>  	}

Maybe a comment for future readers wondering why we're obtaining this
unused I2C address.  It may prevent others from removing it as
superfluous.

> +	devm_i2c_new_dummy_device(&i2c->dev, i2c->adapter, i2c->addr + 1);
> +
>  	return da9063_device_init(da9063, i2c->irq);
>  }
>  
> -- 
> 2.47.2
> 

-- 
Lee Jones [李琼斯]

