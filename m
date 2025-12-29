Return-Path: <linux-renesas-soc+bounces-26169-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 7EC9FCE857A
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 30 Dec 2025 00:35:17 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id E3536300215C
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 29 Dec 2025 23:35:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B6C04266B67;
	Mon, 29 Dec 2025 23:35:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="RRXPi6EZ"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7C24B3A1E98;
	Mon, 29 Dec 2025 23:35:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767051314; cv=none; b=nWz+NC+qDCHmd965raN454xVeWiYCngD3HW/5soEN/Ac9maKnnYKtCV9P094jLi9+fpv0al1k3r5fa61IaDl2tv6TSmShdcuCU3KoPp7Ye6r57Uud2M/EI2nhPO60tyZs3x9Ue2HinxgbxLTuVGPS6G4FydCNy7sFyhloRp5ahA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767051314; c=relaxed/simple;
	bh=sGG51MCoV7W1LUkTO42FAWhTXUFofGiZZFTBsNMdG8I=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Uu/wJARz23B0tQ7CbFPKsBktRafEmkKBY0LS6qlMPmyD/sSPuHxli4awRb5XPIu65zmDXn/Ok++KVML5/jr0siThqt9Er2cYotuMSy6Hkq0sVxShGu0n4r3TdUOohDnilPse7Sv2BpWdFsHeUuyddVIsUGs1AX9QfWUQUmn6Nxo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=RRXPi6EZ; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E1A6AC4CEF7;
	Mon, 29 Dec 2025 23:35:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1767051314;
	bh=sGG51MCoV7W1LUkTO42FAWhTXUFofGiZZFTBsNMdG8I=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=RRXPi6EZ7Gso9xNo+pfIlQpx5ecEiLkR+m1417tHk4qBetbXx2i1Cn6lIbRvAizVi
	 zYR71qHUgWt5iXBnPTrlHRXc6qW8su3+sVnlGvZ80MA5iGV7wMZQ4T6IgkaW15bWez
	 YYEoL9FobDylm4WB9Cpv5ToYIe8dDewrqEA5H2/BPxenSawcOfKdlWgY6TtF++OiYm
	 Aagtli9tv88PZmE8/a9cFIPIiRbhlcgAbQLqYaPRS8mONySFOpr4+cHdUj88SARWSw
	 fEvjW+SJXi9F8itTfnqr8DdlTqAd96iZ2oj66LQ19B1vJSJKRtGPMtBKDac5r3CKR5
	 sUGjkABfmWWlw==
Date: Mon, 29 Dec 2025 17:35:12 -0600
From: Rob Herring <robh@kernel.org>
To: Alexander Stein <alexander.stein@ew.tq-group.com>
Cc: Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>, Peter Chen <peter.chen@kernel.org>,
	Pawel Laszczak <pawell@cadence.com>,
	Roger Quadros <rogerq@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Magnus Damm <magnus.damm@gmail.com>, Marek Vasut <marex@denx.de>,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org, linux-clk@vger.kernel.org,
	linux-usb@vger.kernel.org, imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org, linux@ew.tq-group.com
Subject: Re: [PATCH 2/6] dt-bindings: usb: cdns,usb3: support USB devices in
 DT
Message-ID: <20251229233512.GA2785770-robh@kernel.org>
References: <20251218152058.1521806-1-alexander.stein@ew.tq-group.com>
 <20251218152058.1521806-3-alexander.stein@ew.tq-group.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251218152058.1521806-3-alexander.stein@ew.tq-group.com>

On Thu, Dec 18, 2025 at 04:20:49PM +0100, Alexander Stein wrote:
> Reference usb-hxci.yaml in host mode in order to support on-board USB
> hubs.
> 
> Signed-off-by: Alexander Stein <alexander.stein@ew.tq-group.com>
> ---
>  Documentation/devicetree/bindings/usb/cdns,usb3.yaml | 11 +++++++++++
>  1 file changed, 11 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/usb/cdns,usb3.yaml b/Documentation/devicetree/bindings/usb/cdns,usb3.yaml
> index f454ddd9bbaa6..1f7f0adc3b1ed 100644
> --- a/Documentation/devicetree/bindings/usb/cdns,usb3.yaml
> +++ b/Documentation/devicetree/bindings/usb/cdns,usb3.yaml
> @@ -85,6 +85,17 @@ required:
>  
>  allOf:
>    - $ref: usb-drd.yaml#
> +  - if:
> +      properties:
> +        dr_mode:
> +          const: peripheral
> +
> +      required:
> +        - dr_mode
> +    then:
> +      $ref: usb.yaml#
> +    else:
> +      $ref: usb-xhci.yaml#

I would just do:

allOf:
  - $ref: usb-drd.yaml#
  - $ref: usb-xhci.yaml#  (includes usb.yaml)

2 reasons:

As I remember, 'dr_mode' is at least typically what the default mode is 
rather than the only mode the h/w supports.

Even if you are peripheral only, I don't think it is too important to 
disallow otherwise valid properties. (It's random, unspecified 
properties I care about.)

Rob

