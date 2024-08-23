Return-Path: <linux-renesas-soc+bounces-8174-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id B6D0E95D090
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 23 Aug 2024 17:00:21 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id CC0681F21297
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 23 Aug 2024 15:00:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1AADA188924;
	Fri, 23 Aug 2024 15:00:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="L2XBhFKN"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 83309185B4B;
	Fri, 23 Aug 2024 15:00:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724425218; cv=none; b=kfFN1nN4SLchcFNducPKDgo+F8/8w5pFcPKWU7vw3dryeYNH/2NJasfl6Q2QK5qXXcYKRq4o73Yy7/+iA5GDIA1lBhB3WzfYeRAJpXsYPUPWMHazyP03ht0uiHHlnjOo47paVmezyuAPKlN8IQSknyYdI1XdYCsCA6T5KwRLdws=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724425218; c=relaxed/simple;
	bh=YkmBvbKKvOT2foHk9kjYnWyxl+Yyk92fG2PXKbQaMMY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=pq/kfV6iMZ5A2COTk56KgH4nMokclCT3rvvrn8r8mYnC9v+lXxoQj8nm2yu3+r8WvKZiNGUojNLG5xtoXkTOtESIBUBjsZzOMEJKK6Rh0iRM7+P8SWHWdqlcN1dcCG6OTPRAs5F9iSKhZBSs4n+HMjAlCFj/L9PLySTyQRT5G8M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=L2XBhFKN; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from pendragon.ideasonboard.com (81-175-209-231.bb.dnainternet.fi [81.175.209.231])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id ACC45497;
	Fri, 23 Aug 2024 16:59:09 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1724425149;
	bh=YkmBvbKKvOT2foHk9kjYnWyxl+Yyk92fG2PXKbQaMMY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=L2XBhFKNsMQhI1WMQk8jBRBtFoBby9nJsvqc+jl1WtVcPAC03u2Rb2p9uiPEtwN6K
	 06cLn8DaD3gpBUDDkNUizwQ6lbDL45luxRQkZLerk5rf7H7hSZlq4nSXACwzP2qBug
	 izxXFWUyF4ieLX67xXbdEkLpSsT7+jlUHJW5n4IM=
Date: Fri, 23 Aug 2024 18:00:11 +0300
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Biju Das <biju.das.jz@bp.renesas.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
	Conor Dooley <conor+dt@kernel.org>,
	Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Magnus Damm <magnus.damm@gmail.com>,
	"dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
	"linux-renesas-soc@vger.kernel.org" <linux-renesas-soc@vger.kernel.org>,
	"devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
	Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>,
	"biju.das.au" <biju.das.au@gmail.com>,
	Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
Subject: Re: [PATCH v4 0/4] Add support for RZ/G2UL Display Unit
Message-ID: <20240823150011.GO26098@pendragon.ideasonboard.com>
References: <20240822162320.5084-1-biju.das.jz@bp.renesas.com>
 <20240823131516.GD26098@pendragon.ideasonboard.com>
 <TY3PR01MB11346F4E01D1FA2688D2799F586882@TY3PR01MB11346.jpnprd01.prod.outlook.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <TY3PR01MB11346F4E01D1FA2688D2799F586882@TY3PR01MB11346.jpnprd01.prod.outlook.com>

Hi Biju,

On Fri, Aug 23, 2024 at 01:52:14PM +0000, Biju Das wrote:
> On Friday, August 23, 2024 2:15 PM, Laurent Pinchart wrote:
> > On Thu, Aug 22, 2024 at 05:23:13PM +0100, Biju Das wrote:
> > > This patch series aims to add support for RZ/G2UL DU.
> > >
> > > The LCD controller is composed of Frame Compression Processor (FCPVD),
> > > Video Signal Processor (VSPD), and Display Unit (DU).
> > >
> > > The output of LCDC is connected display parallel interface (DPI) and
> > > supports a maximum resolution of WXGA along with 2 RPFs to support the
> > > blending of two picture layers and raster operations (ROPs)
> > >
> > > It is similar to LCDC IP on RZ/G2L SoCs, but does not have DSI interface.
> > >
> > > v3->v4:
> > >  * Restored the ports property for RZ/G2UL and described port@0 for the
> > >    DPI interface in bindings patch.
> > >  * Restored tags from Geert and Conor as the change is trivial
> > >    (Replaced port 1->0 from v2).
> > >  * Used "&" instead of "==" in rzg2l_du_start_stop() for scalability.
> > >  * Restored port variable in struct rzg2l_du_output_routing
> > >  * Updated rzg2l_du_encoders_init() to handle port based on hardware indices.
> > >  * Restored ports property in du node and used port@0 for connected
> > >    DPI interface.
> > > v2->v3:
> > >  * Split patch series based on subsystem from DU patch series [1].
> > >  * Replaced ports->port property for RZ/G2UL as it supports only DPI
> > >    and retained ports property for RZ/{G2L,V2L} as it supports both DSI
> > >    and DPI output interface.
> > >  * Added missing blank line before example.
> > >  * Dropped tags from Conor and Geert as there are new changes in bindings
> > >  * Avoided the line break in rzg2l_du_start_stop() for rstate.
> > >  * Replaced port->du_output in  struct rzg2l_du_output_routing and
> > >    dropped using the port number to indicate the output type in
> > >    rzg2l_du_encoders_init().
> > >  * Updated rzg2l_du_r9a07g043u_info and rzg2l_du_r9a07g044_info.
> > >
> > >  [1] https://lore.kernel.org/all/20240709135152.185042-1-biju.das.jz@bp.renesas.com/
> > > v1->v2:
> > >  * Updated cover letter header "DU IP->Display Unit".
> > >  * Updated commit description related to non ABI breakage for patch#3.
> > >  * Added Ack from Conor for binding patches.
> > >
> > > Biju Das (4):
> > >   dt-bindings: display: renesas,rzg2l-du: Document RZ/G2UL DU bindings
> > >   drm: renesas: rz-du: Add RZ/G2UL DU Support
> > 
> > The first two patches look good to me. Do you have access to drm-misc, will you push them yourself, or
> > do you expect a maintainer to pick them up ?
> 
> I don’t have access to drm-misc. I expect a maintainer to pick it up(Maybe via rcar-du tree or 
> drm-misc tree), or else if it is ok, what is the procedure to get access for drm-misc tree??

You can find instructions to request drm-misc commit access at
https://drm.pages.freedesktop.org/maintainer-tools/committer/commit-access.html

Tomi, to avoid delays, could you push the first two patches to drm-misc
?

> > >   arm64: dts: renesas: r9a07g043u: Add DU node
> > >   arm64: dts: renesas: r9a07g043u11-smarc: Enable DU
> > >
> > >  .../bindings/display/renesas,rzg2l-du.yaml    |  32 ++++-
> > >  arch/arm64/boot/dts/renesas/r9a07g043u.dtsi   |  25 ++++
> > >  .../boot/dts/renesas/r9a07g043u11-smarc.dts   | 111 ++++++++++++++++++
> > >  drivers/gpu/drm/renesas/rz-du/rzg2l_du_crtc.c |   8 +-
> > >  drivers/gpu/drm/renesas/rz-du/rzg2l_du_drv.c  |  11 ++
> > >  drivers/gpu/drm/renesas/rz-du/rzg2l_du_kms.c  |   3 +-
> > >  6 files changed, 185 insertions(+), 5 deletions(-)

-- 
Regards,

Laurent Pinchart

