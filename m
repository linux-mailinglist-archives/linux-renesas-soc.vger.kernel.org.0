Return-Path: <linux-renesas-soc+bounces-11773-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 110EC9FFA52
	for <lists+linux-renesas-soc@lfdr.de>; Thu,  2 Jan 2025 15:19:37 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id DE8607A180F
	for <lists+linux-renesas-soc@lfdr.de>; Thu,  2 Jan 2025 14:19:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6E9DE1A23BE;
	Thu,  2 Jan 2025 14:19:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="i2apnsVy"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3F2E717996;
	Thu,  2 Jan 2025 14:19:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1735827569; cv=none; b=RNi8fJnEz2wcZTT98hYvOD7Rx90swXqcrLzvwT2mxhIcFQpPCIjU2i6dDoQikM8ndKSWLehoPymuNoaBEw2tCXtV4jJWw+O8NuQOicHIHoK47kyJAYiYYlxD90gEnPKnF4oU6sMTBsEYIGtnsFNBuRPzoujMTEnLDyd1cWDQg08=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1735827569; c=relaxed/simple;
	bh=rm94Wn4LvKiu88EToTbZs1ptXX/jO3nGcHuSO/KyWDw=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=T9iNkPKuy5o5WJ/HAEXAV+G61zgKmS+8y8MfqgHrSe5+cugbUuaNorhvf/MhWmpRQCNfus5+cvxXSYA04hHjEblMhN/+jKbdaTJr86SsOO9Ol5Yu8ux3qTQn0zzU1ZqrDgmi7reNYjMGPeY5/aNGCdAUTEKToQEPI3WTqDQPpds=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=i2apnsVy; arc=none smtp.client-ip=198.175.65.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1735827568; x=1767363568;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=rm94Wn4LvKiu88EToTbZs1ptXX/jO3nGcHuSO/KyWDw=;
  b=i2apnsVyL9FiKs3xYbZ4RApXwQdkST8aljsY40WK1R7ZEETX2JKa/3Ji
   tWxJdOeb8tDYAkrxpt0Nhe4H5No73hg3aXo3jWniXLqGcwyPNhx4+uttT
   FOr1XED1f7j6tgEd/Lf/Qh/0Az9+oqrxlCj4GBAWjfasKqYopvJpA983X
   CUCa8m89jYzXGxUAp0g+MvScfdQm+XtssqL9o0AOtaEkgS1BWEWRGq2jP
   ZwqjOYv95xBwjx9nOVDcPK4RFpVusJp0YL37RKw98rHS7iBjCBUBFmqT+
   PNRGuwLvJ9LwXv29YLdY8N9PA+YwPYMiEafhPsYpI4ZdTdmk5AFqDoaZc
   Q==;
X-CSE-ConnectionGUID: +905LqEYSxqkV94yInbQtw==
X-CSE-MsgGUID: KhALxOoCRPu0KH5yRtSmtQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11302"; a="35765650"
X-IronPort-AV: E=Sophos;i="6.12,285,1728975600"; 
   d="scan'208";a="35765650"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Jan 2025 06:19:13 -0800
X-CSE-ConnectionGUID: jvEewcFBSQSc47fU8lfD7A==
X-CSE-MsgGUID: YOazHrQqRHWuwLA3uTw5uA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,285,1728975600"; 
   d="scan'208";a="102018216"
Received: from mylly.fi.intel.com (HELO [10.237.72.154]) ([10.237.72.154])
  by fmviesa009.fm.intel.com with ESMTP; 02 Jan 2025 06:19:10 -0800
Message-ID: <76f97f65-28ad-4d7f-894c-e2d1f241e973@linux.intel.com>
Date: Thu, 2 Jan 2025 16:19:09 +0200
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH RFT v2 4/5] i3c: mipi-i3c-hci: use get_parity8 helper
 instead of open coding it
To: Wolfram Sang <wsa+renesas@sang-engineering.com>,
 linux-i3c@lists.infradead.org
Cc: linux-kernel@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
 Rasmus Villemoes <linux@rasmusvillemoes.dk>,
 Alexandre Belloni <alexandre.belloni@bootlin.com>
References: <20241229101234.2896-1-wsa+renesas@sang-engineering.com>
 <20241229101234.2896-5-wsa+renesas@sang-engineering.com>
Content-Language: en-US
From: Jarkko Nikula <jarkko.nikula@linux.intel.com>
In-Reply-To: <20241229101234.2896-5-wsa+renesas@sang-engineering.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 12/29/24 12:12 PM, Wolfram Sang wrote:
> The kernel has now a generic helper for getting parity with easier to
> understand semantics. Make use of it.
> 
> Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
> ---
> Changes since v1:
> 
> * renamed from 'get_parity8' to 'parity8'
> * rebased to 6.13-rc4
> 
>   drivers/i3c/master/mipi-i3c-hci/dat_v1.c | 11 +----------
>   1 file changed, 1 insertion(+), 10 deletions(-)
> 
Please rename s/get_parity8/parity8/ also in the subject line of patches 
3-5.

For this patch:

Tested-by: Jarkko Nikula <jarkko.nikula@linux.intel.com>

