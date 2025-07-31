Return-Path: <linux-renesas-soc+bounces-19803-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 9BE8DB16E2B
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 31 Jul 2025 11:10:52 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 1FD331C20350
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 31 Jul 2025 09:11:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5E94F28FFF6;
	Thu, 31 Jul 2025 09:10:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b="YkYhnZfb"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail.zeus03.de (zeus03.de [194.117.254.33])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AE4AE291C3B
	for <linux-renesas-soc@vger.kernel.org>; Thu, 31 Jul 2025 09:10:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=194.117.254.33
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753953042; cv=none; b=illDUDHG18rweMzgmWwFAnSi1tU1qCRO/haNpVIEVIe2N1M5jUoHomKpa61Zj+bttBEhv60s53RdNisDqAp39EzmISu2U8SmtdkR5nRJWU/97wXaKTFx6gH55w+Tav+KR9GWO/PnPzGPxhFCrg2LCDJP19OBh4/PdFB6JxzJvUk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753953042; c=relaxed/simple;
	bh=w6wrvFbNgXh26KCBBTuu4MQuCAqfy6pnCtUxKlXRRUs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=FbfyvYCeG9BD915U65aLF1vT9VznirT45/vRcm2QwU2QJM8fK3D66IqSULUP/WtFwUdON+kS7j9goX6ACN87mNbspekZzvx+ErMh+Xn9tuPEc8bjTGWpI2uppilOhznAcQ3NkyvE0JO5Ux2xllO5qaMjWaDorshB8MpSfo7+Tus=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com; spf=pass smtp.mailfrom=sang-engineering.com; dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b=YkYhnZfb; arc=none smtp.client-ip=194.117.254.33
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sang-engineering.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	sang-engineering.com; h=date:from:to:cc:subject:message-id
	:references:mime-version:content-type:in-reply-to; s=k1; bh=fnJN
	7saYpK6umAv4VngGZWP2Enb/6tVAyWtGhECPeb4=; b=YkYhnZfbpd/6YPVvYBxE
	c1cZzeLS+1RbNZj2/YOyF6PLRFQESop7rXXCexSHNmy6Uq/37PjUHgaH6M3W3Ou5
	2Cl7xdmgLAqPcdOfR2YE+b6kEW8xJGrXtKueGi9v0xTTOlttBz2rbOSUMQPXOp8c
	VvlRmFpWsDFMSg3jmC1o4+J24Ejm5chrOob7n6GZEzXsFNYTKBRwZ3kHsCsal69t
	5PiQKOjX9j0rrHSZNeZBE7fRyY0N5/BjSVoi91q6O0JJxjtT088GGJY+L8Vi64hj
	gGoTI70BVdtodTaOBxQBAMJ8JfCuH0cZQSH2grZVcyj5SKVlriLvmUSYxSCz60B0
	AQ==
Received: (qmail 276493 invoked from network); 31 Jul 2025 11:10:35 +0200
Received: by mail.zeus03.de with UTF8SMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 31 Jul 2025 11:10:35 +0200
X-UD-Smtp-Session: l3s3148p1@I2aaAzY7lMsujnsl
Date: Thu, 31 Jul 2025 11:10:34 +0200
From: Wolfram Sang <wsa+renesas@sang-engineering.com>
To: Geert Uytterhoeven <geert+renesas@glider.be>
Cc: Magnus Damm <magnus.damm@gmail.com>, linux-renesas-soc@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH] ARM: shmobile: rcar-gen2: Use SZ_256K definition
Message-ID: <aIszCq_d-thU2o-8@ninjato>
References: <c54097a263eb3e451e5e223609a3630d4409dcdd.1753951039.git.geert+renesas@glider.be>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <c54097a263eb3e451e5e223609a3630d4409dcdd.1753951039.git.geert+renesas@glider.be>

On Thu, Jul 31, 2025 at 10:37:45AM +0200, Geert Uytterhoeven wrote:
> Use SZ_256K instead of calculating the same value.
> 
> Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>

Reviewed-by: Wolfram Sang <wsa+renesas@sang-engineering.com>


