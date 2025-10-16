Return-Path: <linux-renesas-soc+bounces-23144-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [142.0.200.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 66B71BE3737
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 16 Oct 2025 14:40:13 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id E301D500E0B
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 16 Oct 2025 12:39:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A556C32C30B;
	Thu, 16 Oct 2025 12:39:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ragnatech.se header.i=@ragnatech.se header.b="UFTrpa5N";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="bsfBaUu/"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from fout-b5-smtp.messagingengine.com (fout-b5-smtp.messagingengine.com [202.12.124.148])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4629A326D60;
	Thu, 16 Oct 2025 12:39:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=202.12.124.148
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760618377; cv=none; b=Pln5Me/yx0EgkzGI7SkAsQVrsXtkIpAkUbvS8jVggRq//f2pPWZez8MjAUZZIh1EJr6ZxIS0MnI8CjKAbC+DOQQqZSoh8RumbXzoy7phX6my8cUvpqfsitpI33FdX5JC6td9dn6ojLPhvjcbzvyb8AXeixH6R6EbiBKmSapXrPw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760618377; c=relaxed/simple;
	bh=hrpDqz3q3YhCsIwjYm7LFylXdk4n0DLUPi60nR0B/fg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=c/dNcdAW/YnMFrfI0zxKE5OYbM6ABp42ZvYEblpykC+0ge0QFlWEA1QbCwcVWZAtFyJYK5tolmGp8cIjQibK0iAzXnnOJfeGk/9Vzu+P8SYY18GhChyrwsHmZrDxN1Px+5/GsCUxB1kHh/1J11zCNX1f8ThTcRkdEIT4+M6bKZ4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ragnatech.se; spf=pass smtp.mailfrom=ragnatech.se; dkim=pass (2048-bit key) header.d=ragnatech.se header.i=@ragnatech.se header.b=UFTrpa5N; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=bsfBaUu/; arc=none smtp.client-ip=202.12.124.148
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ragnatech.se
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ragnatech.se
Received: from phl-compute-09.internal (phl-compute-09.internal [10.202.2.49])
	by mailfout.stl.internal (Postfix) with ESMTP id CBED61D0019D;
	Thu, 16 Oct 2025 08:39:32 -0400 (EDT)
Received: from phl-mailfrontend-01 ([10.202.2.162])
  by phl-compute-09.internal (MEProxy); Thu, 16 Oct 2025 08:39:33 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ragnatech.se; h=
	cc:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm1; t=1760618372;
	 x=1760704772; bh=Lr6DR8N342XriAxN8x3LUIg/Ew5xZ2snZt/u/08ZmH8=; b=
	UFTrpa5NDKm2Z2TI27Vy+SThcoFmqEHib0dQh3BgQ7kQ2siOVkVGNAmHMm2VKtvA
	oWFxxumpFbLvF96MVQwfqcw4zoXNhpOgBqC2N/ooVAHq5uwORSuNbNBWa8tuWkyN
	djlA/y+1R5vI0VXcuvf4UgIaF/KiwrotVrScpqwcOwdaf6Fes6RLJZ3MRdwXmwUz
	aVwlVOt85pb8xEcvJC5YC4+Aa/sz9m8r05Cpvw1RDvue9GHh67kHx51qcdYpBHl1
	2SLYKELpp34TRUSHzseuM53gkNGeOQ1O1Iaka0GntXckak5n4d6V5uDlZeFtd8K4
	USJoq1IJhHL5GosFJ/cjjQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; t=1760618372; x=
	1760704772; bh=Lr6DR8N342XriAxN8x3LUIg/Ew5xZ2snZt/u/08ZmH8=; b=b
	sfBaUu/L//kD4o+Bpo11bCjnyLjF3/ip2a+cC/iqBYf22fbY4k17473m6IF6m8RN
	ScQ1Ky6gcLPIuQ32TsLFp7qHkJz/4GiTr/nV8fej0RBizyXm19wrOXzyOKdZJpKD
	9zZqvaJgC8fMGgIhqtKKoFMQVm9jsUMd7eTdgX+CUyjfQy4BktctpPpPx7b61L+7
	mxishXlRxMiccJsyAe4N7I0crQckpg0f4hcNbGUmLlEg5q7KFlpkOaZuSSjOI0Kq
	cZcox+6IjmJ2uWG85oLqsGieiJf3JPJOlApHEdhyvCgyUlsvcffPFkRkRG52YLVV
	ZzGAgWxyy64dli8eDpq8A==
X-ME-Sender: <xms:g-fwaGTpahBqlrgTbSy8UeUX4zkk95gAIXlSrLVOCMsYuke2Dzb8hA>
    <xme:g-fwaBWXGJ_8r2_t5bDMYLUecb52O_VpNe7HmWF5Pq3ZTjdFQYtqSKyn9b4Tl7tHV
    1PXqb1mAlVuDAzkkJKXKSGWrA_tuh9EirsQzvdoGr4CUVIoScRQjG4>
X-ME-Received: <xmr:g-fwaNa54mYuU0dbgL-ev41yVgPhCcc9A_JMWuBmY_CoPlu2GUnR4ikSZR45tuHKM97UPIsEPVLTb8w0yNZHSppMa96E7nU>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeeffedrtdeggdduvdeifedvucetufdoteggodetrf
    dotffvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfurfetoffkrfgpnffqhgenuceu
    rghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujf
    gurhepfffhvfevuffkfhggtggugfgjsehtkeertddttdejnecuhfhrohhmpedfnhhikhhl
    rghsrdhsohguvghrlhhunhgufdcuoehnihhklhgrshdrshhouggvrhhluhhnugesrhgrgh
    hnrghtvggthhdrshgvqeenucggtffrrghtthgvrhhnpeekkeeufedvveeihfdvteeugfet
    ffegfeeuudeffedtieegkefhvdegfeffvdeujeenucevlhhushhtvghrufhiiigvpedtne
    curfgrrhgrmhepmhgrihhlfhhrohhmpehnihhklhgrshdrshhouggvrhhluhhnugesrhgr
    ghhnrghtvggthhdrshgvpdhnsggprhgtphhtthhopeduhedpmhhouggvpehsmhhtphhouh
    htpdhrtghpthhtohepfhgrsghrihiiihhordgtrghsthhrohdrjhiisehrvghnvghsrghs
    rdgtohhmpdhrtghpthhtohepphhrrggshhgrkhgrrhdrtghsvghnghhgsehgmhgrihhlrd
    gtohhmpdhrtghpthhtohepphgruhhlsehpsggrrhhkvghrrdguvghvpdhrtghpthhtohep
    rghnughrvgifodhnvghtuggvvheslhhunhhnrdgthhdprhgtphhtthhopegurghvvghmse
    gurghvvghmlhhofhhtrdhnvghtpdhrtghpthhtohepvgguuhhmrgiivghtsehgohhoghhl
    vgdrtghomhdprhgtphhtthhopehkuhgsrgeskhgvrhhnvghlrdhorhhgpdhrtghpthhtoh
    epphgrsggvnhhisehrvgguhhgrthdrtghomhdprhgtphhtthhopehsvghrghgvihdrshhh
    thihlhihohhvsegtohhgvghnthgvmhgsvgguuggvugdrtghomh
X-ME-Proxy: <xmx:g-fwaC6iTUZBWNvE9yQc8-ay4Y8K28-GAGoAYcs_RlvsmFUPvctqxg>
    <xmx:g-fwaGx9J4vUv61eo0CSLkca1mdDAxTK8_tZJecXZmheTKvEsdpQ1A>
    <xmx:g-fwaLq6ddNyxyigxSx7YvIch-NgXchPI8MQp1s1jPxe6rp67nVcsA>
    <xmx:g-fwaA3bWg6uJftWQYu2AoBpYGLwKvIe8c2O5BRmi1xUlTh-vVbdDQ>
    <xmx:hOfwaNG_jGEAZS3ToX85C5Z4AJBu8PthRjiukQyz_gvSH_oLx286WrJv>
Feedback-ID: i80c9496c:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Thu,
 16 Oct 2025 08:39:30 -0400 (EDT)
Date: Thu, 16 Oct 2025 14:39:28 +0200
From: "niklas.soderlund" <niklas.soderlund@ragnatech.se>
To: Fabrizio Castro <fabrizio.castro.jz@renesas.com>
Cc: "Lad, Prabhakar" <prabhakar.csengg@gmail.com>,
	Paul Barker <paul@pbarker.dev>, Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>,
	"netdev@vger.kernel.org" <netdev@vger.kernel.org>,
	"linux-renesas-soc@vger.kernel.org" <linux-renesas-soc@vger.kernel.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	Biju Das <biju.das.jz@bp.renesas.com>,
	Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>,
	"stable@vger.kernel.org" <stable@vger.kernel.org>
Subject: Re: [PATCH 3/3] net: ravb: Enforce descriptor type ordering to
 prevent early DMA start
Message-ID: <20251016123928.GA856714@ragnatech.se>
References: <20251015150026.117587-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <20251015150026.117587-4-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <20251015155622.GE439570@ragnatech.se>
 <CA+V-a8vudn0=kSnaAT4qDCcRtVShmS+n2A4GOQH2iogYizUBzw@mail.gmail.com>
 <20251015172815.GG439570@ragnatech.se>
 <TYCPR01MB12093AA1F44F7BC9961B5672FC2E9A@TYCPR01MB12093.jpnprd01.prod.outlook.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <TYCPR01MB12093AA1F44F7BC9961B5672FC2E9A@TYCPR01MB12093.jpnprd01.prod.outlook.com>

Hi Fabrizio,

On 2025-10-16 12:00:29 +0000, Fabrizio Castro wrote:
> Hi Niklas,
> 
> Thanks for your feedback!
> 
> > From: Niklas Söderlund <niklas.soderlund@ragnatech.se>
> > Sent: 15 October 2025 18:28
> > To: Lad, Prabhakar <prabhakar.csengg@gmail.com>
> > Cc: Paul Barker <paul@pbarker.dev>; Andrew Lunn <andrew+netdev@lunn.ch>; David S. Miller
> > <davem@davemloft.net>; Eric Dumazet <edumazet@google.com>; Jakub Kicinski <kuba@kernel.org>; Paolo
> > Abeni <pabeni@redhat.com>; Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>;
> > netdev@vger.kernel.org; linux-renesas-soc@vger.kernel.org; linux-kernel@vger.kernel.org; Biju Das
> > <biju.das.jz@bp.renesas.com>; Fabrizio Castro <fabrizio.castro.jz@renesas.com>; Prabhakar Mahadev Lad
> > <prabhakar.mahadev-lad.rj@bp.renesas.com>; stable@vger.kernel.org
> > Subject: Re: [PATCH 3/3] net: ravb: Enforce descriptor type ordering to prevent early DMA start
> > 
> > Hello,
> > 
> > On 2025-10-15 18:01:13 +0100, Lad, Prabhakar wrote:
> > > Hi Niklas,
> > >
> > > Thank you for the review.
> > >
> > > On Wed, Oct 15, 2025 at 4:56 PM Niklas Söderlund
> > > <niklas.soderlund@ragnatech.se> wrote:
> > > >
> > > > Hi Prabhakar,
> > > >
> > > > Thanks for your work.
> > > >
> > > > On 2025-10-15 16:00:26 +0100, Prabhakar wrote:
> > > > > From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> > > > >
> > > > > Ensure TX descriptor type fields are written in a safe order so the DMA
> > > > > engine does not begin processing a chain before all descriptors are
> > > > > fully initialised.
> > > > >
> > > > > For multi-descriptor transmissions the driver writes DT_FEND into the
> > > > > last descriptor and DT_FSTART into the first. The DMA engine starts
> > > > > processing when it sees DT_FSTART. If the compiler or CPU reorders the
> > > > > writes and publishes DT_FSTART before DT_FEND, the DMA can start early
> > > > > and process an incomplete chain, leading to corrupted transmissions or
> > > > > DMA errors.
> > > > >
> > > > > Fix this by writing DT_FEND before the dma_wmb() barrier, executing
> > > > > dma_wmb() immediately before DT_FSTART (or DT_FSINGLE in the single
> > > > > descriptor case), and then adding a wmb() after the type updates to
> > > > > ensure CPU-side ordering before ringing the hardware doorbell.
> > > > >
> > > > > On an RZ/G2L platform running an RT kernel, this reordering hazard was
> > > > > observed as TX stalls and timeouts:
> > > > >
> > > > >   [  372.968431] NETDEV WATCHDOG: end0 (ravb): transmit queue 0 timed out
> > > > >   [  372.968494] WARNING: CPU: 0 PID: 10 at net/sched/sch_generic.c:467 dev_watchdog+0x4a4/0x4ac
> > > > >   [  373.969291] ravb 11c20000.ethernet end0: transmit timed out, status 00000000, resetting...
> > > > >
> > > > > This change enforces the required ordering and prevents the DMA engine
> > > > > from observing DT_FSTART before the rest of the descriptor chain is
> > > > > valid.
> > > > >
> > > > > Fixes: 2f45d1902acf ("ravb: minimize TX data copying")
> > > > > Cc: stable@vger.kernel.org
> > > > > Co-developed-by: Fabrizio Castro <fabrizio.castro.jz@renesas.com>
> > > > > Signed-off-by: Fabrizio Castro <fabrizio.castro.jz@renesas.com>
> > > > > Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> > > > > ---
> > > > >  drivers/net/ethernet/renesas/ravb_main.c | 14 +++++++++-----
> > > > >  1 file changed, 9 insertions(+), 5 deletions(-)
> > > > >
> > > > > diff --git a/drivers/net/ethernet/renesas/ravb_main.c b/drivers/net/ethernet/renesas/ravb_main.c
> > > > > index a200e205825a..2a995fa9bfff 100644
> > > > > --- a/drivers/net/ethernet/renesas/ravb_main.c
> > > > > +++ b/drivers/net/ethernet/renesas/ravb_main.c
> > > > > @@ -2211,15 +2211,19 @@ static netdev_tx_t ravb_start_xmit(struct sk_buff *skb, struct net_device
> > *ndev)
> > > > >
> > > > >               skb_tx_timestamp(skb);
> > > > >       }
> > > > > -     /* Descriptor type must be set after all the above writes */
> > > > > -     dma_wmb();
> > > > > +
> > > > > +     /* For multi-descriptors set DT_FEND before calling dma_wmb() */
> > > > >       if (num_tx_desc > 1) {
> > > > >               desc->die_dt = DT_FEND;
> > > > >               desc--;
> > > > > -             desc->die_dt = DT_FSTART;
> > > > > -     } else {
> > > > > -             desc->die_dt = DT_FSINGLE;
> > > > >       }
> > > > > +
> > > > > +     /* Descriptor type must be set after all the above writes */
> > > > > +     dma_wmb();
> > > > > +     desc->die_dt = (num_tx_desc > 1) ? DT_FSTART : DT_FSINGLE;
> > > >
> > > > IMHO it's ugly to evaluate num_tx_desc twice. I would rather just open
> > > > code the full steps in each branch of the if above. It would make it
> > > > easier to read and understand.
> > > >
> > > I did this just to avoid compiler optimizations. With the previous
> > > similar code on 5.10 CIP RT it was observed that the compiler
> > > optimized code in such a way that the DT_FSTART was written first
> > > before DT_FEND while the DMA was active because of which we ran into
> > > DMA issues causing QEF errors.
> > 
> > I was thinking of something like
> > 
> >   /* Descriptor type must be set after all the above writes */
> >   dma_wmb();
> > 
> >   if (num_tx_desc > 1) {
> >           desc->die_dt = DT_FEND;
> >           desc--;
> > 	  /* For multi-descriptors ensure DT_FEND before start
> >            * TODO: Add explanation about compiler optimised code etc.
> >            */
> >           dma_wmb();
> >           desc->die_dt = DT_FSTART;
> >   } else {
> >           desc->die_dt = DT_FSINGLE;
> >   }
> > 
> > 
> > Would make new new special case clearer to understand. And if we figure
> > out different way of doing it it's very clear why the second dma_wmb()
> > is needed. But after writing it out I'm not so sure anymore, maybe
> > adding a temporary variable instead would make it a clearer read.
> > 
> >     u8 die_dt = DT_FSINGLE;
> > 
> >     /* For multi-descriptors ensure DT_FEND before DT_FEND
> >      * TODO: Add explanation about compiler optimised code etc.
> >      */
> >     if (num_tx_desc > 1) {
> >         desc->die_dt = DT_FEND;
> >         desc--;
> >         die_dt = DT_FSTART;
> >     }
> > 
> >     /* Descriptor type must be set after all the above writes */
> >     dma_wmb();
> >     desc->die_dt = die_dt;
> > 
> > I think my main complaint is that evaluating num_tx_desc > 1 multiple
> > times makes the code read as stuff was just thrown into the driver until
> > a test-case passed without understanding the root cause.
> 
> What about the below instead?
> 
>   if (num_tx_desc > 1) {
>           desc->die_dt = DT_FEND;
>           desc--;
> 	    /* When using multi-descriptors, DT_FEND needs to get written
>            * before DT_FSTART, but the compiler may reorder the memory
>            * writes in an attempt to optimize the code.
>            * Use a dma_wmb() barrier to make sure DT_FEND and DT_FSTART
>            * are written exactly in the order shown in the code.
>            */
>           dma_wmb();
>           desc->die_dt = DT_FSTART;
>   } else {
> 	    /* The descriptor type must be set after all the previous writes */
> 	    dma_wmb();
>           desc->die_dt = DT_FSINGLE;
>   }

I like this. It makes the two conditions very clear. Maybe extend the 
first comment a bit with the information you add below. That the 
important thing is that this protects for cases where the DMA engine is 
already running, and it's very important that it do not see a DT_FSTART 
before a DT_FEND is already committed, else it can run amuck. That would 
make the intent super clear.

> 
> > 
> > >
> > > > > +
> > > > > +     /* Ensure data is written to RAM before initiating DMA transfer */
> > > > > +     wmb();
> > > >
> > > > All of this looks a bit odd, why not just do a single dma_wmb() or wmb()
> > > > before ringing the doorbell? Maybe I'm missing something obvious?
> > > >
> > > This wmb() was mainly added to ensure all the descriptor data is in
> > > RAM. The HW manual for RZ/G1/2, R-Car Gen1/2 and RZ/G2L family
> > > mentions that we need to read back the last written descriptor before
> > > triggering the DMA. Please let me know if you think this can be
> > > handled differently.
> > 
> > Have you observed any issues without the wmb() here?
> 
> No, we haven't. We have added it because after further discussions
> with the design team, it became clear that the best thing to do
> is to wait for all the previous memory writes to have completed fully,
> alongside cache, branch prediction, and other operations, so that when
> we ring the DMA bell everything is in the right place.
> 
> As Prabhakar pointed out, the manual refers to a `read` operation to be
> used as a delay, but a wmb() barrier is more accurate and its purposes
> is clearer than a random memory read.
> 
> Having said that, we haven't noticed any issues without it in practice,
> but having it might prevent issues going forward.
> 
> The dma_wmb() barrier is still needed for cases where the DMA engine
> is already active, therefore writing the descriptor(s) at the wrong
> time can lead to error conditions (which we have managed to see, and
> which this patch addresses for multi-descriptor cases).
> 
> Perhaps this patch should be split into two patches:
> 1. to address the error we have seen, for use cases where the DMA engine
>    is already running (this is regarding dma_wmb())
> 2. to address the use cases where the DMA engine is not running yet,
>    and we want to avoid the possibility of ringing the bell when things
>    are not 100% ready.
> 
> What do you think?

More and smaller patches are always a good idea IMHO, makes bisecting 
stuff so much easier.

I still have my doubts about the usefulness of adding a wmb() here.  
Maybe beacause I'm also confused about why it's a wmb() and not a 
dma_wmb(), are not only trying to make sure the DMA is not started 
before we know the last desc->die_dt = {DT_FSTART,DT_FSINGLE} have would 
be visible?

The usefulness of that I can imagine. As if the DMA engine is not 
running and we start it and that write is not visible we could delay 
sending until the doorbell is rang again.

> 
> Cheers,
> Fab
> 
> > 
> > What I'm trying to understand is why a new barrier is needed here when
> > it have worked without one before. I'm likely just slow but what I'm
> > trying to grasp is the need for the intermittent dma_wmb() above in
> > relation to this one.
> > 
> > Should it not be, setup the descriptors, barrier to ensure it's in RAM,
> > ring doorbell. The staggered method of setup descriptors, barrier, setup
> > more descriptors, barrier, ring doorbell is what confuses me, I think
> > :-)
> > 
> > >
> > > Cheers,
> > > Prabhakar
> > >
> > > > >       ravb_modify(ndev, TCCR, TCCR_TSRQ0 << q, TCCR_TSRQ0 << q);
> > > > >
> > > > >       priv->cur_tx[q] += num_tx_desc;
> > > > > --
> > > > > 2.43.0
> > > > >
> > > >
> > > > --
> > > > Kind Regards,
> > > > Niklas Söderlund
> > 
> > --
> > Kind Regards,
> > Niklas Söderlund

-- 
Kind Regards,
Niklas Söderlund

