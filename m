Return-Path: <linux-renesas-soc+bounces-26023-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 5DDDBCD748E
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 22 Dec 2025 23:26:04 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id A0D1E300284F
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 22 Dec 2025 22:26:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3E663349AEB;
	Mon, 22 Dec 2025 22:26:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lwn.net header.i=@lwn.net header.b="hKQ1uxiv"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from ms.lwn.net (ms.lwn.net [45.79.88.28])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D884A306B05;
	Mon, 22 Dec 2025 22:25:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=45.79.88.28
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766442360; cv=none; b=CZkk2j+wSrmz0OLv8b4BtGkiv01rts0cnN/KzYamVfnO4tGkJh7EpVsgrlYuAGB6+fpDoZsv4jjX0+ng9zUdqOKWEXQlPj+5PoAM53pbo4lIg4nXvsMtXWlBvGj3dL6kmgB9JtmM6XJ/UZ6hWZPu24DVdmZgN/gqJANheiU5HH0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766442360; c=relaxed/simple;
	bh=I6AwnvjgxNSimNSzo9NNcymGlkxWweetadZ8KY9FQko=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=n47/9olO2SYZ/92vSNsYkHK+YlGxBk9WJxFqdFnYqVTaesvaUvz5eHOO+1SRw4b7/sV7WdWKBmh+JclTIE4JFwqTbHQF7VockGmL9W7rWhfx48SLl5AIw16O87QNYr+og+dRLsNtHV78GyboyIa0DVs25RKWwsonjraAJ/nHHlc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lwn.net; spf=pass smtp.mailfrom=lwn.net; dkim=pass (2048-bit key) header.d=lwn.net header.i=@lwn.net header.b=hKQ1uxiv; arc=none smtp.client-ip=45.79.88.28
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lwn.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lwn.net
DKIM-Filter: OpenDKIM Filter v2.11.0 ms.lwn.net 1BCBE4040B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=lwn.net; s=20201203;
	t=1766442358; bh=wkle73ThyqsQGArsm85eb59XbTAqhgZpSAwasHttKHE=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=hKQ1uxivBP0oKqo+3w7nT2Gt2Yy9KMUGPOF2AWNDjJzdSG3p0fg3IhTYZY7eHyp9R
	 pfuTXiEgDCHPMnRBzV/yBR6V0EX28/ymsj9NW4V3cH5ziO7kk6ibqAoDHPlZ/fDCkh
	 jfMVSAhbVwyLOlKzo8iH96Hqg0oWnDiKALZAxIyycD15DJefVOfGmKOjuPH5hMXH1k
	 aVPhM6iRgQNtBEvUby3EtVHUNuBdkMYSqNq6aPaECKcGQNvuZp82HNd8Hrf6nFEYLF
	 FeM4/o+66kaXcLpRZS1ijuAOqPIv3bMp4j99EXdIONT13LlEVwxcqtpFMyEDOscNpa
	 CIgAQ65qNhf8g==
Received: from localhost (unknown [IPv6:2601:280:4600:27b::1fe])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by ms.lwn.net (Postfix) with ESMTPSA id 1BCBE4040B;
	Mon, 22 Dec 2025 22:25:58 +0000 (UTC)
From: Jonathan Corbet <corbet@lwn.net>
To: Geert Uytterhoeven <geert+renesas@glider.be>, Thierry Reding
 <treding@nvidia.com>, Jassi Brar <jaswinder.singh@linaro.org>
Cc: linux-doc@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
 linux-kernel@vger.kernel.org, Geert Uytterhoeven <geert+renesas@glider.be>
Subject: Re: [PATCH] Documentation: mailbox: mbox_chan_ops.flush() is optional
In-Reply-To: <6a50a5d4f0d0da26e5cccf348550879e53792e6e.1764861174.git.geert+renesas@glider.be>
References: <6a50a5d4f0d0da26e5cccf348550879e53792e6e.1764861174.git.geert+renesas@glider.be>
Date: Mon, 22 Dec 2025 15:25:57 -0700
Message-ID: <87cy46ywzu.fsf@trenco.lwn.net>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain

Geert Uytterhoeven <geert+renesas@glider.be> writes:

> When the optional .flush() method was added to the mbox_chan structure,
> the documentation was not updated.
>
> Fixes: a8803d7421cc2be2 ("mailbox: Support blocking transfers in atomic context")
> Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
> ---
>  Documentation/driver-api/mailbox.rst | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/Documentation/driver-api/mailbox.rst b/Documentation/driver-api/mailbox.rst
> index 0ed95009cc307a41..463dd032b96cd45d 100644
> --- a/Documentation/driver-api/mailbox.rst
> +++ b/Documentation/driver-api/mailbox.rst
> @@ -27,7 +27,7 @@ Controller Driver (See include/linux/mailbox_controller.h)
>  
>  
>  Allocate mbox_controller and the array of mbox_chan.
> -Populate mbox_chan_ops, except peek_data() all are mandatory.
> +Populate mbox_chan_ops, except flush() and peek_data() all are mandatory.
>  The controller driver might know a message has been consumed

Applied, thanks.

jon

