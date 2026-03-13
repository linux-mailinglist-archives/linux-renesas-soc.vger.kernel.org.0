Return-Path: <linux-renesas-soc+bounces-29318-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id mISHH0PNs2n2awAAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-29318-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 13 Mar 2026 09:39:31 +0100
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id F007327FD7C
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 13 Mar 2026 09:39:30 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id EBCC93023DB6
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 13 Mar 2026 08:36:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 98A31384242;
	Fri, 13 Mar 2026 08:36:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="pEVHVxmx"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7571C383C96
	for <linux-renesas-soc@vger.kernel.org>; Fri, 13 Mar 2026 08:36:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773391012; cv=none; b=fNQ5qsjXTxBC3DdWfsl1hbSNPqe58fFRapkrxuc7SX6e9Btsq9Gv81g5DUeOnMHX5334SSQo0NQMkhsAUpx2w505WzHdo+bXBJrecoUNu5UCWHP9GzpgASb0k4nwJsghRjqYpMNQoPrIOGEAabayhlAMXgu0UQxOjlLBiiDngtk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773391012; c=relaxed/simple;
	bh=2nRDxZu+d9TWrj4WVetOFAoz7B787w6aylEKVWKeURU=;
	h=From:In-Reply-To:MIME-Version:References:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=X+ALvatd/mZJwhP2cKaWUFIpJNa4qEYODtUZqXwEd46UFZJk7l0OdPindVfjRBjvettH2dZIvSzhEOwcC7kxke805Yg45oITQyT4Li+dtmPgkM3p0ouvbBSTqMI63pSPYoYDV3HGrgSEZHY7RtkzOEv/yPjmJnzni4RWgTY67Vk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=pEVHVxmx; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 17371C2BCB0
	for <linux-renesas-soc@vger.kernel.org>; Fri, 13 Mar 2026 08:36:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1773391012;
	bh=2nRDxZu+d9TWrj4WVetOFAoz7B787w6aylEKVWKeURU=;
	h=From:In-Reply-To:References:Date:Subject:To:Cc:From;
	b=pEVHVxmxlyR1AQS1tR8C2csZ0Qi99RNivHqgeYILFINvq+UgxBXoaqmb2GYX/Ld4+
	 Ggrfr8od449FzPXaxUdGgWt9/wtQ+twSFhI5ShnQhf+y7mcdjLtdJ57IX6OVMgv3Jt
	 xOfteiTDFayLyYkGt8Nn+e+3/sQZlOyOpu4k3d0cYbILyJZ19z4aLF5ss3oSCP/ncp
	 zA7ewy+LaQATTSk1EFJSIoXRBQdGPWQp+wlgdKu9Q4NxiAihO/U3kiiejZdFS5vghm
	 /+oIxRgcMibWkmCXvDtAKs8WeeBa7Hj0DtuJLWDonFuHitIlNZDOZIIG4fL0NK1iRe
	 KnIZQzvHZyJJg==
Received: by mail-lj1-f174.google.com with SMTP id 38308e7fff4ca-38a67221fe8so16785151fa.3
        for <linux-renesas-soc@vger.kernel.org>; Fri, 13 Mar 2026 01:36:51 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCXMG3XDhQXwZpcC69V6Sr1YppJHWChDuSSIBnt/T+gPWAWrsYG1RwDMOOZM681OSObyXdu5HJZFLxiROhuEaP8SIA==@vger.kernel.org
X-Gm-Message-State: AOJu0YzvoAxfdPEpZswqZXrIJhu8/qeoLP4g4CfncXoMBXUHi4uw928F
	CXarvEX64PCXDbZ9lNdcLZtLFsJ+MtjZatd0pW32tPAYv5h/NcT3fHRlYh6cDBbSIKxTE8DpBmT
	RXLZTtiTS9GtvmBAayiSdcMvzrBoZnNgIORSfhAFpqQ==
X-Received: by 2002:a05:651c:515:b0:383:20cd:52fe with SMTP id
 38308e7fff4ca-38a896b6407mr7399191fa.17.1773391010614; Fri, 13 Mar 2026
 01:36:50 -0700 (PDT)
Received: from 969154062570 named unknown by gmailapi.google.com with
 HTTPREST; Fri, 13 Mar 2026 01:36:49 -0700
Received: from 969154062570 named unknown by gmailapi.google.com with
 HTTPREST; Fri, 13 Mar 2026 01:36:49 -0700
From: Bartosz Golaszewski <brgl@kernel.org>
In-Reply-To: <2026031231-whiff-speculate-805a@gregkh>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260223-soc-of-root-v2-0-b45da45903c8@oss.qualcomm.com>
 <20260224183832.GB3239922-robh@kernel.org> <CAMRc=Mft5vc-C8miKVdw6C-qRdYsqfgm-UgLZJOctFwagMF0iA@mail.gmail.com>
 <2026031231-whiff-speculate-805a@gregkh>
Date: Fri, 13 Mar 2026 01:36:49 -0700
X-Gmail-Original-Message-ID: <CAMRc=MdhhEMJn5JTB3wn_ScmV=a0o6fTnaUDSDjOLN5WH5rOFQ@mail.gmail.com>
X-Gm-Features: AaiRm50bkC2plkyLpch8sSUugz619L6Cf_EZYcxggWcjYtxkwiUVoHYnqPIvC6o
Message-ID: <CAMRc=MdhhEMJn5JTB3wn_ScmV=a0o6fTnaUDSDjOLN5WH5rOFQ@mail.gmail.com>
Subject: Re: [PATCH v2 0/9] soc: remove direct accesses to of_root from drivers/soc/
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Rob Herring <robh@kernel.org>, 
	Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>, 
	Saravana Kannan <saravanak@kernel.org>, "Rafael J. Wysocki" <rafael@kernel.org>, 
	Danilo Krummrich <dakr@kernel.org>, "Christophe Leroy (CS GROUP)" <chleroy@kernel.org>, Shawn Guo <shawnguo@kernel.org>, 
	Sascha Hauer <s.hauer@pengutronix.de>, Pengutronix Kernel Team <kernel@pengutronix.de>, 
	Fabio Estevam <festevam@gmail.com>, Geert Uytterhoeven <geert+renesas@glider.be>, 
	Magnus Damm <magnus.damm@gmail.com>, Chen-Yu Tsai <wens@kernel.org>, 
	Jernej Skrabec <jernej.skrabec@gmail.com>, Samuel Holland <samuel@sholland.org>, 
	Frank Li <Frank.Li@nxp.com>, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linuxppc-dev@lists.ozlabs.org, linux-arm-kernel@lists.infradead.org, 
	imx@lists.linux.dev, linux-renesas-soc@vger.kernel.org, 
	linux-sunxi@lists.linux.dev, driver-core@lists.linux.dev, 
	Peng Fan <peng.fan@nxp.com>, Bartosz Golaszewski <brgl@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-29318-lists,linux-renesas-soc=lfdr.de];
	FREEMAIL_CC(0.00)[kernel.org,oss.qualcomm.com,pengutronix.de,gmail.com,glider.be,sholland.org,nxp.com,vger.kernel.org,lists.ozlabs.org,lists.infradead.org,lists.linux.dev];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,mail.gmail.com:mid,linuxfoundation.org:email];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[27];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[kernel.org:+];
	MISSING_XM_UA(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[brgl@kernel.org,linux-renesas-soc@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-renesas-soc,renesas];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: F007327FD7C
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Thu, 12 Mar 2026 16:18:38 +0100, Greg Kroah-Hartman
<gregkh@linuxfoundation.org> said:
> On Thu, Feb 26, 2026 at 10:28:26AM +0100, Bartosz Golaszewski wrote:
>> On Tue, Feb 24, 2026 at 7:38=E2=80=AFPM Rob Herring <robh@kernel.org> wr=
ote:
>> >
>> > On Mon, Feb 23, 2026 at 02:37:15PM +0100, Bartosz Golaszewski wrote:
>> > > linux/of.h declares a set of variables providing addresses of certai=
n
>> > > key OF nodes. The pointers being variables can't profit from stubs
>> > > provided for when CONFIG_OF is disabled which means that drivers
>> > > accessing these variables can't profit from CONFIG_COMPILE_TEST=3Dy
>> > > coverage.
>> > >
>> > > There are drivers under drivers/soc/ that access the of_root node. T=
his
>> > > series introduces new OF helpers for reading the machine compatible =
and
>> > > model strings, exports an existing SoC helper that reads the machine
>> > > string from the root node and finally replaces all direct accesses t=
o
>> > > of_root with new or already existing helper functions.
>> > >
>> > > Merging strategy: first two patches should be either acked by Rob or
>> > > picked up into an immutable branch based on v7.0-rc1, the rest can g=
o
>> > > through the SoC tree.
>> >
>> > SoC tree is good.
>> >
>> > For all but patch 8,
>> >
>> > Reviewed-by: Rob Herring (Arm) <robh@kernel.org>
>> >
>>
>> FYI Rob also reviewed patch 8 now. Who would pick the patches up? Greg
>> KH? There does not seem to be a centralized SoC maintainer in
>> MAINTAINERS?
>
> Sure, let me take them now, thanks.
>
> greg k-h
>

In the meantime Geert sent an alternative to patch 8/9 so this single one c=
an
be dropped from the series.

Thanks,
Bartosz

