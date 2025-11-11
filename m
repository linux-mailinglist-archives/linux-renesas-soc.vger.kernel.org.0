Return-Path: <linux-renesas-soc+bounces-24438-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [213.196.21.55])
	by mail.lfdr.de (Postfix) with ESMTPS id B31F7C4C829
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 11 Nov 2025 10:02:55 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id 363A434D314
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 11 Nov 2025 09:02:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 950BC2D130B;
	Tue, 11 Nov 2025 09:02:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ragnatech.se header.i=@ragnatech.se header.b="HD6R7hG0";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="hD0NcfHD"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from fhigh-b7-smtp.messagingengine.com (fhigh-b7-smtp.messagingengine.com [202.12.124.158])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 750A328C5AA;
	Tue, 11 Nov 2025 09:02:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=202.12.124.158
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762851767; cv=none; b=TlUrpfFwQR6usr5w/5IEicwJll/Ww6b9Tw332LeF8Ah2CGxKoxN+QNzHHeLlI0+fXD80M8Z0vXlX/SuaAoHVheG+dfe6pEzxmPMsZ4cr/bOeMTb1u03k/XG6QLEhFFbBtBw9ItqMEzcHEeq3ZUNbtJoN0BKsAZVchVE90PwiT6c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762851767; c=relaxed/simple;
	bh=51gWDnko7reNi6UEAViItMQjBBfLGAkZQIVtR4MXJ8Q=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=nbX0pTMZX0n6uuwdzRslFrtf9jyy64Us/fpmShMA7LXwVNr8LNWa3cyMk+iAt7Fk9qSOTH6G68N7xcmYKZhfVJ/VFJ2VCyn1+lUn5EDBSTqqrCsM2jolj1s2E9OSh1QTHN5sXraU4lBExglulK09Y/CVNDV+OY8Yy9MhNZ0URHY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ragnatech.se; spf=pass smtp.mailfrom=ragnatech.se; dkim=pass (2048-bit key) header.d=ragnatech.se header.i=@ragnatech.se header.b=HD6R7hG0; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=hD0NcfHD; arc=none smtp.client-ip=202.12.124.158
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ragnatech.se
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ragnatech.se
Received: from phl-compute-03.internal (phl-compute-03.internal [10.202.2.43])
	by mailfhigh.stl.internal (Postfix) with ESMTP id E785B7A012A;
	Tue, 11 Nov 2025 04:02:40 -0500 (EST)
Received: from phl-mailfrontend-01 ([10.202.2.162])
  by phl-compute-03.internal (MEProxy); Tue, 11 Nov 2025 04:02:41 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ragnatech.se; h=
	cc:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:message-id:mime-version:reply-to
	:subject:subject:to:to; s=fm2; t=1762851760; x=1762938160; bh=1j
	XE00gYq2pIAHBN0U+G56EomYV6/NgLjHM/HWIN7EE=; b=HD6R7hG0iRv7OEgrca
	cj8b8zaqEtIX0PWRfAoKLv53eMhtH5yMhrEmRo3C9Ki0DsR7M7H2blhTsx5i8Fg0
	0MDfE9u4AeHmr5LDfpsLy79PS2+ER/Vcku6MwSLTo/uADTFa+9hT1XdAPA3FDlvz
	nRWPqCXJqN5Xdp8/kKzyjvKSwMJyucasJIa73zpQ3Je9UWi5cdkEG/vXaoi08xos
	YLJTvWt5jHIEInfYabNh+l+cENmwN9WFP2xOPSbHlKa959O0M85cO2oArRSxjcgi
	gQ6To7B+NqiEc0aEq8qwaxAQC4Bjwv9jC8fPWyoHYfWCEwXfqsDl5A9SC9uPnnWh
	of6w==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:message-id:mime-version:reply-to:subject
	:subject:to:to:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
	fm3; t=1762851760; x=1762938160; bh=1jXE00gYq2pIAHBN0U+G56EomYV6
	/NgLjHM/HWIN7EE=; b=hD0NcfHDYfLxtqqkTt1OAwJ6kgBH0J+J6Rq8OSFLLFgo
	UFKNv3OX663OyYfmT3NiLrM9H1H2pYpPF3fROoCy6h1cvrk60AriYQlASYqniuj8
	tpwACCVlaCvmTTw25bqVvVy3uj7uzyjtY/aJSzw+fuErS4sdmvEh+uxgBeMdt2mX
	KBVudaTL7bG01ida5cWO0fJVHWBgB4+G1U69ADVMLdZj4tJZxbceIAKis7Nvl/zN
	49wLaYSpsL7tLrOMlG7cz9yTj0WuWZ82t1MdultC++QTMqyH3VO1vsBadmCcc4k9
	rmryKrk6TN3EayYsxJphbCz63EcZvBFz4+IjE3yuVg==
X-ME-Sender: <xms:sPsSafq21u1xJ1Dl2nPJKAto4MO45VsT3bh7tTkfrOGT7QacXXn6fA>
    <xme:sPsSaTvklfkphZIORqC8BN5Ixaa38xGPO7Bb8Uhn384VSqocUIskN687MA1Gl3bDF
    3pFNHK9W7I17LL3dlUtomrhukguHeRKwapvejfcg0IOiHBvSMQAEQ0>
X-ME-Received: <xmr:sPsSacGKHfQ4BU0fZckGD38bnnA70O9YoueZqzdUtJIeNOx1-Pc0MqkwFv2e8FWGBkooPY4lAcAE_S8i0O8pYrC9>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeeffedrtdeggddvtddtjeekucetufdoteggodetrf
    dotffvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfurfetoffkrfgpnffqhgenuceu
    rghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujf
    gurhephffvvefufffkofggtgfgsehtkeertdertdejnecuhfhrohhmpefpihhklhgrshcu
    ufpnuggvrhhluhhnugcuoehnihhklhgrshdrshhouggvrhhluhhnugdorhgvnhgvshgrsh
    esrhgrghhnrghtvggthhdrshgvqeenucggtffrrghtthgvrhhnpeehudelteetkefgffef
    udefuedvjeeivdekhfevieefgeffheeltddvvefhfeetgeenucevlhhushhtvghrufhiii
    gvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpehnihhklhgrshdrshhouggvrhhluhhn
    ugesrhgrghhnrghtvggthhdrshgvpdhnsggprhgtphhtthhopeejpdhmohguvgepshhmth
    hpohhuthdprhgtphhtthhopehmtghhvghhrggssehkvghrnhgvlhdrohhrghdprhgtphht
    thhopehjrggtohhpohdrmhhonhguihesihguvggrshhonhgsohgrrhgurdgtohhmpdhrtg
    hpthhtoheplhgruhhrvghnthdrphhinhgthhgrrhhtsehiuggvrghsohhnsghorghrugdr
    tghomhdprhgtphhtthhopehlihhnuhigqdhmvgguihgrsehvghgvrhdrkhgvrhhnvghlrd
    horhhgpdhrtghpthhtoheplhhinhhugidqrhgvnhgvshgrshdqshhotgesvhhgvghrrdhk
    vghrnhgvlhdrohhrghdprhgtphhtthhopehlihhnuhigqdhkvghrnhgvlhesvhhgvghrrd
    hkvghrnhgvlhdrohhrghdprhgtphhtthhopehnihhklhgrshdrshhouggvrhhluhhnugdo
    rhgvnhgvshgrshesrhgrghhnrghtvggthhdrshgv
X-ME-Proxy: <xmx:sPsSaUZ1klGCTyY0OsoFXbgoY-dcirxuVRoIi6fK0gffSXvVPFm2rg>
    <xmx:sPsSacWQzbT3YDl9BuoN7nvEOFWDN7Li4hkpmNyp7fYpxwng0SfkKQ>
    <xmx:sPsSaam_HGxDXSbKCIZdjyjVZgR3iHgHIDs4ahSnBdY1dJ6rOvUvLw>
    <xmx:sPsSaXD_eULcAMQnW1yOn-wSXdnA6yrq7DWD8A7Dgi3Op9taI6KWnw>
    <xmx:sPsSaRFeBebpDvSD891sm0QrdgVfgvZnccojXMmDaduLl1o0CChKUrs7>
Feedback-ID: i80c9496c:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Tue,
 11 Nov 2025 04:02:39 -0500 (EST)
From: =?UTF-8?q?Niklas=20S=C3=B6derlund?= <niklas.soderlund+renesas@ragnatech.se>
To: Mauro Carvalho Chehab <mchehab@kernel.org>,
	Jacopo Mondi <jacopo.mondi@ideasonboard.com>,
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	linux-media@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: =?UTF-8?q?Niklas=20S=C3=B6derlund?= <niklas.soderlund+renesas@ragnatech.se>
Subject: [PATCH v4 00/12] media: Add support for R-Car ISP using Dreamchip RPPX1 ISP
Date: Tue, 11 Nov 2025 10:02:16 +0100
Message-ID: <20251111090228.2511734-1-niklas.soderlund+renesas@ragnatech.se>
X-Mailer: git-send-email 2.51.1
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Hello,

This series adds support for two different devices that together enable
ISP support on Renesas R-Car Gen4 ISP processing. The first driver added
is for Dreamchip RPPX1 ISP, this device purely deals with image
processing algorithms, statistics and image conversion; but have no DMA
engines. The second driver is for the R-Car ISP CORE, this device
deals with DMA to/from the RPPX1 ISP and provides a V4L2 user-space
interface for the ISP.

The R-Car ISP driver uses the RPPX1 framework to drive the ISP and
together the two devices provide a functional ISP. For detailed
description of the RPPX1 see patch 1/12, and for details about the R-Car
ISP see commit message in patch 2/12.

The RPPX1 ISP is similar to functionality and design to the Rk1ISP
already supported upstream. For this reason this series reuses the pixel
format for ISP parameters (RK1E) and statistics (RK1S) as the user-space
ABI to configure the ISP. The primary difference to Rk1iSP is the over
all pipeline design and the register layout out is different enough to
make it impractical to bolt it on the existing drivers.

However on a functional block level the blocks amiable and their
register layout mapped to the buffer formats are similar enough to make
the reuse practical. Another difference is that RPPX1 operates at a
hight bitdepth then Rk1ISP, but this is easily supported by scaling the
values to/from the buffers.

All functional blocks present on the RPPX1 are not yet added to the
driver, but most are. Hence not all configuration blocks of the Rk1E
extensible format are supported, but most if not all can be added.

A libcamera pipeline reusing the Rk1ISP IPA have been posted and it can
exercise all function block enabled by this series. It produce good
images using all algorithms available.

Patch 1/12 adds the foundation for the RPPX1 framework. It deals with
probing all function blocks making sure every blocks version register is
supported and setup a "passthru" pipeline that just debayer RAW images.

Patch 2/12 integrates the adds the R-Car ISP CORE DMA parts and
integrates with the RPPX1 framework added in patch 1/12.

Patches 3/12 to 12/12 extends the RPPX1 framework with the logic to drive
the different IPS modules.

The sum of the work pass v4l2-compliance. A test suite for the enabled
function blocks exists and pass. The work have also been tested with
various libcamera utilities and compliance tests together with a IMX219
and IMX462 sensor on R-Car V4H.

Biggest change from v3 is small fixes that 0day found when building for 
non ARM architectures.

Niklas Söderlund (12):
  media: rppx1: Add framework to support Dreamchip RPPX1 ISP
  media: rcar-isp: Add support for ISPCORE
  media: rppx1: Add support for AWB measurement parameters and
    statistics
  media: rppx1: Add support for AWB gain settings
  media: rppx1: Add support for Auto Exposure Measurement
  media: rppx1: Add support for Histogram Measurement
  media: rppx1: Add support for Black Level Subtraction
  media: rppx1: Add support for Color Correction Matrix
  media: rppx1: Add support for Lens Shade Correction
  media: rppx1: Add support for Gamma Correction
  media: rppx1: Add support for Bayer Demosaicing
  media: rppx1: Add support for Bilateral Denoising

 MAINTAINERS                                   |    6 +
 drivers/media/platform/Kconfig                |    1 +
 drivers/media/platform/Makefile               |    1 +
 drivers/media/platform/dreamchip/Kconfig      |    3 +
 drivers/media/platform/dreamchip/Makefile     |    6 +
 .../media/platform/dreamchip/rppx1/Kconfig    |   11 +
 .../media/platform/dreamchip/rppx1/Makefile   |   33 +
 .../platform/dreamchip/rppx1/rpp_module.c     |   40 +
 .../platform/dreamchip/rppx1/rpp_module.h     |  158 +++
 .../platform/dreamchip/rppx1/rpp_params.c     |   82 ++
 .../platform/dreamchip/rppx1/rpp_stats.c      |   30 +
 .../media/platform/dreamchip/rppx1/rppx1.c    |  338 ++++++
 .../media/platform/dreamchip/rppx1/rppx1.h    |   99 ++
 .../platform/dreamchip/rppx1/rppx1_acq.c      |  147 +++
 .../platform/dreamchip/rppx1/rppx1_awbg.c     |   67 ++
 .../media/platform/dreamchip/rppx1/rppx1_bd.c |  210 ++++
 .../platform/dreamchip/rppx1/rppx1_bdrgb.c    |   80 ++
 .../platform/dreamchip/rppx1/rppx1_bls.c      |  175 +++
 .../platform/dreamchip/rppx1/rppx1_cac.c      |   29 +
 .../platform/dreamchip/rppx1/rppx1_ccor.c     |  180 +++
 .../media/platform/dreamchip/rppx1/rppx1_db.c |  156 +++
 .../platform/dreamchip/rppx1/rppx1_dpcc.c     |   76 ++
 .../platform/dreamchip/rppx1/rppx1_exm.c      |  140 +++
 .../media/platform/dreamchip/rppx1/rppx1_ga.c |   83 ++
 .../platform/dreamchip/rppx1/rppx1_hist.c     |  249 ++++
 .../platform/dreamchip/rppx1/rppx1_hist256.c  |   46 +
 .../media/platform/dreamchip/rppx1/rppx1_is.c |   42 +
 .../platform/dreamchip/rppx1/rppx1_lin.c      |   60 +
 .../platform/dreamchip/rppx1/rppx1_lsc.c      |  194 +++
 .../platform/dreamchip/rppx1/rppx1_ltm.c      |   48 +
 .../platform/dreamchip/rppx1/rppx1_ltmmeas.c  |   41 +
 .../platform/dreamchip/rppx1/rppx1_outif.c    |   45 +
 .../platform/dreamchip/rppx1/rppx1_outregs.c  |   75 ++
 .../platform/dreamchip/rppx1/rppx1_rmap.c     |   64 +
 .../platform/dreamchip/rppx1/rppx1_rmapmeas.c |   47 +
 .../platform/dreamchip/rppx1/rppx1_shrp.c     |   64 +
 .../platform/dreamchip/rppx1/rppx1_wbmeas.c   |  188 +++
 .../platform/dreamchip/rppx1/rppx1_xyz2luv.c  |   26 +
 .../media/platform/renesas/rcar-isp/Kconfig   |    1 +
 .../media/platform/renesas/rcar-isp/Makefile  |    2 +-
 .../media/platform/renesas/rcar-isp/core-io.c | 1053 +++++++++++++++++
 .../media/platform/renesas/rcar-isp/core.c    |  826 +++++++++++++
 .../media/platform/renesas/rcar-isp/csisp.c   |   48 +-
 .../platform/renesas/rcar-isp/risp-core.h     |  170 +++
 include/media/rppx1.h                         |   33 +
 45 files changed, 5465 insertions(+), 8 deletions(-)
 create mode 100644 drivers/media/platform/dreamchip/Kconfig
 create mode 100644 drivers/media/platform/dreamchip/Makefile
 create mode 100644 drivers/media/platform/dreamchip/rppx1/Kconfig
 create mode 100644 drivers/media/platform/dreamchip/rppx1/Makefile
 create mode 100644 drivers/media/platform/dreamchip/rppx1/rpp_module.c
 create mode 100644 drivers/media/platform/dreamchip/rppx1/rpp_module.h
 create mode 100644 drivers/media/platform/dreamchip/rppx1/rpp_params.c
 create mode 100644 drivers/media/platform/dreamchip/rppx1/rpp_stats.c
 create mode 100644 drivers/media/platform/dreamchip/rppx1/rppx1.c
 create mode 100644 drivers/media/platform/dreamchip/rppx1/rppx1.h
 create mode 100644 drivers/media/platform/dreamchip/rppx1/rppx1_acq.c
 create mode 100644 drivers/media/platform/dreamchip/rppx1/rppx1_awbg.c
 create mode 100644 drivers/media/platform/dreamchip/rppx1/rppx1_bd.c
 create mode 100644 drivers/media/platform/dreamchip/rppx1/rppx1_bdrgb.c
 create mode 100644 drivers/media/platform/dreamchip/rppx1/rppx1_bls.c
 create mode 100644 drivers/media/platform/dreamchip/rppx1/rppx1_cac.c
 create mode 100644 drivers/media/platform/dreamchip/rppx1/rppx1_ccor.c
 create mode 100644 drivers/media/platform/dreamchip/rppx1/rppx1_db.c
 create mode 100644 drivers/media/platform/dreamchip/rppx1/rppx1_dpcc.c
 create mode 100644 drivers/media/platform/dreamchip/rppx1/rppx1_exm.c
 create mode 100644 drivers/media/platform/dreamchip/rppx1/rppx1_ga.c
 create mode 100644 drivers/media/platform/dreamchip/rppx1/rppx1_hist.c
 create mode 100644 drivers/media/platform/dreamchip/rppx1/rppx1_hist256.c
 create mode 100644 drivers/media/platform/dreamchip/rppx1/rppx1_is.c
 create mode 100644 drivers/media/platform/dreamchip/rppx1/rppx1_lin.c
 create mode 100644 drivers/media/platform/dreamchip/rppx1/rppx1_lsc.c
 create mode 100644 drivers/media/platform/dreamchip/rppx1/rppx1_ltm.c
 create mode 100644 drivers/media/platform/dreamchip/rppx1/rppx1_ltmmeas.c
 create mode 100644 drivers/media/platform/dreamchip/rppx1/rppx1_outif.c
 create mode 100644 drivers/media/platform/dreamchip/rppx1/rppx1_outregs.c
 create mode 100644 drivers/media/platform/dreamchip/rppx1/rppx1_rmap.c
 create mode 100644 drivers/media/platform/dreamchip/rppx1/rppx1_rmapmeas.c
 create mode 100644 drivers/media/platform/dreamchip/rppx1/rppx1_shrp.c
 create mode 100644 drivers/media/platform/dreamchip/rppx1/rppx1_wbmeas.c
 create mode 100644 drivers/media/platform/dreamchip/rppx1/rppx1_xyz2luv.c
 create mode 100644 drivers/media/platform/renesas/rcar-isp/core-io.c
 create mode 100644 drivers/media/platform/renesas/rcar-isp/core.c
 create mode 100644 drivers/media/platform/renesas/rcar-isp/risp-core.h
 create mode 100644 include/media/rppx1.h

-- 
2.51.1


