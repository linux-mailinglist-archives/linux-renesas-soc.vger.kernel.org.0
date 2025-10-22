Return-Path: <linux-renesas-soc+bounces-23405-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [IPv6:2a01:60a::1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id 57802BFA0D4
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 22 Oct 2025 07:26:11 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id 0487D352EFB
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 22 Oct 2025 05:26:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0FD3C2EA729;
	Wed, 22 Oct 2025 05:26:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="b9B2gomS"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4E11F2E9EC3
	for <linux-renesas-soc@vger.kernel.org>; Wed, 22 Oct 2025 05:26:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761110764; cv=none; b=mgnjk/njPzn8Cm9Vh21x3SnusMUtbLcH0j/eLkkyAjEBrWu10Z+Jwg/a0LoAEkVapTpLR640hM37qv3AjGeqCgHQOwaX6KcmIrYFYwn0ndwPYuKAEHuaN+f6Tad9lQqCGitSzIgwxNm4TqqOL9ugb976HiPKFTjZw8YDgVbOEmc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761110764; c=relaxed/simple;
	bh=5LyT/ygpo0Y8+c57YACqJVq8xSHL/5CSEdw5mQ9FPeI=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=E1pq5DqnTj8Vv/8pkw3tJ+oJkfTjbi84pRnXM/p6yKy8zccX3EyefGp1Fj9jaSosBsByFQrwdfaGmzJpMPdSdUY9BOqJVwOy0S9fzacm3r4CX3liC6imij+07ocFcTlVjYl09M40D4V/RoN4+aqtpk7j6bFhO8nYP6D7utKZ028=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=b9B2gomS; arc=none smtp.client-ip=209.85.128.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-471bde1e8f8so15563595e9.0
        for <linux-renesas-soc@vger.kernel.org>; Tue, 21 Oct 2025 22:26:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1761110761; x=1761715561; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=PTK9xnrabjHdfOVmac+35vVYjvqf9gcnY89/qorWOFk=;
        b=b9B2gomSHtw47A/Zp21c30PJIcOMUt9SznOdWBRuXmF2WCl3RvfimUPyPey9qwZGD8
         5gUEF7jwiJXeeLKA8XcyzL68o0vZgynqcioiXHrso4R7vC+rAFwkMHD4gdT4zUOGEJVH
         eBslxgOf2SVkGFu0Aa+R1rJxw3DNq7bL6/F0Y52u1c4WG1H2HBxXijXcfY7jbQOpa8fA
         RnkZk08s8KTybfUcHlkF/L4B+Uf8r+q34YPqJ5H8FZNv9QRR1br1SJmmuNXEjp+Inui3
         Q4hOWerQSdt7JQP2NO0iVVzDyJXGdFPqzZuiLcyhrcRtbovZCydULv12hAl7no6bGIPG
         JhMw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761110761; x=1761715561;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=PTK9xnrabjHdfOVmac+35vVYjvqf9gcnY89/qorWOFk=;
        b=pcpw95slqbPtHDq2mPQNb+gXEiCLyVLY9CJMdcttuUNmmka/P+HxVDzEDP/F0kIP8C
         Yw/chACD/GTPiduIe2xjggxyFIXMpNrfk56quTctSSb348MkITVw3g+l8vO6LnW/BMyL
         4UFzIpzcZ0aqAPIereRDGr/CShZpgJOzYjLD1kiDh4gJlTmhV9XaxB7N54KxVVhGZfnj
         OK9dquScJU+lo1mQg7a4eDL03crZdd3nN3uLcpPnNIz/3AXTaUban+mRlDi7VWtH1j9+
         I84y4MgEJkiPSZ4JmotQSfA9ktPzei8uo8xUYN5QKKqW+9mdMToIdFxHMrxLXoDUhFJG
         pPBw==
X-Gm-Message-State: AOJu0YzwBPsOV3Gj+zjv9asEUKLK/2z6oAmKmjjid02aCjPc/vGc0R1B
	iZ2D6SXlzwDqralNDmQ4eVEWqpMYMvvsZUPXIPvDsdw+htAoMk+TzDJO
X-Gm-Gg: ASbGnct6QeAhrvsAg1L4jPPX5jsKYm5L34FE2e+V9a8Uc0oV8BEMpQmvNl38/uQMY9l
	K/dLIJUTIKwELbhp0KcwJ/F8X8oyvc/x4LovReh/boyITwkuANAxEkMYwH0WzjqGwM7gNPU6i+X
	9RtlIgS15Og2Yk3Hr9YmHd7VaxfwQzKy+ZTwdbfVZmUMWfwyktMc5xI7TKgk5vQkCqPyM9mK+e+
	qrKfkfuOMW25g8/z95jKYF4KkDyXU/greWScUPi+s0r3HJY7D/oZ6AkYrSzDzekkMQjz7UhgJhC
	8WqT6tVeVqYzdOl1dFU2lwOeXyFC1MUXuQ4xxSHyI1KLpHW2HD4gRXGqP2vo2s0/CQ17ALNgB8a
	Gv5pKXuePNBCnrpwGmdNgEnQ/8bCnGSdfp3yhB4tSTTVCAGvTRPER+UX3xt+JgDq2j77jA2erQR
	VspBF59kXz51r3f6XkmNSHcHAOrPw=
X-Google-Smtp-Source: AGHT+IHr6AAOVc1hGvm6Z9gPnF7KZM4WzTsoKOYTkLOkDaFciIKzqCnei8AODqBvkLwaQ/AOvpj3Tw==
X-Received: by 2002:a05:600c:470d:b0:45f:2cd5:5086 with SMTP id 5b1f17b1804b1-4711786d5a3mr136631615e9.3.1761110760405;
        Tue, 21 Oct 2025 22:26:00 -0700 (PDT)
Received: from [10.80.3.86] ([72.25.96.18])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-427f009a7dasm25521821f8f.25.2025.10.21.22.25.58
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 21 Oct 2025 22:26:00 -0700 (PDT)
Message-ID: <5c6c1157-b056-4417-b969-ba501f1baa21@gmail.com>
Date: Wed, 22 Oct 2025 08:25:58 +0300
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH net-next v3 2/6] mlx4: convert to ndo_hwtstamp API
To: Vadim Fedorenko <vadim.fedorenko@linux.dev>,
 Jian Shen <shenjian15@huawei.com>, Salil Mehta <salil.mehta@huawei.com>,
 Jijie Shao <shaojijie@huawei.com>, Andrew Lunn <andrew+netdev@lunn.ch>,
 "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>,
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
 Sunil Goutham <sgoutham@marvell.com>, Geetha sowjanya <gakula@marvell.com>,
 Subbaraya Sundeep <sbhatta@marvell.com>,
 Bharat Bhushan <bbhushan2@marvell.com>, Tariq Toukan <tariqt@nvidia.com>,
 Brett Creeley <brett.creeley@amd.com>,
 =?UTF-8?Q?Niklas_S=C3=B6derlund?= <niklas.soderlund@ragnatech.se>,
 Paul Barker <paul@pbarker.dev>,
 Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
Cc: linux-renesas-soc@vger.kernel.org,
 Richard Cochran <richardcochran@gmail.com>,
 Russell King <linux@armlinux.org.uk>,
 Vladimir Oltean <vladimir.oltean@nxp.com>, Simon Horman <horms@kernel.org>,
 Jacob Keller <jacob.e.keller@intel.com>, netdev@vger.kernel.org
References: <20251021094751.900558-1-vadim.fedorenko@linux.dev>
 <20251021094751.900558-3-vadim.fedorenko@linux.dev>
Content-Language: en-US
From: Tariq Toukan <ttoukan.linux@gmail.com>
In-Reply-To: <20251021094751.900558-3-vadim.fedorenko@linux.dev>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit



On 21/10/2025 12:47, Vadim Fedorenko wrote:
> Convert driver to use .ndo_hwtstamp_get()/.ndo_hwtstamp_set() callbacks.
> mlx4_en_ioctl() becomes empty, remove it.
> 
> Reviewed-by: Jacob Keller <jacob.e.keller@intel.com>
> Signed-off-by: Vadim Fedorenko <vadim.fedorenko@linux.dev>
> ---
>   .../net/ethernet/mellanox/mlx4/en_netdev.c    | 62 ++++++++-----------
>   drivers/net/ethernet/mellanox/mlx4/mlx4_en.h  |  6 +-
>   2 files changed, 29 insertions(+), 39 deletions(-)
> 

Reviewed-by: Tariq Toukan <tariqt@nvidia.com>

Thanks.

