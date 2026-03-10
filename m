Return-Path: <linux-renesas-soc+bounces-29123-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id IIm2Ivnsr2nkdAIAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-29123-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 10 Mar 2026 11:05:45 +0100
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id EE90A2490D3
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 10 Mar 2026 11:05:44 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id BBCE8305C30E
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 10 Mar 2026 10:03:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id ADE6E36C9CF;
	Tue, 10 Mar 2026 10:03:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b="IvVQiKD4"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail.zeus03.de (zeus03.de [194.117.254.33])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 09F2736A004
	for <linux-renesas-soc@vger.kernel.org>; Tue, 10 Mar 2026 10:03:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=194.117.254.33
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773137017; cv=none; b=JrB0Ydv2fVUt5hdtdYiLRHWdul22JuNOEPFXa7hvRfVa513F9+ZrJfWBZMXIZ7aYF/4qRPbiIEfiAsYCfIHNuB7/jcN0bZaAhXR7JkzXGAYuE9pQ/e6JNok4Yzw2OfpRns70tmnlcbqmfJbFyKi+J9q74H58hKG6S6GOpI41vFI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773137017; c=relaxed/simple;
	bh=ObvKi9NaY7+uPMYxFs24AME6sXp5oH7cru8lGbIE6BA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=i4E/Bz+kBfc35LUkOpyDVZicZc1wkty7nmu5BB1yZvi/kuCYlsRelXfYWMx/Cal5++Cg/7u0xI6Pp7y4+4u+6I4STJ6/z6SzK5ai4sl4ivgllHRSusWvq//zGvQXVFULaSZCWY+6QA6UsuSHB20VFHf3bCS5Fe8dn1hYfHn/v0o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com; spf=pass smtp.mailfrom=sang-engineering.com; dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b=IvVQiKD4; arc=none smtp.client-ip=194.117.254.33
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sang-engineering.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	sang-engineering.com; h=date:from:to:cc:subject:message-id
	:references:mime-version:content-type:in-reply-to; s=k1; bh=ayV8
	BCyf2XoDInYD5LQLPcn3jxd6CB5g4EREMmVVmUk=; b=IvVQiKD49JJr2mO8MnCm
	HNkjuXFc2q+FvRrxrIZVB3o4Y1HsKbz8tYvQdg54JveB+oixMwKDvo6BEbIGi5rN
	3lznh4JHMBi7e2LG/MVw/gaPWn1eGfa2mak79JsNkGmmAKVKqwV2WFwuTqZ/Y3mN
	NBy2rEmoFAT5DXAJomjfU+4qICRRQpHwA8awAfKdIvTnf4ClS2pflah1YRvJJsMo
	cMHsi6Cxo9JHrDe9CCDHjAWHTT9M4s14TM/+zAVwAnaFu5sL2vJSn1NhTsDcQS68
	5uZvwO+f0jf7ZMPSIzLwjFLZwf3pmQPXJDoM0CuEwI9nWjv55YuHKsQacyODcqqY
	cQ==
Received: (qmail 3159956 invoked from network); 10 Mar 2026 11:03:31 +0100
Received: by mail.zeus03.de with ESMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 10 Mar 2026 11:03:31 +0100
X-UD-Smtp-Session: l3s3148p1@cv2poahMaoogAwDPXzF+ANZpdrMKUeLI
Date: Tue, 10 Mar 2026 11:03:30 +0100
From: Wolfram Sang <wsa+renesas@sang-engineering.com>
To: Chen-Yu Tsai <wens@kernel.org>
Cc: linux-renesas-soc@vger.kernel.org, linux-kernel@vger.kernel.org,
	Wilken Gottwalt <wilken.gottwalt@posteo.net>,
	Bjorn Andersson <andersson@kernel.org>,
	Baolin Wang <baolin.wang@linux.alibaba.com>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>,
	linux-remoteproc@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev
Subject: Re: [PATCH v4 09/15] hwspinlock: sun6i: use new callback to
 initialize hwspinlock priv
Message-ID: <aa_sckE7C3kwqYxb@shikoro>
References: <20260310075539.11701-1-wsa+renesas@sang-engineering.com>
 <20260310075539.11701-10-wsa+renesas@sang-engineering.com>
 <CAGb2v64gTM41Q3aBkS+dqJ7w9fHtePte-6jeoFR3j-O1_aX9-Q@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAGb2v64gTM41Q3aBkS+dqJ7w9fHtePte-6jeoFR3j-O1_aX9-Q@mail.gmail.com>
X-Rspamd-Queue-Id: EE90A2490D3
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [0.34 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	R_DKIM_ALLOW(-0.20)[sang-engineering.com:s=k1];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-29123-lists,linux-renesas-soc=lfdr.de,renesas];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER_MAILLIST(0.00)[];
	DMARC_NA(0.00)[sang-engineering.com];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_CC(0.00)[vger.kernel.org,posteo.net,kernel.org,linux.alibaba.com,gmail.com,sholland.org,lists.infradead.org,lists.linux.dev];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[wsa@sang-engineering.com,linux-renesas-soc@vger.kernel.org];
	DKIM_TRACE(0.00)[sang-engineering.com:+];
	RCPT_COUNT_SEVEN(0.00)[11];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-renesas-soc];
	TO_DN_SOME(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sang-engineering.com:dkim,tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo]
X-Rspamd-Action: no action

Hi ChenYu,

> >  bank_fail:
> >         clk_disable_unprepare(priv->ahb_clk);
> 
> Just a note, I see further code savings in using the clk and reset devm_
> helpers. I'll do this after this series is merged, as the context overlaps.

Yes, I saw this, too, but thought that this needs HW for proper testing.
Great that you are up for it!

Happy hacking,

   Wolfram


