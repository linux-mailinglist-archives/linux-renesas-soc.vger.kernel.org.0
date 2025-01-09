Return-Path: <linux-renesas-soc+bounces-11983-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id A5B4EA075F6
	for <lists+linux-renesas-soc@lfdr.de>; Thu,  9 Jan 2025 13:43:06 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 88E173A2F68
	for <lists+linux-renesas-soc@lfdr.de>; Thu,  9 Jan 2025 12:42:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B23F863B9;
	Thu,  9 Jan 2025 12:42:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Eqo3iJ9n"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1C5452185A9
	for <linux-renesas-soc@vger.kernel.org>; Thu,  9 Jan 2025 12:42:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736426573; cv=none; b=N4C1VDwmP17tK9dIuI6LzxWlS5Q+ErO2WyFa07lg/S8pjpnSYw5TxQA9kvN69nToxMdv0s0w0jYJNaVPr2ZaK/1u3PjEnpEdJKlWcPzsc06UnOSBfzb/uP3lexl5biCXHTfQMq7sQZpSUjczWVCNwVxkJhPOny0Eg/OB3ZcdeUI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736426573; c=relaxed/simple;
	bh=pXb3J5/MDM/JRxgrXrNymwNsZk7Vq3QCDxx/Unn1YIo=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=eCxw3LE1UDrt9ogwk7Hxd73/F4pnzJDUBKPMii5TCtvX5R6v0TzOCJcZOr8x5X03MJz5SHxh+JPBYVBWTBndpMhWUmd8GMdIFw87tU1PHW2iYoXwF260NvWPpc+Io7jjIEUuGNnIQ+wUpu5oC62JDmU2oLV+H3UZp24HXVwMeuo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Eqo3iJ9n; arc=none smtp.client-ip=198.175.65.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1736426573; x=1767962573;
  h=from:to:cc:subject:in-reply-to:references:date:
   message-id:mime-version;
  bh=pXb3J5/MDM/JRxgrXrNymwNsZk7Vq3QCDxx/Unn1YIo=;
  b=Eqo3iJ9n/O90jO5nFOc9W4Xq6H94DE1QahVXB1Z+njlGktcnriWzZLpW
   L2mTOxIvmbUGKOInZKHxud9bfHo4eRj+GupAC6m1Yle7Ons6caMuw0E1X
   ARrVBs37r/zMXc0I3sk2QYsZxaYy1wfUhj7sSQ6TS4QeXDfVPWSkrV+L1
   CRMrdw3zsYNSsjQ/aPxyfzo8doD5zYWVT7JFUbpkcMBGPSKIrsz0IjfPp
   +ltQxR6n/of5RaYprfTPOZXxxW1Nmxck6TEvEvSOeBMQBL3BlAofBDB08
   ObvB9/LtxQXIZ0uHRQ6i2yQTH8Jy0mxjOy0DUzyLVhdZl+Pk24rAm6/+R
   Q==;
X-CSE-ConnectionGUID: Gwb7h/C0QxuQGxsPnjBHBA==
X-CSE-MsgGUID: 91Og5lnWQTq2C+iRxs2a9w==
X-IronPort-AV: E=McAfee;i="6700,10204,11310"; a="47671281"
X-IronPort-AV: E=Sophos;i="6.12,301,1728975600"; 
   d="scan'208";a="47671281"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Jan 2025 04:42:52 -0800
X-CSE-ConnectionGUID: 8RNv4ig7TICaN3a9JpE2Cg==
X-CSE-MsgGUID: An8aZnsBRcq/dF7jnC8qWQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; 
   d="scan'208";a="104270578"
Received: from unknown (HELO localhost) ([10.237.66.160])
  by orviesa008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Jan 2025 04:42:49 -0800
From: Jani Nikula <jani.nikula@intel.com>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: dri-devel@lists.freedesktop.org, intel-gfx@lists.freedesktop.org, Kieran
 Bingham <kieran.bingham+renesas@ideasonboard.com>,
 linux-renesas-soc@vger.kernel.org, Nathan Chancellor <nathan@kernel.org>
Subject: Re: [PATCH v2 2/3] drm: renesas: rcar-du: annotate rcar_cmm_read()
 with __maybe_unused
In-Reply-To: <20241205160234.GN10736@pendragon.ideasonboard.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <cover.1733410889.git.jani.nikula@intel.com>
 <5b0df175e8b86e5d8746ee32e63bb633bc2765b1.1733410889.git.jani.nikula@intel.com>
 <20241205160234.GN10736@pendragon.ideasonboard.com>
Date: Thu, 09 Jan 2025 14:42:41 +0200
Message-ID: <87plkwjgzi.fsf@intel.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain

On Thu, 05 Dec 2024, Laurent Pinchart <laurent.pinchart@ideasonboard.com> wrote:
> On Thu, Dec 05, 2024 at 05:03:00PM +0200, Jani Nikula wrote:
>> Building with clang and and W=1 leads to warning about unused
>> rcar_cmm_read(). Fix by annotating it with __maybe_unused.
>> 
>> See also commit 6863f5643dd7 ("kbuild: allow Clang to find unused static
>> inline functions for W=1 build").
>> 
>> Signed-off-by: Jani Nikula <jani.nikula@intel.com>
>
> https://lore.kernel.org/r/20240911095113.GB4470@pendragon.ideasonboard.com
>
> I wonder if Dave and Sima are starting to ignore my pull request in the
> hope I'll switch to using drm-misc :-S I'll send another one.

Have you sent the pull request again? I haven't seen one.

BR,
Jani.

>
>> ---
>> 
>> Cc: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
>> Cc: Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>
>> Cc: linux-renesas-soc@vger.kernel.org
>> Cc: Nathan Chancellor <nathan@kernel.org>
>> ---
>>  drivers/gpu/drm/renesas/rcar-du/rcar_cmm.c | 2 +-
>>  1 file changed, 1 insertion(+), 1 deletion(-)
>> 
>> diff --git a/drivers/gpu/drm/renesas/rcar-du/rcar_cmm.c b/drivers/gpu/drm/renesas/rcar-du/rcar_cmm.c
>> index 26a2f5ad8ee5..ea52b0af9226 100644
>> --- a/drivers/gpu/drm/renesas/rcar-du/rcar_cmm.c
>> +++ b/drivers/gpu/drm/renesas/rcar-du/rcar_cmm.c
>> @@ -32,7 +32,7 @@ struct rcar_cmm {
>>  	} lut;
>>  };
>>  
>> -static inline int rcar_cmm_read(struct rcar_cmm *rcmm, u32 reg)
>> +static inline __maybe_unused int rcar_cmm_read(struct rcar_cmm *rcmm, u32 reg)
>>  {
>>  	return ioread32(rcmm->base + reg);
>>  }

-- 
Jani Nikula, Intel

