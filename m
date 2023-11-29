Return-Path: <linux-renesas-soc+bounces-399-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 484427FD62B
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 29 Nov 2023 13:02:27 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 5DFBC1C20CCE
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 29 Nov 2023 12:02:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4CC741D552;
	Wed, 29 Nov 2023 12:02:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=arndb.de header.i=@arndb.de header.b="QW4VlBp1";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="URfR18ym"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from out4-smtp.messagingengine.com (out4-smtp.messagingengine.com [66.111.4.28])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9A92810C9;
	Wed, 29 Nov 2023 04:02:20 -0800 (PST)
Received: from compute5.internal (compute5.nyi.internal [10.202.2.45])
	by mailout.nyi.internal (Postfix) with ESMTP id 6EF3E5C019D;
	Wed, 29 Nov 2023 07:02:17 -0500 (EST)
Received: from imap51 ([10.202.2.101])
  by compute5.internal (MEProxy); Wed, 29 Nov 2023 07:02:17 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arndb.de; h=cc
	:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:sender:subject:subject:to:to; s=fm3; t=
	1701259337; x=1701345737; bh=qeH0MSPGZdUHKmhOy3xmIT++YC72JKMiLoP
	P6/RHZEU=; b=QW4VlBp1Gd3n+arhV6+heiWGdBNSZhSgA3O5vpxyCWSSopSlE5a
	KeB8v7bnwpqKj3nOz2vSyeRJtSa4OkBIkx2NWhu8UGM1Ie2BVEsewxnG6DI/SwKD
	gz9dmfWiWyytyCizYfGeGIkAO8KFw9R6jycqoMarJfXTZAb+aLNztZO7CdEVX319
	xzePs6bmEYl787sHfRKwsNUpg+pyRvokrdpSSyiUC3lpLHiiIqqKdPYEptbPv+AT
	LjhpR2hax3p8gIvt0iWHQH6uCsUx/OHGwggE8pCPNXmBwwyUKJZYvDONy5GjEZkC
	K/y64Qi94uSDGlAz6M319f4oKETKHiM/24A==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:sender:subject:subject:to:to:x-me-proxy
	:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=
	1701259337; x=1701345737; bh=qeH0MSPGZdUHKmhOy3xmIT++YC72JKMiLoP
	P6/RHZEU=; b=URfR18ymAhFYF8XbNUcXPhY/2acpXCTlQpmf1k/yoijy/npxoOx
	0ldqB7Jw8lo3HKTriTYoAh9ZhRuYuhSeVngB3/FDwVl1KFJn63gUH5SoPnbvGarG
	aodvqkqWdEgMJ/dkBK3F1qA0RpdxVqiU3rwYY0A2Y5730HdSjqzMeh2IJwDU0f88
	Hvry+zRN3uVzx98/xPKewzNajyzIOjZm7qduT5DliAiaOn7J0ICK7Ss38DKkljW0
	vCTqCdFnE4hnbjsuc7nLiedthu76XlnqYVErkn808kTXT5LEYAXwFZYZqwGGYgJ3
	WJ5Y/QcxFDhUnxjLPuto6fMyyXvmyeAq2SQ==
X-ME-Sender: <xms:SChnZUWh2xiztgYPLxp611a2Oa95Rl-H_8kIjprdagFwXyZdn1s4eQ>
    <xme:SChnZYnE-bHUb-T27HW1tjqM8v2KrnNP6AxOmP31iD6mjW-FQiY7t8vhfWmvOs9Q6
    QFo_HwQw9PfADmJzg8>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvkedrudeihedgfeefucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
    cujfgurhepofgfggfkjghffffhvfevufgtgfesthhqredtreerjeenucfhrhhomhepfdet
    rhhnugcuuegvrhhgmhgrnhhnfdcuoegrrhhnugesrghrnhgusgdruggvqeenucggtffrrg
    htthgvrhhnpeegfeejhedvledvffeijeeijeeivddvhfeliedvleevheejleetgedukedt
    gfejveenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpe
    grrhhnugesrghrnhgusgdruggv
X-ME-Proxy: <xmx:SShnZYYcmCG0YihyxhjX0N-uNqn4idTvVUXZNc561y0ZKSnFckiTvw>
    <xmx:SShnZTX1z7vm8cKt6zQALGUSTJnOwI3lBQVo7ncQ2TkCNVYIn40s_A>
    <xmx:SShnZenJ-AwxTTrrZHSVS9n2iDuZ-Bs0sVeGFXc6jrbx6GMBl2uqhg>
    <xmx:SShnZVtwOB_2K-lbHeLfyXeVaLYwp5tnu8EwUNNr0nt8umjYxQSMxA>
Feedback-ID: i56a14606:Fastmail
Received: by mailuser.nyi.internal (Postfix, from userid 501)
	id E1EE3B60089; Wed, 29 Nov 2023 07:02:16 -0500 (EST)
X-Mailer: MessagingEngine.com Webmail Interface
User-Agent: Cyrus-JMAP/3.9.0-alpha0-1234-gac66594aae-fm-20231122.001-gac66594a
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Message-Id: <70eb5bdc-94b6-4b54-b578-13e66a69c962@app.fastmail.com>
In-Reply-To: <20231129111142.3322667-1-niklas.soderlund+renesas@ragnatech.se>
References: <20231129111142.3322667-1-niklas.soderlund+renesas@ragnatech.se>
Date: Wed, 29 Nov 2023 13:01:55 +0100
From: "Arnd Bergmann" <arnd@arndb.de>
To: 
 =?UTF-8?Q?Niklas_S=C3=B6derlund?= <niklas.soderlund+renesas@ragnatech.se>,
 "David S . Miller" <davem@davemloft.net>,
 "Eric Dumazet" <edumazet@google.com>, "Jakub Kicinski" <kuba@kernel.org>,
 "Paolo Abeni" <pabeni@redhat.com>,
 "Richard Cochran" <richardcochran@gmail.com>, Netdev <netdev@vger.kernel.org>
Cc: Linux-Renesas <linux-renesas-soc@vger.kernel.org>
Subject: Re: [net-next] net: ethernet: renesas: rcar_gen4_ptp: Depend on PTP_1588_CLOCK
Content-Type: text/plain;charset=utf-8
Content-Transfer-Encoding: quoted-printable

On Wed, Nov 29, 2023, at 12:11, Niklas S=C3=B6derlund wrote:
> When breaking out the Gen4 gPTP support to its own module the dependen=
cy
> on the PTP_1588_CLOCK framework was left as optional and only stated f=
or
> the driver using the module. This leads to issues when doing
> COMPILE_TEST of RENESAS_GEN4_PTP separately and PTP_1588_CLOCK is built
> as a module and the other as a built-in. Add an explicit depend on
> PTP_1588_CLOCK.
>
> While at it remove the optional support for PTP_1588_CLOCK from
> RENESAS_ETHER_SWITCH as the driver unconditionally calls the Gen4 gPTP
> module and thus also requires the PTP_1588_CLOCK framework.
>
> Reported-by: Arnd Bergmann <arnd@arndb.de>
> Fixes: 8c1c66235e03 ("net: ethernet: renesas: rcar_gen4_ptp: Break out=20
> to module")
> Signed-off-by: Niklas S=C3=B6derlund <niklas.soderlund+renesas@ragnate=
ch.se>

Reviewed-by: Arnd Bergmann <arnd@arndb.de>

Ideally someone should rework the driver (and the ravb one) to actually
leave out all the ptp related code when PTP is disabled, but this patch
avoids both the link failure and the possible logic issues for the momen=
t.

     Arnd

