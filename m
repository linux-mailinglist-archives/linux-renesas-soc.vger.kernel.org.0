Return-Path: <linux-renesas-soc+bounces-9793-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id DDE3099FDBF
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 16 Oct 2024 03:04:47 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 702ECB22AF2
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 16 Oct 2024 01:04:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E5F5E13A3F2;
	Wed, 16 Oct 2024 01:01:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sakamocchi.jp header.i=@sakamocchi.jp header.b="GsXS4HPt";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="lONXBMp/"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from fout-a2-smtp.messagingengine.com (fout-a2-smtp.messagingengine.com [103.168.172.145])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DDB68433C0;
	Wed, 16 Oct 2024 01:01:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=103.168.172.145
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729040516; cv=none; b=F81qLA9BRuqCiNbV41sS/DqYZ/tj9fjSG9gEecbf0s23JoKfbmk/odqOCOBB9Jp9lVbYNkO/aBMtoJ8VvdfmUhzdSfwTLt/8yyM5nmJnz8JecuABpy/n/guQYgavYaY7UYv+cPMCsHEjartonebFGG30Ib+H3Y7DWb4bAktRla8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729040516; c=relaxed/simple;
	bh=KdpREzc9dGXqnwQc78NDdv4y2juh4OmvBapjp32dZhk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=WH/ZPbKP1thn4YgOWD7YmRVl3IdzX65MO2trr6fdild+XIgXpC9LNvvv/fzDNouemARzeA/lIrX1//yZGqiNx8V4q4cEH37rlcK+SdGZa6W43K8XKLvj0P2GTWZJfNg1hroiLeZ72s/dh3MgtP9ImNcWh9tcqdYpj80ENk2INIo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=sakamocchi.jp; spf=pass smtp.mailfrom=sakamocchi.jp; dkim=pass (2048-bit key) header.d=sakamocchi.jp header.i=@sakamocchi.jp header.b=GsXS4HPt; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=lONXBMp/; arc=none smtp.client-ip=103.168.172.145
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=sakamocchi.jp
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sakamocchi.jp
Received: from phl-compute-02.internal (phl-compute-02.phl.internal [10.202.2.42])
	by mailfout.phl.internal (Postfix) with ESMTP id DB8721380140;
	Tue, 15 Oct 2024 21:01:52 -0400 (EDT)
Received: from phl-mailfrontend-02 ([10.202.2.163])
  by phl-compute-02.internal (MEProxy); Tue, 15 Oct 2024 21:01:52 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sakamocchi.jp;
	 h=cc:cc:content-type:content-type:date:date:from:from
	:in-reply-to:in-reply-to:message-id:mime-version:references
	:reply-to:subject:subject:to:to; s=fm2; t=1729040512; x=
	1729126912; bh=ix1kaT0kXVOr670NC1pEd1wDq4DKtakXkrb5dNokVEg=; b=G
	sXS4HPtuN+L76rAyPCKvNjY9dpwyRe6IHN94Dn3Z7oX/N+vjlJU3EGX50hc9p5Wf
	5WUZdxsF664OqmnIZDAhy/o3C5g8iN3ALvNDZkkyVVVqVhbyw918dwp8GusbYvtA
	mEV+VAXTTNGwLWSvxEvG9u5DOPLARQLG/OsdxD97My0ZEESko9bGvmBiw+mfF8Nk
	03OIpZXR4tPvn0Gz1K4GWJphMlCmkJlZloljA1dwUo/iF3pUZN+BnN9BIpoTRsGF
	mwC2I1rFlRHVd4DMRIi+6gP5EH9cmF/8HlyIvmlwnmam1nHH9efJSQC/vPohvBtS
	yhQB6xmhC1hncrkdOrBDA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-type:content-type:date:date
	:feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:subject:subject:to
	:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
	fm2; t=1729040512; x=1729126912; bh=ix1kaT0kXVOr670NC1pEd1wDq4DK
	takXkrb5dNokVEg=; b=lONXBMp/qObhUx08ipU7/u89veRakSutm+7lH2ht57K0
	Un6wSCCe4otJJZHq5uTuDNvFGLxPT3aOcXfChl1oPI5AW4XHxQ3/oE3dUGlgT37H
	cJBOVQ424WDsF3Dt0v0wv0T1rYVq7Oy2/4wv80C7sZ8O9y+IHd08dU9/kVQZtOR0
	pYltpX/BdGinW5w5HTI1bRBhEUFd0V9hRiEEp7qaAV0xO1/BnkcA6WxRv+VvJDtN
	1FVsUBg+I6uoZrI7h5wzXGZHdU2W5JxdKPAh71xTuYsf7x7tW6+Za3/LEhckzNsn
	dgGsqywM6jB7WDfHPMxoaQXP1xx9YGeKAX8+s5YIRA==
X-ME-Sender: <xms:fxAPZ2XoHKpDWyU-7MU-ZwFWEGLZqDIN9yEKtKDwS1ab4tkU94e-Ug>
    <xme:fxAPZynNK4JMhZ1d0TqARnmoA1o0eIbjPPGejzH5uv_27TYtIYIztC4GGvLJVhyQm
    F5Dx7cHbMaMD5xQkgU>
X-ME-Received: <xmr:fxAPZ6aIJW65chvRKnav2m82-4LxEYQnif9jcw4gllxNzq5d6sUdKnaGz6hoPBvb7k6p-qHnA0czbZEIihd6gw0Ra_TRgtyn8vle>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeeftddrvdegkedggedvucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdggtfgfnhhsuhgsshgtrhhisggvpdfu
    rfetoffkrfgpnffqhgenuceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnh
    htshculddquddttddmnecujfgurhepfffhvfevuffkfhggtggujgesthdtredttddtvden
    ucfhrhhomhepvfgrkhgrshhhihcuufgrkhgrmhhothhouceoohdqthgrkhgrshhhihessh
    grkhgrmhhotggthhhirdhjpheqnecuggftrfgrthhtvghrnhepveeilefhudekffehkeff
    udduvedvfeduleelfeegieeljeehjeeuvdeghfetvedvnecuffhomhgrihhnpehkvghrnh
    gvlhdrohhrghenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhr
    ohhmpehoqdhtrghkrghshhhisehsrghkrghmohgttghhihdrjhhppdhnsggprhgtphhtth
    hopedufedpmhhouggvpehsmhhtphhouhhtpdhrtghpthhtohepkhhunhhinhhorhhirdhm
    ohhrihhmohhtohdrghigsehrvghnvghsrghsrdgtohhmpdhrtghpthhtohepphhrrggshh
    grkhgrrhdrtghsvghnghhgsehgmhgrihhlrdgtohhmpdhrtghpthhtohepsghrohhonhhi
    vgeskhgvrhhnvghlrdhorhhgpdhrtghpthhtohepthhifigrihesshhushgvrdgtohhmpd
    hrtghpthhtoheplhhgihhrugifohhougesghhmrghilhdrtghomhdprhgtphhtthhopehg
    vggvrhhtodhrvghnvghsrghssehglhhiuggvrhdrsggvpdhrtghpthhtoheplhhinhhugi
    dqshhouhhnugesvhhgvghrrdhkvghrnhgvlhdrohhrghdprhgtphhtthhopehpvghrvgig
    sehpvghrvgigrdgtiidprhgtphhtthhopehlihhnuhigqdhkvghrnhgvlhesvhhgvghrrd
    hkvghrnhgvlhdrohhrgh
X-ME-Proxy: <xmx:fxAPZ9W-q9BhCq_PnkOKMxTjDfSy1QndQUjLnCEwmleY8kN_MYwQBw>
    <xmx:fxAPZwljMwUJqUV2Ael1UnrZaLLmGOIel_xRQOwabvLRAah0PhCLvg>
    <xmx:fxAPZyfdDf0SssqcqvzU5ovGhx3xqs7w-0J5vt2mhSGMK0Z-TQFX4A>
    <xmx:fxAPZyHFKVg1Gu2TRR4Vw5H-uPzc9gCUNYXUxOWqfnFDnfZLVLTweQ>
    <xmx:gBAPZ-kJHo3p_T91pMDaIuHwCJ_WJ4QoE-gKnNTwPfGdMKFIQ7KvYXlp>
Feedback-ID: ie8e14432:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Tue,
 15 Oct 2024 21:01:48 -0400 (EDT)
Date: Wed, 16 Oct 2024 10:01:45 +0900
From: Takashi Sakamoto <o-takashi@sakamocchi.jp>
To: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Cc: "Lad, Prabhakar" <prabhakar.csengg@gmail.com>,
	Mark Brown <broonie@kernel.org>, Takashi Iwai <tiwai@suse.com>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	linux-sound@vger.kernel.org, Jaroslav Kysela <perex@perex.cz>,
	linux-kernel@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
	Biju Das <biju.das.jz@bp.renesas.com>,
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: Re: [PATCH 0/3] ASoC: Rename "sh" to "renesas"
Message-ID: <20241016010145.GA72114@workstation.local>
Mail-Followup-To: Takashi Sakamoto <o-takashi@sakamocchi.jp>,
	Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
	"Lad, Prabhakar" <prabhakar.csengg@gmail.com>,
	Mark Brown <broonie@kernel.org>, Takashi Iwai <tiwai@suse.com>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	linux-sound@vger.kernel.org, Jaroslav Kysela <perex@perex.cz>,
	linux-kernel@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
	Biju Das <biju.das.jz@bp.renesas.com>,
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
References: <20241015113757.152548-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <CA+V-a8u8bkCjL-YSyMOiKOtfZC8upBwGzhrJ0o+EmZ9S3z5hGA@mail.gmail.com>
 <87h69cevrt.wl-kuninori.morimoto.gx@renesas.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <87h69cevrt.wl-kuninori.morimoto.gx@renesas.com>

Hi,

On Wed, Oct 16, 2024 at 12:28:22AM +0000, Kuninori Morimoto wrote:
> Please add/remove
> 
> + L: alsa-devel@alsa-project.org

Just a small nitpicking, but I think it better to take care of a merged
commit in which the list address for sound subsystem is changed to
linux-sound@vger.kernel.org. See:

https://git.kernel.org/pub/scm/linux/kernel/git/tiwai/sound.git/commit/MAINTAINERS?h=for-next&id=33027006ecf3


Regards

Takashi Sakamoto

