Return-Path: <linux-renesas-soc+bounces-29220-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 4Ja3K0OHsWmjCwAAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-29220-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 11 Mar 2026 16:16:19 +0100
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 1524B266435
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 11 Mar 2026 16:16:19 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 7B17B300F107
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 11 Mar 2026 15:16:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1C8132D0635;
	Wed, 11 Mar 2026 15:16:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b="cT4+KO/k"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail.zeus03.de (zeus03.de [194.117.254.33])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 52C91248F64
	for <linux-renesas-soc@vger.kernel.org>; Wed, 11 Mar 2026 15:16:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=194.117.254.33
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773242172; cv=none; b=Gibgtlsjmob8AwNWMfQS4fjzmu69nnNGAL5+usjjOdnMP2B6yvUZ6ULtaqjdGogJuOi9KR23nRfDxFPMnyQwusmORt8VhRzBsHyRmekrz6PMC1gJU5mhoiVZUPZy9LZm5CZTIb3bl5jkvZmoUO/fce3yW3B+6am+3xfwl0DamS8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773242172; c=relaxed/simple;
	bh=nxtq2wPEnUnTlpi24gXu3Z410yIaHALM9yTRXZpJuO8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=KfJGsrjAG+8cQChAVtuRS5eOlkgr22KLM251vSGEObDPrx4tWu9icMaSeVFLeZFh7/CKXiG3XoCpE4VaKY6YiF3+CR5bzygsZ7eHg9sF5heiFOoXWC6MYtbiQ6fLgKjndpmfPw9+PtT31fXqJgHUngPkL1LhcxX8vHsxg0svsxs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com; spf=pass smtp.mailfrom=sang-engineering.com; dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b=cT4+KO/k; arc=none smtp.client-ip=194.117.254.33
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sang-engineering.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	sang-engineering.com; h=date:from:to:cc:subject:message-id
	:references:mime-version:content-type:in-reply-to; s=k1; bh=htNc
	IrOF+PFlw7zenOeO9FQia6dj2plkNS7IIsDXECk=; b=cT4+KO/k8C+jdSBFDY0Q
	sVd+6v+MCCSF6rMMcemsuWX6HKt36keIjKr4J6lUGaUzZjUnJSknhgTppGTJdZPH
	n9ny6ULvYVTljCS/5v8RmHQ5IJhJ9nMVTkdOap2gC9UqLgNB7SS/LIk4lIzJ9zbn
	w0frs03i+Qx7m3h3w0d7wMPTKFuNSWV5jUEys7vVvVFAJbOqyBscA08ScdjoXDJN
	9YuV0fOTZmsxMIB6V74wGPI38+Uel8K9Uve8HkO5jvFkZJW/IJMzIPE7HTwD3JYy
	dv+KbDMFrlW7PrGGwQCBqiUGGkhM8g/s34JMvbGUxbTJbmxMsqZCQjFO74HPJ08Q
	oA==
Received: (qmail 3703507 invoked from network); 11 Mar 2026 16:16:04 +0100
Received: by mail.zeus03.de with ESMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 11 Mar 2026 16:16:04 +0100
X-UD-Smtp-Session: l3s3148p1@N5hEHcFMYUVUvUmE
Date: Wed, 11 Mar 2026 16:16:03 +0100
From: Wolfram Sang <wsa+renesas@sang-engineering.com>
To: Geert Uytterhoeven <geert+renesas@glider.be>
Cc: Miquel Raynal <miquel.raynal@bootlin.com>,
	=?utf-8?B?SGVydsOp?= Codina <herve.codina@bootlin.com>,
	Magnus Damm <magnus.damm@gmail.com>,
	linux-renesas-soc@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH] ARM: dts: renesas: r9a06g032-rzn1d400-db: Do not use
 underscores in node names
Message-ID: <abGHM6-GgkRoAMZG@shikoro>
References: <1c1fc11f1f183a8e72f168bf6eb35a40e01ecacb.1773240961.git.geert+renesas@glider.be>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1c1fc11f1f183a8e72f168bf6eb35a40e01ecacb.1773240961.git.geert+renesas@glider.be>
X-Spamd-Result: default: False [0.34 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	R_DKIM_ALLOW(-0.20)[sang-engineering.com:s=k1];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	DMARC_NA(0.00)[sang-engineering.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-29220-lists,linux-renesas-soc=lfdr.de,renesas];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[sang-engineering.com:+];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[wsa@sang-engineering.com,linux-renesas-soc@vger.kernel.org];
	FREEMAIL_CC(0.00)[bootlin.com,gmail.com,vger.kernel.org,lists.infradead.org];
	TAGGED_RCPT(0.00)[linux-renesas-soc,renesas];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCPT_COUNT_FIVE(0.00)[6];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sang-engineering.com:dkim,sang-engineering.com:email,glider.be:email,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 1524B266435
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Wed, Mar 11, 2026 at 03:58:07PM +0100, Geert Uytterhoeven wrote:
> Node names should not contain underscores; replace them by hyphens.
> 
> Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>

Reviewed-by: Wolfram Sang <wsa+renesas@sang-engineering.com>


