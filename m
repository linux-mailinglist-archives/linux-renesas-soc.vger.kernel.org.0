Return-Path: <linux-renesas-soc+bounces-28232-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id cEwzOKzWkmnKywEAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-28232-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 16 Feb 2026 09:34:52 +0100
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 7889614197D
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 16 Feb 2026 09:34:52 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 62E963001FC8
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 16 Feb 2026 08:34:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0BB832FBDF5;
	Mon, 16 Feb 2026 08:34:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b="JiawxJRN"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail.zeus03.de (zeus03.de [194.117.254.33])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 573C12ED858
	for <linux-renesas-soc@vger.kernel.org>; Mon, 16 Feb 2026 08:34:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=194.117.254.33
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771230889; cv=none; b=sRyryl2JtHM2GIKtCv9OEuvGtMGyUhvjWt+I6ZlF1ffyJqEy67B581mDLNFhz/icMSxjUJ/IEThWY8A876E+/aMwlaMEqJanhKKBbRbDKvd8m68qoUJo/xfubR53lgssSLw9D2jDfwnLhqfg+6nWKzurxW6in02BmH/tfTmaKIs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771230889; c=relaxed/simple;
	bh=dvQgcaenU0SHlZ2HJsbaNWEWu0qsn7uquDLz40HRHfc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=VmZaUuJtaobEbBgv08+F8kYzmMX+7LuJtFWYIxt/kxyMFBkl8npHH+ePVPDte5M76q+xt+QL/xiE19JptYlaE1l44HZSob1+zgiJIoGVadRWIqWXGTamMmK8meDMy+UoThBsWWTY/Ca+dQp7umd6exxXypgpPYs4SryYO2VF6WU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com; spf=pass smtp.mailfrom=sang-engineering.com; dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b=JiawxJRN; arc=none smtp.client-ip=194.117.254.33
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sang-engineering.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	sang-engineering.com; h=date:from:to:cc:subject:message-id
	:references:mime-version:content-type:in-reply-to; s=k1; bh=udWn
	s0/tE9VKlKkv9PZVrjAGz6UPCuc03cHhjm82iJE=; b=JiawxJRNnzOnh5J1hVMh
	E5duxMm3nyH2uDC+IPLFgg3q1xpmC7YqD9esUnX1lU/oL7BU9hRdwHsHasD69/fa
	gfyDd7xv69iBMmdpaeoSlfesWXrKB35LRWiALI/TJIhAAteXx697Uw6Z2QsWpNxZ
	JYobhZkrtlvxpVbjZ9nsh3dB+cpmAtgEt0WmB0vSJXkVOGRhxu93MVFPt7papNLM
	ZSfv0rFQ4rku+pla5XnOn7G+ab5NbnREMvkE/EBWTAGSP/AkabrJ6weMmqYFysIJ
	orrqckAcPD/DdHyruK3K0KYRCMwldOcIUxYCus5bHrfo8yM1kzBAT+jvmKSAcDiE
	vg==
Received: (qmail 3164830 invoked from network); 16 Feb 2026 09:34:44 +0100
Received: by mail.zeus03.de with UTF8SMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 16 Feb 2026 09:34:44 +0100
X-UD-Smtp-Session: l3s3148p1@2umq0+xKxoEujnu0
Date: Mon, 16 Feb 2026 09:34:44 +0100
From: Wolfram Sang <wsa+renesas@sang-engineering.com>
To: Andy Shevchenko <andriy.shevchenko@intel.com>
Cc: linux-renesas-soc@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Andy Shevchenko <andy@kernel.org>,
	Antonio Borneo <antonio.borneo@foss.st.com>,
	Arnd Bergmann <arnd@arndb.de>,
	Baolin Wang <baolin.wang@linux.alibaba.com>,
	Bjorn Andersson <andersson@kernel.org>,
	Boqun Feng <boqun@kernel.org>, Chen-Yu Tsai <wens@kernel.org>,
	Chunyan Zhang <zhang.lyra@gmail.com>,
	Danilo Krummrich <dakr@kernel.org>,
	David Lechner <dlechner@baylibre.com>, driver-core@lists.linux.dev,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Ingo Molnar <mingo@redhat.com>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Jonathan Cameron <jic23@kernel.org>,
	Jonathan Corbet <corbet@lwn.net>,
	Konrad Dybcio <konradybcio@kernel.org>, Lee Jones <lee@kernel.org>,
	Linus Walleij <linusw@kernel.org>, linux-arm-msm@vger.kernel.org,
	linux-doc@vger.kernel.org, linux-gpio@vger.kernel.org,
	linux-iio@vger.kernel.org, linux-omap@vger.kernel.org,
	linux-remoteproc@vger.kernel.org, linux-spi@vger.kernel.org,
	linux-stm32@st-md-mailman.stormreply.com,
	linux-sunxi@lists.linux.dev, Mark Brown <broonie@kernel.org>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Nuno =?utf-8?B?U8Oh?= <nuno.sa@analog.com>,
	Orson Zhai <orsonzhai@gmail.com>,
	Peter Zijlstra <peterz@infradead.org>,
	"Rafael J. Wysocki" <rafael@kernel.org>,
	Samuel Holland <samuel@sholland.org>,
	Shuah Khan <skhan@linuxfoundation.org>,
	Srinivas Kandagatla <srini@kernel.org>,
	Thomas Gleixner <tglx@kernel.org>, Waiman Long <longman@redhat.com>,
	Wilken Gottwalt <wilken.gottwalt@posteo.net>,
	Will Deacon <will@kernel.org>
Subject: Re: [RFC v2 PATCH 00/13] hwspinlock: move device alloc into core and
 refactor includes
Message-ID: <aZLWpM8XOvidXJl7@ninjato>
References: <20260215225501.6365-1-wsa+renesas@sang-engineering.com>
 <aZLJ8Z4XOTEUJfmh@smile.fi.intel.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aZLJ8Z4XOTEUJfmh@smile.fi.intel.com>
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [0.34 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	R_DKIM_ALLOW(-0.20)[sang-engineering.com:s=k1];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	DMARC_NA(0.00)[sang-engineering.com];
	RCPT_COUNT_TWELVE(0.00)[45];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[bounces-28232-lists,linux-renesas-soc=lfdr.de,renesas];
	DKIM_TRACE(0.00)[sang-engineering.com:+];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[wsa@sang-engineering.com,linux-renesas-soc@vger.kernel.org];
	FREEMAIL_CC(0.00)[vger.kernel.org,lists.infradead.org,foss.st.com,kernel.org,arndb.de,linux.alibaba.com,gmail.com,baylibre.com,lists.linux.dev,linuxfoundation.org,redhat.com,lwn.net,st-md-mailman.stormreply.com,analog.com,infradead.org,sholland.org,posteo.net];
	TAGGED_RCPT(0.00)[linux-renesas-soc];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sang-engineering.com:dkim,sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 7889614197D
X-Rspamd-Action: no action


> > Looking forward to comments. I especially wonder if the last patch
> > should stay as-is or if it should be broken out, so individual
> > subsystems can pick up their part (with a fallback in place, of course,
> > until the last user is converted).
> 
> Coincidentally I have briefly reviewed it in the Git tree before you have sent
> this to ML. I like the whole series, but what I have missed is the explanation
> of the removal of Contact: comment in some of the files.

Ah, thanks! True, documenting it slipped through the cracks. Sorry about
that. The reason is, of course, we have MAINTAINERS for this kind of
information. Plus, Ohad Ben-Cohen hasn't been commiting upstream to 10+
years according to git history.


