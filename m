Return-Path: <linux-renesas-soc+bounces-24206-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id AB369C3A56F
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 06 Nov 2025 11:47:37 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 5AA6A422787
	for <lists+linux-renesas-soc@lfdr.de>; Thu,  6 Nov 2025 10:42:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EFDC42DAFB0;
	Thu,  6 Nov 2025 10:42:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ragnatech.se header.i=@ragnatech.se header.b="jCHGcS/5";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="finW6O2T"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from fhigh-a2-smtp.messagingengine.com (fhigh-a2-smtp.messagingengine.com [103.168.172.153])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0456A1E0DE8;
	Thu,  6 Nov 2025 10:42:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=103.168.172.153
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762425734; cv=none; b=f49wQ+YdcGTjz2DPAGAdw/gtmkM4E4nIjbVuF3YvaldIZEyL3qyOTJhTyWhPSdG4q4F9PJBTPwsoiEKzXAwufuMfVAc4xzi6waWWFG0T1tqACZJBGbZ+7PNRxjyzPTKGAcceiDLMsNp8Q6CTl6rFNyBk4BRFaJ+7Rk1JRgNXdMg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762425734; c=relaxed/simple;
	bh=f44J5FGKhIdobVdRKmbTNfbjWtEjuOmkJnlxikhyrbs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=nBKokR5BGiYEESff4UAg0UU1yZIg0ymManv082xrgxKAIj1m2noERFfaqD9tJ82kBr6+1ENMXF4J0AvIOKlLapT0mu1SWcCWsh8BExuTAJIEw+jZD3ZAiIfvJ1RHrs9GbHSJz20EDtJ/Ug1QRIxrDccgrFLuoBfrOemSeEts0qw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ragnatech.se; spf=pass smtp.mailfrom=ragnatech.se; dkim=pass (2048-bit key) header.d=ragnatech.se header.i=@ragnatech.se header.b=jCHGcS/5; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=finW6O2T; arc=none smtp.client-ip=103.168.172.153
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ragnatech.se
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ragnatech.se
Received: from phl-compute-04.internal (phl-compute-04.internal [10.202.2.44])
	by mailfhigh.phl.internal (Postfix) with ESMTP id 2B56E14000C2;
	Thu,  6 Nov 2025 05:42:11 -0500 (EST)
Received: from phl-mailfrontend-02 ([10.202.2.163])
  by phl-compute-04.internal (MEProxy); Thu, 06 Nov 2025 05:42:11 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ragnatech.se; h=
	cc:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm2; t=1762425731;
	 x=1762512131; bh=y9YGmVVr0g5A4cHb/AAzOC+6ym7F2BmC2FJTgejFzpo=; b=
	jCHGcS/5/SmHwC5PXkIJpjtFvvpCGuwDh5gPuzD8jQL8WBtt0gDbDIZ/dNKVsXJD
	+GW/jehswmgUETmJ/KIHHznY6uzF5zo1fHY5jTtp+8Tn8TgvlQqFmr/SJENP7c58
	hpcSVtwmQQ/xcXT3RzkxVnn2kOuYlrzu3R+5YT/+9YwebXCgO0kcvCzzc08vosH8
	Wovmhj+cemYxWJbTjkMcsmVhS4RiwQSMRbTyI47Iux0sx7A5Puayi+HeCVc95fgw
	7M6lNsTOsXAFX3VEkzP0HHni5zgXfDG9LMCcaIetyy/WwgLukIdBfoMTuf4GXk3c
	7VCEsbzcFZfq86Cec+ZIQg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; t=1762425731; x=
	1762512131; bh=y9YGmVVr0g5A4cHb/AAzOC+6ym7F2BmC2FJTgejFzpo=; b=f
	inW6O2T4Sinc/6Op5+6bPUJDSeysddPuHpNUUsUjcE+MXI+tcADAqjFKyyhEB7fw
	UDUdfmz0nUFLN0TZlq6ZWuDl2cXmc+Aj6s+XAGsEj9LQW6Vyqtk0lOTRrVtkfkQD
	JkrQeMBC4D88RjdZms91faQOKoNT9xIWcVkehQwP68TpLA9I0aDBKWF9kwsIFxAb
	a4rjGn3t6Cj309EM/XaZbvCAP7ykAE22pXi1o456TfrZUEWgFDcnK0LYYgIFuA98
	V6ryVlHJhWfA6+aILgyrqZcXV2FFoevVhkdRAJIZQBluGI2PpmbxB34qE7FU5Isp
	EH1oYkW1tip6GWfRSmQCg==
X-ME-Sender: <xms:gnsMaRlRoTfLXXrF7DFB7KGFlCVRHBpHZKCXj2fh-sqXz4HgWXu_8w>
    <xme:gnsMaS11muja1HAK2WrfGvrS5_0NbHwcAz9ANEWWx8KZrCyUqq9E-tWjCnoFx3caJ
    ITRrEAt1Q-U84cLjQHUJagcdceuKnFCBYmzvLagmzg58gyNMB5udxQ>
X-ME-Received: <xmr:gnsMaSe7Rm4878Woo-bDOVGCmS9-rqDsKLxT6zQBPELEMIJj7N1t0i0ynMSpGhBjbn_QgzAHAQrhmCTOO6tuvmn9UmK2B58>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeeffedrtdeggddukeeiheejucetufdoteggodetrf
    dotffvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfurfetoffkrfgpnffqhgenuceu
    rghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujf
    gurhepfffhvfevuffkfhggtggugfgjsehtkeertddttdejnecuhfhrohhmpefpihhklhgr
    shcuufpnuggvrhhluhhnugcuoehnihhklhgrshdrshhouggvrhhluhhnugdorhgvnhgvsh
    grshesrhgrghhnrghtvggthhdrshgvqeenucggtffrrghtthgvrhhnpeefhfellefhffej
    gfefudfggeejlefhveehieekhfeulefgtdefueehffdtvdelieenucevlhhushhtvghruf
    hiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpehnihhklhgrshdrshhouggvrhhl
    uhhnugdorhgvnhgvshgrshesrhgrghhnrghtvggthhdrshgvpdhnsggprhgtphhtthhope
    dutddpmhhouggvpehsmhhtphhouhhtpdhrtghpthhtohepkhhriihksehkvghrnhgvlhdr
    ohhrghdprhgtphhtthhopehgvggvrhhtodhrvghnvghsrghssehglhhiuggvrhdrsggvpd
    hrtghpthhtohepmhhtuhhrqhhuvghtthgvsegsrgihlhhisghrvgdrtghomhdprhgtphht
    thhopehssghohigusehkvghrnhgvlhdrohhrghdprhgtphhtthhopehrohgshheskhgvrh
    hnvghlrdhorhhgpdhrtghpthhtohepkhhriihkodgutheskhgvrhhnvghlrdhorhhgpdhr
    tghpthhtoheptghonhhorhdoughtsehkvghrnhgvlhdrohhrghdprhgtphhtthhopehlih
    hnuhigqdhrvghnvghsrghsqdhsohgtsehvghgvrhdrkhgvrhhnvghlrdhorhhgpdhrtghp
    thhtoheplhhinhhugidqtghlkhesvhhgvghrrdhkvghrnhgvlhdrohhrgh
X-ME-Proxy: <xmx:gnsMaUbKqJxdJhiQtzbSSnd9dsccGCwE-h2RqsaK5daNyIlZ9KziLA>
    <xmx:gnsMafHFmw9XqKQO9J04WmqWAofHenzHE45wR_zy2lOdeVPaAUbp3Q>
    <xmx:gnsMaalTznO8aXSdexe0eTEdydxqioDOlOHIUv760eAPnv6898ZEtw>
    <xmx:gnsMaae4HVNXCF0a_H9H6h-0zNDKoIBTghj2OR9jShq06hgEHBKfNw>
    <xmx:g3sMafrEo14cPgriH1shnuRfaUetc-twW8xvmkq-HjaxjSB2V_BQtXrB>
Feedback-ID: i80c9496c:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Thu,
 6 Nov 2025 05:42:10 -0500 (EST)
Date: Thu, 6 Nov 2025 11:42:08 +0100
From: Niklas =?utf-8?Q?S=C3=B6derlund?= <niklas.soderlund+renesas@ragnatech.se>
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Geert Uytterhoeven <geert+renesas@glider.be>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	linux-renesas-soc@vger.kernel.org, linux-clk@vger.kernel.org,
	devicetree@vger.kernel.org
Subject: Re: [PATCH 0/2] clk: renesas: r8a779a0: Add clocks needed for GPU
Message-ID: <20251106104208.GE3684509@ragnatech.se>
References: <20251105231815.1927239-1-niklas.soderlund+renesas@ragnatech.se>
 <20251106-nocturnal-uptight-kagu-87bce8@kuoka>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20251106-nocturnal-uptight-kagu-87bce8@kuoka>

Hello Krzysztof,

Thanks for your feedback.

On 2025-11-06 10:10:51 +0100, Krzysztof Kozlowski wrote:
> On Thu, Nov 06, 2025 at 12:18:13AM +0100, Niklas Söderlund wrote:
> > Hi Geert,
> > 
> > This small series adds the clocks needed to use the GPU on V3U. The 
> > first is by far the most complex as the whole tree branch needed to be 
> > described.
> > 
> > With this and soon to be posted DT patches the GPU on V3U.
> 
> You have checkpatch warning which is important, because would block from
> merging DTS if it uses the binding header constant.
> 
> DTS cannot depend or even be based on driver patches.

Indeed, my bad. I saw the warning and check how this was handled in the 
past. I found other commits doing what I did here, but I have now been 
educated that the ones I looked at where a special case and the correct 
thing is to split this.

Will fix, and thank you for your time letting me know!

> 
> Best regards,
> Krzysztof
> 

-- 
Kind Regards,
Niklas Söderlund

