Return-Path: <linux-renesas-soc+bounces-23183-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id EB792BE5379
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 16 Oct 2025 21:22:18 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id B2AE040346C
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 16 Oct 2025 19:22:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BDD272D97B7;
	Thu, 16 Oct 2025 19:22:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="HGhzUPvp"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D93923346AF;
	Thu, 16 Oct 2025 19:22:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760642533; cv=none; b=Ktn78t6qPI5IeqP62OuW7vfRd09dBHa2JP9TUi8fbwfxY+UemxR1ABr2QQuk44J0bIFbMXgqIrSF0WATkvlZkCBGOXIwmpaEXeTfpXPhN7mVylZ3slS9zU/wUVhIbUPXEd/h3BLiIzLC/U/jrxhcHVfnI/Q5lPJ5vrITQYw7F3Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760642533; c=relaxed/simple;
	bh=70CHvEmZWEz+900ZJiNa3jXRD54PcFWARg2uD+iSNUs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=kzKsZ6HI5Zz1T0dG9KjxCwvfbEwgNheGP0nHjusWg7BeZLT9F2+wi6vQDLuzW8WSPRCt/FNEOHJ/F9y/1I8DqC4m3THmv1dAnxmRocuT30gpFggrIJd2QjRPxU9yseCJ0oh5aG46UbUKoFfk684wA0OXjqhxc78JlB8MOTLqZNA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=HGhzUPvp; arc=none smtp.client-ip=192.198.163.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1760642531; x=1792178531;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=70CHvEmZWEz+900ZJiNa3jXRD54PcFWARg2uD+iSNUs=;
  b=HGhzUPvpWL40GT0HcNWBLlYVjFS9FkZ0DeQAtw1s9Z5CO81GoAMwtzUb
   dE3Rc5IbPY1jWg54gI1YM4eDinCJxIBpQPv80o6NG3TTfwWuyd0BnG2bF
   mtA3kx/B4fvYxUr5K612B8W2zwmzzydIV44L4qFUiDp0hisxEHT80HQ6t
   iIDgv9RmYLHDXI9iW9G+ecpRKWusaxKu+zbv8U36hH3Uw3araZKfClEBz
   my+KgEdbWG/tZpCb8zI4o895nzbR/abP/+V84x+vESIjt4qN5KxWYUkhB
   qNXLxgtjgix3xUQhrqLpQJv4lBk1D0zPnZfjT/+kEkjLTtAEWg36mwgr4
   Q==;
X-CSE-ConnectionGUID: 7GGiTkBzSgOMazNgzFvpDg==
X-CSE-MsgGUID: oxuD5VyQTiCQgCcQBsCsnw==
X-IronPort-AV: E=McAfee;i="6800,10657,11584"; a="66714822"
X-IronPort-AV: E=Sophos;i="6.19,234,1754982000"; 
   d="scan'208";a="66714822"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Oct 2025 12:22:10 -0700
X-CSE-ConnectionGUID: jOJEvLFnQfOU96ZQuLGYWA==
X-CSE-MsgGUID: ATJwx4GHQi6qptwFDH+2lg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,234,1754982000"; 
   d="scan'208";a="187816513"
Received: from klitkey1-mobl1.ger.corp.intel.com (HELO kekkonen.fi.intel.com) ([10.245.244.31])
  by fmviesa004-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Oct 2025 12:22:09 -0700
Received: from kekkonen.localdomain (localhost [IPv6:::1])
	by kekkonen.fi.intel.com (Postfix) with SMTP id 936D312023C;
	Thu, 16 Oct 2025 22:22:06 +0300 (EEST)
Date: Thu, 16 Oct 2025 22:22:06 +0300
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6 krs, Bertel Jungin Aukio 5, 02600 Espoo
From: Sakari Ailus <sakari.ailus@linux.intel.com>
To: Ricardo Ribalda <ribalda@chromium.org>
Cc: Linus Walleij <linus.walleij@linaro.org>,
	Dmitry Torokhov <dmitry.torokhov@gmail.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Hans Verkuil <hverkuil@kernel.org>,
	Krzysztof =?utf-8?Q?Ha=C5=82asa?= <khalasa@piap.pl>,
	Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>,
	Leon Luo <leonl@leopardimaging.com>,
	Kieran Bingham <kieran.bingham@ideasonboard.com>,
	Jacopo Mondi <jacopo+renesas@jmondi.org>,
	Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
	Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>,
	Niklas =?iso-8859-1?Q?S=F6derlund?= <niklas.soderlund+renesas@ragnatech.se>,
	Julien Massot <julien.massot@collabora.com>,
	Jacopo Mondi <jacopo@jmondi.org>,
	Daniel Scally <djrscally@gmail.com>,
	Dave Stevenson <dave.stevenson@raspberrypi.com>,
	Benjamin Mugnier <benjamin.mugnier@foss.st.com>,
	Sylvain Petinot <sylvain.petinot@foss.st.com>,
	Yong Zhi <yong.zhi@intel.com>, Bingbu Cao <bingbu.cao@intel.com>,
	Tianshu Qiu <tian.shu.qiu@intel.com>,
	Tiffany Lin <tiffany.lin@mediatek.com>,
	Andrew-CT Chen <andrew-ct.chen@mediatek.com>,
	Yunfei Dong <yunfei.dong@mediatek.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Rui Miguel Silva <rmfrfs@gmail.com>,
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	Martin Kepplinger <martink@posteo.de>,
	Purism Kernel Team <kernel@puri.sm>,
	Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Dafna Hirschfeld <dafna@fastmail.com>,
	Heiko Stuebner <heiko@sntech.de>,
	Sylwester Nawrocki <s.nawrocki@samsung.com>,
	Krzysztof Kozlowski <krzk@kernel.org>,
	Alim Akhtar <alim.akhtar@samsung.com>,
	Yemike Abhilash Chandra <y-abhilashchandra@ti.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-input@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-media@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org, imx@lists.linux.dev,
	linux-renesas-soc@vger.kernel.org,
	linux-rockchip@lists.infradead.org,
	linux-samsung-soc@vger.kernel.org, linux-staging@lists.linux.dev
Subject: Re: [PATCH 00/32] media: Use %pe format specifier
Message-ID: <aPFF3n-e7pAUDH5x@kekkonen.localdomain>
References: <20251013-ptr_err-v1-0-2c5efbd82952@chromium.org>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251013-ptr_err-v1-0-2c5efbd82952@chromium.org>

Hi Ricardo,

On Mon, Oct 13, 2025 at 02:14:40PM +0000, Ricardo Ribalda wrote:
> The %pe format specifier is designed to print error pointers. It prints
> a symbolic error name (eg. -EINVAL) and it makes the code simpler by
> omitting PTR_ERR().
> 
> The recently introduced test scripts/coccinelle/misc/ptr_err_to_pe.cocci
> checks that we use %pe. Let's make it happy.
> 
> Signed-off-by: Ricardo Ribalda <ribalda@chromium.org>

Thanks for the set.

Acked-by: Sakari Ailus <sakari.ailus@linux.intel.com>

-- 
Kind regards,

Sakari Ailus

