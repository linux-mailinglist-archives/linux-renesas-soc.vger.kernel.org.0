Return-Path: <linux-renesas-soc+bounces-26857-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 97196D249DE
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 15 Jan 2026 13:52:46 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 3AFB53013EDF
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 15 Jan 2026 12:52:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C7EB0399A73;
	Thu, 15 Jan 2026 12:52:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=huawei.com header.i=@huawei.com header.b="N4x9Fo7B"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from canpmsgout02.his.huawei.com (canpmsgout02.his.huawei.com [113.46.200.217])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A1338399A6D;
	Thu, 15 Jan 2026 12:52:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=113.46.200.217
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768481536; cv=none; b=TaTHLAV19VOA9LXIHlN3SBmwmTrL9f/S98d9gSGMYNWe3TG8ihOg0kkuSZnsQNctyFiXnWWFDdOhuah38vlV+TtJ7WSZmbI/pohRVsfpk8KpJ6tXThUklyFv4q57efZ8zPWSvwVCkcZCroePq2Eqddxtt4rTr4niqLIS5Eyu+Bk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768481536; c=relaxed/simple;
	bh=5ol9KnhGzT3si2mdDzEi5xMlHow+uimpY5xSLDiTfAE=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=IKSPZImStqp5LvGRfR0QdtVDHfZaJ0jMYNrrWaTUpYiTtIdBGEBMJWEMJzgfb/RNd7bUiwWkOj52TdEJpqS3oiEKm8O/V9wKdiuIGlwOko25tSfYbICPL5VY/mETvZlkmy3IyzkuJc3lhw1DpBIwE7B8+xLSK/5R6mmtQY2gJRI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=huawei.com; spf=pass smtp.mailfrom=huawei.com; dkim=pass (1024-bit key) header.d=huawei.com header.i=@huawei.com header.b=N4x9Fo7B; arc=none smtp.client-ip=113.46.200.217
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=huawei.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=huawei.com
dkim-signature: v=1; a=rsa-sha256; d=huawei.com; s=dkim;
	c=relaxed/relaxed; q=dns/txt;
	h=From;
	bh=KL0uB+x8yIt84TUPjO5/h7+5sOBtPXgqTdDubQjCqp4=;
	b=N4x9Fo7BkyMJr1WkVNoBqhHWd9yz4+GPOKJ4VjS6LdUalm9Ar6TfasK1IhiOZxBRqdOx6t1jD
	NLwno7Sol/7A9udOhX0HsYp5JT58lKf/qp/pA9YV6egVluPL8vGtgHodtD1NABN/cmR7XzQnGwt
	h7YWZzABKmL15BCYkVt1iSw=
Received: from mail.maildlp.com (unknown [172.19.162.197])
	by canpmsgout02.his.huawei.com (SkyGuard) with ESMTPS id 4dsN7s6YvTzcb45;
	Thu, 15 Jan 2026 20:48:25 +0800 (CST)
Received: from kwepemf200001.china.huawei.com (unknown [7.202.181.227])
	by mail.maildlp.com (Postfix) with ESMTPS id 8AFF540363;
	Thu, 15 Jan 2026 20:52:12 +0800 (CST)
Received: from [10.67.121.90] (10.67.121.90) by kwepemf200001.china.huawei.com
 (7.202.181.227) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.11; Thu, 15 Jan
 2026 20:52:12 +0800
Message-ID: <7f156aa7-c723-4580-aa82-b2f0fe6d3845@huawei.com>
Date: Thu, 15 Jan 2026 20:52:11 +0800
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] arm64: topology: Do not warn on missing AMU in
 cpuhp_topology_online()
To: Geert Uytterhoeven <geert+renesas@glider.be>, Beata Michalska
	<beata.michalska@arm.com>, Will Deacon <will@kernel.org>, Catalin Marinas
	<catalin.marinas@arm.com>
CC: <linux-arm-kernel@lists.infradead.org>,
	<linux-renesas-soc@vger.kernel.org>, <linux-kernel@vger.kernel.org>
References: <a8dbf49bfa44a6809fa4f34b918516847dc14460.1768466986.git.geert+renesas@glider.be>
From: "zhenglifeng (A)" <zhenglifeng1@huawei.com>
In-Reply-To: <a8dbf49bfa44a6809fa4f34b918516847dc14460.1768466986.git.geert+renesas@glider.be>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: kwepems200002.china.huawei.com (7.221.188.68) To
 kwepemf200001.china.huawei.com (7.202.181.227)

On 2026/1/15 16:51, Geert Uytterhoeven wrote:
> When CONFIG_CPUMASK_OFFSTACK is not enabled, and resuming from s2ram on
> Renesas R-Car H3 (big.LITTLE 4x Cortex-A57 + 4x Cortex-A53), during
> enabling of the first little core, a warning message is printed:
> 
>     AMU: CPU[4] doesn't support AMU counters
> 
> This confuses users, as during boot amu_fie_setup() does not print such
> a message, unless debugging is enabled (freq_counters_valid() prints
> "CPU%d: counters are not supported.\n" at debug level in that case).
> 
> Hence drop the warning, freq_counters_valid() has already printed a
> debug message anyway.
> 
> Fixes: 6fd9be0b7b2e957d ("arm64: topology: Handle AMU FIE setup on CPU hotplug")
> Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
> ---
>  arch/arm64/kernel/topology.c | 1 -
>  1 file changed, 1 deletion(-)
> 
> diff --git a/arch/arm64/kernel/topology.c b/arch/arm64/kernel/topology.c
> index 539b3893518281ec..3fe1faab03620e78 100644
> --- a/arch/arm64/kernel/topology.c
> +++ b/arch/arm64/kernel/topology.c
> @@ -332,7 +332,6 @@ static int cpuhp_topology_online(unsigned int cpu)
>  	 * may use different source of the freq scale.
>  	 */
>  	if (!freq_counters_valid(cpu)) {
> -		pr_warn("CPU[%u] doesn't support AMU counters\n", cpu);
>  		topology_clear_scale_freq_source(SCALE_FREQ_SOURCE_ARCH,
>  						 policy->related_cpus);
>  		cpumask_andnot(amu_fie_cpus, amu_fie_cpus, policy->related_cpus);

Thanks!

Reviewed-by: Lifeng Zheng <zhenglifeng1@huawei.com>


