Return-Path: <linux-renesas-soc+bounces-31661-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 0HpHLLyb7mnXvwAAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-31661-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 27 Apr 2026 01:11:56 +0200
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 1B3DC46B6BB
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 27 Apr 2026 01:11:55 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 42380300AB36
	for <lists+linux-renesas-soc@lfdr.de>; Sun, 26 Apr 2026 23:11:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 914623019C3;
	Sun, 26 Apr 2026 23:11:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b="n7AajchL"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 70FBB2D12EE;
	Sun, 26 Apr 2026 23:11:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777245110; cv=none; b=EgPiOE+Isjxd1nGZycIKgR2WuIh+WZjzLB6sJFT04VfPU55Hr64HCGGtQ+9DCV4R2vjy9Ds2fmjKUb7kBKwIWDbxje9usjdN8gd8mYClSke39sAYvcBz5zYyndmwkEKAxuyPbcixaNhxLqmRg/EmS1vkLFDOElu1n6WoHSIEwgU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777245110; c=relaxed/simple;
	bh=JXnG5gM43KDfdXTQxTdUvNUB0kaa5mek58fQuwFm/hk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ozcK1m9Kq3o7XNpai2nNQIam5uodjYTuGGo1LVxGBtHm2vSSWaJAGI6ERFti/2RGkDlv2xmSjkSrqw4j3t83xYwzV+ypIyp8iFzwJN4dB5VQjatJX7qTd6cA4NaHzDWUeWX0FbNb+UGHE9ipPI9IuJxhzUmcp27d0Gb9UY6gwzQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b=n7AajchL; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id C94AE1682;
	Sun, 26 Apr 2026 16:03:09 -0700 (PDT)
Received: from pluto (usa-sjc-mx-foss1.foss.arm.com [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id E31683F763;
	Sun, 26 Apr 2026 16:03:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1777244595; bh=JXnG5gM43KDfdXTQxTdUvNUB0kaa5mek58fQuwFm/hk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=n7AajchLwbx/0BmM/IQ3Ui56MqRfDBKADMu4Q+OOxX5NgT1u9/A9ZgSemUzLSTyFJ
	 r9Kfecxi0k2P871WuxNmv4FIOfjWyx42fDTL8cNWFfIE5hZrtRiufhhgMBSiwo7KHb
	 Emb68D8xzTo0/aRfbFMbu7dIZAOteXQm1lkqRfJE=
Date: Mon, 27 Apr 2026 00:03:03 +0100
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
Message-ID: <ae6Zp54NhKlVes8J@pluto>
References: <cover.1776793163.git.geert+renesas@glider.be>
 <72e2a0e7a5abda02fe36b3f5851842f7a77b2593.1776793163.git.geert+renesas@glider.be>
 <aekXUvIPb8nkhdKu@pluto>
 <CAMuHMdWJvMH+a1RqozbaCxxH_8M569JcruTFa8PW+87FysnjHw@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAMuHMdWJvMH+a1RqozbaCxxH_8M569JcruTFa8PW+87FysnjHw@mail.gmail.com>
X-Rspamd-Queue-Id: 1B3DC46B6BB
X-Rspamd-Action: no action
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
	TAGGED_FROM(0.00)[bounces-31661-lists,linux-renesas-soc=lfdr.de];
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

On Fri, Apr 24, 2026 at 02:08:55PM +0200, Geert Uytterhoeven wrote:
> Hi Cristian,

Hi Geert,

> 
> On Wed, 22 Apr 2026 at 20:45, Cristian Marussi <cristian.marussi@arm.com> wrote:
> > On Tue, Apr 21, 2026 at 08:11:38PM +0200, Geert Uytterhoeven wrote:
> > > Currently non-SCMI drivers cannot find out what the specific versions of
> > > each SCMI provider implementation on the running system are.
> >
> > Thanks for your patches....this is not a proper full review of the series,
> > BUT this patch catched my eye..
> >
> > Indeed, yes, it is deliberate that the SCMI version information is NOT
> > exposed out of the SCMI world, since being the SCMI an attempt to
> > standardize a common FW interface (as in [1] of course), you should not
> > know what runs inside the black-box, it should be irrelevant...
> >
> > ...indeed the versioning is used inside the SCMI stack to deal properly
> > with different protocol versions implemented by the server OR to apply
> > proper quirks when needed, but all the rest should be standard....
> >
> > ...you should NOT really behave differently based on the underneath
> > protocol or firmare implementation version...it is the SCMI stack that
> > should behave properly, transparently...
> 
> Oh well...
> 
> > Having said that...I understand that at least it could be useful to be able
> > to query the SCMI stack to know, even from non-SCMI drivers, WHICH quirks
> > have been applied/activated at run time...but anything more than that it
> 
> I see no need for that, but we can discover which quirks have been
> applied from the kernel log ;-)

Ok so I may have misunderstood...it seemed to me, glancing through the
series that you wanted sort of reconfigure other non-SCMI drivers based
on the SCMI FW version assuming that some quirks were applied BUT also
that some sort of corrective workaround was needed additionally...so
what I was saying was that: is not more straightforward to be possibly
able to check if a quirk has been applied instead of querying the
version from outside ?

> 
> > seems to me dangerous and prone to a number of abuses of the SCMI stack
> > itself...
> >
> > (Also...exposing the versions itself means also tracking that bit of info
> > in more than one place: the quirk framework and your drivers.)
> 
> I'll see if I can get everything handled as quirks instead...
> 
> > > However, different versions may use different ABIs (e.g. different clock
> > > IDs), or behave different, requiring remapping or workarounds in other
> > > drivers.
> >
> > ...abuse like this indeed :P ... the SCMI server is supposed to be that
> > one entity remapping the IDs in the background if the same IDs happen to
> > be representing different physical resources across a number of distinct
> > platforms all supported by the same firmware blob...so as to present
> > a consistent set of contiguos IDs...
> 
> In our case it is just a single platform, with different ID number
> spaces for different firmware versions.

Yes understood.

> 
> > Also because this should be one of the selling point of the SCMI stack
> > in a virtualized environment: you can ship the same kernel drivers with
> > the same DT and you know that ID=<N> will always identify the specific
> > resource that is needed by your driver without worrying about the fact
> > that in reality in the backstage the effectively managed physical resource
> > could be different across different platforms, because that does not matter
> 
> This sounds strange to me, do I understand it correctly?
> So the ID should (1) be tied to the use-case, and not to the underlying
> hardware, and (2) be the same for different platforms?
> 
> For (1): Then we must not put these IDs in DT at all, as DT is supposed
>     to describe the hardware (and firmware IDs in DT were IMHO already
>     a stretch before).
> For (2): How can there be a contiguous list of IDs, as not all platforms
>     may have the same underlying hardware?
>

I would NOT say that an SCMI FW must behave like this regarding IDs, but it
is a possible SCMI deployed setup that can be useful in virtualized setups

I mean, the DT describes the hardware of course BUT when you refer to
some of this hardware DT bits from some other subsystem by referencing a
phandle, even in the non-SCMI world, you are in fact selecting a specific
resource that fit you use case, right ? Can we say this ?
I mean you needed that specific clock or regulator that you described
previously so as to be able to enable some other piece of HW...

Now, the SCMI provides an abstraction on top of this, since you really
discover domain IDs of a specific class (clocks/regulators etc) you are
in fact describing an HW abstraction that you then refer with the usual
phandle...also because there is NOT so much SCMI hardware to describe,
given that the HW is handled transparently (opaquely really :P) by the
driver on the FW side...

...you basically obtain such domain ID, usable as phandles through dynamic
SCMI enumeration so that you can use it all over your DT to make use of such
resources...

...on top of this, consider that the SCMI server CAN provide to its agents
a per-agent-view of the world, IOW it can (and should) expose to a specific
agent ONLY the resources needed by that agent, i.e. it can expose the set
of resources 1-N to two distinct agents and that does NOT mean that the
underlying physical resource mapped by ID=3 in both agents has to be
effectively the same piece of hardware: it could be the case, and this 
would be useful to exposed and managed properly a shared resource, or
it could also be that the same ID=3 could refer to completely distinct
pieces of the same class of hardware...(same protocol same class of
resource...)

In fact the SCMI server provides an abstraction, sometime a mere illusion
to the agents...

So in a virtualized ennvironment you could expose the same ID to a pair
of distinct agents on distinct VMs, so that you can use the same driver
and same DT despite the fact that maybe the underlying resources are
distinct pieces of hardware ...

...OR on the other side you could decide to share the same resource with
different agents (say a clock) and take care, as a server, of armonizing
conflicting requests from different agents (e.g. by refcounting enable/disable
across all agents), WITHOUT necessarily need to expose that same resource
with the same ID to both agents...

...and you can easily draw a parallel from this virtualization dynamic
scenario to a more static usecase where you have a FW shipped on
multiple boards and so capable of serving, in fact, multiple distinct
agents, but this time, just NOT all together like the VM, but one at time
depending on which board configuration is booted...

....all of this madness of course has a chance to work ONLY if the SCMI
server takes care to remap such resources properly at build-time or
run-time as a contiguos set of IDs, based on the expected agents that
it has to serve

I am, of course, disillusioned enough NOT to believe that many FW were
shipped around trying to fit this ideal SCMI deployment scenario BUT at
least we try, kernel side, NOT to ease these kind of design that goes
pretty much against the SCMI ideas of a system (and the spec to some
extent if you punch holes in the IDs sets), and even more we try NOT
to legalize/normalize out-of-spec FW behaviours by fixing the driver,
where required, and deploying needed quirks to let existing boards survive
(..and that becomes quickly much more a pain in the ass for us then for the
FW guys :P)
 
> > if the SCMI platform server had properly remapped (at build time/run-time ?)
> > the resources to your expected ID...alternatively of course you can ship
> > with different DTs to describe different hardware...BUT remmapping stuff
> 
> That is a different issue: as SCMI covers the full platform, not just
> the SoC, the IDs can be board-specific, and thus should be specified
> in the board .dts, not in the SoC .dtsi?
> Then the SoC .dtsi should describe the hardware, and we end up with
> things like arch/arm/boot/dts/st/stm32mp157a-dk1-scmi.dts?
> 
> > in the drivers themselves guessing on the vendor/subvendor/impl_vers
> > seems a dangerous abuse...
> 
> There is no guessing.
> 
> > I watched a bit of the LPC discussions around this (from Marek I think)
> > but sincerely most of those problems had one (not necessarily simple)
> > solution: fix your firmwares AND/OR apply quirks in the meantime...
> 
> Unfortunately (at this point) we have to work with the firmware that exists.
> 
> From that LPC discussion, we learned that we are actually the lucky
> guys: some other vendors tend to change the IDs and/or behavior without
> bumping the version, so Linux cannot even act upon that...
> 

Oh I know that :P ... the whole SCMI quirk framework has been introduced
to cope with FW issue from one vendor that afterwards fixed their FW
issue BUT did NOT take care to update properly their FW versions upon
each release...so their quirks will be like diamonds, forever !
... no matter how many fixed-FW they will deploy :P

Thanks,
Cristian

