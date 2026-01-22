Return-Path: <linux-renesas-soc+bounces-27274-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id GEJ9BVz3cWmvZwAAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-27274-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 22 Jan 2026 11:09:32 +0100
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [IPv6:2605:f480:58:1:0:1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id 7F7FC6506A
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 22 Jan 2026 11:09:31 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id E04BF563BB0
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 22 Jan 2026 10:02:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C563F346760;
	Thu, 22 Jan 2026 10:02:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Gz98mo8N"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 83347328611;
	Thu, 22 Jan 2026 10:02:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769076122; cv=none; b=AV4eW1IDUG7XKc6v0iSwXugQXZdo+l+jAfUJcy3/ubYiGPTshuooVRz5VTGpvWHR79AFEYybgd7TTJCETjIDXOnrGSx9BXgnlwHZ9XnYoOHa3m9H5QLvh+QVAa7kSoIRalCbGk5KPIB7KegcbS4inOJ6Ga8Fn5lNah4SXHS2+3s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769076122; c=relaxed/simple;
	bh=7h+008P1K3Q9jVhJ+zav5FmELojwMkYGr9xmOqdNFI8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Q3t3rvHNEE6AdYUC04lQnTXn6nMFfxhXf5EgCRUqXut6ddK1I5kqvDXnqTBvX1z5ABxXLASFmjWndJFzwF3zktiTuZfAmUrSy+0r/sPVIYsVnrmG981bKkTgSpAQtxM7WHD/vccqlZ7zPXHAd78JyK5vlleofZyOvPVNgo+2ABw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Gz98mo8N; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A48B5C19423;
	Thu, 22 Jan 2026 10:02:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1769076122;
	bh=7h+008P1K3Q9jVhJ+zav5FmELojwMkYGr9xmOqdNFI8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Gz98mo8N0KWRiRpzZFJuFpKOQg8rZBN1K/NhbZFUP4uwzzouEvz1YIW1Qu6RlEaI/
	 KCkQ54oy3nX6vm0cvgRMsKcfKyZYXdWY5F60P74m8vn6lEBYv7UDNt3iXxUorsK9AS
	 nElZ12YCTCoHdhf7Y0CRxpriIOtpwhw3QFr7TAYqCCFiYII21aMMEp8CDkx0fUXi9U
	 EFCuK0jco0RvXpF54QYpGgtf1BdISsoMdnP+StToAqmldG0zv1QIk5V9fzokcg3lsY
	 xsSBP7sMkxmi+hpgZFMgoo1cwNSbBJWJA0uEg/egL5/+0He2tMj4TxmS+JwL5Bk9Y0
	 rvtlgKiU/7rXQ==
Date: Thu, 22 Jan 2026 11:01:59 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Geert Uytterhoeven <geert+renesas@glider.be>
Cc: soc@lists.linux.dev, soc <soc@kernel.org>, 
	Magnus Damm <magnus.damm@gmail.com>, linux-arm-kernel@lists.infradead.org, 
	linux-renesas-soc@vger.kernel.org
Subject: Re: [GIT PULL 2/3] Renesas DT binding updates for v6.20
Message-ID: <20260122-fragrant-auburn-oxpecker-33aa7b@quoll>
References: <cover.1768559762.git.geert+renesas@glider.be>
 <cover.1768559767.git.geert+renesas@glider.be>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <cover.1768559767.git.geert+renesas@glider.be>
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [0.04 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW_WITH_FAILURES(-0.50)[];
	MID_RHS_NOT_FQDN(0.50)[];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-27274-lists,linux-renesas-soc=lfdr.de];
	FROM_HAS_DN(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	FREEMAIL_CC(0.00)[lists.linux.dev,kernel.org,gmail.com,lists.infradead.org,vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[kernel.org:+];
	R_SPF_SOFTFAIL(0.00)[~all:c];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[krzk@kernel.org,linux-renesas-soc@vger.kernel.org];
	DMARC_POLICY_ALLOW(0.00)[kernel.org,quarantine];
	TAGGED_RCPT(0.00)[linux-renesas-soc,renesas];
	ASN(0.00)[asn:7979, ipnet:2605:f480::/32, country:US];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCPT_COUNT_FIVE(0.00)[6];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[dfw.mirrors.kernel.org:helo,dfw.mirrors.kernel.org:rdns]
X-Rspamd-Queue-Id: 7F7FC6506A
X-Rspamd-Action: no action

On Fri, Jan 16, 2026 at 11:50:17AM +0100, Geert Uytterhoeven wrote:
> The following changes since commit 8f0b4cce4481fb22653697cced8d0d04027cb1e8:
> 
>   Linux 6.19-rc1 (2025-12-14 16:05:07 +1200)
> 
> are available in the Git repository at:
> 
>   git://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-devel.git tags/renesas-dt-bindings-for-v6.20-tag1
> 
> for you to fetch changes up to f3b795d298a280687ed70211d51043ed5fc7a96a:
> 
>   dt-bindings: soc: renesas: Document RZ/N1 GPIO Interrupt Multiplexer (2026-01-15 11:56:09 +0100)
> 
> ----------------------------------------------------------------
> Renesas DT binding updates for v6.20
> 
>   - Document the RZ/N1 GPIO Interrupt Multiplexer.

This belongs to the driver patch (see submitting patches in DT) and is
not supposed to be separate pull. If you wanted to share with your DTS
branch then maybe just pull it as dependency, but the problem is that
Arnd just merged all driver pulls and this one was skipped.

I'll leave this one to Arnd to decide where to pull this.

Best regards,
Krzysztof


