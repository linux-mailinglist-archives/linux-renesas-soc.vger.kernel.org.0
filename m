Return-Path: <linux-renesas-soc+bounces-23646-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 004EBC0E2DB
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 27 Oct 2025 14:53:28 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 474E43AB1CD
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 27 Oct 2025 13:45:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C8FD72F6912;
	Mon, 27 Oct 2025 13:45:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b="ojxWCtje"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mout-p-101.mailbox.org (mout-p-101.mailbox.org [80.241.56.151])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DCB8D2F1FE4
	for <linux-renesas-soc@vger.kernel.org>; Mon, 27 Oct 2025 13:45:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=80.241.56.151
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761572740; cv=none; b=rtSlkwRDwkanz4LEyqpk5i8XpJMDUy+r3SE9E/+hYGg/MIK/kljfyN+4kkTv3OmLwq6GORBbtWi6WnGf/kKTSzybkuh33se73Y8BKs9Nlrb4twm+Pf8Oa13a99xNrsb6Jw5PhG4Pq/LMdaidt8JVtclz1nyTnLGI1gRu8KX0/F0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761572740; c=relaxed/simple;
	bh=loMIeXD9u0c5qc9PoWOMVHFVI5oMxGG1imanKqchD4U=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Oz72/rIKvMbSdcS2eLmLv96/nKPD9DOc+aCCbNiKCHdLvmkWNx9yygE6/xtuuMUiEvLtDeFODkDG3BVqKSS4uks38D/FBItIwvGBBIaDqOksAnJU8JGDy1XfsN2E78inQ5AMVWTIpanxFiGBTnUz1MGal8+5B6A+PNvKCxoaKXM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mailbox.org; spf=pass smtp.mailfrom=mailbox.org; dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b=ojxWCtje; arc=none smtp.client-ip=80.241.56.151
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mailbox.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mailbox.org
Received: from smtp2.mailbox.org (smtp2.mailbox.org [10.196.197.2])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mout-p-101.mailbox.org (Postfix) with ESMTPS id 4cwFBl1FbMz9stG;
	Mon, 27 Oct 2025 14:45:35 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org; s=mail20150812;
	t=1761572735;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=BnB21FDiwxmVcyKyiTqv1p4dgJtK06tH8IXDXJKcNbc=;
	b=ojxWCtjeIWSwCsxtp3H318kobeaHbB3qtciVrqHeFsWcYY4bsMiJARvSkLRHQgLjAx/HdX
	D4k9MgsLuD4kc81TXybRsvYu/ITfDKmsad/7VCdb+60DWL65gqWE4S+7r4j3cEqZaDtAtf
	uAryfWhx97Hbe9yLTQ5WdL9feFmoYAXvTAbEjo3mBV1k35m9e/qsrx4xSRc/O0i5jvWeMy
	r131ei0P2sj1jEw/jkpxe3CKskYMQecvyPSvek7htctvwnlX6ShSYP92KcvqWYtdMOnv8+
	lB7INreFeFvgUOd8nV9VCxbMCeqAcyVZIGH1iCNCq8cOFUTLPHl7c46LwOnJiw==
Message-ID: <59645a9a-69f3-4a81-8983-1594956958ea@mailbox.org>
Date: Mon, 27 Oct 2025 14:45:30 +0100
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Subject: Re: [PATCH v3 00/11] drm/rcar-du: dsi: Convert register bits to
 BIT()/GENMASK() macros
To: dri-devel@lists.freedesktop.org,
 Tomi Valkeinen <tomi.valkeinen+renesas@ideasonboard.com>
Cc: David Airlie <airlied@gmail.com>,
 Geert Uytterhoeven <geert+renesas@glider.be>,
 Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
 Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Magnus Damm <magnus.damm@gmail.com>, Maxime Ripard <mripard@kernel.org>,
 Simona Vetter <simona@ffwll.ch>, Thomas Zimmermann <tzimmermann@suse.de>,
 linux-renesas-soc@vger.kernel.org
References: <20251005030355.202242-1-marek.vasut+renesas@mailbox.org>
Content-Language: en-US
From: Marek Vasut <marek.vasut@mailbox.org>
In-Reply-To: <20251005030355.202242-1-marek.vasut+renesas@mailbox.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-MBO-RS-META: 3cfnicdoe113ynxgenp1tw58wqeu4ww3
X-MBO-RS-ID: 6bf091ff043e94b4015

On 10/5/25 5:02 AM, Marek Vasut wrote:
> Convert register bits to BIT() macro and bitfields to GENMASK()/FIELD_PREP() macros.
> Most of this patchset is boring mechanical conversion.
> 
> Noteworthy patches are 6 and 7 , those introduce handling of DSI mode flags
> and convert use of DRM_MODE_FLAG_P.SYNC into DRM_MODE_FLAG_N.SYNC, but that
> should not have any adverse effect on existing hardware.
> 
> Marek Vasut (11):
>    drm/rcar-du: dsi: Fix missing parameter in RXSETR_...EN macros
>    drm/rcar-du: dsi: Document TXVMSETR PIXWDTH as bitfield
>    drm/rcar-du: dsi: Document PHTR TESTDOUT as bitfield
>    drm/rcar-du: dsi: Deduplicate mipi_dsi_pixel_format_to_bpp() usage
>    drm/rcar-du: dsi: Clean up VCLKSET register macros
>    drm/rcar-du: dsi: Clean up CLOCKSET1 CLKINSEL macros
>    drm/rcar-du: dsi: Clean up TXVMPSPHSETR DT macros
>    drm/rcar-du: dsi: Respect DSI mode flags
>    drm/rcar-du: dsi: Clean up handling of DRM mode flags
>    drm/rcar-du: dsi: Convert register bits to BIT() macro
>    drm/rcar-du: dsi: Convert register bitfields to GENMASK() macro
> 
>   .../gpu/drm/renesas/rcar-du/rcar_mipi_dsi.c   |  50 ++-
>   .../drm/renesas/rcar-du/rcar_mipi_dsi_regs.h  | 387 +++++++++---------
>   2 files changed, 237 insertions(+), 200 deletions(-)
How can we proceed with this series ?

