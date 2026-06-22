Return-Path: <linux-renesas-soc+bounces-34297-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id CiTiHYQcOWoOnAcAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-34297-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 22 Jun 2026 13:29:08 +0200
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 87F046AF11D
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 22 Jun 2026 13:29:07 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=bootlin.com header.s=dkim header.b=yggJZnTi;
	spf=pass (mail.lfdr.de: domain of "linux-renesas-soc+bounces-34297-lists+linux-renesas-soc=lfdr.de@vger.kernel.org" designates 2600:3c15:e001:75::12fc:5321 as permitted sender) smtp.mailfrom="linux-renesas-soc+bounces-34297-lists+linux-renesas-soc=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=bootlin.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id B70753009F06
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 22 Jun 2026 11:28:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B08D939AD34;
	Mon, 22 Jun 2026 11:28:52 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E19A5378D71;
	Mon, 22 Jun 2026 11:28:48 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782127732; cv=none; b=kHxzYWkSAJZrEN+Y0Sp5QnSRWPDg0d3hEYtvE48H49uOhuFyPMF1OhMPcX6Z/ZnoHLfxct5J7AEMx7SSTm+qo0fTpYVxofzLXL/oKpPnw0gbc1SUPqPv15RHLNUMJ4DX6PEnSTpmd/P5Gt+YXMfbAOL061H7OuMR+1Jbl+U6rLY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782127732; c=relaxed/simple;
	bh=EBh7bwyim66ARNUOxeZ/fLln601VKjx46wurIjTp5Gs=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=s7s6Yvx2dxLYBtrId4FPLPcmKxf3aiUOzzG3Sbvr1udfFg42YgS40FUIE6jWgLjt5LWmYltKWeOlANRaqcUp4ZEW6P353X7BUzgyGYPKoAj4ujqzqNitA9j4VcCxrhMKTYukRn36xDlVGByyzkTY9iKRiRH3CA8/vEx/Me58fAo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=yggJZnTi; arc=none smtp.client-ip=185.246.85.4
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id 485034E405F3;
	Mon, 22 Jun 2026 11:28:47 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 1BEF1601BB;
	Mon, 22 Jun 2026 11:28:47 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 7CB8E106C8962;
	Mon, 22 Jun 2026 13:28:44 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1782127726; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=3ceLgsjECHaqRclrgpilz1IwveLzJRp6r0PWZEkPwj0=;
	b=yggJZnTibE0Ondxf/kuPwl8hrx3OFPOavEJUuTw2etj7kHfFUgWRie+WCLTAt1lb+oZ7Pu
	xWqZ5oF0ne5FBOwdEQ0IwLb4D2APVdfWSk5nkYrg/jbOg5dV/Pnv8naFpDGGZv6tFhbm93
	imvNYGRciHw28mNad2u1lRo4F5sXeYXoL1blKl/jNjqLZatpuGmrAyvpBkllKBFbKuXmk2
	K2cxBCmSF2MDIpFjiUsvYfBInGW6A8FE33JoTSWZzB1U4+gF4FRhOaRiL4JnF9yBiEMI7E
	qYAS3PubdDiZJR3sYp9slRO3UPZ0bjsfbRHU4u0iZkku++pCRbuG1bewEkQZog==
Date: Mon, 22 Jun 2026 13:28:42 +0200
From: Herve Codina <herve.codina@bootlin.com>
To: Wolfram Sang <wsa+renesas@sang-engineering.com>
Cc: linux-renesas-soc@vger.kernel.org, Conor Dooley <conor+dt@kernel.org>,
 devicetree@vger.kernel.org, Geert Uytterhoeven <geert+renesas@glider.be>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Magnus Damm
 <magnus.damm@gmail.com>, Rob Herring <robh@kernel.org>
Subject: Re: [PATCH v2 0/2] ARM: dts: renesas: r9a06g032-rzn1d400-eb: Enable
 SPI and FRAM
Message-ID: <20260622132842.7e0d772c@bootlin.com>
In-Reply-To: <20260615125355.116027-1-wsa+renesas@sang-engineering.com>
References: <20260615125355.116027-1-wsa+renesas@sang-engineering.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.4.0 (GTK 3.24.52; x86_64-redhat-linux-gnu)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Last-TLS-Session-Version: TLSv1.3
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[bootlin.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	R_DKIM_ALLOW(-0.20)[bootlin.com:s=dkim];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-34297-lists,linux-renesas-soc=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_CC(0.00)[vger.kernel.org,kernel.org,glider.be,gmail.com];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER(0.00)[herve.codina@bootlin.com,linux-renesas-soc@vger.kernel.org];
	TO_DN_SOME(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:wsa+renesas@sang-engineering.com,m:linux-renesas-soc@vger.kernel.org,m:conor+dt@kernel.org,m:devicetree@vger.kernel.org,m:geert+renesas@glider.be,m:krzk+dt@kernel.org,m:magnus.damm@gmail.com,m:robh@kernel.org,m:wsa@sang-engineering.com,m:conor@kernel.org,m:geert@glider.be,m:krzk@kernel.org,m:magnusdamm@gmail.com,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	HAS_ORG_HEADER(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	DKIM_TRACE(0.00)[bootlin.com:+];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	RCVD_COUNT_FIVE(0.00)[6];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[herve.codina@bootlin.com,linux-renesas-soc@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	RCPT_COUNT_SEVEN(0.00)[8];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-renesas-soc,renesas,dt];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sin.lore.kernel.org:rdns,sin.lore.kernel.org:helo,vger.kernel.org:from_smtp,sang-engineering.com:email,bootlin.com:dkim,bootlin.com:mid,bootlin.com:from_mime]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 87F046AF11D

Hi Wolfram,

On Mon, 15 Jun 2026 14:53:52 +0200
Wolfram Sang <wsa+renesas@sang-engineering.com> wrote:

> Here are the patches to enable the SPI-FRAM with FIFO (no DMA yet, needs
> more work) on the RZ/N1D Extension board.
> 
> Changes since v1 in the individual patches.
> 
> Wolfram Sang (2):
>   ARM: dts: renesas: r9a06g032: Describe SPI controllers
>   ARM: dts: renesas: r9a06g032-rzn1d400-eb: Enable SPI-FRAM
> 
>  .../dts/renesas/r9a06g032-rzn1d400-eb.dts     | 25 ++++++
>  arch/arm/boot/dts/renesas/r9a06g032.dtsi      | 84 +++++++++++++++++++
>  2 files changed, 109 insertions(+)
> 

The 'make CHECK_DTBS=1 renesas/r9a06g032-rzn1d400-eb.dtb' command reports
the following:
   spi@50005000 (renesas,r9a06g032-spi): Unevaluated properties are not allowed ('power-domains' was unexpected)
      from schema $id: http://devicetree.org/schemas/spi/snps,dw-apb-ssi.yaml

IMHO, 'power-domains' property has to be added in the snps,dw-apb-ssi.yaml binding.

Other than that, your modification works on my custom RZN1 board.

Best regards,
Hervé

