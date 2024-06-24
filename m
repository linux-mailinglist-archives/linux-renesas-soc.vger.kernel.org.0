Return-Path: <linux-renesas-soc+bounces-6713-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id ACCD09157A9
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 24 Jun 2024 22:13:19 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 5F8931F24C52
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 24 Jun 2024 20:13:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A9AB61A073B;
	Mon, 24 Jun 2024 20:12:02 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mx01.omp.ru (mx01.omp.ru [90.154.21.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5DD361A0737;
	Mon, 24 Jun 2024 20:11:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=90.154.21.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719259922; cv=none; b=pwvjcmdCkDut53afIi3AScN77PjmER9Tsdg2u2gx0Ek/2OGJACKn3jyI6I+GDXRS7UImoycwP6Jyf+lD3rxaNN6dVz1dditX3YGRu0X7GX6/9H8NVXoyk3EISWlNTlZ1Q/YWwDqlrlYRN+M+mOVsoo8B5XI/hQL9HxJ23ndjUcc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719259922; c=relaxed/simple;
	bh=/8uzQHBdiyGC0ZSFB+cCNRlfzqGLG228vyDgBVcRUKA=;
	h=Subject:To:CC:References:From:Message-ID:Date:MIME-Version:
	 In-Reply-To:Content-Type; b=g/hAXvD3OM67dgwlPxf1w6GrFOms7rQS5ZLbNwJVJB7lDDVkJDpzj0scw9XoUCt0uLHdwva0jsrNmSW3167bUJyhSIQ7bCfab1dZI8AhmqP/kLmW8Ind+m0QJgPhbCBogOSdVai+rCzXEv2T7ceFZ/neacN0ObcRzWQzpF+CXlk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=omp.ru; spf=pass smtp.mailfrom=omp.ru; arc=none smtp.client-ip=90.154.21.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=omp.ru
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=omp.ru
Received: from [192.168.1.105] (178.176.73.167) by msexch01.omp.ru
 (10.188.4.12) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id 15.2.1258.12; Mon, 24 Jun
 2024 23:11:41 +0300
Subject: Re: [PATCH net-next v2 1/2] ravb: Improve ravb_hw_info instance order
To: Geert Uytterhoeven <geert+renesas@glider.be>, Paul Barker
	<paul.barker.ct@bp.renesas.com>, =?UTF-8?Q?Niklas_S=c3=b6derlund?=
	<niklas.soderlund+renesas@ragnatech.se>, Claudiu Beznea
	<claudiu.beznea.uj@bp.renesas.com>, Biju Das <biju.das.jz@bp.renesas.com>,
	"David S . Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>
CC: <netdev@vger.kernel.org>, <linux-renesas-soc@vger.kernel.org>
References: <cover.1719234830.git.geert+renesas@glider.be>
 <a76febe3737e26365a784e9193da9363f22aa550.1719234830.git.geert+renesas@glider.be>
From: Sergey Shtylyov <s.shtylyov@omp.ru>
Organization: Open Mobile Platform
Message-ID: <9a424b01-2004-a1fe-97bd-a7c85f80574e@omp.ru>
Date: Mon, 24 Jun 2024 23:11:40 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.1
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
In-Reply-To: <a76febe3737e26365a784e9193da9363f22aa550.1719234830.git.geert+renesas@glider.be>
Content-Type: text/plain; charset="utf-8"
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: msexch01.omp.ru (10.188.4.12) To msexch01.omp.ru
 (10.188.4.12)
X-KSE-ServerInfo: msexch01.omp.ru, 9
X-KSE-AntiSpam-Interceptor-Info: scan successful
X-KSE-AntiSpam-Version: 6.1.0, Database issued on: 06/24/2024 19:51:42
X-KSE-AntiSpam-Status: KAS_STATUS_NOT_DETECTED
X-KSE-AntiSpam-Method: none
X-KSE-AntiSpam-Rate: 59
X-KSE-AntiSpam-Info: Lua profiles 186110 [Jun 24 2024]
X-KSE-AntiSpam-Info: Version: 6.1.0.4
X-KSE-AntiSpam-Info: Envelope from: s.shtylyov@omp.ru
X-KSE-AntiSpam-Info: LuaCore: 20 0.3.20
 743589a8af6ec90b529f2124c2bbfc3ce1d2f20f
X-KSE-AntiSpam-Info: {rep_avail}
X-KSE-AntiSpam-Info: {Tracking_from_domain_doesnt_match_to}
X-KSE-AntiSpam-Info: {relay has no DNS name}
X-KSE-AntiSpam-Info: {SMTP from is not routable}
X-KSE-AntiSpam-Info: {Found in DNSBL: 178.176.73.167 in (user)
 b.barracudacentral.org}
X-KSE-AntiSpam-Info:
	127.0.0.199:7.1.2;omp.ru:7.1.1;d41d8cd98f00b204e9800998ecf8427e.com:7.1.1
X-KSE-AntiSpam-Info: ApMailHostAddress: 178.176.73.167
X-KSE-AntiSpam-Info: {DNS response errors}
X-KSE-AntiSpam-Info: Rate: 59
X-KSE-AntiSpam-Info: Status: not_detected
X-KSE-AntiSpam-Info: Method: none
X-KSE-AntiSpam-Info: Auth:dmarc=temperror header.from=omp.ru;spf=temperror
 smtp.mailfrom=omp.ru;dkim=none
X-KSE-Antiphishing-Info: Clean
X-KSE-Antiphishing-ScanningType: Heuristic
X-KSE-Antiphishing-Method: None
X-KSE-Antiphishing-Bases: 06/24/2024 19:56:00
X-KSE-Antivirus-Interceptor-Info: scan successful
X-KSE-Antivirus-Info: Clean, bases: 6/24/2024 6:12:00 PM
X-KSE-Attachment-Filter-Triggered-Rules: Clean
X-KSE-Attachment-Filter-Triggered-Filters: Clean
X-KSE-BulkMessagesFiltering-Scan-Result: InTheLimit

On 6/24/24 4:25 PM, Geert Uytterhoeven wrote:

> Move ravb_gen2_hw_info before ravb_gen3_hw_info to match
> ravb_match_table[] order.
> 
> Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>

Reviewed-by: Sergey Shtylyov <s.shtylyov@omp.ru>

[...]

MBR, Sergey

