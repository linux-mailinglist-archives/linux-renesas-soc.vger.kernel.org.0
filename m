Return-Path: <linux-renesas-soc+bounces-6506-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id E562B90F481
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 19 Jun 2024 18:54:23 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 856F4282C12
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 19 Jun 2024 16:54:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4624B152792;
	Wed, 19 Jun 2024 16:54:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="GaGkX6FU"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 848AE5C8FC;
	Wed, 19 Jun 2024 16:54:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718816059; cv=none; b=cKo+GqH+WIm4T+bvkuoJkn7o98xylzbw6heR9a1yPV25EpLpdyGSipbHpsCcq/ZTVS1G2eq+D3ossjzvpCQ1pSlr8liu4w505g+6rSc6dYEJ7bLeB49W7eEuatt93zrUtV4fNZhDZc3b2C06qmLU16ipsRIRDwQq8M8z/+2VF4Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718816059; c=relaxed/simple;
	bh=1Wq7DOJN8DK0tEcTAKWJt8iTdTMDhFjkz13wY8KenZI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=sQhZf3c9U+uS4kO5547CZH0SQOI9f3p+SjfKt3cdKF1MBxSpuXTRlXC9XZUZ8jfnKFpERgXSCOYfwS6XFWxCgWHxs72CgDMR+3wGv/QfDQbJLqFpm7cMpg/KY+m8ueZOBpOOpRT2AqWmO7/YAN6/YvRbRpeVqYOuj6L/+tw0BVw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=GaGkX6FU; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from pendragon.ideasonboard.com (81-175-209-231.bb.dnainternet.fi [81.175.209.231])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id AE7DA541;
	Wed, 19 Jun 2024 18:53:56 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1718816036;
	bh=1Wq7DOJN8DK0tEcTAKWJt8iTdTMDhFjkz13wY8KenZI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=GaGkX6FU/MEN7hXeGfXxsJx1Y7yA2BWRl801DL74lh74GTCLY5kmcyf4BoiNNmzfD
	 3czJfPB0qgIlh73BUfpEK+m6cvXGGZNRu2zgV6pxzfOPwc2I5nVfvtBDDsFWuy5hx1
	 uBslDE6J1J0NE5ZloRjNS8/Fma1novn0aF+ZSQ24=
Date: Wed, 19 Jun 2024 19:53:51 +0300
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Sergey Shtylyov <s.shtylyov@omp.ru>
Cc: Jiapeng Chong <jiapeng.chong@linux.alibaba.com>,
	kieran.bingham+renesas@ideasonboard.com, airlied@gmail.com,
	daniel@ffwll.ch, dri-devel@lists.freedesktop.org,
	linux-renesas-soc@vger.kernel.org, linux-kernel@vger.kernel.org,
	Abaci Robot <abaci@linux.alibaba.com>
Subject: Re: [PATCH] drm: Remove unused function rcar_cmm_write
Message-ID: <20240619165351.GA4219@pendragon.ideasonboard.com>
References: <20240619075436.86407-1-jiapeng.chong@linux.alibaba.com>
 <bd98f345-5c71-188a-b3af-a8ef9d205ce6@omp.ru>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <bd98f345-5c71-188a-b3af-a8ef9d205ce6@omp.ru>

On Wed, Jun 19, 2024 at 12:16:47PM +0300, Sergey Shtylyov wrote:
> On 6/19/24 10:54 AM, Jiapeng Chong wrote:
> 
> > The function are defined in the rcar_cmm.c file, but not called
> 
>    s/are/is/.
> 
> > elsewhere, so delete the unused function.
> 
>    Anywhere, maybe?

I'll fix those.

Reviewed-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>

> > drivers/gpu/drm/renesas/rcar-du/rcar_cmm.c:35:19: warning: unused function 'rcar_cmm_read'.
> > 
> > Reported-by: Abaci Robot <abaci@linux.alibaba.com>
> > Closes: https://bugzilla.openanolis.cn/show_bug.cgi?id=9364
> > Signed-off-by: Jiapeng Chong <jiapeng.chong@linux.alibaba.com>
> 
> [...]

-- 
Regards,

Laurent Pinchart

