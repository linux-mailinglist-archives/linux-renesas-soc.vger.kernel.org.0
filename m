Return-Path: <linux-renesas-soc+bounces-1934-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id A0FC88407A8
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 29 Jan 2024 14:58:04 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 5D5FB285575
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 29 Jan 2024 13:58:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C6D596773C;
	Mon, 29 Jan 2024 13:57:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b="CdFdim55"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-ed1-f44.google.com (mail-ed1-f44.google.com [209.85.208.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 134D967732
	for <linux-renesas-soc@vger.kernel.org>; Mon, 29 Jan 2024 13:57:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1706536627; cv=none; b=kbxmYFLmVewN0ElabH27G1pFx/UvbqYwFFRY/8cNGqdD1bJZuhPY3OL2YW/euGgR4GAy/LqyCTfeyhl3Gh2hSpXgWjyWFRIcxO7/6HNat86s3+pohYxdgwZR+wWzfHfEzLBHEYfr6I3j3INr3haikc+jZfn0uxwKrpBgUeqZMiA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1706536627; c=relaxed/simple;
	bh=Ca8MXRaUc5LB1kOopLbePSXXIUNdjkZs4DNPghLWDFs=;
	h=Message-ID:Date:MIME-Version:Subject:From:To:Cc:References:
	 In-Reply-To:Content-Type; b=KVV5FyukC0LxZkijsCZd5hs4WoapDW7YiwFmDcYXGh0KVWeLeDl8eAjDH4nljKFB8inwJ8uOZUqNxvwl2gK21u4miL2p+barNnJ0G3AFsr45KklbDzQtBpAOB7fAfN0qjzfiZJY/dGXpQ7DMwJJxAz0Eg9e2BxfYssIxuKSdPGU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev; spf=pass smtp.mailfrom=tuxon.dev; dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b=CdFdim55; arc=none smtp.client-ip=209.85.208.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=tuxon.dev
Received: by mail-ed1-f44.google.com with SMTP id 4fb4d7f45d1cf-55c33773c0aso2628666a12.1
        for <linux-renesas-soc@vger.kernel.org>; Mon, 29 Jan 2024 05:57:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tuxon.dev; s=google; t=1706536624; x=1707141424; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:references:cc:to:from
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Ca8MXRaUc5LB1kOopLbePSXXIUNdjkZs4DNPghLWDFs=;
        b=CdFdim5561+uOc/UZI9C1XkgwUQldxEv3HdepZ6CN/UDROdI3+1DBs6H4IPhVnI4bw
         vyPm7Cbs4iB98f3jpQdS6h5fZDvC93kC0REBEWIQJLEheseVyJUIR0SlHTIGkTUmwUGJ
         pZ1d6FTak/5nl0y4rOOFqbp7wplMj0WxZ5860PTlu5tP3lqcdjlUo3pjCdgSnJQ/N7qh
         m8PHS+0C3PGQVZa5AR3xWi2AHnD2uNofCB4+JeUx+NCyiaxQ2FxWIypJJlgEnWnnoPAM
         xxTUDHLEI/RBrGmXiZoUSWCxfdjfDRcHHd9kJj1cgHbIIoONco8yyhb7k1A2G8iXxzUb
         Jjfg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1706536624; x=1707141424;
        h=content-transfer-encoding:in-reply-to:references:cc:to:from
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Ca8MXRaUc5LB1kOopLbePSXXIUNdjkZs4DNPghLWDFs=;
        b=lIYgOt6qYAL7GNTttNdcOWSkD6PthXZRO304dWJRSCrCa6OUL+ieu77IST2Ry3cGHd
         KhKZdJEI76dybcH3MsRTIe5EUwtkaFkEp0b30bWvFGPzHgG9ktXsBwwZJrM6NPZsNI0y
         jQNLeQ2uankAkdX1IsZ55ESB1qsB3UpHD0eUhIBl3GtnZv+6+Be3XoF7b1VmPuF0dHpm
         Yv2SmBXvyD+5yMAGrL4vSTLUJoNSvLI0gSL9/GtrEww7l/MHleqjfGse+96XyExfNury
         7pi7xGwgOejniD3sDDCKJD852t3kpi34X0d8fOOpNpC5UuFttac+q2p95MK53URdG+b1
         wUQA==
X-Gm-Message-State: AOJu0YziwwF5Jvm/djhsVIPy5x45g38i6mR+uda003MBouux/banfiT1
	x5klHsBLr31N4AgzmKaKZhBTSBnXRjSSnRolCt6kDgmC6Bf0RdMsv8yDEDflfGA=
X-Google-Smtp-Source: AGHT+IEZngk8qVNZ0ZJg2IQYeB89DXsyZ8UBaE7DGVYPd3w6M9dTCGVsz1F85xddMef/9D1DC0lpWg==
X-Received: by 2002:a17:906:5fd7:b0:a30:d4f2:1603 with SMTP id k23-20020a1709065fd700b00a30d4f21603mr5299264ejv.15.1706536624234;
        Mon, 29 Jan 2024 05:57:04 -0800 (PST)
Received: from [192.168.50.4] ([82.78.167.87])
        by smtp.gmail.com with ESMTPSA id vx6-20020a170907a78600b00a35ea4a21e8sm425895ejc.2.2024.01.29.05.57.02
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 29 Jan 2024 05:57:03 -0800 (PST)
Message-ID: <2ab72042-eefd-47d7-a0a5-5259fc8098f9@tuxon.dev>
Date: Mon, 29 Jan 2024 15:57:02 +0200
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH net-next v4 10/15] net: ravb: Move delay mode set in the
 driver's ndo_open API
Content-Language: en-US
From: claudiu beznea <claudiu.beznea@tuxon.dev>
To: Sergey Shtylyov <s.shtylyov@omp.ru>, davem@davemloft.net,
 edumazet@google.com, kuba@kernel.org, pabeni@redhat.com,
 richardcochran@gmail.com, p.zabel@pengutronix.de, geert+renesas@glider.be
Cc: netdev@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
 linux-kernel@vger.kernel.org,
 Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
References: <20240123125829.3970325-1-claudiu.beznea.uj@bp.renesas.com>
 <20240123125829.3970325-11-claudiu.beznea.uj@bp.renesas.com>
 <b0a4f320-6218-2631-a5a0-26cfa9a25ee1@omp.ru>
 <1c680be4-67b7-435b-9609-b5f7a45ca675@tuxon.dev>
In-Reply-To: <1c680be4-67b7-435b-9609-b5f7a45ca675@tuxon.dev>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit



On 29.01.2024 15:55, claudiu beznea wrote:
> As explained in the patch description ("Along with it, both delay specific

Or partially explained. I'll try to improve this ^

