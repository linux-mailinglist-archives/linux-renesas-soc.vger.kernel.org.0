Return-Path: <linux-renesas-soc+bounces-30440-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id qDDbCpXBxmm8OQUAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-30440-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 27 Mar 2026 18:42:45 +0100
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 82E77348894
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 27 Mar 2026 18:42:44 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 34435305BBDA
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 27 Mar 2026 17:36:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 13FBE3FB044;
	Fri, 27 Mar 2026 17:36:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="t1Tv35kD"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E564212B93;
	Fri, 27 Mar 2026 17:36:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774633015; cv=none; b=RbtqLCVFVJM4uJ0Ngbij39IeXfX1qGuMd4FHdqF8oPtdoXkrFDPKpbrEV1IEzG8hp4gDpP25wB8D0hv3w0uJ/twQqt3MxmqGtaXhwsiMM3WPhZSYhPaZHfOi8XMupoNbtGbX24ERvrKruc3jn+NYdIH+2NRnQaBnBEW3GUFMF4o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774633015; c=relaxed/simple;
	bh=ThE33YvTtR5XRmErtYNSoLQ86Ni0iXf8og4Ha07NAu8=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=CGuuxj0l/L4y9WierJgmLQudVND+hc8RMdSFCGkt45MJsfh/BVEWDEUnLGOwI4agxR9728jzoEqbU/XLWvNgTQtYL62Ie47lpwsnoXpjqbYMRqYT+x/5w51Wa4kR8Mt2sy8iB2DVp0Vo6R8QvcRrFjf1lHza4iRkoaNC12tRw9w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=t1Tv35kD; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EE443C19423;
	Fri, 27 Mar 2026 17:36:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1774633014;
	bh=ThE33YvTtR5XRmErtYNSoLQ86Ni0iXf8og4Ha07NAu8=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=t1Tv35kDTag8Fax10uEk56f8KFHfzMAgsXj/8B04YRO/+bR+rlipQ5Grhz5PKz6Fp
	 HBMkuZfhfDhjbGS0my7LngKHeJ36pa26rB9NAPyVbx84gkxHeqK0ii8fhh5kFlEab8
	 ZV2fRZX0A/XH4zbUKKJa6Xw8sqvIE1Ux4ZnzpBIIlTvopl/d1o0gXLT0h69Z2WSXkJ
	 fou6KcIgT1pol8R8ZiF9LvW7LKX4vTLB+gdOl/1FPeWxfG+E19JptvX0aGYa288D5o
	 o2Ys6kNLXDN7MH7qT5Ipy3LyE4/7F82dylRehu0h3ItltSO/18BL0eoVAV4/lR1eWW
	 zR3rGlXuqftww==
Date: Fri, 27 Mar 2026 10:36:50 -0700
From: Jakub Kicinski <kuba@kernel.org>
To: Michael Dege <michael.dege@renesas.com>
Cc: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>, Andrew Lunn
 <andrew+netdev@lunn.ch>, "David S. Miller" <davem@davemloft.net>, Eric
 Dumazet <edumazet@google.com>, Paolo Abeni <pabeni@redhat.com>,
 netdev@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
 linux-kernel@vger.kernel.org
Subject: Re: [net-next PATCH v2 00/13] net: renesas: rswitch: R-Car S4 add
 VLAN aware switching
Message-ID: <20260327103650.7d483c03@kernel.org>
In-Reply-To: <20260327-rswitch_add_vlans-v2-0-d7f4358ca57a@renesas.com>
References: <20260327-rswitch_add_vlans-v2-0-d7f4358ca57a@renesas.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-30440-lists,linux-renesas-soc=lfdr.de];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[kernel.org:+];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[kuba@kernel.org,linux-renesas-soc@vger.kernel.org];
	MISSING_XM_UA(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linux-renesas-soc,netdev];
	RCPT_COUNT_SEVEN(0.00)[9];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 82E77348894
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Fri, 27 Mar 2026 09:27:30 +0100 Michael Dege wrote:
> Hello!
> 
> The current R-Car S4 rswitch driver only supports basic HW offloading
> for L2 switching/bridgeing. This patchset extends the driver with
> support for VLAN aware switching.
> 
> 1. For every port mode change from configuration to operation and
>    vice-versa you need to change to disabled mode first. The
>    functions rswitch_<port>_change_mode now take care of this. 
> 
> 2. In upcomming changes for adding vlan support struct net_device
>    will not be available in all cases, therefore use struct device
>    instead.
> 
> 3. Fix typo in register define macro and remove duplicate macro.
> 
> 4. Add register definitions needed fo vlan support.
> 
> 5. Add exception path for packets with unknown destitination MAC
>    addresses.
> 
> 6. Make the helper functions rswitch_reg_wait(),
>    rswitch_etha_change_mode() and rswitch_etha_change_mode()
>    available to the whole driver.
> 
> 7. Add basic start-up time initialization needed to support VLANs.
> 
> 8. Update ETHA and GWCA port HW initializations.
> 
> 9. Clean up is_rdev() rswitch_device checking.
> 
> 10. Provide struct rswitch_private to notifiers.
> 
> 11. Add handler for FDB notifications to configure bridge MAC address
>     to GWCA registers and update static MAC table entry.
> 
> 12. Add vlan support to L2 HW bridge.

coccicheck reports:

drivers/net/ethernet/renesas/rswitch_main.c:1590:11-66: duplicated argument to & or |
@@ -182,0 +184,3 @@
drivers/net/ethernet/renesas/rswitch_l2.c:350:5-8: WARNING: Unsigned expression compared with zero: err < 0
drivers/net/ethernet/renesas/rswitch_l2.c:380:5-8: WARNING: Unsigned expression compared with zero: err < 0
drivers/net/ethernet/renesas/rswitch_l2.c:465:5-8: WARNING: Unsigned expression compared with zero: err < 0

reminder: please do not post a new version of patches on netdev earlier
than a full 24h after previous posting.

