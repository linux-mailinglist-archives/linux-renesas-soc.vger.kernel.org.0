Return-Path: <linux-renesas-soc+bounces-20585-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 35FFCB291E3
	for <lists+linux-renesas-soc@lfdr.de>; Sun, 17 Aug 2025 08:43:35 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 916D11B24BE3
	for <lists+linux-renesas-soc@lfdr.de>; Sun, 17 Aug 2025 06:43:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 233E81C862E;
	Sun, 17 Aug 2025 06:43:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ragnatech.se header.i=@ragnatech.se header.b="qPpisNym";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="HD2WMXs2"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from fout-b8-smtp.messagingengine.com (fout-b8-smtp.messagingengine.com [202.12.124.151])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E4C92238159;
	Sun, 17 Aug 2025 06:43:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=202.12.124.151
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755413012; cv=none; b=mZo2IOLuCG1Ix1OPMbP1PgbNfhLwi0XjuMPfPuhdbMrbMahNtTq7yFLgP/ZK450hAyDAcAEHa4vveNU50Wzah2VU76WxY/Ri2V4rIPbdAyuxn8JdhBRvW4u5K20BVrZUAx1xnuImGFOe1MiQdG/XB7MblWvy4Oxz1hQI+gdhVf0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755413012; c=relaxed/simple;
	bh=DT9Y/tcAqTiKWCda1aiWx62xvddJioPCd8R2IqZjX6E=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=CsgJeFinq589FWArGNC8FyeGIEJQ5dWJxcaTRQh+vBy39uj3MqohUIHljEwLCdvSrz/68/IJ26/JuPzd0njSnqKm0Z8B5qfsJwom0gARFGKH1QVVsCLiTxSzBjnuqb0A6sOP3TWEnkBpIOiSyd4DVcQBJDh5i8fYvRJZj6yfK7Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ragnatech.se; spf=pass smtp.mailfrom=ragnatech.se; dkim=pass (2048-bit key) header.d=ragnatech.se header.i=@ragnatech.se header.b=qPpisNym; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=HD2WMXs2; arc=none smtp.client-ip=202.12.124.151
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ragnatech.se
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ragnatech.se
Received: from phl-compute-08.internal (phl-compute-08.internal [10.202.2.48])
	by mailfout.stl.internal (Postfix) with ESMTP id A5E0A1D00088;
	Sun, 17 Aug 2025 02:43:27 -0400 (EDT)
Received: from phl-mailfrontend-02 ([10.202.2.163])
  by phl-compute-08.internal (MEProxy); Sun, 17 Aug 2025 02:43:27 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ragnatech.se; h=
	cc:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm2; t=1755413007;
	 x=1755499407; bh=ib+6pmy/IGwiUZJ5wb9Soyw48MWwjQNT1IJb8t+Ho9Y=; b=
	qPpisNymMFklaLVxrpHx7ELNVD0eqyPyr9PgY0UBZN6Z4mTKviLYUno2K6wLYfSZ
	4qDqLq5p46kElL59RFGC4RudSoFzaaI96i8jEXv4dXV389WSGG1ZcR/wpaGKzlrx
	9vZ06uwyMjU3bafz096pewL6sRQS0krVFoSWuGOcDdAnuIFzjhxK7sUxWoBU6yRd
	yXCJH/n5DRLWKVGfTdK5U7j5BjxV05c3G22aJszPV74iylrJG812g5Iy+692vGa7
	cynCAEnYI4+zr2a481MTb/nv9YEbaXEjo+IhiSlN4UBccZONwxiC0dNXGt6A+Z2q
	HL1Y7fIfA+sB2FKgmVGlvw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; t=1755413007; x=
	1755499407; bh=ib+6pmy/IGwiUZJ5wb9Soyw48MWwjQNT1IJb8t+Ho9Y=; b=H
	D2WMXs2yS7tSXHttmB/1vQTmyS/LwMlg61gdV/FgfuZMbpI/pxC34mmBIxGReGbi
	mMpCjGKmJFl6FLNa5ykpNl1DFWwm9ESX/65eKFyJ38EyUVe2peGZjddfYydiNCb9
	/ohRBhVhlnIzSxCdZnWCEITRgD1DlXDs0jqEgyH7W3hmtHRDB5TB/9a1FHZPlB7+
	4UNjY9MdQ4r1DTTJsy2gxvdYdvc/OviDOOZGr2DULHk00B3BdxAgarJmpbjnwUss
	D/0GloFDMvdkCb9RNj9s9tUugrLIJCId/Ct7frQ2nZMP/WnB6bzusB+hdpKxoVaO
	rCvp5oPMYV14VgH/PPSsQ==
X-ME-Sender: <xms:DnqhaE5IVrdjD01TED8Yof6CAJhyUaBLf1p-G3ywCX7QMp6SL9WPYA>
    <xme:DnqhaDe53suzkaB-nfHZX1zAcVkI7xOnpDc8jKk3la_2zlqqogYOX74ImKdauWVKW
    nH24Bh9fJcMyoh26l0>
X-ME-Received: <xmr:DnqhaJ60n-eShHpqYlqPqmZT22cF3vQhIadjWsW3ILS3lY8p9zcm4j4eUA1s52cF_Ej-sdYzv45Gi4wwNQRldnHPsA>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeeffedrtdefgddugeeltdegucetufdoteggodetrf
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
X-ME-Proxy: <xmx:DnqhaKuvouik7DO8QNkgg3iVaEmB2bjh1Uar1xrbHc8U-7gKcoyXCg>
    <xmx:DnqhaJjNCcWTUZch5fC7gYchfmDX0JxjrBBbYCpKA7fo5lbD16Xn7w>
    <xmx:DnqhaFp13X-FH9qQRlXNYdRWpxBBYDCZgwL-Z-9MRDnptH2_lJY_IQ>
    <xmx:DnqhaGvOGjI2xYb_NfWOD5uP8r2OUyZNrGPpFlSZN1wE-HhbXGI_SA>
    <xmx:D3qhaHZKYZ4w6uPrU7EkjK8sTeWvTMIqn9V6FGgRUbOpO0VQmXNTZhgy>
Feedback-ID: i80c9496c:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Sun,
 17 Aug 2025 02:43:25 -0400 (EDT)
Date: Sun, 17 Aug 2025 08:42:59 +0200
From: Niklas =?utf-8?Q?S=C3=B6derlund?= <niklas.soderlund+renesas@ragnatech.se>
To: David Gibson <david@gibson.dropbear.id.au>
Cc: Rob Herring <robh@kernel.org>, Saravana Kannan <saravanak@google.com>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	devicetree-compiler@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org
Subject: Re: [PATCH v2] checks: Remove check for graph child addresses
Message-ID: <20250817064259.GA487241@ragnatech.se>
References: <20250812165122.313382-1-niklas.soderlund+renesas@ragnatech.se>
 <aKANBt7QzzMWhIaJ@zatzit>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <aKANBt7QzzMWhIaJ@zatzit>

Hi David,

Thanks for your feedback.

On 2025-08-16 14:45:58 +1000, David Gibson wrote:
> On Tue, Aug 12, 2025 at 06:51:22PM +0200, Niklas Söderlund wrote:
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
> > Remove the check as it is somewhat redundant now that we can use schemas
> > to validate the full node.
> > 
> > Signed-off-by: Niklas Söderlund
> > <niklas.soderlund+renesas@ragnatech.se>
> 
> This causes test suite failures.  You'll need to also remove the
> explicit graph_child_address test from the testsuite.

Thanks for pointing this out. I'm no expert on DTC, this is the 
references to it in tests/run_tests.sh? Is there any more locations I 
should check?

> 
> Note that this patch does technically cause an incompatible change:
> when I suggested removing this I hadn't realised this was a single
> check, rather than a piece of a larger check.  That means that anyone
> configuring this test in their scripts will be broken by removing it.
> This is probably an obscure enough case that I'm prepared to accept
> it, though.
> 
> > ---
> > Changes since v2
> > - Rebase after 6.17-rc1 merge window closed.
> > ---
> >  checks.c | 27 +--------------------------
> >  1 file changed, 1 insertion(+), 26 deletions(-)
> > 
> > diff --git a/checks.c b/checks.c
> > index 7e3fed5005b3..2072e1ea82dc 100644
> > --- a/checks.c
> > +++ b/checks.c
> > @@ -1894,31 +1894,6 @@ static void check_graph_endpoint(struct check *c, struct dt_info *dti,
> >  }
> >  WARNING(graph_endpoint, check_graph_endpoint, NULL, &graph_nodes);
> >  
> > -static void check_graph_child_address(struct check *c, struct dt_info *dti,
> > -				      struct node *node)
> > -{
> > -	int cnt = 0;
> > -	struct node *child;
> > -
> > -	if (node->bus != &graph_ports_bus && node->bus != &graph_port_bus)
> > -		return;
> > -
> > -	for_each_child(node, child) {
> > -		struct property *prop = get_property(child, "reg");
> > -
> > -		/* No error if we have any non-zero unit address */
> > -                if (prop && propval_cell(prop) != 0 )
> > -			return;
> > -
> > -		cnt++;
> > -	}
> > -
> > -	if (cnt == 1 && node->addr_cells != -1)
> > -		FAIL(c, dti, node, "graph node has single child node '%s', #address-cells/#size-cells are not necessary",
> > -		     node->children->name);
> > -}
> > -WARNING(graph_child_address, check_graph_child_address, NULL, &graph_nodes, &graph_port, &graph_endpoint);
> > -
> >  static struct check *check_table[] = {
> >  	&duplicate_node_names, &duplicate_property_names,
> >  	&node_name_chars, &node_name_format, &property_name_chars,
> > @@ -2005,7 +1980,7 @@ static struct check *check_table[] = {
> >  
> >  	&alias_paths,
> >  
> > -	&graph_nodes, &graph_child_address, &graph_port, &graph_endpoint,
> > +	&graph_nodes, &graph_port, &graph_endpoint,
> >  
> >  	&always_fail,
> >  };
> 
> -- 
> David Gibson (he or they)	| I'll have my music baroque, and my code
> david AT gibson.dropbear.id.au	| minimalist, thank you, not the other way
> 				| around.
> http://www.ozlabs.org/~dgibson



-- 
Kind Regards,
Niklas Söderlund

