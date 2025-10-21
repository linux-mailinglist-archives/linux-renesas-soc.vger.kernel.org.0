Return-Path: <linux-renesas-soc+bounces-23377-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [142.0.200.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 29D58BF5F43
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 21 Oct 2025 13:08:56 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id D1D5E4E153F
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 21 Oct 2025 11:08:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 18F5D253B52;
	Tue, 21 Oct 2025 11:08:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="igUgvHFj"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E4AE4189F20;
	Tue, 21 Oct 2025 11:08:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761044933; cv=none; b=PVg1bEGFWtZT3REs7uxrvW78TwAzs1rqGFuXTf5T/7naVhfogDJbXQHj64k77ButxlKKfXPIox/H9oEtriomdhLMJkLK5y4OF/gVSvRLteBYDxss3MQ4ZWfA4TAjVBfs0vt6602UR/D8WexZYHEghSLjAWc3T4lP+Wp70SToiP0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761044933; c=relaxed/simple;
	bh=EBDQiTKaAEBRPfvCwExdUce+DP45FiyywQJSr5JKIwE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=GWq8oOjsZcHjuFXFyQTHBqqqTY2fye93lZPHzuXPvAl22lubKeFW+b3mi4PFvKT4XYFv6ikTZTMo3X5eFKDGInfkD+RHrTfFU1s+xgkgzjL0DtnQQsDwAW2jI3xNfVV7lsWSJ4xzMD0jP67b+MH797PoJcE1Gn5Iczcn8rOC6MY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=igUgvHFj; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E269EC4CEF1;
	Tue, 21 Oct 2025 11:08:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1761044931;
	bh=EBDQiTKaAEBRPfvCwExdUce+DP45FiyywQJSr5JKIwE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=igUgvHFjcL7vbaC5BvDTu0V2LoWB/fDzQlcIcLdx3E142kEz9RZDAxygfY7PNZ7Ir
	 hBFjESFOqitCULjXnt4u3kNZxnliiJ5xE0gTCtAj5n7MjAy5BYtQIaytmyJTYS0WTj
	 aKc0RhVN/pxBa5Yjt4EOSMBXGOPKt+clhR5qa4uuNeQAWolp+AX32j40HS/v2ZYF/u
	 C2z2LG0ib4v6GoZHjd1aZkqc45GZXhh76ZFgl4VHBWgascK2sHdQZB/GKt2b8oECVw
	 kLXclYB5f3Dtc6qKa4aGNiGKXqEsjSkQHGVKkSK2uD4fztf82wCt6POJ79GdRZPKkB
	 qP5xszOY068sw==
Date: Tue, 21 Oct 2025 12:08:47 +0100
From: Lee Jones <lee@kernel.org>
To: Wolfram Sang <wsa+renesas@sang-engineering.com>
Cc: linux-renesas-soc@vger.kernel.org, linux-kernel@vger.kernel.org,
	Peter Rosin <peda@axentia.se>,
	Bartosz Golaszewski <bgolaszewski@baylibre.com>,
	Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
	Support Opensource <support.opensource@diasemi.com>
Subject: Re: [PATCH v2] mfd: da9063: occupy second I2C address, too
Message-ID: <20251021110847.GG475031@google.com>
References: <20251007154016.25896-2-wsa+renesas@sang-engineering.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20251007154016.25896-2-wsa+renesas@sang-engineering.com>

On Tue, 07 Oct 2025, Wolfram Sang wrote:

> The second address can be used as a shortcut to access register pages
> 2+3. The driver does not use this feature yet. The second address should
> still be marked as used, otherwise userspace could interfere with the
> driver.

Perfect.  Thanks for updating.

> Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
> Reviewed-by: Peter Rosin <peda@axentia.se>
> Reviewed-by: Bartosz Golaszewski <bgolaszewski@baylibre.com>
> Reviewed-by: Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>
> ---
> 
> Change since v1: reworded commit message
> 
>  drivers/mfd/da9063-i2c.c | 2 ++
>  1 file changed, 2 insertions(+)
> 
> diff --git a/drivers/mfd/da9063-i2c.c b/drivers/mfd/da9063-i2c.c
> index 1ec9ab56442d..12f3dd927aba 100644
> --- a/drivers/mfd/da9063-i2c.c
> +++ b/drivers/mfd/da9063-i2c.c
> @@ -469,6 +469,8 @@ static int da9063_i2c_probe(struct i2c_client *i2c)
>  		}
>  	}
>  
> +	devm_i2c_new_dummy_device(&i2c->dev, i2c->adapter, i2c->addr + 1);

I still think we need a simple comment to explain why we're obtaining
and seemingly not using the address.


-- 
Lee Jones [李琼斯]

