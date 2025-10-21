Return-Path: <linux-renesas-soc+bounces-23347-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 75B5BBF44DE
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 21 Oct 2025 03:47:29 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 3031C4051B2
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 21 Oct 2025 01:47:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B6F942D838C;
	Tue, 21 Oct 2025 01:45:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="LYWtAMwa"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8EDA92D6E5C;
	Tue, 21 Oct 2025 01:45:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761011139; cv=none; b=YhUqHrO1E+B6yuw4KLJqL0m1vwIUgO4qXaqxWxVWnJexLuhW4D+5KqThLNTk30CVj3NprQ9y/6gDnCOSBm3riifK7uLW7fySG5qCfA4nc+GzO4jWtcGwfaQSKY0xWUTZdBzhxJHQe8HovO3IB68XiQpwncOd8ViGXTgT24/6r6g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761011139; c=relaxed/simple;
	bh=h31EBvV8csPhsup4AJXlixdin0clBjDe0xtnGV4uVn8=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=Fo0t/lkj7cKk5jH3yjnLUwG3WpvFCgCU+P0pIZtfUXkotWANpJ71aomwml2bZCz+5rdmOM4qwjgRI9t6T361QWIv0MLiRYP8wQQsdwQPODOswwkg2QKXJz2POmzy4wkTwsxzW1g/ZSFzbIRIXhUBDVIwb8kpxBMxs96SzOXaM4c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=LYWtAMwa; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 27B5CC4CEFB;
	Tue, 21 Oct 2025 01:45:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1761011139;
	bh=h31EBvV8csPhsup4AJXlixdin0clBjDe0xtnGV4uVn8=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=LYWtAMwaRAP5wym98g8ezvDR6ZPHEt6rN9AQDcJW/Hunj7AIjTmpHNmqMt1zikfjF
	 hWon9ZVrwPSsP4CwlErkVCDLxSUDl3Fz1XAHZCa7H2CtwuHtxiqmX+B53mleqz62fI
	 47ygV3V0Q+TJKwjQkaVVGQKMf4tslY1T4ky8nOb8M8iAwYJ/1JLmlT2ijSz/bKOKqB
	 3HmzNrLgTuUS0d7+CNeNjrwQGXWFQxFmLwr3HRvXs4/GF3b7AaFbBP8ss/ox9MzypD
	 mAqhyT1ND7yZxIMF/6dMRkNK8Uol8Ljl/rpEvSJpM/unnE87edm+HLOK4XPhVo1+SO
	 dAw2SAb7+gGew==
Date: Mon, 20 Oct 2025 18:45:37 -0700
From: Jakub Kicinski <kuba@kernel.org>
To: Vadim Fedorenko <vadim.fedorenko@linux.dev>
Cc: Jian Shen <shenjian15@huawei.com>, Salil Mehta <salil.mehta@huawei.com>,
 Jijie Shao <shaojijie@huawei.com>, Andrew Lunn <andrew+netdev@lunn.ch>,
 "David S. Miller" <davem@davemloft.net>, Eric Dumazet
 <edumazet@google.com>, Paolo Abeni <pabeni@redhat.com>, Sunil Goutham
 <sgoutham@marvell.com>, Geetha sowjanya <gakula@marvell.com>, Subbaraya
 Sundeep <sbhatta@marvell.com>, Bharat Bhushan <bbhushan2@marvell.com>,
 Tariq Toukan <tariqt@nvidia.com>, Brett Creeley <brett.creeley@amd.com>,
 Niklas =?UTF-8?B?U8O2ZGVybHVuZA==?= <niklas.soderlund@ragnatech.se>, Paul
 Barker <paul@pbarker.dev>, Yoshihiro Shimoda
 <yoshihiro.shimoda.uh@renesas.com>, linux-renesas-soc@vger.kernel.org,
 Richard Cochran <richardcochran@gmail.com>, Russell King
 <linux@armlinux.org.uk>, Vladimir Oltean <vladimir.oltean@nxp.com>, Simon
 Horman <horms@kernel.org>, Jacob Keller <jacob.e.keller@intel.com>,
 netdev@vger.kernel.org
Subject: Re: [PATCH net-next v2 1/6] octeontx2: convert to ndo_hwtstamp API
Message-ID: <20251020184537.711e3ebc@kernel.org>
In-Reply-To: <20251017182128.895687-2-vadim.fedorenko@linux.dev>
References: <20251017182128.895687-1-vadim.fedorenko@linux.dev>
	<20251017182128.895687-2-vadim.fedorenko@linux.dev>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Fri, 17 Oct 2025 18:21:23 +0000 Vadim Fedorenko wrote:
> +		if (!test_bit(CN10K_PTP_ONESTEP, &pfvf->hw.cap_flag)) {
> +			NL_SET_ERR_MSG(extack,
> +				       "One-step time stamping is not supported");
>  			return -ERANGE;
> +		}

You're adding quite a few extacks in this series.
Drivers should generally used the _MOD() flavor of the extack helpers
-- 
pw-bot: cr

