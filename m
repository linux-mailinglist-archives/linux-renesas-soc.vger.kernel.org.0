Return-Path: <linux-renesas-soc+bounces-23101-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 3520EBDFD9F
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 15 Oct 2025 19:28:57 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 40CA31A225F6
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 15 Oct 2025 17:29:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E32A033A012;
	Wed, 15 Oct 2025 17:28:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ragnatech.se header.i=@ragnatech.se header.b="Xnn2uZZW";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="gkTihk1+"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from fout-b1-smtp.messagingengine.com (fout-b1-smtp.messagingengine.com [202.12.124.144])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E3A4B1C3C18;
	Wed, 15 Oct 2025 17:28:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=202.12.124.144
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760549303; cv=none; b=RqqwWtaVPd4ifQwb7ZHgQtgrtZTtwhDUWJnstJyHeiDI1ZAFQMZ+bQjRv+rjZ+Y+2GATjuiy0s3zIbXwuF5W2b3uAe8J+UWogS9hts2Gfgytd5V7C/KRPfGCdA53WA3a0lZ6cDuIhRngJvZyKd3l/njjKHXSBsqSWX4/y0EYWOs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760549303; c=relaxed/simple;
	bh=KLAu0WkbxTquj5UduIpU9D4+mgxcmJNvrmsIXpRUhts=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=QjTNhN5LlBR9s1hyxpPbBACDCRP18OXt83SuMH39EnQYV3SmiTF5BOuMdhr49JyJNktDfcV+h8Y5hBwMbmZ347qarOzw1nFNj+tDwl7f80CpL/9+x2aOXQS7tAF0u4+FlLYx6eRDkoUfcfWJdMaLSaBcKy2G9s69sjbhHXmO+sg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ragnatech.se; spf=pass smtp.mailfrom=ragnatech.se; dkim=pass (2048-bit key) header.d=ragnatech.se header.i=@ragnatech.se header.b=Xnn2uZZW; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=gkTihk1+; arc=none smtp.client-ip=202.12.124.144
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ragnatech.se
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ragnatech.se
Received: from phl-compute-12.internal (phl-compute-12.internal [10.202.2.52])
	by mailfout.stl.internal (Postfix) with ESMTP id ABF5A1D000B4;
	Wed, 15 Oct 2025 13:28:19 -0400 (EDT)
Received: from phl-mailfrontend-02 ([10.202.2.163])
  by phl-compute-12.internal (MEProxy); Wed, 15 Oct 2025 13:28:20 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ragnatech.se; h=
	cc:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm1; t=1760549299;
	 x=1760635699; bh=uxcF+OfUHtuRDJBNiFRogPSSql7FFz2iQUFoqpX5I9A=; b=
	Xnn2uZZWVGZqlBaDMyuZ6VI+5w3mcoAUvQgBxttKlaaaRKOJYdJseMth7LBOHy6q
	ph9xxOIZX2tfHqDaQ1ONRWnhcetVfIlBkZp1QTsEpS/WSpgri8sUq1sFVpyolnnW
	1lRGPAOZgpwEwDSKMZV2K9Np9iMEDuxfB883JV1Yy1JDDzWguHsEASmpEOmU/OlI
	8jIX9MMUtntmriVBcaKunU6FoOd49EMPI7pLjO1J4FuQ7XZdZI6Ttt9963NMwTua
	pVOa+vuUJU9355ph8A5aHIRVKLrQ8cy3jr6+F7+EfBzcCE8bX++Z/DabnFgv3H5/
	U/dITq4THg9fFBPpFJYAiw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; t=1760549299; x=
	1760635699; bh=uxcF+OfUHtuRDJBNiFRogPSSql7FFz2iQUFoqpX5I9A=; b=g
	kTihk1+WS5RN+TCnGVAuAw9bHT3cCmEYz2R70ZbAe4WXMoZ7V5f89T9XFJhcQd9n
	2twKJGJQwG8FwfltgqOMNJMOPkt/qY79DmmSlpIhSN1z657lfDFikxXQcZUbFc00
	N5jTKyNIZBEz9HtygI+WKA5DZ4XZHABwPSF7BqL58WIbWBgjDO/IeVWJA+q6PrJ6
	2Qlj598eWApJQl17+gwMkO7H6qNqxHcxuZguNVgPhYy/KzUyBvEGwtsF70dSlW1Q
	4ZGOsT6mhyP0h+PcGes8/2Z1oIL1adE4laScUFv5CtDiPuQnBw7+hGQG3bC6peP+
	q1V4YDrgE9CPJiYM2TLDQ==
X-ME-Sender: <xms:stnvaHXOF_iP5kl8BcHKaq414OHVk1T-ZQ3xvxKR426YdAQhkE8QGg>
    <xme:stnvaLaNzePPZ6q27NNqPeC-W7IhzYbTU_43zVuANUaHNFIjRqJE1uDHr27ODJfQ1
    L69di3XG5cRZ9Q-YTUau_TssoPFPjvP3_7Mz_vb-sTNDFbK3RfHyQ>
X-ME-Received: <xmr:stnvaI4YJQNRk9u-8_lkDU-VF_D0tH5Lq60OqTr-Wb-NyNAaKakghgulFAO8GxVrtl7-UYPnO4nVdE5CwI29kBSGoY3mwAs>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeeffedrtdeggdduvdegtdduucetufdoteggodetrf
    dotffvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfurfetoffkrfgpnffqhgenuceu
    rghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujf
    gurhepfffhvfevuffkfhggtggugfgjsehtkeertddttdejnecuhfhrohhmpefpihhklhgr
    shcuufpnuggvrhhluhhnugcuoehnihhklhgrshdrshhouggvrhhluhhnugesrhgrghhnrg
    htvggthhdrshgvqeenucggtffrrghtthgvrhhnpeevteegtddvvdfhtdekgefhfeefheet
    heekkeegfeejudeiudeuleegtdehkeekteenucevlhhushhtvghrufhiiigvpedtnecurf
    grrhgrmhepmhgrihhlfhhrohhmpehnihhklhgrshdrshhouggvrhhluhhnugesrhgrghhn
    rghtvggthhdrshgvpdhnsggprhgtphhtthhopeduhedpmhhouggvpehsmhhtphhouhhtpd
    hrtghpthhtohepphhrrggshhgrkhgrrhdrtghsvghnghhgsehgmhgrihhlrdgtohhmpdhr
    tghpthhtohepphgruhhlsehpsggrrhhkvghrrdguvghvpdhrtghpthhtoheprghnughrvg
    ifodhnvghtuggvvheslhhunhhnrdgthhdprhgtphhtthhopegurghvvghmsegurghvvghm
    lhhofhhtrdhnvghtpdhrtghpthhtohepvgguuhhmrgiivghtsehgohhoghhlvgdrtghomh
    dprhgtphhtthhopehkuhgsrgeskhgvrhhnvghlrdhorhhgpdhrtghpthhtohepphgrsggv
    nhhisehrvgguhhgrthdrtghomhdprhgtphhtthhopehsvghrghgvihdrshhhthihlhihoh
    hvsegtohhgvghnthgvmhgsvgguuggvugdrtghomhdprhgtphhtthhopehnvghtuggvvhes
    vhhgvghrrdhkvghrnhgvlhdrohhrgh
X-ME-Proxy: <xmx:stnvaEwkv-et2aou0xaC26sh9W-E0OF3YkX4Z3kr8vzt00QSUme08A>
    <xmx:stnvaBoIdZYIzWWQ4jl8atJnqc32Y4A6u-IV9Mt-cuMDBTb1rq8qlA>
    <xmx:stnvaO0MEwnZWG4AJG2OFqjaDPAbv8VMGUsqMt1IqL8kXEiMoby4EQ>
    <xmx:stnvaCDtbae2Qb9k34FccCPnvwMAfm3yuf1-4cASv8jHDITvPWfAIA>
    <xmx:s9nvaKRIh6aAROuVrR_dVzF1H-TWh1Wh3NpMzeF1VZKwr9w0rTk6czye>
Feedback-ID: i80c9496c:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Wed,
 15 Oct 2025 13:28:18 -0400 (EDT)
Date: Wed, 15 Oct 2025 19:28:15 +0200
From: Niklas =?utf-8?Q?S=C3=B6derlund?= <niklas.soderlund@ragnatech.se>
To: "Lad, Prabhakar" <prabhakar.csengg@gmail.com>
Cc: Paul Barker <paul@pbarker.dev>, Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>,
	netdev@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
	linux-kernel@vger.kernel.org, Biju Das <biju.das.jz@bp.renesas.com>,
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>,
	stable@vger.kernel.org
Subject: Re: [PATCH 3/3] net: ravb: Enforce descriptor type ordering to
 prevent early DMA start
Message-ID: <20251015172815.GG439570@ragnatech.se>
References: <20251015150026.117587-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <20251015150026.117587-4-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <20251015155622.GE439570@ragnatech.se>
 <CA+V-a8vudn0=kSnaAT4qDCcRtVShmS+n2A4GOQH2iogYizUBzw@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CA+V-a8vudn0=kSnaAT4qDCcRtVShmS+n2A4GOQH2iogYizUBzw@mail.gmail.com>

Hello,

On 2025-10-15 18:01:13 +0100, Lad, Prabhakar wrote:
> Hi Niklas,
> 
> Thank you for the review.
> 
> On Wed, Oct 15, 2025 at 4:56 PM Niklas Söderlund
> <niklas.soderlund@ragnatech.se> wrote:
> >
> > Hi Prabhakar,
> >
> > Thanks for your work.
> >
> > On 2025-10-15 16:00:26 +0100, Prabhakar wrote:
> > > From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> > >
> > > Ensure TX descriptor type fields are written in a safe order so the DMA
> > > engine does not begin processing a chain before all descriptors are
> > > fully initialised.
> > >
> > > For multi-descriptor transmissions the driver writes DT_FEND into the
> > > last descriptor and DT_FSTART into the first. The DMA engine starts
> > > processing when it sees DT_FSTART. If the compiler or CPU reorders the
> > > writes and publishes DT_FSTART before DT_FEND, the DMA can start early
> > > and process an incomplete chain, leading to corrupted transmissions or
> > > DMA errors.
> > >
> > > Fix this by writing DT_FEND before the dma_wmb() barrier, executing
> > > dma_wmb() immediately before DT_FSTART (or DT_FSINGLE in the single
> > > descriptor case), and then adding a wmb() after the type updates to
> > > ensure CPU-side ordering before ringing the hardware doorbell.
> > >
> > > On an RZ/G2L platform running an RT kernel, this reordering hazard was
> > > observed as TX stalls and timeouts:
> > >
> > >   [  372.968431] NETDEV WATCHDOG: end0 (ravb): transmit queue 0 timed out
> > >   [  372.968494] WARNING: CPU: 0 PID: 10 at net/sched/sch_generic.c:467 dev_watchdog+0x4a4/0x4ac
> > >   [  373.969291] ravb 11c20000.ethernet end0: transmit timed out, status 00000000, resetting...
> > >
> > > This change enforces the required ordering and prevents the DMA engine
> > > from observing DT_FSTART before the rest of the descriptor chain is
> > > valid.
> > >
> > > Fixes: 2f45d1902acf ("ravb: minimize TX data copying")
> > > Cc: stable@vger.kernel.org
> > > Co-developed-by: Fabrizio Castro <fabrizio.castro.jz@renesas.com>
> > > Signed-off-by: Fabrizio Castro <fabrizio.castro.jz@renesas.com>
> > > Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> > > ---
> > >  drivers/net/ethernet/renesas/ravb_main.c | 14 +++++++++-----
> > >  1 file changed, 9 insertions(+), 5 deletions(-)
> > >
> > > diff --git a/drivers/net/ethernet/renesas/ravb_main.c b/drivers/net/ethernet/renesas/ravb_main.c
> > > index a200e205825a..2a995fa9bfff 100644
> > > --- a/drivers/net/ethernet/renesas/ravb_main.c
> > > +++ b/drivers/net/ethernet/renesas/ravb_main.c
> > > @@ -2211,15 +2211,19 @@ static netdev_tx_t ravb_start_xmit(struct sk_buff *skb, struct net_device *ndev)
> > >
> > >               skb_tx_timestamp(skb);
> > >       }
> > > -     /* Descriptor type must be set after all the above writes */
> > > -     dma_wmb();
> > > +
> > > +     /* For multi-descriptors set DT_FEND before calling dma_wmb() */
> > >       if (num_tx_desc > 1) {
> > >               desc->die_dt = DT_FEND;
> > >               desc--;
> > > -             desc->die_dt = DT_FSTART;
> > > -     } else {
> > > -             desc->die_dt = DT_FSINGLE;
> > >       }
> > > +
> > > +     /* Descriptor type must be set after all the above writes */
> > > +     dma_wmb();
> > > +     desc->die_dt = (num_tx_desc > 1) ? DT_FSTART : DT_FSINGLE;
> >
> > IMHO it's ugly to evaluate num_tx_desc twice. I would rather just open
> > code the full steps in each branch of the if above. It would make it
> > easier to read and understand.
> >
> I did this just to avoid compiler optimizations. With the previous
> similar code on 5.10 CIP RT it was observed that the compiler
> optimized code in such a way that the DT_FSTART was written first
> before DT_FEND while the DMA was active because of which we ran into
> DMA issues causing QEF errors.

I was thinking of something like

  /* Descriptor type must be set after all the above writes */
  dma_wmb();

  if (num_tx_desc > 1) {
          desc->die_dt = DT_FEND;
          desc--;
	  /* For multi-descriptors ensure DT_FEND before start
           * TODO: Add explanation about compiler optimised code etc.
           */
          dma_wmb();
          desc->die_dt = DT_FSTART;
  } else {
          desc->die_dt = DT_FSINGLE;
  }


Would make new new special case clearer to understand. And if we figure 
out different way of doing it it's very clear why the second dma_wmb() 
is needed. But after writing it out I'm not so sure anymore, maybe 
adding a temporary variable instead would make it a clearer read.

    u8 die_dt = DT_FSINGLE;

    /* For multi-descriptors ensure DT_FEND before DT_FEND
     * TODO: Add explanation about compiler optimised code etc.
     */
    if (num_tx_desc > 1) {
        desc->die_dt = DT_FEND;
        desc--;
        die_dt = DT_FSTART;
    }

    /* Descriptor type must be set after all the above writes */
    dma_wmb();
    desc->die_dt = die_dt;

I think my main complaint is that evaluating num_tx_desc > 1 multiple 
times makes the code read as stuff was just thrown into the driver until 
a test-case passed without understanding the root cause.

> 
> > > +
> > > +     /* Ensure data is written to RAM before initiating DMA transfer */
> > > +     wmb();
> >
> > All of this looks a bit odd, why not just do a single dma_wmb() or wmb()
> > before ringing the doorbell? Maybe I'm missing something obvious?
> >
> This wmb() was mainly added to ensure all the descriptor data is in
> RAM. The HW manual for RZ/G1/2, R-Car Gen1/2 and RZ/G2L family
> mentions that we need to read back the last written descriptor before
> triggering the DMA. Please let me know if you think this can be
> handled differently.

Have you observed any issues without the wmb() here?

What I'm trying to understand is why a new barrier is needed here when 
it have worked without one before. I'm likely just slow but what I'm 
trying to grasp is the need for the intermittent dma_wmb() above in 
relation to this one.

Should it not be, setup the descriptors, barrier to ensure it's in RAM, 
ring doorbell. The staggered method of setup descriptors, barrier, setup 
more descriptors, barrier, ring doorbell is what confuses me, I think 
:-)

> 
> Cheers,
> Prabhakar
> 
> > >       ravb_modify(ndev, TCCR, TCCR_TSRQ0 << q, TCCR_TSRQ0 << q);
> > >
> > >       priv->cur_tx[q] += num_tx_desc;
> > > --
> > > 2.43.0
> > >
> >
> > --
> > Kind Regards,
> > Niklas Söderlund

-- 
Kind Regards,
Niklas Söderlund

