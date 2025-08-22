Return-Path: <linux-renesas-soc+bounces-20922-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id E8804B32065
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 22 Aug 2025 18:23:20 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 0C26C1BA7E39
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 22 Aug 2025 16:18:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 352E7261B9E;
	Fri, 22 Aug 2025 16:18:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="EDU2rvAm"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 00BC11A9FB9;
	Fri, 22 Aug 2025 16:18:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755879510; cv=none; b=KUfQ8L3fLq9hph8RfwEbt5ZIrcsg84q0lRadUU9SMuPTt9sZQSj/0QWfxayvAIwuztgFsVxWS4XXpKSGTTlVRuEJRuEuESzVX5c9rSLIdxIGlMQxGqatiuzWdjYUrwBgEzXQOiVn/FPKQoo0gOV6s5RvlSb5vr0sWLLIAOM2aY4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755879510; c=relaxed/simple;
	bh=YHS/oTRhurrO0NtuvfArtyVRbEqEjh/ZB1xiPazD29Y=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=AU9sicsfdz6pxVARdUiGz9g0temQ8fuZdPQm9MwUqk9iGFKHdCeSB3suMHI5T7+C5VEeU/t4fLCdG3r8on6CG000h/gvuRXpvboDKSgaOdBL3krWUkGACJg85JE7BkcUg4TRYWB3zRR8zaNUHKM+6M8ymUL7J8s3hPmDWsuG0E0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=EDU2rvAm; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 55908C4CEED;
	Fri, 22 Aug 2025 16:18:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1755879509;
	bh=YHS/oTRhurrO0NtuvfArtyVRbEqEjh/ZB1xiPazD29Y=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=EDU2rvAmbrdsQmwDOOf46wZpKyL79qRomVIeWW1n6gS+yGd2aa3KJt0xVHllb94fb
	 2/RJfy54Qd2giI2kVNErQ5hLopgJdVaiOBJPLcpVlhWZDKCN2qHxjj1F3p/6FzIuqD
	 cCL0MFjAhJUrdB8XJWpraXU7FAvF3KAotwPbxoGwx+qAoWM+iepoHi5GQ1qdPm5ary
	 4NQEekp8Ifz4NSKy7pPjz2ojCvad7wU0KHnFqMnEVC9Z8bnrkNmp5weCUQAnARUWEe
	 7qqkU+kHH/Giaa0T7uEwdskfo/gTaGOeb0VtMfHIRGX26IBnMTzkhlBER0NTF6l/oi
	 gUQm++Qs+Oi4Q==
Date: Fri, 22 Aug 2025 11:18:28 -0500
From: Rob Herring <robh@kernel.org>
To: Biju Das <biju.das.jz@bp.renesas.com>
Cc: Conor Dooley <conor@kernel.org>, "biju.das.au" <biju.das.au@gmail.com>,
	Vinod Koul <vkoul@kernel.org>,
	Kishon Vijay Abraham I <kishon@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	"magnus.damm" <magnus.damm@gmail.com>,
	"linux-phy@lists.infradead.org" <linux-phy@lists.infradead.org>,
	"devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"linux-renesas-soc@vger.kernel.org" <linux-renesas-soc@vger.kernel.org>,
	Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: Re: [PATCH 03/11] dt-bindings: phy: renesas: Document Renesas RZ/G3E
 USB3.0 PHY
Message-ID: <20250822161828.GA3905962-robh@kernel.org>
References: <20250820171812.402519-1-biju.das.jz@bp.renesas.com>
 <20250820171812.402519-4-biju.das.jz@bp.renesas.com>
 <20250820-primer-shaded-66da9fa4bcae@spud>
 <20250820-commodity-curator-1f580789885b@spud>
 <TY3PR01MB113467039A598C0EDC284AE198632A@TY3PR01MB11346.jpnprd01.prod.outlook.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <TY3PR01MB113467039A598C0EDC284AE198632A@TY3PR01MB11346.jpnprd01.prod.outlook.com>

On Thu, Aug 21, 2025 at 07:18:59AM +0000, Biju Das wrote:
> Hi Conor,
> 
> Thanks for the feedback.
> 
> > -----Original Message-----
> > From: Conor Dooley <conor@kernel.org>
> > Sent: 20 August 2025 21:13
> > Subject: Re: [PATCH 03/11] dt-bindings: phy: renesas: Document Renesas RZ/G3E USB3.0 PHY
> > 
> > On Wed, Aug 20, 2025 at 09:10:07PM +0100, Conor Dooley wrote:
> > > Acked-by: Conor Dooley <conor.dooley@microchip.com>
> > 
> > Now that I look again, same applies here with the different filename and compatible. Copypaste mistake?
> > Or why does the compatible not match the filename?
> > 
> 
> r9a09g047 is SoC part number which also known as RZ/G3E SoC.
> 
> I just followed the convention used in [1] and [2].
> Please let me know, should I change rzg3e-usb3-phy.yaml.yaml-> r9a09g047-usb3-phy.yaml ?

I think it is fine as-is.

Rob

