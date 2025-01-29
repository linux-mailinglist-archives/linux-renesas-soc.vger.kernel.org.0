Return-Path: <linux-renesas-soc+bounces-12689-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 10F7AA21E42
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 29 Jan 2025 15:01:02 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 523491887868
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 29 Jan 2025 14:01:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1482412DD95;
	Wed, 29 Jan 2025 14:00:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ragnatech.se header.i=@ragnatech.se header.b="RwDbWDRa";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="dvYCsuzD"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from fhigh-b7-smtp.messagingengine.com (fhigh-b7-smtp.messagingengine.com [202.12.124.158])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 84C102FB2;
	Wed, 29 Jan 2025 14:00:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=202.12.124.158
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738159256; cv=none; b=j72fCAPXxSltnVW0yiZ74Li59dGoGNmpT7gMac+NmTkUyaRGUAWERUQWIdd9D8L2ncnTm91cpIA1j6IlYgbZzDcsh28KuT1TvkVFabBKzfN6d0lu0w+7vmCenOiPrvD308z44585notAkYexFb/cmGMzbJnVimPBqJJ0Wf62jQM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738159256; c=relaxed/simple;
	bh=1UEs0KXKMam13DAJdD/yC6rVzf10pL1R0Dklif92qto=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=IWlKUfT4tcBLUur4ca+4hOqsHPV9PKWfc19nRqSPRWoys2Ek/ip33kFR893x3cdQlUp7GkkNB5ogNEjppIPZ07N2qycANxkv0MTEdXjkTZof8XYqOfBamOptvf8T9N7pKP8Ff1QEhtcg/4Xc5poEbWlt3H0nlkqXn8H2lwN2CFU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ragnatech.se; spf=pass smtp.mailfrom=ragnatech.se; dkim=pass (2048-bit key) header.d=ragnatech.se header.i=@ragnatech.se header.b=RwDbWDRa; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=dvYCsuzD; arc=none smtp.client-ip=202.12.124.158
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ragnatech.se
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ragnatech.se
Received: from phl-compute-12.internal (phl-compute-12.phl.internal [10.202.2.52])
	by mailfhigh.stl.internal (Postfix) with ESMTP id 0F2F0254021C;
	Wed, 29 Jan 2025 09:00:52 -0500 (EST)
Received: from phl-mailfrontend-01 ([10.202.2.162])
  by phl-compute-12.internal (MEProxy); Wed, 29 Jan 2025 09:00:52 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ragnatech.se; h=
	cc:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm2; t=1738159250;
	 x=1738245650; bh=zFi6wW3jKd1rksLR4v80WwjgJ/VFTjJ/ZY7rxPejGvk=; b=
	RwDbWDRaniOiP2DDPW8t3YQslvPWP+oPH7qNSnzGjQ/Uskw62Gv3tpo53JDzYmfp
	0cSZuEuXkn8alYNkZOOnMb8D9M/QwgZZVN9s8IN/oQZFuf9V54vNxEwLVCEN076P
	ag4R6KjeGYdxoYrFwIjTfhSBf3i4u86irRo4TTwwCYczwBs3FVRkktn0CE7IdOzE
	SKIiOnCb4HLGlK1zXnqlP86DWSAiBU5LU3YIrLzbJP1eEUK107SD0nnUzHctUkKB
	PGQuHPKbHDAbiOnn4jyJER8/aAu4m/vSJ0YbtuZ5vy0qzNO3GWC7y8pg9+zeQVmT
	x0IhqhzrxkhwvYufRTgPdg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; t=1738159250; x=
	1738245650; bh=zFi6wW3jKd1rksLR4v80WwjgJ/VFTjJ/ZY7rxPejGvk=; b=d
	vYCsuzDxYjrRNTip7Ow98k4nFoDFbnhyJoGX50pDm7q1Vmi0VRgI1NLikQB81NkS
	laqdaYXI0TtNHhgePDx+iUId6nYJmIPCoCXyosXuH9PCe22d8l/nuPIH1XbfENwH
	eIhLLVoke1J+DJHX724ryFaLOSufFOTWM0/alLRNJTMBON6vGgodWIDwuUIxb0a/
	Ge6u+DQyub7SSFVBjdPILdXyvpsSALcJ/UMxI0YYZuh1wqWCQ4ljf7Dw5YGMFKBQ
	SbvFffUx1nOvYDNPSeZAAcv6kwKheMpGEWBcstS0SClu/BcULOD+qn2ctpu/JPHS
	WSmXn79CfZPOvdm64B2EA==
X-ME-Sender: <xms:kTSaZ3ruKNTEuokgIssfYyQc_37Q0vHUaiy4d2dNxVHcpkqZoYNGsw>
    <xme:kTSaZxpCHQgpSkC0dwDZ_IL2MyNsVpfQLZ4e-_yJMBEbyN2XUrC34Z30-229VjUZm
    yWwYt1ycksVrcX6f7w>
X-ME-Received: <xmr:kTSaZ0PZMDGqaKY7JGEzQ0kE5VoFnMHGV9UI776ffAY3O2YSbAosnPWvYhI0zxf4LNkAjEN_cDUF3mtD-rw-CdkYuvxUqPr9lQ>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgdefudejucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdggtfgfnhhsuhgsshgtrhhisggvpdfu
    rfetoffkrfgpnffqhgenuceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnh
    htshculddquddttddmnecujfgurhepfffhvfevuffkfhggtggugfgjsehtkeertddttdej
    necuhfhrohhmpefpihhklhgrshcuufpnuggvrhhluhhnugcuoehnihhklhgrshdrshhoug
    gvrhhluhhnugesrhgrghhnrghtvggthhdrshgvqeenucggtffrrghtthgvrhhnpefftdeg
    feevfefguedtveevlefgleekuedvfeeggfefheefieejhedulefhjeekgfenucffohhmrg
    hinhepkhgvrhhnvghlrdhorhhgnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghm
    pehmrghilhhfrhhomhepnhhikhhlrghsrdhsohguvghrlhhunhgusehrrghgnhgrthgvtg
    hhrdhsvgdpnhgspghrtghpthhtohepudefpdhmohguvgepshhmthhpohhuthdprhgtphht
    thhopehkohhrhidrmhgrihhntggvnhhtsegsohhothhlihhnrdgtohhmpdhrtghpthhtoh
    epphgruhhlrdgsrghrkhgvrhdrtghtsegsphdrrhgvnhgvshgrshdrtghomhdprhgtphht
    thhopegrnhgurhgvfidonhgvthguvghvsehluhhnnhdrtghhpdhrtghpthhtohepuggrvh
    gvmhesuggrvhgvmhhlohhfthdrnhgvthdprhgtphhtthhopegvughumhgriigvthesghho
    ohhglhgvrdgtohhmpdhrtghpthhtohepkhhusggrsehkvghrnhgvlhdrohhrghdprhgtph
    htthhopehprggsvghnihesrhgvughhrghtrdgtohhmpdhrtghpthhtohepshdrshhhthih
    lhihohhvsehomhhprdhruhdprhgtphhtthhopehthhhomhgrshdrphgvthgriiiiohhnih
    essghoohhtlhhinhdrtghomh
X-ME-Proxy: <xmx:kTSaZ64fpn1RtioeqvWMHYXRGmMGeHjlmubP2ch-_8gT-OG0WCv0fQ>
    <xmx:kTSaZ26V3RROx9UvVnMmfDlPp2gJPCF0oEQEVFaPuR3jyylLMklz3Q>
    <xmx:kTSaZygQ6JwkJ2y72Nqm4epEnGpyuRla4xnyn2ETb1W0LdlH573d9w>
    <xmx:kTSaZ45i0FSiHaT3xCSTZEiJ7m5BQHSC91CKqdzzitMcZf6HgRpJsg>
    <xmx:kjSaZ5Irt3w-7VsKEgYYe18Kg-xNfw4KAevzkYR8e0Kz5gcmpUccQ7YK>
Feedback-ID: i80c9496c:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Wed,
 29 Jan 2025 09:00:48 -0500 (EST)
Date: Wed, 29 Jan 2025 15:00:46 +0100
From: Niklas =?utf-8?Q?S=C3=B6derlund?= <niklas.soderlund@ragnatech.se>
To: Kory Maincent <kory.maincent@bootlin.com>
Cc: Paul Barker <paul.barker.ct@bp.renesas.com>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	Sergey Shtylyov <s.shtylyov@omp.ru>,
	Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
	Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>,
	netdev@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH net v3 1/2] net: ravb: Fix missing rtnl lock in
 suspend/resume path
Message-ID: <20250129140046.GA1561767@ragnatech.se>
References: <20250129-fix_missing_rtnl_lock_phy_disconnect-v3-0-24c4ba185a92@bootlin.com>
 <20250129-fix_missing_rtnl_lock_phy_disconnect-v3-1-24c4ba185a92@bootlin.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250129-fix_missing_rtnl_lock_phy_disconnect-v3-1-24c4ba185a92@bootlin.com>

Hi Kory,

Thanks for your work.

On 2025-01-29 10:50:46 +0100, Kory Maincent wrote:
> Fix the suspend/resume path by ensuring the rtnl lock is held where
> required. Calls to ravb_open, ravb_close and wol operations must be
> performed under the rtnl lock to prevent conflicts with ongoing ndo
> operations.
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

Tested-by: Niklas Söderlund <niklas.soderlund+renesas@ragnatech.se>

> ---
> Changes in v3:
> - Move back to first version of ravb fix.
> - Remove the duplicate of the if condition.
> 
> Changes in v2:
> - Move the rtnl_lock before ravb_wol_setup() and and ravb_wol_restore()
>   instead of before the if condition.
> ---
>  drivers/net/ethernet/renesas/ravb_main.c | 22 ++++++++++++++--------
>  1 file changed, 14 insertions(+), 8 deletions(-)
> 
> diff --git a/drivers/net/ethernet/renesas/ravb_main.c b/drivers/net/ethernet/renesas/ravb_main.c
> index bc395294a32d..c9f4976a3527 100644
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
> @@ -3245,19 +3250,20 @@ static int ravb_resume(struct device *dev)
>  	if (!netif_running(ndev))
>  		return 0;
>  
> +	rtnl_lock();
>  	/* If WoL is enabled restore the interface. */
> -	if (priv->wol_enabled) {
> +	if (priv->wol_enabled)
>  		ret = ravb_wol_restore(ndev);
> -		if (ret)
> -			return ret;
> -	} else {
> +	else
>  		ret = pm_runtime_force_resume(dev);
> -		if (ret)
> -			return ret;
> +	if (ret) {
> +		rtnl_unlock();
> +		return ret;
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

