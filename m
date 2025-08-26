Return-Path: <linux-renesas-soc+bounces-20977-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 6345AB36F06
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 26 Aug 2025 17:56:28 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 29B4146221B
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 26 Aug 2025 15:51:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 95D6F36C09D;
	Tue, 26 Aug 2025 15:48:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="cBpUZwwJ"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 63B4636CC63;
	Tue, 26 Aug 2025 15:48:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756223301; cv=none; b=IrMBkqe4X8ygU2V3PMu3DbsujKaNcHEJtz9ABXcV+sF7kXNuGTJjgs7SbrRv2Ij3TlNK4g/1qQ9ChoPLA4s5MwLI5c2UKJni3ebXGiiZ5n66+Vl106pYIjjNPUgXlX3f8q3o0EjEiqqDBMdqjDOAH4GOp+DZZhcJtj8QTabIX1E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756223301; c=relaxed/simple;
	bh=b8FPl/vsVw5JNumARcRZVHO1eLeE0zNGP8ZNm5DfGWI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=AonG9Jqztv9zlIGpKIUdm9J11jmPOPQ0TPdFN2akVJypNEdxQfu36WS6a6OHWl5b6VgFt9ONP5mZUwWrZMiMIihDqHGgSmbN1BtAIA6pxcxHiLzdH4bJvyiIBftNAxO8fD+Lw5dW2//qXF2Wq2OW1ydRNB6xpBkjOM06iMKbwLI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=cBpUZwwJ; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6D1E1C4CEF1;
	Tue, 26 Aug 2025 15:48:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1756223300;
	bh=b8FPl/vsVw5JNumARcRZVHO1eLeE0zNGP8ZNm5DfGWI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=cBpUZwwJwkflKJ0/vGcmpkC8DliLFLjpny0HUmG2Ln346CiBilgYH94HOREACj5jF
	 Eq+XapbP4mc3qqOBbKqJAOA0njYw2EK8+6zfRSA0eWXfO/SnsO8pThLIrOhMQixQZd
	 XHTps7BStTJKDCTVj8vOn5Gy/oHQabqqNoH1MEnvwi5qkv97UYldOWhQP3PUn5/9Lm
	 OHy0yblKZsp109frfTjXxEUXfzNX/BWGVXFCAq2cHizxUwV7oPc2+wbbiLb4kwDlOc
	 9FKAQoMjqXrG9GwaCG+g+UxkSz4WB1qo0ykVddH858/C+LLN/pLzUJQA3YX3ce1Yuk
	 4SOasopz6FeBw==
Date: Tue, 26 Aug 2025 17:48:18 +0200
From: "mripard@kernel.org" <mripard@kernel.org>
To: "Kandpal, Suraj" <suraj.kandpal@intel.com>
Cc: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>, 
	"liviu.dudau@arm.com" <liviu.dudau@arm.com>, Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
	"kernel-list@raspberrypi.com" <kernel-list@raspberrypi.com>, "amd-gfx@lists.freedesktop.org" <amd-gfx@lists.freedesktop.org>, 
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, 
	"linux-renesas-soc@vger.kernel.org" <linux-renesas-soc@vger.kernel.org>, "linux-arm-msm@vger.kernel.org" <linux-arm-msm@vger.kernel.org>, 
	"freedreno@lists.freedesktop.org" <freedreno@lists.freedesktop.org>, 
	"dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>, 
	"intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>, 
	"intel-gfx@lists.freedesktop.org" <intel-gfx@lists.freedesktop.org>, "Nautiyal, Ankit K" <ankit.k.nautiyal@intel.com>, 
	"Murthy, Arun R" <arun.r.murthy@intel.com>, "Shankar, Uma" <uma.shankar@intel.com>, 
	"Nikula, Jani" <jani.nikula@intel.com>, "harry.wentland@amd.com" <harry.wentland@amd.com>, 
	"siqueira@igalia.com" <siqueira@igalia.com>, "alexander.deucher@amd.com" <alexander.deucher@amd.com>, 
	"christian.koenig@amd.com" <christian.koenig@amd.com>, "airlied@gmail.com" <airlied@gmail.com>, 
	"simona@ffwll.ch" <simona@ffwll.ch>, 
	"maarten.lankhorst@linux.intel.com" <maarten.lankhorst@linux.intel.com>, "robin.clark@oss.qualcomm.com" <robin.clark@oss.qualcomm.com>, 
	"abhinav.kumar@linux.dev" <abhinav.kumar@linux.dev>, "tzimmermann@suse.de" <tzimmermann@suse.de>, 
	"jessica.zhang@oss.qualcomm.com" <jessica.zhang@oss.qualcomm.com>, "sean@poorly.run" <sean@poorly.run>, 
	"marijn.suijten@somainline.org" <marijn.suijten@somainline.org>, "mcanal@igalia.com" <mcanal@igalia.com>, 
	"dave.stevenson@raspberrypi.com" <dave.stevenson@raspberrypi.com>, 
	"tomi.valkeinen+renesas@ideasonboard.com" <tomi.valkeinen+renesas@ideasonboard.com>, 
	"kieran.bingham+renesas@ideasonboard.com" <kieran.bingham+renesas@ideasonboard.com>, "louis.chauvet@bootlin.com" <louis.chauvet@bootlin.com>
Subject: Re: [RFC PATCH 1/8] drm: writeback: Refactor drm_writeback_connector
 structure
Message-ID: <20250826-skinny-dancing-otter-de9be4@houat>
References: <20250811092707.3986802-2-suraj.kandpal@intel.com>
 <20250811094429.GE21313@pendragon.ideasonboard.com>
 <awtqznhquyn7etojonmjn7karznefsb7fdudawcjsj5g2bok3u@2iqcdviuiz2s>
 <20250811111546.GA30760@pendragon.ideasonboard.com>
 <2ah3pau7p7brgw7huoxznvej3djct76vgfwtc72n6uub7sjojd@zzaebjdcpdwf>
 <DM3PPF208195D8D0E55A761A3C16B87BAEEE32AA@DM3PPF208195D8D.namprd11.prod.outlook.com>
 <aJ4LQvqli36TlETu@e110455-lin.cambridge.arm.com>
 <hc6f6wgsnauh72cowocpm55tikejhiha5z4mgufeq7v6gb2qml@kmgfd26bigos>
 <wr76vyag2osox2xf7ducnkiaanzk2k5ehd2ahnoyqdm5qiywlk@penf4v5bvg5z>
 <DM3PPF208195D8D87AECE8397914A67D9A1E33EA@DM3PPF208195D8D.namprd11.prod.outlook.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha384;
	protocol="application/pgp-signature"; boundary="h5fbt5za66ojtx6g"
Content-Disposition: inline
In-Reply-To: <DM3PPF208195D8D87AECE8397914A67D9A1E33EA@DM3PPF208195D8D.namprd11.prod.outlook.com>


--h5fbt5za66ojtx6g
Content-Type: text/plain; protected-headers=v1; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [RFC PATCH 1/8] drm: writeback: Refactor drm_writeback_connector
 structure
MIME-Version: 1.0

On Mon, Aug 25, 2025 at 06:26:48AM +0000, Kandpal, Suraj wrote:
> > Subject: Re: [RFC PATCH 1/8] drm: writeback: Refactor
> > drm_writeback_connector structure
> >=20
> > Hi,
> >=20
> > On Sat, Aug 16, 2025 at 01:20:53AM +0300, Dmitry Baryshkov wrote:
> > > On Thu, Aug 14, 2025 at 05:13:54PM +0100, liviu.dudau@arm.com wrote:
> > > > Hi,
> > > >
> > > > On Wed, Aug 13, 2025 at 10:04:22AM +0000, Kandpal, Suraj wrote:
> > > > > > > > };
> > > > > > >
> > > > > > > I still don't like that. This really doesn't belong here. If
> > > > > > > anything, the drm_connector for writeback belongs to drm_crtc.
> > > > > >
> > > > > > Why? We already have generic HDMI field inside drm_connector. I
> > > > > > am really hoping to be able to land DP parts next to it. In
> > > > > > theory we can have a DVI- specific entry there (e.g. with the
> > subconnector type).
> > > > > > The idea is not to limit how the drivers subclass those structu=
res.
> > > > > >
> > > > > > I don't see a good case why WB should deviate from that design.
> > > > > >
> > > > > > > If the issue is that some drivers need a custom drm_connector
> > > > > > > subclass, then I'd rather turn the connector field of
> > > > > > > drm_writeback_connector into a pointer.
> > > > > >
> > > > > > Having a pointer requires additional ops in order to get
> > > > > > drm_connector from WB code and vice versa. Having
> > > > > > drm_connector_wb inside drm_connector saves us from those ops
> > (which don't manifest for any other kind of structure).
> > > > > > Nor will it take any more space since union will reuse space
> > > > > > already taken up by HDMI part.
> > > > > >
> > > > > > >
> > > > >
> > > > > Seems like this thread has died. We need to get a conclusion on t=
he
> > design.
> > > > > Laurent do you have any issue with the design given Dmitry's
> > > > > explanation as to why this Design is good for drm_writeback_conne=
ctor.
> > > >
> > > > I'm with Laurent here. The idea for drm_connector (and a lot of drm
> > > > structures) are to be used as base "classes" for extended
> > > > structures. I don't know why HDMI connector ended up inside
> > > > drm_connector as not all connectors have HDMI functionality, but th=
at's a
> > cleanup for another day.
> > >
> > > Maybe Maxime can better comment on it, but I think it was made exactly
> > > for the purpose of not limiting the driver's design. For example, a
> > > lot of drivers subclass drm_connector via drm_bridge_connector. If
> > > struct drm_connector_hdmi was a wrapper around struct drm_connector,
> > > then it would have been impossible to use HDMI helpers for bridge
> > > drivers, while current design freely allows any driver to utilize
> > > corresponding library code.
> >=20
> > That's exactly why we ended up like this. With that design, we wouldn't=
 have
> > been able to "inherit" two connector "classes": bridge_connector is one,
> > intel_connector another one.
> >=20
> > See here for the rationale:
> > https://lore.kernel.org/dri-devel/ZOTDKHxn2bOg+Xmg@phenom.ffwll.local/
> >=20
> > I don't think the "but we'll bloat drm_connector" makes sense either.
> > There's already a *lot* of things that aren't useful to every connector=
 (fwnode,
> > display_info, edid in general, scaling, vrr, etc.)
> >=20
> > And it's not like we allocate more than a handful of them during a syst=
em's life.
>=20
> So Are we okay with the approach mentioned here with the changes that hav=
e been proposed here like
> Having drm_writeback_connector in union with drm_hdmi_connector

I don't think we need a union here. It artificially creates the same
issue: we can't have two types for a connector if we do so.

> Also one more thing I would like to clarify here is how everyone would
> like the patches patches where each patch changes both the drm core
> and all related drivers (ensures buildability but then review is tough
> for each driver). Or patches where we have initial drm core changes
> and then each patch does the all changes in a driver in its own
> respective patch.

The latter should be preferred, but if you can't maintain bisectability
that way, then it's the most important and you should fall back to the
former.

Maxime

--h5fbt5za66ojtx6g
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iJQEABMJAB0WIQTkHFbLp4ejekA/qfgnX84Zoj2+dgUCaK3XPQAKCRAnX84Zoj2+
dkGOAXsF9clyGa0v79Lvcn8LKsqqNonbB//uZEuQy7tvsCVTi+DhFkU8idQEhmiv
4/hwQBIBdjsjXoUxkxPssK1Cqn88KbP1KGjTWNATiM+3ovUf9J35gCUaNCEzp/9o
nS7FRKYC
=Lfn+
-----END PGP SIGNATURE-----

--h5fbt5za66ojtx6g--

