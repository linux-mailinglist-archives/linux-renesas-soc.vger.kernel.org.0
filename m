Return-Path: <linux-renesas-soc+bounces-21762-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 4C6B8B52C56
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 11 Sep 2025 10:57:24 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 8928C1BC5E81
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 11 Sep 2025 08:57:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C7863286D71;
	Thu, 11 Sep 2025 08:57:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="KsxtB+cs"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9D9EB329F09;
	Thu, 11 Sep 2025 08:57:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757581040; cv=none; b=I4zAPHRP8BTNDUWFj67Txp9XBm7HvXozicqviWFIEBL9czatHrQeGEon0v3yVz+TCbX1BY9G4NvGe1J3n9pStBa+eaXP0U0mNn6v16ooMK5DDhgTt1HjrG9t5urNaGmmbwbK/RFKZB0fYn5nFxxRbDD5mzKYmDu6TRCmKdDkioE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757581040; c=relaxed/simple;
	bh=CRQHC2Gc46PMhBLq4fUUb85mBh2xnJdE8k44HoBWqog=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Rt2UbFqvToqYF4atw1q3YBsqCZHQ++DOkAC+qSfOqclFscJc6CT/aqj+D4XTDc5mJZaeIH2jq9h6X4o87C2gDhbiy8/kcpxri6laPPjLGqAmpbmJGBzjnxqWdT02IstGzztBIY9AQwL/+3vxmeW+jDn3kAOMoKijanDoEu3Xhi8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=KsxtB+cs; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9BE34C4CEFE;
	Thu, 11 Sep 2025 08:57:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1757581038;
	bh=CRQHC2Gc46PMhBLq4fUUb85mBh2xnJdE8k44HoBWqog=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=KsxtB+csZTkikUA9tjlfFS8xla5wCiJeMCgdhz9h+DImbphRq1yf0sbGYEg99Kmgj
	 0AlH+woJqfm3qFQkorKKHJRHCTv/eMie7g2LJr5hqFk0Vvftp5xndK0KHFK81zghU0
	 3atjSAWmrKG0GzkCVrlbA5sfLi3ROG24xLNXecKE9P7qfExqfmM/lASuXF6siGpROK
	 zI+n6zgQJVWli/kn23Rqy8Lyhc3gkTEmNB6kWAorIcLLLKUfWivlBrKAlCcLJgzWu0
	 eB1HetddJhoO0egjH4Nq7xixS/mVUohlsj1fI6u95LRGihQMmy2z8CkLitqGvxzzhY
	 WHxBS9MV2ZXsw==
Message-ID: <6018d919-be3f-4f12-a7e1-3128b895cad7@kernel.org>
Date: Thu, 11 Sep 2025 09:57:15 +0100
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] nvmem: rcar-efuse: add missing MODULE_DEVICE_TABLE
To: Cosmin Tanislav <cosmin-gabriel.tanislav.xa@renesas.com>
Cc: Srinivas Kandagatla <srini@kernel.org>,
 Geert Uytterhoeven <geert+renesas@glider.be>,
 Magnus Damm <magnus.damm@gmail.com>, Arnd Bergmann <arnd@arndb.de>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>,
 linux-renesas-soc@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20250910175415.8698-1-cosmin-gabriel.tanislav.xa@renesas.com>
Content-Language: en-US
From: Srinivas Kandagatla <srini@kernel.org>
In-Reply-To: <20250910175415.8698-1-cosmin-gabriel.tanislav.xa@renesas.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit



On 9/10/25 6:54 PM, Cosmin Tanislav wrote:
> The nvmem-rcar-efuse driver can be compiled as a module. Add missing
> MODULE_DEVICE_TABLE so it can be matched by modalias and automatically
> loaded by udev.
> 
> Fixes: 1530b923a514 ("nvmem: Add R-Car E-FUSE driver")
Missing Stable tag.

--srini
> Signed-off-by: Cosmin Tanislav <cosmin-gabriel.tanislav.xa@renesas.com>
> ---
>  drivers/nvmem/rcar-efuse.c | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/drivers/nvmem/rcar-efuse.c b/drivers/nvmem/rcar-efuse.c
> index f24bdb9cb5a7..d9a96a1d59c8 100644
> --- a/drivers/nvmem/rcar-efuse.c
> +++ b/drivers/nvmem/rcar-efuse.c
> @@ -127,6 +127,7 @@ static const struct of_device_id rcar_fuse_match[] = {
>  	{ .compatible = "renesas,r8a779h0-otp", .data = &rcar_fuse_v4m },
>  	{ /* sentinel */ }
>  };
> +MODULE_DEVICE_TABLE(of, rcar_fuse_match);
>  
>  static struct platform_driver rcar_fuse_driver = {
>  	.probe = rcar_fuse_probe,


