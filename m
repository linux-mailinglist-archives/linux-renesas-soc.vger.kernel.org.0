Return-Path: <linux-renesas-soc+bounces-30849-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id CDPRICKzz2l1zgYAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-30849-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 03 Apr 2026 14:31:30 +0200
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 01E75394062
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 03 Apr 2026 14:31:29 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 09F8C306B3A4
	for <lists+linux-renesas-soc@lfdr.de>; Fri,  3 Apr 2026 12:30:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 05D7139B49D;
	Fri,  3 Apr 2026 12:30:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=tipi-net.de header.i=@tipi-net.de header.b="OEf1FwAT"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail.tipi-net.de (mail.tipi-net.de [194.13.80.246])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 899B538AC66;
	Fri,  3 Apr 2026 12:30:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=194.13.80.246
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775219414; cv=none; b=o5EFx3ZNWR9CkINUcoMxyJnOzPm9n0FYH9IrvDWMvKpYb9HP+T/nteatwjI49T+MDuCHTx4bEc3QZ3pKvsTviu4VFWYQNCFQ9T6cjcAe1sDGojH/otQeqXk+qQat0QuoiJBO2y4CJtjpwOnvsoDxR7ofJFr6OajFEt1QuZ0WFUA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775219414; c=relaxed/simple;
	bh=P36D0pir7MJhihtsq9xca0tJWBvWT/gFu4BIXWwSWpc=;
	h=MIME-Version:Date:From:To:Cc:Subject:In-Reply-To:References:
	 Message-ID:Content-Type; b=FrIr7WklpU2wYhDIalAwn4IeXGNyMGky1J0WHFtJvRZ0HlMB1mUeW6F7zro4bmq4Gibj5e4N3uYKoWeEWnT/A5i03l33gK/wtODt1K8Ch5ggASx1Ucep8VvJIVTJas/T7uQYKagLKo73EUBqJiloSgMJudcOpado7npLaGuzreI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tipi-net.de; spf=pass smtp.mailfrom=tipi-net.de; dkim=pass (2048-bit key) header.d=tipi-net.de header.i=@tipi-net.de header.b=OEf1FwAT; arc=none smtp.client-ip=194.13.80.246
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tipi-net.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=tipi-net.de
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 0BF1CA5842;
	Fri,  3 Apr 2026 14:30:01 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=tipi-net.de; s=dkim;
	t=1775219404; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=3IutcUR6m+dhKQLaSMXbQx2Xm49f/c8/BD6C6q4j+3w=;
	b=OEf1FwAT0ui1jtvFVZzfawOJp4udw4sxZP8qUiippSjHqU6svXuR3pcp42JIFHDTu4btkz
	jhbtExknKM8xzlNeBVUuAT24oSEai79VgwdpEkNsTAyaTqYLm33tK6SjMmklBpsvpW1RPe
	bOY316JoYyOcrXZWT2qRxsWVLeAvdX2VI6Xfor9bgufFp4/AVo8dcextHt9PJnGVoDymOk
	MJ64lU0O56GK/MHp+Dbe629FEFx6HzSjq/81Zpj3tvZfI1+kxVi3G04aWO0LcfwyOByixE
	l3OahdY7//5KsWG4loGdMezzYZkj1U8NK4b0m9XzvLFJgqkuIMvgzvReCBuOrA==
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Date: Fri, 03 Apr 2026 14:30:01 +0200
From: Nicolai Buchwitz <nb@tipi-net.de>
To: Ovidiu Panait <ovidiu.panait.rb@renesas.com>
Cc: andrew@lunn.ch, hkallweit1@gmail.com, linux@armlinux.org.uk,
 davem@davemloft.net, edumazet@google.com, kuba@kernel.org,
 pabeni@redhat.com, biju.das.jz@bp.renesas.com, netdev@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-renesas-soc@vger.kernel.org
Subject: Re: [PATCH net] net: phy: micrel: Fix MMD register access during SPD
 in ksz9131_resume()
In-Reply-To: <20260403111738.37749-1-ovidiu.panait.rb@renesas.com>
References: <20260403111738.37749-1-ovidiu.panait.rb@renesas.com>
Message-ID: <fbdabca34daf7eb4bdf3fbef1ceb95bc@tipi-net.de>
X-Sender: nb@tipi-net.de
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit
X-Last-TLS-Session-Version: TLSv1.3
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	R_DKIM_ALLOW(-0.20)[tipi-net.de:s=dkim];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	DMARC_NA(0.00)[tipi-net.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-30849-lists,linux-renesas-soc=lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[12];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_CC(0.00)[lunn.ch,gmail.com,armlinux.org.uk,davemloft.net,google.com,kernel.org,redhat.com,bp.renesas.com,vger.kernel.org];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[nb@tipi-net.de,linux-renesas-soc@vger.kernel.org];
	DKIM_TRACE(0.00)[tipi-net.de:+];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-renesas-soc];
	TO_DN_SOME(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 01E75394062
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On 3.4.2026 13:17, Ovidiu Panait wrote:
> During system suspend, phy_suspend() puts the PHY into Software 
> Power-Down
> (SPD) by setting the BMCR_PDOWN bit in MII_BMCR. According to the 
> KSZ9131
> datasheet, MMD register access is restricted during SPD:
> 
>   - Only access to the standard registers (0 through 31) is supported.
>   - Access to MMD address spaces other than MMD address space 1 is
>     possible if the spd_clock_gate_override bit is set.
>   - Access to MMD address space 1 is not possible.
> 
> However, ksz9131_resume() calls ksz9131_config_rgmii_delay() before
> kszphy_resume() clears BMCR_PDOWN. This means MMD registers are 
> accessed
> while the PHY is still in SPD, contrary to the datasheet.
> 
> Additionally, on platforms where the PHY loses power during suspend
> (e.g. RZ/G3E), all settings from ksz9131_config_init(), not just the
> RGMII delays, are lost and need to be restored. When the MAC driver
> sets mac_managed_pm (e.g. stmmac), mdio_bus_phy_resume() is skipped,
> so phy_init_hw() (which calls config_init to restore all PHY settings)
> is never invoked during resume.
> 
> Fix this by replacing the RGMII delay restoration with a call to
> phy_init_hw(), which takes the PHY out of SPD and performs full
> reinitialization.
> 
> Fixes: f25a7eaa897f ("net: phy: micrel: Add ksz9131_resume()")
> Signed-off-by: Ovidiu Panait <ovidiu.panait.rb@renesas.com>
> ---
>  drivers/net/phy/micrel.c | 9 +++++++--
>  1 file changed, 7 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/net/phy/micrel.c b/drivers/net/phy/micrel.c
> index 2aa1dedd21b8..4236dbf4ad6b 100644
> --- a/drivers/net/phy/micrel.c
> +++ b/drivers/net/phy/micrel.c
> @@ -6016,8 +6016,13 @@ static int lan8841_suspend(struct phy_device 
> *phydev)
> 
>  static int ksz9131_resume(struct phy_device *phydev)
>  {
> -	if (phydev->suspended && phy_interface_is_rgmii(phydev))
> -		ksz9131_config_rgmii_delay(phydev);
> +	int ret;
> +
> +	if (phydev->suspended) {
> +		ret = phy_init_hw(phydev);
> +		if (ret)
> +			return ret;
> +	}

Fix looks correct.

nit: phy_init_hw() already clears PDOWN, so the PDOWN clear and
1ms sleep in kszphy_resume() become redundant. But this is probably
something for a future cleanup.

> 
>  	return kszphy_resume(phydev);
>  }

Reviewed-by: Nicolai Buchwitz <nb@tipi-net.de>

