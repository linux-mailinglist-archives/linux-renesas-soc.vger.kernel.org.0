Return-Path: <linux-renesas-soc+bounces-22152-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 8B2E3B91CDD
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 22 Sep 2025 16:53:12 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 8CC01189A2F7
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 22 Sep 2025 14:53:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 315742D29CA;
	Mon, 22 Sep 2025 14:53:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b="USSraptt";
	dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b="oxMbV+e3"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mout-p-202.mailbox.org (mout-p-202.mailbox.org [80.241.56.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5A8922D24BA;
	Mon, 22 Sep 2025 14:53:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=80.241.56.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758552788; cv=none; b=q2K6PlRlN99jkQCR4XnKiEh+lu1bQOpy+F4nK+Dp7gu/CI1kGyFE9YNsGA7r5TdSG92TmPSnB1MnOeDHUk7EkCxdLagtFGttbkMAzI9a8WFMCirOpubtwUgTC8YgQEY2Q9A6e2V45wPzdY18yq56PhZQO8oEVLnhUfbbmeF0c5I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758552788; c=relaxed/simple;
	bh=GMCPkEYEEsTJqfE/6r6Ghq6SNiQAO0BjDhL0faMM54Y=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=JP+l9y1oQ6Hy+SkRZSVvF6GkIhchvN3tL42RgxiSrODWWqnUx4UycnL5L/mxDol3tYZduMMFhw6n95R3QmIk6ElmrAugGFxA2ti8qjUkGYROfT7CAQL5rLGhDmVuYna9jCW/r8F5+vYJgUebNkGOvJi9FnF6aFqpxPMslm4rRVg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mailbox.org; spf=pass smtp.mailfrom=mailbox.org; dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b=USSraptt; dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b=oxMbV+e3; arc=none smtp.client-ip=80.241.56.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mailbox.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mailbox.org
Received: from smtp1.mailbox.org (smtp1.mailbox.org [10.196.197.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mout-p-202.mailbox.org (Postfix) with ESMTPS id 4cVmLm2gGzz9sxm;
	Mon, 22 Sep 2025 16:53:04 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org; s=mail20150812;
	t=1758552784;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=ia3X6LOqGAChyLZnv60EY8Niqy3mRn+utTuNAth8QQo=;
	b=USSraptt5e3eqBAphtPEd4M/7yEVRQtJaikPRDFvyR084GcW63O9xJzdM903Rm/oDcQT24
	/KpJ/kuJw3weKyoiXPHqnwJLkhvIEdu16U/E3T1MaSgOZ2rFrAdZtIW1b7BPE4DiG4aKP3
	lcMBqgPVbqkOUujlLhuwY5e8VMY3aPU7KMrVaddouA0bAeuSHhnYaCA4NHBqdgboubQ/Th
	FGIKEKHfoFD+fAvAAAV/7av0dMz6ZkO5b9zKnwt54gL/37g1s56bZyghgqxv4FwcTkPyDP
	655nt34aNkOzuTxxsXhNzLMVg9hduaif7SbZhOv0TiEk3tD70eQQNP4uofvh2w==
Message-ID: <a7bc3998-72d8-4d13-b0c1-05c5c44795b4@mailbox.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org; s=mail20150812;
	t=1758552782;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=ia3X6LOqGAChyLZnv60EY8Niqy3mRn+utTuNAth8QQo=;
	b=oxMbV+e3sDebK83lCT2bvdqP0N1KrLcaIq6WTcZJtiGTyHnuNQlTHXZKz4xGlMM7GbVRoV
	NDwbqPzR4Yj3tMWyIbLBFnar8PohdAdpJV+AC9f0Dy0A9qEivgXirgQjXOXSkl+PwFxX+s
	csZw91CSOrBsMjeeVB6bp4lrDL7S16vfVFRqq7u4u9xZtgSl0Gr6G8jUjM/9tgM0FbhIZG
	LdTET0ZjwzI1D6swb5vP7V4ENKzGBnLoH0upy0MCzfPAOAxgYjQz+JUKywxsheVkpe0tlQ
	AdwzZR0hpUm8sHtNpFqTQLTCdNPEPqf1yLEWorFiDP/tGlXnfwXnUP0/1Bb76Q==
Date: Mon, 22 Sep 2025 16:53:00 +0200
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Subject: Re: [PATCH] clk: renesas: cpg-mssr: Add missing 1ms delay into reset
 toggle callback
To: Geert Uytterhoeven <geert@linux-m68k.org>,
 Marek Vasut <marek.vasut+renesas@mailbox.org>
Cc: linux-clk@vger.kernel.org, Michael Turquette <mturquette@baylibre.com>,
 Stephen Boyd <sboyd@kernel.org>, linux-renesas-soc@vger.kernel.org
References: <20250918030552.331389-1-marek.vasut+renesas@mailbox.org>
 <CAMuHMdWgaU9MvR+Aa4VGHJz+U_ksyP2w6+TmuEYPrGFEOtNg5g@mail.gmail.com>
Content-Language: en-US
From: Marek Vasut <marek.vasut@mailbox.org>
In-Reply-To: <CAMuHMdWgaU9MvR+Aa4VGHJz+U_ksyP2w6+TmuEYPrGFEOtNg5g@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-MBO-RS-META: 1mdhnc95ckfgh3har8i1mwtnt3m7if7d
X-MBO-RS-ID: 0de83875d2785eba642

On 9/22/25 1:37 PM, Geert Uytterhoeven wrote:

Hello Geert,

>> --- a/drivers/clk/renesas/renesas-cpg-mssr.c
>> +++ b/drivers/clk/renesas/renesas-cpg-mssr.c
>> @@ -689,8 +689,15 @@ static int cpg_mssr_reset(struct reset_controller_dev *rcdev,
>>          /* Reset module */
>>          writel(bitmask, priv->pub.base0 + priv->reset_regs[reg]);
>>
>> -       /* Wait for at least one cycle of the RCLK clock (@ ca. 32 kHz) */
>> -       udelay(35);
>> +       /*
>> +        * On R-Car Gen4, delay after SRCR has been written is 1ms.
>> +        * On older SoCs, delay after SRCR has been written is 35us
>> +        * (one cycle of the RCLK clock @ cca. 32 kHz).
> 
> s/cca/ca/ (I can fix that myself).

cca - circa , it seems all of c., ca., ca, cca are valid.

>> +        */
>> +       if (priv->reg_layout == CLK_REG_LAYOUT_RCAR_GEN4)
>> +               usleep_range(1000, 2000);
>> +       else
>> +               usleep_range(35, 1000);
>>
>>          /* Release module from reset state */
>>          writel(bitmask, priv->pub.base0 + priv->reset_clear_regs[reg]);
> 
> LGTM, but wait for more feedback?
> Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
Thank you. I wait.

