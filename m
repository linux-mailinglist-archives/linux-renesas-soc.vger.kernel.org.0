Return-Path: <linux-renesas-soc+bounces-23102-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 81670BDFDB7
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 15 Oct 2025 19:29:45 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 6F0801A22A4D
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 15 Oct 2025 17:29:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7795433CE91;
	Wed, 15 Oct 2025 17:29:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ragnatech.se header.i=@ragnatech.se header.b="WPIM0HV/";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="XQls8kp2"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from fhigh-b1-smtp.messagingengine.com (fhigh-b1-smtp.messagingengine.com [202.12.124.152])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 53ADA338F3D;
	Wed, 15 Oct 2025 17:29:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=202.12.124.152
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760549349; cv=none; b=M5bX4KoJuzwYlJg0wbEGLLJ7HfrHVm7QjG3B4QaCEDPriUTOkMsgoiPS76g/jHC/iw4/zDHewu9Nzs4FIrVpU4JY9fpeuQRdiqvfsyHdRDAA0nNtag9HylYQWgvzt2XvEVrxQb7aLrNL8DneHjTgnSX2Xoq4y0iYVrHQmLCgCvQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760549349; c=relaxed/simple;
	bh=5H8mfESP3dxIzl/iGvVR1gvFW1pHz/AkUxhDW0bj/NQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=NZasA8rKcP+dEJpli9H2ErqCuolnvKF21C07HFu4jldmc8uji9PbWN8yPqSBwpuzWCFv39WiN6kW8JvTx9Cxh/h/QPR2b/xtQMcjxup1V2/rxRs6NlC+HvroLbvn0IPJn5QngEVGYotjEdFjN0wQJ+6iajp4xZKccQYYOeX2icc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ragnatech.se; spf=pass smtp.mailfrom=ragnatech.se; dkim=pass (2048-bit key) header.d=ragnatech.se header.i=@ragnatech.se header.b=WPIM0HV/; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=XQls8kp2; arc=none smtp.client-ip=202.12.124.152
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ragnatech.se
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ragnatech.se
Received: from phl-compute-12.internal (phl-compute-12.internal [10.202.2.52])
	by mailfhigh.stl.internal (Postfix) with ESMTP id 107D17A01A5;
	Wed, 15 Oct 2025 13:29:06 -0400 (EDT)
Received: from phl-mailfrontend-02 ([10.202.2.163])
  by phl-compute-12.internal (MEProxy); Wed, 15 Oct 2025 13:29:06 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ragnatech.se; h=
	cc:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm1; t=1760549345;
	 x=1760635745; bh=JpHOjUlmPxlqLmVUG2wnIN2rAbw2kC6v6XhYhWuP4pc=; b=
	WPIM0HV/YDsmOKB57DoRVOa9p+h6xRElVYHaTLnYrzCdpolPFSuW5LetWEfjEdm8
	Yk9mKBIdDwTtqhpyFILhEKfbB86s00z4lLtWfOt5LHV9zdreNn1k2GJF5lCuZIsc
	96sdeE1gKZpJnIOG7LTjF0O59MoEJNTaZino2aE4wmt2S0AnY8Zpio8DDfwGUpuM
	lqZ18HZ+p0ws+wbn9v1ROMZJE1AbW4Ru3C4jJWQ//qjcD74Tt+hbzTQy2aaqCW3H
	6EJeZqTfjFSao7bOt4m4VZaChAjtBYth1iBCbEUzVID0lJs173aTPRqpicmzOZWE
	AQHYxjDGQmUwM6ciRqwyBA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; t=1760549345; x=
	1760635745; bh=JpHOjUlmPxlqLmVUG2wnIN2rAbw2kC6v6XhYhWuP4pc=; b=X
	Qls8kp2kGS2gsJ6UBWJfeBqhRESqK4AnCrj52xoxcY8dh2tEQN5U9zSaxp4EqFaw
	QoYCdonF2qAXwVzIbywIqBshGFYWGhoEPjxaNCWQ7QnNhL6QWaKUByMbDp7M+bbc
	XpIBMfgGumKyHizR3fvx25q01Bv0GXkXb/Ozqiyjv0wBGDK70NZghVm4HuU+Acw4
	VO3QsB0EbQHaJ+WRnU7UmUgva22s5ihTnSf+gx0L61FgDkf0Zwr+3GxPJkfl2Yal
	6ZIsX+lH0shVvgCPbAI9a2HdyQCNaMB7nMLYqWHvAJxtYhErsI7F9J3BG4ZNOvW4
	adt5+jHZB2gUobT7PJlTQ==
X-ME-Sender: <xms:4dnvaFHgNBwQpMRfdh1f5760-9POHqWdIg02h5epcHD0f0zfjydQEA>
    <xme:4dnvaP6na0BiSCKYqvUojZIHU0VOno9SO5Z5YVzAhSwJ_-eDPcrAthqbUaOEDWhUt
    oWQ81jsOIZ61KlEgbpkL3Eq7yTeFsEfVzgDuIodOvmxoCJaOqaUoA>
X-ME-Received: <xmr:4dnvaAtDPl1bB8-SRFZvSOHY1OBOGa5fSGV5QIVNRHPUrQtYXq5AJYCo4FTqFbvA8v_mN8YVHIQnYAFIXDPvR7-fP4X_7Yk>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeeffedrtdeggdduvdegtdduucetufdoteggodetrf
    dotffvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfurfetoffkrfgpnffqhgenuceu
    rghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujf
    gurhepfffhvfevuffkfhggtggugfgjsehtkeertddttdejnecuhfhrohhmpefpihhklhgr
    shcuufpnuggvrhhluhhnugcuoehnihhklhgrshdrshhouggvrhhluhhnugesrhgrghhnrg
    htvggthhdrshgvqeenucggtffrrghtthgvrhhnpeevteegtddvvdfhtdekgefhfeefheet
    heekkeegfeejudeiudeuleegtdehkeekteenucevlhhushhtvghrufhiiigvpedunecurf
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
X-ME-Proxy: <xmx:4dnvaL-raNsBfOhWZBHhp5cbl-Vckd1jwwy0bYPHb6RYtWrfJsMhkA>
    <xmx:4dnvaCnW7uEosx3o1ZHykNHE3r4sKsBShP92a0ygy1-4Ja6YaBC82w>
    <xmx:4dnvaDNRTJTXrhP3K_jAMn9ubeMdD4axH9k0cy_rwTW3R9I1_oNapQ>
    <xmx:4dnvaJKidZpH4I9-5QmxiQ9VoeGCQc7mxcIhNLRKn1vSy35wvOGp1w>
    <xmx:4dnvaJLfXXUblAWzjyZ51qBVKItq5mmjmAEd6yw_d-h5Bw4kn8uNwcQi>
Feedback-ID: i80c9496c:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Wed,
 15 Oct 2025 13:29:05 -0400 (EDT)
Date: Wed, 15 Oct 2025 19:29:04 +0200
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
Subject: Re: [PATCH 1/3] net: ravb: Make DBAT entry count configurable per-SoC
Message-ID: <20251015172904.GH439570@ragnatech.se>
References: <20251015150026.117587-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <20251015150026.117587-2-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <20251015153556.GC439570@ragnatech.se>
 <CA+V-a8vRXN+2CDQu=FkN_teTDLywzGPn_=8obvKC+3tmwYo4hA@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CA+V-a8vRXN+2CDQu=FkN_teTDLywzGPn_=8obvKC+3tmwYo4hA@mail.gmail.com>

On 2025-10-15 18:05:34 +0100, Lad, Prabhakar wrote:
> Hi Niklas,
> 
> Thank you for the review.
> 
> On Wed, Oct 15, 2025 at 4:36 PM Niklas Söderlund
> <niklas.soderlund@ragnatech.se> wrote:
> >
> > Hi Prabhakar,
> >
> > Thanks for your work.
> >
> > On 2025-10-15 16:00:24 +0100, Prabhakar wrote:
> > > From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> > >
> > > The number of CDARq (Current Descriptor Address Register) registers is not
> > > fixed to 22 across all SoC variants. For example, the GBETH implementation
> > > uses only two entries. Hardcoding the value leads to incorrect resource
> > > allocation on such platforms.
> > >
> > > Pass the DBAT entry count through the per-SoC hardware info struct and use
> > > it during probe instead of relying on a fixed constant. This ensures
> > > correct descriptor table sizing and initialization across different SoCs.
> > >
> > > Fixes: feab85c7ccea ("ravb: Add support for RZ/G2L SoC")
> > > Cc: stable@vger.kernel.org
> > > Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> >
> > I have not verified with documentation the setting of 2 for
> > gbeth_hw_info. But the change itself is good.
> >
> > > ---
> > >  drivers/net/ethernet/renesas/ravb.h      | 2 +-
> > >  drivers/net/ethernet/renesas/ravb_main.c | 9 +++++++--
> > >  2 files changed, 8 insertions(+), 3 deletions(-)
> > >
> > > diff --git a/drivers/net/ethernet/renesas/ravb.h b/drivers/net/ethernet/renesas/ravb.h
> > > index 7b48060c250b..d65cd83ddd16 100644
> > > --- a/drivers/net/ethernet/renesas/ravb.h
> > > +++ b/drivers/net/ethernet/renesas/ravb.h
> > > @@ -1017,7 +1017,6 @@ enum CSR2_BIT {
> > >  #define CSR2_CSUM_ENABLE (CSR2_RTCP4 | CSR2_RUDP4 | CSR2_RICMP4 | \
> > >                         CSR2_RTCP6 | CSR2_RUDP6 | CSR2_RICMP6)
> > >
> > > -#define DBAT_ENTRY_NUM       22
> > >  #define RX_QUEUE_OFFSET      4
> > >  #define NUM_RX_QUEUE 2
> > >  #define NUM_TX_QUEUE 2
> > > @@ -1062,6 +1061,7 @@ struct ravb_hw_info {
> > >       u32 rx_max_frame_size;
> > >       u32 rx_buffer_size;
> > >       u32 rx_desc_size;
> > > +     u32 dbat_entry_num;
> >
> > I have been wondering for some time if we shall not start to document
> > these fields as they always take so much time to get back to what each
> > of them represent. How do you feel about starting a header?
> >
> > /**
> >  * dbat_entry_num: Describe me here.
> >  */
> >
> I agree, let's take this separately into a different patch as it will
> make things easier to backport. What do you think?

Works for me.

> 
> Cheers,
> Prabhakar
> 
> > Without, but preferably with, this added.
> >
> > Reviewed-by: Niklas Söderlund <niklas.soderlund+renesas@ragnatech.se>
> >
> > >       unsigned aligned_tx: 1;
> > >       unsigned coalesce_irqs:1;       /* Needs software IRQ coalescing */
> > >
> > > diff --git a/drivers/net/ethernet/renesas/ravb_main.c b/drivers/net/ethernet/renesas/ravb_main.c
> > > index 9d3bd65b85ff..69d382e8757d 100644
> > > --- a/drivers/net/ethernet/renesas/ravb_main.c
> > > +++ b/drivers/net/ethernet/renesas/ravb_main.c
> > > @@ -2694,6 +2694,7 @@ static const struct ravb_hw_info ravb_gen2_hw_info = {
> > >       .rx_buffer_size = SZ_2K +
> > >                         SKB_DATA_ALIGN(sizeof(struct skb_shared_info)),
> > >       .rx_desc_size = sizeof(struct ravb_ex_rx_desc),
> > > +     .dbat_entry_num = 22,
> > >       .aligned_tx = 1,
> > >       .gptp = 1,
> > >       .nc_queues = 1,
> > > @@ -2717,6 +2718,7 @@ static const struct ravb_hw_info ravb_gen3_hw_info = {
> > >       .rx_buffer_size = SZ_2K +
> > >                         SKB_DATA_ALIGN(sizeof(struct skb_shared_info)),
> > >       .rx_desc_size = sizeof(struct ravb_ex_rx_desc),
> > > +     .dbat_entry_num = 22,
> > >       .internal_delay = 1,
> > >       .tx_counters = 1,
> > >       .multi_irqs = 1,
> > > @@ -2743,6 +2745,7 @@ static const struct ravb_hw_info ravb_gen4_hw_info = {
> > >       .rx_buffer_size = SZ_2K +
> > >                         SKB_DATA_ALIGN(sizeof(struct skb_shared_info)),
> > >       .rx_desc_size = sizeof(struct ravb_ex_rx_desc),
> > > +     .dbat_entry_num = 22,
> > >       .internal_delay = 1,
> > >       .tx_counters = 1,
> > >       .multi_irqs = 1,
> > > @@ -2769,6 +2772,7 @@ static const struct ravb_hw_info ravb_rzv2m_hw_info = {
> > >       .rx_buffer_size = SZ_2K +
> > >                         SKB_DATA_ALIGN(sizeof(struct skb_shared_info)),
> > >       .rx_desc_size = sizeof(struct ravb_ex_rx_desc),
> > > +     .dbat_entry_num = 22,
> > >       .multi_irqs = 1,
> > >       .err_mgmt_irqs = 1,
> > >       .gptp = 1,
> > > @@ -2794,6 +2798,7 @@ static const struct ravb_hw_info gbeth_hw_info = {
> > >       .rx_max_frame_size = SZ_8K,
> > >       .rx_buffer_size = SZ_2K,
> > >       .rx_desc_size = sizeof(struct ravb_rx_desc),
> > > +     .dbat_entry_num = 2,
> > >       .aligned_tx = 1,
> > >       .coalesce_irqs = 1,
> > >       .tx_counters = 1,
> > > @@ -3025,7 +3030,7 @@ static int ravb_probe(struct platform_device *pdev)
> > >       ravb_parse_delay_mode(np, ndev);
> > >
> > >       /* Allocate descriptor base address table */
> > > -     priv->desc_bat_size = sizeof(struct ravb_desc) * DBAT_ENTRY_NUM;
> > > +     priv->desc_bat_size = sizeof(struct ravb_desc) * info->dbat_entry_num;
> > >       priv->desc_bat = dma_alloc_coherent(ndev->dev.parent, priv->desc_bat_size,
> > >                                           &priv->desc_bat_dma, GFP_KERNEL);
> > >       if (!priv->desc_bat) {
> > > @@ -3035,7 +3040,7 @@ static int ravb_probe(struct platform_device *pdev)
> > >               error = -ENOMEM;
> > >               goto out_rpm_put;
> > >       }
> > > -     for (q = RAVB_BE; q < DBAT_ENTRY_NUM; q++)
> > > +     for (q = RAVB_BE; q < info->dbat_entry_num; q++)
> > >               priv->desc_bat[q].die_dt = DT_EOS;
> > >
> > >       /* Initialise HW timestamp list */
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

