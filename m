Return-Path: <linux-renesas-soc+bounces-6770-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id E7939917859
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 26 Jun 2024 07:50:54 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 971FD1F221C3
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 26 Jun 2024 05:50:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9ACE9149C4E;
	Wed, 26 Jun 2024 05:50:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="RtO5HvUJ"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B2A3F1442FF;
	Wed, 26 Jun 2024 05:50:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719381050; cv=none; b=qMhNyVX8ks1zmCIgoYW4d4NZWldCrAWw4JlYxl+2oPZCOx1w9N1x15t2hIZx70jxEKPFfg4pxgYIbDRzKFcmgRuVV2Y8N1Mq+8v40aF92rtoE3KG2RAnW+fuIypQS+MecRHS4ZzWFQyELmQdX0KKvyu4cxslWuI9P17sY4CsDCk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719381050; c=relaxed/simple;
	bh=AXInGYRcUsJzwnqpJM101fxleop3yD6bL3+KTD3lMQ0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=TASyu0Dbiy7eO3RKtzc42QiQ6pXbUKhB2L7SVn2yMjeJCG0LLBqN8zCc4HHAc4QZOhfwUuaakIeYbpNeyx7XvWHCW6sxOvc/EM7hIBUVc+LEeymwY1cWS8Ng7OWLk8y49g5LGYygK5znlbljaYwJANyxm4fD8RQdd12C7oVl5qU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=RtO5HvUJ; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from pendragon.ideasonboard.com (unknown [193.209.96.36])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 8A2622C5;
	Wed, 26 Jun 2024 07:50:23 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1719381023;
	bh=AXInGYRcUsJzwnqpJM101fxleop3yD6bL3+KTD3lMQ0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=RtO5HvUJ4EpI46ZiCYME3afpziBsPpnHW68t7mC8qUhgeAtdCsyznCQ14ZY8fp9tF
	 KLpfCkxGh9lMjQxuL3nR0KFleRIerv2P7LxIYlpFjRLeET6ybJK4i6o7aVYJoLVJks
	 eVBNa68okMaQlwX/Mj3S28AWI7eiq5xu7S4ILoK4=
Date: Wed, 26 Jun 2024 08:50:25 +0300
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Sakari Ailus <sakari.ailus@iki.fi>
Cc: linux-media@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
	linux-sunxi@lists.linux.dev,
	Eugen Hristev <eugen.hristev@collabora.com>,
	Maxime Ripard <mripard@kernel.org>, Chen-Yu Tsai <wens@csie.org>,
	Kieran Bingham <kieran.bingham@ideasonboard.com>,
	Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>,
	Jacopo Mondi <jacopo.mondi@ideasonboard.com>,
	Hans Verkuil <hverkuil-cisco@xs4all.nl>
Subject: Re: [PATCH 2/8] media: sun4i_csi: Implement link validate for
 sun4i_csi subdev
Message-ID: <20240626055025.GA8704@pendragon.ideasonboard.com>
References: <20240619012356.22685-1-laurent.pinchart+renesas@ideasonboard.com>
 <20240619012356.22685-3-laurent.pinchart+renesas@ideasonboard.com>
 <Znb_X42wK_UoMUNR@valkosipuli.retiisi.eu>
 <20240625210928.GA29726@pendragon.ideasonboard.com>
 <Zns7YKMVa0tvOI24@valkosipuli.retiisi.eu>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <Zns7YKMVa0tvOI24@valkosipuli.retiisi.eu>

On Tue, Jun 25, 2024 at 09:49:20PM +0000, Sakari Ailus wrote:
> On Wed, Jun 26, 2024 at 12:09:28AM +0300, Laurent Pinchart wrote:
> > On Sat, Jun 22, 2024 at 04:44:15PM +0000, Sakari Ailus wrote:
> > > On Wed, Jun 19, 2024 at 04:23:50AM +0300, Laurent Pinchart wrote:
> > > > The sun4i_csi driver doesn't implement link validation for the subdev it
> > > > registers, leaving the link between the subdev and its source
> > > > unvalidated. Fix it, using the v4l2_subdev_link_validate() helper.
> > > > 
> > > > Signed-off-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
> > > 
> > > This looks like a bugfix. Shouldn't this be backported?
> > 
> > I'll add
> > 
> > Fixes: 577bbf23b758 ("media: sunxi: Add A10 CSI driver")
> 
> Please also:
> 
> Cc: stable@vger.kernel.org

Done.

-- 
Regards,

Laurent Pinchart

