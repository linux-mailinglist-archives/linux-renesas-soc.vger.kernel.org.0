Return-Path: <linux-renesas-soc+bounces-25512-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 7D6C9C9D905
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 03 Dec 2025 03:18:44 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 1EC653A6C5F
	for <lists+linux-renesas-soc@lfdr.de>; Wed,  3 Dec 2025 02:18:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C7C521FDA92;
	Wed,  3 Dec 2025 02:18:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="vRreKgKG"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 51DED2BCF5
	for <linux-renesas-soc@vger.kernel.org>; Wed,  3 Dec 2025 02:18:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764728320; cv=none; b=F9LKI3QwnKfuPo5J2pIQVggd0oQbKJvh0I33gw4spVx4EFaOTBRIxuQMn12iJ6ZrFRlkjbMzcO/I/hs/pl+Ebc/EA8gfXIGBe1klC4RM1X06RF2kHwtVelexE801PXpFk2/Fjr4d+ng2tBXneRi3MDJYeUSM+zbEmRKW3UNlnHE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764728320; c=relaxed/simple;
	bh=nbhD/gJt0xzvyf/ivwEZpU1nTzxjFkl17xY/nkr6DBw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=mME97bIrZNvFkktgSsfxL0SwPUBk186NcGmkleKjbqzWUV1ioxeKE5wmTwsr8h589E8L7UFtxC0qnCylvJiPB4vIL0iDA3AoJs2MiHpyD97OD6eJaPE8JQWyMuc9z1QldgP+gLhoajDPRKYlGgmQTL2kXuPI4NSsyuLYcfTQUQ8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=vRreKgKG; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from pendragon.ideasonboard.com (p100198.f.east.v6connect.net [221.113.100.198])
	by perceval.ideasonboard.com (Postfix) with UTF8SMTPSA id 3945AB5;
	Wed,  3 Dec 2025 03:16:18 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1764728180;
	bh=nbhD/gJt0xzvyf/ivwEZpU1nTzxjFkl17xY/nkr6DBw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=vRreKgKG0r/og+VBnXUtIOVo7Ngfv+ogJAA6A4KKGekyMhJ3Bb0NBXe8MNrVArOew
	 ETqhz+XqfIcBORSeEdjGgkVM7zHzfvfzKg4sbCy8b147SO4XSO79Oq04dcOj6pr7+e
	 GSBx2GBCZdTe8ab/kzhIOOvIdS3RSgJYQsrxsT0k=
Date: Wed, 3 Dec 2025 11:17:38 +0900
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Linus Walleij <linusw@kernel.org>
Cc: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>,
	Marek Vasut <marek.vasut+renesas@mailbox.org>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
	Tomi Valkeinen <tomi.valkeinen+renesas@ideasonboard.com>,
	Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Magnus Damm <magnus.damm@gmail.com>,
	Aradhya Bhatia <a-bhatia1@ti.com>,
	Dmitry Baryshkov <lumag@kernel.org>,
	dri-devel@lists.freedesktop.org, linux-renesas-soc@vger.kernel.org,
	Geert Uytterhoeven <geert@linux-m68k.org>
Subject: Re: [PATCH v5 0/3] drm/atomic-helpers: Fix MCDE/R-Car DU regressions
Message-ID: <20251203021738.GI8219@pendragon.ideasonboard.com>
References: <20251130-mcde-drm-regression-thirdfix-v5-0-aed71a32981d@kernel.org>
 <20251202063403.GA18267@pendragon.ideasonboard.com>
 <CAD++jLn5NmPubNm_hv9xCSvbY9pAKj_GLFWC1Hq5YP6ZHP=UZg@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAD++jLn5NmPubNm_hv9xCSvbY9pAKj_GLFWC1Hq5YP6ZHP=UZg@mail.gmail.com>

On Tue, Dec 02, 2025 at 09:35:26PM +0100, Linus Walleij wrote:
> On Tue, Dec 2, 2025 at 7:34 AM Laurent Pinchart wrote:
> > We now have a third platform broken by
> > c9b1150a68d9362a0827609fc0dc1664c0d8bfe1, see [1]. I think this calls
> > for a revert, to give us the time to implement a correct solution.
> >
> > [1] https://lore.kernel.org/r/CAAMcf8Di8sc_XVZAnzQ9sUiUf-Ayvg2yjhx2dWmvvCnfF3pBRA@mail.gmail.com
> 
> This is a mess.
> 
> But OK let's see if we can deal with the mess.
> 
> I will make an RFT patch for Rockchip as well and resend at the
> tail of the patch series if we want to try to fix also that one.

What bothers me here is that we're rushing to fix three different
platforms, with others possibly broken as well, in a way that nobody
really likes. That's why I think a revert would be better, to give us
the time to then design a proper solution.

-- 
Regards,

Laurent Pinchart

