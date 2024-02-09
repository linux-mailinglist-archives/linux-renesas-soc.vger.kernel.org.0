Return-Path: <linux-renesas-soc+bounces-2532-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 257C984F3BA
	for <lists+linux-renesas-soc@lfdr.de>; Fri,  9 Feb 2024 11:47:58 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id F0977B222D2
	for <lists+linux-renesas-soc@lfdr.de>; Fri,  9 Feb 2024 10:47:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B63B81D549;
	Fri,  9 Feb 2024 10:47:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=8bytes.org header.i=@8bytes.org header.b="I+aUDDak"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail.8bytes.org (mail.8bytes.org [85.214.250.239])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C802920329
	for <linux-renesas-soc@vger.kernel.org>; Fri,  9 Feb 2024 10:47:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=85.214.250.239
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1707475670; cv=none; b=fxynRoQ/AVXpq21VwJo1zPSHCD5lv8KjaGccYl7vCScj+BnV2S6Q0zN3BMht2ejqdjUBt/WCJUCPvyUVfAJJYG6C6CvvmtK3/jEddyoJsgFAKONPeKShnUznUbdITAXFMoWKkPSFP1arWoUiFH2RWMbrLljq9NPsWBkjC2Bi6o4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1707475670; c=relaxed/simple;
	bh=RiqvlWMgXFV2WZSRyg2nzQKu0wiEYxhXKxixN218Syo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=T0u8l2l5Xl+27cYzuQmfbZ2BjHHYble+mAHmagRmcM+/T7oBgbpkB8fSNC7c7wC65xoMeeKBA/d42qXLXtdqDXQ1Rxo0riIWKNaYX3YjgS8JHZFyV+TOYrwnx2cQ8WvKOdDGToZTTZ7rzYs3EZYd+BsNkZLXern+qCDV16kiO4Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=8bytes.org; spf=pass smtp.mailfrom=8bytes.org; dkim=pass (2048-bit key) header.d=8bytes.org header.i=@8bytes.org header.b=I+aUDDak; arc=none smtp.client-ip=85.214.250.239
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=8bytes.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=8bytes.org
Received: from 8bytes.org (p4ffe0c3c.dip0.t-ipconnect.de [79.254.12.60])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.8bytes.org (Postfix) with ESMTPSA id 02CCA1C1D36;
	Fri,  9 Feb 2024 11:47:48 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=8bytes.org;
	s=default; t=1707475668;
	bh=RiqvlWMgXFV2WZSRyg2nzQKu0wiEYxhXKxixN218Syo=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=I+aUDDakLCc8FQ3f0YdDV2kjHHVATj/M1jhcy/hRWxBcZXPfA4VPf18CKQLzbenJC
	 mDz3FyWEmVBdcoNHwG0/coN+2xOzFKVz4FjrMFJ599AGuSOSaA4HYAno2yJWxrSMjE
	 tAV+6IUcoeALmPkFwXFKx/eURIdzDUJpJ+aNSJTDvrpdf9GbLmOH+jSlPJNxIOxhHY
	 jpVrqrVp7Yd563oUc8i6jpSDH0NlZiQCJ/qoP5XsARxvTOAUGabCfdcPsWLhSLf7C6
	 cdul6J6sbLw/E+2U3NRBQiV16ViSVLxZrFtUEO2qbF15dqQI47mT9klbVndGmHZND4
	 3+llJP1JuN7zg==
Date: Fri, 9 Feb 2024 11:47:46 +0100
From: Joerg Roedel <joro@8bytes.org>
To: Robin Murphy <robin.murphy@arm.com>
Cc: will@kernel.org, iommu@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org, geert+renesas@glider.be,
	yoshihiro.shimoda.uh@renesas.com, linux-renesas-soc@vger.kernel.org
Subject: Re: [PATCH] iommu/ipmmu-vmsa: Minor cleanups
Message-ID: <ZcYC0g-bPsOITZ07@8bytes.org>
References: <791877b0d310dc2ab7dc616d2786ab24252b9b8e.1707151207.git.robin.murphy@arm.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <791877b0d310dc2ab7dc616d2786ab24252b9b8e.1707151207.git.robin.murphy@arm.com>

On Mon, Feb 05, 2024 at 04:43:27PM +0000, Robin Murphy wrote:
> Remove the of_match_ptr() which was supposed to have gone long ago, but
> managed to got lost in a fix-squashing mishap. On a similar theme, we
> may as well also modernise the PM ops to get rid of the clunky #ifdefs,
> and modernise the resource mapping to keep the checkpatch brigade happy.
> 
> Link: https://lore.kernel.org/linux-iommu/Yxni3d6CdI3FZ5D+@8bytes.org/
> Signed-off-by: Robin Murphy <robin.murphy@arm.com>
> ---
>  drivers/iommu/ipmmu-vmsa.c | 15 ++++-----------
>  1 file changed, 4 insertions(+), 11 deletions(-)

Applied, thanks.

