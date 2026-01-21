Return-Path: <linux-renesas-soc+bounces-27242-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id cDkWLI1UcWkPEwAAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-27242-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 21 Jan 2026 23:34:53 +0100
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [142.0.200.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 2B9885EE0B
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 21 Jan 2026 23:34:53 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id AD386681388
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 21 Jan 2026 22:34:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0CEA43A7DE9;
	Wed, 21 Jan 2026 22:34:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b="GElB3n5P"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mout-p-103.mailbox.org (mout-p-103.mailbox.org [80.241.56.161])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2B2D8407594
	for <linux-renesas-soc@vger.kernel.org>; Wed, 21 Jan 2026 22:34:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=80.241.56.161
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769034882; cv=none; b=SC+r+LKQYEQxlGv4h8+RCIxprywF8rPNcWlkNvR3dDXbnuhingORCR5GZOfikIjz4mv3E8+hZnwSQaSfD+DEluQqPLQmNeaGkTUdYmgeErpVlI9QcWIny4JFb5bZo/VOHokwyDDMN1Rf6O1sKc3B4G6Wwm2r9NMqSTgh0e9zhNQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769034882; c=relaxed/simple;
	bh=p8HVx5U9R1yWVCorFqdX4wg5UC4Q+Jbc4g6TAL90O4I=;
	h=Message-ID:Date:MIME-Version:Subject:From:To:Cc:References:
	 In-Reply-To:Content-Type; b=GtAMXCRQIBCHysic2Xkyr10rPc4nd+I5Aa9t7EVplipWLPxqZN1D+bsdyM4CbLzJgVKrFrTNNmgxh2atnYdE+okeu1NrZuq/HfSaAKAIGXX86cmldU8ASAwOBvizwr7pA5hu6rH65p8Kw9VB3KxBTlHdyzf3DpgJol09ysEfBak=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mailbox.org; spf=pass smtp.mailfrom=mailbox.org; dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b=GElB3n5P; arc=none smtp.client-ip=80.241.56.161
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mailbox.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mailbox.org
Received: from smtp202.mailbox.org (smtp202.mailbox.org [IPv6:2001:67c:2050:b231:465::202])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mout-p-103.mailbox.org (Postfix) with ESMTPS id 4dxJsT3dVFz9tyd;
	Wed, 21 Jan 2026 23:34:37 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org; s=mail20150812;
	t=1769034877;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=nOIVcLvVFcWSuLuAPNcDsGiGlDzXBHXtRppJe2NX02A=;
	b=GElB3n5PYXD4tbhqA+pjuAre1uTo2ZNorDPb0e+JKkKeDoRaHhmSFIhUMgAdqNfdYfXTbk
	L/WNLrQCrFiqIaDDeqN1tsgDvqcLuQnWuJNrO0eOtnaVn7yaKOtXrI5a0cS+luVkhv8LCu
	SfcOyRPXKgr92X1mMrEo9jnDzZmk2J6vpgYuBc4DqUhkCGWgZsdT8GbuzSiqSaOEP7STl9
	Vd1s6qQC026vutfa7rjpNbC8ICfQ+aSeWZTem3eXhVHAQBAhstcVsRNC9fDhZPVNJupSdD
	hRrDpOT6UO/HPUh/DRWj7vnqxHZiaKxnGQUpxFJ2dm6PfsrEVBpoJVCV2ie1qw==
Message-ID: <6313097c-1a9c-4353-91e6-da97dda84dfc@mailbox.org>
Date: Wed, 21 Jan 2026 23:34:34 +0100
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Subject: Re: [PATCH] drm/imagination: Fix build on 32bit systems
From: Marek Vasut <marek.vasut@mailbox.org>
To: Matt Coster <Matt.Coster@imgtec.com>
Cc: David Airlie <airlied@gmail.com>, Frank Binns <Frank.Binns@imgtec.com>,
 Alessio Belle <Alessio.Belle@imgtec.com>,
 Alexandru Dadu <Alexandru.Dadu@imgtec.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Simona Vetter <simona@ffwll.ch>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "linux-renesas-soc@vger.kernel.org" <linux-renesas-soc@vger.kernel.org>,
 =?UTF-8?Q?Niklas_S=C3=B6derlund?= <niklas.soderlund@ragnatech.se>
References: <20251106232413.465995-1-marek.vasut+renesas@mailbox.org>
 <666b75d9-108c-42cf-bce7-b7efdb25e027@imgtec.com>
 <3af6990f-3b3e-4dbb-aa9e-1cd86341e0f0@mailbox.org>
Content-Language: en-US
In-Reply-To: <3af6990f-3b3e-4dbb-aa9e-1cd86341e0f0@mailbox.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-MBO-RS-META: i4sgg3bmbi9iceku4fyetzps6szrxaex
X-MBO-RS-ID: 658bc8f22e6a7e0b923
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.96 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW_WITH_FAILURES(-0.50)[];
	R_DKIM_ALLOW(-0.20)[mailbox.org:s=mail20150812];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RBL_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[142.0.200.124:from];
	TAGGED_FROM(0.00)[bounces-27242-lists,linux-renesas-soc=lfdr.de];
	FREEMAIL_CC(0.00)[gmail.com,imgtec.com,linux.intel.com,kernel.org,ffwll.ch,suse.de,lists.freedesktop.org,vger.kernel.org,ragnatech.se];
	RCPT_COUNT_TWELVE(0.00)[12];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	RCVD_COUNT_THREE(0.00)[4];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	DMARC_POLICY_ALLOW(0.00)[mailbox.org,reject];
	DKIM_TRACE(0.00)[mailbox.org:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	R_SPF_SOFTFAIL(0.00)[~all:c];
	FROM_NEQ_ENVFROM(0.00)[marek.vasut@mailbox.org,linux-renesas-soc@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linux-renesas-soc];
	RECEIVED_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2001:67c:2050:b231:465::202:received,52.25.139.140:received];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:7979, ipnet:142.0.200.0/24, country:US];
	DBL_BLOCKED_OPENRESOLVER(0.00)[dfw.mirrors.kernel.org:helo,dfw.mirrors.kernel.org:rdns,mailbox.org:email,mailbox.org:dkim,mailbox.org:mid]
X-Rspamd-Queue-Id: 2B9885EE0B
X-Rspamd-Action: no action

On 1/5/26 5:34 PM, Marek Vasut wrote:
> On 1/5/26 2:09 PM, Matt Coster wrote:
>> On 06/11/2025 23:24, Marek Vasut wrote:
>>> Fix support for build on 32bit systems. Include linux/io-64- 
>>> nonatomic-hi-lo.h
>>> to provide non-atomic readq()/writeq()/ioread64()/iowrite64() 
>>> accessors, and
>>> use __ffs64() instead of plain ffs() on 64bit number SZ_1T.
>>>
>>> This allows this driver to bind on Renesas R-Car H2 which contains
>>> Rogue G6400 BVNC 1.39.4.1 .
>>>
>>> Signed-off-by: Marek Vasut <marek.vasut+renesas@mailbox.org>
>>
>> Hi Marek,
> 
> Hello Matt,
> 
>> My apologies, this one appears to have slipped through the cracks on our
>> end.
> 
> No worries.

Has there been any progress on this ?

