Return-Path: <linux-renesas-soc+bounces-8936-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 0B805974F93
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 11 Sep 2024 12:22:09 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 8E07BB26B91
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 11 Sep 2024 10:22:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C00667EEFD;
	Wed, 11 Sep 2024 10:21:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="By4fSepP"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 282E6184551
	for <linux-renesas-soc@vger.kernel.org>; Wed, 11 Sep 2024 10:21:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726050098; cv=none; b=RHo7CcaT55LQFyccp70Um3QY8XpkdP6EXP2y5EHCm0Hdkqo+K+/ubakI9jnY0JLMH9/E+rVCqNXP21nDg/+Tq3SK3AGwS2zaPOFsHghUhcAf4qAwT0xav0Pwfaz8JE/vOCKUoV6GblUH2rUDFmBRcSPq5yKSZsLjhx68F1Xv7n8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726050098; c=relaxed/simple;
	bh=ybypotxL6xwRDLFzYoQz+aSH4RrX5xRB2iJEAbEekKA=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=C5L+FpMByimJybJ9fb+gBjDCCAmtjrWsOjfakVdoAOI3fkk+H5KIue/zb+KOLXEFueTbJYSPOLiSv25Nz9jUQC9iYf/gL4mLxLsHWCiACcMUj3h9VyoJOWd5iGWTFdLNYmhPSmcnvj0OUKmrtNY9omillO3VPn+AKVVc/VyUhrQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=By4fSepP; arc=none smtp.client-ip=198.175.65.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1726050098; x=1757586098;
  h=from:to:cc:subject:in-reply-to:references:date:
   message-id:mime-version;
  bh=ybypotxL6xwRDLFzYoQz+aSH4RrX5xRB2iJEAbEekKA=;
  b=By4fSepPMrdsRT10Zyw2zUMLJ6C4sobW4LwaJugLVksl8vQTFOr83vAY
   WjTBvToRf5hgRxIg7YsueOM3tm5A1AhDpW0VHXejdWsvoCo/le5UHzfic
   7CtLdE1bPQshctJ0cM30jEIjJpxSfQmGjnnA+HaWX4TD8jtcMOSl+0tsa
   xTrB16YaqFUBg71GRLy1No6raBYt+MtQvE0se4M5vJFfumCXFt+dydWCQ
   r36OenajhyKrWUw+ZU1tRAIpz49nuj9VBAHPrM12wjLm3d7WLzL1sB0xK
   J51+hqW8oh5F5ArK8IzHVfHrTbQyDAAJt87S9QgbYlLCjrmycZTP7URYt
   g==;
X-CSE-ConnectionGUID: eMRDeTWDTv2iaEGKEOFB8w==
X-CSE-MsgGUID: KRX5fdl2SyqJ2QsSdfPw9Q==
X-IronPort-AV: E=McAfee;i="6700,10204,11191"; a="24986774"
X-IronPort-AV: E=Sophos;i="6.10,219,1719903600"; 
   d="scan'208";a="24986774"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Sep 2024 03:21:36 -0700
X-CSE-ConnectionGUID: wZAUmiH8TCy8CYjUfZOLWA==
X-CSE-MsgGUID: /776MYdhSHyv+rpwdDzXxA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,219,1719903600"; 
   d="scan'208";a="104780772"
Received: from bergbenj-mobl1.ger.corp.intel.com (HELO localhost) ([10.245.246.181])
  by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Sep 2024 03:21:32 -0700
From: Jani Nikula <jani.nikula@intel.com>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: Geert Uytterhoeven <geert@linux-m68k.org>,
 dri-devel@lists.freedesktop.org, intel-gfx@lists.freedesktop.org,
 intel-xe@lists.freedesktop.org, Nathan Chancellor <nathan@kernel.org>,
 Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
 linux-renesas-soc@vger.kernel.org
Subject: Re: [PATCH 2/8] drm: renesas: rcar-du: annotate rcar_cmm_read()
 with __maybe_unused
In-Reply-To: <20240911095113.GB4470@pendragon.ideasonboard.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <cover.1725962479.git.jani.nikula@intel.com>
 <f2b721e28b9ee2711d7848abf1774ecb8ce8e5e2.1725962479.git.jani.nikula@intel.com>
 <CAMuHMdWJDKO-0o9GiGzuZ=yuYpZ1myB+A00zYwNj=+6baAq3Rw@mail.gmail.com>
 <87jzfjk4vy.fsf@intel.com>
 <20240911095113.GB4470@pendragon.ideasonboard.com>
Date: Wed, 11 Sep 2024 13:21:27 +0300
Message-ID: <87bk0ujxso.fsf@intel.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain

On Wed, 11 Sep 2024, Laurent Pinchart <laurent.pinchart@ideasonboard.com> wrote:
> Jiapeng Chong has sent a patch to drop the function, and I've reviewed
> it. See https://lore.kernel.org/r/20240619075436.86407-1-jiapeng.chong@linux.alibaba.com

Even better, thanks!

BR,
Jani.

-- 
Jani Nikula, Intel

