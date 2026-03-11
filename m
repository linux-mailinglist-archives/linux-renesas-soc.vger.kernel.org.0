Return-Path: <linux-renesas-soc+bounces-29224-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 0Ne4IVCSsWnkDAAAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-29224-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 11 Mar 2026 17:03:28 +0100
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id B67DF266EE0
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 11 Mar 2026 17:03:27 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 936A23013704
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 11 Mar 2026 16:03:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9ACED1E8320;
	Wed, 11 Mar 2026 16:03:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="FbS8cv5m"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ADA3B36F405
	for <linux-renesas-soc@vger.kernel.org>; Wed, 11 Mar 2026 16:03:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.246.85.4
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773244982; cv=none; b=iQLjZgan5RI3KXjiMD+mFem4MA2cJ7sWu0G639wPqV7Ng8nnBRxWdkrOFUfCKrPa95s+OmDllbxgMENKgTQgVn6aFZv0Vz9ySn+Sbk7gNv+PbrlPQJ6wzBN5bKmYl20LAcQyIm5EBTYduannv518/QPgOL+6mNKKvlYZVYo/yR8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773244982; c=relaxed/simple;
	bh=7Xuw1f+5K/y//40WsEaZUVMHHpm/0gR1thyqMvwPzJk=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=UsZV6foX+vbxjRLF1g5aUco+6mMFBkuDtSMcIxXvG3clVaizBUQ7r79X+n6WM28rwaP7QdcJVSb0ImvY5iWFS5XnF+xGyJd4KXVJ+qhdFtnbN5LY6m0ZWajEMzpSLt8Lv9rFt7oKuk4RsrFvTt2J966dlGzjhMybKQg1I6MnBDU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=FbS8cv5m; arc=none smtp.client-ip=185.246.85.4
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id 2DF004E4261D
	for <linux-renesas-soc@vger.kernel.org>; Wed, 11 Mar 2026 16:02:59 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id E463660004;
	Wed, 11 Mar 2026 16:02:58 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 27E3310369D16;
	Wed, 11 Mar 2026 17:02:54 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1773244977; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=8qN+dhQ7pIipgV9gAXix/V7hiZX0XYifLWQqq8RuMIw=;
	b=FbS8cv5mqEBnW0ck1ma310L2cGQcGkF5hEZeu83lpF6B+nYICwGlCj6iQXp2YyMOkWXFUm
	sSUdKuk9yYOmDy968oeK2ApUGWr1Rt+J1B90oHVbd2eibMpYjUa04u2PRADlQ1SeG939kt
	Gxs/rsPjauEJ3VdeC2N+Q1Eg6y1rYtEqXrZH4CUA1T5ELG6dD5N2yn11YFclh/eN7vWwX0
	sRl/2Y2tDRorqpEtgIUDpGIIws4wd3AtKDBr/pGOhWO2P+Lwr7wHRZchtw0uuKGYcr4HXQ
	F+QylaO9rmPCkOixXr7A1YlovW+CIi80sfDEs7ScbApCUGH9PIn6AJStoWDQlQ==
Date: Wed, 11 Mar 2026 17:02:53 +0100
From: Herve Codina <herve.codina@bootlin.com>
To: Geert Uytterhoeven <geert+renesas@glider.be>
Cc: Wolfram Sang <wsa+renesas@sang-engineering.com>, Miquel Raynal
 <miquel.raynal@bootlin.com>, Magnus Damm <magnus.damm@gmail.com>,
 linux-renesas-soc@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH] ARM: dts: renesas: r9a06g032-rzn1d400-db: Do not use
 underscores in node names
Message-ID: <20260311170253.1636929e@bootlin.com>
In-Reply-To: <1c1fc11f1f183a8e72f168bf6eb35a40e01ecacb.1773240961.git.geert+renesas@glider.be>
References: <1c1fc11f1f183a8e72f168bf6eb35a40e01ecacb.1773240961.git.geert+renesas@glider.be>
Organization: Bootlin
X-Mailer: Claws Mail 4.3.1 (GTK 3.24.49; x86_64-redhat-linux-gnu)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Last-TLS-Session-Version: TLSv1.3
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[bootlin.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	R_DKIM_ALLOW(-0.20)[bootlin.com:s=dkim];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-29224-lists,linux-renesas-soc=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	HAS_ORG_HEADER(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_CC(0.00)[sang-engineering.com,bootlin.com,gmail.com,vger.kernel.org,lists.infradead.org];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_FIVE(0.00)[6];
	RCVD_COUNT_FIVE(0.00)[6];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[herve.codina@bootlin.com,linux-renesas-soc@vger.kernel.org];
	DKIM_TRACE(0.00)[bootlin.com:+];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-renesas-soc,renesas];
	MID_RHS_MATCH_FROM(0.00)[];
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns,bootlin.com:dkim,bootlin.com:email,bootlin.com:mid,glider.be:email]
X-Rspamd-Queue-Id: B67DF266EE0
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Hi Geert,

On Wed, 11 Mar 2026 15:58:07 +0100
Geert Uytterhoeven <geert+renesas@glider.be> wrote:

> Node names should not contain underscores; replace them by hyphens.
> 
> Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
> ---
> To be queued in renesas-devel for v7.1.
> 
>  arch/arm/boot/dts/renesas/r9a06g032-rzn1d400-db.dts | 12 ++++++------
>  1 file changed, 6 insertions(+), 6 deletions(-)
> 

Reviewed-by: Herve Codina <herve.codina@bootlin.com>

Best regards,
Hervé

