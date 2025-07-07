Return-Path: <linux-renesas-soc+bounces-19325-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 8B915AFB3E4
	for <lists+linux-renesas-soc@lfdr.de>; Mon,  7 Jul 2025 15:04:49 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 3CFCA175897
	for <lists+linux-renesas-soc@lfdr.de>; Mon,  7 Jul 2025 13:04:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 57EBE29B23B;
	Mon,  7 Jul 2025 13:04:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ragnatech.se header.i=@ragnatech.se header.b="OsO71f3k";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="lJarg4NF"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from fhigh-b3-smtp.messagingengine.com (fhigh-b3-smtp.messagingengine.com [202.12.124.154])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E23D6275867;
	Mon,  7 Jul 2025 13:04:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=202.12.124.154
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751893482; cv=none; b=kxSGUFlWiLH8Oz1gK51g44fQEkkpb3Zf+zc8JRIbgtWOONsnxGFqMCCLWmI3FiVvyYlBcAHUcJPkdCBkMhQKU0c8JI5UisV+IL/UIAm5LBaWuMJ7LeTzmtkM9gF1/Ep3NYytJStbCyBqWNN1yErZ7JFgQrx0i5XduCgr4aEXuis=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751893482; c=relaxed/simple;
	bh=YvMqK8+O9BvdtDqAeuWnEmxWsI/E7JAhxBCSL5Mcq9A=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=KYsElPWGu3xBU8+gbsv1uJMjqpzKdbT1+betWPqDAw8gyAhQ73baXJeaxFctxF1EK/KxYEYIL30fFJ/uGKF4+sFn31PExN9SKESe09yEdClrkWvfvWDtF5xnlbYpZzWkndHwydwBW7969Da6T2Ep5CJaBqgvWc91nD0OxS51ObQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ragnatech.se; spf=pass smtp.mailfrom=ragnatech.se; dkim=pass (2048-bit key) header.d=ragnatech.se header.i=@ragnatech.se header.b=OsO71f3k; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=lJarg4NF; arc=none smtp.client-ip=202.12.124.154
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ragnatech.se
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ragnatech.se
Received: from phl-compute-10.internal (phl-compute-10.phl.internal [10.202.2.50])
	by mailfhigh.stl.internal (Postfix) with ESMTP id C84497A01D9;
	Mon,  7 Jul 2025 09:04:38 -0400 (EDT)
Received: from phl-mailfrontend-02 ([10.202.2.163])
  by phl-compute-10.internal (MEProxy); Mon, 07 Jul 2025 09:04:39 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ragnatech.se; h=
	cc:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm1; t=1751893478;
	 x=1751979878; bh=2oqFgoF7+sGP4MfFFa3XS0/hygDNP0/Cfs/DpHziMSE=; b=
	OsO71f3k5vGJAKb96eTuQqHp02wR+BxrglYvVSLUHRYHpWqGQqU4ZGi1QxjrVmsJ
	ecAP0xD1aa3+GK2An06b0bCRcAflwJGRI8fDgivdlesiLcOCvOmvCilBg3OPpCHm
	YpwmHKjM2KkN5ylcraAW2Gvm//eaZShRHNRCNsT48gq7UW6RKzrRlnKOug6lMveo
	3FVvK+YfhrsFAd2D2SrmoX5GHsXihdu3JvhDbwf5vesmR6YlFT0HV0ps+0TA3hFu
	UvL80tNe+hTG2cfivs3KCq6tBtD6GsPOJAuEOAvP//CuDpW7C4dZ6YrDY0dBWsjJ
	DdvNAO4cZzEP8s5CHPPLpg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; t=1751893478; x=
	1751979878; bh=2oqFgoF7+sGP4MfFFa3XS0/hygDNP0/Cfs/DpHziMSE=; b=l
	Jarg4NFbJHnqAyTQTDzQLmuCKeDHO7KFRgleyziW1ky0wUGEuRuXthtKwxS/gdc0
	xdLrrQYjEbGR7QD+B3S0rcrJl5+Yfhx0xdwkfDzt14WizLvkp0ryNScHc+QXuKwG
	dektJi5/eIYglKwMLnRUR79OXMO/ybm/AIqvOk97Ml+gOT5xiFWtTKbSMCiqSUGH
	x7MJqq4GegXQQXdOLyHL4oc3BfYXS0cuQipUHK4t9g5Z+Zcg6nDNCT4/4EgqU3xt
	ZU9fN1I1zcoxNLjf3Ju5T+ScvzHQ4lhXVdyDCQSPSCPJBlwVjIxDW08e9ZC29mkY
	RECR2qLtZJgzXVPMg2rew==
X-ME-Sender: <xms:5sVraIFrCr5u4XqPZERUo8uL7ex-oLvUvqWBmzelIyEewMZKD9X3qA>
    <xme:5sVraGg6MGiSd5Ytd0JgPy3uHn_BOteLxtVUGNGIeY0h0VpVYavzgC9HUyVcC-_2m
    _Pk1W2rxmQvj72jH8k>
X-ME-Received: <xmr:5sVraDBMmpnrvv0BN1D6GNoWI8OTiguucNRBeqSfNz4hTGo9vl5trCZDQoA-lJO5XlghZ_TpzcBfLPIO16BLwr3rejApv0irsw>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeeffedrtdefgdefudekkecutefuodetggdotefrod
    ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpuffrtefokffrpgfnqfghnecuuegr
    ihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjug
    hrpeffhffvvefukfhfgggtugfgjgesthekredttddtjeenucfhrhhomheppfhikhhlrghs
    ucfunpguvghrlhhunhguuceonhhikhhlrghsrdhsohguvghrlhhunhguodhrvghnvghsrg
    hssehrrghgnhgrthgvtghhrdhsvgeqnecuggftrfgrthhtvghrnhepfefhleelhfffjefg
    fedugfegjeelhfevheeikefhueelgfdtfeeuhefftddvleeinecuvehluhhsthgvrhfuih
    iivgeptdenucfrrghrrghmpehmrghilhhfrhhomhepnhhikhhlrghsrdhsohguvghrlhhu
    nhguodhrvghnvghsrghssehrrghgnhgrthgvtghhrdhsvgdpnhgspghrtghpthhtohepke
    dpmhhouggvpehsmhhtphhouhhtpdhrtghpthhtohepghgvvghrtheslhhinhhugidqmhei
    kehkrdhorhhgpdhrtghpthhtoheprhhosghhsehkvghrnhgvlhdrohhrghdprhgtphhtth
    hopehkrhiikhdoughtsehkvghrnhgvlhdrohhrghdprhgtphhtthhopegtohhnohhrodgu
    theskhgvrhhnvghlrdhorhhgpdhrtghpthhtohepmhgrrhgvkhdrvhgrshhuthdorhgvnh
    gvshgrshesmhgrihhlsghogidrohhrghdprhgtphhtthhopehlrghurhgvnhhtrdhpihhn
    tghhrghrthesihguvggrshhonhgsohgrrhgurdgtohhmpdhrtghpthhtoheplhhinhhugi
    dqrhgvnhgvshgrshdqshhotgesvhhgvghrrdhkvghrnhgvlhdrohhrghdprhgtphhtthho
    peguvghvihgtvghtrhgvvgesvhhgvghrrdhkvghrnhgvlhdrohhrgh
X-ME-Proxy: <xmx:5sVraAThKGY5OsvBi1Rw9LaiYS6Sc4jtpyjX9p_ULDkFvjorSdu_jg>
    <xmx:5sVraAVH9VMUMYuHRHMi1qNLvddg7TXUYGnHfEqNly0XCjCnYvD1sQ>
    <xmx:5sVraBeQ93L7w4bXU-IuCk84gpdr3F2Ouj7nPdFCEahXOorbmFf6gQ>
    <xmx:5sVraEK5nTPQwUeDXdIjSOGBG0bIOUTtkkXbPVooMZ0Oi-x1o0wS6g>
    <xmx:5sVraK_g1Q0TuUogpc-QyBKk2nTMJm7wc0aMqvqXYvZPpA-JwrTtLuDd>
Feedback-ID: i80c9496c:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Mon,
 7 Jul 2025 09:04:37 -0400 (EDT)
Date: Mon, 7 Jul 2025 15:04:35 +0200
From: Niklas =?utf-8?Q?S=C3=B6derlund?= <niklas.soderlund+renesas@ragnatech.se>
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Marek Vasut <marek.vasut+renesas@mailbox.org>,
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	linux-renesas-soc@vger.kernel.org, devicetree@vger.kernel.org
Subject: Re: [PATCH v3 2/5] arm64: dts: renesas: sparrow-hawk: Add overlay
 for IMX219 on J1
Message-ID: <20250707130435.GA1410739@ragnatech.se>
References: <20250704100734.3387856-1-niklas.soderlund+renesas@ragnatech.se>
 <20250704100734.3387856-3-niklas.soderlund+renesas@ragnatech.se>
 <CAMuHMdX-1KJ4yrNeNT1SYqvfrn+XEjWuMxQkNTKJ5j9+fxgDdw@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAMuHMdX-1KJ4yrNeNT1SYqvfrn+XEjWuMxQkNTKJ5j9+fxgDdw@mail.gmail.com>

Hi Geert,

On 2025-07-07 13:47:32 +0200, Geert Uytterhoeven wrote:
> Hi Niklas,
> 
> On Fri, 4 Jul 2025 at 12:08, Niklas Söderlund
> <niklas.soderlund+renesas@ragnatech.se> wrote:
> > Add an overlay to connect an IMX219 camera sensor to the J1 connector.
> > The IMX219 utilizes 2 CSI-2 D-PHY lanes. This enables the video capture
> > pipeline behind the CSI40 Rx to be enabled to process images from the
> > sensor.
> >
> > Signed-off-by: Niklas Söderlund <niklas.soderlund+renesas@ragnatech.se>
> 
> Thanks for your patch!

Thanks for your review.


> 
> > --- /dev/null
> > +++ b/arch/arm64/boot/dts/renesas/r8a779g3-sparrow-hawk-camera-j1-imx219.dtso
> 
> > +/* Page 29 / CSI_IF_CN */
> > +&csi40 {
> > +       status = "okay";
> > +
> > +       ports {
> > +               port {
> 
> The base arch/arm64/boot/dts/renesas/r8a779g0.dtsi has "port@0".

Indeed, this should be port@, will fix.

> Still, this is applied to the correct node?

As far as I can tell it did, and the cameras worked as expected.

> 
>     $ dtx_diff --color
> arch/arm64/boot/dts/renesas/r8a779g3-sparrow-hawk{,-camera-j1-imx219}.dtb
>     [...]
> 
>                                     port@0 {
>                                             reg = <0x00>;
>     +
>     +                                       endpoint {
>     +                                               bus-type = <0x04>;
>     +                                               clock-lanes = <0x00>;
>     +                                               data-lanes = <0x01 0x02>;
>     +                                               phandle = <0xf2>;
>     +                                               remote-endpoint = <0xf3>;
>     +                                       };
>                                     };
> 
>                                     port@1 {
>     [...]
> 
> > +                       csi40_in: endpoint {
> > +                               bus-type = <MEDIA_BUS_TYPE_CSI2_DPHY>;
> > +                               clock-lanes = <0>;
> > +                               data-lanes = <1 2>;
> > +                               remote-endpoint = <&imx219_j1_out>;
> > +                       };
> > +               };
> > +       };
> > +};
> 
> Gr{oetje,eeting}s,
> 
>                         Geert
> 
> -- 
> Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org
> 
> In personal conversations with technical people, I call myself a hacker. But
> when I'm talking to journalists I just say "programmer" or something like that.
>                                 -- Linus Torvalds

-- 
Kind Regards,
Niklas Söderlund

