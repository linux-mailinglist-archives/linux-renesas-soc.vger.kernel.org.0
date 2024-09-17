Return-Path: <linux-renesas-soc+bounces-8970-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id B049797B0E2
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 17 Sep 2024 15:42:08 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 7A1C8288BF0
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 17 Sep 2024 13:42:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 743191662F6;
	Tue, 17 Sep 2024 13:40:58 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mx01.omp.ru (mx01.omp.ru [90.154.21.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 59A3116B75B
	for <linux-renesas-soc@vger.kernel.org>; Tue, 17 Sep 2024 13:40:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=90.154.21.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726580458; cv=none; b=MAfAaSlLHwO+nQ4icjQgDy64VLmUWyyj57fBqd6D+c0kPl2298IC3cZ4X61DiG2NkutwnOjmsZksDNuDdB11Ieszh5KH3OyqgFOQts90YchzR/24pulcgb6kzhOYNFD5QmEuJQC2vRPFoHCyqB94uyHqeliMkR8cOuwrzTBYes4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726580458; c=relaxed/simple;
	bh=er/Zag/IlU8zzwbmwesjc+cjWpaAStHNXjD+F0U9qog=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=JceSDcwPfKWhQACik46bktvX3c0uX7FzaE63MmotxKJ1ylsMZiUeo1qq8llBN8bA/EUbqQX9g6rwmL3RE+0/Vf+KXc7ZMxWw3HeuhcksqYu2wMU9kPUf4vhApsUvt6QzmedNVCPY9At54lx6Aj+qM3Vd0g/JCeARRdoqwnUlpZI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=omp.ru; spf=pass smtp.mailfrom=omp.ru; arc=none smtp.client-ip=90.154.21.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=omp.ru
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=omp.ru
Received: from [192.168.1.108] (178.176.75.202) by msexch01.omp.ru
 (10.188.4.12) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id 15.2.1258.12; Tue, 17 Sep
 2024 16:40:36 +0300
Message-ID: <3acac3fb-7e23-8d8d-974e-dec7bffb8125@omp.ru>
Date: Tue, 17 Sep 2024 16:40:14 +0300
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.0
Subject: Re: [PATCH] RISC-V: defconfig: Remove ARCH_RENESAS
Content-Language: en-US
To: Palmer Dabbelt <palmer@rivosinc.com>, <prabhakar.csengg@gmail.com>,
	<geert+renesas@glider.be>
CC: <linux-riscv@lists.infradead.org>, <linux-renesas-soc@vger.kernel.org>
References: <20240917131936.18980-1-palmer@rivosinc.com>
From: Sergey Shtylyov <s.shtylyov@omp.ru>
Organization: Open Mobile Platform
In-Reply-To: <20240917131936.18980-1-palmer@rivosinc.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: msexch01.omp.ru (10.188.4.12) To msexch01.omp.ru
 (10.188.4.12)
X-KSE-ServerInfo: msexch01.omp.ru, 9
X-KSE-AntiSpam-Interceptor-Info: scan successful
X-KSE-AntiSpam-Version: 6.1.1, Database issued on: 09/17/2024 13:30:04
X-KSE-AntiSpam-Status: KAS_STATUS_NOT_DETECTED
X-KSE-AntiSpam-Method: none
X-KSE-AntiSpam-Rate: 59
X-KSE-AntiSpam-Info: Lua profiles 187802 [Sep 17 2024]
X-KSE-AntiSpam-Info: Version: 6.1.1.5
X-KSE-AntiSpam-Info: Envelope from: s.shtylyov@omp.ru
X-KSE-AntiSpam-Info: LuaCore: 34 0.3.34
 8a1fac695d5606478feba790382a59668a4f0039
X-KSE-AntiSpam-Info: {rep_avail}
X-KSE-AntiSpam-Info: {Tracking_from_domain_doesnt_match_to}
X-KSE-AntiSpam-Info: {relay has no DNS name}
X-KSE-AntiSpam-Info: {SMTP from is not routable}
X-KSE-AntiSpam-Info:
	d41d8cd98f00b204e9800998ecf8427e.com:7.1.1;omp.ru:7.1.1;127.0.0.199:7.1.2
X-KSE-AntiSpam-Info: FromAlignment: s
X-KSE-AntiSpam-Info: ApMailHostAddress: 178.176.75.202
X-KSE-AntiSpam-Info: {DNS response errors}
X-KSE-AntiSpam-Info: Rate: 59
X-KSE-AntiSpam-Info: Status: not_detected
X-KSE-AntiSpam-Info: Method: none
X-KSE-AntiSpam-Info: Auth:dmarc=temperror header.from=omp.ru;spf=temperror
 smtp.mailfrom=omp.ru;dkim=none
X-KSE-Antiphishing-Info: Clean
X-KSE-Antiphishing-ScanningType: Heuristic
X-KSE-Antiphishing-Method: None
X-KSE-Antiphishing-Bases: 09/17/2024 13:33:00
X-KSE-Antivirus-Interceptor-Info: scan successful
X-KSE-Antivirus-Info: Clean, bases: 9/17/2024 11:32:00 AM
X-KSE-Attachment-Filter-Triggered-Rules: Clean
X-KSE-Attachment-Filter-Triggered-Filters: Clean
X-KSE-BulkMessagesFiltering-Scan-Result: InTheLimit

On 9/17/24 16:19, Palmer Dabbelt wrote:

> The RZ/Five is gated behind CONFIG_NONPORTABLE because of the DMA pool
> issue.  e36ddf322686 ("riscv: defconfig: Disable RZ/Five peripheral

   Commit e36ddf322686?

> support") removes the drivers, so let's remove the rest of the vendor
> support as well -- users of these will already have to play aruond with

   Around. :-)

> kernel configs, so this shouldn't be much of a burden.
> 
> Signed-off-by: Palmer Dabbelt <palmer@rivosinc.com>
[...]

MBR, Sergey

