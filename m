Return-Path: <linux-renesas-soc+bounces-27169-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 6BAEOlk5cGmgXAAAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-27169-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 21 Jan 2026 03:26:33 +0100
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [IPv6:2a01:60a::1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id B20A44FC02
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 21 Jan 2026 03:26:33 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id D3D4FA2A188
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 21 Jan 2026 02:24:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 80D2333D51E;
	Wed, 21 Jan 2026 02:24:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b="jOQPJIMP"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mout-p-202.mailbox.org (mout-p-202.mailbox.org [80.241.56.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BA18733C52F;
	Wed, 21 Jan 2026 02:24:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=80.241.56.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768962255; cv=none; b=u835DNwZ9mcGoSuXv7tuWvGkFf2YOgy6gam3fXWsD+jfZzuanmoq3bZoLQo0B48XZvSxUMUBBdsZ/xxEDT+tTOKJuM9r0Lc15AVoKSXn5rw8cfYhl1svFjVCd1iPM2QngFCDOOW+N+cwlXDEF2Z3sEB82niR44CwosOXk6KG5jU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768962255; c=relaxed/simple;
	bh=4GLe6D02h7Y6w9HcTTuruiGEGFiXvMgy+qOF590BKH4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=fknViHkP23yThRjtfBsGs2v9aYqJYr2cAcmdRF609aJjAi2nsGWyxT+KmQM6ImrLdHKR/2FC660x3tJ1NAFX7s6weArkVn4DLx0nEuZIuK+jJSUgEAyAyd73mWiEW//6H1bJuB5ZEuIrZtBxQTYG1Fxq0Gpl21ngAH0sWs87XaE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mailbox.org; spf=pass smtp.mailfrom=mailbox.org; dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b=jOQPJIMP; arc=none smtp.client-ip=80.241.56.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mailbox.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mailbox.org
Received: from smtp1.mailbox.org (smtp1.mailbox.org [IPv6:2001:67c:2050:b231:465::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mout-p-202.mailbox.org (Postfix) with ESMTPS id 4dwp0f4jcxz9tqS;
	Wed, 21 Jan 2026 03:24:02 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org; s=mail20150812;
	t=1768962242;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=vJ5wBBW4dXw/ENsH5JVmW0ztfH6jgeQcz+gbMP/GI14=;
	b=jOQPJIMPBVoBvtc8x8czLZBtCYWru3xpqlpI6W+AsVVgXfdkAf8g1QWgaP0KDwF62SiyW6
	UQPiAnUsbkjPQUSDYzrjcFqmOfWex5f1eAd+rs1tPPRdXHKWdYJeaDjq4PSns74kZwyrVI
	BV5vMrxWIHblNLr2jHFwwwTE4Mz9aSyrKfBgKTzX8NtjcvYvxWrz/4z3x8/lrhJgt3h7VB
	mROykv+DNSx0KTgAoJQ2lE/GrP02Iqeh+/PDtEMAlDNMrDD1unJ+KK2l1X+dUcaKXnydu6
	cEUXUBpCcix6wl93GibJGM3/vl24Cgvn80r28jcUpUxS4MfXXZqRaojTArH9aw==
Message-ID: <10de432d-b38a-4fe2-959b-d9fa4e08e6c1@mailbox.org>
Date: Wed, 21 Jan 2026 00:43:37 +0100
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Subject: Re: [PATCH v2] clk: rs9: Add clock index range check to
 rs9_of_clk_get()
To: Geert Uytterhoeven <geert+renesas@glider.be>,
 Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>
Cc: linux-clk@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <4cb63bd8b1e49407831431fbc88b218f720a74fd.1768899891.git.geert+renesas@glider.be>
Content-Language: en-US
From: Marek Vasut <marek.vasut@mailbox.org>
In-Reply-To: <4cb63bd8b1e49407831431fbc88b218f720a74fd.1768899891.git.geert+renesas@glider.be>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-MBO-RS-META: x71cwywpd7c9757rqqom4pwkqmjz6wah
X-MBO-RS-ID: 5653ca25e7f01fa4b6b
X-Spamd-Result: default: False [-0.46 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW_WITH_FAILURES(-0.50)[];
	R_DKIM_ALLOW(-0.20)[mailbox.org:s=mail20150812];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-27169-lists,linux-renesas-soc=lfdr.de];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER_MAILLIST(0.00)[];
	DMARC_POLICY_ALLOW(0.00)[mailbox.org,reject];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[mailbox.org:+];
	FROM_HAS_DN(0.00)[];
	RCPT_COUNT_FIVE(0.00)[6];
	R_SPF_SOFTFAIL(0.00)[~all:c];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[marek.vasut@mailbox.org,linux-renesas-soc@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	ASN(0.00)[asn:7979, ipnet:2a01:60a::/32, country:US];
	TAGGED_RCPT(0.00)[linux-renesas-soc,renesas];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[mailbox.org:mid,mailbox.org:dkim,glider.be:email,ams.mirrors.kernel.org:rdns,ams.mirrors.kernel.org:helo]
X-Rspamd-Queue-Id: B20A44FC02
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On 1/20/26 10:05 AM, Geert Uytterhoeven wrote:
> rs9_of_clk_get() does not validate the clock index in the passed
> DT clock specifier.  If DT specifies an incorrect and out-of-range
> index, this will access memory beyond the end of the clk_dif[] array.
> 
> Fix by this adding a range check to rs9_of_clk_get().
> 
> Fixes: 892e0ddea1aa6f70 ("clk: rs9: Add Renesas 9-series PCIe clock generator driver")
> Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
> ---
> This is v2 of "[PATCH] clk: rs9: Convert to clk_hw_onecell_data and
> of_clk_hw_onecell_get()"
> (https://lore.kernel.org/a6dce17b15d29a257d09fe0edc199a14c297f1a8.1768836042.git.geert+renesas@glider.be)
> 
> v2:
>    - Just add the missing range check; the conversion to
>      of_clk_hw_onecell_get() can be done later.
> ---
>   drivers/clk/clk-renesas-pcie.c | 3 +++
>   1 file changed, 3 insertions(+)
> 
> diff --git a/drivers/clk/clk-renesas-pcie.c b/drivers/clk/clk-renesas-pcie.c
> index aa108df12e44fb9f..1adc5365ba1a3d59 100644
> --- a/drivers/clk/clk-renesas-pcie.c
> +++ b/drivers/clk/clk-renesas-pcie.c
> @@ -277,6 +277,9 @@ rs9_of_clk_get(struct of_phandle_args *clkspec, void *data)
>   	struct rs9_driver_data *rs9 = data;
>   	unsigned int idx = clkspec->args[0];
>   
> +	if (idx >= rs9->chip_info->num_clks)

of_clk_src_onecell_get() does a pr_err("%s: invalid clock index %u\n", 
__func__, idx); on error, should this function do the same ?

> +		return ERR_PTR(-EINVAL);
> +

Thanks !

