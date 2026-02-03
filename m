Return-Path: <linux-renesas-soc+bounces-27792-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 0ExDJ0iogWm3IQMAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-27792-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 03 Feb 2026 08:48:24 +0100
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 17857D5D50
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 03 Feb 2026 08:48:23 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id D692F304D15A
	for <lists+linux-renesas-soc@lfdr.de>; Tue,  3 Feb 2026 07:48:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4925A392C34;
	Tue,  3 Feb 2026 07:48:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b="STuUHT7H"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A0B5E1F3B87
	for <linux-renesas-soc@vger.kernel.org>; Tue,  3 Feb 2026 07:48:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770104893; cv=none; b=NYsQZTXzszsaOsBACu5Vn/BMzYn4WfM0rYDPulgaOk/0j8NkN/xNTEtRU0iVOR4e1t4isPzVzKtcRcSJdyczeMj8DM6JT2SOpjoSmKJF9fL10AAFyfhzm9EWSXhi26h5jZfuIeyARX+UEpmVw/UseOlK3MNXu4admWSBd5qwawQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770104893; c=relaxed/simple;
	bh=8wO4AviWFwOQrHLSpRFIAf5K1RDSwXcHOnK5qjo/P5M=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Te5nIIb3IuVQrbDMqQqLTtApBqcDKM16Vgp1bBkDZp9ItWg9LLb/ZYF9El0NOiShpOYkqGHvzrhvvMnEEuWRWxq+Mz5aqopm9xvfNWZOy4quIh3k6qbrM9oei4W/hd5t3MM05penpn+KSIt26UWfRAx/SxZBkwnyxRYs5nNbRvU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev; spf=pass smtp.mailfrom=tuxon.dev; dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b=STuUHT7H; arc=none smtp.client-ip=209.85.128.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=tuxon.dev
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-4801d7c72a5so41450065e9.0
        for <linux-renesas-soc@vger.kernel.org>; Mon, 02 Feb 2026 23:48:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tuxon.dev; s=google; t=1770104889; x=1770709689; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=w4Fa42+s21p5WnV6bQFuaoXKffvstj50qKY5S721GgI=;
        b=STuUHT7HFfoTTmXbSb2gFKQJfL/TSArrmPfAL0VIwFIvJGfnURrNYbkfraG3EqjG7n
         Ggcu1qYaRY3V+itFmccGK8vdRjFfhrwdxQom5B7bxsJJAqM9VsE3S1K20UNthQGOxvrQ
         ykPo9H9jUyp+jmeCLLn3rInXUawrKOopTBEUZ8YZ2syDQkmw8QoiYRUdZwwL/cGKBtFZ
         4Ep4tI8g7zX7Zvzf75ZZ8wx/kWjE1Cd3ayPQFADytvSOt5b5e22GOoGLKLzuH81HXPRG
         n4dTa1ovdAIP/dzG19gYDZzRvjKJvNp6TXjN4Eq1LWZ70kJwdMZbIxXw6Muma2ifERVt
         gbvQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770104889; x=1770709689;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=w4Fa42+s21p5WnV6bQFuaoXKffvstj50qKY5S721GgI=;
        b=I8+y3HFPfj5/6Pme+hz29TOq0gHzxVd9P85xUX3Vbd5i9NRQLZLXXFG2AJzPoa/fYS
         RFwglS7axS4Jz1g5zaeWBOvfI7ZOgUdp3H/fDm17N8tLcFGoIU6oFKlku3GPHkn4dU6M
         DDc4NctmjJ6sfZ4gkHhfQU6Tkg99BBJVInOwUtfPtKVpGwKYVtJWvqrhlZZMm4dCTE6I
         BwLAhKfA4RdSx30+YkuPERucXQVvF/p+APUFSln930PKynkH9PnzyOorRlYMegsezIF+
         DQsxYYCSfdY3xwr23fTM+u33PSk8qSO0xzanAuBvpD5dZcO45m8cHO4IT1kRyAN3vE8S
         iK1Q==
X-Forwarded-Encrypted: i=1; AJvYcCX0mmc22M12V+makjYMYWdVNqiow9rryiotHpdjHjbdPvbK22FM4V21xpx+4QZhcyYNUO/39lpAs6xzO9QjyroWTA==@vger.kernel.org
X-Gm-Message-State: AOJu0YwPt8zGrF1yp1RkxGoFFl0b+cQe8Ckhl+TZYdjdJp/VJkhbhoSG
	ALcNHWXHCZ2pWU6du35Mf7lsw/wxvF4juw5wuxMCiYk03+LxKesqqKVDyKCvmTUjjEQ=
X-Gm-Gg: AZuq6aKxUAscECfb2wqXwbE4TvjaiOVbwgC1VgWVkMOUv5kipZXrt5j+XHyxRcDqLu1
	2Ed9OOD3RnlE9Mp3DPOFTNKYgIS8A6x6nU1nd8OTFU8G+H+HV4B5OyU2oiteEpost5TOTMka6DZ
	RFtIfjC6yo9gJYGWes77wVAThaB9TzcWz08IqAHXoxXHbqJB02Ktv8750x7XEbEMy42fcma9IZi
	vpTA/L313tPT0KXg99AsKg/lhhcLpAURAR/4Hatd0mUcmor6Ej6TAqle/toxSS1BKf7T8+AIH/p
	ioA6bMKR0jmf2p2cS0/VNAYzeJUZ1UzrgNyIOcpQGy+dZ0OILloIfp5/Tvie8coNtMWRV6jtwEP
	/uz3yLoRXXZwJrQsf61YGgRgN9Chsl5yg9K3iAELxTR8idhZZR9xI2k/aBoWcurk26cQrCet+jr
	nyjcgmyo6Gl+8z+1NVAdl8jQ46VqlwXQ==
X-Received: by 2002:a05:600c:6814:b0:480:69ae:f0e9 with SMTP id 5b1f17b1804b1-482db4ac0b0mr189032265e9.16.1770104888753;
        Mon, 02 Feb 2026 23:48:08 -0800 (PST)
Received: from [192.168.50.4] ([82.78.167.215])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-483051379c4sm44097195e9.15.2026.02.02.23.48.07
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 02 Feb 2026 23:48:07 -0800 (PST)
Message-ID: <c05654dd-c9a1-4f42-b561-69414a234bec@tuxon.dev>
Date: Tue, 3 Feb 2026 09:48:06 +0200
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/4] clk: renesas: rzg2l: Drop a check in
 rzg3s_cpg_pll_clk_recalc_rate()
To: Biju <biju.das.au@gmail.com>, Geert Uytterhoeven
 <geert+renesas@glider.be>, Michael Turquette <mturquette@baylibre.com>,
 Stephen Boyd <sboyd@kernel.org>
Cc: Biju Das <biju.das.jz@bp.renesas.com>, linux-renesas-soc@vger.kernel.org,
 linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org,
 Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>
References: <20260130115850.253555-1-biju.das.jz@bp.renesas.com>
 <20260130115850.253555-2-biju.das.jz@bp.renesas.com>
Content-Language: en-US
From: Claudiu Beznea <claudiu.beznea@tuxon.dev>
In-Reply-To: <20260130115850.253555-2-biju.das.jz@bp.renesas.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.16 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_DKIM_ALLOW(-0.20)[tuxon.dev:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	DKIM_TRACE(0.00)[tuxon.dev:+];
	TAGGED_FROM(0.00)[bounces-27792-lists,linux-renesas-soc=lfdr.de];
	FROM_HAS_DN(0.00)[];
	DMARC_NA(0.00)[tuxon.dev];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com,glider.be,baylibre.com,kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	MIME_TRACE(0.00)[0:+];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[claudiu.beznea@tuxon.dev,linux-renesas-soc@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[9];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linux-renesas-soc,renesas];
	TO_DN_SOME(0.00)[]
X-Rspamd-Queue-Id: 17857D5D50
X-Rspamd-Action: no action



On 1/30/26 13:58, Biju wrote:
> From: Biju Das <biju.das.jz@bp.renesas.com>
> 
> Drop the unwanted check in rzg3s_cpg_pll_clk_recalc_rate() as the function
> is SoC specific.
> 
> Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>

Reviewed-by: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>

> ---
> v1->v2:
>   * No change
> ---
>   drivers/clk/renesas/rzg2l-cpg.c | 3 ---
>   1 file changed, 3 deletions(-)
> 
> diff --git a/drivers/clk/renesas/rzg2l-cpg.c b/drivers/clk/renesas/rzg2l-cpg.c
> index 16771a0101bd..ee92d07c6ff7 100644
> --- a/drivers/clk/renesas/rzg2l-cpg.c
> +++ b/drivers/clk/renesas/rzg2l-cpg.c
> @@ -1113,9 +1113,6 @@ static unsigned long rzg3s_cpg_pll_clk_recalc_rate(struct clk_hw *hw,
>   	u32 nir, nfr, mr, pr, val, setting;
>   	u64 rate;
>   
> -	if (pll_clk->type != CLK_TYPE_G3S_PLL)
> -		return parent_rate;
> -
>   	setting = GET_REG_SAMPLL_SETTING(pll_clk->conf);
>   	if (setting) {
>   		val = readl(priv->base + setting);


