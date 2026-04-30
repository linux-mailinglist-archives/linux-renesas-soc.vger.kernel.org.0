Return-Path: <linux-renesas-soc+bounces-31789-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id sPo3IlQt82mwxgEAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-31789-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 30 Apr 2026 12:22:12 +0200
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 2420D4A0BEE
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 30 Apr 2026 12:22:11 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id EF55F3037421
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 30 Apr 2026 10:17:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 560AD401491;
	Thu, 30 Apr 2026 10:17:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="TwV9rW8+"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 323373FFADA;
	Thu, 30 Apr 2026 10:17:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777544225; cv=none; b=RO3Zemv5dl7E0Gk9D9prMTqK7Ee7MmR+/WWNRbMRALe3PqXFuyzV/QdOS29bx3GqyVS21faRM8ITQCofUzZCiPXlz/+tZaepIPeUqwZt283lJXDY5Eg/U+dAA0wA+kfeI5YO5sxXzBgsPwWz++w74Y0kcFkujrJNvCBU6zcw8oU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777544225; c=relaxed/simple;
	bh=NQCNRA4r2Cl01+mMmoxO7aqM6wxV4AlNmytxTmeVZL4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=lLjpz1Y9PP3lUQFoFyLCVxAJ5yiknrsef3hNCEpCK9XWmnX6k9b7bt4njjXI8D9gXxSf1KIew8Q0FbBEXmwmo1WiMKgJ0fqMv0CV6ChkPtfvzjiMn3bpzvJWKIpRWUH3lGviIGhca807rU66QPtFtQqBpzKSkG6I+rqBLLVQdBY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=TwV9rW8+; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8331BC2BCB3;
	Thu, 30 Apr 2026 10:17:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1777544224;
	bh=NQCNRA4r2Cl01+mMmoxO7aqM6wxV4AlNmytxTmeVZL4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=TwV9rW8+ODlPxbCWtd/bNZuKjp7EDp5Bqbgyd8xmwapgpzfgb8vAIe0VkbHMtwwYR
	 d0dRjUcLzqrHKEAciBPYaHoSKtUWKQEBMv6FaP20bN1HJZOW8w8ml0E/f5FTlVo1Uo
	 nhCXyysrltsdprv8NrYpX3QmwKoUmiM5bKjTGcAy7B7V8tgjPvzkuPPplNIaFBMc3t
	 nA+oIv5QEIIBvXPoI5rQ+CL8PsGO7CW4Km/S4Yu5JvubMsVuyQ08D/kA6eJFk7lAFo
	 XCiovC9g7PqttlcijKwu2uce9T0T5EMCKBq6t7lhwKBcIufGEAqgMLefyXiOPdCED8
	 xxiJ3YeWiCq9Q==
Date: Thu, 30 Apr 2026 11:16:56 +0100
From: Sudeep Holla <sudeep.holla@kernel.org>
To: Geert Uytterhoeven <geert+renesas@glider.be>
Cc: Cristian Marussi <cristian.marussi@arm.com>,
	Marek Vasut <marek.vasut@mailbox.org>, arm-scmi@vger.kernel.org,
	Sudeep Holla <sudeep.holla@kernel.org>,
	linux-arm-kernel@lists.infradead.org,
	linux-renesas-soc@vger.kernel.org
Subject: Re: [PATCH 1/3] firmware: arm_scmi: quirk: Improve quirk range
 parsing
Message-ID: <20260430-heretic-mandrill-of-symmetry-1c9a5e@sudeepholla>
References: <cover.1775205358.git.geert+renesas@glider.be>
 <fe257b3b7b7b5c17fd0e5727bb9746c731bd7e3c.1775205358.git.geert+renesas@glider.be>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <fe257b3b7b7b5c17fd0e5727bb9746c731bd7e3c.1775205358.git.geert+renesas@glider.be>
X-Rspamd-Queue-Id: 2420D4A0BEE
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.16 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-31789-lists,linux-renesas-soc=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[kernel.org:+];
	MISSING_XM_UA(0.00)[];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[sudeep.holla@kernel.org,linux-renesas-soc@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[7];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-renesas-soc,renesas];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]

On Fri, Apr 03, 2026 at 10:41:29AM +0200, Geert Uytterhoeven wrote:
> When a range contains only an end ("-X"), the number string is parsed
> twice, as both "sep == first" and "sep != last" are true.  Fix this by
> dropping the superfluous number parsing for "sep == first".
> 
> This does have a harmless functional impact for the unbounded range:
> "-" is now accepted, while it was rejected before.
> 

Supporting "-" is good but I think the ret is uninitialised in that case
as sep, first and last are all equal. If you agree, I can patch up by
initialising ret to 0. Let me know if I am missing any other case where
it is not good to have ret initialised to 0.

-- 
Regards,
Sudeep

