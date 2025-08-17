Return-Path: <linux-renesas-soc+bounces-20588-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 2DE04B29349
	for <lists+linux-renesas-soc@lfdr.de>; Sun, 17 Aug 2025 15:35:55 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id D3FF74881B1
	for <lists+linux-renesas-soc@lfdr.de>; Sun, 17 Aug 2025 13:35:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CCC4528936D;
	Sun, 17 Aug 2025 13:35:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ragnatech.se header.i=@ragnatech.se header.b="niyV/rUm";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="exukryhq"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from fhigh-a3-smtp.messagingengine.com (fhigh-a3-smtp.messagingengine.com [103.168.172.154])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D88D0289354;
	Sun, 17 Aug 2025 13:35:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=103.168.172.154
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755437752; cv=none; b=iNsOGq3todzi3C3rSZVt44kHihGfETCMxHOOopAYo0uOz3paAv9r3L7/7TuS3I2Y0UZeOkofUFizBAwlzerL0k/M3hvpN4G/jOYZC7sBftE4JPreV2PS4Bkvp1musQ6q5oT/GfI59GQT56cQAGTy2T8UXfMlNYj3Ekxecx8TBkc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755437752; c=relaxed/simple;
	bh=m0sY4XaewUHdEpKfeU3TO5GQ14s152Uw/5Fgh/2UcYE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=O1V2Th0QENBBjp2CYkTEsH/tzN74DLgzjYEXKZW7O0iRZfodwvwPX4xkX5/wIbx3hUfzBhVym1EVpf5qp/ACi6xdjd2kj13N/WGsvq28B/AXAQNEQ2mq68KxTLSo9NAp1XmMmKNOqkSUMRzkpRfzM3gwEBlNzCRcc8Dw1b1LlsY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ragnatech.se; spf=pass smtp.mailfrom=ragnatech.se; dkim=pass (2048-bit key) header.d=ragnatech.se header.i=@ragnatech.se header.b=niyV/rUm; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=exukryhq; arc=none smtp.client-ip=103.168.172.154
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ragnatech.se
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ragnatech.se
Received: from phl-compute-03.internal (phl-compute-03.internal [10.202.2.43])
	by mailfhigh.phl.internal (Postfix) with ESMTP id B0E3A140001E;
	Sun, 17 Aug 2025 09:35:48 -0400 (EDT)
Received: from phl-mailfrontend-01 ([10.202.2.162])
  by phl-compute-03.internal (MEProxy); Sun, 17 Aug 2025 09:35:48 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ragnatech.se; h=
	cc:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm2; t=1755437748;
	 x=1755524148; bh=Uy5Svad1hRxMViZAhXEzbxmD0mTUwgyF9kPhkgr1KKE=; b=
	niyV/rUmn6ZsIhJ5d5IJdE+kWl7sxY1tUoOYiJNJH/z3P5ZXXpvK/ajdUgucl4TG
	5ssjQxEJqGyA8Sbz2MsP9hRxTL7FfpgUS15ZpsCY1HUiQZBjgwRL9kcxgOjZUe17
	0TaU2DKXkG3fDO3CheM/Rz0LQvGMNzE+W1Psq6gOA7Ws0Hu4HMleJAxNpOaReEaH
	Ekp+YCjDYQJrUp2rFyW/4ks4C4w93yt1GeE+evGgpHRAtkpKk/i0pSFUeqcblh/I
	iqmsykdkLTNoy5ta/snkSTPCmA+utfXrQwDXL2d6b9VsSP0Q4Zo58lPgUwY/6CFN
	6QsoiomHeOb0eHU+0Mruzw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; t=1755437748; x=
	1755524148; bh=Uy5Svad1hRxMViZAhXEzbxmD0mTUwgyF9kPhkgr1KKE=; b=e
	xukryhqCwYPTEJAv0D6ctt7KW/HO26+4Ov/5SlcwN8L0UT/aXafaBxRXAsmSVEYP
	iZn2n8V+9cnD3omx19jnQvy1ptKEge9lp5R4D8kURS4M4FBseFwXCW4sw+/yKWMz
	RsCR7pzzHc14uAUWKy96Tv0vCQhRDcNlmmQmq1O8wxPtrUg0dQjK1nNk2BKClXNs
	Fu6WsMMhjV9ycibkgnWGkYBcmDHtrf0oWccE3eOtSthy1HUI08/EqBzU8zDeyQNR
	i4eUUQ6FtKcFP6OvoZEJcafd6axzcEm0IPhivNdOzBQUmJpNycuxScHUmO4F18EO
	4KzAU3yzHwrtdWGRYbq0A==
X-ME-Sender: <xms:s9qhaCIYJh-Hjjiz_x2PEKDm_xIPc_6ZqoIDaTpYY8n3xuTTfwOBhQ>
    <xme:s9qhaHuugiPPXmrnb-m5jhM7wk_42d8YABvIzM-KVQVdhAH_zWNdS9zwuDAdFPTr7
    I8xqBKG8ESrSsDtU7A>
X-ME-Received: <xmr:s9qhaJI6epmPNwuP1aIF0JzcinLKzkABqPPxEjDp7HcDnXcC6z-AZwDUUtWe09N2exuFJcGqe7gifmvvbXKOOsWROgHuo39arA>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeeffedrtdefgddugeelkeejucetufdoteggodetrf
    dotffvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfurfetoffkrfgpnffqhgenuceu
    rghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujf
    gurhepfffhvfevuffkfhggtggugfgjsehtkeertddttdejnecuhfhrohhmpefpihhklhgr
    shcuufpnuggvrhhluhhnugcuoehnihhklhgrshdrshhouggvrhhluhhnugdorhgvnhgvsh
    grshesrhgrghhnrghtvggthhdrshgvqeenucggtffrrghtthgvrhhnpedujeelhfegieet
    tdeuhfehfedvieekveelledufeelieettdfgvdekleejuedtveenucffohhmrghinhepug
    hrohhpsggvrghrrdhiugdrrghupdhoiihlrggsshdrohhrghenucevlhhushhtvghrufhi
    iigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpehnihhklhgrshdrshhouggvrhhluh
    hnugdorhgvnhgvshgrshesrhgrghhnrghtvggthhdrshgvpdhnsggprhgtphhtthhopeei
    pdhmohguvgepshhmthhpohhuthdprhgtphhtthhopegurghvihgusehgihgsshhonhdrug
    hrohhpsggvrghrrdhiugdrrghupdhrtghpthhtoheprhhosghhsehkvghrnhgvlhdrohhr
    ghdprhgtphhtthhopehsrghrrghvrghnrghksehgohhoghhlvgdrtghomhdprhgtphhtth
    hopehgvggvrhhtodhrvghnvghsrghssehglhhiuggvrhdrsggvpdhrtghpthhtohepuggv
    vhhitggvthhrvggvqdgtohhmphhilhgvrhesvhhgvghrrdhkvghrnhgvlhdrohhrghdprh
    gtphhtthhopehlihhnuhigqdhrvghnvghsrghsqdhsohgtsehvghgvrhdrkhgvrhhnvghl
    rdhorhhg
X-ME-Proxy: <xmx:s9qhaI_w9guxb5j5JTQzwiGIgnSqhPpYL-bXnabQejlBr71qJAHmgQ>
    <xmx:s9qhaKxGZgxjCtVfUHct5uTT_KV4lluB80n_FgMXf7kSDPxDjehSaA>
    <xmx:s9qhaN76dO1ECWtBUuCTbo3D5PUUKpDkTKkLim70-MEACN25GXEtsA>
    <xmx:s9qhaJ8_Q4t0_gyKHv_fehoECdhVMxd3n__a8-RLJnc8hChihOZokw>
    <xmx:tNqhaKoPkLWLiuMVdhnTfP1EMLYfmbYJjvMB4Uxb_vytOorRPNQlhUTy>
Feedback-ID: i80c9496c:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Sun,
 17 Aug 2025 09:35:47 -0400 (EDT)
Date: Sun, 17 Aug 2025 15:35:40 +0200
From: Niklas =?utf-8?Q?S=C3=B6derlund?= <niklas.soderlund+renesas@ragnatech.se>
To: David Gibson <david@gibson.dropbear.id.au>
Cc: Rob Herring <robh@kernel.org>, Saravana Kannan <saravanak@google.com>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	devicetree-compiler@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org
Subject: Re: [PATCH v2] checks: Remove check for graph child addresses
Message-ID: <20250817133540.GB2197757@ragnatech.se>
References: <20250812165122.313382-1-niklas.soderlund+renesas@ragnatech.se>
 <aKANBt7QzzMWhIaJ@zatzit>
 <20250817064259.GA487241@ragnatech.se>
 <aKGQohIuFcK20AxL@zatzit>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <aKGQohIuFcK20AxL@zatzit>

On 2025-08-17 18:19:46 +1000, David Gibson wrote:
> On Sun, Aug 17, 2025 at 08:42:59AM +0200, Niklas Söderlund wrote:
> > Hi David,
> > 
> > Thanks for your feedback.
> > 
> > On 2025-08-16 14:45:58 +1000, David Gibson wrote:
> > > On Tue, Aug 12, 2025 at 06:51:22PM +0200, Niklas Söderlund wrote:
> > > > The dtc graph_child_address check can't distinguish between bindings
> > > > where there can only be a single endpoint, and cases where there can be
> > > > multiple endpoints.
> > > > 
> > > > In cases where the bindings allow for multiple endpoints but only one is
> > > > described false warnings about unnecessary #address-cells/#size-cells
> > > > can be generated, but only if the endpoint described have an address of
> > > > 0 (A), for single endpoints with a non-zero address (B) no warnings are
> > > > generated.
> > > > 
> > > > A)
> > > >     ports {
> > > > 	#address-cells = <1>;
> > > > 	#size-cells = <0>;
> > > > 
> > > > 	port@0 {
> > > > 	    #address-cells = <1>;
> > > > 	    #size-cells = <0>;
> > > > 
> > > > 	    sourceA: endpoint@0 {
> > > > 		reg = <0>
> > > > 	    };
> > > > 	};
> > > >     };
> > > > 
> > > > B)
> > > >     ports {
> > > > 	#address-cells = <1>;
> > > > 	#size-cells = <0>;
> > > > 
> > > > 	port@0 {
> > > > 	    #address-cells = <1>;
> > > > 	    #size-cells = <0>;
> > > > 
> > > > 	    sourceB: endpoint@1 {
> > > > 		reg = <1>
> > > > 	    };
> > > > 	};
> > > >     };
> > > > 
> > > > Remove the check as it is somewhat redundant now that we can use schemas
> > > > to validate the full node.
> > > > 
> > > > Signed-off-by: Niklas Söderlund
> > > > <niklas.soderlund+renesas@ragnatech.se>
> > > 
> > > This causes test suite failures.  You'll need to also remove the
> > > explicit graph_child_address test from the testsuite.
> > 
> > Thanks for pointing this out. I'm no expert on DTC, this is the 
> > references to it in tests/run_tests.sh? Is there any more locations I 
> > should check?
> 
> No, that's it.  "make check" should run the full suite for you; good
> practice before sending patches.  If you want you can use the github
> MR mechanism which will also run the tests as part of its CI.
> Old-school patches on the mailing list are fine too, though.

Thanks, indeed 'make check' catches the issue. I did not know about 
that, will fix for next version.

> 
> > > Note that this patch does technically cause an incompatible change:
> > > when I suggested removing this I hadn't realised this was a single
> > > check, rather than a piece of a larger check.  That means that anyone
> > > configuring this test in their scripts will be broken by removing it.
> > > This is probably an obscure enough case that I'm prepared to accept
> > > it, though.
> > > 
> > > > ---
> > > > Changes since v2
> > > > - Rebase after 6.17-rc1 merge window closed.
> > > > ---
> > > >  checks.c | 27 +--------------------------
> > > >  1 file changed, 1 insertion(+), 26 deletions(-)
> > > > 
> > > > diff --git a/checks.c b/checks.c
> > > > index 7e3fed5005b3..2072e1ea82dc 100644
> > > > --- a/checks.c
> > > > +++ b/checks.c
> > > > @@ -1894,31 +1894,6 @@ static void check_graph_endpoint(struct check *c, struct dt_info *dti,
> > > >  }
> > > >  WARNING(graph_endpoint, check_graph_endpoint, NULL, &graph_nodes);
> > > >  
> > > > -static void check_graph_child_address(struct check *c, struct dt_info *dti,
> > > > -				      struct node *node)
> > > > -{
> > > > -	int cnt = 0;
> > > > -	struct node *child;
> > > > -
> > > > -	if (node->bus != &graph_ports_bus && node->bus != &graph_port_bus)
> > > > -		return;
> > > > -
> > > > -	for_each_child(node, child) {
> > > > -		struct property *prop = get_property(child, "reg");
> > > > -
> > > > -		/* No error if we have any non-zero unit address */
> > > > -                if (prop && propval_cell(prop) != 0 )
> > > > -			return;
> > > > -
> > > > -		cnt++;
> > > > -	}
> > > > -
> > > > -	if (cnt == 1 && node->addr_cells != -1)
> > > > -		FAIL(c, dti, node, "graph node has single child node '%s', #address-cells/#size-cells are not necessary",
> > > > -		     node->children->name);
> > > > -}
> > > > -WARNING(graph_child_address, check_graph_child_address, NULL, &graph_nodes, &graph_port, &graph_endpoint);
> > > > -
> > > >  static struct check *check_table[] = {
> > > >  	&duplicate_node_names, &duplicate_property_names,
> > > >  	&node_name_chars, &node_name_format, &property_name_chars,
> > > > @@ -2005,7 +1980,7 @@ static struct check *check_table[] = {
> > > >  
> > > >  	&alias_paths,
> > > >  
> > > > -	&graph_nodes, &graph_child_address, &graph_port, &graph_endpoint,
> > > > +	&graph_nodes, &graph_port, &graph_endpoint,
> > > >  
> > > >  	&always_fail,
> > > >  };
> > > 
> > 
> > 
> > 
> 
> -- 
> David Gibson (he or they)	| I'll have my music baroque, and my code
> david AT gibson.dropbear.id.au	| minimalist, thank you, not the other way
> 				| around.
> http://www.ozlabs.org/~dgibson



-- 
Kind Regards,
Niklas Söderlund

