Return-Path: <linux-renesas-soc+bounces-21849-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id ADD75B56D02
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 15 Sep 2025 01:45:38 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 6CA6017575B
	for <lists+linux-renesas-soc@lfdr.de>; Sun, 14 Sep 2025 23:45:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 481E423909C;
	Sun, 14 Sep 2025 23:45:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="YbY0Dsm1"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 132EB2101AE;
	Sun, 14 Sep 2025 23:45:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757893533; cv=none; b=d7UvxBrU4jArQzGsQda+KMEZm+V8Hnf3a+LpNI/4EQf56bVi/UJ8nnDdobk4/fSIKYxB71jcPo1Q8YfwFHfJI06zCa408mV3hKlo3ppVA0FdrNLJnBxkB5rayMszHDMNiPSbPHn0r3+8kIbE47WRxTV+C7JynqmRax+VhX0ps+c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757893533; c=relaxed/simple;
	bh=EtcNLf6b+VeOq3VY58DGr/jltFde/1cmlo9BtZ5d+VY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=cNFwY6aT8rSMzO2SDPYbD6OUxbThBggWBJBYTV5b4Q05+lIwfZJBnsiXitptU7s9pAwvbBsqksIwdHvMpnGu2ZydkYhr/y/h/RXrmtxSBPL8wm4Eoab1XlrnH6qx28n9bNaYTpNIbRZi388R1d9VqrdNon1c26C287o4f2TT73k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=YbY0Dsm1; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6DF12C4CEF0;
	Sun, 14 Sep 2025 23:45:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1757893531;
	bh=EtcNLf6b+VeOq3VY58DGr/jltFde/1cmlo9BtZ5d+VY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=YbY0Dsm1wbXp4m9MjjJsCVC9YC+X3KN4JQgs3wQeU4bCOZAP+S+w700Bw/OI/xE3M
	 Ku2VuwzCvBd+5HEnavvOQ1Y2lnbmgPnKwkJelnG4VNz4QeRVtpE8t1fcAWOACMvY+6
	 GRjlGymazfoOiydkVvMpKairo+vBsyhStWW5LBS+R3qlDLc+j4g+0/Qa44QX+HUpkh
	 kiI6ph7tdJX06zXe59/Otn813m+4sEuwoqHy2t3mG9sObS7UtjUCOtO+5CZ1qzlFbY
	 6xDetuZa13KKmy1qdT2ZDWfGFrY35URJ32XW2vXHP0IM+qKWtz8tmJ9miHap7Mq4aP
	 H9HDwMDTnHiNg==
Date: Sun, 14 Sep 2025 18:45:30 -0500
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Biju <biju.das.au@gmail.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>,
	Biju Das <biju.das.jz@bp.renesas.com>,
	linux-renesas-soc@vger.kernel.org,
	Conor Dooley <conor+dt@kernel.org>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	devicetree@vger.kernel.org, Magnus Damm <magnus.damm@gmail.com>
Subject: Re: [PATCH v2 06/11] dt-bindings: usb: Document Renesas RZ/G3E
 USB3HOST
Message-ID: <175789353005.2252414.10762360255516722224.robh@kernel.org>
References: <20250909180803.140939-1-biju.das.jz@bp.renesas.com>
 <20250909180803.140939-7-biju.das.jz@bp.renesas.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250909180803.140939-7-biju.das.jz@bp.renesas.com>


On Tue, 09 Sep 2025 19:07:51 +0100, Biju wrote:
> From: Biju Das <biju.das.jz@bp.renesas.com>
> 
> Document the Renesas RZ/G3E USB3.2 Gen2 Host Controller (a.k.a USB3HOST).
> The USB3HOST is compliant with the Universal Serial Bus 3.2 Specification
> Revision 1.0.
>  - Supports 1 downstream USB receptacles
>      - Number of SSP Gen2 or SS ports: 1
>      - Number of HS or FS or LS ports: 1
>  - Supports Super Speed Plus Gen2x1 (10 Gbps), Super Speed (5 Gbps),
>    High Speed (480 Mbps), Full Speed (12Mbps), and Low Speed (1.5 Mbps).
>  - Supports all transfer-types: Control, Bulk, Interrupt, Isochronous, and
>    these split-transactions.
>  - Supports Power Control and Over Current Detection.
> 
> Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
> ---
> v1->v2:
>  * Added ref to usb-xhci.yaml
>  * Dropped Rb tag
> ---
>  .../bindings/usb/renesas,rzg3e-xhci.yaml      | 87 +++++++++++++++++++
>  1 file changed, 87 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/usb/renesas,rzg3e-xhci.yaml
> 

Reviewed-by: Rob Herring (Arm) <robh@kernel.org>


