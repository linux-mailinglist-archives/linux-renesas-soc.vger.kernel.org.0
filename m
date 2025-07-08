Return-Path: <linux-renesas-soc+bounces-19367-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 7BC42AFC4B3
	for <lists+linux-renesas-soc@lfdr.de>; Tue,  8 Jul 2025 09:53:30 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 3E4D71AA5F9C
	for <lists+linux-renesas-soc@lfdr.de>; Tue,  8 Jul 2025 07:53:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1650F2BE052;
	Tue,  8 Jul 2025 07:52:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ragnatech.se header.i=@ragnatech.se header.b="jaH9R83O";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="GEs+TOUe"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from fout-a7-smtp.messagingengine.com (fout-a7-smtp.messagingengine.com [103.168.172.150])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 728A12BE03F;
	Tue,  8 Jul 2025 07:51:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=103.168.172.150
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751961122; cv=none; b=IqFuEgII3gT9HQi0vGutytFOdO9SmwInTVj+HzhD7okOxzH+LJxpSXjErL7oKChiwfkDRKPBUHkwD4Wxx1Ke0hp8UyrtI0V+dU+aU+xHLCogdZYkHejdu6HUFpuILrgEgX16OcgTEcNj2o2251ZRv63eGOmp56PZl4sVhgFFXsQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751961122; c=relaxed/simple;
	bh=7CO6KdbcEWgjW+xcIyi2OtrkYOFc4B846UEW0uTr72w=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=TEaeY07ThFdPfZalwEm9J1s4Mr8kOQLxGkWqrTtocNkgb8QPhzcW/zkG+Zb89ROWGp7OBi547LvWXDug54sWnMKDgOOKDJ0J0t0Z90caxRPBUXbKVTZSDaziklBE2bCKb+R3jZJdTqJHIY+Tguaig0wXUiB1iEk3QXELTrXVXW0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ragnatech.se; spf=pass smtp.mailfrom=ragnatech.se; dkim=pass (2048-bit key) header.d=ragnatech.se header.i=@ragnatech.se header.b=jaH9R83O; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=GEs+TOUe; arc=none smtp.client-ip=103.168.172.150
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ragnatech.se
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ragnatech.se
Received: from phl-compute-04.internal (phl-compute-04.phl.internal [10.202.2.44])
	by mailfout.phl.internal (Postfix) with ESMTP id 6D919EC040F;
	Tue,  8 Jul 2025 03:51:58 -0400 (EDT)
Received: from phl-mailfrontend-01 ([10.202.2.162])
  by phl-compute-04.internal (MEProxy); Tue, 08 Jul 2025 03:51:58 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ragnatech.se; h=
	cc:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm1; t=1751961118;
	 x=1752047518; bh=9D73PxMJJ4rzuUcwSvfpJzGIs9WGD2i3JosR6cMMJtA=; b=
	jaH9R83OOl7nwlvygER2XBHZjKG1rALvr3+VtJ0NtzFMfwJ+yUyJF0ML6pATqMmz
	FL/HRsGZwxD6yEhTG7RTADut1QAs91Q8lYLyCRnlYP1ekMg6B2GeemUx9AdsALRf
	ntb+tI4WG14n04foH9ilrUdeWwgRWXV1UdRMSqsjZYled3LfkaXfLXdfXPvWHL4U
	N7KTiXKYwrMf5FEiOD30RxpexnAaq16ByWVWrZ1vaq3BvfmrINCP8lM0+nCgcU3N
	3WTNZuAChRBsKU6/OX+wrhHWo2WrQKSCkKgNQbrTu7DBJuFLzsfnEN3Om9TiWjsU
	XVWAnciFUCyKtUxIWdPxVw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; t=1751961118; x=
	1752047518; bh=9D73PxMJJ4rzuUcwSvfpJzGIs9WGD2i3JosR6cMMJtA=; b=G
	Es+TOUe6GsskjZo84eRCWUugxLcrPf7h36qDMjCFHUrYSyPVHjJYLb9z8SYIHz0X
	ylSyVti8lO0G3rHe0+dZPZovUo1DiQBUoxrL4m4v7B6JMCMpC1O+Xz8mc9tFX8Um
	IQcGGd6Ygj1txTe1VyC52R+1Vzt0149rZrlQ4L5Yn7l121s7j5K3DMQnJbHVBqf+
	fRQ6d/fRqzIsHC6+GneSJUe8nFBgvZKVa1EkF2TaVoqFgIoPhZ8KrgTajJmqV04l
	K1VPBQq+uOJ0m+z1NvzqRjr7AExKGaXE8ufG4jTl7g0BIFyX8rlSLFQXKg7Qru6S
	NljtFL2AcfXzCxg0o2pQQ==
X-ME-Sender: <xms:Hc5saISxtIyfEr0lEiaj9hYc8Rd-tqsdhMcjlbaop9ZMF1VwWaFQqA>
    <xme:Hc5saDUJYEm28iD1LvRz1GdkwoGx2h9sNJItIedttL9yM65gT51uzAoonSyXPhzA5
    GAe6kjqNiQbcTrWQHw>
X-ME-Received: <xmr:Hc5saMT3tIcWlW2vZb7U0GCEgv9Let0iL99Y13K6jawWu-98oCcdOzZSdCxGBOCtoJ994G2YbE35jTGihI8dbNAZUnsco5wZ8A>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeeffedrtdefgdefgeduvdcutefuodetggdotefrod
    ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpuffrtefokffrpgfnqfghnecuuegr
    ihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjug
    hrpeffhffvvefukfhfgggtugfgjgesthekredttddtjeenucfhrhhomheppfhikhhlrghs
    ucfunpguvghrlhhunhguuceonhhikhhlrghsrdhsohguvghrlhhunhguodhrvghnvghsrg
    hssehrrghgnhgrthgvtghhrdhsvgeqnecuggftrfgrthhtvghrnhepffejueehuefgtdej
    vdduueetvdduheejieefudfhveeggfeuieeggfdvfedtfffgnecuffhomhgrihhnpehkvg
    hrnhgvlhdrohhrghdpughrohhpsggvrghrrdhiugdrrghupdhoiihlrggsshdrohhrghen
    ucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpehnihhklh
    grshdrshhouggvrhhluhhnugdorhgvnhgvshgrshesrhgrghhnrghtvggthhdrshgvpdhn
    sggprhgtphhtthhopeeipdhmohguvgepshhmthhpohhuthdprhgtphhtthhopegurghvih
    gusehgihgsshhonhdrughrohhpsggvrghrrdhiugdrrghupdhrtghpthhtoheprhhosghh
    sehkvghrnhgvlhdrohhrghdprhgtphhtthhopehsrghrrghvrghnrghksehgohhoghhlvg
    drtghomhdprhgtphhtthhopehgvggvrhhtodhrvghnvghsrghssehglhhiuggvrhdrsggv
    pdhrtghpthhtohepuggvvhhitggvthhrvggvqdgtohhmphhilhgvrhesvhhgvghrrdhkvg
    hrnhgvlhdrohhrghdprhgtphhtthhopehlihhnuhigqdhrvghnvghsrghsqdhsohgtsehv
    ghgvrhdrkhgvrhhnvghlrdhorhhg
X-ME-Proxy: <xmx:Hc5saNlqDAfWqO1ote3h7c9O1reOinOAVDXjvKkvFIGFYlZnfdysHg>
    <xmx:Hc5saC7UoSihRo4XVUUZYf9w7ttg3BESoxbQNWs9TXOY1qJoM2QCnA>
    <xmx:Hc5saDgHy6Mom6TxdWPQ6KwGSA4ehwZ3Xxjlkqmy67nmSCVT-74giQ>
    <xmx:Hc5saPFd9-uWkcVMTfj6MXC6bXc9P04yoei6ETArJCaLbtE4xGSlyA>
    <xmx:Hs5saPzPD7si3qRi5j3lpTn-OHC5p9JjXswtYFv7wqBs5AFAcl-Hk_0b>
Feedback-ID: i80c9496c:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Tue,
 8 Jul 2025 03:51:56 -0400 (EDT)
Date: Tue, 8 Jul 2025 09:51:55 +0200
From: Niklas =?utf-8?Q?S=C3=B6derlund?= <niklas.soderlund+renesas@ragnatech.se>
To: David Gibson <david@gibson.dropbear.id.au>
Cc: Rob Herring <robh@kernel.org>, Saravana Kannan <saravanak@google.com>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	devicetree-compiler@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org
Subject: Re: [PATCH] checks: Document possible false warning for graph child
 addresses
Message-ID: <20250708075155.GA1430987@ragnatech.se>
References: <20250706122638.1040347-1-niklas.soderlund+renesas@ragnatech.se>
 <aGyLYBoJ0c0UcN-8@zatzit>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <aGyLYBoJ0c0UcN-8@zatzit>

Hi David,

Thanks for your comments.

On 2025-07-08 13:07:12 +1000, David Gibson wrote:
> On Sun, Jul 06, 2025 at 02:26:38PM +0200, Niklas Söderlund wrote:
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
> > 	#address-cells = <1>;
> > 	#size-cells = <0>;
> > 
> > 	port@0 {
> > 	    #address-cells = <1>;
> > 	    #size-cells = <0>;
> > 
> > 	    sourceA: endpoint@0 {
> > 		reg = <0>
> > 	    };
> > 	};
> >     };
> > 
> > B)
> >     ports {
> > 	#address-cells = <1>;
> > 	#size-cells = <0>;
> > 
> > 	port@0 {
> > 	    #address-cells = <1>;
> > 	    #size-cells = <0>;
> > 
> > 	    sourceB: endpoint@1 {
> > 		reg = <1>
> > 	    };
> > 	};
> >     };
> > 
> > Add a comment in the check to document this.
> 
> Hm.  I don't know the graph bindings at all well, so I'll take your
> word for it on what's happening here.  But simply documenting this
> within the code doesn't seem particularly useful.  Someone running dtc
> will still see the bogus error, and they'd have a pretty long way to
> go to find this explanation.

It would have been useful for me, I spent a lot of time questioning 
myself on why my dts files produced warnings and where incorrect. I even 
submitted patches to try and work around this issue before learning 
these where false positives. A comment here would have saved me that 
work :-)

I think if the check stays the comment bring some value.

> 
> Probably better to simply remove the check (and maybe comment that it
> would be nice to check further, but we can't adequately it from a
> valid case).

I'm OK with removing the check too. This comment was first posted 
together with a change to demote this check to W=2 (instead of W=1) that 
have now been posted separately [1]. I will wait for feedback on that 
and let smarter people then me pick the best way forward.

1.  https://lore.kernel.org/all/20250706123243.1050718-1-niklas.soderlund%2Brenesas@ragnatech.se/

> 
> > 
> > Signed-off-by: Niklas Söderlund <niklas.soderlund+renesas@ragnatech.se>
> > ---
> > Hello,
> > 
> > This was previously part of a patch posted to devicetree@vger.kernel.org
> > [1], but as Rob's points out in that thread it should have been posted
> > separately to devicetree-compiler@vger.kernel.org. Sorry for not
> > realising that dtc changes go to thru a separate tree.
> > 
> > 1.  https://lore.kernel.org/all/20250702085008.689727-1-niklas.soderlund%2Brenesas@ragnatech.se/
> > ---
> >  checks.c | 5 +++++
> >  1 file changed, 5 insertions(+)
> > 
> > diff --git a/checks.c b/checks.c
> > index 123f2eb425f4..52d09fcf8d3a 100644
> > --- a/checks.c
> > +++ b/checks.c
> > @@ -1913,6 +1913,11 @@ static void check_graph_child_address(struct check *c, struct dt_info *dti,
> >  		cnt++;
> >  	}
> >  
> > +	/*
> > +	 * This check can produce false warnings if the bindings allow for more
> > +	 * then one endpoint in the node but only one is present and it has a
> > +	 * unit address of zero.
> > +	 */
> >  	if (cnt == 1 && node->addr_cells != -1)
> >  		FAIL(c, dti, node, "graph node has single child node '%s', #address-cells/#size-cells are not necessary",
> >  		     node->children->name);
> 
> -- 
> David Gibson (he or they)	| I'll have my music baroque, and my code
> david AT gibson.dropbear.id.au	| minimalist, thank you, not the other way
> 				| around.
> http://www.ozlabs.org/~dgibson



-- 
Kind Regards,
Niklas Söderlund

