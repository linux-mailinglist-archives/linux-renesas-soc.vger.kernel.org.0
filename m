Return-Path: <linux-renesas-soc+bounces-30946-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id KNvOHv5S1Wkf4wcAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-30946-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 07 Apr 2026 20:54:54 +0200
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 9C72B3B3167
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 07 Apr 2026 20:54:53 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 5E5F83015715
	for <lists+linux-renesas-soc@lfdr.de>; Tue,  7 Apr 2026 18:54:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6C0EC25A321;
	Tue,  7 Apr 2026 18:54:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ragnatech.se header.i=@ragnatech.se header.b="aLK/AW+Z";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="HK9Js6nR"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from fhigh-b8-smtp.messagingengine.com (fhigh-b8-smtp.messagingengine.com [202.12.124.159])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6C1DC234994;
	Tue,  7 Apr 2026 18:54:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=202.12.124.159
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775588090; cv=none; b=LkjRLODGjGFchVTtrjHGAw6tQMAaIXr1jd2pHZdZzQxRP6VnFA+bJ8fonFu4OwQFfgI1Cd8stV4o/Y1HzPAtXA0EItpqI6NKEsfKbbIc5jITgKWTCRx+OSjqd3APRc6+NKCK+2TmfTp3pHQuytNGzKafw1ekxX0Av1uOFQe73mM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775588090; c=relaxed/simple;
	bh=7h7ZUS1F0VwC6u1mT9Y30ZU1RNZkR1Wt3LA15D6mfZo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=gFaVMq/6eMWstBjxj2O1bCH87YD/a+Yh0PSXLZK1P+DiFH+BcdWXYgLdRrkn362vNUHzx9Jz1WKB6fSeaHRepLAog/IMQynLmlCQJWG4n7N9VK0FmTNqT4WZiXBdVnSMS37lMSY+rmG4on57txYyyMFocReeQg14krsv3lflCh8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ragnatech.se; spf=pass smtp.mailfrom=ragnatech.se; dkim=pass (2048-bit key) header.d=ragnatech.se header.i=@ragnatech.se header.b=aLK/AW+Z; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=HK9Js6nR; arc=none smtp.client-ip=202.12.124.159
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ragnatech.se
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ragnatech.se
Received: from phl-compute-07.internal (phl-compute-07.internal [10.202.2.47])
	by mailfhigh.stl.internal (Postfix) with ESMTP id 100B47A01D4;
	Tue,  7 Apr 2026 14:54:46 -0400 (EDT)
Received: from phl-frontend-03 ([10.202.2.162])
  by phl-compute-07.internal (MEProxy); Tue, 07 Apr 2026 14:54:47 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ragnatech.se; h=
	cc:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm1; t=1775588086;
	 x=1775674486; bh=eYSepH2p/VYUSUdSvxsdSkN+OMjdCOmDx3IMbk8+4Qo=; b=
	aLK/AW+ZDTn0JnyHpOe0UzpXjbJm5qyTNuaXGqA04D3uXl64O0ZXSLbA9Nawt5cQ
	KDVecD6X+rAtwiGoAauhBgMeDz18we+u3vI/0z11WFfGfl23hAjy2R5mTALyFksQ
	CYbTer3HdJ15XtffGrUvhEM3CsYWyNkctGWH6c2E13jle0JBaxWV6ataCQHf9lTn
	L+vYCNq1fq9BaSoQtrtIZswDXJzo2Px+ssWN+/5tL82hQFMBkyWySOSleUABLAx3
	Sd3oIug3jNB6hcE29B0l67HdA0mP/ldEWBzPZg55ox0HtnjwD+2sSgj0+1/1CDba
	0MnqgPRviTCoB4H0vAXbdg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; t=1775588086; x=
	1775674486; bh=eYSepH2p/VYUSUdSvxsdSkN+OMjdCOmDx3IMbk8+4Qo=; b=H
	K9Js6nRZUIIjHnP6KnUX0sLp2hv6xq8DxpXONNNRTf6JT1mAmyuDigGTFDjoTj6I
	a4cHRfVSvG2GPejsCHOCQkq0HIKz7cFtUNnWPqXCUh/1c9xmVmJUzkiro3YCwdYK
	0b05hoDdbv78gF9fXog0LpE9O+gNMn52hzSmkXaZNzcYMskO6UvUwmUjPsX9pX0C
	UbQACM4CaL/p7Ft41WpCsmKei5gTO2EslwZHh1/iqL2Wq8TFehoBFyBt4HlavAWN
	b9IsaSwROXzAbjUIcXu2y+nfNDfWNWGWvUAZSYaKv2C65Sd/oA7V4GNqdKoeiXHP
	pZCxUfNWFq9hc/QpRslyw==
X-ME-Sender: <xms:9VLVacQC46YV35VnqTP7OG_2SuHTiKrKU96DtdF7N3Vm_H7rne3Yww>
    <xme:9VLVac1GSbgnJLxKlr3GbVCrKzy2r-dO76tPO4S-mb__d6W2DJXj57iURCshoQKsr
    dR_GuurPUdXNIAufSSCZCDiCctvoNqasXx17OqHM1U8uSKWjs0wsPk>
X-ME-Received: <xmr:9VLVaUcr6bPb1TtFm0Iv7Aw7Erbisnw78RaTCczidPVrTM0NC0VGoiBevyYCmuQm6v1vc-2ApnwOHrrnuwwTgtwAGbHv5N-nPZwC>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefhedrtddtgddvudegfecutefuodetggdotefrod
    ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpuffrtefokffrpgfnqfghnecuuegr
    ihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjug
    hrpeffhffvvefukfhfgggtugfgjgesthekredttddtjeenucfhrhhomheppfhikhhlrghs
    ucfunpguvghrlhhunhguuceonhhikhhlrghsrdhsohguvghrlhhunhguodhrvghnvghsrg
    hssehrrghgnhgrthgvtghhrdhsvgeqnecuggftrfgrthhtvghrnhepkeegveffvdejheff
    ieduleffkeeiteegieehkeetgeethefhvdfgkeetfeeuhfeknecuffhomhgrihhnpeguth
    hsrdhimhenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhm
    pehnihhklhgrshdrshhouggvrhhluhhnugdorhgvnhgvshgrshesrhgrghhnrghtvggthh
    drshgvpdhnsggprhgtphhtthhopedutddpmhhouggvpehsmhhtphhouhhtpdhrtghpthht
    ohepghgvvghrtheslhhinhhugidqmheikehkrdhorhhgpdhrtghpthhtohephihoshhhih
    hhihhrohdrshhhihhmohgurgdruhhhsehrvghnvghsrghsrdgtohhmpdhrtghpthhtohep
    phgruhhlsehpsggrrhhkvghrrdguvghvpdhrtghpthhtoheprghnughrvgifodhnvghtug
    gvvheslhhunhhnrdgthhdprhgtphhtthhopegurghvvghmsegurghvvghmlhhofhhtrdhn
    vghtpdhrtghpthhtohepvgguuhhmrgiivghtsehgohhoghhlvgdrtghomhdprhgtphhtth
    hopehkuhgsrgeskhgvrhhnvghlrdhorhhgpdhrtghpthhtohepphgrsggvnhhisehrvggu
    hhgrthdrtghomhdprhgtphhtthhopehnvghtuggvvhesvhhgvghrrdhkvghrnhgvlhdroh
    hrgh
X-ME-Proxy: <xmx:9VLVacOun2fxu6BgNW9nKe-I_wPLprLr2YlFfjxGNlWKCmzrVBVstg>
    <xmx:9VLVaQUEhV97Zwoty7kGHEE5Ar0-0vtkVI9V2eK57lNNFdqsKNVf6A>
    <xmx:9VLVacxETfp_hpQEO4XAWXM2dcWwJp_gZUlBNbT2R4TB_-oMUfzSnA>
    <xmx:9VLVaf9UQNx7vIqUv1aDPtaHLDdLr_cesxdFaoT8Xq4qOHvKTwpW3A>
    <xmx:9lLVaXZij-Yc-sbt_20BfIL17T6x2i69Zz1m1xic8fnbgT2w_NZ8zNfW>
Feedback-ID: i80c9496c:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Tue,
 7 Apr 2026 14:54:45 -0400 (EDT)
Date: Tue, 7 Apr 2026 20:54:43 +0200
From: Niklas =?utf-8?Q?S=C3=B6derlund?= <niklas.soderlund+renesas@ragnatech.se>
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>,
	Paul Barker <paul@pbarker.dev>, Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	netdev@vger.kernel.org, linux-renesas-soc@vger.kernel.org
Subject: Re: [net-next] net: ethernet: ravb: Suspend and resume the
 transmission flow
Message-ID: <20260407185443.GC2551274@ragnatech.se>
References: <20260401183608.1852225-1-niklas.soderlund+renesas@ragnatech.se>
 <CAMuHMdWnjV=HGE1o08zLhUfTgOSene5fYx1J5GG10mB+Toq8qg@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAMuHMdWnjV=HGE1o08zLhUfTgOSene5fYx1J5GG10mB+Toq8qg@mail.gmail.com>
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[ragnatech.se,none];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[ragnatech.se:s=fm1,messagingengine.com:s=fm2];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	DKIM_TRACE(0.00)[ragnatech.se:+,messagingengine.com:+];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-30946-lists,linux-renesas-soc=lfdr.de,renesas];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	MISSING_XM_UA(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[6];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[niklas.soderlund@ragnatech.se,linux-renesas-soc@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	NEURAL_HAM(-0.00)[-0.999];
	RCPT_COUNT_SEVEN(0.00)[10];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-renesas-soc,netdev];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,linux-m68k.org:email,ragnatech.se:dkim,ragnatech.se:email,ragnatech.se:mid]
X-Rspamd-Queue-Id: 9C72B3B3167
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Hi Geert,

Thanks for your report.

On 2026-04-07 11:03:38 +0200, Geert Uytterhoeven wrote:
> Hi Niklas, Shimoda-san,
> 
> On Wed, 1 Apr 2026 at 20:39, Niklas Söderlund
> <niklas.soderlund+renesas@ragnatech.se> wrote:
> >
> > From: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
> >
> > The current driver does not follow the latest datasheet and does not
> > suspend the flow when stopping DMA and resume it when starting. Update
> > the driver to do so.
> >
> > Signed-off-by: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
> > [Niklas: Rebase from BSP and reword commit message]
> > Signed-off-by: Niklas Söderlund <niklas.soderlund+renesas@ragnatech.se>
> 
> Thanks for your patch, which is now commit 353d8e7989b6babe ("net:
> ethernet: ravb: Suspend and resume the transmission flow") in
> linux-next/master net-next.
> 
> > --- a/drivers/net/ethernet/renesas/ravb_main.c
> > +++ b/drivers/net/ethernet/renesas/ravb_main.c
> > @@ -694,6 +694,9 @@ static int ravb_dmac_init(struct net_device *ndev)
> >         const struct ravb_hw_info *info = priv->info;
> >         int error;
> >
> > +       /* Clear transmission suspension */
> > +       ravb_modify(ndev, CCC, CCC_DTSR, 0);
> > +
> >         /* Set CONFIG mode */
> >         error = ravb_set_opmode(ndev, CCC_OPC_CONFIG);
> >         if (error)
> > @@ -1103,6 +1106,12 @@ static int ravb_stop_dma(struct net_device *ndev)
> >         if (error)
> >                 return error;
> >
> > +       /* Request for transmission suspension */
> > +       ravb_modify(ndev, CCC, CCC_DTSR, CCC_DTSR);
> > +       error = ravb_wait(ndev, CSR, CSR_DTS, CSR_DTS);
> > +       if (error)
> > +               netdev_err(ndev, "failed to stop AXI BUS\n");
> 
> This error message is printed during resume from s2idle or s2ram on
> e.g. Salvator-XS and Gray Hawk Single.  Ethernet (nfsroot) still works
> fine, though.

I was not able to reproduce this on M3N (r8a77965-salvator-xs.dts) nor 
Sparrow Hawk (r8a779g3-sparrow-hawk.dts). I'm using the following to 
test, is your test-case different?

  # echo enabled > /sys/class/tty/ttySC0/power/wakeup
  # echo s2idle > /sys/power/mem_sleep
  # echo 0 > /sys/module/printk/parameters/console_suspend
  # echo mem > /sys/power/state

Console log from M3N (console wakeup)

[  149.278623] Freezing user space processes
[  149.287951] Freezing user space processes completed (elapsed 0.005 seconds)
[  149.295439] OOM killer disabled.
[  149.298796] Freezing remaining freezable tasks
[  149.305367] Freezing remaining freezable tasks completed (elapsed 0.002 seconds)
[  149.364876] ravb e6800000.ethernet end0: Link is Down
[  149.701951] usb usb2: root hub lost power or was reset
[  149.708295] usb usb1: root hub lost power or was reset
[  149.793871] usb usb3: root hub lost power or was reset
[  149.799174] usb usb4: root hub lost power or was reset
[  149.931707] Micrel KSZ9031 Gigabit PHY e6800000.ethernet-ffffffff:00: attached PHY driver (mii_bus:phy_addr=e6800000.ethernet-ffffffff:00, irq=170)
[  150.008695] OOM killer enabled.
[  150.012003] Restarting tasks: Starting
[  150.020596] Restarting tasks: Done
[  150.024234] random: crng reseeded on system resumption
[  150.036191] PM: suspend exit
[  150.235966] ata1: link resume succeeded after 1 retries
[  150.344391] ata1: SATA link down (SStatus 0 SControl 300)
[  156.499184] ravb e6800000.ethernet end0: Link is Up - 1Gbps/Full - flow control off

Console log from V4H (console wakeup)

[   64.982935] Filesystems sync: 0.000 seconds
[   64.992414] Freezing user space processes
[   64.996111] Freezing user space processes completed (elapsed 0.002 seconds)
[   64.997280] OOM killer disabled.
[   64.997711] Freezing remaining freezable tasks
[   65.000580] Freezing remaining freezable tasks completed (elapsed 0.002 seconds)
[   65.012959] ravb e6800000.ethernet end0: Link is Down
[   65.167569] Micrel KSZ9031 Gigabit PHY e6800000.ethernet-ffffffff:00: attached PHY driver (mii_bus:phy_addr=e6800000.ethernet-ffffffff:00, irq=108)
[   65.190614] OOM killer enabled.
[   65.191058] Restarting tasks: Starting
[   65.195133] Restarting tasks: Done
[   65.195743] random: crng reseeded on system resumption
[   65.201052] PM: suspend exit
[   71.305027] ravb e6800000.ethernet end0: Link is Up - 1Gbps/Full - flow control off

> 
> > +
> >         /* Stop AVB-DMAC process */
> >         return ravb_set_opmode(ndev, CCC_OPC_CONFIG);
> >  }
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

