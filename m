Return-Path: <linux-renesas-soc+bounces-18705-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 9035AAE7E51
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 25 Jun 2025 12:01:21 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 6DA931882BC3
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 25 Jun 2025 10:01:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 22A2E28ECEF;
	Wed, 25 Jun 2025 10:00:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b="I7O9PAkI"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail.zeus03.de (zeus03.de [194.117.254.33])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0005D20DD40
	for <linux-renesas-soc@vger.kernel.org>; Wed, 25 Jun 2025 10:00:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=194.117.254.33
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750845625; cv=none; b=UgQsr8qH3jZus3gGaA9wpZew49Sk5K4uqown3ErmAIcMk0tR23pEg9YD7GW1Mac+L0v5XV5UYi/e9plUCID1HwSNd50wQsfWj5tPQ3UGvOwLX5C1kAxVjCOXZJ9aR5TMi7UaadzC9pMYk1ZF0tTI0xS2NpLP3JmdT3Cl/WRo7S8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750845625; c=relaxed/simple;
	bh=BmZQJ9CzG60Pi2Rqd2i3dgVTDCS+zmBPHAGPadRN0EM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=TCQ3m37Z2azcOyVJGb9GrYoUiL0zNKVFdcdBQiEUe4EhWSEFhCWjnoy8VWHGTFjgEjM3BGLLkHpB8haIUf0SyGRSeLBF8Hn2z33fbsprAoIwULVeiiF1QVY8CGm2ufU1fisI/MNQ37sGyGLaIgDusO76Y9WFN+qSFkCJtXBp45k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com; spf=pass smtp.mailfrom=sang-engineering.com; dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b=I7O9PAkI; arc=none smtp.client-ip=194.117.254.33
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sang-engineering.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	sang-engineering.com; h=date:from:to:cc:subject:message-id
	:references:mime-version:content-type:in-reply-to; s=k1; bh=PiEm
	MoOYAz7QZzNJFDzzDAKfovCal4h2Wgp/iO94uSo=; b=I7O9PAkIsHbtozkdMdCS
	2Bei1k471pUlS+QJwH7E5Sapl8oqS8LrixSS6PB7E0q0xep+u3lmhE1BS++7tOF4
	3wRZx8Tu5Csg18Wx6EYj2hgIAa9cUDDD3ByxibQx9np76AbF4lsUwu9dl9p4tYsP
	77zDkUAEJY7mMH2V90G2ck+prpjpUQwTuQEhlT46myVg9QzuJmm4uI8lWmp4cCNQ
	quXysGRU/oBSmGEbtZ878FwZLpNIRDp/CMQTt/UTps0jPTChMPUt3/N+H7Z4zyz+
	Pp0cJeQTUxcT72ZOgNfNoZCg1tY8pkkd0h+ETRZnHdJaONPdghf0zJnAeLvueWBL
	jg==
Received: (qmail 600652 invoked from network); 25 Jun 2025 12:00:20 +0200
Received: by mail.zeus03.de with UTF8SMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 25 Jun 2025 12:00:20 +0200
X-UD-Smtp-Session: l3s3148p1@KvU5g2I4CLVtKDAs
Date: Wed, 25 Jun 2025 12:00:19 +0200
From: Wolfram Sang <wsa+renesas@sang-engineering.com>
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: linux-renesas-soc@vger.kernel.org,
	Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>,
	Alexandre Belloni <alexandre.belloni@bootlin.com>,
	Kees Cook <kees@kernel.org>,
	"Gustavo A. R. Silva" <gustavoars@kernel.org>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Magnus Damm <magnus.damm@gmail.com>, linux-i3c@lists.infradead.org,
	linux-hardening@vger.kernel.org
Subject: Re: [PATCH RFC 4/7] i3c: add driver for Renesas I3C IP
Message-ID: <aFvIs2KlyrMztLsf@shikoro>
References: <20250611093934.4208-1-wsa+renesas@sang-engineering.com>
 <20250611093934.4208-5-wsa+renesas@sang-engineering.com>
 <aEmws+OtHirrUPUo@lizhi-Precision-Tower-5810>
 <aErqY0QWMRdC7Pvg@shikoro>
 <aEsDj5Vcb4zFJFlo@lizhi-Precision-Tower-5810>
 <aEvyfM42WTKENbFO@shikoro>
 <CAMuHMdXW_4gHSTo0roNUpBrq2gLVBK=6zY_=rhh8OP85KJdqTg@mail.gmail.com>
 <aEwjU-uq4XsNzrOO@shikoro>
 <CAMuHMdWOxBfwwXUpYpmB30Zpqdwgwa2d=hXQyYVsoAD0bN4seQ@mail.gmail.com>
 <aFFQDlFJXFRYgNAN@shikoro>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aFFQDlFJXFRYgNAN@shikoro>


> > Thanks, much better!
> 
> Sadly, my mails still get the "suspicious header" warning :(

Sigh, seems like infradead was not happy with me signing my emails. I
removed it for this server.


