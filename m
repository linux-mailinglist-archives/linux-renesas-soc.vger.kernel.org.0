Return-Path: <linux-renesas-soc+bounces-157-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id E4B8B7F51B3
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 22 Nov 2023 21:33:06 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 85AEBB20C65
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 22 Nov 2023 20:33:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DD6374F60B;
	Wed, 22 Nov 2023 20:33:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="fVnrNMGM"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B74C85D4BE;
	Wed, 22 Nov 2023 20:33:02 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 621C7C433C9;
	Wed, 22 Nov 2023 20:33:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1700685182;
	bh=OohsX9t3XJVe6abGmlQxWWmKdtHta49q792b3ADn50I=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=fVnrNMGMrvxGLwK7N2I6NirHc0FGxrxUW/7wAOMruxF5Ejt2Wvdgoy1lXIJUIisSN
	 eU2Da5M58yxnIDIr/pTvXto6uLf3CmTte4Su16KYmsiN+3y+qxlrogPJ2O0RTufMc3
	 fBJaTCexpf0WevApOq8JHvpMcdPGNAkX1fQC/zgcHUJLsu6YKYpgvI+yWuIH6c/893
	 Nd4TRFfAdjqJHOGzRIFcjLA4TSnjiUkACZS55V4ZwgoxZTBjfpDA7pT4Rbc4uuhMBG
	 LO4DO+kiF8oAhM2m1VYjv/oUyf73eFKwAFvssFSLhuizbeUZm8EIzRVsueSQaLarKR
	 GMXkYIufAhz0w==
Date: Wed, 22 Nov 2023 20:32:57 +0000
From: Simon Horman <horms@kernel.org>
To: Niklas =?utf-8?Q?S=C3=B6derlund?= <niklas.soderlund+renesas@ragnatech.se>
Cc: "David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	Richard Cochran <richardcochran@gmail.com>, netdev@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org,
	Wolfram Sang <wsa+renesas@sang-engineering.com>
Subject: Re: [net-next v3 3/5] net: ethernet: renesas: rcar_gen4_ptp: Prepare
 for shared register layout
Message-ID: <20231122203257.GF6731@kernel.org>
References: <20231121155306.515446-1-niklas.soderlund+renesas@ragnatech.se>
 <20231121155306.515446-4-niklas.soderlund+renesas@ragnatech.se>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20231121155306.515446-4-niklas.soderlund+renesas@ragnatech.se>

On Tue, Nov 21, 2023 at 04:53:04PM +0100, Niklas Söderlund wrote:
> All known R-Car Gen4 SoC share the same register layout, rename the
> R-Car S4 specific identifiers so they can be shared with the upcoming
> R-Car V4H support.
> 
> Signed-off-by: Niklas Söderlund <niklas.soderlund+renesas@ragnatech.se>
> Reviewed-by: Wolfram Sang <wsa+renesas@sang-engineering.com>

Reviewed-by: Simon Horman <horms@kernel.org>


