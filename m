Return-Path: <linux-renesas-soc+bounces-4005-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 862D888A5FB
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 25 Mar 2024 16:14:01 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id B7080B3F646
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 25 Mar 2024 14:10:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 47B60156C4E;
	Mon, 25 Mar 2024 10:44:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="sU1IJFZp"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6E59614431F;
	Mon, 25 Mar 2024 10:30:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1711362650; cv=none; b=H0gHtvt/o6hK9O34NthvHIOFUYx9iaSsMMcxvgydkJIGtK+BWv1pGERrzh/rrD8R8g6BbIYFvH+YeWaw2v/BsJGAThwmjro2BREiBHRNQXKEskSLuGen5FS3WzyO3ImU4l5ZkpCnPiI/lA+pqxyyZK9I5UEmJ/FqSrAPBsA8o/I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1711362650; c=relaxed/simple;
	bh=V2EmO3yALaXp1ixBOZlVu+Nxw+U3wZvSnyfuWC5fxbA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=PjJIUxP5nafiKSweQAyU761/gGNNGZRJ2TFsfQrlUk3LG/bq8AlHZMiSh1hBdua1Xe2Wu7EZEUHNC3NyBGdLINBkvNaMUEOPgO4XfQfEj+IZRWntbrYBYfzbpMzlpZnZQH04DXYZvjdy/SHND/uXvglM4QrAeaecRSaGyZW4ZCc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=sU1IJFZp; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 39364C433F1;
	Mon, 25 Mar 2024 10:30:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1711362649;
	bh=V2EmO3yALaXp1ixBOZlVu+Nxw+U3wZvSnyfuWC5fxbA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=sU1IJFZpS9qBG5EXRLKXDCkc7NUR+zGeIX0zySQuemg+XRBhibXuJrxSh2DI8UFEn
	 p579wS3bekOro8NgjoT4UWF4/wUXDdDb/vQ2c1uF4XOpuZVrAZ2Kk8Qnq9KKlYqQTL
	 Z2oPT11K+ePz7dYyUocQHawNoqSilwrw79HgOtMXYldEFLA/bqZG4o0zVm9gytRl3u
	 NitiJoHNqXQom6Rx5OvoogidzPBmDjQmxdlvL7yxwPCAmDzqLgDASrxGiu6qn0UZuP
	 ElSvBocHFDbxutHoAH6cHY81N39DutJqoL8nUrAqPUzW0efo07IF52k4XGT+eehvaC
	 SAVhgfyKAPN8w==
Date: Mon, 25 Mar 2024 10:30:45 +0000
From: Simon Horman <horms@kernel.org>
To: Sergey Shtylyov <s.shtylyov@omp.ru>
Cc: netdev@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
Subject: Re: [PATCH net] MAINTAINERS: split Renesas Ethernet drivers entry
Message-ID: <20240325103045.GC403975@kernel.org>
References: <de0ccc1d-6fc0-583f-4f80-f70e6461d62d@omp.ru>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <de0ccc1d-6fc0-583f-4f80-f70e6461d62d@omp.ru>

On Sun, Mar 24, 2024 at 11:40:09PM +0300, Sergey Shtylyov wrote:
> Since the Renesas Ethernet Switch driver was added by Yoshihiro Shimoda,
> I started receiving the patches to review for it -- which I was unable to
> do, as I don't know this hardware and don't even have the manuals for it.
> Fortunately, Shimoda-san has volunteered to be a reviewer for this new
> driver, thus let's now split the single entry into 3 per-driver entries,
> each with its own reviewer...
> 
> Signed-off-by: Sergey Shtylyov <s.shtylyov@omp.ru>
> 
> ---
> The patch is against the 'main' branch of the Netdev Group's 'net.git' repo...
> 
>  MAINTAINERS |   29 +++++++++++++++++++++++++----
>  1 file changed, 25 insertions(+), 4 deletions(-)

Thanks Sergey,

This seems to be consistent with what was discussed earlier [1]
and looks good to me.

Reviewed-by: Simon Horman <horms@kernel.org>

[1] https://lore.kernel.org/netdev/6498e2dd-7960-daeb-acce-a8d2207f3404@omp.ru/

