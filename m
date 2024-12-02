Return-Path: <linux-renesas-soc+bounces-10770-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 67BDC9DFE0C
	for <lists+linux-renesas-soc@lfdr.de>; Mon,  2 Dec 2024 11:03:49 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id CD55BB249B7
	for <lists+linux-renesas-soc@lfdr.de>; Mon,  2 Dec 2024 10:03:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A42911FA15A;
	Mon,  2 Dec 2024 10:03:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="TdZixu1D"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7EA3618AEA
	for <linux-renesas-soc@vger.kernel.org>; Mon,  2 Dec 2024 10:03:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733133818; cv=none; b=eDypOuaMA8+jpuX4Babh9btNe2HnDnsjGFRP3aqxmTifojvz0cv4VjiGc5eoqsQFEKH7FDp6TAEwtCB7dksKnKYjj0QbwcDZJ9SHHLbuD2xTZhazwcx/Pd/6273Fj3AJG+OJM00TY/zYtUHDF+x8iZee7SdC9J8ZQLcv8zdkAII=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733133818; c=relaxed/simple;
	bh=fVRziINejjrmbw4Va+SuQ0C6qC5L/1bvzfXuE8mkWe0=;
	h=Content-Type:MIME-Version:Subject:From:Message-Id:Date:To; b=bPp8Pkat5aOSBRxakimuT275HSdkY0EXH8fh6q5Bs5ZHRsXBA8Gv9oLGJvsdwlA4ekZRON7ALPOlF1qkWcKvd0+zU+LCKW6jv4hKc4Evl+Jcpm/0/q/Ab8sTWXNbYSvaAFZCRa+6jV6ylDG2iNFlvgE0/ewyWULYjHpYDc5+PWg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=TdZixu1D; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 54AAAC4CED1
	for <linux-renesas-soc@vger.kernel.org>; Mon,  2 Dec 2024 10:03:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1733133818;
	bh=fVRziINejjrmbw4Va+SuQ0C6qC5L/1bvzfXuE8mkWe0=;
	h=Subject:From:Date:To:From;
	b=TdZixu1DH3qRh5aoitlr9fMo9M5RArWYjqh8yLLWQAH5X7kbbd9pcd4UIdIeHmS9g
	 OdVTrRSrdYEPWhukVTsjABf7XgzQ7sv108fOcBfAYXE4I+V4jzw9dTd6QnUn7GiUak
	 whCGYZxzBZIUpRH2X+ISS6X6a+LWLpL3tqY478R5ANm4ohb1Bc3raBXEt2jwVeq6TD
	 zfC2edxq7R8Bbt5xq1r/X1xEQ3yJDu2bLptR35xEXxQmabRDnRziaddOZidWho4L0S
	 K7Ast27IzgkhXuw9gWOCh3IGVMiwxMp62hqtU1OnerlsJJFxsItSB1Bm7HVBGURcMT
	 So+5W78AgBTDw==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 74E3C3806656
	for <linux-renesas-soc@vger.kernel.org>; Mon,  2 Dec 2024 10:03:53 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Patchwork summary for: linux-renesas-soc
From: patchwork-bot+linux-renesas-soc@kernel.org
Message-Id: 
 <173313383194.3453119.15823044973226442010.git-patchwork-summary@kernel.org>
Date: Mon, 02 Dec 2024 10:03:51 +0000
To: linux-renesas-soc@vger.kernel.org

Hello:

The following patches were marked "mainlined", because they were applied to
geert/renesas-devel.git (master):

Patch: [v2] v4l2-subdev: Return -EOPNOTSUPP for unsupported pad type in call_get_frame_desc()
  Submitter: Lad, Prabhakar <prabhakar.csengg@gmail.com>
  Committer: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
  Patchwork: https://patchwork.kernel.org/project/linux-renesas-soc/list/?series=896197
  Lore link: https://lore.kernel.org/r/20241007123809.89281-1-prabhakar.mahadev-lad.rj@bp.renesas.com

Patch: rtc: rzn1: fix BCD to rtc_time conversion errors
  Submitter: Wolfram Sang <wsa+renesas@sang-engineering.com>
  Committer: Alexandre Belloni <alexandre.belloni@bootlin.com>
  Patchwork: https://patchwork.kernel.org/project/linux-renesas-soc/list/?series=909249
  Lore link: https://lore.kernel.org/r/20241113113032.27409-1-wsa+renesas@sang-engineering.com

Series: media: platform: rzg2l-cru: CSI-2 and CRU enhancements
  Submitter: Lad, Prabhakar <prabhakar.csengg@gmail.com>
  Committer: Hans Verkuil <hverkuil@xs4all.nl>
  Patchwork: https://patchwork.kernel.org/project/linux-renesas-soc/list/?series=900725
  Lore link: https://lore.kernel.org/r/20241018133446.223516-1-prabhakar.mahadev-lad.rj@bp.renesas.com
    Patches: [v6,01/23] media: rzg2l-cru: Use RZG2L_CRU_IP_SINK/SOURCE enum entries
             [v6,02/23] media: rzg2l-cru: Mark sink and source pad with MUST_CONNECT flag
             [v6,03/23] media: rzg2l-cru: csi2: Mark sink and source pad with MUST_CONNECT flag
             [v6,04/23] media: rzg2l-cru: csi2: Use ARRAY_SIZE() in media_entity_pads_init()
             [v6,05/23] media: rzg2l-cru: csi2: Implement .get_frame_desc()
             [v6,06/23] media: rzg2l-cru: Retrieve virtual channel information
             [v6,07/23] media: rzg2l-cru: Remove `channel` member from `struct rzg2l_cru_csi`
             [v6,08/23] media: rzg2l-cru: Use MIPI CSI-2 data types for ICnMC_INF definitions
             [v6,09/23] media: rzg2l-cru: Remove unused fields from rzg2l_cru_ip_format struct
             [v6,10/23] media: rzg2l-cru: Remove unnecessary WARN_ON check in format func
             [v6,11/23] media: rzg2l-cru: Simplify configuring input format for image processing
             [v6,12/23] media: rzg2l-cru: Inline calculating image size
             [v6,13/23] media: rzg2l-cru: Simplify handling of supported formats
             [v6,14/23] media: rzg2l-cru: Inline calculating bytesperline
             [v6,15/23] media: rzg2l-cru: Make use of v4l2_format_info() helpers
             [v6,16/23] media: rzg2l-cru: Use `rzg2l_cru_ip_formats` array in enum_frame_size
             [v6,17/23] media: rzg2l-cru: csi2: Remove unused field from rzg2l_csi2_format
             [v6,18/23] media: rzg2l-cru: video: Implement .link_validate() callback
             [v6,19/23] media: rzg2l-cru: csi2: Use rzg2l_csi2_formats array in enum_frame_size
             [v6,20/23] media: rzg2l-cru: Refactor ICnDMR register configuration
             [v6,21/23] media: rzg2l-cru: Add support to capture 8bit raw sRGB
             [v6,22/23] media: rzg2l-cru: Move register definitions to a separate file
             [v6,23/23] media: renesas: rzg2l-cru: Add 'yuv' flag to IP format structure

Series: rcar-isp: Add support for R-Car V4M
  Submitter: Niklas Söderlund <niklas.soderlund+renesas@ragnatech.se>
  Committer: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
  Patchwork: https://patchwork.kernel.org/project/linux-renesas-soc/list/?series=894788
  Lore link: https://lore.kernel.org/r/20241002103318.24289-1-niklas.soderlund+renesas@ragnatech.se
    Patches: [v3,1/3] dt-bindings: media: renesas,isp: Add Gen4 family fallback
             [v3,2/3] media: rcar-isp: Add family compatible for R-Car Gen4 family
             [v3,3/3] dt-bindings: media: renesas,isp: Add binding for V4M

Patch: drm: renesas: shmobile: Add drm_panic support
  Submitter: Geert Uytterhoeven <geert+renesas@glider.be>
  Committer: Maxime Ripard <mripard@kernel.org>
  Patchwork: https://patchwork.kernel.org/project/linux-renesas-soc/list/?series=856178
  Lore link: https://lore.kernel.org/r/292638fde9aef8b00e984245f43dc02a818cf322.1716816827.git.geert+renesas@glider.be

Patch: drm: renesas: rcar-du: Add drm_panic support for non-vsp
  Submitter: Geert Uytterhoeven <geert+renesas@glider.be>
  Committer: Maxime Ripard <mripard@kernel.org>
  Patchwork: https://patchwork.kernel.org/project/linux-renesas-soc/list/?series=856179
  Lore link: https://lore.kernel.org/r/b633568d2e3f405b21debdd60854fe39780254d6.1716816897.git.geert+renesas@glider.be

Patch: [v1] usb: gadget: udc: fix typo in the comment
  Submitter: Yan Zhen <yanzhen@vivo.com>
  Committer: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
  Patchwork: https://patchwork.kernel.org/project/linux-renesas-soc/list/?series=891644
  Lore link: https://lore.kernel.org/r/20240920084708.1967059-1-yanzhen@vivo.com

Series: media: rcar-csi2: Add support for V4M
  Submitter: Niklas Söderlund <niklas.soderlund+renesas@ragnatech.se>
  Committer: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
  Patchwork: https://patchwork.kernel.org/project/linux-renesas-soc/list/?series=885353
  Lore link: https://lore.kernel.org/r/20240830203104.3479124-1-niklas.soderlund+renesas@ragnatech.se
    Patches: [v2,1/8] dt-bindings: media: renesas,csi2: Add binding for V4M
             [v2,2/8] media: rcar-csi2: Correct field size for PHTW writes
             [v2,3/8] media: rcar-csi2: Allow writing any code and data value to PHTW
             [v2,4/8] media: rcar-csi2: Abstract PHTW and PHYPLL register offsets
             [v2,5/8] media: rcar-csi2: Add helper to lookup mbps settings
             [v2,6/8] media: rcar-csi2: Move PHTW write helpers
             [v2,7/8] media: rcar-csi2: Add documentation for PHY_EN and PHY_MODE registers
             [v2,8/8] media: rcar-csi2: Add support for R-Car V4M

Patch: ASoC: rsnd: Refactor port handling with helper for endpoint node selection
  Submitter: Lad, Prabhakar <prabhakar.csengg@gmail.com>
  Committer: Mark Brown <broonie@kernel.org>
  Patchwork: https://patchwork.kernel.org/project/linux-renesas-soc/list/?series=898316
  Lore link: https://lore.kernel.org/r/20241011175346.1093649-1-prabhakar.mahadev-lad.rj@bp.renesas.com

Series: media: ov5645: Add support for streams
  Submitter: Lad, Prabhakar <prabhakar.csengg@gmail.com>
  Patchwork: https://patchwork.kernel.org/project/linux-renesas-soc/list/?series=900788
  Lore link: https://lore.kernel.org/r/20241018153230.235647-1-prabhakar.mahadev-lad.rj@bp.renesas.com
    Patches: [v3,01/10] media: i2c: ov5645: Add V4L2_SUBDEV_FL_HAS_EVENTS and subscribe hooks
             [v3,03/10] media: i2c: ov5645: Replace dev_err with dev_err_probe in probe function
             [v3,04/10] media: i2c: ov5645: Use v4l2_async_register_subdev_sensor()
             [v3,05/10] media: i2c: ov5645: Drop `power_lock` mutex
             [v3,06/10] media: i2c: ov5645: Use subdev active state

Series: usb: renesas_usbhs: Deprecate renesas,enable-gpio
  Submitter: Geert Uytterhoeven <geert+renesas@glider.be>
  Committer: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
  Patchwork: https://patchwork.kernel.org/project/linux-renesas-soc/list/?series=894741
  Lore link: https://lore.kernel.org/r/cover.1727853953.git.geert+renesas@glider.be
    Patches: [1/2] dt-bindings: usb: renesas,usbhs: Deprecate renesas,enable-gpio

Patch: dma-mapping: Save base/size instead of pointer to shared DMA pool
  Submitter: Geert Uytterhoeven <geert+renesas@glider.be>
  Committer: Christoph Hellwig <hch@lst.de>
  Patchwork: https://patchwork.kernel.org/project/linux-renesas-soc/list/?series=908994
  Lore link: https://lore.kernel.org/r/f8cef6845a6141f0277e31a71fe153612daae776.1731436631.git.geert+renesas@glider.be

Patch: [v2] media: rcar-vin: Add support for RAW10
  Submitter: Niklas Söderlund <niklas.soderlund+renesas@ragnatech.se>
  Committer: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
  Patchwork: https://patchwork.kernel.org/project/linux-renesas-soc/list/?series=886876
  Lore link: https://lore.kernel.org/r/20240904150656.1495705-1-niklas.soderlund+renesas@ragnatech.se

Series: media: staging: max96712: Add support for MAX96724
  Submitter: Niklas Söderlund <niklas.soderlund+renesas@ragnatech.se>
  Committer: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
  Patchwork: https://patchwork.kernel.org/project/linux-renesas-soc/list/?series=894768
  Lore link: https://lore.kernel.org/r/20241002092331.4135906-1-niklas.soderlund+renesas@ragnatech.se
    Patches: [v4,1/5] dt-bindings: i2c: maxim,max96712: Add compatible for MAX96724
             [v4,2/5] media: staging: max96712: Remove device id check
             [v4,3/5] media: staging: max96712: Move link frequency setting to device struct
             [v4,4/5] media: staging: max96712: Document the DEBUG_EXTRA register
             [v4,5/5] media: staging: max96712: Add support for MAX96724

Patch: [PATCHv4,net-next] net: dsa: use ethtool string helpers
  Submitter: Rosen Penev <rosenp@gmail.com>
  Committer: Jakub Kicinski <kuba@kernel.org>
  Patchwork: https://patchwork.kernel.org/project/linux-renesas-soc/list/?series=903640
  Lore link: https://lore.kernel.org/r/20241028044828.1639668-1-rosenp@gmail.com

Patch: i2c: testunit: improve error handling for GPIO
  Submitter: Wolfram Sang <wsa+renesas@sang-engineering.com>
  Committer: Wolfram Sang <wsa+renesas@sang-engineering.com>
  Patchwork: https://patchwork.kernel.org/project/linux-renesas-soc/list/?series=888368
  Lore link: https://lore.kernel.org/r/20240909101449.22956-2-wsa+renesas@sang-engineering.com

Patch: regulator: Switch back to struct platform_driver::remove()
  Submitter: Uwe Kleine-König <u.kleine-koenig@baylibre.com>
  Committer: Mark Brown <broonie@kernel.org>
  Patchwork: https://patchwork.kernel.org/project/linux-renesas-soc/list/?series=908733
  Lore link: https://lore.kernel.org/r/ab85510f83fa901e44d5d563fe6e768054229bfe.1731398433.git.u.kleine-koenig@baylibre.com


Total patches: 56

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



