Return-Path: <linux-renesas-soc+bounces-4403-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 4895F89D63B
	for <lists+linux-renesas-soc@lfdr.de>; Tue,  9 Apr 2024 12:05:40 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 02C7F284383
	for <lists+linux-renesas-soc@lfdr.de>; Tue,  9 Apr 2024 10:05:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4AF73811E8;
	Tue,  9 Apr 2024 10:04:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="C6a5eYsK"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8129185631
	for <linux-renesas-soc@vger.kernel.org>; Tue,  9 Apr 2024 10:04:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1712657091; cv=none; b=u8TRuIxxdfoLSTwXpfWkRaARf076ULf4oDhHoouJxra2ZI6ehRbzRcW2T1aub1HIRniy7DSMtvl6q618Sxm8+4u10FIRKcJh1ns66Y8XUYf0p9mGU9OYecRtYWSK/0nkytlcrYCgFFl5dbNEyNDy1ld1vU5p5tHMCqWuY4d761Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1712657091; c=relaxed/simple;
	bh=YGIVoqaqkmzn78vlWTEumv3CXIci03l0Ha+15dNRnaY=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=Ibi6N3Wt3DgwaKyj4Ar+ViOmS/lCin91QeHomtRRZ0+BfD5mQoJNh24tztAwmSkMfIx4/DkWIpHi7cLjkpwPBKRTeV/OK38TUzxEI9s9C5pNn+Ujpq7sy3cUyVCnw/gNC4dJxv31KKHTD2AwdP8Yc3AoXu/lrsm7tNKaJ9H/DGs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=C6a5eYsK; arc=none smtp.client-ip=198.175.65.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1712657089; x=1744193089;
  h=from:to:cc:subject:in-reply-to:references:date:
   message-id:mime-version;
  bh=YGIVoqaqkmzn78vlWTEumv3CXIci03l0Ha+15dNRnaY=;
  b=C6a5eYsKSE+GyxmW9Bpw5sUvx1VdDBPijtXOibFTLWZ50FWktsldPOB4
   v2itzI7sCUfONQhS8yZAGPlQExTt07vkGPh71TV/rFfbSOtgRwbApSQPK
   mad2pfi4sW9q+41gZJ/D60djW0wwTKbCMaB7TGwTeTtwvnFHguvaA6HtE
   gCtc3HlvUuqhqHXmsitVSIXKnx4n4+UbUiT0tl/u2TS+vGvnPfA6is/vy
   LgtSuc4e1GMzutBgMjySpzUEC+JfJ2e2mh74ehmwVdxuCCI0BE0Baz8Ze
   vA3KfcwuHUr540/CoirSVZn/rF6tCqJ6d3lPtclRuEFTPa3uM/gAAGDlO
   A==;
X-CSE-ConnectionGUID: DySz3S8lQheP5zg/+eE2WA==
X-CSE-MsgGUID: r6iAzir7Rki77kys2o3whQ==
X-IronPort-AV: E=McAfee;i="6600,9927,11038"; a="11760017"
X-IronPort-AV: E=Sophos;i="6.07,189,1708416000"; 
   d="scan'208";a="11760017"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Apr 2024 03:04:48 -0700
X-CSE-ConnectionGUID: 8btXhK/XTSuOGqbIvLqN0w==
X-CSE-MsgGUID: oOTcSj4wTLKSF9UBEqAcoA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,189,1708416000"; 
   d="scan'208";a="20207915"
Received: from mserban-mobl1.ger.corp.intel.com (HELO localhost) ([10.252.59.228])
  by fmviesa006-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Apr 2024 03:04:44 -0700
From: Jani Nikula <jani.nikula@linux.intel.com>
To: Geert Uytterhoeven <geert@linux-m68k.org>, Maxime Ripard
 <mripard@kernel.org>
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Thomas Zimmermann
 <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, Daniel Vetter
 <daniel@ffwll.ch>, dri-devel@lists.freedesktop.org, Lucas
 De Marchi <lucas.demarchi@intel.com>, kernel test robot <lkp@intel.com>,
 linux-renesas-soc@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v3 00/13] drm/display: Convert helpers Kconfig symbols
 to depends on
In-Reply-To: <a816fea-9974-d17f-bed6-69728e223@linux-m68k.org>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <20240327-kms-kconfig-helpers-v3-0-eafee11b84b3@kernel.org>
 <a816fea-9974-d17f-bed6-69728e223@linux-m68k.org>
Date: Tue, 09 Apr 2024 13:04:42 +0300
Message-ID: <87sezu97id.fsf@intel.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain

On Tue, 09 Apr 2024, Geert Uytterhoeven <geert@linux-m68k.org> wrote:
> The user should not need to know which helpers are needed for the driver
> he is interested in.  When a symbol selects another symbol, it should
> just make sure the dependencies of the target symbol are met.

It's really not "just make sure". This leads to perpetual illegal
configurations, and duct tape fixes. Select should not be used for
visible symbols or symbols with dependencies [1].

What we'd need for usability is not more abuse of select, but rather 1)
warnings for selecting symbols with dependencies, and 2) a way to enable
a kconfig option with all its dependencies, recursively. This is what we
lack.


BR,
Jani.


[1] Documentation/kbuild/kconfig-language.rst "reverse dependencies"


-- 
Jani Nikula, Intel

