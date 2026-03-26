Return-Path: <linux-renesas-soc+bounces-30365-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id sDzOHCprxWl1+AQAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-30365-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 26 Mar 2026 18:21:46 +0100
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id C1E1933914C
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 26 Mar 2026 18:21:45 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 8355A300B8CC
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 26 Mar 2026 14:43:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DA0AA37F8CF;
	Thu, 26 Mar 2026 14:43:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="XBDe3Axd"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B679F371061;
	Thu, 26 Mar 2026 14:43:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774536189; cv=none; b=p9qy14lCh1HOopHdJA9IBXvCcjTu0IKr+UduMPNHYrSipDOSj5BBf/10VjCFGV2TTAdm1LgwAvkZnQQHmTXL5XMJBMZsH+qqKorDn+PFRWpE7l/FexTdMQZNxvzZuA4ebnqoavHStQpccYkYZmNUjflrY/KG7doIjkdO4Wns3uM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774536189; c=relaxed/simple;
	bh=EFCCbeGV7alvkb3enGO4Ab2gph89x/AJS3Ycwvghqks=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=eKV9DX/avXZBOkPEDuK9rv5oL2voh0SzLwotoqGFa7LL1nUrsO5+GrUjB+IhkdBsstxzfxRvt1r3cO0nSh6Q3AuUeo5vlz+HOR2NKyBNZbAOK1o74W7NjMDvQ+U3WNvorBUUPhPr03uHqVma1QWb2aAXbCi01QTsAJYf015kqP8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=XBDe3Axd; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AF43CC116C6;
	Thu, 26 Mar 2026 14:43:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1774536189;
	bh=EFCCbeGV7alvkb3enGO4Ab2gph89x/AJS3Ycwvghqks=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=XBDe3AxdecDsWSkEMpG014Xhv12UG9vzJU1vmpHAGY9AMk2zVtVRJzsXoHeQdP8AB
	 MTCDsniYnt34MANY65sKAQFkDdZsAYSMtDApYcefTtib1oe1dnCtqZfgVoOSwNRDku
	 vlxNw8WwksSqTI+EbI60fHUdYYcQJlQM8aL28C7T6ZGRE1GwMck6DPiT5oemFCk10h
	 KMWEdEgNc2FEYWB9H6zDO00eaJX0UDjoT+Zm5jsQSVADpaNkwZ3NhiqFv64bKzbXyT
	 Eota1a9KTe15tPmZkaEWv2QFkniUhALVkdCLn6x3cVqufvJgB/dYv7ka7b4C5us6eN
	 gPQo7CdYtLBDA==
From: Thomas Gleixner <tglx@kernel.org>
To: Geert Uytterhoeven <geert+renesas@glider.be>, Marc Zyngier <maz@kernel.org>
Cc: linux-arm-kernel@lists.infradead.org, linux-renesas-soc@vger.kernel.org,
 linux-kernel@vger.kernel.org, Geert Uytterhoeven <geert+renesas@glider.be>
Subject: Re: [PATCH v2] irqchip/gic-v3: Print a warning for out-of-range
 interrupt numbers
In-Reply-To: <ce695ea46decc816974179314a86f2b9b5cad6a9.1772799134.git.geert+renesas@glider.be>
References: <ce695ea46decc816974179314a86f2b9b5cad6a9.1772799134.git.geert+renesas@glider.be>
Date: Thu, 26 Mar 2026 15:43:01 +0100
Message-ID: <87wlyyd53e.ffs@tglx>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain
X-Spamd-Result: default: False [4.34 / 15.00];
	MID_END_EQ_FROM_USER_PART(4.00)[];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-30365-lists,linux-renesas-soc=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	RCVD_COUNT_THREE(0.00)[4];
	GREYLIST(0.00)[pass,body];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[tglx@kernel.org,linux-renesas-soc@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[kernel.org:+];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-renesas-soc,renesas];
	RCPT_COUNT_FIVE(0.00)[6];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns,glider.be:email]
X-Rspamd-Queue-Id: C1E1933914C
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Fri, Mar 06 2026 at 13:13, Geert Uytterhoeven wrote:
> gic_irq_domain_translate() does not check if an interrupt number lies
> within the valid range of the specified interrupt type.  Add these
> checks, and print a warning if the interrupt number is out of range.
>
> This can help flagging incorrectly described Extended SPI and PPI
> interrupts in DT.
>
> Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>

Marc, any objections or comments?


