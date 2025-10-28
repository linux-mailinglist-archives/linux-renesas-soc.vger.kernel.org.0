Return-Path: <linux-renesas-soc+bounces-23788-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 0EB3EC16259
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 28 Oct 2025 18:29:35 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id F05281C2478C
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 28 Oct 2025 17:29:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5B7B534166C;
	Tue, 28 Oct 2025 17:29:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="CN1ejqL1"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 85CB824291E
	for <linux-renesas-soc@vger.kernel.org>; Tue, 28 Oct 2025 17:29:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761672543; cv=none; b=rUgPOF/ktIIFdIvs855QlcWqr8NzmqjahIn9paUyN3ALCi/OOIKk3zbAFz8iDA5iV+Rg0M47zyhvkC7q7Kq1TYC/G+2Qa/YFJGqGmO/Ht0BlHX0FDz+wP57JRvpK+HwEEIl22f4K4a/OEsVPfR+opDLsZraf2zT+h3ni5Wa0TUk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761672543; c=relaxed/simple;
	bh=kvCaVxU1ELq1lPUuwkUP04tYtGpS5sdCXONZfIGMmCI=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=ThH3fIybrDckSDsI7JEiedcKAeddEaOq87HWmhiq/enbNjDRlIt31Z9xaQhc5K6uKIAM2kS8lht1ohQDriDxPHqG2XHKBS/f1XDQ5B95/gAEj4aK5DOicRD1Th90nu0IGoEKbiGDrQiN/1e4uSZC3+uOp6YAdf6cgJSDO1wkkJE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=CN1ejqL1; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from [192.168.88.20] (91-158-153-178.elisa-laajakaista.fi [91.158.153.178])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 2C85EE77;
	Tue, 28 Oct 2025 18:27:10 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1761672430;
	bh=kvCaVxU1ELq1lPUuwkUP04tYtGpS5sdCXONZfIGMmCI=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=CN1ejqL13IPGxh4mjjRRw44+4531n7VBYtCO1ErJMxulfL2GAlBRym02qBaHB+nc0
	 YlzMwTWETUWejYWYrj2Ou45lh93O2X0KWAgD+uRw14yrsNzv1/wEgmrEA0F/zkY5TO
	 Si2U39gMIET0Is4R+KMxHBgnQ0jBTGEhENjzCMjs=
Message-ID: <bff68fb9-d826-4d5e-8896-13cc62d40093@ideasonboard.com>
Date: Tue, 28 Oct 2025 19:28:56 +0200
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 00/11] drm/rcar-du: dsi: Convert register bits to
 BIT()/GENMASK() macros
To: Marek Vasut <marek.vasut+renesas@mailbox.org>,
 dri-devel@lists.freedesktop.org
Cc: David Airlie <airlied@gmail.com>,
 Geert Uytterhoeven <geert+renesas@glider.be>,
 Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
 Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Magnus Damm <magnus.damm@gmail.com>, Maxime Ripard <mripard@kernel.org>,
 Simona Vetter <simona@ffwll.ch>, Thomas Zimmermann <tzimmermann@suse.de>,
 linux-renesas-soc@vger.kernel.org
References: <20251005030355.202242-1-marek.vasut+renesas@mailbox.org>
From: Tomi Valkeinen <tomi.valkeinen+renesas@ideasonboard.com>
Content-Language: en-US
In-Reply-To: <20251005030355.202242-1-marek.vasut+renesas@mailbox.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi,

On 05/10/2025 06:02, Marek Vasut wrote:
> Convert register bits to BIT() macro and bitfields to GENMASK()/FIELD_PREP() macros.
> Most of this patchset is boring mechanical conversion.
> 
> Noteworthy patches are 6 and 7 , those introduce handling of DSI mode flags
> and convert use of DRM_MODE_FLAG_P.SYNC into DRM_MODE_FLAG_N.SYNC, but that
> should not have any adverse effect on existing hardware.

After the few minor comments I sent resolved, for the series:

Reviewed-by: Tomi Valkeinen <tomi.valkeinen+renesas@ideasonboard.com>

 Tomi


> Marek Vasut (11):
>   drm/rcar-du: dsi: Fix missing parameter in RXSETR_...EN macros
>   drm/rcar-du: dsi: Document TXVMSETR PIXWDTH as bitfield
>   drm/rcar-du: dsi: Document PHTR TESTDOUT as bitfield
>   drm/rcar-du: dsi: Deduplicate mipi_dsi_pixel_format_to_bpp() usage
>   drm/rcar-du: dsi: Clean up VCLKSET register macros
>   drm/rcar-du: dsi: Clean up CLOCKSET1 CLKINSEL macros
>   drm/rcar-du: dsi: Clean up TXVMPSPHSETR DT macros
>   drm/rcar-du: dsi: Respect DSI mode flags
>   drm/rcar-du: dsi: Clean up handling of DRM mode flags
>   drm/rcar-du: dsi: Convert register bits to BIT() macro
>   drm/rcar-du: dsi: Convert register bitfields to GENMASK() macro
> 
>  .../gpu/drm/renesas/rcar-du/rcar_mipi_dsi.c   |  50 ++-
>  .../drm/renesas/rcar-du/rcar_mipi_dsi_regs.h  | 387 +++++++++---------
>  2 files changed, 237 insertions(+), 200 deletions(-)
> 
> ---
> Cc: David Airlie <airlied@gmail.com>
> Cc: Geert Uytterhoeven <geert+renesas@glider.be>
> Cc: Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>
> Cc: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
> Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
> Cc: Magnus Damm <magnus.damm@gmail.com>
> Cc: Maxime Ripard <mripard@kernel.org>
> Cc: Simona Vetter <simona@ffwll.ch>
> Cc: Thomas Zimmermann <tzimmermann@suse.de>
> Cc: Tomi Valkeinen <tomi.valkeinen+renesas@ideasonboard.com>
> Cc: dri-devel@lists.freedesktop.org
> Cc: linux-renesas-soc@vger.kernel.org
> 


