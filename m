Return-Path: <linux-renesas-soc+bounces-29177-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id Hi3DNS0asWmOqwIAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-29177-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 11 Mar 2026 08:30:53 +0100
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id D77CA25DFB0
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 11 Mar 2026 08:30:52 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 1628730215C9
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 11 Mar 2026 07:30:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2706D3AB274;
	Wed, 11 Mar 2026 07:30:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="YryfbcoE"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 80A0B3A4F37;
	Wed, 11 Mar 2026 07:30:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.246.85.4
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773214237; cv=none; b=a0vEdNHqyZ+oWYP0hEu6idnh/HGZlyXjpd3nsa/lT9bsHRaOmlxTxQ8ssyFbOPOL5ReRaofuojG+Z3XPJ6RMY5jEPi8OlKLp6cQIAmykqb4A9bj4+IHDpJwTJrm4+r9P8KF9CzaX7sdr77V9gQypcLxEszydcUNa1aSczO8Oq5g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773214237; c=relaxed/simple;
	bh=1Sd0VWOjM6PGSPm+IapYNlwmN9tjZURccOsIrRd9GoE=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=UDT7O/7s0TTEUriEwLepEiTnHNCtHdoMGPH8pzoDw/ikbs9A/m1Ou1aeLKq3XF8CQe9bbe96nxI3GNLdqPmWY9EHG7xoGOSaWDznCsstw4/haFZD/mbsLdXLBvN9TIiHrP5HZMFpD34xqdvahbKWSWG2bD4V4mrsYVZgwXYLjXA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=YryfbcoE; arc=none smtp.client-ip=185.246.85.4
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id 863914E42612;
	Wed, 11 Mar 2026 07:30:27 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 43F7760004;
	Wed, 11 Mar 2026 07:30:27 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id E1D3D10369BAB;
	Wed, 11 Mar 2026 08:30:22 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1773214226; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=96ndDlrEVuFbKyRENpkc+L44s2CXLahk3tC4R76W78o=;
	b=YryfbcoEhH5KEo3EqBHStK6Mb2DT/gieka9d/Ta9sBvoErT8OC8L4LPh3VnWoBKTZitusu
	mpCnPzD/Sd8k4Ii5iIqiTxideYMCp5/WxM4dzM/GDka6hi7YjtqZ1xehmvi1R6PDD7JWs/
	9FP936cum59H9KGqrNjNfEAeAYCzlOmxs9cV6V2cb+BPW0MKCiFZwpHRB03NrjcSeFw/wu
	JGiaDAJpMXNP0vQZ1gxeCnH+NbaoZUcYxIY5fq55Dqld471dM2MDHD9KMGJk7faW0vpkPu
	Ib1VV13+aO9PSw2sxj+eix7lbEKJyoR0nVhuhXrYYcBzkV+VPjyyKwORlmGdOQ==
Date: Wed, 11 Mar 2026 08:30:21 +0100
From: Herve Codina <herve.codina@bootlin.com>
To: Wolfram Sang <wsa+renesas@sang-engineering.com>
Cc: Geert Uytterhoeven <geert+renesas@glider.be>, Magnus Damm
 <magnus.damm@gmail.com>, Rob Herring <robh@kernel.org>, Krzysztof Kozlowski
 <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>,
 linux-renesas-soc@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, Pascal Eberhard <pascal.eberhard@se.com>,
 Miquel Raynal <miquel.raynal@bootlin.com>, Thomas Petazzoni
 <thomas.petazzoni@bootlin.com>
Subject: Re: [PATCH] ARM: dts: r9a06g032: Add #address-cells in the GIC node
Message-ID: <20260311083021.259ffc9d@bootlin.com>
In-Reply-To: <abCWATS9MiRhcqlM@shikoro>
References: <20260303102029.147359-1-herve.codina@bootlin.com>
	<abCWATS9MiRhcqlM@shikoro>
Organization: Bootlin
X-Mailer: Claws Mail 4.3.1 (GTK 3.24.49; x86_64-redhat-linux-gnu)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Last-TLS-Session-Version: TLSv1.3
X-Rspamd-Queue-Id: D77CA25DFB0
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[bootlin.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	R_DKIM_ALLOW(-0.20)[bootlin.com:s=dkim];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[glider.be,gmail.com,kernel.org,vger.kernel.org,se.com,bootlin.com];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[12];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	TAGGED_FROM(0.00)[bounces-29177-lists,linux-renesas-soc=lfdr.de];
	HAS_ORG_HEADER(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	DKIM_TRACE(0.00)[bootlin.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	RCVD_COUNT_FIVE(0.00)[6];
	FROM_NEQ_ENVFROM(0.00)[herve.codina@bootlin.com,linux-renesas-soc@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	DBL_PROHIBIT(0.00)[2.98.207.48:email];
	MID_RHS_MATCH_FROM(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-renesas-soc,renesas,dt];
	DBL_BLOCKED_OPENRESOLVER(0.00)[3.10.52.160:email,sin.lore.kernel.org:rdns,sin.lore.kernel.org:helo,2.160.237.136:email,sang-engineering.com:email]
X-Rspamd-Action: no action

Hi Wolfram,

On Tue, 10 Mar 2026 23:06:57 +0100
Wolfram Sang <wsa+renesas@sang-engineering.com> wrote:

> On Tue, Mar 03, 2026 at 11:20:29AM +0100, Herve Codina (Schneider Electric) wrote:
> > When checking dts involving the r9a06g032.dtsi file, the following kind
> > of warnings are reported:
> >    Missing property '#address-cells' in node xxx, using 0 as fallback
> > 
> > Indeed, #address-cells is not present in the GIC interrupt controller
> > node.
> > 
> > Fix it adding the missing property.
> > 
> > No functional change.
> > 
> > Signed-off-by: Herve Codina (Schneider Electric) <herve.codina@bootlin.com>  
> 
> How did you trigger this? It doesn't show up with the upstream DTs for
> N1D. Can you share the snippet which causes the problem for you?
> 

I compiled the dtb with W=1 and CHECK_DTBS=1

$ touch arch/arm/boot/dts/renesas/r9a06g032-rzn1d400-eb.dts
$ make ARCH=arm CROSS_COMPILE=... W=1 CHECK_DTBS=1 renesas/r9a06g032-rzn1d400-eb.dtb
  DTC [C] arch/arm/boot/dts/renesas/r9a06g032-rzn1d400-eb.dtb
arch/arm/boot/dts/renesas/r9a06g032.dtsi:156.4-158.33: Warning (interrupt_map): /soc/pci@40030000:interrupt-map: Missing property '#address-cells' in node /soc/interrupt-controller@44101000, using 0 as fallback
arch/arm/boot/dts/renesas/r9a06g032.dtsi:156.4-158.33: Warning (interrupt_map): /soc/pci@40030000:interrupt-map: Missing property '#address-cells' in node /soc/interrupt-controller@44101000, using 0 as fallback
arch/arm/boot/dts/renesas/r9a06g032.dtsi:156.4-158.33: Warning (interrupt_map): /soc/pci@40030000:interrupt-map: Missing property '#address-cells' in node /soc/interrupt-controller@44101000, using 0 as fallback
arch/arm/boot/dts/renesas/r9a06g032.dtsi:672.4-37: Warning (interrupt_map): /soc/interrupt-controller@51000480:interrupt-map: Missing property '#address-cells' in node /soc/interrupt-controller@44101000, using 0 as fallback
$

Best regards,
Hervé

