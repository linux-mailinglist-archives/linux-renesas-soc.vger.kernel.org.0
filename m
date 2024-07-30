Return-Path: <linux-renesas-soc+bounces-7639-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 88C169416E8
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 30 Jul 2024 18:05:10 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 438CC286EF6
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 30 Jul 2024 16:05:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CF53E183CDA;
	Tue, 30 Jul 2024 16:04:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="T8JtWway"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9BE1C183CBF;
	Tue, 30 Jul 2024 16:04:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722355479; cv=none; b=UHB8Hzh9JaBV41Eezjw3xyCNw8Q/zEjhndWxsftQdthgtKI0fMEwtUafF+Z3ZwQdYQgmw4lhn1UhrCNDZEREAimeel895CwDb04gWBB8zD+dX3JVv73FEvLdE2xX+2/IGm36rN8aV5yUisdTZqIdTQt+y6ZEoidHfuizd1exZck=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722355479; c=relaxed/simple;
	bh=yQUfoMQ1sB2S/JRGmyfBTM7XL0Ogq/QExo5lTpWE/PQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=mxtsrAs1QfpUZY0WP0RJmt3iYkxrw/O/rqvqpkBTb9NnF0o4X3ypjSY8J2j0mTrU85EdpE8DTGoeVWEBAP65ol0e7fWHasWo3xP0/+VNZ7glfxif8/XvzkjqUDxsOCP3POmTI05dfDxvfZ1Q0zzF0tD1G6Yen/Hyb8mXvFcsehk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=T8JtWway; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2653DC4AF0C;
	Tue, 30 Jul 2024 16:04:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1722355479;
	bh=yQUfoMQ1sB2S/JRGmyfBTM7XL0Ogq/QExo5lTpWE/PQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=T8JtWway2aXKKN+9FhKoAagbzZ4dHmmfa9JizwmKT1N7li58fg+Am9vYp16d9KmRs
	 f4au8lh2KSQABZhisC7dRxrVTiJmDrEPxJRy0Z7Q2Caztx0INkgrgAMPR1Bt4xXlON
	 yoO1ePGBtpHklMTTi2g6J+N5JTKGHdCiQmd425T0vVquJX+74wWxl3WmYeshNERZIK
	 Rc3P7YaSC6BZUw1A2rSKN03PzRWRgUnbWNe5ezRqpkFQ4WyyiUwmaopgLQIe2BwlHN
	 gnEGnpi25MKDJmoqUGxpT+oQnQ0D6+SaxYLnZlvE3+TewLyjGpdLioKbvWafEgKwlu
	 LHiJAM5lFWsrg==
Date: Tue, 30 Jul 2024 10:04:38 -0600
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Oliver Rhodes <oliver.rhodes.aj@renesas.com>
Cc: Magnus Damm <magnus.damm@gmail.com>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	devicetree@vger.kernel.org,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-serial@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
	Jiri Slaby <jirislaby@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Geert Uytterhoeven <geert+renesas@glider.be>
Subject: Re: [PATCH V2 5/6] dt-bindings: serial: renesas: Document RZ/G2M
 v3.0 (r8a774a3) scif
Message-ID: <172235547750.1347847.12815614166773325487.robh@kernel.org>
References: <20240725100534.5374-1-oliver.rhodes.aj@renesas.com>
 <20240725100534.5374-6-oliver.rhodes.aj@renesas.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240725100534.5374-6-oliver.rhodes.aj@renesas.com>


On Thu, 25 Jul 2024 11:05:33 +0100, Oliver Rhodes wrote:
> Document scif bindings for the Renesas RZ/G2M v3.0 (a.k.a r8a774a3) SoC.
> 
> Signed-off-by: Oliver Rhodes <oliver.rhodes.aj@renesas.com>
> ---
> v2->v2 resend:
> * No change.
> v1 resend->v2:
> * No change.
> v1->v1 resend:
> * No change.
> ---
>  Documentation/devicetree/bindings/serial/renesas,scif.yaml | 1 +
>  1 file changed, 1 insertion(+)
> 

Acked-by: Rob Herring (Arm) <robh@kernel.org>


