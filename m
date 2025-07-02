Return-Path: <linux-renesas-soc+bounces-19038-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 2E9FFAF59DD
	for <lists+linux-renesas-soc@lfdr.de>; Wed,  2 Jul 2025 15:45:54 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id E6E23188DF41
	for <lists+linux-renesas-soc@lfdr.de>; Wed,  2 Jul 2025 13:44:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 567392857C5;
	Wed,  2 Jul 2025 13:42:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ragnatech.se header.i=@ragnatech.se header.b="FDMCFdEe";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="HVAbyInn"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from fhigh-b3-smtp.messagingengine.com (fhigh-b3-smtp.messagingengine.com [202.12.124.154])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EB7F72609EC;
	Wed,  2 Jul 2025 13:42:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=202.12.124.154
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751463772; cv=none; b=d7NvbJKZhTmfUGPEyVY1W1tS6Q4KNTWyheEHV3+pq/jDs4FrBHQZfjJi2FbUzY5a0FqRFopJsBHX1zi11VBz9ZWG6EKJDwLG9IN8IR59dp8lZWOrDhcnt4bV7h6nWlTN/hCn0KPCu0hIrypcWr4sxLFZAizB5AuOp77Ggk4lyCw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751463772; c=relaxed/simple;
	bh=PNV0m4LTweGzWr9L1pxsKZIVj8wLp6Lg2m/G8to/1tk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=iIhk/Tb+M+ZaJbs0C2lkTacDWP4Jf9ZBhIFGf2hQUV6A0/Z17oGBMk7RuOcOwp42AmRUW4efWW6eq0oM9WUkLZekSaPO9I689VsY017P7ECxmvfjzvgSpx+3Y6gyS3uB/Zyl5TbyKG+zTwHufP9qvSDBc8dje7Euzkan8KWi8YI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ragnatech.se; spf=pass smtp.mailfrom=ragnatech.se; dkim=pass (2048-bit key) header.d=ragnatech.se header.i=@ragnatech.se header.b=FDMCFdEe; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=HVAbyInn; arc=none smtp.client-ip=202.12.124.154
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ragnatech.se
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ragnatech.se
Received: from phl-compute-06.internal (phl-compute-06.phl.internal [10.202.2.46])
	by mailfhigh.stl.internal (Postfix) with ESMTP id E0BF27A0187;
	Wed,  2 Jul 2025 09:42:48 -0400 (EDT)
Received: from phl-mailfrontend-02 ([10.202.2.163])
  by phl-compute-06.internal (MEProxy); Wed, 02 Jul 2025 09:42:49 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ragnatech.se; h=
	cc:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm1; t=1751463768;
	 x=1751550168; bh=QTj7RpPYTBOI6uecSMTkZbV9TbIVCklLCyyfgxCQGuM=; b=
	FDMCFdEeH7ewDsfqnene4cIRbYkwmd8alkMcQkEkRXMgXmObgjBPvH5DJIxwjNGR
	LU2pzIjItAGZv5af0MIkWJEFgf5B+OYpmYDlmoIro4tlnar4of9slWE2wKQlJMwX
	ChiRkewzWmSL6WmGqs7I5YCvWI2G4jlaMbCFqKcNO4QHo/Z0uSZk6sPzaOTq7ebu
	hfeAUlmqZPpKn3ygI1OuBlzx9FXv9l2utL/oaq4oipSm7ewtZl8ZEluj93B1Y3Xd
	GPywqs41IJK2LexpO7nrycC70bPCBcMGTj7fXq+hbIshvBg3uf+FL+iMMxLJR9s7
	kT0bGcD0QTXYw1UCpqnKoA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; t=1751463768; x=
	1751550168; bh=QTj7RpPYTBOI6uecSMTkZbV9TbIVCklLCyyfgxCQGuM=; b=H
	VAbyInntRgCPMRrLsaIZCbW0o/N0h+PxrD/hxvF635gB3L7ZkIAHpHRvjnAbmGCj
	v/T5L4aiio4zPulgYHUee8xUZzHbY//tOlUqX6TjKwhHITMdU8f9pEFUCouaUIkn
	sU0YeNiu+Cghknr8ECxN0fsJXUlqqLQVgU/5EBJ3YDLoDNZW0M+Z7r5pFZzulW5E
	wkaPuhVwipbGdpCM7IGRHcTith5HFSdmbOkKEKWIEO+ySS8Gd9e/TJtfT27oasQP
	dp1mdHO2BNFgJARZhtZmGmu+8ra8iVEac5m80JJgIANEr0ZnoS5PnRweW+rXr0yn
	Eqd6Avo3gaEXY7RF6BqJw==
X-ME-Sender: <xms:WDdlaI4BHn_YHMatgvh2VFl37NQXog_P6Rp9KEHXvqPP7TJ0v4knVw>
    <xme:WDdlaJ5ZCvABW9ZPz6UTX7hOnPVBci4LAC973z4d_Jkqf_nSokfHVxVINXDxl3WiL
    M742mr-gezMMvj0Lx0>
X-ME-Received: <xmr:WDdlaHd09Bkt86p-FQzrEoUjuMNRzr9xYRGiBgoEfRjcAUZqBvjQD0UpjBAgNh-zCrycvlSaVv_Q9GlHUpPS9MmMKHM20R1zkQ>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeeffedrtdefgddujeehgecutefuodetggdotefrod
    ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpuffrtefokffrpgfnqfghnecuuegr
    ihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjug
    hrpeffhffvvefukfhfgggtugfgjgesthekredttddtjeenucfhrhhomheppfhikhhlrghs
    ucfunpguvghrlhhunhguuceonhhikhhlrghsrdhsohguvghrlhhunhguodhrvghnvghsrg
    hssehrrghgnhgrthgvtghhrdhsvgeqnecuggftrfgrthhtvghrnhepffekgfdukeeghffh
    jeetvdeitdegteeikeffieduhfegveetjeevtdffvdekffdtnecuffhomhgrihhnpehkvg
    hrnhgvlhdrohhrghenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhl
    fhhrohhmpehnihhklhgrshdrshhouggvrhhluhhnugdorhgvnhgvshgrshesrhgrghhnrg
    htvggthhdrshgvpdhnsggprhgtphhtthhopeehpdhmohguvgepshhmthhpohhuthdprhgt
    phhtthhopehrohgshheskhgvrhhnvghlrdhorhhgpdhrtghpthhtohepshgrrhgrvhgrnh
    grkhesghhoohhglhgvrdgtohhmpdhrtghpthhtohepghgvvghrthdorhgvnhgvshgrshes
    ghhlihguvghrrdgsvgdprhgtphhtthhopeguvghvihgtvghtrhgvvgesvhhgvghrrdhkvg
    hrnhgvlhdrohhrghdprhgtphhtthhopehlihhnuhigqdhrvghnvghsrghsqdhsohgtsehv
    ghgvrhdrkhgvrhhnvghlrdhorhhg
X-ME-Proxy: <xmx:WDdlaNLsT4JLyoLBAjNUICdDDhoWPGQpcPQfvtIdYBssNJ973jY1xA>
    <xmx:WDdlaMJFqPTOjVbM2VfM3UxPbA57b2-iqZwahgVbbK5Jcumf_ANhOw>
    <xmx:WDdlaOybEGazCsSOHraLXrNDATvAvXPLCjmsaCX-JjQodWPbyCR08Q>
    <xmx:WDdlaAL9VTkemfYH0mkAzpbXbz_P2Z3UGk3C9IuYrvoMTuElkbMT2Q>
    <xmx:WDdlaLWtTKdK2zKAX9FC15kmUUfrLMI1SdfiOonydJzGVHGqgEihZls5>
Feedback-ID: i80c9496c:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Wed,
 2 Jul 2025 09:42:47 -0400 (EDT)
Date: Wed, 2 Jul 2025 15:42:45 +0200
From: Niklas =?utf-8?Q?S=C3=B6derlund?= <niklas.soderlund+renesas@ragnatech.se>
To: Rob Herring <robh@kernel.org>
Cc: Saravana Kannan <saravanak@google.com>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	devicetree@vger.kernel.org, linux-renesas-soc@vger.kernel.org
Subject: Re: [PATCH] dtc: Demote graph_child_address checks to W=2
Message-ID: <20250702134245.GA3830050@ragnatech.se>
References: <20250702085008.689727-1-niklas.soderlund+renesas@ragnatech.se>
 <CAL_JsqLb3X84=+XAFDUoC9p5aZei99ZHLQ4qEoY_xsTA=PV4Ug@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAL_JsqLb3X84=+XAFDUoC9p5aZei99ZHLQ4qEoY_xsTA=PV4Ug@mail.gmail.com>

Hi Rob,

Thanks for your feedback.

On 2025-07-02 08:33:10 -0500, Rob Herring wrote:
> On Wed, Jul 2, 2025 at 3:50 AM Niklas Söderlund
> <niklas.soderlund+renesas@ragnatech.se> wrote:
> >
> > The dtc graph_child_address check can't distinguish between bindings
> > where there can only be a single endpoint, and cases where there can be
> > multiple endpoints.
> >
> > In cases where the bindings allow for multiple endpoints but only one is
> > described false warnings about unnecessary #address-cells/#size-cells
> > can be generated, but only if the endpoint described have an address of
> > 0 (A), for single endpoints with a non-zero address (B) no warnings are
> > generated.
> >
> > A)
> >     ports {
> >         #address-cells = <1>;
> >         #size-cells = <0>;
> >
> >         port@0 {
> >             #address-cells = <1>;
> >             #size-cells = <0>;
> >
> >             sourceA: endpoint@0 {
> >                 reg = <0>
> >             };
> >         };
> >     };
> >
> > B)
> >     ports {
> >         #address-cells = <1>;
> >         #size-cells = <0>;
> >
> >         port@0 {
> >             #address-cells = <1>;
> >             #size-cells = <0>;
> >
> >             sourceB: endpoint@1 {
> >                 reg = <1>
> >             };
> >         };
> >     };
> >
> > The false warnings, and especially the confusion on why it only triggers
> > for single endpoints where the address is 0, leads to confused user and
> > reports of issues with DTS files. To try and mitigate this behavior by
> > demote the check to W=2 and document the possibility for false warnings
> > in the check itself.
> >
> > Signed-off-by: Niklas Söderlund <niklas.soderlund+renesas@ragnatech.se>
> > ---
> > Hi,
> >
> > This solution was lightly hinted at [1] by Rob and I have ran with it
> > for a while locally and I'm happy with the result. Lets see what the
> > rest of you think.
> >
> > 1. https://lore.kernel.org/all/20250109150327.GA3352888-robh@kernel.org/
> > ---
> >  scripts/Makefile.dtbs | 6 +++---
> >  scripts/dtc/checks.c  | 5 +++++
> 
> dtc changes have to go upstream first. I can drop this when applying.

Ohh I see now there is a separate tree for dtc. If you agree with the 
direction of this work I can submit a patch for this to 
devicetree-compiler@vger.kernel.org. Sorry for not realizing this.

If you like please drop this when applying, and please drop the last 
half paragraph from the commit message "and document the possibility for 
false warnings in the check itself".

> 
> Rob

-- 
Kind Regards,
Niklas Söderlund

