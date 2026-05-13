Return-Path: <linux-renesas-soc+bounces-32559-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id wCHqLqEmBGqDEwIAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-32559-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 13 May 2026 09:22:09 +0200
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 41CA352E8AE
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 13 May 2026 09:22:08 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 7B9B930CE8F8
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 13 May 2026 07:20:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8F0C73D7D99;
	Wed, 13 May 2026 07:20:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="UeqzWDBD"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 67E833D567F;
	Wed, 13 May 2026 07:20:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778656818; cv=none; b=T8q61Fu2sElviQYKcgTafsNUbI1w5+4O8yjfeJFu1o2qa0vbp85j0IraHO26bVcjELNUMecuv2r9tmS281ACUFZqnE6UBgSz8rWdzqV6ho/elVSCYjWTQP2kIyoJEwXnorqWzdBK5vVXFXHicxc6IbIUEzlFuH6koYte+6w5+rk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778656818; c=relaxed/simple;
	bh=IZC58uKnwZDOpHbW9eAHW46rxtkXxkQRHztEtG6TFdw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=oGVXEDs+TfSg1QX7FMOswBzyV0cWjs5J7I3C1s32+bJE1bJCyjJpeHT73lgrJmGrLVNWmgiGxWkuAJEbIa9zaubzqXQa9afbj1dzaUZME5zqc/Mt25eAItUyWBK09HdsLYs+9APnyV3Gu8Zwba72tASjAXsjgF4TEodMjIeQp9s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=UeqzWDBD; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 988B6C2BCB7;
	Wed, 13 May 2026 07:20:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1778656818;
	bh=IZC58uKnwZDOpHbW9eAHW46rxtkXxkQRHztEtG6TFdw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=UeqzWDBD200D0E+7cWQ3ItPGbmCACk6cc388fKQYM6SpkFcVR1e8ZNTJgWXUPhMmX
	 l3NYLvHnKckuDA+dhS61j8Su067jIKnk8isBYPN3qNxv21Bamz2d6hlYALks8iqN75
	 wKTyPTttdTlnZVLdii+WgJsejlUHYdfTeMa6bo2x/1nW2YttqBQUjcEh7iqVZ5aA+T
	 QR5S1YiO60Mb99Nl3pftTrEhk5BuUzdZNTZdSNOcWRbgAevxypH39Bh32rcscHovtk
	 ug93xrUEKct4PDJxwRDjzPG5QW1eBAzX5stvC9Wn/HGg5ftwandsAhq/qAW9o6/MGJ
	 0UgKqu9mpLspA==
Received: by pali.im (Postfix)
	id BA3B5BA0; Wed, 13 May 2026 09:20:08 +0200 (CEST)
Date: Wed, 13 May 2026 09:20:08 +0200
From: Pali =?utf-8?B?Um9ow6Fy?= <pali@kernel.org>
To: Hans Zhang <18255117159@163.com>
Cc: bhelgaas@google.com, lpieralisi@kernel.org, kwilczynski@kernel.org,
	mani@kernel.org, vigneshr@ti.com, jingoohan1@gmail.com,
	thomas.petazzoni@bootlin.com, ryder.lee@mediatek.com,
	jianjun.wang@mediatek.com, claudiu.beznea.uj@bp.renesas.com,
	mpillai@cadence.com, robh@kernel.org, s-vadapalli@ti.com,
	linux-omap@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	linux-renesas-soc@vger.kernel.org, linux-pci@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 6/8] PCI: aardvark: Add 100 ms delay after link
 training
Message-ID: <20260513072008.vol4htgbzquly2rb@pali>
References: <20260506152346.166056-1-18255117159@163.com>
 <20260506152346.166056-7-18255117159@163.com>
 <20260512212531.jupoocz7acv22qyg@pali>
 <581e91fb-2e57-43ed-b79d-19dbf384b955@163.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <581e91fb-2e57-43ed-b79d-19dbf384b955@163.com>
User-Agent: NeoMutt/20180716
X-Rspamd-Queue-Id: 41CA352E8AE
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [2.34 / 15.00];
	MID_END_EQ_FROM_USER_PART(4.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	MID_RHS_NOT_FQDN(0.50)[];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-32559-lists,linux-renesas-soc=lfdr.de];
	FREEMAIL_TO(0.00)[163.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_CC(0.00)[google.com,kernel.org,ti.com,gmail.com,bootlin.com,mediatek.com,bp.renesas.com,cadence.com,vger.kernel.org,lists.infradead.org];
	RCPT_COUNT_TWELVE(0.00)[20];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[pali@kernel.org,linux-renesas-soc@vger.kernel.org];
	DKIM_TRACE(0.00)[kernel.org:+];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-renesas-soc];
	TO_DN_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[linutronix.de:email,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns]
X-Rspamd-Action: no action

On Wednesday 13 May 2026 15:00:04 Hans Zhang wrote:
> 
> 
> On 5/13/26 05:25, Pali Rohár wrote:
> > On Wednesday 06 May 2026 23:23:44 Hans Zhang wrote:
> > > The Aardvark PCIe controller driver waits for the link to come up but
> > > does not implement the mandatory 100 ms delay after link training
> > > completes for speeds greater than 5.0 GT/s (PCIe r6.0 sec 6.6.1).
> > > 
> > > The driver already maintains a 'link_gen' field that holds the negotiated
> > > link speed. Use it together with pcie_wait_after_link_train() to insert
> > > the required delay immediately after confirming that the link is up.
> > > 
> > > Signed-off-by: Hans Zhang <18255117159@163.com>
> > > ---
> > >   drivers/pci/controller/pci-aardvark.c | 4 +++-
> > >   1 file changed, 3 insertions(+), 1 deletion(-)
> > > 
> > > diff --git a/drivers/pci/controller/pci-aardvark.c b/drivers/pci/controller/pci-aardvark.c
> > > index e34bea1ff0ac..526351c21c49 100644
> > > --- a/drivers/pci/controller/pci-aardvark.c
> > > +++ b/drivers/pci/controller/pci-aardvark.c
> > > @@ -350,8 +350,10 @@ static int advk_pcie_wait_for_link(struct advk_pcie *pcie)
> > >   	/* check if the link is up or not */
> > >   	for (retries = 0; retries < LINK_WAIT_MAX_RETRIES; retries++) {
> > > -		if (advk_pcie_link_up(pcie))
> > > +		if (advk_pcie_link_up(pcie)) {
> > > +			pcie_wait_after_link_train(pcie->link_gen);
> > >   			return 0;
> > > +		}
> > >   		usleep_range(LINK_WAIT_USLEEP_MIN, LINK_WAIT_USLEEP_MAX);
> > >   	}
> > > -- 
> > > 2.34.1
> > > 
> > 
> > Are you sure that this is correct to do? Have you checked the A3720
> > Functional Specification which describes how to bring PCIe link up?
> > 
> > A3720 PCIe controller is buggy and needs more timing hacks to make it
> > behave. Playing with random sleeps can break its internal logic.
> > I'm not sure if it could be safe without proper testing.
> > 
> > And IIRC A3720 PCIe controller is just PCIe2.0 with 5 GT/s.
> 
> 
> Hi Pali,
> 
> 1. This driver does not support A3720.
> 
> static const struct of_device_id advk_pcie_of_match_table[] = {
> 	{ .compatible = "marvell,armada-3700-pcie", },
> 	{},
> };
> MODULE_DEVICE_TABLE(of, advk_pcie_of_match_table);
> 
> If you need support for A3720, please submit the corresponding patch so that
> Bjorn and Mani can review it.

3700 (or 37xx) is family and covers both a3710 and a3720. In most cases is the
a3720 dominant and hence identifiers 3700 and 3720 are begin mixed.

> 
> 2. If A3720 only supports GEN2, you can configure "max-link-speed" to be 2
> in the DT. This will not affect the functionality of this patch.

Whole A37xx supports only GEN2. And in DT files for 37xx should be
already there max-link-speed.

Seems that in advk_pcie_of_match_table there is no GEN3 device
specified.

> 3. This patch is a common delay requirement stipulated by the PCIe
> specification. If it is greater than GEN2, then msleep(100) will be added;
> otherwise, there will be no such delay.
> 
> 4. For instance, we often come across the situation where some common APIs
> are modified, and in many cases, their functionality does not require the
> actual development board for verification. I believe that many other
> developers and maintainers have modified different parts of the code. For
> example, the recent submission:

Switching one API to another is one thing. But changing code which looks
to be critical, specially when it is known that hw has bugs, can cause
breaking of existing boards.

> commit 750277048afe7ce8ebfc0b120de7dfbc745058a7
> Author: Nam Cao <namcao@linutronix.de>
> Date:   Thu Jun 26 16:47:53 2025 +0200
> 
>     PCI: aardvark: Switch to msi_create_parent_irq_domain()
> 
>     Switch to msi_create_parent_irq_domain() from
> pci_msi_create_irq_domain()
>     which was using legacy MSI domain setup.
> 
> 
> And many controller drivers have been modified.
> 
> 
> Best regards,
> Hans
> 
> 

