Return-Path: <linux-renesas-soc+bounces-9419-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 363E999043B
	for <lists+linux-renesas-soc@lfdr.de>; Fri,  4 Oct 2024 15:27:58 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id E08E8282086
	for <lists+linux-renesas-soc@lfdr.de>; Fri,  4 Oct 2024 13:27:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DBDEC216A06;
	Fri,  4 Oct 2024 13:23:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=arndb.de header.i=@arndb.de header.b="Q7ywr9YU";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="ZsO+X6FZ"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from fout-a8-smtp.messagingengine.com (fout-a8-smtp.messagingengine.com [103.168.172.151])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 33FD12141D4;
	Fri,  4 Oct 2024 13:23:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=103.168.172.151
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728048214; cv=none; b=VX509WaBEWLjdsPPIM+sccsuLqA5vMifhjM0WeN7FDlr2tXWHBJdsx0j1h2dIjBGMjGxA4Xi/Chr++tl8tBYwMDgn8y2BmqtChScnpnnuTMDnvdUA1KR4w4izpOYvJJWmNDM+W3/e6U9OVS8yAOPiuYOxf/M/PZb9RgHXKEh6l0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728048214; c=relaxed/simple;
	bh=gc5Bj43ryAY1oE6FSGL2XIpGq2sHaR5xJn2aTP+LGi8=;
	h=MIME-Version:Date:From:To:Cc:Message-Id:In-Reply-To:References:
	 Subject:Content-Type; b=ozcVNnTmJAMeoW4K58/B6asxEIEv/CWT6EgRiknClHGHXxUM4KtLKKaP2NIk5RByVyimKOFe7S2oE6HCPxRIjcHlZ+TlrEV6MpeMouM7vF32oOOqpFt0nJkvJ6u5RqDf44NGjiE3EGHQQK0v3DXx82ef42oykrAuIKU1WVINpQk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arndb.de; spf=pass smtp.mailfrom=arndb.de; dkim=pass (2048-bit key) header.d=arndb.de header.i=@arndb.de header.b=Q7ywr9YU; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=ZsO+X6FZ; arc=none smtp.client-ip=103.168.172.151
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arndb.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arndb.de
Received: from phl-compute-10.internal (phl-compute-10.phl.internal [10.202.2.50])
	by mailfout.phl.internal (Postfix) with ESMTP id 38DF81380143;
	Fri,  4 Oct 2024 09:23:32 -0400 (EDT)
Received: from phl-imap-11 ([10.202.2.101])
  by phl-compute-10.internal (MEProxy); Fri, 04 Oct 2024 09:23:32 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arndb.de; h=cc
	:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm1; t=1728048212;
	 x=1728134612; bh=RhriD/TaXPb7FLVOWI5XPRBOIRiLBtQKDlWAplC3PTE=; b=
	Q7ywr9YUlpA9VKMoAFHkVgrXn7CAueGpYpS07rO6lbtXzWBe6tRCoo6zllYjqoDK
	AH7eqccovk5q0kOkROCqBeaOUnoxG+mUrcqZNhxi0owEuuo7vnYA3+2ya9nsdUdj
	wfRzrwxChgD/ht6LPpuRC1f6VusAMZ6yE2yD2EoZFl49fXNlK8OyeF/jtbgYKb51
	5214wMKuDz149A1NezrBjqbmpY+MUsD7LVFlbQ9DKXfShPijE2bBQlbljpqBLwaB
	eu22KBsktDDm5wYklu4ChIO5Y4QltXnhTg240gIo2HiDgxQyjg2hv06KLOZpCswF
	KMb1LdYxXNFfpqCTd2uTAQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; t=1728048212; x=
	1728134612; bh=RhriD/TaXPb7FLVOWI5XPRBOIRiLBtQKDlWAplC3PTE=; b=Z
	sO+X6FZuCN95SMgAcwM7P3JIZmqO1WG0K5n1UBIKZ1OkFcbPtqAdyt9K2Y77QrFY
	cSp/I06eDg4moPep63yqOmvWY7o+uLmMU/0jwzrVKEc+/VwGUmrmV1KLlJ5rMWj2
	tfnUst/FdMpRT2+UVdphHFSELfN+eohNP8FTdURXmcNJS2zCqlMVisivA/gSFZXt
	dypzqd5GH1Bj4cosaeDTQIJDO/6/kQruNFyZDGAFM4f0Z3caO2dTLM9lQIuoSGUO
	9AFWvkx3QrtXvksOCMAE70Vx0o49HwZr3yE1bGA7u/jcus/ojtnrZELf8ZNplUys
	YKDjtfXPuJzjgOwcNVJzg==
X-ME-Sender: <xms:U-z_ZlsUxv2KKPTmFb_TzDCs00AkiD4oOcYqq2OirOs3yXwFFr7lzw>
    <xme:U-z_ZueIevmx1bXc9XtTviZrwM86H2imuMCZnzbtyV3KR1kThyJk341Kcg5vacDNw
    bUPCFXqacad63k2U0A>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeeftddrvddvfedgieefucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdggtfgfnhhsuhgsshgtrhhisggvpdfu
    rfetoffkrfgpnffqhgenuceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnh
    htshculddquddttddmnecujfgurhepofggfffhvfevkfgjfhfutgfgsehtjeertdertddt
    necuhfhrohhmpedftehrnhguuceuvghrghhmrghnnhdfuceorghrnhgusegrrhhnuggsrd
    guvgeqnecuggftrfgrthhtvghrnhephfdthfdvtdefhedukeetgefggffhjeeggeetfefg
    gfevudegudevledvkefhvdeinecuvehluhhsthgvrhfuihiivgepudenucfrrghrrghmpe
    hmrghilhhfrhhomheprghrnhgusegrrhhnuggsrdguvgdpnhgspghrtghpthhtohepuddt
    pdhmohguvgepshhmthhpohhuthdprhgtphhtthhopehgvggvrhhtodhrvghnvghsrghsse
    hglhhiuggvrhdrsggvpdhrtghpthhtohepmhgrghhnuhhsrdgurghmmhesghhmrghilhdr
    tghomhdprhgtphhtthhopegtohhnohhrodgutheskhgvrhhnvghlrdhorhhgpdhrtghpth
    htohepkhhriihkodgutheskhgvrhhnvghlrdhorhhgpdhrtghpthhtoheprhhosghhsehk
    vghrnhgvlhdrohhrghdprhgtphhtthhopehsrhhinhhivhgrshdrkhgrnhgurghgrghtlh
    grsehlihhnrghrohdrohhrghdprhgtphhtthhopeihohhshhhihhhirhhordhshhhimhho
    uggrrdhuhhesrhgvnhgvshgrshdrtghomhdprhgtphhtthhopeguvghvihgtvghtrhgvvg
    esvhhgvghrrdhkvghrnhgvlhdrohhrghdprhgtphhtthhopehlihhnuhigqdhkvghrnhgv
    lhesvhhgvghrrdhkvghrnhgvlhdrohhrgh
X-ME-Proxy: <xmx:U-z_ZowsgM60VriucCaqilzX5Q9oNbFSfaiqxtf43ezfPRrpfoICvw>
    <xmx:U-z_ZsMrjNJ5d_Wmt4uJlSV0XQsU_rXyK6Va5-0nCqhbpS39MYFugg>
    <xmx:U-z_Zl-YB0PCfxTzLBnp_eIH3GncGJ_26hxz7A2buEywkGZqcWvtPQ>
    <xmx:U-z_ZsXWm7dZVqoXHUoKdDI8lF2gwLJfVcBsLNGYipKM7FwRLGvYuw>
    <xmx:VOz_ZkbDX58cSU443AkUNKmapm2MD2-qzxMM9i3sHnKOSyIyMcRY9V63>
Feedback-ID: i56a14606:Fastmail
Received: by mailuser.phl.internal (Postfix, from userid 501)
	id 825E22220071; Fri,  4 Oct 2024 09:23:31 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Date: Fri, 04 Oct 2024 13:23:11 +0000
From: "Arnd Bergmann" <arnd@arndb.de>
To: "Geert Uytterhoeven" <geert+renesas@glider.be>,
 "Srinivas Kandagatla" <srinivas.kandagatla@linaro.org>,
 "Rob Herring" <robh@kernel.org>, "Krzysztof Kozlowski" <krzk+dt@kernel.org>,
 "Conor Dooley" <conor+dt@kernel.org>, "Magnus Damm" <magnus.damm@gmail.com>,
 "Yoshihiro Shimoda" <yoshihiro.shimoda.uh@renesas.com>
Cc: devicetree@vger.kernel.org,
 Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
 linux-kernel@vger.kernel.org
Message-Id: <5b4afe5b-a7aa-483f-be53-cd6a8de777db@app.fastmail.com>
In-Reply-To: 
 <563d35a3613c3356536978c0e5dc5ad5e47bbd7d.1727963347.git.geert+renesas@glider.be>
References: <cover.1727963347.git.geert+renesas@glider.be>
 <563d35a3613c3356536978c0e5dc5ad5e47bbd7d.1727963347.git.geert+renesas@glider.be>
Subject: Re: [PATCH v3 resend 2/7] nvmem: Add R-Car E-FUSE driver
Content-Type: text/plain
Content-Transfer-Encoding: 7bit

On Thu, Oct 3, 2024, at 14:04, Geert Uytterhoeven wrote:
> R-Car Gen4 SoCs contain fuses indicating hardware support or hardware
> (e.g. tuning) parameters.  Add a driver to access the state of the
> fuses.  This supports two types of hardware fuse providers:
>   1. E-FUSE non-volatile memory accessible through the Pin Function
>      Controller on R-Car V3U and S4-8,
>   2. E-FUSE non-volatile memory accessible through OTP_MEM on R-Car V4H
>      and V4M.
>
> The state of the cells can be read using the NVMEM framework, either
> from kernel space (e.g. by the Renesas UFSHCD driver), or from
> userspace.
>
> Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
> Reviewed-by: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>

Acked-by: Arnd Bergmann <arnd@arndb.de>

