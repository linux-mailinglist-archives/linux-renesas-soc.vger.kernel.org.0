Return-Path: <linux-renesas-soc+bounces-3328-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id D141286B6A9
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 28 Feb 2024 19:04:26 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 5D84528571E
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 28 Feb 2024 18:04:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A5D0579B6F;
	Wed, 28 Feb 2024 18:04:23 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mx01.omp.ru (mx01.omp.ru [90.154.21.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A123879B6D;
	Wed, 28 Feb 2024 18:04:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=90.154.21.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1709143463; cv=none; b=Dl57ILyEFm21YKsgJJCxa8FmPHkaXH6ZWGEzbzHtERyREhhIRCKSR2/qpNKVa7HC6EEVfJBxrq2T5IHuadxhAQLbDOJjTiI8TbRtlp5iA9BxqovA/pwNX9xHZfybXc1uUt+6bI6g5EEuyGBr8uSIfdD/U77zahTDQcaYBB/neBI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1709143463; c=relaxed/simple;
	bh=wwuEA5wbE9Fa2StuQ5O6OlcW9MiRSldboSXWfNzK4V8=;
	h=Subject:To:CC:References:From:Message-ID:Date:MIME-Version:
	 In-Reply-To:Content-Type; b=HvKU5y3BDN3ZfhtLk4GzQNky45cz4i/M7CRTgnr/T+D3RWdPDGZO9OQ1fL+PyeUoTF5EenwgoeDqPfe4nbPg3jA+mkiGoS6zQZPoV28VUIaazdAZVUwLvovfNSEjufoYf+BOvk3KAXOaJ9fVuhS0kMwtitwWF8oRPUdcvYdg2Bg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=omp.ru; spf=pass smtp.mailfrom=omp.ru; arc=none smtp.client-ip=90.154.21.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=omp.ru
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=omp.ru
Received: from [192.168.1.105] (178.176.77.175) by msexch01.omp.ru
 (10.188.4.12) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id 15.2.1258.12; Wed, 28 Feb
 2024 21:04:03 +0300
Subject: Re: [net-next,v2 0/6] ravb: Align Rx descriptor setup and maintenance
To: =?UTF-8?Q?Niklas_S=c3=b6derlund?= <niklas.soderlund+renesas@ragnatech.se>,
	"David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, Biju Das
	<biju.das.jz@bp.renesas.com>, Claudiu Beznea
	<claudiu.beznea.uj@bp.renesas.com>, Yoshihiro Shimoda
	<yoshihiro.shimoda.uh@renesas.com>, <netdev@vger.kernel.org>
CC: <linux-renesas-soc@vger.kernel.org>
References: <20240227223305.910452-1-niklas.soderlund+renesas@ragnatech.se>
From: Sergey Shtylyov <s.shtylyov@omp.ru>
Organization: Open Mobile Platform
Message-ID: <ec752770-1138-9385-4d1c-5b12e15359c8@omp.ru>
Date: Wed, 28 Feb 2024 21:04:02 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.1
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
In-Reply-To: <20240227223305.910452-1-niklas.soderlund+renesas@ragnatech.se>
Content-Type: text/plain; charset="utf-8"
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: msexch01.omp.ru (10.188.4.12) To msexch01.omp.ru
 (10.188.4.12)
X-KSE-ServerInfo: msexch01.omp.ru, 9
X-KSE-AntiSpam-Interceptor-Info: scan successful
X-KSE-AntiSpam-Version: 6.1.0, Database issued on: 02/28/2024 17:35:40
X-KSE-AntiSpam-Status: KAS_STATUS_NOT_DETECTED
X-KSE-AntiSpam-Method: none
X-KSE-AntiSpam-Rate: 59
X-KSE-AntiSpam-Info: Lua profiles 183838 [Feb 28 2024]
X-KSE-AntiSpam-Info: Version: 6.1.0.3
X-KSE-AntiSpam-Info: Envelope from: s.shtylyov@omp.ru
X-KSE-AntiSpam-Info: LuaCore: 7 0.3.7 6d6bf5bd8eea7373134f756a2fd73e9456bb7d1a
X-KSE-AntiSpam-Info: {rep_avail}
X-KSE-AntiSpam-Info: {Tracking_from_domain_doesnt_match_to}
X-KSE-AntiSpam-Info: {relay has no DNS name}
X-KSE-AntiSpam-Info: {SMTP from is not routable}
X-KSE-AntiSpam-Info:
	omp.ru:7.1.1;127.0.0.199:7.1.2;d41d8cd98f00b204e9800998ecf8427e.com:7.1.1;178.176.77.175:7.1.2
X-KSE-AntiSpam-Info: ApMailHostAddress: 178.176.77.175
X-KSE-AntiSpam-Info: {DNS response errors}
X-KSE-AntiSpam-Info: Rate: 59
X-KSE-AntiSpam-Info: Status: not_detected
X-KSE-AntiSpam-Info: Method: none
X-KSE-AntiSpam-Info: Auth:dmarc=temperror header.from=omp.ru;spf=temperror
 smtp.mailfrom=omp.ru;dkim=none
X-KSE-Antiphishing-Info: Clean
X-KSE-Antiphishing-ScanningType: Heuristic
X-KSE-Antiphishing-Method: None
X-KSE-Antiphishing-Bases: 02/28/2024 17:42:00
X-KSE-Antivirus-Interceptor-Info: scan successful
X-KSE-Antivirus-Info: Clean, bases: 2/28/2024 5:12:00 PM
X-KSE-Attachment-Filter-Triggered-Rules: Clean
X-KSE-Attachment-Filter-Triggered-Filters: Clean
X-KSE-BulkMessagesFiltering-Scan-Result: InTheLimit

On 2/28/24 1:32 AM, Niklas Söderlund wrote:

> Hello,
> 
> When RZ/G2L support was added the Rx code path was split in two, one to
> support R-Car and one to support RZ/G2L. One reason for this is that
> R-Car uses the extended Rx descriptor format, while RZ/G2L uses the
> normal descriptor format.
> 
> In many aspects this is not needed as the extended descriptor format is
> just a normal descriptor with extra metadata (timestamsp) appended. And
> the R-Car SoCs can also use normal descriptors if hardware timestamps
> where not desired. This split has lead to RZ/G2L gaining support for

   s/where/were/, s/lead/led/.

> split descriptors in the Rx path while R-Car still lacks this.
> 
> This series is the first step in trying to merge the R-Car and RZ/G2L Rx
> paths so features and bugs corrected in one will benefit the other.
> 
> The first patch in the series clarify that the driver now supports

   s/clarify/clarifies/.

> either normal or extended descriptors, not both at the same time by
> grouping them in a union. This is the foundation that later patches will
> build on the align the two Rx paths.

   Aligning?

> Patch 2-5 deals with correcting small issues in the Rx frame and

   Patches 2-5.

> descriptor sizes that either where incorrect at the time they were added

   s/where/were/.

> in 2017 (my bad) or concepts built on-top of this initial incorrect
> design.
> 
> While finally patch 6 merges the R-Car and RZ/G2L for Rx descriptor
> setup and maintenance.
> 
> When this work has landed I plan to follow up with more work aligning
> the rest of the Rx code paths and hopefully bring split descriptor
> support to the R-Car SoCs.
> 
> Niklas Söderlund (6):
>   ravb: Group descriptor types used in Rx ring
>   ravb: Make it clear the information relates to maximum frame size
>   ravb: Create helper to allocate skb and align it
>   ravb: Use the max frame size from hardware info for RZ/G2L
>   ravb: Move maximum Rx descriptor data usage to info struct
>   ravb: Unify Rx ring maintenance code paths
> 
>  drivers/net/ethernet/renesas/ravb.h      |  20 +--
>  drivers/net/ethernet/renesas/ravb_main.c | 210 ++++++++---------------
>  2 files changed, 83 insertions(+), 147 deletions(-)

   Dave, Jakub, et al, please don't merge this patchset without my review!
I'm hoping I can get to reviewing it closer to this weekend...

MBR, Sergey

