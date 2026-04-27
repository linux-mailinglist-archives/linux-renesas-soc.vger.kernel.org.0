Return-Path: <linux-renesas-soc+bounces-31672-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id iPrcCQst72mb8wAAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-31672-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 27 Apr 2026 11:31:55 +0200
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id C0AD346FF48
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 27 Apr 2026 11:31:54 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id EEB4B300821D
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 27 Apr 2026 09:31:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A2EE23B2FF4;
	Mon, 27 Apr 2026 09:31:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=dolcini.it header.i=@dolcini.it header.b="Oui0MOT0"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail11.truemail.it (mail11.truemail.it [217.194.8.81])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0A4A139A7F2;
	Mon, 27 Apr 2026 09:31:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.194.8.81
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777282296; cv=none; b=Y6QPpD/REBR03oFTohKkwiyxCNdatJ54i0rwpiwg2wXPkMckdDxSUv+weBCsqxjpSyqmI8CGOo6sFtct3qLZM8iQIM3loh/6BjhkcEiWkoiQrhWc9Ua/1arLa4rxsfDoDsA/eMN4dmD04Wq6FOHj/yFExairzeAlitGpEbxMq4A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777282296; c=relaxed/simple;
	bh=A0oXCMrybLIEwLDt5XmVSSXvZtqREUvn/lU0xjuCu6A=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=X7RlpiH4U48fP7xcaHQwOPkJx6htsaGnPx/MwzSXv/GL4y1XOtjahdgAfzubHJTJZpvxhlhpyLUHYpH73D6e7E/yAlG8/oXPCbNJ0LVVMEelN69/jc1rkvvotwD8JEamtzY10Gjt8bdUiiRyOv5QuQDhFk/zbA/TQHDdIN2G1eY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=dolcini.it; spf=pass smtp.mailfrom=dolcini.it; dkim=pass (2048-bit key) header.d=dolcini.it header.i=@dolcini.it header.b=Oui0MOT0; arc=none smtp.client-ip=217.194.8.81
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=dolcini.it
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=dolcini.it
Received: from francesco-nb (248.201.173.83.static.wline.lns.sme.cust.swisscom.ch [83.173.201.248])
	by mail11.truemail.it (Postfix) with ESMTPA id 39F831FB1B;
	Mon, 27 Apr 2026 11:31:31 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=dolcini.it;
	s=default; t=1777282292;
	bh=3f+ipyipbG9ve74SWingHtpF8ckpjt3qTGqxppXfFzY=; h=From:To:Subject;
	b=Oui0MOT0x94+2dM3R5uOpRffJ9Wx9j6ylSA9QAkTg92XTx+dn56JG7xkyoASs/fa6
	 jeurKD+LfLijfHlA9mg6wH5OqqjaEOvDVucHz17xzhALz3mdyDx+/MsPHaZVp+YVxJ
	 VIU34BPvnoFHTPl+YThEFIUGqU6HzI1TbxO1HNl3JHKluUYtK9yGDDeiUXDnyOF/Yz
	 U9rQ8naikD2oQ8qGchfq7QlTttc7kMhUh/sUuzk97naTvYQq6FTtCPfwqgnIJIqwXO
	 eWElkycEwmM5cl9ZVK2doQf8R3IWlYTNVaMEWuAXQbf20IyJv35NG87Vt7cb+pgGT3
	 aaV344jJwI6MA==
Date: Mon, 27 Apr 2026 11:31:27 +0200
From: Francesco Dolcini <francesco@dolcini.it>
To: Francesco Dolcini <francesco@dolcini.it>, peng.fan@oss.nxp.com,
	Alexander Stein <alexander.stein@ew.tq-group.com>,
	Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Cc: Rob Herring <robh@kernel.org>, Saravana Kannan <saravanak@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	"Rafael J. Wysocki" <rafael@kernel.org>,
	Danilo Krummrich <dakr@kernel.org>,
	"Christophe Leroy (CS GROUP)" <chleroy@kernel.org>,
	Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Magnus Damm <magnus.damm@gmail.com>, Chen-Yu Tsai <wens@kernel.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>, Frank Li <Frank.Li@nxp.com>,
	linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
	imx@lists.linux.dev, linux-renesas-soc@vger.kernel.org,
	linux-sunxi@lists.linux.dev, driver-core@lists.linux.dev,
	regressions@lists.linux.dev
Subject: Re: [PATCH v2 6/9] soc: imx8m: don't access of_root directly
Message-ID: <20260427093127.GA50667@francesco-nb>
References: <20260223-soc-of-root-v2-0-b45da45903c8@oss.qualcomm.com>
 <20260223-soc-of-root-v2-6-b45da45903c8@oss.qualcomm.com>
 <6593091.DvuYhMxLoT@steina-w>
 <20260427064704.GA17710@francesco-nb>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260427064704.GA17710@francesco-nb>
X-Rspamd-Queue-Id: C0AD346FF48
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.16 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[dolcini.it,none];
	R_DKIM_ALLOW(-0.20)[dolcini.it:s=default];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-31672-lists,linux-renesas-soc=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	RCPT_COUNT_TWELVE(0.00)[29];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_CC(0.00)[kernel.org,linuxfoundation.org,pengutronix.de,gmail.com,glider.be,sholland.org,nxp.com,lists.infradead.org,vger.kernel.org,lists.ozlabs.org,lists.linux.dev];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[francesco@dolcini.it,linux-renesas-soc@vger.kernel.org];
	DKIM_TRACE(0.00)[dolcini.it:+];
	TAGGED_RCPT(0.00)[linux-renesas-soc,renesas];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:email,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,i.mx:url]

+Peng

Hello all,

On Mon, Apr 27, 2026 at 08:47:04AM +0200, Francesco Dolcini wrote:
> On Tue, Mar 24, 2026 at 11:24:09AM +0100, Alexander Stein wrote:
> > Hi,
> > 
> > Am Montag, 23. Februar 2026, 14:37:21 CET schrieb Bartosz Golaszewski:
> > > Don't access of_root directly as it reduces the build test coverage for
> > > this driver with COMPILE_TEST=y and OF=n. Use existing helper functions
> > > to retrieve the relevant information.
> > > 
> > > Suggested-by: Rob Herring <robh@kernel.org>
> > > Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
> > 
> > today I noticed the following warning running next-20260323:
> > > caam 30900000.crypto: No clock data provided for i.MX SoC
> > 
> > This happens when there is no matching against the soc_id.
> > 
> > Checking the source it turns out this patch is the cause that the SoC info
> > does not provide soc_id anymore.
> > next-20260323:
> > > $ grep . /sys/devices/soc0/*
> > > /sys/devices/soc0/family:Freescale i.MX
> > > /sys/devices/soc0/machine:TQ-Systems i.MX8MPlus TQMa8MPxL on MBa8MP-RAS314
> > > grep: /sys/devices/soc0/power: Is a directory
> > > /sys/devices/soc0/revision:unknown
> > > /sys/devices/soc0/serial_number:0000000000000000
> > > grep: /sys/devices/soc0/subsystem: Is a directory
> > 
> > reverting this patch (2524b293a59e586afd06358d0b191ab57208a920):
> > > $ grep . /sys/devices/soc0/*
> > > /sys/devices/soc0/family:Freescale i.MX
> > > /sys/devices/soc0/machine:TQ-Systems i.MX8MPlus TQMa8MPxL on MBa8MP-RAS314
> > > grep: /sys/devices/soc0/power: Is a directory
> > > /sys/devices/soc0/revision:1.1
> > > /sys/devices/soc0/serial_number:469677A693A4B8CE131D180033E44903
> > > /sys/devices/soc0/soc_id:i.MX8MP
> > > grep: /sys/devices/soc0/subsystem: Is a directory
> > 
> > soc_id is restored. Now that I write these lines I noticed that
> > serial_number also contained empty value which is restored with the revert.
> 
> Any update on this? I would say this is a regression in 7.1-rc1.
> 
> I noticed the same issue, and CAAM is not working.
> 
> [    0.000000] Linux version 7.1.0-rc1-0.0.0-devel (oe-user@oe-host) (aarch64-tdx-linux-gcc (GCC) 15.2.0, GNU ld (GNU Binutils) 2.46) #1 SMP PREEMPT Sun Apr 26 21:19:00 UTC 2026
> ...
> [   10.611139] caam 30900000.crypto: No clock data provided for i.MX SoC
> [   10.611211] caam 30900000.crypto: probe with driver caam failed with error -22

I guess this is the fix

https://lore.kernel.org/all/20260427-soc-imx8m-fix-v1-1-1fe5b43d8090@nxp.com/


