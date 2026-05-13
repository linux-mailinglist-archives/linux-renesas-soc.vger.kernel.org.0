Return-Path: <linux-renesas-soc+bounces-32550-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id qG7uE+/WA2ol/AEAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-32550-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 13 May 2026 03:42:07 +0200
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id DE37E52C08D
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 13 May 2026 03:42:06 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 4617230FC7B1
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 13 May 2026 01:38:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3C69237DAAF;
	Wed, 13 May 2026 01:37:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="DqLSSLlD"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 939D964A8D;
	Wed, 13 May 2026 01:37:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778636238; cv=none; b=TnbsutfSoiNZMtFWMbv6aT9DzyryivJVKE0zibQCFQ1HcQb0ZzoXHoo+MZO0dHMJcfCI66akE2/L0nmpg8jsFBmDXTLUHqmWZWmGd2qMxVoXOTqL5SRHzRDMTtZSeN+qyqBc/XLU7guyP1wVI14l06L+wWDl667Ddp6U4LzIvpk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778636238; c=relaxed/simple;
	bh=6tYJPE2zPD+YaVCNcDA2oG+172L+n5H4t2bByGflb2A=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=UtiY7d3THYv7DoNInuN447GfxzthECuTgJddpQAQRyCrRLH7PeRaahrD5uzjdL4+6lu/TruEipEbRC+AU8p8h3r0gUNi34bdAWwKplu+GFFjofHI3G/i4HTsWozTQlVUDuFllRvoHEgDSRDSO8C9IXU7MVEdbMEemLvIR50xfzQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=DqLSSLlD; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 56D9AC2BCB0;
	Wed, 13 May 2026 01:37:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1778636237;
	bh=6tYJPE2zPD+YaVCNcDA2oG+172L+n5H4t2bByGflb2A=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=DqLSSLlDNLRuWTLPEapJABxAnAi+tjDpdsfqQNVTXcx5dyTKQ3atxvSZC76moiM01
	 F0EBCWwkLTG4+SAq7wvHsd28m2ENS6SaqdvfSxooQLYVN3VYmPbz37btsJ6lHzST3K
	 znp4rLG56mg/VKC6FUEBNpVMrc5NdCPeqy1TeyKUBW0QCYrBdv9coMV9lV0ZW6AVHi
	 u6lGqvboGYVhjy6IinNIRdCWRZE/To4W2Kk04dHw4PG87m+Cqz1gm3Soup8GHBMhJM
	 d3JBjBR2dOOgj6ZEOZaGnlbRzxeDOEk0QYHbJMFRGTqyEYmZY85lJGNiyYNQ0pR0PN
	 7wWS8QBFICCzA==
Date: Tue, 12 May 2026 18:37:16 -0700
From: Jakub Kicinski <kuba@kernel.org>
To: Michael Dege <michael.dege@renesas.com>
Cc: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>, Andrew Lunn
 <andrew+netdev@lunn.ch>, "David S. Miller" <davem@davemloft.net>, Eric
 Dumazet <edumazet@google.com>, Paolo Abeni <pabeni@redhat.com>, Niklas
 =?UTF-8?B?U8O2ZGVybHVuZA==?= <niklas.soderlund@ragnatech.se>, Paul Barker
 <paul@pbarker.dev>, netdev@vger.kernel.org,
 linux-renesas-soc@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH net-next v4 05/13] net: renesas: rswitch: add exception
 path for packets with unknown dst MAC
Message-ID: <20260512183716.482f3f90@kernel.org>
In-Reply-To: <20260511-rswitch_add_vlans-v4-5-a5a225f8faae@renesas.com>
References: <20260511-rswitch_add_vlans-v4-0-a5a225f8faae@renesas.com>
	<20260511-rswitch_add_vlans-v4-5-a5a225f8faae@renesas.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-Rspamd-Queue-Id: DE37E52C08D
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-32550-lists,linux-renesas-soc=lfdr.de];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[kernel.org:+];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[kuba@kernel.org,linux-renesas-soc@vger.kernel.org];
	MISSING_XM_UA(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linux-renesas-soc,netdev];
	RCPT_COUNT_SEVEN(0.00)[11];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns]
X-Rspamd-Action: no action

On Mon, 11 May 2026 10:52:08 +0200 Michael Dege wrote:
> Packets with unknown MAC address cannot be handled by the HW forwarding.
> These need to be forwarded, via an exception path, to the network driver.
> 
> Creates a queue for the exeption path. Packets received with unknown
> src/dst address need to be passed to the CPU. The received packet does not
> have the correct source port information, this is derived from the
> descriptor and added to the new queue. The received packet is added to the
> new queue and sent to the CPU for MAC learning. The CPU will broadcast the
> received packet, to all ports. This is how the HW learns the new MAC
> address.

I sent the AI reviews out just in case, main reason I'm dropping this
from pw is the new sparse build warning here:

drivers/net/ethernet/renesas/rswitch_main.c:1015:23: warning: cast to restricted __le64
drivers/net/ethernet/renesas/rswitch_main.c:1015:23: warning: restricted __le64 degrades to integer
drivers/net/ethernet/renesas/rswitch_main.c:1015:23: warning: restricted __le64 degrades to integer

