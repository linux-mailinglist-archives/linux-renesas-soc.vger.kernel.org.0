Return-Path: <linux-renesas-soc+bounces-32451-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id sCRECvLUAmpSyAEAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-32451-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 12 May 2026 09:21:22 +0200
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id B6FFE51BB8D
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 12 May 2026 09:21:21 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 73E6030A7BBB
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 12 May 2026 07:14:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1E293379C55;
	Tue, 12 May 2026 07:14:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="MDnAZVaz"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2600A47B42C;
	Tue, 12 May 2026 07:14:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778570054; cv=none; b=Tj4Kb4Dpp5MSVCqfSCHARCkFRMhiKOQVJxXv6q5edGyrzWIqYoBr8WL/Kl09zaVkDDHUkqo5ap8d2xrdEmjBDI9zjczBKyeb1adDl4+m7RxYOQqE0rgzVyO6veCwzJFUi/L6sO2M/cDls14HHqoL0q+dtuDx7//VG5Vx1Vv7I7k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778570054; c=relaxed/simple;
	bh=g1gkbUsnWSdMZI7g7vFCqTGaKHg+bWKWO9fa+1v1mR0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Gx1lYZES5kK8/TBnPu8xn5dWF30Y6OIBhMVVEArkHTi83DfWDmqkLixZJxR/mHLGD21MiusuVjpWaj9+3/bZMsSnTKqt9Gmii1qr8swjcynXdYKJtIt/k4XuIquz56gIGGS0ALthxMqiSzASKvisHX2voszHUJdKsjgRmmU3Abs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=MDnAZVaz; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5AD69C2BCB0;
	Tue, 12 May 2026 07:14:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1778570052;
	bh=g1gkbUsnWSdMZI7g7vFCqTGaKHg+bWKWO9fa+1v1mR0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=MDnAZVazU1CPPk/nR7LPIrHfBHawgO8KnJnNyWNW1GvJ8DytEDFjlYXLsLSA83jBF
	 tWosRUCbAF44OkS9wcWhOR0ypjISXSJ6hsaRMwZpj36T1uSCct8VCUZ2Txya5OVjVJ
	 Ks3HxzT02BxSkQaq0N31sIF1AP9w4d+XOSZk0t3ZGMO4EDFwBfQ56wZRTD7FaVCA3h
	 eWhUqUqRpFFSt0buIk745fgfSWhO4H42PTmBg41AI7YlDuyxYVLHtd3DFE/UXVKNnF
	 AyktHd+C2E6JezY3FEEpzmR3pXHFIVRaRLgWtz83ulBiv3SMbLwM9ch/pREkmCmuER
	 7D4WxzB4wl/Jg==
Date: Tue, 12 May 2026 16:14:10 +0900
From: Krzysztof =?utf-8?Q?Wilczy=C5=84ski?= <kwilczynski@kernel.org>
To: Hans Zhang <18255117159@163.com>
Cc: bhelgaas@google.com, lpieralisi@kernel.org, mani@kernel.org, 
	vigneshr@ti.com, jingoohan1@gmail.com, thomas.petazzoni@bootlin.com, 
	pali@kernel.org, ryder.lee@mediatek.com, claudiu.beznea.uj@bp.renesas.com, 
	mpillai@cadence.com, robh@kernel.org, s-vadapalli@ti.com, linux-omap@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, claudiu.beznea@tuxon.dev, linux-mediatek@lists.infradead.org, 
	linux-renesas-soc@vger.kernel.org, linux-pci@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 4/7] PCI: dwc: Use common
 pci_host_common_link_train_delay() helper
Message-ID: <20260512071328.GA3606279@rocinante>
References: <20260511055923.37117-1-18255117159@163.com>
 <20260511055923.37117-5-18255117159@163.com>
 <20260511070139.GA1096586@rocinante>
 <e600d0a4-b93e-425f-a5f1-c76802c65622@163.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <e600d0a4-b93e-425f-a5f1-c76802c65622@163.com>
X-Rspamd-Queue-Id: B6FFE51BB8D
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-32451-lists,linux-renesas-soc=lfdr.de];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_TO(0.00)[163.com];
	RCPT_COUNT_TWELVE(0.00)[20];
	RCVD_COUNT_THREE(0.00)[4];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_CC(0.00)[google.com,kernel.org,ti.com,gmail.com,bootlin.com,mediatek.com,bp.renesas.com,cadence.com,vger.kernel.org,lists.infradead.org,tuxon.dev];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[kwilczynski@kernel.org,linux-renesas-soc@vger.kernel.org];
	DKIM_TRACE(0.00)[kernel.org:+];
	TAGGED_RCPT(0.00)[linux-renesas-soc];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Action: no action

Hello,

> > > -	/*
> > > -	 * As per PCIe r6.0, sec 6.6.1, a Downstream Port that supports Link
> > > -	 * speeds greater than 5.0 GT/s, software must wait a minimum of 100 ms
> > > -	 * after Link training completes before sending a Configuration Request.
> > > -	 */
> > > -	if (pci->max_link_speed > 2)
> > > -		msleep(PCIE_RESET_CONFIG_WAIT_MS);
> > > +	pci_host_common_link_train_delay(pci->max_link_speed);
> > 
> > This comment could move to the helper you added.
> 
> Hi Krzysztof,
> 
> Will add.

No need.  Per Mani's feedback about macro being well documented.

Thank you nonetheless!

	Krzysztof

