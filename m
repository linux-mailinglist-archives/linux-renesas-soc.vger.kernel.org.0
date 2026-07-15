Return-Path: <linux-renesas-soc+bounces-35262-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id doJvL6WUV2q1XQAAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-35262-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 15 Jul 2026 16:09:41 +0200
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id A639275F2E5
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 15 Jul 2026 16:09:40 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=pqrs.dk header.s=key1 header.b=gpR9QAJa;
	spf=pass (mail.lfdr.de: domain of "linux-renesas-soc+bounces-35262-lists+linux-renesas-soc=lfdr.de@vger.kernel.org" designates 104.64.211.4 as permitted sender) smtp.mailfrom="linux-renesas-soc+bounces-35262-lists+linux-renesas-soc=lfdr.de@vger.kernel.org";
	dmarc=none;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id EF04030283AE
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 15 Jul 2026 13:54:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A1D36330B32;
	Wed, 15 Jul 2026 13:53:52 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from out-178.mta0.migadu.com (out-178.mta0.migadu.com [91.218.175.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A9BAC32E13B
	for <linux-renesas-soc@vger.kernel.org>; Wed, 15 Jul 2026 13:53:49 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784123632; cv=none; b=bEhFe+uZyoW8Go1mVZss+yLQDpZoo2qqzdKemkAETpdrZiehZMCvBpYin89dKMoPa+xWdc9WbxvE0/vIzXf9Kpx6+paKCYGB4uxI2KRwnzrDFbUdNvOx/plQ8hQd7lTEkLU1Ruq6V82lZo9SHKoblDsjwgs7bhBvzj+YiT/STzw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784123632; c=relaxed/simple;
	bh=tE0B2+23fTF+MXibaCSsnYtnHHN1nGlYKSRZGPL25Bg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=RwXRXYwE0EFa35okSPcMU/5OmVD3+m0bWoXINm0WRwEJ2qGCVL0MXRL5pK+nFTp+gx3kPMU9UMVQK3BXCzrpft6VLXoPzW+hS+RBz0jA/Y2ksI1WDL64ua06id03iL4RkJA9pwjgAdEzkwufOe0+uBGUJand9tf9Z0nj55A90/0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pqrs.dk; spf=pass smtp.mailfrom=pqrs.dk; dkim=pass (2048-bit key) header.d=pqrs.dk header.i=@pqrs.dk header.b=gpR9QAJa; arc=none smtp.client-ip=91.218.175.178
Date: Wed, 15 Jul 2026 15:53:30 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=pqrs.dk; s=key1;
	t=1784123616;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=8OWX99xuFUxeLzhd68zhsFqF3XUUI5fLjHDeLMdYhHg=;
	b=gpR9QAJa41EOQh8O6CZHq0w9XYT4HXedu0yFHljC3qUkwaxvd0XdNcUHOvXqkjH9Fh51/h
	jwfKfW43d5i7PKF1yfAoO6Xvcy0l2s+XSrdYM3r8GZdlTeMt0BHCBmb8UsiFrCYFbgsgub
	fHN0knp+XeLe9P7pWtkW5S2LxoL186n7dh6U8p7PLzhGf1DXArGQXYYFahJzhz47jwnBxb
	arUgCfooQFgQmQ4GEPq3TXKbVPqACelGRIPLeIeai0zF0cZYzqa82skfaQioiF9T537Klk
	x0XYNTQniUzTK91RVK7QS1RxtsLLKb3OZxhh7i+bjl40CGDBsQ4LqqR0+b/H5Q==
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Alvin =?utf-8?Q?=C5=A0ipraga?= <alvin@pqrs.dk>
To: Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>
Cc: tomm.merciai@gmail.com, peda@lysator.liu.se, 
	prabhakar.mahadev-lad.rj@bp.renesas.com, peda@axentia.se, p.zabel@pengutronix.de, ulf.hansson@linaro.org, 
	linux-renesas-soc@vger.kernel.org, biju.das.jz@bp.renesas.com, Ulf Hansson <ulfh@kernel.org>, 
	Josua Mayer <josua@solid-run.com>, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v12 1/1] mux: Add driver for Renesas RZ/V2H USB VBENCTL
 VBUS_SEL mux
Message-ID: <aleQawQ_RFyqmLbM@pqrs.dk>
References: <cover.1784109616.git.tommaso.merciai.xr@bp.renesas.com>
 <fd55d955abff917123a33842076550dab931b548.1784109616.git.tommaso.merciai.xr@bp.renesas.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <fd55d955abff917123a33842076550dab931b548.1784109616.git.tommaso.merciai.xr@bp.renesas.com>
X-Migadu-Flow: FLOW_OUT
X-Spamd-Result: default: False [-0.16 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	R_DKIM_ALLOW(-0.20)[pqrs.dk:s=key1];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:tommaso.merciai.xr@bp.renesas.com,m:tomm.merciai@gmail.com,m:peda@lysator.liu.se,m:prabhakar.mahadev-lad.rj@bp.renesas.com,m:peda@axentia.se,m:p.zabel@pengutronix.de,m:ulf.hansson@linaro.org,m:linux-renesas-soc@vger.kernel.org,m:biju.das.jz@bp.renesas.com,m:ulfh@kernel.org,m:josua@solid-run.com,m:linux-kernel@vger.kernel.org,m:tommmerciai@gmail.com,s:lists@lfdr.de];
	RCVD_COUNT_THREE(0.00)[3];
	FORGED_SENDER(0.00)[alvin@pqrs.dk,linux-renesas-soc@vger.kernel.org];
	TAGGED_FROM(0.00)[bounces-35262-lists,linux-renesas-soc=lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[12];
	DMARC_NA(0.00)[pqrs.dk];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[pqrs.dk:+];
	FORGED_SENDER_FORWARDING(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[alvin@pqrs.dk,linux-renesas-soc@vger.kernel.org];
	FREEMAIL_CC(0.00)[gmail.com,lysator.liu.se,bp.renesas.com,axentia.se,pengutronix.de,linaro.org,vger.kernel.org,kernel.org,solid-run.com];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linux-renesas-soc];
	TO_DN_SOME(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[renesas.com:email,vger.kernel.org:from_smtp,analog.com:email,sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns,pengutronix.de:email,pqrs.dk:dkim,pqrs.dk:mid,pqrs.dk:from_mime]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: A639275F2E5
X-Rspamd-Action: no action

On Wed, Jul 15, 2026 at 12:12:46PM +0200, Tommaso Merciai wrote:
> As per the RZ/V2H(P) HW manual, VBUSEN can be controlled by the VBUS_SEL
> bit of the VBENCTL Control Register. This register is mapped in the
> reset framework. The reset driver expose this register as mux-controller
> and instantiates this driver. The consumer will use the mux API to
> control the VBUS_SEL bit.
> 
> Reviewed-by: Philipp Zabel <p.zabel@pengutronix.de>
> Signed-off-by: Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>

Reviewed-by: Alvin Šipraga <alvin.sipraga@analog.com>

