Return-Path: <linux-renesas-soc+bounces-6492-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id CB31690EA47
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 19 Jun 2024 14:01:03 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id C8BA11C2111F
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 19 Jun 2024 12:01:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 205CB139579;
	Wed, 19 Jun 2024 12:01:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="ACCtxd5I"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5853DFC1F
	for <linux-renesas-soc@vger.kernel.org>; Wed, 19 Jun 2024 12:00:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718798461; cv=none; b=KvzOBSkq5vtbDwIXFLBYkSrVBbOnBVyEIsnADIZ7Er+FQw65cgN89PbCIBhcdwwI1VoPLzI0u7K+7MkzqyPqN+86csxRMtrLgiwtGkrjz1mdj+1JJovqczLbb2QIoWeP1cy1cLbRQM7jC/fVX7m/OJa4uFB+bvTSB3hVDeUh1uk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718798461; c=relaxed/simple;
	bh=mIIEMTS+j55gSxT/3xPA8m2Ohk6psQdZCnkNC4cn+S8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=nGto3/gfYJwQHvmfKkbhA6RlofvWaJMFZc8JpB3io6iMb7fB4RbPl3YWGUGj908xutIFGlklv05s6g8KHGO4mZTaqr7Fn2Xj9O4AU0vfrWFRZNcDAJ3itlm8fMgrbzDf1Cz7+Csl+7vtwgcfeFjYWjyxJIzk0J20dqIOcGzeD7A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=ACCtxd5I; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from ideasonboard.com (93-61-96-190.ip145.fastwebnet.it [93.61.96.190])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 85AB31011;
	Wed, 19 Jun 2024 14:00:38 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1718798438;
	bh=mIIEMTS+j55gSxT/3xPA8m2Ohk6psQdZCnkNC4cn+S8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=ACCtxd5Ifvv62tLmCCXtu6OaMhkT2Yu5ePfalni1ZS/qwWZuUTg2h2c5bdMuo03Tf
	 brPS3toWMQxqJEn6utlGxNgZ45biBq+67u9se+MEk6Bk8ldm7TGmRaCAQWETbboPZ3
	 9+2chyGZRsq3XkBKxrIhF4xxFDsBBxc1FVWQehvI=
Date: Wed, 19 Jun 2024 14:00:54 +0200
From: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Jacopo Mondi <jacopo.mondi@ideasonboard.com>, 
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>, Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>, 
	David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>, 
	"open list:DRM DRIVERS FOR RENESAS R-CAR" <dri-devel@lists.freedesktop.org>, 
	"open list:DRM DRIVERS FOR RENESAS R-CAR" <linux-renesas-soc@vger.kernel.org>
Subject: Re: [PATCH 3/4] drm: rcar-mipi-dsi: Add support for R8A779H0
Message-ID: <kcwneoju3vzz7rdlan3uklgrurk3ewgsk4qbzcqanx3r7ptjyx@hoszmps27r3s>
References: <20240619102219.138927-1-jacopo.mondi@ideasonboard.com>
 <20240619102219.138927-4-jacopo.mondi@ideasonboard.com>
 <dbad102e-7bbf-4316-ac9b-29799f428548@kernel.org>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <dbad102e-7bbf-4316-ac9b-29799f428548@kernel.org>

Hi Krzysztof

On Wed, Jun 19, 2024 at 01:07:24PM GMT, Krzysztof Kozlowski wrote:
> On 19/06/2024 12:22, Jacopo Mondi wrote:
> > Add support for R-Car R8A779H0 V4M which has the same characteristics
> > of the already supported R-Car V4H R8A779G0.
> >
> > Signed-off-by: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
> >
>
> Please run scripts/checkpatch.pl and fix reported warnings. Then please
> run `scripts/checkpatch.pl --strict` and (probably) fix more warnings.
> Some warnings can be ignored, especially from --strict run, but the code
> here looks like it needs a fix. Feel free to get in touch if the warning
> is not clear.
>

The only report I got was

WARNING: DT binding docs and includes should be a separate patch. See: Documentation/devicetree/bindings/submitting-patches.rst

which for such trivial addition seems overkill, and I presume the
patch will go through geert or drm anyway

The other thing I got

CHECK: Prefer using the BIT macro
#30: FILE: drivers/gpu/drm/renesas/rcar-du/rcar_mipi_dsi_regs.h:144:

makes sense, but the rest of the file already uses (1 << x) so I kept
it that way for consistency (honestly I would have changed all defines
to use BIT() but that would make upporting from BSP quite more
tedious).

Is there any other warning I have missed ?



> Bindings are separate patches.
>
> <form letter>
> Please use scripts/get_maintainers.pl to get a list of necessary people
> and lists to CC. It might happen, that command when run on an older
> kernel, gives you outdated entries. Therefore please be sure you base
> your patches on recent Linux kernel.
>
> Tools like b4 or scripts/get_maintainer.pl provide you proper list of
> people, so fix your workflow. Tools might also fail if you work on some
> ancient tree (don't, instead use mainline), work on fork of kernel
> (don't, instead use mainline) or you ignore some maintainers (really
> don't). Just use b4 and everything should be fine, although remember
> about `b4 prep --auto-to-cc` if you added new patches to the patchset.
>
> You missed at least devicetree list (maybe more), so this won't be
> tested by automated tooling. Performing review on untested code might be
> a waste of time, thus I will skip this patch entirely till you follow
> the process allowing the patch to be tested.
>
> Please kindly resend and include all necessary To/Cc entries.
> </form letter>
>
> Best regards,
> Krzysztof
>

