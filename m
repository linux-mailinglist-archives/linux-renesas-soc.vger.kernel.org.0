Return-Path: <linux-renesas-soc+bounces-12354-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 64EAFA19773
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 22 Jan 2025 18:22:43 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 934521668E7
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 22 Jan 2025 17:22:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DA7CF215179;
	Wed, 22 Jan 2025 17:22:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ragnatech.se header.i=@ragnatech.se header.b="Hg6VN5kC";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="bM49FNIp"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from fout-b2-smtp.messagingengine.com (fout-b2-smtp.messagingengine.com [202.12.124.145])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 273D616F8F5;
	Wed, 22 Jan 2025 17:22:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=202.12.124.145
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737566561; cv=none; b=lo4iJ8zACsvo9YWd4SpIQfEbo11yKe9e3aGYwp1n6wBiiTkUx7oaNi63GaoFHjQ7av1+DBrSZVa/rWGLz9oQmfj9EvKM5Uz5TXMf6se01PVxckoW81EQ+aTRqfvlblspLVDE4FiSjU81XwOE+J5A2SZH7GrFfQc4Q+kXRDykFNE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737566561; c=relaxed/simple;
	bh=/diSJasSBDKfaYNOhon5w1cgWjjN8BdIp1K3+5JUaTo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=MnPFYadGgTHN76OCd0FJPbOHodUbE+ue6zTJE/3i6NSWPb8jOKuUrmD31gchqaBYc19DuBQa61zzUz1v9N6pv12JMpkDoMKfJHRU6owEkIfrpo99vnMyiAhrGDAHQU0/BmT34dX26F0T8dnTHCmvLYwyXzXjKzyJjf2m4tG8Eq8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ragnatech.se; spf=pass smtp.mailfrom=ragnatech.se; dkim=pass (2048-bit key) header.d=ragnatech.se header.i=@ragnatech.se header.b=Hg6VN5kC; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=bM49FNIp; arc=none smtp.client-ip=202.12.124.145
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ragnatech.se
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ragnatech.se
Received: from phl-compute-09.internal (phl-compute-09.phl.internal [10.202.2.49])
	by mailfout.stl.internal (Postfix) with ESMTP id E89AE114011A;
	Wed, 22 Jan 2025 12:22:38 -0500 (EST)
Received: from phl-mailfrontend-01 ([10.202.2.162])
  by phl-compute-09.internal (MEProxy); Wed, 22 Jan 2025 12:22:39 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ragnatech.se; h=
	cc:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm2; t=1737566558;
	 x=1737652958; bh=BYUSHN34S5D7RcYOMxF/PrWwE7VzRz4inZ+UTsLY1yM=; b=
	Hg6VN5kCod6RUZmraclm6swDB+tCF/VoP3WYX13pK/MpKJf3IaAJc0zHtim5Xqyd
	2vjCSqDDbmNQCRQUCq+mYr85sJqk5jxF27KPO7TCc47JM6uvgizzd7D4v19KOSDE
	uLx4VNWajHMlynwBtH/cd6Sy2Z8uQngGQBZP8RLMwt/gz0IfCt5Gevz4gKi7d6rv
	Nj7JmNKTOkmnb+Nc13nfMYFctHYzuWe16rZeFIny8pH5tQA4b/dqMiVIKSmPc2MF
	a18UhS0/XDGXEfCYIoGlKHxJ55O4NH3nBOHP2Gl4z4JTwFIAQJ4vTcPGJgxRIVkR
	ByQUxxfaOnWCWpl3OWZVEQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; t=1737566558; x=
	1737652958; bh=BYUSHN34S5D7RcYOMxF/PrWwE7VzRz4inZ+UTsLY1yM=; b=b
	M49FNIpIFvYAQGopfzb1hcwFj9EmdO5dOof49AvFfGHtIi+KDHqPO7ruycCTFgjs
	o6nWwEZuxB3ifeQ4EEv0Vj5fSXtqvhNMu3aUg6VPl7aaLZK0IkvfInjFEXmDWgOJ
	Dqw4GM+MkFAULxFPm9NjTBPa3N4jhkrdezGIlQ94lPw55amvYcYD5EIzW9fydqN0
	5yOHSNA2gNhbml41g4KIyJBffYPGT1+gJEvZYWdTjWbPungL4Bova2fuwaeRe9cu
	KRmFQe2iFOC9ixCyyT0d3TNB8xTkUt7IE43XoCK1VIMcL5QZP2bOcW3uC1Kyqn/W
	2BgSKdkEpPQTUJWDL0gfQ==
X-ME-Sender: <xms:XSmRZ_FdpPayCSGxTwfEo7ZC1cgIr6FAEk41sHsWcG0DoWOzpqgf_w>
    <xme:XSmRZ8WhhJDKPYeH1_8ixAQBFG8EnDlTsvtYQzokBFNAQlyIhPekpVcKlHgtHPzD0
    I8t2qXAyC3w7ATM394>
X-ME-Received: <xmr:XSmRZxI3zKAQGa0SdUmzeuEwN8qKROx_tvxhTFwQNu15sphwK0k6jQg_vpnrsa_YSmbFDnOFvrrDVOmlNmXlCHRHWKwLBKY5Nw>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefuddrudejfedgvddvfecutefuodetggdotefrod
    ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpggftfghnshhusghstghrihgsvgdp
    uffrtefokffrpgfnqfghnecuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivg
    hnthhsucdlqddutddtmdenucfjughrpeffhffvvefukfhfgggtugfgjgesthekredttddt
    jeenucfhrhhomheppfhikhhlrghsucfunpguvghrlhhunhguuceonhhikhhlrghsrdhsoh
    guvghrlhhunhgusehrrghgnhgrthgvtghhrdhsvgeqnecuggftrfgrthhtvghrnhepffdt
    geefveefgfeutdevveelgfelkeeuvdefgefgfeehfeeijeehudelhfejkefgnecuffhomh
    grihhnpehkvghrnhgvlhdrohhrghenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgr
    mhepmhgrihhlfhhrohhmpehnihhklhgrshdrshhouggvrhhluhhnugesrhgrghhnrghtvg
    gthhdrshgvpdhnsggprhgtphhtthhopedugedpmhhouggvpehsmhhtphhouhhtpdhrtghp
    thhtohepkhhorhihrdhmrghinhgtvghnthessghoohhtlhhinhdrtghomhdprhgtphhtth
    hopehprghulhdrsggrrhhkvghrrdgtthessghprdhrvghnvghsrghsrdgtohhmpdhrtghp
    thhtoheprghnughrvgifodhnvghtuggvvheslhhunhhnrdgthhdprhgtphhtthhopegurg
    hvvghmsegurghvvghmlhhofhhtrdhnvghtpdhrtghpthhtohepvgguuhhmrgiivghtsehg
    ohhoghhlvgdrtghomhdprhgtphhtthhopehkuhgsrgeskhgvrhhnvghlrdhorhhgpdhrtg
    hpthhtohepphgrsggvnhhisehrvgguhhgrthdrtghomhdprhgtphhtthhopehmihhkhhgr
    ihhlrdhulhihrghnohhvsegtohhgvghnthgvmhgsvgguuggvugdrtghomhdprhgtphhtth
    hopehsvghrghgvihdrshhhthihlhihohhvsegtohhgvghnthgvmhgsvgguuggvugdrtgho
    mh
X-ME-Proxy: <xmx:XSmRZ9EK6ZUeImh67Lj4GNGT2hBqwGfwCFbUzcqUIa69GDy9vQYufg>
    <xmx:XSmRZ1Ul4aab_gomJhewqyh4_v38IJuX5onS_n-R6ZVQd7fyRDmJYA>
    <xmx:XSmRZ4PfqfY-rYNEGbCMchKqC1cWw8F9lR3pYi-cp4jFpNtscxG5bQ>
    <xmx:XSmRZ01uhb5RzAeKlDNaK1S69BMr6xcEU3Y6AA6DyVx_iWmbrSswEQ>
    <xmx:XimRZ2sFcJWiYFhi4d__bIGdykQWWB2Ctkma0ii9n3RRzYssYyJzgyA9>
Feedback-ID: i80c9496c:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Wed,
 22 Jan 2025 12:22:37 -0500 (EST)
Date: Wed, 22 Jan 2025 18:22:35 +0100
From: Niklas =?utf-8?Q?S=C3=B6derlund?= <niklas.soderlund@ragnatech.se>
To: Kory Maincent <kory.maincent@bootlin.com>
Cc: Paul Barker <paul.barker.ct@bp.renesas.com>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	Mikhail Ulyanov <mikhail.ulyanov@cogentembedded.com>,
	Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>,
	Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
	Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>,
	netdev@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH net 1/2] net: ravb: Fix missing rtnl lock in suspend path
Message-ID: <20250122172235.GG3436806@ragnatech.se>
References: <20250122-fix_missing_rtnl_lock_phy_disconnect-v1-0-8cb9f6f88fd1@bootlin.com>
 <20250122-fix_missing_rtnl_lock_phy_disconnect-v1-1-8cb9f6f88fd1@bootlin.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250122-fix_missing_rtnl_lock_phy_disconnect-v1-1-8cb9f6f88fd1@bootlin.com>

Hi Kory,

Thanks for your work.

On 2025-01-22 17:19:28 +0100, Kory Maincent wrote:
> Fix the suspend path by ensuring the rtnl lock is held where required.
> Calls to ravb_open, ravb_close and wol operations must be performed under
> the rtnl lock to prevent conflicts with ongoing ndo operations.
> 
> Without this fix, the following warning is triggered:
> [   39.032969] =============================
> [   39.032983] WARNING: suspicious RCU usage
> [   39.033019] -----------------------------
> [   39.033033] drivers/net/phy/phy_device.c:2004 suspicious
> rcu_dereference_protected() usage!
> ...
> [   39.033597] stack backtrace:
> [   39.033613] CPU: 0 UID: 0 PID: 174 Comm: python3 Not tainted
> 6.13.0-rc7-next-20250116-arm64-renesas-00002-g35245dfdc62c #7
> [   39.033623] Hardware name: Renesas SMARC EVK version 2 based on
> r9a08g045s33 (DT)
> [   39.033628] Call trace:
> [   39.033633]  show_stack+0x14/0x1c (C)
> [   39.033652]  dump_stack_lvl+0xb4/0xc4
> [   39.033664]  dump_stack+0x14/0x1c
> [   39.033671]  lockdep_rcu_suspicious+0x16c/0x22c
> [   39.033682]  phy_detach+0x160/0x190
> [   39.033694]  phy_disconnect+0x40/0x54
> [   39.033703]  ravb_close+0x6c/0x1cc
> [   39.033714]  ravb_suspend+0x48/0x120
> [   39.033721]  dpm_run_callback+0x4c/0x14c
> [   39.033731]  device_suspend+0x11c/0x4dc
> [   39.033740]  dpm_suspend+0xdc/0x214
> [   39.033748]  dpm_suspend_start+0x48/0x60
> [   39.033758]  suspend_devices_and_enter+0x124/0x574
> [   39.033769]  pm_suspend+0x1ac/0x274
> [   39.033778]  state_store+0x88/0x124
> [   39.033788]  kobj_attr_store+0x14/0x24
> [   39.033798]  sysfs_kf_write+0x48/0x6c
> [   39.033808]  kernfs_fop_write_iter+0x118/0x1a8
> [   39.033817]  vfs_write+0x27c/0x378
> [   39.033825]  ksys_write+0x64/0xf4
> [   39.033833]  __arm64_sys_write+0x18/0x20
> [   39.033841]  invoke_syscall+0x44/0x104
> [   39.033852]  el0_svc_common.constprop.0+0xb4/0xd4
> [   39.033862]  do_el0_svc+0x18/0x20
> [   39.033870]  el0_svc+0x3c/0xf0
> [   39.033880]  el0t_64_sync_handler+0xc0/0xc4
> [   39.033888]  el0t_64_sync+0x154/0x158
> [   39.041274] ravb 11c30000.ethernet eth0: Link is Down
> 
> Reported-by: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
> Closes: https://lore.kernel.org/netdev/4c6419d8-c06b-495c-b987-d66c2e1ff848@tuxon.dev/
> Fixes: 0184165b2f42 ("ravb: add sleep PM suspend/resume support")
> Signed-off-by: Kory Maincent <kory.maincent@bootlin.com>

I need to apply [1] to see the WARNING: suspicious RCU usage splat at 
all, I guess there is a WARN_ONCE somewhere. But with this patch applied 
the splat is gone when resuming and WoL works.

Tested on R-Car M3N with NFS root on the interface used for WoL.

Tested-by: Niklas Söderlund <niklas.soderlund+renesas@ragnatech.se>

1. [PATCH] gpio: rcar: Use raw_spinlock to protect register access

> ---
>  drivers/net/ethernet/renesas/ravb_main.c | 19 +++++++++++++++----
>  1 file changed, 15 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/net/ethernet/renesas/ravb_main.c b/drivers/net/ethernet/renesas/ravb_main.c
> index bc395294a32d..2c6d8e4966c3 100644
> --- a/drivers/net/ethernet/renesas/ravb_main.c
> +++ b/drivers/net/ethernet/renesas/ravb_main.c
> @@ -3217,10 +3217,15 @@ static int ravb_suspend(struct device *dev)
>  
>  	netif_device_detach(ndev);
>  
> -	if (priv->wol_enabled)
> -		return ravb_wol_setup(ndev);
> +	rtnl_lock();
> +	if (priv->wol_enabled) {
> +		ret = ravb_wol_setup(ndev);
> +		rtnl_unlock();
> +		return ret;
> +	}
>  
>  	ret = ravb_close(ndev);
> +	rtnl_unlock();
>  	if (ret)
>  		return ret;
>  
> @@ -3245,19 +3250,25 @@ static int ravb_resume(struct device *dev)
>  	if (!netif_running(ndev))
>  		return 0;
>  
> +	rtnl_lock();
>  	/* If WoL is enabled restore the interface. */
>  	if (priv->wol_enabled) {
>  		ret = ravb_wol_restore(ndev);
> -		if (ret)
> +		if (ret)  {
> +			rtnl_unlock();
>  			return ret;
> +		}
>  	} else {
>  		ret = pm_runtime_force_resume(dev);
> -		if (ret)
> +		if (ret) {
> +			rtnl_unlock();
>  			return ret;
> +		}
>  	}
>  
>  	/* Reopening the interface will restore the device to the working state. */
>  	ret = ravb_open(ndev);
> +	rtnl_unlock();
>  	if (ret < 0)
>  		goto out_rpm_put;
>  
> 
> -- 
> 2.34.1
> 

-- 
Kind Regards,
Niklas Söderlund

