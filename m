Return-Path: <linux-renesas-soc+bounces-2597-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 5D556850A68
	for <lists+linux-renesas-soc@lfdr.de>; Sun, 11 Feb 2024 18:01:30 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id B7E9F280EF3
	for <lists+linux-renesas-soc@lfdr.de>; Sun, 11 Feb 2024 17:01:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 188575B5C1;
	Sun, 11 Feb 2024 17:01:26 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mx01.omp.ru (mx01.omp.ru [90.154.21.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B91642837D;
	Sun, 11 Feb 2024 17:01:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=90.154.21.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1707670886; cv=none; b=mj7HPLJFlNTo1gNVU3AuRhhOGsArK0MsJkIR2BxGSPISRRzl9GNE2ZOtMFNJAcpRT7SdBLDhmUBngZCfamqL2U2owEU/ZcGciur3wEp082nuEedX/CVY7fFM9q4yKZEklHhilkNAVBZ9yG6pXlOx+yTT1rGqzW/UcHELaBclMn4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1707670886; c=relaxed/simple;
	bh=O4WlW67D/j5t3kh1o84XLBFx5IFHMd/PhwIw1CykWIs=;
	h=Subject:To:CC:References:From:Message-ID:Date:MIME-Version:
	 In-Reply-To:Content-Type; b=koRyPothU3XJt8AyClALfx/723Gwh+Hr6dBFIvrumpSsvj+ZrxMyt01DYrC8H92hEchziag34cXlNdrGPX/xmIDV4km+ctijGarLZGeyV2JSlbVGOqHhKSezlEzm9kDp7IcUi6PpuCaq5XYcLlx6o2cBsltMwDTKbBwBlafb74E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=omp.ru; spf=pass smtp.mailfrom=omp.ru; arc=none smtp.client-ip=90.154.21.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=omp.ru
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=omp.ru
Received: from [192.168.1.105] (31.173.82.8) by msexch01.omp.ru (10.188.4.12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id 15.2.1258.12; Sun, 11 Feb
 2024 20:01:06 +0300
Subject: Re: [PATCH 0/2] arm64: dts: renesas: rcar-gen4: Correct avb[01] reg
 sizes
To: Geert Uytterhoeven <geert+renesas@glider.be>, Wolfram Sang
	<wsa+renesas@sang-engineering.com>
CC: <linux-renesas-soc@vger.kernel.org>,
	<linux-arm-kernel@lists.infradead.org>, <devicetree@vger.kernel.org>
References: <cover.1707660323.git.geert+renesas@glider.be>
From: Sergey Shtylyov <s.shtylyov@omp.ru>
Organization: Open Mobile Platform
Message-ID: <2ad6b391-c27a-389d-1933-a6e12c21f713@omp.ru>
Date: Sun, 11 Feb 2024 20:01:06 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.1
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
In-Reply-To: <cover.1707660323.git.geert+renesas@glider.be>
Content-Type: text/plain; charset="utf-8"
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: msexch01.omp.ru (10.188.4.12) To msexch01.omp.ru
 (10.188.4.12)
X-KSE-ServerInfo: msexch01.omp.ru, 9
X-KSE-AntiSpam-Interceptor-Info: scan successful
X-KSE-AntiSpam-Version: 6.1.0, Database issued on: 02/11/2024 16:50:49
X-KSE-AntiSpam-Status: KAS_STATUS_NOT_DETECTED
X-KSE-AntiSpam-Method: none
X-KSE-AntiSpam-Rate: 59
X-KSE-AntiSpam-Info: Lua profiles 183346 [Feb 11 2024]
X-KSE-AntiSpam-Info: Version: 6.1.0.3
X-KSE-AntiSpam-Info: Envelope from: s.shtylyov@omp.ru
X-KSE-AntiSpam-Info: LuaCore: 7 0.3.7 6d6bf5bd8eea7373134f756a2fd73e9456bb7d1a
X-KSE-AntiSpam-Info: {rep_avail}
X-KSE-AntiSpam-Info: {Tracking_from_domain_doesnt_match_to}
X-KSE-AntiSpam-Info: {relay has no DNS name}
X-KSE-AntiSpam-Info: {SMTP from is not routable}
X-KSE-AntiSpam-Info: {Found in DNSBL: 31.173.82.8 in (user)
 b.barracudacentral.org}
X-KSE-AntiSpam-Info:
	127.0.0.199:7.1.2;d41d8cd98f00b204e9800998ecf8427e.com:7.1.1;omp.ru:7.1.1
X-KSE-AntiSpam-Info: ApMailHostAddress: 31.173.82.8
X-KSE-AntiSpam-Info: {DNS response errors}
X-KSE-AntiSpam-Info: Rate: 59
X-KSE-AntiSpam-Info: Status: not_detected
X-KSE-AntiSpam-Info: Method: none
X-KSE-AntiSpam-Info: Auth:dmarc=temperror header.from=omp.ru;spf=temperror
 smtp.mailfrom=omp.ru;dkim=none
X-KSE-Antiphishing-Info: Clean
X-KSE-Antiphishing-ScanningType: Heuristic
X-KSE-Antiphishing-Method: None
X-KSE-Antiphishing-Bases: 02/11/2024 16:56:00
X-KSE-Antivirus-Interceptor-Info: scan successful
X-KSE-Antivirus-Info: Clean, bases: 2/11/2024 2:00:00 PM
X-KSE-Attachment-Filter-Triggered-Rules: Clean
X-KSE-Attachment-Filter-Triggered-Filters: Clean
X-KSE-BulkMessagesFiltering-Scan-Result: InTheLimit

On 2/11/24 5:21 PM, Geert Uytterhoeven wrote:
> 	Hi all,
> 
> All Ethernet AVB instances on R-Car Gen4 SoCs have registers related to
> UDP/IP support, starting at offset 0x800.  However, the register blocks

   TCP/UDP/ICMP, actually.

> for some (but not all) instances are too small to cover them.
> 
> This patch series fixes this by extending the register block sizes where
> needed.  Note that this has no immediate impact on actual operation, as
> the Linux driver does not use the UDP/IP registers.  Besides, ioremap()

   In fact, it does write to CSR0 at offset 0x800... and in the net-next.git
the checksum offload is now used.

> granulatity is PAGE_SIZE, so the registers are accessible anyway.

   Ah, indeed, PAGE_SIZE is not less than 0x1000. :-)

> I also considered introducing a new reg tuplet to cover the UDP/IP
> registers.  However, that would complicate handling as some instances
> (on some R-Car Gen2/3 SoCs) already have two reg tuplets, and there are
> no reg-names defined:
> 
>     reg:
>       items:
> 	- description: MAC register block
> 	- description: Stream buffer
> 
> So I think just enlarging the first register block would be fine.

   Yep, thanks! :-)

> To be queued in renesas-devel for v6.9, if you agree.
> 
> Thanks for your comments!
> 
> Geert Uytterhoeven (2):
>   arm64: dts: renesas: r8a779a0: Correct avb[01] reg sizes
>   arm64: dts: renesas: r8a779g0: Correct avb[01] reg sizes
> 
>  arch/arm64/boot/dts/renesas/r8a779a0.dtsi | 4 ++--
>  arch/arm64/boot/dts/renesas/r8a779g0.dtsi | 4 ++--
>  2 files changed, 4 insertions(+), 4 deletions(-)

MBR, Sergey

