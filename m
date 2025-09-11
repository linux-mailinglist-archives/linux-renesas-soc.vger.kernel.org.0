Return-Path: <linux-renesas-soc+bounces-21756-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 3609DB52A56
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 11 Sep 2025 09:44:06 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id EF9F47B9CAC
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 11 Sep 2025 07:42:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3765A27E05E;
	Thu, 11 Sep 2025 07:43:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="woWkgeB+"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4FD4A27F018
	for <linux-renesas-soc@vger.kernel.org>; Thu, 11 Sep 2025 07:43:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.246.85.4
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757576639; cv=none; b=ScaMN42fEwnW20lUxVfLgRrEtKF5syF4ST+0qo7gwzC2KNpwHhQDTjzgU4GhnULLCLKdzmvtjjfeAZ3jEfAoyq0/M6b4QPUTc/iIxlBJgn8V+gcxbROCQddtv4Bma7E6fJL0OciSvBikmYX1jOIN8qaMWHpVQEHV35iAZ4ps5S8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757576639; c=relaxed/simple;
	bh=xSsBhd9wl9OWCIdDg1strQ4Gj08jjYdy8SaR4+qPIds=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=isCp645/y8/4m68xuBFJ9YckKDn1X//p4FjCib9at+fse9xed/vO2yKOaRhE6aNgwAW+6tA9XOK0tpBIlXvtpE9L9PV1VZSQoX4h0uuuLxhYMLePneriaAF7BI+vwHj6Aa+fTEFrKaCvni4Sv5S6TszWUOoonYnHt34U4rzeFLo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=woWkgeB+; arc=none smtp.client-ip=185.246.85.4
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id 95CCA4E40C68;
	Thu, 11 Sep 2025 07:43:54 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 67FA3606BB;
	Thu, 11 Sep 2025 07:43:54 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 3C48B102F1CED;
	Thu, 11 Sep 2025 09:43:44 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1757576633; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=3PWCgwLcwSLejuAlR8rVzGE518PeUERmFz0/d/WdfYg=;
	b=woWkgeB+8YV0vtNWYSuBaLO1uznLAH0FweMoufdjarl9/H7hrqB3ARuXISnQqwSftfbjia
	ba6R/9DrsLBkt6cN7IQ+vhxDsOCHeHO/gM+S7rAA991tLnTf7LE+/nqfuxuf4DZ++B/IOK
	sHoziFxv+3ANQM3M6aWhRrCpaDVBgAgYZdi/318/0Pf9VLenmdvqAJYa/N0ARjEGGMG836
	EJdOsQMf0xzupbUBWm5IdbqQMyHaia3O1NjkC62WgsSCBA19NyvtMW1K9jC3NVCsCrdllK
	vBJ8YvhqS6LyXcyO7NHe5rFe5kUno4TLgPoq10r4vl5VMgEwcFFSgD1VDCOuAg==
Date: Thu, 11 Sep 2025 09:43:39 +0200
From: Herve Codina <herve.codina@bootlin.com>
To: Rob Herring <robh@kernel.org>
Cc: Wolfram Sang <wsa+renesas@sang-engineering.com>, Hoan Tran
 <hoan@os.amperecomputing.com>, Linus Walleij <linus.walleij@linaro.org>,
 Bartosz Golaszewski <brgl@bgdev.pl>, Krzysztof Kozlowski
 <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Geert
 Uytterhoeven <geert+renesas@glider.be>, Magnus Damm
 <magnus.damm@gmail.com>, Saravana Kannan <saravanak@google.com>, Serge
 Semin <fancer.lancer@gmail.com>, Phil Edworthy <phil.edworthy@renesas.com>,
 linux-gpio@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-renesas-soc@vger.kernel.org, Pascal
 Eberhard <pascal.eberhard@se.com>, Miquel Raynal
 <miquel.raynal@bootlin.com>, Thomas Petazzoni
 <thomas.petazzoni@bootlin.com>
Subject: Re: [PATCH v2 2/8] dt-bindings: soc: renesas: Add the Renesas RZ/N1
 GPIO Interrupt Multiplexer
Message-ID: <20250911094339.5a70e906@bootlin.com>
In-Reply-To: <20250910143316.GA4047084-robh@kernel.org>
References: <20250909120041.154459-1-herve.codina@bootlin.com>
	<20250909120041.154459-3-herve.codina@bootlin.com>
	<20250910143316.GA4047084-robh@kernel.org>
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

Hi Rob,

On Wed, 10 Sep 2025 09:33:16 -0500
Rob Herring <robh@kernel.org> wrote:

> On Tue, Sep 09, 2025 at 02:00:33PM +0200, Herve Codina (Schneider Electric) wrote:
> > On the Renesas RZ/N1 SoC, GPIOs can generate interruptions. Those
> > interruption lines are multiplexed by the GPIO Interrupt Multiplexer in
> > order to map 32 * 3 GPIO interrupt lines to 8 GIC interrupt lines.
> > 
> > The GPIO interrupt multiplexer IP does nothing but select 8 GPIO
> > IRQ lines out of the 96 available to wire them to the GIC input lines.
> > 
> > Signed-off-by: Herve Codina (Schneider Electric) <herve.codina@bootlin.com>
> > ---
> >  .../soc/renesas/renesas,rzn1-gpioirqmux.yaml  | 86 +++++++++++++++++++
> >  1 file changed, 86 insertions(+)
> >  create mode 100644 Documentation/devicetree/bindings/soc/renesas/renesas,rzn1-gpioirqmux.yaml  
> 
> Documentation/devicetree/bindings/soc/renesas/renesas,rzn1-gpioirqmux.example.dts:42.13-45.34: Warning (interrupt_map): /example-0/interrupt-controller@51000480:interrupt-map: Missing property '#address-cells' in node /example-0/interrupt-controller, using 0 as fallback
> Documentation/devicetree/bindings/soc/renesas/renesas,rzn1-gpioirqmux.example.dts:42.13-45.34: Warning (interrupt_map): /example-0/interrupt-controller@51000480:interrupt-map: Missing property '#address-cells' in node /example-0/interrupt-controller, using 0 as fallback
> Documentation/devicetree/bindings/soc/renesas/renesas,rzn1-gpioirqmux.example.dts:42.13-45.34: Warning (interrupt_map): /example-0/interrupt-controller@51000480:interrupt-map: Missing property '#address-cells' in node /example-0/interrupt-controller, using 0 as fallback

Ok, I will add '#address-cells = <0>;' in the interrupt-controller node
available in the example.

Best regards,
Hervé

