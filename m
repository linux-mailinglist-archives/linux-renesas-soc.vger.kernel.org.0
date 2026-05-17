Return-Path: <linux-renesas-soc+bounces-32730-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id +FnoGkUoCmr7xAQAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-32730-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Sun, 17 May 2026 22:42:45 +0200
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 137ED563CF5
	for <lists+linux-renesas-soc@lfdr.de>; Sun, 17 May 2026 22:42:45 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 8623D3016ED0
	for <lists+linux-renesas-soc@lfdr.de>; Sun, 17 May 2026 20:42:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3570830E0F8;
	Sun, 17 May 2026 20:42:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b="Oxil/Pdk"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F1F112236E3;
	Sun, 17 May 2026 20:42:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779050560; cv=none; b=c8on3NVPk3XlHkqv4dn5NL7vhOlkAIPqya+CuThywqqe4A6YT+YCKNztQ/ZhpD1TTqTSUxrfmy3PQ5D5URnUJ4jAyUkFv5xWUNic+NcfURNxzfrjAep0g44IY5njbDAeGsxwaQLunaV1GP47euv92NHZw5Wuvw/rUkOeuDcd/lU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779050560; c=relaxed/simple;
	bh=ibv6k4YlBc18EEJ4WtAjYGWP8e0aYlgR4UUrhJdd/EA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=bTIj2cKUf0rDqs34EfuxRxugyR/na0a+PT4jruCNh8XPxMJQAwSG1SOv/Xmsx7kZmmHD9w3ofhO31FjC71P6R2IzVyndA/W73sqLgF1RiVksqTYU1mbjlgmbJRhjVw/o/vdleE9FlltIX4WcK+YDN2xllFaz1Ow3e1MoefE/sLA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b=Oxil/Pdk; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 396B6165C;
	Sun, 17 May 2026 13:42:25 -0700 (PDT)
Received: from pluto (usa-sjc-mx-foss1.foss.arm.com [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id E5E263F632;
	Sun, 17 May 2026 13:42:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1779050550; bh=ibv6k4YlBc18EEJ4WtAjYGWP8e0aYlgR4UUrhJdd/EA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Oxil/PdkhVxEKri4W+21DCWJpSzmbyh//lSfNpbp7YNrzY0gBA77e2HPyJka8ivkE
	 7jwKFD5fGgewZP7ZuvMxa7hNPL04sAoNbFt9TeMWR1R4qBuRII07O8mB5lqNpEjANF
	 x9j5Yd3TDEkRJafg8JtoEMNt2coOZ/uH9P0Bv4MU=
Date: Sun, 17 May 2026 21:42:18 +0100
From: Cristian Marussi <cristian.marussi@arm.com>
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: Cristian Marussi <cristian.marussi@arm.com>,
	Sudeep Holla <sudeep.holla@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Magnus Damm <magnus.damm@gmail.com>,
	Saravana Kannan <saravanak@kernel.org>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Ulf Hansson <ulfh@kernel.org>,
	"Rafael J . Wysocki" <rafael@kernel.org>,
	Kevin Hilman <khilman@baylibre.com>,
	Florian Fainelli <florian.fainelli@broadcom.com>,
	Wolfram Sang <wsa+renesas@sang-engineering.com>,
	Marek Vasut <marek.vasut+renesas@mailbox.org>,
	Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
	arm-scmi@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-renesas-soc@vger.kernel.org, linux-clk@vger.kernel.org,
	devicetree@vger.kernel.org, linux-pm@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH/RFC 05/14] firmware: arm_scmi: Add scmi_get_base_info()
Message-ID: <agooKghZJw3iElvp@pluto>
References: <cover.1776793163.git.geert+renesas@glider.be>
 <72e2a0e7a5abda02fe36b3f5851842f7a77b2593.1776793163.git.geert+renesas@glider.be>
 <aekXUvIPb8nkhdKu@pluto>
 <CAMuHMdWJvMH+a1RqozbaCxxH_8M569JcruTFa8PW+87FysnjHw@mail.gmail.com>
 <ae6Zp54NhKlVes8J@pluto>
 <CAMuHMdWK3Noh5ZQVWT9C0EKyXZePMaJ97C0A_syK+xCb_=abeQ@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAMuHMdWK3Noh5ZQVWT9C0EKyXZePMaJ97C0A_syK+xCb_=abeQ@mail.gmail.com>
X-Rspamd-Queue-Id: 137ED563CF5
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.16 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[arm.com,none];
	MID_RHS_NOT_FQDN(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[arm.com:s=foss];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-32730-lists,linux-renesas-soc=lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[25];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_CC(0.00)[arm.com,kernel.org,gmail.com,baylibre.com,pengutronix.de,broadcom.com,sang-engineering.com,mailbox.org,renesas.com,vger.kernel.org,lists.infradead.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[cristian.marussi@arm.com,linux-renesas-soc@vger.kernel.org];
	DKIM_TRACE(0.00)[arm.com:+];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-renesas-soc,dt,renesas];
	TO_DN_SOME(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Action: no action

On Fri, May 08, 2026 at 12:26:19PM +0200, Geert Uytterhoeven wrote:
> Hi Cristian,
> 

Hi,

> On Mon, 27 Apr 2026 at 01:03, Cristian Marussi <cristian.marussi@arm.com> wrote:
> > On Fri, Apr 24, 2026 at 02:08:55PM +0200, Geert Uytterhoeven wrote:
> > > On Wed, 22 Apr 2026 at 20:45, Cristian Marussi <cristian.marussi@arm.com> wrote:
> > > > Also because this should be one of the selling point of the SCMI stack
> > > > in a virtualized environment: you can ship the same kernel drivers with
> > > > the same DT and you know that ID=<N> will always identify the specific
> > > > resource that is needed by your driver without worrying about the fact
> > > > that in reality in the backstage the effectively managed physical resource
> > > > could be different across different platforms, because that does not matter
> > >
> > > This sounds strange to me, do I understand it correctly?
> > > So the ID should (1) be tied to the use-case, and not to the underlying
> > > hardware, and (2) be the same for different platforms?
> > >
> > > For (1): Then we must not put these IDs in DT at all, as DT is supposed
> > >     to describe the hardware (and firmware IDs in DT were IMHO already
> > >     a stretch before).
> > > For (2): How can there be a contiguous list of IDs, as not all platforms
> > >     may have the same underlying hardware?
> >
> > I would NOT say that an SCMI FW must behave like this regarding IDs, but it
> > is a possible SCMI deployed setup that can be useful in virtualized setups
> >
> > I mean, the DT describes the hardware of course BUT when you refer to
> > some of this hardware DT bits from some other subsystem by referencing a
> > phandle, even in the non-SCMI world, you are in fact selecting a specific
> > resource that fit you use case, right ? Can we say this ?
> > I mean you needed that specific clock or regulator that you described
> > previously so as to be able to enable some other piece of HW...
> >
> > Now, the SCMI provides an abstraction on top of this, since you really
> > discover domain IDs of a specific class (clocks/regulators etc) you are
> > in fact describing an HW abstraction that you then refer with the usual
> > phandle...also because there is NOT so much SCMI hardware to describe,
> > given that the HW is handled transparently (opaquely really :P) by the
> > driver on the FW side...
> >
> > ...you basically obtain such domain ID, usable as phandles through dynamic
> > SCMI enumeration so that you can use it all over your DT to make use of such
> > resources...
> >
> > ...on top of this, consider that the SCMI server CAN provide to its agents
> > a per-agent-view of the world, IOW it can (and should) expose to a specific
> > agent ONLY the resources needed by that agent, i.e. it can expose the set
> > of resources 1-N to two distinct agents and that does NOT mean that the
> > underlying physical resource mapped by ID=3 in both agents has to be
> > effectively the same piece of hardware: it could be the case, and this
> > would be useful to exposed and managed properly a shared resource, or
> > it could also be that the same ID=3 could refer to completely distinct
> > pieces of the same class of hardware...(same protocol same class of
> > resource...)
> 
> Exposing only the clocks/reset/power domains the agent can use,
> in a contiguous list of IDS, means that the number space changes,
> depending on which resources are exposed.
> 

Yes, potentially, it depedns on how the HW/FW stack was designed I
suppose...

> Suppose you have a system where you want to assign a specific hardware
> block in the SoC to the realtime CPU core instead of the application
> CPU core running Linux.

Ok, so this is definitely a considerable change.

> That means all resources used by that block must no longer be exposed
> to the Linux agent, and the corresponding IDs must be removed from
> the ID space exposed to Linux.  As the ID space must be sequential
> and contiguous, the IDs must be renumbered, impacting resources that
> are exposed to Linux.  As these IDs are used in the SoC .dtsi, they
> must be changed there, too, However, these IDs have become part of
> the stable DT ABI, and thus cannot be changed.

Well, you have to ship a final DTB blob that is crafted to describe the
actual HW at the end, right ?

I mean, in your example, it seems to me that you have changed considerably
the HW surface by moving a clock (and its related resources) away from the
reach of Linux as a whole, so should not be expected to have an updated
DTB shipped ?

And I am NOT saying to do this by changing the base SoC dtsi, but via build
time overrides and/or runtime overlays so as to derive from that same SoC
base dtsi a properly reviewed final DTB that describes how the HW has actually
changed, becasue beside the renumbering that you mention there will be
also a bunch of HW pieces that were relying on that clock that now will
have to be removed from the DTB if no more usable (or remapped to use a
different, maybe non SCMI resource)

I maybe too naive and not used to very complex DTBs, but why all of the
above cannot be done along the lines of how is done as an example in
JUNO [1], where some initial base dtsi was overriden by virtue of includes
and overrides to properly describe the board at hand (r0/r1/r2), even going
to the extreme, funny enough, to move from the old SCPI to SCMI.

[1]: https://elixir.bootlin.com/linux/v7.0.8/source/arch/arm64/boot/dts/arm/juno-scmi.dts

> 
> This patch series fixes that issue, too, by describing the actual
> hardware in DT, and doing the mapping to exposed SCMI features in the
> kernel, based on which firmware version is running on the SCP.
> 

Which seems to me to go in the opposite direction to what SCMI expects:
but I understand that we have to deal and cope with the existing already
shipped FW, so my concern is not really around enabling this in particular,
is much more the fact that we open the door and normalize this kind of
design even with future, still to be developed, SCMI FWs.

...otherwise...have the spec changed/clarified to allow for such
non-contiguos IDs...

...anyway let's hear Sudeep opinion on this general issue of contiguos
remapped IDs and being able to peek into SCMI version from outside the
SCMI world...

Thanks,
Cristian


