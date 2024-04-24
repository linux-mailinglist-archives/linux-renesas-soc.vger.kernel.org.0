Return-Path: <linux-renesas-soc+bounces-4864-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 671648B0587
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 24 Apr 2024 11:10:47 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 073291F24F5F
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 24 Apr 2024 09:10:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5FFCE158A24;
	Wed, 24 Apr 2024 09:10:44 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mx01.omp.ru (mx01.omp.ru [90.154.21.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B6BE1158867;
	Wed, 24 Apr 2024 09:10:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=90.154.21.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1713949844; cv=none; b=dqBNXQyHoQLwhzmfVQ+iV1jmi4eGgCepMjjTwE8Vi42kAxT6GnTUnN/qE3IxCwTl/uI4SjioYcS6M4VJ35ZLOpDZr+2mDSz3qg2fi8aDHA7vHWrTGxzKJ7+HPK1XzDFRUtQwn/4YbzTRFaS6cRD1JI8MtODJAJn3N8paeBz0UDs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1713949844; c=relaxed/simple;
	bh=TEF0qjz9ZofKGHwyDHgAwC9obwz1u3kw3L6ZMSub7H4=;
	h=Subject:To:CC:References:From:Message-ID:Date:MIME-Version:
	 In-Reply-To:Content-Type; b=GAhGjCUomq12e9X2uJUoRMP7oO7naPpGY4Fb3iDWEHiMDQY9Jpdyjgd3OLucig4iZuS4nLIYm+iJgmDrj7IxhP7i+xk2NKbNNyoW899m+wOZlr7OV7HfZ+P0AVJhX6TwTPg7v6xa6BinMKqMckt7rwJOik+3OtUYQ8rFtBwvkDA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=omp.ru; spf=pass smtp.mailfrom=omp.ru; arc=none smtp.client-ip=90.154.21.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=omp.ru
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=omp.ru
Received: from [192.168.1.105] (178.176.73.108) by msexch01.omp.ru
 (10.188.4.12) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id 15.2.1258.12; Wed, 24 Apr
 2024 12:10:24 +0300
Subject: Re: [PATCH] net: ravb: Fix registered interrupt names
To: Geert Uytterhoeven <geert+renesas@glider.be>, Claudiu Beznea
	<claudiu.beznea.uj@bp.renesas.com>, Paul Barker
	<paul.barker.ct@bp.renesas.com>, =?UTF-8?Q?Niklas_S=c3=b6derlund?=
	<niklas.soderlund+renesas@ragnatech.se>, "David S . Miller"
	<davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, Jakub Kicinski
	<kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>
CC: <netdev@vger.kernel.org>, <linux-renesas-soc@vger.kernel.org>
References: <cde67b68adf115b3cf0b44c32334ae00b2fbb321.1713944647.git.geert+renesas@glider.be>
From: Sergey Shtylyov <s.shtylyov@omp.ru>
Organization: Open Mobile Platform
Message-ID: <81d556da-8aa4-cf92-d8a6-5d8b147ab9a2@omp.ru>
Date: Wed, 24 Apr 2024 12:10:23 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.1
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
In-Reply-To: <cde67b68adf115b3cf0b44c32334ae00b2fbb321.1713944647.git.geert+renesas@glider.be>
Content-Type: text/plain; charset="utf-8"
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: msexch01.omp.ru (10.188.4.12) To msexch01.omp.ru
 (10.188.4.12)
X-KSE-ServerInfo: msexch01.omp.ru, 9
X-KSE-AntiSpam-Interceptor-Info: scan successful
X-KSE-AntiSpam-Version: 6.1.0, Database issued on: 04/24/2024 08:48:14
X-KSE-AntiSpam-Status: KAS_STATUS_NOT_DETECTED
X-KSE-AntiSpam-Method: none
X-KSE-AntiSpam-Rate: 59
X-KSE-AntiSpam-Info: Lua profiles 184894 [Apr 24 2024]
X-KSE-AntiSpam-Info: Version: 6.1.0.4
X-KSE-AntiSpam-Info: Envelope from: s.shtylyov@omp.ru
X-KSE-AntiSpam-Info: LuaCore: 18 0.3.18
 b9d6ada76958f07c6a68617a7ac8df800bc4166c
X-KSE-AntiSpam-Info: {rep_avail}
X-KSE-AntiSpam-Info: {Tracking_from_domain_doesnt_match_to}
X-KSE-AntiSpam-Info: {relay has no DNS name}
X-KSE-AntiSpam-Info: {SMTP from is not routable}
X-KSE-AntiSpam-Info: {Found in DNSBL: 178.176.73.108 in (user)
 b.barracudacentral.org}
X-KSE-AntiSpam-Info:
	127.0.0.199:7.1.2;d41d8cd98f00b204e9800998ecf8427e.com:7.1.1;omp.ru:7.1.1;178.176.73.108:7.1.2
X-KSE-AntiSpam-Info: ApMailHostAddress: 178.176.73.108
X-KSE-AntiSpam-Info: {DNS response errors}
X-KSE-AntiSpam-Info: Rate: 59
X-KSE-AntiSpam-Info: Status: not_detected
X-KSE-AntiSpam-Info: Method: none
X-KSE-AntiSpam-Info: Auth:dmarc=temperror header.from=omp.ru;spf=temperror
 smtp.mailfrom=omp.ru;dkim=none
X-KSE-Antiphishing-Info: Clean
X-KSE-Antiphishing-ScanningType: Heuristic
X-KSE-Antiphishing-Method: None
X-KSE-Antiphishing-Bases: 04/24/2024 08:52:00
X-KSE-Antivirus-Interceptor-Info: scan successful
X-KSE-Antivirus-Info: Clean, bases: 4/24/2024 7:13:00 AM
X-KSE-Attachment-Filter-Triggered-Rules: Clean
X-KSE-Attachment-Filter-Triggered-Filters: Clean
X-KSE-BulkMessagesFiltering-Scan-Result: InTheLimit

On 4/24/24 10:45 AM, Geert Uytterhoeven wrote:

> As interrupts are now requested from ravb_probe(), before calling
> register_netdev(), ndev->name still contains the template "eth%d",
> leading to funny names in /proc/interrupts.  E.g. on R-Car E3:
> 
> 	89:  0      0  GICv2  93 Level  eth%d:ch22:multi
> 	90:  0      3  GICv2  95 Level  eth%d:ch24:emac
> 	91:  0  23484  GICv2  71 Level  eth%d:ch0:rx_be
> 	92:  0      0  GICv2  72 Level  eth%d:ch1:rx_nc
> 	93:  0  13735  GICv2  89 Level  eth%d:ch18:tx_be
> 	94:  0      0  GICv2  90 Level  eth%d:ch19:tx_nc
> 
> Worse, on platforms with multiple RAVB instances (e.g. R-Car V4H), all
> interrupts have similar names.
> 
> Fix this by using the device name instead, like is done in several other
> drivers:
> 
> 	89:  0      0  GICv2  93 Level  e6800000.ethernet:ch22:multi
> 	90:  0      1  GICv2  95 Level  e6800000.ethernet:ch24:emac
> 	91:  0  28578  GICv2  71 Level  e6800000.ethernet:ch0:rx_be
> 	92:  0      0  GICv2  72 Level  e6800000.ethernet:ch1:rx_nc
> 	93:  0  14044  GICv2  89 Level  e6800000.ethernet:ch18:tx_be
> 	94:  0      0  GICv2  90 Level  e6800000.ethernet:ch19:tx_nc

   Ugh! Sorry about missing this one...

> Rename the local variable dev_name, as it shadows the dev_name()
> function, and pre-initialize it, to simplify the code.

   Why not call it just name instead?

> Fixes: 32f012b8c01ca9fd ("net: ravb: Move getting/requesting IRQs in the probe() method")
> Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>

Reviewed-by: Sergey Shtylyov <s.shtylyov@omp.ru>

[...]

MBR, Sergey

