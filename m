Return-Path: <linux-renesas-soc+bounces-15823-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id DADA7A85560
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 11 Apr 2025 09:24:35 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id BA2D044523E
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 11 Apr 2025 07:24:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 92471284B40;
	Fri, 11 Apr 2025 07:24:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=8bytes.org header.i=@8bytes.org header.b="mpupdibO"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail.8bytes.org (mail.8bytes.org [85.214.250.239])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 87C4D1ADC69
	for <linux-renesas-soc@vger.kernel.org>; Fri, 11 Apr 2025 07:24:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=85.214.250.239
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744356272; cv=none; b=MxazF2mcpnbsoByfGtlMbdN81vCAXbkAGkagXpk+sioH49eiKScphNkPL101jEqBzEzvACmhZ4ZZbK5a+mp2jSwMCrAl/WFG1Jyd/lj1Woldk3JGYouSJnp9g78NFV3tBhaPyljhRE1Xh20hN2dBnz/k+ClkaNXB0eWPuIt6QzI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744356272; c=relaxed/simple;
	bh=BnMGd9mQ/j6myPqXH/oYhks+zqHnk4z0pX7RuLW/8PY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=LTQmlFkYztplOvb/yRCkwu8y+y1RUblpGVpXnjM3OfAQcc+NvTLFB2ZRH+dg1kLb4AFqlcYDtBmz78GU8Xy1d0I4alh6N6hJNZS55ays3qkr+WWpgbzEJ/9oq7sKCIz7YTh28HM0LNcUz/FvPwCcSREUMKTxQIw2cNv1LqnBBqQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=8bytes.org; spf=pass smtp.mailfrom=8bytes.org; dkim=pass (2048-bit key) header.d=8bytes.org header.i=@8bytes.org header.b=mpupdibO; arc=none smtp.client-ip=85.214.250.239
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=8bytes.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=8bytes.org
Received: from 8bytes.org (p4ffe03ae.dip0.t-ipconnect.de [79.254.3.174])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.8bytes.org (Postfix) with ESMTPSA id 669634685C;
	Fri, 11 Apr 2025 09:24:29 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=8bytes.org;
	s=default; t=1744356269;
	bh=BnMGd9mQ/j6myPqXH/oYhks+zqHnk4z0pX7RuLW/8PY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=mpupdibOtc2RFbignZRrn0x+Ex1YenivTyeIFIy87nVwibPZLZc946/P9db5obZpV
	 ffPt6Uei+y+Wmm0ef6K0CVOiOiNFgEFTSHlAwuvogrKTUNUKqDqskPYWANS1wy5xRz
	 M/QiOcuNFHgVCuy9+4SGqhmzO17i3OiPvDx0A4tPsX135Hm6mtMc7SKDG8Nqk9rLW6
	 DPBEKo0lSWuVsB4KYor25XES84CZS1ZYPFWYbVqRmutZfuIGnqRwHuxvcZK4MihmL3
	 0fT8CxOeVdiEgbnSG48wU4y37LngxXhM2KOj/MjgY/IcQjQnS2aRVvSBgaItSL0tt2
	 9C6uL8xSt15xg==
Date: Fri, 11 Apr 2025 09:24:28 +0200
From: Joerg Roedel <joro@8bytes.org>
To: Robin Murphy <robin.murphy@arm.com>
Cc: will@kernel.org, iommu@lists.linux.dev,
	linux-renesas-soc@vger.kernel.org,
	Geert Uytterhoeven <geert@linux-m68k.org>
Subject: Re: [PATCH] iommu/ipmmu-vmsa: Register in a sensible order
Message-ID: <Z_jDrH5ijeqCE03F@8bytes.org>
References: <53be6667544de65a15415b699e38a9a965692e45.1742481687.git.robin.murphy@arm.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <53be6667544de65a15415b699e38a9a965692e45.1742481687.git.robin.murphy@arm.com>

On Thu, Mar 20, 2025 at 02:41:27PM +0000, Robin Murphy wrote:
>  drivers/iommu/ipmmu-vmsa.c | 27 ++++++++++-----------------
>  1 file changed, 10 insertions(+), 17 deletions(-)

Applied, thanks.

