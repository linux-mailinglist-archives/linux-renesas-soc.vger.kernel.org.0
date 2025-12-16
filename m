Return-Path: <linux-renesas-soc+bounces-25808-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 00F82CC3610
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 16 Dec 2025 14:59:01 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id A88FF300CB90
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 16 Dec 2025 13:56:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 637EC3A1E6B;
	Tue, 16 Dec 2025 13:56:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="uy60xRSU"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 39F6C3A1E66;
	Tue, 16 Dec 2025 13:56:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765893399; cv=none; b=BVGO7Z/J4RoCj1VM7YYhYeXT83tPi7Afxn8HnQfL1RZLKTj8uaiz+KtA0LHJ6vwkB4XNttiYGlfBuxRSgMn49TYkOKlpOoskfokTBKrb1RLK33/DWJ58tp63+tY5i/xKOWcV6lmOGTkC2yZgxxhdbNoe/X+NqcvG0JeanMzahCk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765893399; c=relaxed/simple;
	bh=cCyl1GPMdqGVBfdBvKiuIVvMj6Pu2aFTMCmNf78d8Rw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=WcIcaRsbo7UtF8pU9XjCa3mm61Jbi4jPd/0eBJWuKyjldWD+vXcRnrzCmCwbaj/mQBcnpjCL2yYgTtxTlvIJsN0xBF9hw29QZ9GKyWqid1idCm6nVgFauPLnVQBw/eERVriWL3LwqdfEkW4FSV9xWUwon5D1Gh1ZBpBY7HBkn8g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=uy60xRSU; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9B7CBC4CEF1;
	Tue, 16 Dec 2025 13:56:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1765893398;
	bh=cCyl1GPMdqGVBfdBvKiuIVvMj6Pu2aFTMCmNf78d8Rw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=uy60xRSUaZAMcyYPFge1ofcg3ah+qbdYctzuVNMjbDHEInAxucDSDtJjawpAkfI/r
	 vCFTyzbE93hjThDVWbcLlujf4U3QhKZUODTl7Fiv3I7xp5J7kHphdb1ioF5BtkRfG9
	 MYpaMB0Gn+eDVqmfi9sQG3LD07DMwtM4iDdp/WXHa4NqrEdUpFpfK3LCch9fBT5wrF
	 /M3ReZtKfBMNNhM5+jQgemqWD2T7+9qa+oK47afs0acSw0vLcYZqwU8M3aM0dU5awS
	 ugW5R+Ka9kO7G+t50zjuBHAbgKJe68O4hf6n6oEeqj+KNRxo/8oZhSDDWU+DUnKw+x
	 57/urMQC/IqoA==
Date: Tue, 16 Dec 2025 07:56:36 -0600
From: Rob Herring <robh@kernel.org>
To: Niklas =?iso-8859-1?Q?S=F6derlund?= <niklas.soderlund@ragnatech.se>
Cc: Wolfram Sang <wsa+renesas@sang-engineering.com>,
	linux-renesas-soc@vger.kernel.org,
	Frank Binns <frank.binns@imgtec.com>,
	Matt Coster <matt.coster@imgtec.com>,
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Magnus Damm <magnus.damm@gmail.com>,
	dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org
Subject: Re: [PATCH] dt-bindings: gpu: img,powervr-rogue: Add Renesas R-Car
 V3U
Message-ID: <20251216135636.GA2080685-robh@kernel.org>
References: <20251215133839.15133-2-wsa+renesas@sang-engineering.com>
 <20251215142253.GA1324977@ragnatech.se>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20251215142253.GA1324977@ragnatech.se>

On Mon, Dec 15, 2025 at 03:22:53PM +0100, Niklas Söderlund wrote:
> Hi Wolfram,
> 
> This is posted already here [1], not sure why it have not been merged 
> yet :-)

Because the powervr maintainers don't know they are supposed to pick it 
up? Or if it is only a binding change, it can go with the .dts changes.
 
Anyways, I'll go apply it now.

Rob

> 
> 1.  https://lore.kernel.org/linux-renesas-soc/20251106212342.2771579-2-niklas.soderlund%2Brenesas@ragnatech.se/

