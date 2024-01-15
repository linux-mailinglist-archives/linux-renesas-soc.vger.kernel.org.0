Return-Path: <linux-renesas-soc+bounces-1557-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id A0A6C82D31C
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 15 Jan 2024 03:28:53 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 3CD77B20DBA
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 15 Jan 2024 02:28:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B664E28F3;
	Mon, 15 Jan 2024 02:28:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=cogentembedded-com.20230601.gappssmtp.com header.i=@cogentembedded-com.20230601.gappssmtp.com header.b="OMJv4g/2"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-lf1-f42.google.com (mail-lf1-f42.google.com [209.85.167.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6711C17CF
	for <linux-renesas-soc@vger.kernel.org>; Mon, 15 Jan 2024 02:28:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=cogentembedded.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=cogentembedded.com
Received: by mail-lf1-f42.google.com with SMTP id 2adb3069b0e04-50eaaf2c7deso9243401e87.2
        for <linux-renesas-soc@vger.kernel.org>; Sun, 14 Jan 2024 18:28:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cogentembedded-com.20230601.gappssmtp.com; s=20230601; t=1705285695; x=1705890495; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=xbO/6R5kltvyODHpeojPP+raK5bWMfuDOfTQWpU+D/A=;
        b=OMJv4g/2+3ZL1NfIB5SnF0X7hclFOSXyx6ejJZGTjRcO+ZWxeub4gMEA00ADE4VRZx
         5CWtdC/3hjvmNwvrsO13qzH1h84mvLFC2U4h54M+CLmGXQLjNS6VILIqJ/Ts11XFtjuj
         Rp5q3GMcKjoBpPQlkDxckMDgMF6XycNwlwQrcL4mGn434uBWsVQFQK77eA6OgyknacvP
         nEKP9owJ+kiWv1EB199kCo9cWB4LjzyORKpCRbdJ2ZXg1+wtLrqcZw3ooPmXcVO9LUWc
         pEP9qftCJNk9/QiGXxPB6WVpT0t2KZDjzXtGD4p10zt4LQXTo8ka3kcTM6VzWQzeM5+h
         ae5A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1705285695; x=1705890495;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=xbO/6R5kltvyODHpeojPP+raK5bWMfuDOfTQWpU+D/A=;
        b=HfC+xgdi6MAzYsftRneMnwXs8fGgxLZg7Pr0WaCH0rXce6ueh4nl/dNIE3C9t0Abf3
         EKm3+IH1xkquyJLB/rvSAtCsr2iKIk8DqB/7+Jkje/mfZx+NgqGowz9Va4dwRd9zk+Cu
         YdnGAQe0NdML0DsoSKQv2Q6VrFyB8Y1vaC4osy/nqKrYA29jUkgtqvCOlR5zH0+cydW+
         U6pU4hHLI9wKRKxW21znq95U3weZZrafRhGmgZwzQKTcUe0wptBzdEhrBYnVs7HpB20G
         Xem5R4g9g1rDuCg3J0Rfq064yAn1iy0PlKCNJs9DvX1/e6JR1NLj3H2hgLwOH1EP9cGI
         7f2w==
X-Gm-Message-State: AOJu0YzH8Ew9RruMWODrqgiNtyvY/DTiuclIbeFUC/FewYFGYNva//HJ
	preqBy36RMuhRPNqmjLui7z0KmjTztIztA==
X-Google-Smtp-Source: AGHT+IGk5gImJaFcq1775jeK7PF55T2j9KMDTR9loLtRw1oKaL67B1a9rPxDNBxxvPpW8PwhEnebng==
X-Received: by 2002:a05:6512:360d:b0:50e:2167:b306 with SMTP id f13-20020a056512360d00b0050e2167b306mr1792437lfs.40.1705285695248;
        Sun, 14 Jan 2024 18:28:15 -0800 (PST)
Received: from [192.168.0.104] ([91.231.66.25])
        by smtp.gmail.com with ESMTPSA id z7-20020ac24187000000b0050e758ee006sm1309563lfh.205.2024.01.14.18.28.13
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 14 Jan 2024 18:28:14 -0800 (PST)
Message-ID: <0f9e73a2-075a-4a4d-9c74-de17d135567d@cogentembedded.com>
Date: Mon, 15 Jan 2024 08:28:12 +0600
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] net: ravb: Fix wrong dma_unmap_single() calls in ring
 unmapping
Content-Language: en-US, ru-RU
To: Sergey Shtylyov <s.shtylyov@omp.ru>, "David S. Miller"
 <davem@davemloft.net>, Jakub Kicinski <kuba@kernel.org>,
 Paolo Abeni <pabeni@redhat.com>
Cc: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>,
 Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>,
 Wolfram Sang <wsa+renesas@sang-engineering.com>,
 =?UTF-8?Q?Uwe_Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>,
 netdev@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20240113044721.481131-1-nikita.yoush@cogentembedded.com>
 <c40ebf74-e7a7-4fa6-098c-42341a030bb5@omp.ru>
From: Nikita Yushchenko <nikita.yoush@cogentembedded.com>
In-Reply-To: <c40ebf74-e7a7-4fa6-098c-42341a030bb5@omp.ru>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

>> +		if (le16_to_cpu(desc->ds_cc) != 0)
> 
>     It's not that != 0 or le16_to_cpu() are necessary here but we're on
> the little-endian platforms anyways...

Let's leave optimizing this out to compiler.

In the code, I'd vote for always having explicit conversion operation when reading __le16 value from memory.

Nikita

