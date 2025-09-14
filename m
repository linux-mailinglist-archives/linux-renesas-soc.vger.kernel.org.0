Return-Path: <linux-renesas-soc+bounces-21848-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 2C3E2B56C50
	for <lists+linux-renesas-soc@lfdr.de>; Sun, 14 Sep 2025 22:54:24 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id DA8F03BF4F1
	for <lists+linux-renesas-soc@lfdr.de>; Sun, 14 Sep 2025 20:54:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 09B622E1EF5;
	Sun, 14 Sep 2025 20:54:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="xeGUVM+S"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 27AC91F3BA9
	for <linux-renesas-soc@vger.kernel.org>; Sun, 14 Sep 2025 20:54:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.246.84.56
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757883260; cv=none; b=NGR4b0miHbXFnYZfxBhyBoRdDK3FgHSmBdAPqcZjzbZqmrMSfeQZUANxqoeQ8M2VKx6lAoWqvbBppac8hBqYrnGFXz3CjuMfqzKYKFEoMh5eF99gCyYN8m1GZUx9aTLo+YzQP03Hu3PhtUbci9EjUFxrcTLEM4HTnNmkGHZODFY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757883260; c=relaxed/simple;
	bh=PpxiVB9+pQ+MkaHlLZheoPYARB8iBtYoXqTp/QyqMEg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=cSNhVCXNQ7xjsjLNNpCZ5odV9rlcoE5OM3J9BgjmT52RXAJTm/O4sAcH0AOR0yU9tpnIgAOTal4hKpEWuD154zr9UntoAZOz8TMPAlEJiAcrRNEabaVG1s0atVPqyekjiImgWzZnByK3NWWIapnyJMt8B5ZuucJ+AQ5gQsBvwDc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=xeGUVM+S; arc=none smtp.client-ip=185.246.84.56
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id BC82E1A0DE4;
	Sun, 14 Sep 2025 20:54:17 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 8EAB86063F;
	Sun, 14 Sep 2025 20:54:17 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id A654E102F2A7F;
	Sun, 14 Sep 2025 22:54:13 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1757883257; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 in-reply-to:references; bh=ihIw/PXqVfsvt59L0VFImOtf51q1FRfV6w8XRlZ4Ft8=;
	b=xeGUVM+Sj+9Dgs8CiVWWe3q2s0jgqBLuGGBsyP3AyAo0ig4Ypp/oJ+UpbLgG8JqGP9+GgB
	j40GluxagZ+8EUod311DSMW2QXsbWOhTMJnDgwGythulFCYxB8ncCL1iRbFEIRCs3qWxFE
	Kfz0jcleSbOPMTGh8yYy0vPgpNaIjYvzP+IsqvtpC/5P8E+nax4rmuMzWSUvqyZw8rsmIf
	V8zEPzHJwS5yymnAXASoC9NFVyWe0vQhkWMCNcMbr7cihdieqWOpaTMGQQjO8pa6galEEL
	xSLOZOiQUqdz5Tv8dCGB4cd5oCvG25FJ7VIdQ6CMSvkexN5JEaHgI9L65IyGvg==
Date: Sun, 14 Sep 2025 22:54:13 +0200
From: Alexandre Belloni <alexandre.belloni@bootlin.com>
To: linux-renesas-soc@vger.kernel.org,
	Wolfram Sang <wsa+renesas@sang-engineering.com>
Cc: Dan Carpenter <dan.carpenter@linaro.org>,
	Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>,
	Frank Li <Frank.Li@nxp.com>, linux-i3c@lists.infradead.org
Subject: Re: [PATCH] i3c: renesas: Simplify return statement in
 'renesas_i3c_daa'
Message-ID: <175788312845.382502.12699337913885146267.b4-ty@bootlin.com>
References: <20250803211256.18513-2-wsa+renesas@sang-engineering.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250803211256.18513-2-wsa+renesas@sang-engineering.com>
X-Last-TLS-Session-Version: TLSv1.3

On Sun, 03 Aug 2025 23:12:57 +0200, Wolfram Sang wrote:
> There was already a bail out for 'ret < 0', so we can always return
> success at the end of the function.
> 
> 

Applied, thanks!

[1/1] i3c: renesas: Simplify return statement in 'renesas_i3c_daa'
      https://git.kernel.org/i3c/c/b22971d9629f

Best regards,

-- 
Alexandre Belloni, co-owner and COO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

