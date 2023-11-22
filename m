Return-Path: <linux-renesas-soc+bounces-159-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 52B027F51B9
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 22 Nov 2023 21:33:48 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 843031C20B7E
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 22 Nov 2023 20:33:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9345D58AB8;
	Wed, 22 Nov 2023 20:33:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="iqaAP2w3"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6F6E95E0B5;
	Wed, 22 Nov 2023 20:33:46 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2DAF8C433C8;
	Wed, 22 Nov 2023 20:33:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1700685225;
	bh=OCHrCezZBSJbvpIz5dcAm0E7+peWFixSpOgj/2Z8zts=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=iqaAP2w3OKJD2X7vIkRo6VB3QjkspBrB3VVQPmR7KC5RoKLmc8KIa+Swu4T+nj1FJ
	 PvMe9d1gLHInfG8nwmcRrGdOiOv9sAQoZHIsMTagHK8bJZI+3vBGjpxewUQWZehGe8
	 Xq3pSdEVvTV/9otzsU4Ls2r0SkbblXaMaGF/BKT7yizBJpdiojDUuTAa7twdHCNEG0
	 BjImMYgEwCoGYB6dFfIquSlEz0gzhXT5+HbCQQ/6oOTfKa044YaY9IJvfL496wa9LT
	 PNzrURrXPe4VjyIE0XusnxUje7LoxRtlkw+XSb0CivsLnXwi40JaIhrBWEFnOQzM/h
	 /09GpxcD94h2A==
Date: Wed, 22 Nov 2023 20:33:41 +0000
From: Simon Horman <horms@kernel.org>
To: Niklas =?utf-8?Q?S=C3=B6derlund?= <niklas.soderlund+renesas@ragnatech.se>
Cc: "David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	Richard Cochran <richardcochran@gmail.com>, netdev@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org
Subject: Re: [net-next v3 5/5] net: ethernet: renesas: rcar_gen4_ptp: Break
 out to module
Message-ID: <20231122203341.GH6731@kernel.org>
References: <20231121155306.515446-1-niklas.soderlund+renesas@ragnatech.se>
 <20231121155306.515446-6-niklas.soderlund+renesas@ragnatech.se>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20231121155306.515446-6-niklas.soderlund+renesas@ragnatech.se>

On Tue, Nov 21, 2023 at 04:53:06PM +0100, Niklas Söderlund wrote:
> The Gen4 gPTP support will be shared between the existing Renesas
> Ethernet Switch driver and the upcoming Renesas Ethernet-TSN driver. In
> preparation for this break out the gPTP support to its own module.
> 
> Signed-off-by: Niklas Söderlund <niklas.soderlund+renesas@ragnatech.se>

Reviewed-by: Simon Horman <horms@kernel.org>


