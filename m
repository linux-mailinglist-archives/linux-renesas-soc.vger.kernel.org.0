Return-Path: <linux-renesas-soc+bounces-33169-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id uCbCE5eOFWrUWQcAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-33169-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 26 May 2026 14:14:15 +0200
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id B0BBE5D55E8
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 26 May 2026 14:14:14 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 9BDD33047272
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 26 May 2026 12:09:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 546AF3F65EE;
	Tue, 26 May 2026 12:09:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="e9O9eX36"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2C6753E4C81;
	Tue, 26 May 2026 12:09:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779797391; cv=none; b=VcpDqXNqLdTohZjvV7+qI05iK/V67VseHoj+3t4Oimyg0LACb/8unj/ez4KsjTR9wFJBVr8eBNgf8/GtrVwwVCSD2Tb3FmoiJKLtok2QbzaGm/vvucmab83+zGaLkZYy5+BiXF1m1W/W/4cNdD68kAa03ga3g/o49CVDb7u52YA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779797391; c=relaxed/simple;
	bh=95VJBcmImw7T+cFGswTr7XUpWB3sE+6tss6ytkzEa98=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=EsT34Nv0teB2QRLUT+PFo/TxDR3gyYXx81zdkpnRaMAPQLMa0VtpY3IEnQlWc8xb0z6KaT5B7lzCfLZ41NUN0all/qn8u658mh855o3cqdbv6G+ROxw+H7rFtrJTKbK0sb+DbSxVKHchi5dbV51QPK2WDwG85Tc0jOb9XGw4AV0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=e9O9eX36; arc=none smtp.client-ip=100.103.45.18
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F31431F00A3A;
	Tue, 26 May 2026 12:09:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1779797389;
	bh=AtMFYqEtdCuJrcazBXUODEBZ7PTudSVOUe8VhIjfp1Q=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To;
	b=e9O9eX36S7TX/g1kHhDT+o+aL3QMnGaEBVft7LJr6Usq7OcN7qarLBu6x3F/hWEOb
	 H5Gb6fuay5cKMJ3vo0+cZwsUC2kTjZEWmUfPjoGAnJJ4IkV9N+7GIJG7JfieV3SHMW
	 aouZrofH7ChtJL/I+prAuyVZ3nGS06mAYlFYcZzrYMhIxKS25TFTzBRWElnqn/1giL
	 eOMwnsT835KpIJejW+Y5ZSqLsbvueULMOevGv2gIEU2iOKYqtZiHw8Bj63oDPrSpBL
	 FsTfelVrlOHgcraTDHTIp/FLtd5sTAmweUJbbTGyjwa8Fw8SvolrgcZZw2J0g4DfG8
	 SxWnCubEzxUdA==
Message-ID: <0e71f527-db39-4ad2-84d9-897464f74316@kernel.org>
Date: Tue, 26 May 2026 14:09:46 +0200
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] Revert "driver core: Use mod_delayed_work to prevent lost
 deferred probe work"
To: Biju <biju.das.au@gmail.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 "Rafael J. Wysocki" <rafael@kernel.org>,
 Biju Das <biju.das.jz@bp.renesas.com>, driver-core@lists.linux.dev,
 linux-kernel@vger.kernel.org, Geert Uytterhoeven <geert+renesas@glider.be>,
 Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>,
 linux-renesas-soc@vger.kernel.org
References: <20260526120306.184283-1-biju.das.jz@bp.renesas.com>
From: Danilo Krummrich <dakr@kernel.org>
Content-Language: en-US
In-Reply-To: <20260526120306.184283-1-biju.das.jz@bp.renesas.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20260515];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-33169-lists,linux-renesas-soc=lfdr.de];
	FROM_HAS_DN(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FREEMAIL_TO(0.00)[gmail.com];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[kernel.org:+];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-0.999];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dakr@kernel.org,linux-renesas-soc@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linux-renesas-soc,renesas];
	RCPT_COUNT_SEVEN(0.00)[9];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,renesas.com:email]
X-Rspamd-Queue-Id: B0BBE5D55E8
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On 5/26/26 2:03 PM, Biju wrote:
> From: Biju Das <biju.das.jz@bp.renesas.com>
> 
> Commit 1137838865bf ("driver core: Use mod_delayed_work to prevent lost
> deferred probe work") introduced below regression on Renesas SMARC RZ/G2L
> EVK:
>  class_for_each_device called for class 'devlink' before it was registered
>  WARNING: drivers/base/class.c:415 at class_for_each_device+0x12c/0x13c, CPU#1: kworker/1:1/26
>  class_for_each_device+0x12c/0x13c (P)
>  fw_devlink_probing_done+0x58/0xa0
>  deferred_probe_timeout_work_func+0x5c/0xb8
>  process_one_work+0x150/0x290
>  worker_thread+0x18c/0x300
>  kthread+0x114/0x120
> 
> Reverting the commit fixes the issue.
There's already [1], which should also fix the issue.

Thanks,
Danilo

[1]
https://lore.kernel.org/driver-core/20260525012340.3860581-1-dakr@kernel.org/t/#u

