Return-Path: <linux-renesas-soc+bounces-20432-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 4953FB239C2
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 12 Aug 2025 22:09:47 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 4FE063ACF65
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 12 Aug 2025 20:07:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E2CAA2F0672;
	Tue, 12 Aug 2025 20:05:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="hCFrqtwE"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E9F452F069A
	for <linux-renesas-soc@vger.kernel.org>; Tue, 12 Aug 2025 20:05:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755029151; cv=none; b=DK97w3v00lPy9LVtFFjGTpQUnER+X/dK/XaKJ/syj/Glys4dpTFU6L8z1xhwQSJ5/9XznI59rp1+ZL8hVA2pDtw6+H0TGdU6O9h/Z8W/+Pfq1kqbUxaJfk3y9p/hCxV4VCCa3Rd8Qb/pjADlZkkUe9aD1e6JRnK8vCVsurFQk6g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755029151; c=relaxed/simple;
	bh=r2MRlbk1kIx88/c/bzIYa/Yagm5IegF7cUQ/EQvsU28=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=caOIDUoMny2uqv26guvNuolza5RiP2IM93SCvnhxiIn/ER9illPRarJlYV6M8oOHT5gfY6WWWmNrv3dhOKnhLgGYll+Glpa3G5IHofUzl/u/EeJQG/9OaLza5U0zTBrw0B8k220fSArij428nmjy2Ts0e0WFxE4fnFVbgsjryt4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=hCFrqtwE; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from pendragon.ideasonboard.com (81-175-209-231.bb.dnainternet.fi [81.175.209.231])
	by perceval.ideasonboard.com (Postfix) with UTF8SMTPSA id 5C9AAE92;
	Tue, 12 Aug 2025 22:04:52 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1755029092;
	bh=r2MRlbk1kIx88/c/bzIYa/Yagm5IegF7cUQ/EQvsU28=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=hCFrqtwE/uchlElOaDvUvNX+Vzxp6TlIwxcGMlLuyesQp1CcjHw7dwJvjTORs5AW7
	 Fx51dtQachZfn/e8OxPlXHbB/UdLQrwVxybDotnIqZsESRjVrAH9pfinUtX4IOMNoq
	 ATPwjFKfl+NPH5rX/Lrqwy8oDTp6iSFxmwQDj6Zw=
Date: Tue, 12 Aug 2025 23:05:26 +0300
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Marek Vasut <marek.vasut@mailbox.org>
Cc: Tomi Valkeinen <tomi.valkeinen+renesas@ideasonboard.com>,
	Marek Vasut <marek.vasut+renesas@mailbox.org>,
	dri-devel@lists.freedesktop.org, David Airlie <airlied@gmail.com>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Magnus Damm <magnus.damm@gmail.com>,
	Maxime Ripard <mripard@kernel.org>, Simona Vetter <simona@ffwll.ch>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	linux-renesas-soc@vger.kernel.org
Subject: Re: [PATCH 1/4] drm/rcar-du: dsi: Convert register bits to BIT()
 macro
Message-ID: <20250812200526.GA12797@pendragon.ideasonboard.com>
References: <20250608142636.54033-1-marek.vasut+renesas@mailbox.org>
 <20250608142636.54033-2-marek.vasut+renesas@mailbox.org>
 <bc31d938-847d-46a5-af1e-29de3ac21504@ideasonboard.com>
 <7dc2c17d-9879-41c8-b90d-19f92a2d9c1e@mailbox.org>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <7dc2c17d-9879-41c8-b90d-19f92a2d9c1e@mailbox.org>

On Tue, Aug 12, 2025 at 09:32:36PM +0200, Marek Vasut wrote:
> On 8/12/25 3:26 PM, Tomi Valkeinen wrote:
> 
> Hi,
> 
> >> diff --git a/drivers/gpu/drm/renesas/rcar-du/rcar_mipi_dsi_regs.h b/drivers/gpu/drm/renesas/rcar-du/rcar_mipi_dsi_regs.h
> >> index a6b276f1d6ee..b3e57217ae63 100644
> >> --- a/drivers/gpu/drm/renesas/rcar-du/rcar_mipi_dsi_regs.h
> >> +++ b/drivers/gpu/drm/renesas/rcar-du/rcar_mipi_dsi_regs.h
> 
> [...]
> 
> >> @@ -51,11 +51,11 @@
> >>   
> >>   #define TXVMVPRMSET0R			0x1d0
> >>   #define TXVMVPRMSET0R_HSPOL_HIG		(0 << 17)
> >> -#define TXVMVPRMSET0R_HSPOL_LOW		(1 << 17)
> >> +#define TXVMVPRMSET0R_HSPOL_LOW		BIT(17)
> > 
> > I'm not sure about this (and below). We have two defines for the HSPOL,
> > high and low. If one of them is (x << y), shouldn't the other one be of
> > that style too?
> 
> It is inconsistent, but one macro describes bit set to 0 and the other 
> bit set to 1 (i.e. the actual bit) which is converted to BIT(n) macro. I 
> would be tempted to remove the bits set to 0, that's probably the real 
> discussion that should happen here. But that would also be a much bigger 
> patch. What do you think ?

For what it's worth, for single-bit register fields, I usually define a
single macro. I understand it's usually a coding style preference.

-- 
Regards,

Laurent Pinchart

