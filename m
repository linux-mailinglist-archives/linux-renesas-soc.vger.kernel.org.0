Return-Path: <linux-renesas-soc+bounces-25168-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [142.0.200.124])
	by mail.lfdr.de (Postfix) with ESMTPS id BE1ECC89DA5
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 26 Nov 2025 13:47:44 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 0D1234E75C8
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 26 Nov 2025 12:47:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 76E1D207A0B;
	Wed, 26 Nov 2025 12:47:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="K35AgfhW"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8E6B017A2E6;
	Wed, 26 Nov 2025 12:47:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764161230; cv=none; b=QYxk6OvCZlYPLa0WKWX16b5sg0SIkH13J7mM3MY9D0zRtGV7sKt5Qg6MjT2mV8izpGjdzgmMe6MU7qxNiQtGM4Ii9bWgmZDGhE7ShZGntmF4aA+sbqwffgOpVtS1V/4nXBmJ4GVcT4Ha+Ka3lFieCLLjT5F0gLDYZbx1d9dEXXY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764161230; c=relaxed/simple;
	bh=uLIRG/epEZec6lTNXOKl04v037rupYlsmACiAelq2r8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=SnCIo82m0TrgPIqF6WAztJTuxjVWL3Pc9Eor2qj4h+GueHlmvbC0qs1rTSrj0KbjDfn733lq5k+UcL/bO3zEsdfDykXsEJqsuVZfGCaEwf5IZyON3Wm3sWrILAqmCm/2JQ/Hlub1VwWVIIthwjDQzndQsgyhdB5cH3lUfb82vMc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=K35AgfhW; arc=none smtp.client-ip=198.175.65.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1764161229; x=1795697229;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=uLIRG/epEZec6lTNXOKl04v037rupYlsmACiAelq2r8=;
  b=K35AgfhWMJ4o4y/nLVZuqLra5UnK9BCtZ889lj1nCzm753ljeVaIiPgk
   X0zHEXF2JyR9wOk3lsKJm3Owz//+/Tn7M77tXYti0az5REsXIOL31Mp7I
   wx079Uvvvguo74L/xwEjzOCLVStUiS6MyERf0VmJxrWujwUqFl2hPbbfQ
   owFQGvxcC1acJbAfjgSD0UeKN3WWuyoSgTn/5FM9MjCwHU02e/gisQVgP
   YlNDaiT7isa8RDLkIy1ZUwbPAvo6xAaLYRz1+OnpkF8Zokih2KUNwH3Td
   VvCkLKsG7X3+33VWMTMkQe9gpbpRdB1u5BuRNwnAghgyXqGg5Um8wRSva
   w==;
X-CSE-ConnectionGUID: /zBwaAijRhC3/IGQdvHPJQ==
X-CSE-MsgGUID: 1ThmzWNrSsmMj+S9M9wp+A==
X-IronPort-AV: E=McAfee;i="6800,10657,11624"; a="69817782"
X-IronPort-AV: E=Sophos;i="6.20,228,1758610800"; 
   d="scan'208";a="69817782"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Nov 2025 04:47:07 -0800
X-CSE-ConnectionGUID: CDD7CE7YS1GYyisgkCkVww==
X-CSE-MsgGUID: pKh8MLSLR9mUWDKTjAmFMg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,228,1758610800"; 
   d="scan'208";a="192190999"
Received: from black.igk.intel.com ([10.91.253.5])
  by orviesa010.jf.intel.com with ESMTP; 26 Nov 2025 04:47:05 -0800
Received: by black.igk.intel.com (Postfix, from userid 1003)
	id CE7ADA0; Wed, 26 Nov 2025 13:47:03 +0100 (CET)
Date: Wed, 26 Nov 2025 13:47:03 +0100
From: Andy Shevchenko <andriy.shevchenko@intel.com>
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: Haotian Zhang <vulab@iscas.ac.cn>, herve.codina@bootlin.com,
	gregkh@linuxfoundation.org, linux-renesas-soc@vger.kernel.org,
	linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] usb: gadget: renesas_usbf: Handle
 devm_pm_runtime_enable() errors
Message-ID: <aSb2x6Qiru4KLOcy@black.igk.intel.com>
References: <20251124022215.1619-1-vulab@iscas.ac.cn>
 <CAMuHMdUSPSjh4nQ1B6NJdYZw3qW30Tx5zci6vy_9Hy6BS64FWQ@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAMuHMdUSPSjh4nQ1B6NJdYZw3qW30Tx5zci6vy_9Hy6BS64FWQ@mail.gmail.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo

On Mon, Nov 24, 2025 at 02:15:14PM +0100, Geert Uytterhoeven wrote:
> On Mon, 24 Nov 2025 at 03:24, Haotian Zhang <vulab@iscas.ac.cn> wrote:

> Thanks for your patch!

...

> > -       devm_pm_runtime_enable(&pdev->dev);
> > +       ret = devm_pm_runtime_enable(&pdev->dev);
> > +       if (ret)
> > +               return ret;
> 
> Perhaps insert a blank line here?
> 
> >         ret = pm_runtime_resume_and_get(&pdev->dev);
> >         if (ret < 0)
> >                 return ret;

FWIW, if not fixed yet, this driver from this line towards the end of
the function leaks the PM runtime reference count.

> Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>

-- 
With Best Regards,
Andy Shevchenko



