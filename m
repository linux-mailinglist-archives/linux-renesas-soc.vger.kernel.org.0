Return-Path: <linux-renesas-soc+bounces-11053-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 5D58A9E82F9
	for <lists+linux-renesas-soc@lfdr.de>; Sun,  8 Dec 2024 02:23:30 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id DABA71652E3
	for <lists+linux-renesas-soc@lfdr.de>; Sun,  8 Dec 2024 01:23:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7F585749C;
	Sun,  8 Dec 2024 01:23:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="IBxHcAvM"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4E8FBBA4B;
	Sun,  8 Dec 2024 01:23:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733621008; cv=none; b=KYt6FgXmT9QYFsi0jGXRsBnMLcKKHed3It58M/1mAXOqE0rvyHvT3Rzf5uMTSgegQR5fbVUTXYuqDIq7OupOrO+Puam9yoFkd7gTz86ZfxNXYthazB233zvUQ/N8akRPHG5Y7cD9kxVOuOxTWSly20FV4yzxx0BVrBH14ffvDl0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733621008; c=relaxed/simple;
	bh=PzVhgMkLC9c89yGUCYGUzOqQa2wTdfZYLKCsIPcVrDo=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=o6UMrvpLPuK9iE3tdxD0qjgZUzV8QaxE7DH5xnszfhKlKqDz5w0OWU6jY5LqZrejMH5jwDHk4Ds9+MogOUnhbP8uHMltNWVoHS8E5pPl4EtUSSAgFYgkuOtDYHqdicE9Icf6OWHqEMlP4JfaNEYaYzEWOLzcEpuLeyWlYow35oQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=IBxHcAvM; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B2266C4CECD;
	Sun,  8 Dec 2024 01:23:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1733621006;
	bh=PzVhgMkLC9c89yGUCYGUzOqQa2wTdfZYLKCsIPcVrDo=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=IBxHcAvMTouCVQfaXaf6jz6KyOj3nAiODV/fty1jhdZIybhFv8x3XEM0OUGpUPEsM
	 Jxlwb0J/MqmfG6WbYZYjb9XukvFS/kGf9z9H+vUYVEPQTTGHuvEFB5FX5Vf+KFleGU
	 tIoJ4PWjo0jbKPmn7EEaNeBSNO62VaAAi4B3eYfKaumoDH4MdruMtbyXDSPZlbcy5j
	 79lUJOVdLg4LTJqgBjVFZ/HDHuyiKsJs/SnoWDTRdmIrGtRpKzkx6IcL2Lm7xqmIhA
	 Sfd/a6cQnSK7lkgfw4MZ+2p/pFrduZ66D5WI6VHz8j1bJWagQjiaMOCrozuUOyXCDa
	 dcRN3+mxNqOtQ==
Date: Sat, 7 Dec 2024 17:23:24 -0800
From: Jakub Kicinski <kuba@kernel.org>
To: Nikita Yushchenko <nikita.yoush@cogentembedded.com>
Cc: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>, Andrew Lunn
 <andrew@lunn.ch>, "David S. Miller" <davem@davemloft.net>, Eric Dumazet
 <edumazet@google.com>, Paolo Abeni <pabeni@redhat.com>, Geert Uytterhoeven
 <geert+renesas@glider.be>, netdev@vger.kernel.org,
 linux-renesas-soc@vger.kernel.org, linux-kernel@vger.kernel.org, Michael
 Dege <michael.dege@renesas.com>, Christian Mardmoeller
 <christian.mardmoeller@renesas.com>, Dennis Ostermann
 <dennis.ostermann@renesas.com>
Subject: Re: [PATCH net v2 2/4] net: renesas: rswitch: fix race window
 between tx start and complete
Message-ID: <20241207172324.6039dae4@kernel.org>
In-Reply-To: <b39e495d-dd23-4965-bc1c-b30db81be0f8@cogentembedded.com>
References: <20241206190015.4194153-1-nikita.yoush@cogentembedded.com>
	<20241206190015.4194153-3-nikita.yoush@cogentembedded.com>
	<b39e495d-dd23-4965-bc1c-b30db81be0f8@cogentembedded.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Sat, 7 Dec 2024 00:18:11 +0500 Nikita Yushchenko wrote:
> > 3590918b5d07 ("net: ethernet: renesas: Add support for "Ethernet Switch"")  
> 
> Sorry this patch sent out broken, I've reposted it fixed.

You need to repost the whole thing, sorry. Patchwork is not clever
enough to understand patch replacement.

Quoting documentation:

  Partial resends
  ~~~~~~~~~~~~~~~
  
  Please always resend the entire patch series and make sure you do number your
  patches such that it is clear this is the latest and greatest set of patches
  that can be applied. Do not try to resend just the patches which changed.
  
See: https://www.kernel.org/doc/html/next/process/maintainer-netdev.html#partial-resends
-- 
pw-bot: cr

