Return-Path: <linux-renesas-soc+bounces-19633-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 2E9BBB0F998
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 23 Jul 2025 19:51:22 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id D894A964741
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 23 Jul 2025 17:50:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1CAB2223DFD;
	Wed, 23 Jul 2025 17:51:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b="mbRHBk0M"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail.zeus03.de (zeus03.de [194.117.254.33])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 03F32C2E0
	for <linux-renesas-soc@vger.kernel.org>; Wed, 23 Jul 2025 17:50:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=194.117.254.33
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753293067; cv=none; b=a3ONaKg/jEnULaMF9ncLfR35rpnuHjN+ejByMJ1XfN+C/gYN7yha2EKAfjjQT96YccgkKHMVuieKb/i+OKlPm43VmNnaLJDWULWQXCU/+X3cUfPJ9yD+lyBrOeXu/Foth+63/bFGedP0wahd3X8+JevWmPqx9/CJAoGtJTa9QJ8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753293067; c=relaxed/simple;
	bh=k18BMbWeu5e9pC0GQrXJsr47MuK/O1qAagsvBSIOi1M=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=VHy4pohEMZJsw/NXJqd2KlpOjROK/6BcPHxp/f93XNAJ8RWwoFnEISMAIVEgj7Cm5IwVlKaO5MFXiJWF2odZ2NLJFrrSwNBDYdv178HyuSBN78r65Q7J+Ni8mv12gpjPSul4gvYT+rdgO2S8bgJ9xZ/HuMH9XBn77ZlCU+f1cVY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com; spf=pass smtp.mailfrom=sang-engineering.com; dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b=mbRHBk0M; arc=none smtp.client-ip=194.117.254.33
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sang-engineering.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	sang-engineering.com; h=date:from:to:cc:subject:message-id
	:references:mime-version:content-type:in-reply-to; s=k1; bh=Wyq4
	dQ0+Jpg9weDVfRPIFSVr09+pmF/YagTxo92Vv88=; b=mbRHBk0Mph+vvNXaGxZb
	Qc+GG/dTDm05unPxyz5EPvyip8l70WtnA+XnYg6GI5W4w4M6ySNe2gLXxyUyFTBk
	8IupTlsNZ4ZbokuXmV9pstYbKDWseYmksa4lHU+fnxoJgjRTFqCwPl/cJDqq2gb+
	gHP5IbZzd+BRoZPVTJVg6NQuPA/g/CqcOhpyoAaNsqV0AbpAXeHR2JWtJqLjCH8H
	LdNv15KATQ0gyzL/78OSLjmxt6ZGWPADYG2J3nv/b423Qo5+TGiUING0EFsZwwnb
	MpN2Svlqlhu5KkZ09M9GaNtOZ4IWyekWTidm2ZY5z4rUuS1W9CaqnjqBWgWec6dG
	9g==
Received: (qmail 1786777 invoked from network); 23 Jul 2025 19:50:50 +0200
Received: by mail.zeus03.de with UTF8SMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 23 Jul 2025 19:50:50 +0200
X-UD-Smtp-Session: l3s3148p1@VNV3WZw6Gt8ujnvr
Date: Wed, 23 Jul 2025 19:50:50 +0200
From: Wolfram Sang <wsa+renesas@sang-engineering.com>
To: Frank Li <Frank.li@nxp.com>
Cc: linux-renesas-soc@vger.kernel.org,
	Alexandre Belloni <alexandre.belloni@bootlin.com>,
	linux-i3c@lists.infradead.org
Subject: Re: [PATCH v4 2/4] i3c: Add more parameters for controllers to the
 header
Message-ID: <aIEg-qyGhb8B2Rep@shikoro>
References: <20250722190749.6264-1-wsa+renesas@sang-engineering.com>
 <20250722190749.6264-3-wsa+renesas@sang-engineering.com>
 <aIEAk3DF7Ez7NFwK@lizhi-Precision-Tower-5810>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aIEAk3DF7Ez7NFwK@lizhi-Precision-Tower-5810>


> > +/* TODO: Document a reason for this value */
> 
> Todo? Can you finish it?

Yes, but in a seperate patch series where the value is to be changed.

This needs additional testing because I want to update the other I3C
controller drivers as well.


