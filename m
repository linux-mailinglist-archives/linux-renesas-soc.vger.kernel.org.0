Return-Path: <linux-renesas-soc+bounces-21924-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id BF170B59713
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 16 Sep 2025 15:11:40 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 75E4E485956
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 16 Sep 2025 13:11:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 79C3B29ACEE;
	Tue, 16 Sep 2025 13:09:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ragnatech.se header.i=@ragnatech.se header.b="mHy9trfc";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="SKzlUm7o"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from fhigh-b6-smtp.messagingengine.com (fhigh-b6-smtp.messagingengine.com [202.12.124.157])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8F0CD314A8D;
	Tue, 16 Sep 2025 13:09:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=202.12.124.157
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758028183; cv=none; b=mqB8LTaVLzSuU383g7ixaUMBRs1p2lsHGKXUOqHIiM+56wdWp0y07b+IN/X9BRlthn16ZUVokA9WgnEmSFwbH0vPeBWZ9mzJ0UDUIVFSshLS+dNH94VoVhz8aZn0qi9KY+8e6O0jnt6ZVkkhaiD4FiLFAu2B4aGiSIOAuCrB14w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758028183; c=relaxed/simple;
	bh=7t1DSmWPBV7Ep4cXIBfIkNKeLzym3rQus0S4yZvxJOo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=iusUp0hGxvZWPZrAW0v1sxPZude5u2qxmo4la8x2JiOBspvnehOqHQjQUFJjA/3dJf80BJfshcu4OFHAUqbFL3Ypqz5BPX6Vsn2YpNEn+jeA3Uf01mZuM0Gf6tKh0e69fZjLeNL40Oqc4BX5NS0R/nFwWbfnJFiZvaxY/69KRV8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ragnatech.se; spf=pass smtp.mailfrom=ragnatech.se; dkim=pass (2048-bit key) header.d=ragnatech.se header.i=@ragnatech.se header.b=mHy9trfc; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=SKzlUm7o; arc=none smtp.client-ip=202.12.124.157
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ragnatech.se
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ragnatech.se
Received: from phl-compute-03.internal (phl-compute-03.internal [10.202.2.43])
	by mailfhigh.stl.internal (Postfix) with ESMTP id 5EBE17A02B7;
	Tue, 16 Sep 2025 09:09:40 -0400 (EDT)
Received: from phl-mailfrontend-02 ([10.202.2.163])
  by phl-compute-03.internal (MEProxy); Tue, 16 Sep 2025 09:09:40 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ragnatech.se; h=
	cc:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm3; t=1758028180;
	 x=1758114580; bh=vqtACckqXXBnggK/TvO0gaH/m3c1JrFkfitNI82HTL4=; b=
	mHy9trfc2up+BLc0JX/8LSI3g7iYYCDyu09kd9NwUo/lJCTSR82Q6PNtHJ/6zayo
	gmUvNAi7zK//25gpEXaZA4K4cYfMsYITRd0eHEURQmyppOTuElWpDmFADVjOHK2M
	eJVPIz6dBYoLnzvudBvujWh4IZ09y7SkOOe8n87q1WfuNWHCsNlrLZL/T0tJ+G65
	6KrhsXQ+rFvlq6p5QpENzCa2C5wRp8sXLs95Q1PDkY5mkIlH2bKtGuEGAFEe8wfB
	4GD1H9CTS00tZQK8A9vUuup9l6tP4fP6+6zTNVYGF8C4X4nxCAODtAQDwr9KRZ23
	7VztDiVvUNaHNy3o9sLzfA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=1758028180; x=
	1758114580; bh=vqtACckqXXBnggK/TvO0gaH/m3c1JrFkfitNI82HTL4=; b=S
	KzlUm7oH+Aa+KFi9G3jaZiZcsZZeIpNXr05cPEwh7zchMCd1SmAkaTWmM5g3fmo/
	Ghdjz1EaDjypusTUTAnxadfun+AQ+mP79my1pZIazvPX7i5eCOv7EaAdbR4X4xQp
	wmXVvTttwFK+BCAQ+cW6zFOBQuYfcyv+tYyQAwA66QGFdKdLRlSm1zJdXbkssjaX
	hQRJBDd+8v9kGeLGiQKV5Cdh3KP8P+D47JR+0Jx3IoE2MQ7rg0I3zSf1YVGg9FRj
	Gcqzmr3SQDC9uQkERunZ0ZuVOogzDIkj7TrD0dyv/SkL1vA5LU8ivwRBV9yinr96
	zPaB78oRdmGECc3bBz1hg==
X-ME-Sender: <xms:k2HJaETK0hTFVSQZQRY_ctHL8XMvVJquEuB1jsnsydT3xMgfXCkSpg>
    <xme:k2HJaL1BE0fY_VTvtuM96aLP3lUWUrzGv4CQd-kplh-Nlb8_tz1b160S1Aq_xMbIg
    8lcBt9qt9pypBXFdHM>
X-ME-Received: <xmr:k2HJaGwXKR5fcE56NRveqw977mNyBHH7Jxvr2BKKsHFWn94r-14M2BXiDB8eJVm_TM__q_VJilAKdkctsu8fUxMSrWmCtbD7PA>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeeffedrtdeggdegtdeihecutefuodetggdotefrod
    ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpuffrtefokffrpgfnqfghnecuuegr
    ihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjug
    hrpeffhffvvefukfhfgggtugfgjgesthekredttddtjeenucfhrhhomheppfhikhhlrghs
    ucfunpguvghrlhhunhguuceonhhikhhlrghsrdhsohguvghrlhhunhguodhrvghnvghsrg
    hssehrrghgnhgrthgvtghhrdhsvgeqnecuggftrfgrthhtvghrnhepfefhleelhfffjefg
    fedugfegjeelhfevheeikefhueelgfdtfeeuhefftddvleeinecuvehluhhsthgvrhfuih
    iivgeptdenucfrrghrrghmpehmrghilhhfrhhomhepnhhikhhlrghsrdhsohguvghrlhhu
    nhguodhrvghnvghsrghssehrrghgnhgrthgvtghhrdhsvgdpnhgspghrtghpthhtohepud
    efpdhmohguvgepshhmthhpohhuthdprhgtphhtthhopegrnhgurhgvfieslhhunhhnrdgt
    hhdprhgtphhtthhopehprghulhesphgsrghrkhgvrhdruggvvhdprhgtphhtthhopegrnh
    gurhgvfidonhgvthguvghvsehluhhnnhdrtghhpdhrtghpthhtohepuggrvhgvmhesuggr
    vhgvmhhlohhfthdrnhgvthdprhgtphhtthhopegvughumhgriigvthesghhoohhglhgvrd
    gtohhmpdhrtghpthhtohepkhhusggrsehkvghrnhgvlhdrohhrghdprhgtphhtthhopehp
    rggsvghnihesrhgvughhrghtrdgtohhmpdhrtghpthhtohephihoshhhihhhihhrohdrsh
    hhihhmohgurgdruhhhsehrvghnvghsrghsrdgtohhmpdhrtghpthhtohepghgvvghrthdo
    rhgvnhgvshgrshesghhlihguvghrrdgsvg
X-ME-Proxy: <xmx:k2HJaPzjB3xaLNhNUgCWSuEfaKZun41zSwgaWhQS0t2kKNrLrw5Ljg>
    <xmx:k2HJaK9tRjgOv5bDqlQBh8iof8CjJry0x87hv5UomHorouHStQVnzQ>
    <xmx:k2HJaB87U-NMHTei5y1_IkoNXHeTrKuAhvUGGSMJW7khKPQhzsxoOg>
    <xmx:k2HJaK5NoiTvYE7Gbw4uPU3AH32hZUtIMRbWCvE-kNjzcoxs8K5JmA>
    <xmx:lGHJaBg9pWMYP9XR7G6DPbkMfh26_E2gdpUkR8RTfmRGTzQbayfTBpNT>
Feedback-ID: i80c9496c:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Tue,
 16 Sep 2025 09:09:39 -0400 (EDT)
Date: Tue, 16 Sep 2025 15:09:38 +0200
From: Niklas =?utf-8?Q?S=C3=B6derlund?= <niklas.soderlund+renesas@ragnatech.se>
To: Andrew Lunn <andrew@lunn.ch>
Cc: Paul Barker <paul@pbarker.dev>, Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Magnus Damm <magnus.damm@gmail.com>,
	Richard Cochran <richardcochran@gmail.com>, netdev@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org
Subject: Re: [net-next 3/6] net: rswitch: Use common defines for time
 stamping control
Message-ID: <20250916130938.GE1045278@ragnatech.se>
References: <20250916101055.740518-1-niklas.soderlund+renesas@ragnatech.se>
 <20250916101055.740518-4-niklas.soderlund+renesas@ragnatech.se>
 <610436b7-ab28-4a76-b702-772b5756b17c@lunn.ch>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <610436b7-ab28-4a76-b702-772b5756b17c@lunn.ch>

On 2025-09-16 14:31:29 +0200, Andrew Lunn wrote:
> > -		get_ts = rdev->priv->tstamp_rx_ctrl & RCAR_GEN4_RXTSTAMP_TYPE_V2_L2_EVENT;
> > +		get_ts = rdev->priv->tstamp_rx_ctrl != HWTSTAMP_FILTER_NONE;
> 
> That is not an obvious transformation. The first looks like a specific
> subset of events, while the second looks like any sort. It might be
> worth commenting about this in the commit message.

Good point, I will do so in v2.

> 
>     Andrew
> 
> ---
> pw-bot: cr

-- 
Kind Regards,
Niklas Söderlund

