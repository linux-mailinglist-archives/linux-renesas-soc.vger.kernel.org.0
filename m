Return-Path: <linux-renesas-soc+bounces-29549-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id sLUFDToSuWm7pAEAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-29549-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 17 Mar 2026 09:35:06 +0100
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 0750A2A5BCD
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 17 Mar 2026 09:35:06 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id E67883003532
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 17 Mar 2026 08:33:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4961438F620;
	Tue, 17 Mar 2026 08:33:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="u+5SsNID"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 25FC538CFE4;
	Tue, 17 Mar 2026 08:33:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773736382; cv=none; b=m90NsN832yo9d5RPg0YGdbaNJVZD02UiUW4yqfiTbjwhVdmhTBlvxF/2lozqvS/+Je55PWMSH3qk79ZJWrtMqeI0Y7gIE4d/s/Gy3gklCSpHf9mQaLbXjGinkZoxo2axSgyXSSLmCCkQSqlE89v54J2SymaY+ySAg5yf8ZJmmlM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773736382; c=relaxed/simple;
	bh=/8Mm9f4wVRAQRaL9ESTSosSt03cNCq/bqKwrcekeK7w=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=YyeQZBYa1qrMBEDu/WN9OmAhTRV3WD9+GQeLy4/S81r8bSs3RqaRWPhlb0dtf1oiu1kl3Bzi2LhOViV2ZJdqivaU2F0wD8p6peGkDifiIi8tfo05R6ZfsyD+lUAiGUlp55voAL1j7jEj+aOEGfYmS1NRRcujXf67vxsRbX9dKfA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=u+5SsNID; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4AAF4C4CEF7;
	Tue, 17 Mar 2026 08:33:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1773736381;
	bh=/8Mm9f4wVRAQRaL9ESTSosSt03cNCq/bqKwrcekeK7w=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=u+5SsNIDLHqHiF4ok0mD4BeGa9VRdXLvQUqHUq5v+0V8GJX2SjWmumNJXhwGtceAw
	 ng3r8yxFs+8y3X2uJbtLhEqBSvJ4uarpXQk1nD0c6zPcd/CZM1DoogIc1SniF+L/nN
	 vEs5/3zHIQQWCj5G7FDyboHgXdBpAiqReuOIHe3tQph8jgp0YxOEjy9/zr0vSD8dx3
	 wGQBKkXnEziG2VWytHqYIoJSkLajMJDEM6cBkRRqcmwqCeaplvAhaQPQOubIssmNur
	 evryn3ngLbkLE9syOLic6E/ckc8El5JHZvmwWPR8uR6RXPgurTR0WEglUZ1A0Ogi3C
	 4W0speqf+Hevw==
Date: Tue, 17 Mar 2026 09:32:59 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Geert Uytterhoeven <geert+renesas@glider.be>
Cc: soc@lists.linux.dev, soc <soc@kernel.org>, 
	Magnus Damm <magnus.damm@gmail.com>, linux-arm-kernel@lists.infradead.org, 
	linux-renesas-soc@vger.kernel.org
Subject: Re: [GIT PULL 0/4] Renesas SoC updates for v7.1
Message-ID: <20260317-spirited-mahogany-swift-b1ac53@quoll>
References: <cover.1773399669.git.geert+renesas@glider.be>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <cover.1773399669.git.geert+renesas@glider.be>
X-Spamd-Result: default: False [-0.16 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-29549-lists,linux-renesas-soc=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_CC(0.00)[lists.linux.dev,kernel.org,gmail.com,lists.infradead.org,vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_FIVE(0.00)[6];
	NEURAL_HAM(-0.00)[-0.996];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[krzk@kernel.org,linux-renesas-soc@vger.kernel.org];
	DKIM_TRACE(0.00)[kernel.org:+];
	TAGGED_RCPT(0.00)[linux-renesas-soc,renesas];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 0750A2A5BCD
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Fri, Mar 13, 2026 at 12:12:56PM +0100, Geert Uytterhoeven wrote:
> 	Hi SoC folks,
> 
> This is my first pull request for the inclusion of Renesas SoC updates
> for v7.1.
> 
> It consists of 4 parts:

I think pw-bot did not reply to any of these pulls, but I applied now
all of them.


Best regards,
Krzysztof


