Return-Path: <linux-renesas-soc+bounces-29483-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id EMFjB0n+t2nrXwEAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-29483-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 16 Mar 2026 13:57:45 +0100
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 8C144299B95
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 16 Mar 2026 13:57:44 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id F30253019474
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 16 Mar 2026 12:57:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 630B6396D04;
	Mon, 16 Mar 2026 12:57:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="uQlhNjPn"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3A4EC395254;
	Mon, 16 Mar 2026 12:57:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773665858; cv=none; b=pbGTUb7RbRPZh9SCFKDMXe99JFu/X3hz27ayRR94X8rQ0ZvkBepZh4ZwwdejHtShZUuIcW5riOZZ+9CKBK/kLGtcaVJ86Q6i7nFLAr42Z9GueQeIJtgJfBSpKUsHV81j1EaoXHk9+t7TYmvOkZgdyUjRSMIsyPHmNlCYFLwuvZ4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773665858; c=relaxed/simple;
	bh=tzu+r2qc7wCfm8REikgVroUxtUjdMAAfjpIXLK3YodM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=LUp2gQfFa496cekY51CBkI4BpHDZpK+LdDbCipf9hRFrxW9mZJX9mmR8+2cBDQfqJQEAWYo63zhPPjACoSNvTFWrO4vRKCvLYSDX/8LgvLCTTFko/9YjhgqaKxwyG0AMzydGMEAX6Yzm9HRh9exHRDE9OuRgTF0N9m3056hFJ+s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=uQlhNjPn; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2D31AC19421;
	Mon, 16 Mar 2026 12:57:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1773665857;
	bh=tzu+r2qc7wCfm8REikgVroUxtUjdMAAfjpIXLK3YodM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=uQlhNjPnw/+sGK8GvTKCPoZUhDhYl44fzqlqWrftUDqeMtbvxoKYn2T6C/RVS+Ust
	 HK4Sw1FIffQBntafCLNjcpjmc2NeKQo5v8vL38/ERGybt1eC0kCQY6Zo/Qt5nU/QqU
	 15917IM/CEEWtpSG2iaw10u6phrNYX+YompvRt4EH7CrUaSEunPRgLzlaoy4kvXgf3
	 /cwtGWUo2f1P4U0AwsmUGEWOrOvjjNdkKWFvwebPQDGNC0mCP9S2MBe/YWLl/VM69B
	 269nAYZTQ3aThTX02S784XZH1qs1uKwt64gHF//3klHmNmcuFfYE/EhQXfpfyTqCbH
	 +KDvqMSWxjcvA==
Date: Mon, 16 Mar 2026 13:57:23 +0100
From: Niklas Cassel <cassel@kernel.org>
To: Christian Bruel <christian.bruel@foss.st.com>
Cc: Koichiro Den <den@valinux.co.jp>, jingoohan1@gmail.com, mani@kernel.org,
	lpieralisi@kernel.org, kwilczynski@kernel.org, robh@kernel.org,
	bhelgaas@google.com, Frank.Li@nxp.com, vigneshr@ti.com,
	s-vadapalli@ti.com, hongxing.zhu@nxp.com, l.stach@pengutronix.de,
	shawnguo@kernel.org, s.hauer@pengutronix.de, kernel@pengutronix.de,
	festevam@gmail.com, minghuan.Lian@nxp.com, mingkai.hu@nxp.com,
	roy.zang@nxp.com, jesper.nilsson@axis.com, heiko@sntech.de,
	srikanth.thokala@intel.com, marek.vasut+renesas@gmail.com,
	yoshihiro.shimoda.uh@renesas.com, geert+renesas@glider.be,
	magnus.damm@gmail.com, mcoquelin.stm32@gmail.com,
	alexandre.torgue@foss.st.com, thierry.reding@gmail.com,
	jonathanh@nvidia.com, hayashi.kunihiko@socionext.com,
	mhiramat@kernel.org, kishon@kernel.org, jirislaby@kernel.org,
	rongqianfeng@vivo.com, 18255117159@163.com,
	shawn.lin@rock-chips.com, nicolas.frattaroli@collabora.com,
	linux.amoon@gmail.com, vidyas@nvidia.com, shuah@kernel.org,
	linux-omap@vger.kernel.org, linux-pci@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	imx@lists.linux.dev, linuxppc-dev@lists.ozlabs.org,
	linux-arm-kernel@axis.com, linux-rockchip@lists.infradead.org,
	linux-arm-msm@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
	linux-stm32@st-md-mailman.stormreply.com,
	linux-tegra@vger.kernel.org, linux-kselftest@vger.kernel.org
Subject: Re: [PATCH v10 3/8] PCI: dwc: Advertise dynamic inbound mapping
 support
Message-ID: <abf-LKj8V2MpJFEE@ryzen>
References: <20260124145012.2794108-1-den@valinux.co.jp>
 <20260124145012.2794108-4-den@valinux.co.jp>
 <b2b03ebe-9482-4a13-b22f-7b44da096eed@foss.st.com>
 <tkfhaovpmaoodo35attvmbnpukcqgmwyrxmfgiwjy2dga65cgl@hmj4mx2n44ki>
 <5e485218-becf-499b-8a07-d25358504807@foss.st.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <5e485218-becf-499b-8a07-d25358504807@foss.st.com>
X-Spamd-Result: default: False [-0.16 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[valinux.co.jp,gmail.com,kernel.org,google.com,nxp.com,ti.com,pengutronix.de,axis.com,sntech.de,intel.com,renesas.com,glider.be,foss.st.com,nvidia.com,socionext.com,vivo.com,163.com,rock-chips.com,collabora.com,vger.kernel.org,lists.infradead.org,lists.linux.dev,lists.ozlabs.org,st-md-mailman.stormreply.com];
	TAGGED_FROM(0.00)[bounces-29483-lists,linux-renesas-soc=lfdr.de];
	FROM_HAS_DN(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[kernel.org:+];
	MISSING_XM_UA(0.00)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_GT_50(0.00)[55];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[cassel@kernel.org,linux-renesas-soc@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-renesas-soc,renesas];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	TO_DN_SOME(0.00)[]
X-Rspamd-Queue-Id: 8C144299B95
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Mon, Mar 16, 2026 at 01:41:03PM +0100, Christian Bruel wrote:
> Hi Koichiro,
> 
> > 
> > If I understood the problem correctly, would something like the patch below
> > address it? My expectation is that the subrange mapping test would then fail
> > consistently on platforms that do not have enough free IB iATU regions.
> > 
> 
> Thank you for your patch. Yes, now the bar subrange tests fail consistently,
> so that is enough to say this is not a regression.
> 
> However, I think there was a clear BAR missing somewhere before running the
> tests in the EPF driver, as the BARs could be reallocated during the other
> tests. This is not due to the subrange tests, but the EPF test driver
> supposes a 1:1 BAR/ATU mapping. Now this assumption is broken. I'm wondering
> if this could be improved to make the subrange tests pass on all platforms

Normally, you want one inbound iATU per enabled BAR, since you want the host
to be able to access all the enabled BARs at any time.

If you are thinking that we should somehow temporarily disable inbound
address translation for one of the enabled BARs, such that we can do "steal"
that iATU to test inbound subrange mapping, then I think that is a bad idea.

I think we should just let the test fail. Possibly we could call some API that
tells us that all inbound iATUs are occupied, and then SKIP instead of FAIL
the inbound subrange test case.

If you really want to test/use inbound subrange mapping, even if your SoC has
a very limited number of inbound iATUs, then I think a better solution is to
mark one or multiple of your BARs as disabled:
https://git.kernel.org/pub/scm/linux/kernel/git/pci/pci.git/commit/?h=endpoint&id=33642e9e36dc084e4fc9245a266c9843bc8303b9

Then you should have at least one more inbound iATU available, and should be
able to run the inbound subrange test case.


Kind regards,
Niklas

