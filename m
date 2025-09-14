Return-Path: <linux-renesas-soc+bounces-21845-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id DD9ECB56AB2
	for <lists+linux-renesas-soc@lfdr.de>; Sun, 14 Sep 2025 18:56:25 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 7FE143BB48C
	for <lists+linux-renesas-soc@lfdr.de>; Sun, 14 Sep 2025 16:56:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E95EE2DC350;
	Sun, 14 Sep 2025 16:56:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=cogentembedded-com.20230601.gappssmtp.com header.i=@cogentembedded-com.20230601.gappssmtp.com header.b="UEyTsq/8"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-ej1-f41.google.com (mail-ej1-f41.google.com [209.85.218.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 189A9258CE9
	for <linux-renesas-soc@vger.kernel.org>; Sun, 14 Sep 2025 16:56:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757868978; cv=none; b=sOLAQKa0877kqsz0pr9gVOIPyVE/pMjxkBPhMPY9ZeSM9AnLaDilXtgXeAFTfGK+F7dmGvTL86pO/xSdrMVSoikJqyz5Ss1Qefnnxh/CD/N5ZWcKY65e97T8XCUIHmEmpuOOpCmiiWpqyOGsWoGSerOBo3mYP6WSY53Ljht1GIY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757868978; c=relaxed/simple;
	bh=RkfQfhlJbWyA2LHc1bvVYWrp9RkM8HrXK7A2wjNzvIY=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=pb5iIqTLVPNzKiAsv92fkgA/h7V3bEYnyj1lBJ+m/yHQZQ9HpB3ExuN4STBXDI+ilDeOT+eQmz1uZLwllo7ffv5oms/qq3EVyWL2unj4Fx6zdphvnpbb3dox+1fbPiwKeIF84dik2kTOhMdlaBdYuHJynGWRFh6QXnSFtbI3pH0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=cogentembedded.com; spf=pass smtp.mailfrom=cogentembedded.com; dkim=pass (2048-bit key) header.d=cogentembedded-com.20230601.gappssmtp.com header.i=@cogentembedded-com.20230601.gappssmtp.com header.b=UEyTsq/8; arc=none smtp.client-ip=209.85.218.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=cogentembedded.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=cogentembedded.com
Received: by mail-ej1-f41.google.com with SMTP id a640c23a62f3a-b0428b537e5so469091866b.3
        for <linux-renesas-soc@vger.kernel.org>; Sun, 14 Sep 2025 09:56:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cogentembedded-com.20230601.gappssmtp.com; s=20230601; t=1757868974; x=1758473774; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=QPlpyeAwSRDCzGoq7PgUzo7R9sROP9lHXNmER4Pl0Oo=;
        b=UEyTsq/8pAHwi+9IH7M466q475q0LO+gzT9fX/DKEThrKeJ4CVCViGmTCEM9hneJbN
         tzDYssgdnVoC2KRYJM/5MoN5mideTncUgNFC9+TkC7ZMoqrMb0EC+GDMI+JTI8brCgcy
         FH10yS7ugg2I7a1NHE8791AcrUeSFwsMgT9ttuj2dyHi2mpgygjYfTHDlJWQ+sLxcNTH
         Aw1uWKyGWp9TEGE4no9J95JcdbyLVeyw2Zi4SHizjKaBMhZK+CB69iqApmeCBa/Lrj4A
         1BRDk1KaiPEictdpO/quanr2HJFmfT5esvxx+pdAOJUZZnlA1zbXs1y0HsKrPasKTrT2
         nqtw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757868974; x=1758473774;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=QPlpyeAwSRDCzGoq7PgUzo7R9sROP9lHXNmER4Pl0Oo=;
        b=vxsiG+93/yKyAe0N35+dPHJN8Sb6cm0RcVyBBxj/gTkatlniRgAcYbLpzngRpWVYGQ
         V7SLozErxzzkDfyrnxlap6h6gBfYJfgcbDzkAaFuIVSQed4BWrTqi010Bps74Lvok49c
         t0u5KuNBeT92qyhjbGtEdLGKW54PkVifrQCTBCMpwbvQ3fXzscMDJf1Gzzif2w0IdQt6
         nIKNpSxuBZ5oubQssHgxcLkPsobhxTEIU+9gwcpYJmlAm40Bjoyu3ed5hvQYUVXKdj98
         uYCqsqxE0vwgioPf+CnjyGU5KwWL4+xM5pSQfCYNSava2H8tQIsJn6ggAMtoS1/BFAE3
         cl7A==
X-Forwarded-Encrypted: i=1; AJvYcCUjDwiG9oKmOMes5rMqUbYZZ0TPzEV8pEZfcH1J535HwsdhiBoBksSQKbcJL8N9/UpK25Lgx5zvURypjqA0egW3oQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YxYC4S1F0V0vxn4qGoNDbYJu4SYGuRxCIO1jRj65mVbn/cTNIUp
	ewqSqe0HRZQx/DuhQaRb1WUs3+DlX4TKQh6zkNXeubxxT0/hxlAmD6a+NUBXXnCOAPU=
X-Gm-Gg: ASbGncsDy3DY6YEXU+iJPliCnfUXX0DVfMOFifQsNMmmfHnySUvOpM2jwiLBL9+zJDC
	aBGInURoX/keWyqDeSVhf71Cl+vCLhgttO/SuFLFRHyFFuUBS7ZRy7pJ0/wnmCJvXlV82kfAI7C
	fm5/27gnEuqnNZt7z7Vaq+lURamrB+WHaywqKZCip1HUm5jMC0zL9JPulECrHHtEL7N0D2NFXwv
	yJ5xhhDyzuzAroDOH29Zl1K/kMRFY/59h0B/53BJdVixDQaIjVkSjS+k6dobRPP/HvcoMNM8vkK
	ljH95JDi2mJjErIOAjDa/VQ+o6k/ypdHDMd1Gn37Vk895k34ZOBjXYtDYFAVYB17WpsAaqnjeDr
	Rzcp9oqVBQ7IJs0cvHj/z74ctLolPLbf6q04TqkRA4NEeOzBsaHlyDl+1lwiskvNaHA1f8g==
X-Google-Smtp-Source: AGHT+IFo7cg/KTe51S4KiqVqGNE/pynRgI3QfYqO9osoGDCNwd6sXzlp1MQZ0N6YUJ78vOJwr7Bgcw==
X-Received: by 2002:a17:907:9344:b0:b04:4786:5dfa with SMTP id a640c23a62f3a-b07c3820e57mr986866666b.35.1757868974236;
        Sun, 14 Sep 2025 09:56:14 -0700 (PDT)
Received: from ?IPV6:2a02:810a:b98:a000::a43c? ([2a02:810a:b98:a000::a43c])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b07b30da302sm768603066b.16.2025.09.14.09.56.13
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 14 Sep 2025 09:56:13 -0700 (PDT)
Message-ID: <a9d9967d-ef5d-47ff-88a5-b1fcf9bcd319@cogentembedded.com>
Date: Sun, 14 Sep 2025 18:56:12 +0200
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] net: renesas: rswitch: simplify rswitch_stop()
To: "Yury Norov (NVIDIA)" <yury.norov@gmail.com>,
 Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>,
 Andrew Lunn <andrew+netdev@lunn.ch>, "David S. Miller"
 <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>,
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
 Michal Swiatkowski <michal.swiatkowski@linux.intel.com>,
 Geert Uytterhoeven <geert+renesas@glider.be>,
 =?UTF-8?Q?Uwe_Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>
Cc: netdev@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20250913181345.204344-1-yury.norov@gmail.com>
Content-Language: en-US, ru-RU
From: Nikita Yushchenko <nikita.yoush@cogentembedded.com>
In-Reply-To: <20250913181345.204344-1-yury.norov@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

> rswitch_stop() opencodes for_each_set_bit().
> 
> Signed-off-by: Yury Norov (NVIDIA) <yury.norov@gmail.com>
> ---
>   drivers/net/ethernet/renesas/rswitch.c | 4 +---
>   1 file changed, 1 insertion(+), 3 deletions(-)
> 
> diff --git a/drivers/net/ethernet/renesas/rswitch.c b/drivers/net/ethernet/renesas/rswitch.c
> index aba772e14555..9497c738b828 100644
> --- a/drivers/net/ethernet/renesas/rswitch.c
> +++ b/drivers/net/ethernet/renesas/rswitch.c
> @@ -1627,9 +1627,7 @@ static int rswitch_stop(struct net_device *ndev)
>   	if (bitmap_empty(rdev->priv->opened_ports, RSWITCH_NUM_PORTS))
>   		iowrite32(GWCA_TS_IRQ_BIT, rdev->priv->addr + GWTSDID);
>   
> -	for (tag = find_first_bit(rdev->ts_skb_used, TS_TAGS_PER_PORT);
> -	     tag < TS_TAGS_PER_PORT;
> -	     tag = find_next_bit(rdev->ts_skb_used, TS_TAGS_PER_PORT, tag + 1)) {
> +	for_each_set_bit(tag, rdev->ts_skb_used, TS_TAGS_PER_PORT) {
>   		ts_skb = xchg(&rdev->ts_skb[tag], NULL);
>   		clear_bit(tag, rdev->ts_skb_used);
>   		if (ts_skb)

Probably shall be [PATCH net], otherwise

Reviewed-by: Nikita Yushchenko <nikita.yoush@cogentembedded.com>

