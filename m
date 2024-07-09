Return-Path: <linux-renesas-soc+bounces-7195-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 0584692B433
	for <lists+linux-renesas-soc@lfdr.de>; Tue,  9 Jul 2024 11:42:41 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id B333E286C7D
	for <lists+linux-renesas-soc@lfdr.de>; Tue,  9 Jul 2024 09:42:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6B63015539D;
	Tue,  9 Jul 2024 09:41:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Ws8mg6kp"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3D169155352;
	Tue,  9 Jul 2024 09:41:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720518095; cv=none; b=Mgc3OSVq3lq4hmkCmnpws8iqKxTn5/CIpMhO4hjk3hYAeN7POipfBAxtGHWDHOPvySr6Bcfezgos4yL0LqNouWMuaCswy5VLkTbxnBvjVovvI4lo9GRHOWAk5SR6mhcKS7u81/vQ7XsYcEtphxFMxvEWBwQez8ZJqLFWdFxBawM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720518095; c=relaxed/simple;
	bh=IgKccEiWHfXCqWfJrajUASFmC2wqLDgF1AEJXeMPXDM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=kUeOgpLQuBk/oz5pys8unxJzOhsINXfuda4wD6vJ+816H9e0L6LuEt8JDIpurp+zx+/cE5W2k3XXov0A25lF1L1m61O0oOF0t0tvdAiD3rO343xH5pGg7qzR4hXsPVke+cIt7ew4fVa36WDEARWSiu3pDpG4YRLIh+tKL++pC8Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Ws8mg6kp; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B89A9C4AF0A;
	Tue,  9 Jul 2024 09:41:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1720518095;
	bh=IgKccEiWHfXCqWfJrajUASFmC2wqLDgF1AEJXeMPXDM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Ws8mg6kpiG8Yf1zwejbMrgP7KCHgMWQhQRH23eqRPtIsG2Sb6naYzJkV+9s729g6U
	 V0zeBHRkL6rBX7+yvV/EtNhYo6GVCyfaB9CmNMOahCtE6jlbQb8SJxSvX0EbDxQWK5
	 eThwV1nhgWDcestncquDwL4tZoVgrfp893Gx9zNm8e/o5dJzLOgOLTyBLwSyXH7vRP
	 IIKWaeaxszMVg8F3hapHMmM2nUCi1Pd3AXYaymqPDKecATtY9xT04QjlsYEovnTvzB
	 x33zjcEddlFcjZeSy5al6W5ZMz5ThQgHBiGy5teNLskQnCgOOaaK7WsOwWJDWvau6Z
	 Tc1NkP5Diog2g==
Date: Tue, 9 Jul 2024 10:41:31 +0100
From: Lee Jones <lee@kernel.org>
To: linux-renesas-soc@vger.kernel.org,
	Wolfram Sang <wsa+renesas@sang-engineering.com>
Cc: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	linux-mmc@vger.kernel.org, linux-sh@vger.kernel.org
Subject: Re: [PATCH v2 0/6] mfd: tmio: simplify header and move to
 platform_data
Message-ID: <20240709094131.GE501857@google.com>
References: <20240213220221.2380-8-wsa+renesas@sang-engineering.com>
 <172051805084.1217090.8146208079593611090.b4-ty@kernel.org>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <172051805084.1217090.8146208079593611090.b4-ty@kernel.org>

On Tue, 09 Jul 2024, Lee Jones wrote:

> On Tue, 13 Feb 2024 23:02:19 +0100, Wolfram Sang wrote:
> > Changes since v1:
> > 
> > * rebased to rc4
> > * collected all needed acks (Thanks!)
> > * capitalized first letter in commit subject
> > 
> > The MFD parts of the TMIO have been removed by Arnd, so that only the
> > SD/MMC related functionality is left. Remove the outdated remains in the
> > public header file and then move it to platform_data as the data is now
> > specific for the SD/MMC part.
> > 
> > [...]
> 
> Applied, thanks!
> 
> [1/6] mfd: tmio: Remove obsolete platform_data
>       commit: ef6dfcbcbbf7d9a414feb44aa093d2d8592a2e20
> [2/6] mfd: tmio: Remove obsolete io accessors
>       commit: 6bec678b9872271ce2e0879c360ad7a1a524c7fa
> [3/6] mmc: tmio/sdhi: Fix includes
>       commit: 4377aef83d0db25efc928a633ee80698b8520c8e
> [4/6] mfd: tmio: Update include files
>       commit: d411ccbe103d665a31861987e2f1b36944ab63f2
> [5/6] mfd: tmio: Sanitize comments
>       commit: 763135b819ad3e3e0301b66094d50923e64092a7
> [6/6] mfd: tmio: Move header to platform_data
>       commit: 70b46487b1558eb25ea6e533c905131b10596dc0

Applied and pushed - should be in tomorrow's -next.

-- 
Lee Jones [李琼斯]

