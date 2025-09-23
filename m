Return-Path: <linux-renesas-soc+bounces-22195-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id C1A87B9517C
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 23 Sep 2025 10:57:53 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 90CBF2E2705
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 23 Sep 2025 08:57:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C9B71318151;
	Tue, 23 Sep 2025 08:57:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="ex3NWRpk"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B94583128CD
	for <linux-renesas-soc@vger.kernel.org>; Tue, 23 Sep 2025 08:57:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758617870; cv=none; b=Pj3subnZNjrgwnhcpO5FfdI7VsU1UaYmqjQqIZ7BsvKWEimjjc/JGvsZDjoozIAdX4l8tZQfS3BO9yNd2SJURVKfiH8rBxlT7aazcUp/AHR/ZqfhOtd75ZT59sOnbWBz6jeozKRXQobOEp0YZRjIKvQ2bQ3G1L/fIwPHjhnU5mA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758617870; c=relaxed/simple;
	bh=x50Ha6c7OV8h62TjGKMOcM7QgUhh6/7cEAkTL8vjR3o=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=G4I7UzXPu7seCm6fijNawVMlnt+9AlUBan9olO3e2QfTYGGiyW9083cNmxh2+BFBZhyUgQgG2tmMCY0qFuEH/BTL/D3D3+PlL/pB5kfPX+jINbCHoqZ93ehrHzKmVQWpY5J69Fi1qwYKnICACq+syBLsgshDeUZbj4X/56mwwkM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=ex3NWRpk; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from pendragon.ideasonboard.com (81-175-209-231.bb.dnainternet.fi [81.175.209.231])
	by perceval.ideasonboard.com (Postfix) with UTF8SMTPSA id 5B6E53A4;
	Tue, 23 Sep 2025 10:56:21 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1758617781;
	bh=x50Ha6c7OV8h62TjGKMOcM7QgUhh6/7cEAkTL8vjR3o=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=ex3NWRpkMIpap47K32a0ibmb8HzzAFwolgMYpnBM5KJyE//pkc2u5ck9yZaOA/Wlg
	 ot5aDrMhqyujDBzbh7cbOduJ7aSiR2dwb2E3ym256WExwQ69ST/yh1Lc/+hiws+5U5
	 RlT10N3lgOekOOLIaYgG6N3jEzNuM0mktYaN7mJg=
Date: Tue, 23 Sep 2025 11:57:12 +0300
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Marek Vasut <marek.vasut@mailbox.org>
Cc: Geert Uytterhoeven <geert@linux-m68k.org>,
	Marek Vasut <marek.vasut+renesas@mailbox.org>,
	dri-devel@lists.freedesktop.org, David Airlie <airlied@gmail.com>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Magnus Damm <magnus.damm@gmail.com>,
	Maxime Ripard <mripard@kernel.org>, Simona Vetter <simona@ffwll.ch>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	Tomi Valkeinen <tomi.valkeinen+renesas@ideasonboard.com>,
	linux-renesas-soc@vger.kernel.org
Subject: Re: [PATCH 2/9] drm/rcar-du: dsi: Deduplicate
 mipi_dsi_pixel_format_to_bpp() usage
Message-ID: <20250923085712.GB20765@pendragon.ideasonboard.com>
References: <20250922185740.153759-1-marek.vasut+renesas@mailbox.org>
 <20250922185740.153759-3-marek.vasut+renesas@mailbox.org>
 <CAMuHMdUqzfGb0ehdXjdmbZfZ9XVoHMjL8y0hoJ-BYLEkLepP3w@mail.gmail.com>
 <241530bb-7c06-4055-b95b-83a89f27895b@mailbox.org>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <241530bb-7c06-4055-b95b-83a89f27895b@mailbox.org>

On Tue, Sep 23, 2025 at 10:55:20AM +0200, Marek Vasut wrote:
> On 9/23/25 8:47 AM, Geert Uytterhoeven wrote:
> 
> Hello Geert,
> 
> >> @@ -457,11 +458,11 @@ static void rcar_mipi_dsi_set_display_timing(struct rcar_mipi_dsi *dsi,
> >>          u32 vprmset4r;
> >>
> >>          /* Configuration for Pixel Stream and Packet Header */
> >> -       if (mipi_dsi_pixel_format_to_bpp(dsi->format) == 24)
> >> +       if (dsibpp == 24)
> >>                  rcar_mipi_dsi_write(dsi, TXVMPSPHSETR, TXVMPSPHSETR_DT_RGB24);
> >> -       else if (mipi_dsi_pixel_format_to_bpp(dsi->format) == 18)
> >> +       else if (dsibpp == 18)
> >>                  rcar_mipi_dsi_write(dsi, TXVMPSPHSETR, TXVMPSPHSETR_DT_RGB18);
> >> -       else if (mipi_dsi_pixel_format_to_bpp(dsi->format) == 16)
> >> +       else if (dsibpp == 16)
> > 
> > What about using the switch() statement instead?
> 
> Not for single-line bodies in the conditionals. The switch {} statement 
> would require additional break; in each case and that's not worth it 
> here, it would only add noise into the code.

I'm a bit surprised. I don't mind much as I don't work on this driver
myself, but for what it's worth I would find a switch statement to be
more readable too. Coding style is of course a matter of personal
preference in many cases.

-- 
Regards,

Laurent Pinchart

