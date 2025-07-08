Return-Path: <linux-renesas-soc+bounces-19394-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 2F7E3AFD06F
	for <lists+linux-renesas-soc@lfdr.de>; Tue,  8 Jul 2025 18:18:20 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 3C7964280BD
	for <lists+linux-renesas-soc@lfdr.de>; Tue,  8 Jul 2025 16:17:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3F3572E1C65;
	Tue,  8 Jul 2025 16:18:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ragnatech.se header.i=@ragnatech.se header.b="TB0LHkGt";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="As4/7X/F"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from fhigh-b4-smtp.messagingengine.com (fhigh-b4-smtp.messagingengine.com [202.12.124.155])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 73D3A21A426;
	Tue,  8 Jul 2025 16:18:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=202.12.124.155
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751991494; cv=none; b=IExK53jByG8pwUSaCVXumzTXBVm4SVwwTE+EW4hW5Sr2aEABxNFOO2b4S6EKI6tdPiK1rvh/0M5C7oOOQCsNCQUUb8PXYtiBqseuojVvu+Gj0oqj9TfbC/jvXg86pQidxAWl0NPXrB+/2nH8Cz87QIIc631hUSgN6oLT5UQ45Fc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751991494; c=relaxed/simple;
	bh=dryBCeRanaSKC3KSIZdco4PvBDmkn7sbCKozEVF6TEc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=HaR4sXHzPpjJqVUWqVTywHHPvtG/9MrA/iJW5d/IZ45Mbgx2tdSfqxzTwfx1dmPa+Gnmk7mriGUGR1vK1NP8OtmT0Amr0GLpl6M0e+FprXoiw6AxLWEsM6y5So0l8IsC4nh9yxhngJ2RGxT9nmW5wVBbH+xoUx2c4mBI7i4i0XY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ragnatech.se; spf=pass smtp.mailfrom=ragnatech.se; dkim=pass (2048-bit key) header.d=ragnatech.se header.i=@ragnatech.se header.b=TB0LHkGt; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=As4/7X/F; arc=none smtp.client-ip=202.12.124.155
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ragnatech.se
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ragnatech.se
Received: from phl-compute-12.internal (phl-compute-12.phl.internal [10.202.2.52])
	by mailfhigh.stl.internal (Postfix) with ESMTP id 866597A015A;
	Tue,  8 Jul 2025 12:18:10 -0400 (EDT)
Received: from phl-mailfrontend-02 ([10.202.2.163])
  by phl-compute-12.internal (MEProxy); Tue, 08 Jul 2025 12:18:10 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ragnatech.se; h=
	cc:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm1; t=1751991490;
	 x=1752077890; bh=NfROuzrJSbw2grJ6GM2uOV14LjZuQ6VaXQF3xvusaco=; b=
	TB0LHkGt/dOUc/WZuKf5LW3+OlpqdgYjhMRxjKsXmFgsCLiI+TOrqK/J7nQCV5MD
	SJ3qioor1CGCgdmIWGqxInuy7aHxIEw0SJEjCXXckb0vLBbvTHP3SodZIb5nyidE
	+LsRAl0Odp4B7mgDDA5dU/Y097QkQp/9YBIONh287E5HnAxQ7vc0yACAi3LkfIiN
	3ol8N3xfCpF+iaexzFuYwzWGZhfk1oWWuEfNwla8ls/6f6+k/Unx/i3o9UBjPXw4
	6p1piWSCNROcrVws7pSG8XV4p7w0OWxTx7Y7UfKwNncYYQ7vJUf+ZNBrI/c9xVEI
	ONz7kklQGzYg6K0M12qOwA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; t=1751991490; x=
	1752077890; bh=NfROuzrJSbw2grJ6GM2uOV14LjZuQ6VaXQF3xvusaco=; b=A
	s4/7X/F72zbPt0f5GtiVmvCs7SVdk1ZlXxCpHw9zPirMyeU6h+sFJ9mZdwXjLyYt
	0b9ZZQ6uFrdAc4NoamM4WtIdYmzSt9NIdSw8boC+F7gr5g18M3GwwKdoQggvDlyv
	hv9HgoAh28wJaXtQR6/fK/dbWBy9ZmySsmncx+q3V2oS+Prl/+STaEEhUqolacwl
	mmBEmQhXjVHKclLjCKu82bWGgXtRXpJbJPb5XseRgQ0ncYbkrMMXjUh0skgGv8nV
	7a3vpkIfY+l3RWsQEWNM32aFgB+OKzRQgPTOxCPc/zympt3itaDdELjY1KrczLUu
	pBcGFPzldhUEIvb1wQxgQ==
X-ME-Sender: <xms:wURtaDVHE-jNm2Olckqp-WT1INdEBZZ7iG08Cawh6T-3RNQG3L7eSA>
    <xme:wURtaJLLTqgKAZNrYf-ygJOU_nrpbgRZg_NyuHoSuIYFwRMLtkNKf66Vi7r-wyiKW
    0qATXkvC6MU8bDtgG0>
X-ME-Received: <xmr:wURtaF1HuUkV37EWPVMNw9aRlXgssVR-S0PXtkdJQJHFYftuAAZcIEt7uCCADR7oPKLKalPQGYbTm0BwiN2xnzTUIV49sWFZ3w>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeeffedrtdefgdefhedugecutefuodetggdotefrod
    ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpuffrtefokffrpgfnqfghnecuuegr
    ihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjug
    hrpeffhffvvefukfhfgggtugfgjgesthekredttddtjeenucfhrhhomheppfhikhhlrghs
    ucfunpguvghrlhhunhguuceonhhikhhlrghsrdhsohguvghrlhhunhguodhrvghnvghsrg
    hssehrrghgnhgrthgvtghhrdhsvgeqnecuggftrfgrthhtvghrnhepffekgfdukeeghffh
    jeetvdeitdegteeikeffieduhfegveetjeevtdffvdekffdtnecuffhomhgrihhnpehkvg
    hrnhgvlhdrohhrghenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhl
    fhhrohhmpehnihhklhgrshdrshhouggvrhhluhhnugdorhgvnhgvshgrshesrhgrghhnrg
    htvggthhdrshgvpdhnsggprhgtphhtthhopeeipdhmohguvgepshhmthhpohhuthdprhgt
    phhtthhopehrohgshheskhgvrhhnvghlrdhorhhgpdhrtghpthhtohepuggrvhhiugesgh
    hisghsohhnrdgurhhophgsvggrrhdrihgurdgruhdprhgtphhtthhopehsrghrrghvrghn
    rghksehgohhoghhlvgdrtghomhdprhgtphhtthhopehgvggvrhhtodhrvghnvghsrghsse
    hglhhiuggvrhdrsggvpdhrtghpthhtohepuggvvhhitggvthhrvggvsehvghgvrhdrkhgv
    rhhnvghlrdhorhhgpdhrtghpthhtoheplhhinhhugidqrhgvnhgvshgrshdqshhotgesvh
    hgvghrrdhkvghrnhgvlhdrohhrgh
X-ME-Proxy: <xmx:wURtaP7EcZGxW-AHpw9MQr0vbTt7Q3l5ghuiHe5Y-5y5_WBQ_eG7Ew>
    <xmx:wURtaO9z4lTdnAaiMb-gd-tfdC22FxqvBvd2LtHqIuqk9Mb3nU5zZA>
    <xmx:wURtaGVywi73B-1OKSCOyHmu0GqH6oEduiYxmWLe4xgUZLP65JZO3A>
    <xmx:wURtaBpuFjW4AM7GFwSIx9153VWL3PMQE0mpgeDfnEii2lI8O1E51g>
    <xmx:wkRtaI1dB9frcgUcio1bRVvesFvcnvAZAfVwJtvoq_4rUhZcrNbFMjfD>
Feedback-ID: i80c9496c:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Tue,
 8 Jul 2025 12:18:09 -0400 (EDT)
Date: Tue, 8 Jul 2025 18:18:07 +0200
From: Niklas =?utf-8?Q?S=C3=B6derlund?= <niklas.soderlund+renesas@ragnatech.se>
To: Rob Herring <robh@kernel.org>,
	David Gibson <david@gibson.dropbear.id.au>,
	Saravana Kannan <saravanak@google.com>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	devicetree@vger.kernel.org
Cc: linux-renesas-soc@vger.kernel.org
Subject: Re: [PATCH] checks: Remove check for graph child addresses
Message-ID: <20250708161807.GA1830614@ragnatech.se>
References: <20250708160201.141428-1-niklas.soderlund+renesas@ragnatech.se>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250708160201.141428-1-niklas.soderlund+renesas@ragnatech.se>

Hello,

This was sent to the wrong list, please ignore it. I have resent it to 
the correct devicetree-compiler@vger.kernel.org list.

Sorry for the noise.

On 2025-07-08 18:02:01 +0200, Niklas Söderlund wrote:
> The dtc graph_child_address check can't distinguish between bindings
> where there can only be a single endpoint, and cases where there can be
> multiple endpoints.
> 
> In cases where the bindings allow for multiple endpoints but only one is
> described false warnings about unnecessary #address-cells/#size-cells
> can be generated, but only if the endpoint described have an address of
> 0 (A), for single endpoints with a non-zero address (B) no warnings are
> generated.
> 
> A)
>     ports {
> 	#address-cells = <1>;
> 	#size-cells = <0>;
> 
> 	port@0 {
> 	    #address-cells = <1>;
> 	    #size-cells = <0>;
> 
> 	    sourceA: endpoint@0 {
> 		reg = <0>
> 	    };
> 	};
>     };
> 
> B)
>     ports {
> 	#address-cells = <1>;
> 	#size-cells = <0>;
> 
> 	port@0 {
> 	    #address-cells = <1>;
> 	    #size-cells = <0>;
> 
> 	    sourceB: endpoint@1 {
> 		reg = <1>
> 	    };
> 	};
>     };
> 
> Remove the check as it is somewhat redundant now that we can use schemas
> to validate the full node.
> 
> Signed-off-by: Niklas Söderlund <niklas.soderlund+renesas@ragnatech.se>
> ---
> Hello,
> 
> This started as an effort to demote this check to W=2 [1] and have then
> moved on from there to completely remove the check in this patch per
> David and Rob's suggestion.
> 
> This patch supersedes all other patches for my me in this area.
> 
> If this change is accepted in dtc and later checks.c synced to
> linux/scripts/dtc/checks.c one must also drop "-Wno-graph_child_address"
> from Documentation/devicetree/bindings/Makefile and
> scripts/Makefile.dtbs.
> 
> 1.  https://lore.kernel.org/all/20250702085008.689727-1-niklas.soderlund%2Brenesas@ragnatech.se/
> ---
>  checks.c | 27 +--------------------------
>  1 file changed, 1 insertion(+), 26 deletions(-)
> 
> diff --git a/checks.c b/checks.c
> index 123f2eb425f4..0b1fd9f13cb4 100644
> --- a/checks.c
> +++ b/checks.c
> @@ -1894,31 +1894,6 @@ static void check_graph_endpoint(struct check *c, struct dt_info *dti,
>  }
>  WARNING(graph_endpoint, check_graph_endpoint, NULL, &graph_nodes);
>  
> -static void check_graph_child_address(struct check *c, struct dt_info *dti,
> -				      struct node *node)
> -{
> -	int cnt = 0;
> -	struct node *child;
> -
> -	if (node->bus != &graph_ports_bus && node->bus != &graph_port_bus)
> -		return;
> -
> -	for_each_child(node, child) {
> -		struct property *prop = get_property(child, "reg");
> -
> -		/* No error if we have any non-zero unit address */
> -                if (prop && propval_cell(prop) != 0 )
> -			return;
> -
> -		cnt++;
> -	}
> -
> -	if (cnt == 1 && node->addr_cells != -1)
> -		FAIL(c, dti, node, "graph node has single child node '%s', #address-cells/#size-cells are not necessary",
> -		     node->children->name);
> -}
> -WARNING(graph_child_address, check_graph_child_address, NULL, &graph_nodes, &graph_port, &graph_endpoint);
> -
>  static struct check *check_table[] = {
>  	&duplicate_node_names, &duplicate_property_names,
>  	&node_name_chars, &node_name_format, &property_name_chars,
> @@ -2005,7 +1980,7 @@ static struct check *check_table[] = {
>  
>  	&alias_paths,
>  
> -	&graph_nodes, &graph_child_address, &graph_port, &graph_endpoint,
> +	&graph_nodes, &graph_port, &graph_endpoint,
>  
>  	&always_fail,
>  };
> -- 
> 2.50.0
> 

-- 
Kind Regards,
Niklas Söderlund

