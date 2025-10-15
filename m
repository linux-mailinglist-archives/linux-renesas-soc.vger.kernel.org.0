Return-Path: <linux-renesas-soc+bounces-23050-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [142.0.200.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 4AB6DBDDD49
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 15 Oct 2025 11:42:24 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 2B4C74EC163
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 15 Oct 2025 09:41:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D033B319850;
	Wed, 15 Oct 2025 09:41:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="D2PIHTdX"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7F0403128C0;
	Wed, 15 Oct 2025 09:41:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.246.84.56
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760521303; cv=none; b=QzUgcpM72IO+hLyCZJgTm14IJQQLR5KJoIYFiCCE6T7D+G+FJ1jM1TLnM/H5nCUIWC2f/Kd90PGRhCm55fVkUJVP071HqbJ+b/1WsoBExlN08ynvPsJ78VNqC0iNwHLoJtl4x5mZifX4z5DaBOQNYbTEVXZKUlx6UDc02VMNdIo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760521303; c=relaxed/simple;
	bh=5YzxXCYObJKOXfwxRNxk+wo7CJS2/C6bXiLRNvc0AyY=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=HYhNwHcaElMfqsAH8gsQQqegvVDitxNJ95a/k98Q7cdLO6bLOpXTRjVPkyko2ODBZRwSzJPsweTL4THY0523XFUOgtWxRogb1rWrJec8dhpw64D4vKIw4BkzyIElj2ajb/2C1R85/SY/LreRZwH4XM1OUo7EeEGhpvE9Rgo9LL0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=D2PIHTdX; arc=none smtp.client-ip=185.246.84.56
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id BDB151A13B7;
	Wed, 15 Oct 2025 09:41:39 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 91505606F9;
	Wed, 15 Oct 2025 09:41:39 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 228E7102F22B3;
	Wed, 15 Oct 2025 11:41:27 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1760521298; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=Urj62ugiM4MPFeNQ8KRlo+atG/UL8MNqNf3RQefG98s=;
	b=D2PIHTdXlLnuTkFHWEiRapTiyQLldZDNrbdspT58WG6dTsSF/DUs3mapyEJIFOgK5L2Ier
	f/qsS4b2Cxj9Z7iw3LfKatY+0e+ugX5+j4Rv2WiAkDRQVPCcHnkrbR9stFffHNhlHT5b+u
	J9CPpKyDUcAK0m08LKRdrzWWhxzT+hzaXMjm8JvOVKp5vkhKc6M1c6pl6KljzF5EtkZiiZ
	GbEZcbnX5JfFVi8B/4g8SmZGIrXPPPlp93hczpsUhPz1JpyTtghgpQFuwCEw1p033RADyW
	lByP02OYa/wf8sZTufsTVgOXJq2gwiaVGg2Uf4zHdkjw9F/rEUrpfEHTB+Sr2Q==
Date: Wed, 15 Oct 2025 11:41:26 +0200
From: Herve Codina <herve.codina@bootlin.com>
To: Wolfram Sang <wsa+renesas@sang-engineering.com>
Cc: Thomas Gleixner <tglx@linutronix.de>, Hoan Tran
 <hoan@os.amperecomputing.com>, Linus Walleij <linus.walleij@linaro.org>,
 Bartosz Golaszewski <brgl@bgdev.pl>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Geert Uytterhoeven <geert+renesas@glider.be>, Magnus
 Damm <magnus.damm@gmail.com>, Saravana Kannan <saravanak@google.com>, Serge
 Semin <fancer.lancer@gmail.com>, Phil Edworthy <phil.edworthy@renesas.com>,
 linux-gpio@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-renesas-soc@vger.kernel.org, Pascal
 Eberhard <pascal.eberhard@se.com>, Miquel Raynal
 <miquel.raynal@bootlin.com>, Thomas Petazzoni
 <thomas.petazzoni@bootlin.com>
Subject: Re: [PATCH v4 8/8] ARM: dts: r9a06g032: Add support for GPIO
 interrupts
Message-ID: <20251015114126.4df207b1@bootlin.com>
In-Reply-To: <aNRnOFTvaThW-CJE@shikoro>
References: <20250922152640.154092-1-herve.codina@bootlin.com>
	<20250922152640.154092-9-herve.codina@bootlin.com>
	<aNRnOFTvaThW-CJE@shikoro>
Organization: Bootlin
X-Mailer: Claws Mail 4.3.1 (GTK 3.24.43; x86_64-redhat-linux-gnu)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Last-TLS-Session-Version: TLSv1.3

Hi Wolfram,

On Wed, 24 Sep 2025 23:48:40 +0200
Wolfram Sang <wsa+renesas@sang-engineering.com> wrote:

> > +			/*
> > +			 * interrupt-map has to be updated according to GPIO
> > +			 * usage. The src irq (0 field) has to be updated with
> > +			 * the needed GPIO interrupt number.
> > +			 * More items can be added (up to 8). Those items must
> > +			 * define one GIC interrupt line among 103 to 110.
> > +			 */
> > +			interrupt-map = <0 &gic GIC_SPI 103 IRQ_TYPE_LEVEL_HIGH>;  
> 
> Okay, so my main concern here was that we setup some "random" default
> mapping for each board. Which is not true because this node is disabled
> by default. So, maybe we could rephrase the paragraph like
> 
> /*
>  * Example mapping entry. Board DTs need to overwrite 'interrupt-map'
>  * with their specific mapping. Check the irqmux binding documentation
>  * for details.
>  */

Will be updated in next iteration.

> 
> ? I will see if I can provide a useful board addition for the DB400
> boards...
> 

Best regards,
Hervé

