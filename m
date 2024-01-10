Return-Path: <linux-renesas-soc+bounces-1491-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id E716B829FFC
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 10 Jan 2024 18:59:00 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 7709A2872B1
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 10 Jan 2024 17:58:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BAD054D129;
	Wed, 10 Jan 2024 17:58:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="q2rys//x"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1BAA14C3C1
	for <linux-renesas-soc@vger.kernel.org>; Wed, 10 Jan 2024 17:58:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from pendragon.ideasonboard.com (89-27-53-110.bb.dnainternet.fi [89.27.53.110])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 472213DFA;
	Wed, 10 Jan 2024 18:57:36 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1704909456;
	bh=YJXZv3YnGdJAej8RTPXbGSyJCIis53K/z7gZD6q9f4o=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=q2rys//xoWEVPld3cARNvPo6x/vrleva45fgworEYq3P0jVfe+oftQnsV/3Qtd+P8
	 wLOYO6okDuXbT6yW3RtPJNY/sSvrYwQzmJ3I4wLIOnXw8fI0r2EBLOXD2ot5iCndNb
	 TB1BFz/cT2FP3vJx5gM5hZ4UMc+Vmc+wXgBRIfB0=
Date: Wed, 10 Jan 2024 19:58:48 +0200
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Maxime Ripard <mripard@kernel.org>
Cc: Biju Das <biju.das.jz@bp.renesas.com>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
	Jacopo Mondi <jacopo.mondi@ideasonboard.com>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Magnus Damm <magnus.damm@gmail.com>,
	"dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
	"linux-renesas-soc@vger.kernel.org" <linux-renesas-soc@vger.kernel.org>,
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>,
	Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>,
	"biju.das.au" <biju.das.au@gmail.com>
Subject: Re: [PATCH v15 3/5] drm: renesas: Add RZ/G2L DU Support
Message-ID: <20240110175848.GD23633@pendragon.ideasonboard.com>
References: <20231128105129.161121-1-biju.das.jz@bp.renesas.com>
 <20231128105129.161121-4-biju.das.jz@bp.renesas.com>
 <sechknyg33iucaku37vfhk7ie7xgcealfqbvaopm4rrnqbo5g5@s35peonkzzoz>
 <TYCPR01MB11269767836DEB995747B7ED3868CA@TYCPR01MB11269.jpnprd01.prod.outlook.com>
 <zp2ews2by6fg5irmb7ms6blox6vruezdjlor3rutqtokbvlle2@tl775slyvhyf>
 <TYCPR01MB1126964899D432355ACAF49D18693A@TYCPR01MB11269.jpnprd01.prod.outlook.com>
 <he23e5al3hinegebvq7qai4jdw3qjgbzmnx34xgxqnu3hw4jke@dts2vi5kcs4u>
 <TYCPR01MB112697575E0CF41CC26A8140086672@TYCPR01MB11269.jpnprd01.prod.outlook.com>
 <w5yc4ahv7tlr2bb4otzy7cnvke6q63w4msaxhdvpmeia3s5xi5@yhzvc3rxrowj>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <w5yc4ahv7tlr2bb4otzy7cnvke6q63w4msaxhdvpmeia3s5xi5@yhzvc3rxrowj>

Hi Maxime,

On Wed, Jan 10, 2024 at 05:14:41PM +0100, Maxime Ripard wrote:
> On Thu, Jan 04, 2024 at 02:34:33PM +0000, Biju Das wrote:
> > On Friday, December 15, 2023 2:24 PM, Maxime Ripard wrote:
> > > On Fri, Dec 15, 2023 at 01:25:48PM +0000, Biju Das wrote:
> > > > On Friday, December 15, 2023 10:24 AM, Maxime Ripard wrote:
> > > > > On Thu, Dec 14, 2023 at 03:24:17PM +0000, Biju Das wrote:
> > > > > > Hi Maxime Ripard,
> > > > > >
> > > > > > Thanks for the feedback.
> > > > >
> > > > > Thanks, that's super helpful. The architecture is thus similar to
> > > > > vc4
> > > > >
> > > > > Some general questions related to bugs we had at some point with vc4:
> > > > >
> > > > >   * Where is the display list stored? In RAM or in a dedicated SRAM?
> > > >
> > > > [1] It is in DDR (RAM).
> > > >
> > > > >
> > > > >   * Are the pointer to the current display list latched?
> > > > >
> > > > >   * Is the display list itself latched? If it's not, what happens when
> > > > >     the display list is changed while the frame is being generated?
> > > >
> > > > There is some protocol defined for SW side and HW side for updating
> > > > display list See [1] 33.4.8.1 Operation flow of VSPD and DU.
> > > >
> > > > All the display list operations are manged here[2]
> > > >
> > > > [1] https://www.renesas.com/us/en/document/mah/rzg2l-group-rzg2lc-group-users-manual-hardware-0
> > > >
> > > > [2] https://elixir.bootlin.com/linux/v6.7-rc5/source/drivers/media/platform/renesas/vsp1/vsp1_dl.c#L863
> > > 
> > > I'm sorry, but I'm not going to read a 3500+ to try to figure it out.
> > > Could you answer the questions above?
> > 
> > The answer for your question is,
> > 
> > If a previous display list has been queued to the hardware but not
> > processed yet, the VSP can start processing it at any time. In that
> > case we can't replace the queued list by the new one, as we could
> > race with the hardware. We thus mark the update as pending, it will
> > be queued up to the hardware by the frame end interrupt handler.
> 
> Ok, so you need to make sure that the list entries are allocated and
> tied to the state. That way, you'll know for sure it'll get destroyed
> only once the state isn't used anymore, so after the vblank.

Because the VSP started as a memory-to-memory processing IP without
being tied to the display, it got supported by a V4L2 (and MC) driver.
Later on, the R-Car Gen2 added a direct connection between the output of
*some* VSP instances and one input of the DU (display engine), using the
VSP as an extra "plane" from a KMS point of view. Using the VSP was
optional, as the DU had "normal" planes. R-Car Gen3 dropped support for
direct memory access in the DU, making usage of the VSP mandatory.

As using the VSP is mandatory for display operation on R-Car Gen3, we
ruled out forcing userspace to deal with a KMS *and* a V4L2 device
manually to get anything out on the screen. We also ruled out
redeveloping VSP support inside the DU driver, as that would have
duplicated (complex) code. Instead, the DU driver communicates with the
VSP driver within the kernel, completely transparently for userspace.
This in-kernel API is defined in include/media/vsp1.h, and consists of
the following operations that have been modelled on the KMS atomic API:

- One-time setup at driver initialization time:

int vsp1_du_init(struct device *dev);

- Configuration at CRTC enable/disable time:

int vsp1_du_setup_lif(struct device *dev, unsigned int pipe_index,
                      const struct vsp1_du_lif_config *cfg);

This includes configuration of the output width/height.

(LIF stands for "LCD InterFace" if I recall correctly, it's the block in
the VSP that connects to the DU.)

- Atomic updates

void vsp1_du_atomic_begin(struct device *dev, unsigned int pipe_index);
int vsp1_du_atomic_update(struct device *dev, unsigned int pipe_index,
                          unsigned int rpf,
                          const struct vsp1_du_atomic_config *cfg);
void vsp1_du_atomic_flush(struct device *dev, unsigned int pipe_index,
                          const struct vsp1_du_atomic_pipe_config *cfg);

These operations configure planes (the VSP has a blending engine with 2
to 5 inputs depending on the exact SoC) and writeback (the VSP being
historically just a memory-to-memory engine, it supports writing the
output to memory in addition to forwarding it to the DU).


The display lists are fully handled inside the VSP driver, the DU
doesn't need to manage them. You can ignore the implementation details
of the VSP itself.

-- 
Regards,

Laurent Pinchart

