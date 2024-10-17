Return-Path: <linux-renesas-soc+bounces-9814-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id A0CB99A1DB0
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 17 Oct 2024 10:58:43 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 648F128130A
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 17 Oct 2024 08:58:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D14141D6DA9;
	Thu, 17 Oct 2024 08:58:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="No1LV0IR"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A529E1D63FE;
	Thu, 17 Oct 2024 08:58:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729155520; cv=none; b=lIC9V/ifzoKWFl4o/yRb5sJ649dGTml/6MR2qXzbCQELSg7vAdLv1jU1dMA4Wk/uOkV5RBFH26hqhEl51St5wjdNzbGBpbD4mVPARwH+vxQuDIkJQn+pK+NX9xrd5/wOvFEGiakZJmTbuxjEMwx/iQFo4sfl5PUuV+/oUcdWiuA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729155520; c=relaxed/simple;
	bh=PgQ56byygQs94diK4Ss9llCTjBV65sNCkJOhxwoaQmg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=TL6trlse7dfnSDNqaxDR+ea1Lq4FNGtFyuA4I7V6hl2fulQfOalG0puFdQDKdP0Mzzo1nrZXuDF9jumlTEkxcr4vMD11QA4lGLFcVDrREDEQNJriLjQLAzmO9QFNbqb6ZiXHrPkzTdSBy2nYJ0BAXzLAhFa+Por/MiARXaskExY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=No1LV0IR; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 91130C4CEC3;
	Thu, 17 Oct 2024 08:58:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1729155520;
	bh=PgQ56byygQs94diK4Ss9llCTjBV65sNCkJOhxwoaQmg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=No1LV0IRVr9PuXTY8NzTwH7X+7ekkfgSPeoGLLXYid2undg1vRXPUq2ZIvGHQIg/v
	 SMFddJdL92T87E2w+3F0U3dIggVMBLmsV7ssw1TmgMKmKkHHXuvt7/P7jrUPDkAgyI
	 aRU28qT/Vam87AmBMvXPvpPGubolX1QHoOlVndoa2JMinp0lZHp4G3MEgP0PB1CytY
	 s8zGeJggHZ4t3rJi+rIfrzuTKbNNCTDFqFsNEaeOz7AmMdckSBqmYiO0vOy06kpUfs
	 h1y1/CJgf1q5P94nEsiM9e7NX7jgcTSK/JjEA4bfLF6yuBRpBO/rZmm6qCuefv0WEU
	 2jg/8inknubsQ==
Date: Thu, 17 Oct 2024 09:58:34 +0100
From: Simon Horman <horms@kernel.org>
To: Rosen Penev <rosenp@gmail.com>
Cc: netdev@vger.kernel.org,
	Florian Fainelli <florian.fainelli@broadcom.com>,
	Andrew Lunn <andrew@lunn.ch>, Vladimir Oltean <olteanv@gmail.com>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	Kurt Kanzenbach <kurt@linutronix.de>,
	Woojung Huh <woojung.huh@microchip.com>,
	"maintainer:MICROCHIP KSZ SERIES ETHERNET SWITCH DRIVER" <UNGLinuxDriver@microchip.com>,
	=?utf-8?B?Q2zDqW1lbnQgTMOpZ2Vy?= <clement.leger@bootlin.com>,
	George McCollister <george.mccollister@gmail.com>,
	Richard Cochran <richardcochran@gmail.com>,
	Jacob Keller <jacob.e.keller@intel.com>,
	Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>,
	Breno Leitao <leitao@debian.org>,
	open list <linux-kernel@vger.kernel.org>,
	"open list:RENESAS RZ/N1 A5PSW SWITCH DRIVER" <linux-renesas-soc@vger.kernel.org>
Subject: Re: [PATCHv7 net-next 5/6] net: ibm: emac: use devm for mutex_init
Message-ID: <20241017085834.GQ2162@kernel.org>
References: <20241015200222.12452-1-rosenp@gmail.com>
 <20241015200222.12452-7-rosenp@gmail.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241015200222.12452-7-rosenp@gmail.com>

On Tue, Oct 15, 2024 at 01:02:20PM -0700, Rosen Penev wrote:
> It seems since inception that mutex_destroy was never called for these
> in _remove. Instead of handling this manually, just use devm for
> simplicity.
> 
> Signed-off-by: Rosen Penev <rosenp@gmail.com>

Reviewed-by: Simon Horman <horms@kernel.org>


