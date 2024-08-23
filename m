Return-Path: <linux-renesas-soc+bounces-8175-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 9503A95D0A0
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 23 Aug 2024 17:01:28 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 6870CB235A5
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 23 Aug 2024 15:01:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 08B25188932;
	Fri, 23 Aug 2024 15:01:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="JtCOLmxP"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7D49D186E4A;
	Fri, 23 Aug 2024 15:00:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724425259; cv=none; b=gztdX9e8HxopCOd0HbF1en34Ecm8joGnmvI9niTMdbNW/+rnHgJ+GOChzmD1sURpfZrpy52P9GqWJQVJVABKc1SEBrUM9sBVtIWMOC67hBV8/88ahqwK9HGGihAkFswNkWEvxMwDK9Z7nYABxxatR2zKXS1NiwPVY3OiwLB6U4A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724425259; c=relaxed/simple;
	bh=Ci0FUoZVqpuzfnCSAxxyhv4Is6mVnbOTGRED7EYQL2M=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=RF9CMDE2O8GLbD0f1HRjXgMry7IsgGbUDDehppqK3qT2sFjN6guew/QIrHpI9o2F9OmqMd8X3wg1mUB5v08YVwjnCTvx5pAIlWq1KcPnrCoY9nF6AyyGhsKvEH/KeLgIOp0eA3fkHzxi5xjGnA9oVu8YlKdLWz+HVABT/qt4q9w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=JtCOLmxP; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from pendragon.ideasonboard.com (81-175-209-231.bb.dnainternet.fi [81.175.209.231])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 86400497;
	Fri, 23 Aug 2024 16:59:52 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1724425192;
	bh=Ci0FUoZVqpuzfnCSAxxyhv4Is6mVnbOTGRED7EYQL2M=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=JtCOLmxPrcL7nD3TLfIIA3nPba6zmxpCzbu8tNvAPXob+5FbhIZIXVqvMAByXWYGK
	 eY9nsL+X20KX9n2MN+s4rP63PrloNdI4rUQU3fZ5ztbDimNZOfe6zFZD74zids1kO7
	 CYn3u+aDieWAPkFqv2h1atloO09/G5tYs5lHWKUc=
Date: Fri, 23 Aug 2024 18:00:54 +0300
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: "Lad, Prabhakar" <prabhakar.csengg@gmail.com>
Cc: Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
	David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
	Biju Das <biju.das.jz@bp.renesas.com>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	dri-devel@lists.freedesktop.org, linux-renesas-soc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>,
	Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
Subject: Re: [PATCH] drm: renesas: Move RZ/G2L MIPI DSI driver to rz-du
Message-ID: <20240823150054.GP26098@pendragon.ideasonboard.com>
References: <20240625123244.200533-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <20240626055108.GA10453@pendragon.ideasonboard.com>
 <CA+V-a8tcWVTzDgBMhn8aQaX934MKwOePp3PhMF4TcXqBK2nhAA@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CA+V-a8tcWVTzDgBMhn8aQaX934MKwOePp3PhMF4TcXqBK2nhAA@mail.gmail.com>

On Fri, Aug 23, 2024 at 02:33:49PM +0100, Lad, Prabhakar wrote:
> On Wed, Jun 26, 2024 at 6:51 AM Laurent Pinchart wrote:
> > On Tue, Jun 25, 2024 at 01:32:44PM +0100, Prabhakar wrote:
> > > From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> > >
> > > All the RZ/G2L DU specific components are located under the rz-du folder,
> > > so it makes sense to move the RZ/G2L MIPI DSI driver there instead of
> > > keeping it in the rcar-du folder. This change improves the organization
> > > and modularity of the driver configuration by grouping related settings together.
> >
> > I was thinking the same the other day. Thanks for beating me at sending
> > a patch :-)
> >
> > Reviewed-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
> >
> > Do you or Biju has committer rights to drm-misc to push this patch ?
>
> We dont, can you please queue this patch via your tree?

I don't have other pending patches for DRM at the moment. Tomi, could
you push this to drm-misc ?

-- 
Regards,

Laurent Pinchart

