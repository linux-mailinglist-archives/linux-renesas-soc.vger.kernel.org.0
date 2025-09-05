Return-Path: <linux-renesas-soc+bounces-21496-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id B39D8B45B53
	for <lists+linux-renesas-soc@lfdr.de>; Fri,  5 Sep 2025 16:59:29 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 9B2943B8745
	for <lists+linux-renesas-soc@lfdr.de>; Fri,  5 Sep 2025 14:57:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DA544306B0C;
	Fri,  5 Sep 2025 14:56:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="hPPiVFth"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 28805306B09;
	Fri,  5 Sep 2025 14:56:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757084212; cv=none; b=Hftx3IpUGD4wkFvjsCP58GbL3Pr+8WuP7NuiR2LTLmFKBRF8AQ8hCJWXkyvmKf3DSw50W3eSPlIE6noWpmVQ+8WidCrwV8AMUGrXVkIe+5OEQ2G2dj/Xw+uot2yBmE1xO94HQIslcKwlDly3q14a27ERos66CHv0b/AjggeDT+A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757084212; c=relaxed/simple;
	bh=JlwXV/L/hClHvD7YWhLZeiEniwCDQZ1JCrzhPBP/dIk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=emXaJ7K3Za4/M/jf98t7qMw7SuvQHs+9+6ijvit/Cb6GQKvBuPgfAWcHuumQf7FpD0uBrCR1p3io+2XjplfBK0hdsHXjJHR4FbMKCxWkwEVRWuQyPsWgKNw6CzmWCZ6/gJa7vLfNb2s5cSfJXnpj8olEhHuYiiZEHcEqqgKCgJw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=hPPiVFth; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from pendragon.ideasonboard.com (230.215-178-91.adsl-dyn.isp.belgacom.be [91.178.215.230])
	by perceval.ideasonboard.com (Postfix) with UTF8SMTPSA id 3D2D682A;
	Fri,  5 Sep 2025 16:55:38 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1757084138;
	bh=JlwXV/L/hClHvD7YWhLZeiEniwCDQZ1JCrzhPBP/dIk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=hPPiVFthoXMl9ggsG3F5UCziYypUHP4z1sOmbV/9PPoUtQFzHXbWgBLavL2wIc/zd
	 kxdTorcTQPmKVLLbpUy5CpPoTBXcq5N/ev9Bn4IiNHS+uA2RgUn1rPBJlrU2FT3OHA
	 WnjL/MOTZqtLU8umJ72Ol2JGgdfvSOEkJcW9cO+g=
Date: Fri, 5 Sep 2025 16:56:27 +0200
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Niklas =?utf-8?Q?S=C3=B6derlund?= <niklas.soderlund+renesas@ragnatech.se>
Cc: Geert Uytterhoeven <geert+renesas@glider.be>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Marek Vasut <marek.vasut+renesas@mailbox.org>,
	linux-renesas-soc@vger.kernel.org, devicetree@vger.kernel.org
Subject: Re: [PATCH v5 0/4] arm64: dts: renesas: sparrow-hawk: Add overlays
 for camera sensors
Message-ID: <20250905145627.GC6549@pendragon.ideasonboard.com>
References: <20250905084050.310651-1-niklas.soderlund+renesas@ragnatech.se>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250905084050.310651-1-niklas.soderlund+renesas@ragnatech.se>

Hi Niklas,

On Fri, Sep 05, 2025 at 10:40:46AM +0200, Niklas Söderlund wrote:
> Hello,
> 
> This series adds a couple of overlays to verify the two CSI-2 busses
> exposed on the V4H Sparrow Hawk board. The two busses are exposed on two
> connectors labeled J1 and J2 on the board.
> 
> The first set adds overlays for the IMX219 camera sensor, one for each
> connector (patch 1/4 and 2/4). A Raspberry Pi Camera Module 2 have been
> used to verify the proper operation of the overlays.
> 
> The second sets adds overlays for the IMX462 camera sensors, also one
> for each connector (patch 4/5 and 4/4). A DFM 36SX462-ML camera module
> have been used to verify the proper operation of the overlays.
> 
> The reason two sets of overlays are needed is that the IMX219 uses
> 2-lanes CSI-2 D-PHY bus, while the IMX462 uses a 4-lane CSI-2 D-PHY bus.
> To be able to properly test both situations on the board each sensor
> needs to be able to connected to each of the two external busses.
> 
> Obviously only one sensor can be connected to J1, and one to J2 at any
> given time.
> 
> See individual patches for changelog.
> 
> Niklas Söderlund (4):
>   arm64: dts: renesas: sparrow-hawk: Add overlay for IMX219 on J1
>   arm64: dts: renesas: sparrow-hawk: Add overlay for IMX219 on J2
>   arm64: dts: renesas: sparrow-hawk: Add overlay for IMX462 on J1
>   arm64: dts: renesas: sparrow-hawk: Add overlay for IMX462 on J2

For the whole series,

Reviewed-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>

Luca Ceresoli gave a talk at ELCE about DT connectors. You can find the
slides at https://static.sched.com/hosted_files/osseu2025/7f/ceresoli-elce-2025-hotplug-status.pdf.
Once that lands, camera overlays could be greatly simplified. The
overlays will need to be split in two though, with the part that enables
the SoC IP cores separate from the camera module overlay itself.

> 
>  arch/arm64/boot/dts/renesas/Makefile          |  12 ++
>  ...8a779g3-sparrow-hawk-camera-j1-imx219.dtso | 116 +++++++++++++++++
>  ...8a779g3-sparrow-hawk-camera-j1-imx462.dtso | 117 ++++++++++++++++++
>  ...8a779g3-sparrow-hawk-camera-j2-imx219.dtso | 116 +++++++++++++++++
>  ...8a779g3-sparrow-hawk-camera-j2-imx462.dtso | 117 ++++++++++++++++++
>  5 files changed, 478 insertions(+)
>  create mode 100644 arch/arm64/boot/dts/renesas/r8a779g3-sparrow-hawk-camera-j1-imx219.dtso
>  create mode 100644 arch/arm64/boot/dts/renesas/r8a779g3-sparrow-hawk-camera-j1-imx462.dtso
>  create mode 100644 arch/arm64/boot/dts/renesas/r8a779g3-sparrow-hawk-camera-j2-imx219.dtso
>  create mode 100644 arch/arm64/boot/dts/renesas/r8a779g3-sparrow-hawk-camera-j2-imx462.dtso

-- 
Regards,

Laurent Pinchart

