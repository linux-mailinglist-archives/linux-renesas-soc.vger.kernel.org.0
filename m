Return-Path: <linux-renesas-soc+bounces-10650-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 89F8E9D4968
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 21 Nov 2024 10:01:46 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 360DD1F21741
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 21 Nov 2024 09:01:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7296F1C9ECE;
	Thu, 21 Nov 2024 09:01:43 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6937F82890;
	Thu, 21 Nov 2024 09:01:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732179703; cv=none; b=WjMEpzUdJp6DEGR3cWVRkdP729SirB9A8fUnRhda332/2cMARoTVydkPioHGz+yXjmh/H8hLXOu887++TDUbizLGWGfuk7Gb9EDQRFi7cYYJ4JMrUbHMv6YeNMMujK5+CstFWvYHKg05d3u2652Vz1c5NhMOuswJE7QBP+LA1m0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732179703; c=relaxed/simple;
	bh=ZURrTHdzAhCGJZENWDSFSepJLViq2++ZAo4vaz/x1+Q=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Fq/tvmhM8d6SlxSudoIQtf5Eu8OZnTRTLZ7xFkqQ3f4eH/6zDWdNnzFlNhBtf8LnDOFGq8NopS5uUOxb47fMAMmpwKf+nTNyYfu5laE+/5weURheoHD8hE3+6laC4BIqbFu85AbhzjeLEV1rU9V5HXM+iHRNkuqHKw+LbwstByc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 727DF1480;
	Thu, 21 Nov 2024 01:02:09 -0800 (PST)
Received: from [10.163.48.156] (unknown [10.163.48.156])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id E01513F66E;
	Thu, 21 Nov 2024 01:01:36 -0800 (PST)
Message-ID: <6e6c57da-6e11-49b2-a6c4-fb9478055314@arm.com>
Date: Thu, 21 Nov 2024 14:31:26 +0530
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] ARM: smp: Fix IPI alignment in /proc/interrupts
To: Geert Uytterhoeven <geert+renesas@glider.be>,
 Russell King <linux@armlinux.org.uk>, Thomas Gleixner <tglx@linutronix.de>
Cc: linux-arm-kernel@lists.infradead.org, linux-renesas-soc@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <96f61cafee969c59796ac06c1410195fa0f1ba0b.1732096154.git.geert+renesas@glider.be>
Content-Language: en-US
From: Anshuman Khandual <anshuman.khandual@arm.com>
In-Reply-To: <96f61cafee969c59796ac06c1410195fa0f1ba0b.1732096154.git.geert+renesas@glider.be>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit



On 11/20/24 15:24, Geert Uytterhoeven wrote:
> On a system with less than 1000 interrupts, prec = 3, causing a
> misalignment for the IPI interrupts.  E.g. on Koelsch (R-Car M2-W):
> 
>     200:          0          0  gpio-rcar   6 Edge      SW36
>     IPI0:          0          0  CPU wakeup interrupts
>     IPI1:          0          0  Timer broadcast interrupts
>     IPI2:       1701       2844  Rescheduling interrupts
>     IPI3:      10338      21181  Function call interrupts
>     IPI4:          0          0  CPU stop interrupts
>     IPI5:        651        825  IRQ work interrupts
>     IPI6:          0          0  completion interrupts
>     Err:          0
> 
> Fix this by adopting the same solution as used on arm64.
> 
> Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
> ---
>  arch/arm/kernel/smp.c | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
> 
> diff --git a/arch/arm/kernel/smp.c b/arch/arm/kernel/smp.c
> index 3431c0553f45cdf5..50999886a8b5cbab 100644
> --- a/arch/arm/kernel/smp.c
> +++ b/arch/arm/kernel/smp.c
> @@ -551,7 +551,8 @@ void show_ipi_list(struct seq_file *p, int prec)
>  		if (!ipi_desc[i])
>  			continue;
>  
> -		seq_printf(p, "%*s%u: ", prec - 1, "IPI", i);
> +		seq_printf(p, "%*s%u:%s", prec - 1, "IPI", i,
> +			   prec >= 4 ? " " : "");
>  
>  		for_each_online_cpu(cpu)
>  			seq_printf(p, "%10u ", irq_desc_kstat_cpu(ipi_desc[i], cpu));

LGTM

Reviewed-by: Anshuman Khandual <anshuman.khandual@arm.com>

