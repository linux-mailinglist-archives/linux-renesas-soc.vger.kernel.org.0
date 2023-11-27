Return-Path: <linux-renesas-soc+bounces-298-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 411737FAC7C
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 27 Nov 2023 22:21:49 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id A1A4EB21428
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 27 Nov 2023 21:21:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 81DEB4642B;
	Mon, 27 Nov 2023 21:21:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="gWRkyA/J"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 56C18446DF;
	Mon, 27 Nov 2023 21:21:40 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 869C2C433C7;
	Mon, 27 Nov 2023 21:21:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1701120100;
	bh=TzNFTVXvYWNtSW1+S6YT1aDqVJNWjtqtpGjq/1tjPpQ=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=gWRkyA/Jcda5sruTvrtJ+0yBMVNUamZl894fLE/gVzRzGx9rYU33rYq1Ch9tSTUqJ
	 GFO7bgQ6Wr4ciUAV3f4/pvFdtUiosqA0CZmwHGbiNaLjRshGWQ/lP26y4R0kEhf8V2
	 DVSgFOWbpjG91gF55KFhuWblhPjXlAtRVuQV0kona97NOW796a8R0/xcJF47gdLC3O
	 czHvdyRuwm6EbqsCXd6JiBNnXaIztqBYmi2h3sW9hajrDCXnw0ab09l/eLW6ijuOtc
	 nQxU8G20y/LiIP8SEQtx/iilNCDEezL5oVPGIsjJP+stj7059mvSzWMOhTJ+65VzT0
	 Bd7m8NdGo5Yxg==
Date: Mon, 27 Nov 2023 13:21:39 -0800
From: Jakub Kicinski <kuba@kernel.org>
To: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
Cc: s.shtylyov@omp.ru, davem@davemloft.net, edumazet@google.com,
 pabeni@redhat.com, netdev@vger.kernel.org,
 linux-renesas-soc@vger.kernel.org
Subject: Re: [PATCH net-next 0/9] net: rswitch: Add jumbo frames support
Message-ID: <20231127132139.796e2a16@kernel.org>
In-Reply-To: <20231127115334.3670790-1-yoshihiro.shimoda.uh@renesas.com>
References: <20231127115334.3670790-1-yoshihiro.shimoda.uh@renesas.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Mon, 27 Nov 2023 20:53:25 +0900 Yoshihiro Shimoda wrote:
> This patch series is based on the latest net-next.git / main branch,
> and merged the latest net.git / main branch to avoid conflict in
> rswitch_start_xmit().

Sorry, you'll need to wait for the trees to converge and then repost.
The trees are merged together every week, some time on Thursday
afternoon (PST).
-- 
pw-bot: defer

