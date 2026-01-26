Return-Path: <linux-renesas-soc+bounces-27443-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id CFeKFjuSd2m9hgEAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-27443-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 26 Jan 2026 17:11:39 +0100
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id 700E48A865
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 26 Jan 2026 17:11:38 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id AFAD63003BE2
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 26 Jan 2026 16:03:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0F4F729B78F;
	Mon, 26 Jan 2026 16:03:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="tWBD1KSI"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E08FE283FC8;
	Mon, 26 Jan 2026 16:03:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769443434; cv=none; b=hNi30N8OSoAg7/+URw69ZDz6s7gbgGCQXVmknjv8rC+iCZXcpcRBer3RbbUl9khBbodx9GPV87p6Icwpw2qV0fJjUf8lX5AxvRuSdPuhazkA3GdPmDVPnW3D/R5nk5VUh8U1l3q3HgxYDOihLvJeH5o0NHsCI0mowDVGXIu0I38=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769443434; c=relaxed/simple;
	bh=FpkYSUlhwypA+1UQimPBHuxwZJXwE1bM1io97K0VklU=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=FFkH9efmD2AvQpTdO72rBK6Lsinbz0l18JKkjCM5V/awSlFsST7StcSZS67BlKroT7xYOYhh67ugEYxES9nsxSVAaHY63mFjQktMHWei9rUY3F1cczB+hGsE3IjHLR1a3B3sxGFcGJ5BVNcJF1fL8GQUiMEpitmB+Wg0irvmHNw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=tWBD1KSI; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 10E8EC116C6;
	Mon, 26 Jan 2026 16:03:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1769443433;
	bh=FpkYSUlhwypA+1UQimPBHuxwZJXwE1bM1io97K0VklU=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=tWBD1KSIFhrD9ELKNPZPt5poIYIEL9CBNObQiGya81XhQf3ea9LDLEIOk2VnPx45M
	 vLgdRFEDbC/ZMA3cU5l/o9xuSN2CgYv8aShcZZhkaQL/MwdJtamuw8S1cdxoiV9rTh
	 JzADJ2UN3DCt06N34bLLKPwCEkJatoaYYjyVaTvwgh6vAYVEtfqa5UXdpZSc5xe2jc
	 LelokymI0Yp3LpR2j7wLBYhMT8axZeynO3UL1ZiwbQ0EFGb7ApjaEW926V4AYPIKT5
	 //5nzVXJgp0NV02X8sIPrcGxUdSN3iSgkszjH0VppFpS/hiAOieph8BiPQ2JyUy25y
	 WPCy6QWVtt+BQ==
From: Thomas Gleixner <tglx@kernel.org>
To: Prabhakar <prabhakar.csengg@gmail.com>, Philipp Zabel
 <p.zabel@pengutronix.de>, Geert Uytterhoeven <geert+renesas@glider.be>,
 Magnus Damm <magnus.damm@gmail.com>
Cc: linux-kernel@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
 Prabhakar <prabhakar.csengg@gmail.com>, Biju Das
 <biju.das.jz@bp.renesas.com>, Fabrizio Castro
 <fabrizio.castro.jz@renesas.com>, Lad Prabhakar
 <prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: Re: [PATCH 4/6] irqchip/renesas-rzv2h: Add CA55 software interrupt
 support
In-Reply-To: <20260121150137.3364865-5-prabhakar.mahadev-lad.rj@bp.renesas.com>
References: <20260121150137.3364865-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <20260121150137.3364865-5-prabhakar.mahadev-lad.rj@bp.renesas.com>
Date: Mon, 26 Jan 2026 17:03:49 +0100
Message-ID: <87cy2wcqe2.ffs@tglx>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [4.34 / 15.00];
	MID_END_EQ_FROM_USER_PART(4.00)[];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-27443-lists,linux-renesas-soc=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	GREYLIST(0.00)[pass,body];
	FREEMAIL_CC(0.00)[vger.kernel.org,gmail.com,bp.renesas.com,renesas.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com,pengutronix.de,glider.be];
	RCVD_COUNT_THREE(0.00)[4];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	FROM_NEQ_ENVFROM(0.00)[tglx@kernel.org,linux-renesas-soc@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[kernel.org:+];
	RCPT_COUNT_SEVEN(0.00)[10];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-renesas-soc,renesas];
	TO_DN_SOME(0.00)[];
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns,renesas.com:email]
X-Rspamd-Queue-Id: 700E48A865
X-Rspamd-Action: no action

On Wed, Jan 21 2026 at 15:01, Prabhakar wrote:
> From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
>
> The Renesas RZ/V2H ICU provides a software interrupt register (ICU_SWINT)
> that allows software to explicitly assert interrupts toward individual
> CA55 cores. Writing BIT(n) to ICU_SWINT triggers the corresponding
> interrupt.
>
> Introduce a debug mechanism to trigger software interrupts on individual
> Cortex-A55 cores via the RZ/V2H ICU. The interface is gated behind
> CONFIG_DEBUG_FS and a module parameter to ensure it only exists when
> explicitly enabled.

Can't you reuse/extend the existing mechanism provided by
CONFIG_GENERIC_IRQ_INJECTION (irq_inject_interrupt(), irq_debug_write())
instead of implementing yet another ad hoc debugfs magic?

Thanks,

        tglx
       

