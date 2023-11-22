Return-Path: <linux-renesas-soc+bounces-156-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 75C417F51AE
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 22 Nov 2023 21:32:47 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id A75791C20AC4
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 22 Nov 2023 20:32:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 07E4A4D597;
	Wed, 22 Nov 2023 20:32:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="SuwtwSxW"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D49545D4A5;
	Wed, 22 Nov 2023 20:32:45 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7FB8BC433C7;
	Wed, 22 Nov 2023 20:32:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1700685165;
	bh=4K8fNKyYihP+hb+Ck/x+SyXUiZ7E6G2WbqC/952N+zk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=SuwtwSxWhooR7KOAA3dbbGk2cwvWRUPs7w7TZswjxcTotuz1EDweX5nT3GlI0UCvl
	 yhrDxHb3W2Df14IUFUt0R95v39a49LIFtBuSvuIwYGsG6KsPiqRBWdKYy/3t40jBrN
	 W+VXqZnWVx+tBuFgrmKOz3nId9QAkoUSIBQzjc+8UwjlgWQshwxtZdYTZokTGaiTGQ
	 HLWFm7Gcl/qlYZc5gEGVSKuZKIQi7i+wtOc7e3erdTK4+q+A1/FpJsIXFdZR0yXhvy
	 +Ohk0OcMw7nmneZkwCErqN/XVag+CHz7D/UalhpLVpTTKrOmEBjw2No8jZXIK6o8mp
	 aPfmNKVed4u0g==
Date: Wed, 22 Nov 2023 20:32:41 +0000
From: Simon Horman <horms@kernel.org>
To: Niklas =?utf-8?Q?S=C3=B6derlund?= <niklas.soderlund+renesas@ragnatech.se>
Cc: "David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	Richard Cochran <richardcochran@gmail.com>, netdev@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org,
	Wolfram Sang <wsa+renesas@sang-engineering.com>
Subject: Re: [net-next v3 2/5] net: ethernet: renesas: rcar_gen4_ptp: Fail on
 unknown register layout
Message-ID: <20231122203241.GE6731@kernel.org>
References: <20231121155306.515446-1-niklas.soderlund+renesas@ragnatech.se>
 <20231121155306.515446-3-niklas.soderlund+renesas@ragnatech.se>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20231121155306.515446-3-niklas.soderlund+renesas@ragnatech.se>

On Tue, Nov 21, 2023 at 04:53:03PM +0100, Niklas Söderlund wrote:
> Instead of printing a warning and proceeding with an unknown register
> layout return an error. The only call site is already prepared to
> propagate the error.
> 
> Signed-off-by: Niklas Söderlund <niklas.soderlund+renesas@ragnatech.se>
> Reviewed-by: Wolfram Sang <wsa+renesas@sang-engineering.com>

Reviewed-by: Simon Horman <horms@kernel.org>


