Return-Path: <linux-renesas-soc+bounces-24064-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [IPv6:2605:f480:58:1:0:1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id 46322C30D7E
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 04 Nov 2025 12:57:46 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 2B5814E0F30
	for <lists+linux-renesas-soc@lfdr.de>; Tue,  4 Nov 2025 11:57:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F3844242D7B;
	Tue,  4 Nov 2025 11:57:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="ecuZbr++"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DD9861A76D4
	for <linux-renesas-soc@vger.kernel.org>; Tue,  4 Nov 2025 11:57:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762257462; cv=none; b=kKZRs9agDzo1I8iRIslMe5EGIppkxAtewd7Vb0IyCEY2+y5Bvu3thfvbYcSeQ+NydPvKvi8bPpPT9UfecLS8EjQDM+FP+pqDvrj1WyIiuNB3dxgoinyzTabnhlAFyiLoH1oc5Zc4N4r5tJrMzkzP3H0Jz56f/Syk+3ggUfHD+KI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762257462; c=relaxed/simple;
	bh=mil6O1YCCtchDDrpgObPO3pcuYJvfkebwXhtm8/K8PU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=C9DOCjNtKW2kcMfNtrfGhivsVyeKvpfaql6Ql2NOCLNyxWsitrCTLmQlTUotkhyF0KhUUYxmA+dO0Iu5hnYRxkLqDRpUJUwj1cotvdVyWSkcqULNLA9HwBMXtwUXrfkE/2m5TQPtcOqUp5oLTsW6ILUD8AguJt6v8xzv+sBnlto=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=ecuZbr++; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from pendragon.ideasonboard.com (82-203-160-149.bb.dnainternet.fi [82.203.160.149])
	by perceval.ideasonboard.com (Postfix) with UTF8SMTPSA id 365E61771;
	Tue,  4 Nov 2025 12:55:38 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1762257338;
	bh=mil6O1YCCtchDDrpgObPO3pcuYJvfkebwXhtm8/K8PU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=ecuZbr++hco180IzLOTqZrWzhP4piHeawlW+MVvnAG33cGs3h5N0Qih/J82OzWOc1
	 n3+3aYdGeXpoRtnKjqEZyGjzLzQ8BwmPbvRtRYy2E8UwbvwV8uPW7tQceFezAyX69Q
	 WfcRw5qaKu+PWusL/FfIcQ+iJz8bzZUvVo/ofCHs=
Date: Tue, 4 Nov 2025 13:57:29 +0200
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>
Cc: airlied@gmail.com, alok.a.tiwari@oracle.com,
	dri-devel@lists.freedesktop.org, geert+renesas@glider.be,
	linux-renesas-soc@vger.kernel.org,
	maarten.lankhorst@linux.intel.com, magnus.damm@gmail.com,
	mripard@kernel.org, simona@ffwll.ch,
	tomi.valkeinen+renesas@ideasonboard.com, tzimmermann@suse.de,
	alok.a.tiwarilinux@gmail.com
Subject: Re: [PATCH next] drm: rcar-du: fix incorrect return in
 rcar_du_crtc_cleanup()
Message-ID: <20251104115729.GB27255@pendragon.ideasonboard.com>
References: <20251017191634.1454201-1-alok.a.tiwari@oracle.com>
 <176098000464.199266.533603860929790380@ping.linuxembedded.co.uk>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <176098000464.199266.533603860929790380@ping.linuxembedded.co.uk>

On Mon, Oct 20, 2025 at 06:06:44PM +0100, Kieran Bingham wrote:
> Quoting Alok Tiwari (2025-10-17 20:16:21)
> > The rcar_du_crtc_cleanup() function has a void return type, but
> > incorrectly uses a return statement with a call to drm_crtc_cleanup(),

I don't know if it's incorrect as such, but it makes the code more
readable.

Reviewed-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>

> > which also returns void.
> > 
> > Remove the return statement to ensure proper function semantics.
> > No functional change intended.
> > 
> > Signed-off-by: Alok Tiwari <alok.a.tiwari@oracle.com>
> > ---
> >  drivers/gpu/drm/renesas/rcar-du/rcar_du_crtc.c | 2 +-
> >  1 file changed, 1 insertion(+), 1 deletion(-)
> > 
> > diff --git a/drivers/gpu/drm/renesas/rcar-du/rcar_du_crtc.c b/drivers/gpu/drm/renesas/rcar-du/rcar_du_crtc.c
> > index 7e175dbfd892..22bcd7db4195 100644
> > --- a/drivers/gpu/drm/renesas/rcar-du/rcar_du_crtc.c
> > +++ b/drivers/gpu/drm/renesas/rcar-du/rcar_du_crtc.c
> > @@ -993,7 +993,7 @@ static void rcar_du_crtc_cleanup(struct drm_crtc *crtc)
> 
> This cleanup is called through .destroy which is:
> 	void (*destroy)(struct drm_crtc *crtc);
> 
> >         rcar_du_crtc_crc_cleanup(rcrtc);
> >  
> > -       return drm_crtc_cleanup(crtc);
> > +       drm_crtc_cleanup(crtc);
> 
> and drm_crtc_cleanup is:
> 	void drm_crtc_cleanup(struct drm_crtc *crtc)
> 
> So it certainly can't return anything:
> 
> Reviewed-by: Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>
> 
> >  }
> >  
> >  static void rcar_du_crtc_reset(struct drm_crtc *crtc)

-- 
Regards,

Laurent Pinchart

