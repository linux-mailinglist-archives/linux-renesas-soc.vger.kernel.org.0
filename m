Return-Path: <linux-renesas-soc+bounces-25480-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [142.0.200.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 86265C98345
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 01 Dec 2025 17:16:28 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 819054E14E4
	for <lists+linux-renesas-soc@lfdr.de>; Mon,  1 Dec 2025 16:16:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0F7281E5B60;
	Mon,  1 Dec 2025 16:16:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Lt7eAstP"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D0E4D191F98
	for <linux-renesas-soc@vger.kernel.org>; Mon,  1 Dec 2025 16:16:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764605785; cv=none; b=QqKLN7TzKqg3eafffk7fVE1sHuZI7Zp1aooCMvjxpzBtPTUO3ezObTejD5tBft/oeWLf/wQwS3SPWvtTFAU4sYczjHHI70VrU7AOPIEiIr8B8qS2OuTTFSt/3I0PkYr1MjZRsrkgz18Vi+3Z+ORaCGB0keIiBZytL3jixZJ3Mfw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764605785; c=relaxed/simple;
	bh=jbDD+wSsL3QQpBOs8+TyGTak0H4rmonOZGSkap9RdyU=;
	h=Message-ID:Date:From:To:Subject:In-Reply-To:References:Cc; b=gv6zs5WLbeYfDSrnejNE06bHOZ8Y4JZ63Cmr10bKhTY+mCovOUYVSdveUMxkc+eV6s4y8dHoqE3HRPp2BrD6f/JlrhPKkrfZ4QSS+rl1blnRIoInqBqLmWlBSRNl5MkDHWsi3Xgr7OLyRAYjTaT8qp+HoRzpAFADXcd9dvqmdIg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Lt7eAstP; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CA596C4CEF1;
	Mon,  1 Dec 2025 16:16:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1764605785;
	bh=jbDD+wSsL3QQpBOs8+TyGTak0H4rmonOZGSkap9RdyU=;
	h=Date:From:To:Subject:In-Reply-To:References:Cc:From;
	b=Lt7eAstPQbS6xb37yExeyHfhp+lK0KhoTPbLWndI5IRha7Q8z0ntIZg5E45dN+CZL
	 iyC/oiTrAEotKiJcfO9k5BHAMbf6OMf8b+eupzflbA7vtM89n1b/o+zIrEYlxqXywD
	 DvOttvYKva1pwJZyUvOMk7siU7IjBLeRTKjeLAuRNh4Y9GFSd08iN1FCKHtxr8Vm3x
	 H9s4SHTH9K8AHiRwmB+h5SngnOggkPZWlY12/5UBdI7f1Ouum/XGublIrr0TDPmLbv
	 vkTwL2CZsQM32DxvptzPCSq+JZJsdEYSfuBXauLt1177D7zoTSRGBWXBY5rKr7J4TK
	 aFl9ne9ez3ZMw==
Message-ID: <a1cd8e33e8cb3f21fb8a8b2d9543be4e@kernel.org>
Date: Mon, 01 Dec 2025 16:16:22 +0000
From: "Maxime Ripard" <mripard@kernel.org>
To: "Linus Walleij" <linusw@kernel.org>
Subject: Re: [PATCH v5 3/3] drm/rcar-du: Modify custom commit tail
In-Reply-To: <20251130-mcde-drm-regression-thirdfix-v5-3-aed71a32981d@kernel.org>
References: <20251130-mcde-drm-regression-thirdfix-v5-3-aed71a32981d@kernel.org>
Cc: dri-devel@lists.freedesktop.org, linux-renesas-soc@vger.kernel.org, "Aradhya
 Bhatia" <a-bhatia1@ti.com>, "David Airlie" <airlied@gmail.com>, "Dmitry
 Baryshkov" <lumag@kernel.org>, "Geert Uytterhoeven" <geert+renesas@glider.be>, "Geert
 Uytterhoeven" <geert@linux-m68k.org>, "Kieran Bingham" <kieran.bingham+renesas@ideasonboard.com>, "Laurent
 Pinchart" <laurent.pinchart+renesas@ideasonboard.com>, "Maarten Lankhorst" <maarten.lankhorst@linux.intel.com>, "Magnus
 Damm" <magnus.damm@gmail.com>, "Marek Vasut" <marek.vasut+renesas@mailbox.org>, "Maxime
 Ripard" <mripard@kernel.org>, "Simona Vetter" <simona@ffwll.ch>, "Thomas
 Zimmermann" <tzimmermann@suse.de>, "Tomi Valkeinen" <tomi.valkeinen+renesas@ideasonboard.com>, "Tomi
 Valkeinen" <tomi.valkeinen@ideasonboard.com>
Content-Transfer-Encoding: 7bit
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>

On Sun, 30 Nov 2025 13:11:19 +0100, Linus Walleij wrote:
> commit c9b1150a68d9362a0827609fc0dc1664c0d8bfe1
> "drm/atomic-helper: Re-order bridge chain pre-enable and post-disable"
> caused regressions in all bridges that e.g. send DSI commands in
> their .prepare() and .unprepare() callbacks when used with R-Car DU.
> 
> 
> [ ... ]

Reviewed-by: Maxime Ripard <mripard@kernel.org>

Thanks!
Maxime

