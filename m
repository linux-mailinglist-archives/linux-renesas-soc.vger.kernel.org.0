Return-Path: <linux-renesas-soc+bounces-30424-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id CEZVB3JJxmmgIAUAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-30424-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 27 Mar 2026 10:10:10 +0100
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 7586434182A
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 27 Mar 2026 10:10:09 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 9799D3008A73
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 27 Mar 2026 09:04:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 63B3D3DA7CB;
	Fri, 27 Mar 2026 09:04:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="JEvrsZie"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 291EC3CF697;
	Fri, 27 Mar 2026 09:04:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774602291; cv=none; b=pnoQRK+bmksll8Xq0HVKEH7G9C9OfVurC0WwoXheZFWYCzWErzCVjMfEl8hxha8AlgwdKBlI7RipZMbfiTnRqsQKjfZOv9TYjKrU2JJNdwc4uoqcokJcoeZznQ4sBVJPySiEPDieVnpVDuJk5OAu4QdGHquYiOvgLv4OG3pe2c8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774602291; c=relaxed/simple;
	bh=2q+MwjaTDQlDt2HK2ksY2sRwNISOSVyw4/LbSErZ+vs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=GSxPEWc0M3XUYgIMWE2ZFP/gfyUTVn80RrSfTa8E349/HycC0gQBSyGzQOLnkl+l6i/QdDg0wM9hwO0WKE4p/h6Nrx8yOnluMEbCXdgxb2xVQde6ycSY125NdF1eH3/fibae0YEgMJpB+VlDiiziwX1svH3qGXGsyPBRlYOCdUg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=JEvrsZie; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from killaraus.ideasonboard.com (2001-14ba-703d-e500--2a1.rev.dnainternet.fi [IPv6:2001:14ba:703d:e500::2a1])
	by perceval.ideasonboard.com (Postfix) with UTF8SMTPSA id EAFB71783;
	Fri, 27 Mar 2026 10:03:24 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1774602205;
	bh=2q+MwjaTDQlDt2HK2ksY2sRwNISOSVyw4/LbSErZ+vs=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=JEvrsZieYrtju8PjmnG2QOY2nPqKDNYPPc5aQBllB7bm6Z5EV6Cv345cROhB9s6yn
	 RD4ATxHGt1qCLyA/qETm7cT7ovQjD1Ue4T6YecOe6pqDL6dmQxixo+V6+6j9QehYdc
	 4toBc1zheMKmLGIJR/SCiZUZeUfRmZaTOqtQXTnk=
Date: Fri, 27 Mar 2026 11:04:42 +0200
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Amin <amin.gattout@gmail.com>
Cc: Luca Ceresoli <luca.ceresoli@bootlin.com>,
	Tomi Valkeinen <tomi.valkeinen+renesas@ideasonboard.com>,
	Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Magnus Damm <magnus.damm@gmail.com>,
	dri-devel@lists.freedesktop.org, linux-renesas-soc@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] drm/rcar-du: Convert to of_drm_find_and_get_bridge()
Message-ID: <20260327090442.GA3026673@killaraus.ideasonboard.com>
References: <20260326-bridge-v1-1-c0c44b53f7b6@gmail.com>
 <DHDEL0VTRYDP.2D45EP8E07Y08@bootlin.com>
 <20260327083404.GA2993961@killaraus.ideasonboard.com>
 <CAHfa7xXeRaGw1ADFsuT2dcqkY+KXb9w_vi4tq8G6ehOS9r7cAA@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <CAHfa7xXeRaGw1ADFsuT2dcqkY+KXb9w_vi4tq8G6ehOS9r7cAA@mail.gmail.com>
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[ideasonboard.com,none];
	R_DKIM_ALLOW(-0.20)[ideasonboard.com:s=mail];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-30424-lists,linux-renesas-soc=lfdr.de];
	FROM_HAS_DN(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com];
	RCPT_COUNT_TWELVE(0.00)[14];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_CC(0.00)[bootlin.com,ideasonboard.com,linux.intel.com,kernel.org,suse.de,gmail.com,ffwll.ch,glider.be,lists.freedesktop.org,vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-0.999];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[laurent.pinchart@ideasonboard.com,linux-renesas-soc@vger.kernel.org];
	DKIM_TRACE(0.00)[ideasonboard.com:+];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	TAGGED_RCPT(0.00)[linux-renesas-soc,renesas];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[killaraus.ideasonboard.com:mid,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,ideasonboard.com:dkim]
X-Rspamd-Queue-Id: 7586434182A
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Fri, Mar 27, 2026 at 09:54:42AM +0100, Amin wrote:
> Hi
> 
> Thanks for the feedback. I did reference commit 7282066e55347 (Luca's
> earlier conversion) but I should have been more cautious since the
> patch I submitted was a bit too simple/"dummy".
> 
> To answer Laurent's question: I did not test this on hardware.
> I was working through the deprecated API TODO  list and made the
> mistake of treating this as a simple find-and-replace.
> 
> I'll send a v2.

Luca has already submitted a patch, see
https://lore.kernel.org/dri-devel/20260318-drm-bridge-alloc-getput-drm_of_find_bridge-4-v3-3-10f502520357@bootlin.com/

-- 
Regards,

Laurent Pinchart

