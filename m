Return-Path: <linux-renesas-soc+bounces-12388-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 9C893A1A306
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 23 Jan 2025 12:33:42 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 5BD543ACA75
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 23 Jan 2025 11:33:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A374420E030;
	Thu, 23 Jan 2025 11:33:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b="rLkFBjgj"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6E8F620CCC3
	for <linux-renesas-soc@vger.kernel.org>; Thu, 23 Jan 2025 11:33:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737632017; cv=none; b=iPxGaoukcazcb/vORN8+jZgadEEA4SgXku+pGAF9K39EJeDp74Qdr8LWSrKBiM36glMRyvUTxIVEUgXAQw6/t7xKEwjOSBrW/0yKWfmwyW9RnVtuT/i/CBu4lPZ0qyMJp55de21B73Fm3xSWAbIMWwgCknIyJljZH9aYwVPLMBg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737632017; c=relaxed/simple;
	bh=aKzJDMPv9ht42XorTR+RjjJ61MHAfgHzBMRxo0FtBB4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=UQflUF+AUkZ9J3UCzx11rc7xoNoMSLjV7/49mfmlR6o3z26FExwJl4QKE+SzFBzOfxddEQGwKE89lfQ5ClNbFlNtuNZHNBB6sQjTSFnqadlnr8+PZNiojifb4RfBtd9iFxw+/gQbNXsGJyJCGCdY+wJrykeEvvP9bXGTalyAEkw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev; spf=pass smtp.mailfrom=tuxon.dev; dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b=rLkFBjgj; arc=none smtp.client-ip=209.85.128.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=tuxon.dev
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-4361815b96cso5287035e9.1
        for <linux-renesas-soc@vger.kernel.org>; Thu, 23 Jan 2025 03:33:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tuxon.dev; s=google; t=1737632014; x=1738236814; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=+YVE/gtiWqh1QibLG9dYV/Ym5SAd8q1/dZeT3rLUqPk=;
        b=rLkFBjgjuZIV+OnzkDL554/UmD6mQ9mcnID2Rt5HrpOUYnLnVNA/LVCirI1WgUivnf
         aOIHN9vzIaVJf07R6BB4dzlzBx8S6kMaEZ67DHtyyfqtpczr6L/C0slqtVmFRBcDKzg/
         DEpAJNNBc2e66MCSQvpEsII9s8rqNEkrYCgDfVjd9dNzwRiyHCrwxgESmQXHnucZswze
         vRXinnhMh+PtABDnGqSs51J8r8Fd+47YrIGnImQa6YUzqSNpkfc1L3YcGkatVLOVdCY7
         rld4Btlq3IegPwkOvswlAMXcTgMfXeU0J2qvaZ/HjDheGzq/+jal2eQqaayGSiGIo3U3
         gdVA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1737632014; x=1738236814;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=+YVE/gtiWqh1QibLG9dYV/Ym5SAd8q1/dZeT3rLUqPk=;
        b=NadQoiwlqyYdMBDvIMYyKBJn0rDtaaDWfcLcfZ2vpEXFVN+JKSBw7LQqUrmy/D05qy
         pUvyS4J5yF22eViLSQZ7VSuMgHZ+c7imebgpt4p1DtfDUlhk1uQ6ZetnvKBuAGl+QE+E
         vzp2aUHlrGSkmDV5N7nxeUuU49aH45050XvQTJahDFce1xx0von/0l69T/7zbAEZ5OT3
         /MVRtYNpyWJ7z9iU1dPUTDJgRBswOdW66+UgxLv5Vkns36+UrE0CqmBwOtpc9XS/47Da
         RnsX+WgvabqaE78BujhsGCdkIb01L0n2yLNw6WcseUbYgsFQ6jQ4v8t9zhIujRUSl36+
         gs9A==
X-Forwarded-Encrypted: i=1; AJvYcCWZvOxSOLUkpKU+vnc2C2gDTic1/M1bLewr73Mq72r0769okktu2afMY3Es4kWzx3PxYBW1WPhzRoeBzv9Wv/uQ2A==@vger.kernel.org
X-Gm-Message-State: AOJu0Yy+Iae929k9E8NBhVcEVNm9ed0Gv4CqMPVmz8N46Jzq5D07bRyt
	fV3uqRg9nd5ja325kpcbo4n0S6hTMNeIAbttMzvqz2bIHItode+4e3tlzVyRrbY=
X-Gm-Gg: ASbGncsaLGyr0Y2ztWpE8c1PU44tU4GkGXnL8JYSBQ+4awCRUXNT5Ch/8jRb93xx88s
	runsOtvr+CP89sKZ+bAH73MFFLYeHu3yW6OVBnpXFe4eJY9lgxKesmiGvqxSIOnPINChS34MJi2
	CzumEq+PRybF6p9h84X7SznemMZz898XvEj5AljVo114BkZdjJK8UIvNt+FMKAygoEnXnpBn4T9
	Lrn0AJ2jOvkjt3ecnQEuD9jeo8Km7lqxJyvICVi6qn9ouTSLBH/F59oXGACIjfjsAwdtPLTB8QY
	NzCIoiEJqlAV
X-Google-Smtp-Source: AGHT+IFQkobOQLylBs+LFRBPvbBF7c0LuXr3S1V57vJaQa4QGiZaOthU2WMGxsNN7vo5crNCtzWIfg==
X-Received: by 2002:a05:600c:450e:b0:436:1ac2:1ad2 with SMTP id 5b1f17b1804b1-43891427485mr206669055e9.19.1737632013469;
        Thu, 23 Jan 2025 03:33:33 -0800 (PST)
Received: from [192.168.50.4] ([82.78.167.35])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-438b31ae155sm58789255e9.20.2025.01.23.03.33.31
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 23 Jan 2025 03:33:33 -0800 (PST)
Message-ID: <806d2df6-68d3-4319-8ce6-7049563508cf@tuxon.dev>
Date: Thu, 23 Jan 2025 13:33:30 +0200
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH net 1/2] net: ravb: Fix missing rtnl lock in suspend path
To: Kory Maincent <kory.maincent@bootlin.com>,
 Paul Barker <paul.barker.ct@bp.renesas.com>,
 =?UTF-8?Q?Niklas_S=C3=B6derlund?= <niklas.soderlund@ragnatech.se>,
 Andrew Lunn <andrew+netdev@lunn.ch>, "David S. Miller"
 <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>,
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
 Mikhail Ulyanov <mikhail.ulyanov@cogentembedded.com>,
 Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 =?UTF-8?Q?Niklas_S=C3=B6derlund?= <niklas.soderlund+renesas@ragnatech.se>,
 Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>, netdev@vger.kernel.org,
 linux-renesas-soc@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20250122-fix_missing_rtnl_lock_phy_disconnect-v1-0-8cb9f6f88fd1@bootlin.com>
 <20250122-fix_missing_rtnl_lock_phy_disconnect-v1-1-8cb9f6f88fd1@bootlin.com>
From: Claudiu Beznea <claudiu.beznea@tuxon.dev>
Content-Language: en-US
In-Reply-To: <20250122-fix_missing_rtnl_lock_phy_disconnect-v1-1-8cb9f6f88fd1@bootlin.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi, Kory,

On 22.01.2025 18:19, Kory Maincent wrote:
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

I've test it. Looks good.

Thank you for your patch. However, I think this could be simplified. The
locking scheme looks complicated to me. E.g., this one works too:

diff --git a/drivers/net/ethernet/renesas/ravb_main.c
b/drivers/net/ethernet/renesas/ravb_main.c
index bc395294a32d..cfe4f0f364f3 100644
--- a/drivers/net/ethernet/renesas/ravb_main.c
+++ b/drivers/net/ethernet/renesas/ravb_main.c
@@ -3217,10 +3217,16 @@ static int ravb_suspend(struct device *dev)

        netif_device_detach(ndev);

-       if (priv->wol_enabled)
-               return ravb_wol_setup(ndev);
+       if (priv->wol_enabled) {
+               rtnl_lock();
+               ret = ravb_wol_setup(ndev);
+               rtnl_unlock();
+               return ret;
+       }

+       rtnl_lock();
        ret = ravb_close(ndev);
+       rtnl_unlock();
        if (ret)
                return ret;

@@ -3247,7 +3253,9 @@ static int ravb_resume(struct device *dev)

        /* If WoL is enabled restore the interface. */
        if (priv->wol_enabled) {
+               rtnl_lock();
                ret = ravb_wol_restore(ndev);
+               rtnl_unlock();
                if (ret)
                        return ret;
        } else {
@@ -3257,7 +3265,9 @@ static int ravb_resume(struct device *dev)
        }

        /* Reopening the interface will restore the device to the working
state. */
+       rtnl_lock();
        ret = ravb_open(ndev);
+       rtnl_unlock();
        if (ret < 0)
                goto out_rpm_put;


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


