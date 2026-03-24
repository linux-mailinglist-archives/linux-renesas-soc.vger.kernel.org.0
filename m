Return-Path: <linux-renesas-soc+bounces-30182-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id YNDyCZDHwmmIlgQAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-30182-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 24 Mar 2026 18:19:12 +0100
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 49E12319E72
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 24 Mar 2026 18:19:11 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id BD57A30398B6
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 24 Mar 2026 17:10:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3B9AA38947A;
	Tue, 24 Mar 2026 17:10:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=collabora.com header.i=adrian.larumbe@collabora.com header.b="KKeIm6my"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from sender4-pp-f112.zoho.com (sender4-pp-f112.zoho.com [136.143.188.112])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E6BA839EF28;
	Tue, 24 Mar 2026 17:10:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=136.143.188.112
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774372255; cv=pass; b=Z1o0Oobn8wrmOqgkDXwteshDcKzIAq+6G/ttOrKCwiPzk5xsr72bo7NtfiEAfWIyHswG+hyX7HHT65J2ctsvfEZWWXNDQMgqOcX5++NflvE26lC9VMbOIo5vAjtfOrKkhskt4rsIV7uS0ctLan5rlJYb5jiMNKh1453bavNbr7w=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774372255; c=relaxed/simple;
	bh=uQoWXC6Jv03ZamGOGtRHoDHK6Y3UXp/87fz2FcRQNi0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=MHrh4jUN+5i/02GT6s0sxade5Msw6Vp5zG43DK0GU1Wp1U7QEnd+c1WeMLXvBYbyOT5XaZDhmqcUuTF34IZfa1sYRrUAAVI5tm9yM79oh6xuDtWLDmN/vwFv15e3ULY5+aU92Ap14BUUYm4+E+9mzJVE8Y/E09zdyKAd1n6THeM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (1024-bit key) header.d=collabora.com header.i=adrian.larumbe@collabora.com header.b=KKeIm6my; arc=pass smtp.client-ip=136.143.188.112
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
ARC-Seal: i=1; a=rsa-sha256; t=1774372240; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=iytQaQs3gv96JIS/OcqVGSHjDWqtBg262TSbPPw5MVuFCZ5mcf0aN8o1QrqR0BrmjFcHA8eYdnC3f2R6kx/NwltbMiGF8RqJGsZ+ovtSsIWHu9K7pqjhYoyvr5+lnlvNNmLa+wYVcdhN5gFrstmszB+GqL9XLXFD0BYy8KCc11A=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1774372240; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=6ZPh6G4xAhBxLEgqYKHOD5pZKFxipudSIXmd95nLbpA=; 
	b=jXIF2UNUNEqPYsGdgN7zlD4/+OitfpHa5Vt6sD6C934veRzoCeWnyxVty15yIq0VIBXM6+IuXQCDpkuxrNt3c3MzAd8vk7RXDchZLJB6eEqLFGxx+Nos4K2gof+5EvvkZ3NGy+EkYy5w3BoHfu1I5IHUY//M0fcisMXyTYfrRvw=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=collabora.com;
	spf=pass  smtp.mailfrom=adrian.larumbe@collabora.com;
	dmarc=pass header.from=<adrian.larumbe@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1774372240;
	s=zohomail; d=collabora.com; i=adrian.larumbe@collabora.com;
	h=Date:Date:From:From:To:To:Cc:Cc:Subject:Subject:Message-ID:References:MIME-Version:Content-Type:Content-Transfer-Encoding:In-Reply-To:Message-Id:Reply-To;
	bh=6ZPh6G4xAhBxLEgqYKHOD5pZKFxipudSIXmd95nLbpA=;
	b=KKeIm6mya6qSyZBdYGoBe70P6AEdtROJIWQV9OAC271FvAYPQICMZ2iQjS+JY76i
	vtjAonZQxSRneMjy2tXZSWhp9HUZf4D7V4TkLiE8diY6f76SbYe/TVNAW+2Vm9B0zy+
	/BSz44H5JmUcXgCBN816XW5LihgRLm5XFj+0D5mQ=
Received: by mx.zohomail.com with SMTPS id 1774372237643335.5512115778221;
	Tue, 24 Mar 2026 10:10:37 -0700 (PDT)
Date: Tue, 24 Mar 2026 17:10:32 +0000
From: =?utf-8?Q?Adri=C3=A1n?= Larumbe <adrian.larumbe@collabora.com>
To: Biju Das <biju.das.jz@bp.renesas.com>
Cc: Boris Brezillon <boris.brezillon@collabora.com>, 
	Rob Herring <robh@kernel.org>, Steven Price <steven.price@arm.com>, 
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>, 
	Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, 
	Simona Vetter <simona@ffwll.ch>, 
	"dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, 
	Geert Uytterhoeven <geert+renesas@glider.be>, Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>, 
	"linux-renesas-soc@vger.kernel.org" <linux-renesas-soc@vger.kernel.org>
Subject: Re: [PATCH v2 2/4] drm/panfrost: Drop redundant optional clock
 checks in runtime PM
Message-ID: <acLFYNHPODCYArCk@sobremesa>
References: <20260320164158.487406-1-biju.das.jz@bp.renesas.com>
 <20260320164158.487406-3-biju.das.jz@bp.renesas.com>
 <ab25E0kTBA4EjZ3Y@sobremesa>
 <TY3PR01MB11346F3DF5ACB55B5FE8DC96F864CA@TY3PR01MB11346.jpnprd01.prod.outlook.com>
 <TY3PR01MB11346DD20F7E2AB23A54A274B864DA@TY3PR01MB11346.jpnprd01.prod.outlook.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <TY3PR01MB11346DD20F7E2AB23A54A274B864DA@TY3PR01MB11346.jpnprd01.prod.outlook.com>
X-Spamd-Result: default: False [-0.16 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=2];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[collabora.com,none];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10];
	R_DKIM_ALLOW(-0.20)[collabora.com:s=zohomail];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-30182-lists,linux-renesas-soc=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	RCPT_COUNT_TWELVE(0.00)[14];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_CC(0.00)[collabora.com,kernel.org,arm.com,linux.intel.com,suse.de,gmail.com,ffwll.ch,lists.freedesktop.org,vger.kernel.org,glider.be,bp.renesas.com];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[adrian.larumbe@collabora.com,linux-renesas-soc@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[collabora.com:+];
	NEURAL_HAM(-0.00)[-1.000];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	TAGGED_RCPT(0.00)[linux-renesas-soc,renesas];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[renesas.com:email,arm.com:email,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,collabora.com:dkim,collabora.com:email,lists.freedesktop.org:email]
X-Rspamd-Queue-Id: 49E12319E72
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On 21.03.2026 14:16, Biju Das wrote:
> Hi Adrián Larumbe,
>
> Thanks for the feedback.
>
> > -----Original Message-----
> > From: dri-devel <dri-devel-bounces@lists.freedesktop.org> On Behalf Of Biju Das
> > Sent: 20 March 2026 21:32
> > Subject: RE: [PATCH v2 2/4] drm/panfrost: Drop redundant optional clock checks in runtime PM
> >
> >
> >
> > > -----Original Message-----
> > > From: dri-devel <dri-devel-bounces@lists.freedesktop.org> On Behalf Of
> > > Adrián Larumbe
> > > Sent: 20 March 2026 21:20
> > > Subject: Re: [PATCH v2 2/4] drm/panfrost: Drop redundant optional
> > > clock checks in runtime PM
> > >
> > > Hi Biju,
> > >
> > > On 20.03.2026 16:41, Biju wrote:
> > > > From: Biju Das <biju.das.jz@bp.renesas.com>
> > > >
> > > > The clk_enable() and clk_disable() APIs already handle NULL clock
> > > > pointers gracefully — clk_enable() returns 0 and clk_disable()
> > > > returns immediately when passed a NULL or optional clock. The
> > > > explicit if
> > > > (pfdev->bus_clock) guards around these calls in the runtime
> > > > suspend/resume paths are therefore unnecessary. Remove them to simplify the code.
> > > >
> > > > Reviewed-by: Steven Price <steven.price@arm.com>
> > > > Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
> > > > ---
> > > > v1->v2:
> > > >  * Collected tag
> > > > ---
> > > >  drivers/gpu/drm/panfrost/panfrost_device.c | 12 ++++--------
> > > >  1 file changed, 4 insertions(+), 8 deletions(-)
> > > >
> > > > diff --git a/drivers/gpu/drm/panfrost/panfrost_device.c
> > > > b/drivers/gpu/drm/panfrost/panfrost_device.c
> > > > index dedc13e56631..01e702a0b2f0 100644
> > > > --- a/drivers/gpu/drm/panfrost/panfrost_device.c
> > > > +++ b/drivers/gpu/drm/panfrost/panfrost_device.c
> > > > @@ -429,11 +429,9 @@ static int panfrost_device_runtime_resume(struct device *dev)
> > > >  		if (ret)
> > > >  			goto err_clk;
> > > >
> > > > -		if (pfdev->bus_clock) {
> > > > -			ret = clk_enable(pfdev->bus_clock);
> > > > -			if (ret)
> > > > -				goto err_bus_clk;
> > > > -		}
> > > > +		ret = clk_enable(pfdev->bus_clock);
> > > > +		if (ret)
> > > > +			goto err_bus_clk;
> > > >  	}
> > >
> > > It seems clk_prepare_enable() can also deal with NULL clock device
> > > pointers gracefully, so maybe you could also do away with pointer checks in panfrost_clk_init?
> >
> > This is the only check and no need to print rate for optional clk. That is the reason I have not
> > touched this.
> >
> > 	if (pfdev->bus_clock) {
> > 		rate = clk_get_rate(pfdev->bus_clock);
> > 		dev_info(pfdev->base.dev, "bus_clock rate = %lu\n", rate);
> >
> > 		err = clk_prepare_enable(pfdev->bus_clock);
> > 		if (err)
> > 			goto disable_clock;
> > 	}
>
> The above block is good for optional clock.
>
> Otherwise, there will be 2 checks for optional clk.
>
> One here:
>
> if (pfdev->bus_clock) {
> 	rate = clk_get_rate(pfdev->bus_clock);
> 	dev_info(pfdev->base.dev, "bus_clock rate = %lu\n", rate);
> }
>
> and one inside the clk_prepare_enable():
>
> err = clk_prepare_enable(pfdev->bus_clock);
>
> Please let me know your thoughts.

You're right, it's probably best to leave it the way it is.

Cheers,
Adrian

> Cheers,
> Biju
>
> >
> > Cheers,
> > Biju
> > >
> > > Other than that,
> > >
> > > Reviewed-by: Adrián Larumbe <adrian.larumbe@collabora.com>
> > >
> > > >  	panfrost_device_reset(pfdev, true); @@ -464,9 +462,7 @@ static int
> > > > panfrost_device_runtime_suspend(struct device *dev)
> > > >  	panfrost_gpu_power_off(pfdev);
> > > >
> > > >  	if (pfdev->comp->pm_features & BIT(GPU_PM_RT)) {
> > > > -		if (pfdev->bus_clock)
> > > > -			clk_disable(pfdev->bus_clock);
> > > > -
> > > > +		clk_disable(pfdev->bus_clock);
> > > >  		clk_disable(pfdev->clock);
> > > >  		reset_control_assert(pfdev->rstc);
> > > >  	}
> > > > --
> > > > 2.43.0
> > >
> > >
> > > Adrian Larumbe

