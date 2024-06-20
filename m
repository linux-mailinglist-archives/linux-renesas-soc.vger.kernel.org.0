Return-Path: <linux-renesas-soc+bounces-6576-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 490B9910E19
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 20 Jun 2024 19:08:25 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id A44C6B20B11
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 20 Jun 2024 17:08:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 485C11B3731;
	Thu, 20 Jun 2024 17:08:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="XCn0OSxM"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1F61E1B29D2;
	Thu, 20 Jun 2024 17:08:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718903299; cv=none; b=OdLm/DmeWzgnD7RrpKDjGyBVzs/capYKU2WNIbYAcdexzv7/hIUHFq82GEuTbL3LSCMzgVNe5td968lcr59+FAW+3uC4YzMfAG6KPC4UmBwQKRiqwpPiv1MwmWJq83ndyM+I5z+mtxx1F9z8GD0qqpTjYo/XozPoOiwLcJyu70s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718903299; c=relaxed/simple;
	bh=ieaYsa8+Pk1vJ96mymMgLGoYvBfPEfnzWTmT1OTFF8M=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=BoU1Rmj4E8B7RvrmdKyShFvbQmMTwduBWQGhGNg+EfsWtsQWdRL1q3pCvPL1Ju2ybWPSZzE/RfyYGE3QYcNzprzgm5Uo24wfIctDDQ6xHJcvJ963hifHuY1pjyHe7lQxx+iEd7EGjczvY3UOUcHiZVJcWPXF3CLVMN3bhUqlqMg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=XCn0OSxM; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1157DC2BD10;
	Thu, 20 Jun 2024 17:08:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1718903298;
	bh=ieaYsa8+Pk1vJ96mymMgLGoYvBfPEfnzWTmT1OTFF8M=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=XCn0OSxMmhRZx5Gcxqh+lqCSalIxuycwhH8b/bjNaCBHYiJMTubeP7bfrOqXCNCeE
	 seW1P3feUTqbqnuc1uzUlBsQ/6i1vhZewhLS3iL/N0HRJmk4MVoJak2+wqUbUxU4/+
	 NOU9tqugR2tIQLkp9AkivYFw+t9gN3UKvl8UFOM//Zlvq7oDeLSKx2ELEkvvxRKwkW
	 kGMYzW5caU8nqSajMHE57zVhpxLp7WxtuSa13EitGMV9Y15YgvF2sMUVXgkmD/pjXM
	 IqUFw6XE5p0PLML2t56vxCkDHjsAcIscT4l85cs6Y/UtZoHHGLGvfVco9uveZXF/F1
	 H3cg3JOMWOoRw==
Date: Thu, 20 Jun 2024 18:08:14 +0100
From: Lee Jones <lee@kernel.org>
To: Geert Uytterhoeven <geert+renesas@glider.be>
Cc: Wolfram Sang <wsa+renesas@sang-engineering.com>,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>,
	Ulf Hansson <ulf.hansson@linaro.org>, Arnd Bergmann <arnd@arndb.de>,
	Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>,
	linux-mmc@vger.kernel.org, linux-renesas-soc@vger.kernel.org
Subject: Re: [PATCH 1/2] mfd: tmio: Remove obsolete .set_clk_div() callback
Message-ID: <20240620170814.GW3029315@google.com>
References: <cover.1718897545.git.geert+renesas@glider.be>
 <e0fa98f138a7b2836128178f8b3a757978517307.1718897545.git.geert+renesas@glider.be>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <e0fa98f138a7b2836128178f8b3a757978517307.1718897545.git.geert+renesas@glider.be>

On Thu, 20 Jun 2024, Geert Uytterhoeven wrote:

> Commit bef64d2908e825c5 ("mmc: remove tmio_mmc driver") removed the last
> user of the .set_clk_div() callback in the tmio_mmc_data structure.
> 
> Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
> ---
>  include/linux/mfd/tmio.h | 1 -
>  1 file changed, 1 deletion(-)
> 
> diff --git a/include/linux/mfd/tmio.h b/include/linux/mfd/tmio.h
> index eace8ea6cda05a3d..aca74ac1ff69e6f7 100644
> --- a/include/linux/mfd/tmio.h
> +++ b/include/linux/mfd/tmio.h
> @@ -101,7 +101,6 @@ struct tmio_mmc_data {
>  	unsigned int			max_blk_count;
>  	unsigned short			max_segs;
>  	void (*set_pwr)(struct platform_device *host, int state);
> -	void (*set_clk_div)(struct platform_device *host, int state);

Any ramifications for just hoovering this up?

-- 
Lee Jones [李琼斯]

