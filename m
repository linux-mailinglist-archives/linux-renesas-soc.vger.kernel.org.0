Return-Path: <linux-renesas-soc+bounces-29183-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id cFSFOFdMsWlCtAIAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-29183-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 11 Mar 2026 12:04:55 +0100
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 43147262B46
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 11 Mar 2026 12:04:55 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 70A8C311DCB1
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 11 Mar 2026 09:06:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 89A5A271471;
	Wed, 11 Mar 2026 09:06:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="aSasD2ug"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2AECD3B6370;
	Wed, 11 Mar 2026 09:06:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773219999; cv=none; b=pieU4XmSb3AlfM6SZsa+jtBiOwc7hJd/L2ZcDMlLxUsMmvubf2miFSCRses+V9rSPxd8+6iMjXPtsRcKMtuJ8h+7nlAk+8t4QgF7fA0+moTk4V9Ks6RuIXOh1HPC5CVR88cLweTZOG2Vl4JV46vvYXSnGEx34h4M/KUIN0U1f4M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773219999; c=relaxed/simple;
	bh=mTr7cQ9QzJXMfN7Y4ISFlnlvutFXAKxC4eVakUeUfP4=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=uIgQOMufMr6IceHMicJvq0x9x8/ymKmg2zTuHZEglS1RQiG9VNgsJJqTd2H1yevCEKLVdKss0SUlrFqwLyfZG8lwgYt1ovSvcMgPzO3Bj8clpW45VGfRsGQ3l34qFVku66UmCYd8O128+YC0zIAHXmcVFsL5auHVffpRRvKbGIQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=aSasD2ug; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0847EC4CEF7;
	Wed, 11 Mar 2026 09:06:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1773219998;
	bh=mTr7cQ9QzJXMfN7Y4ISFlnlvutFXAKxC4eVakUeUfP4=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=aSasD2ugM4jugjfbRzAyQdVmAMphNu7E7uVEPKylec3deBtYLtuMukrOokZMWGSmm
	 zEzl+ExXFpc2PHIyqkrWYE87OJM/S/ws4ZuBbKdTs9U6soiCnxN1bTYcH0K8ofs4GK
	 pkVAhK6Z6P2bqL9QBWeWtxXBTqSQdXfojjtGVtKIdzoyGyV9p1bL5HC2+LoNZJZtZv
	 rw8I8W/WvQVh3ffL6hFuVnNxJVNxHGeUr65zp/sKi8j3k+g3iJ/Ku/nhPkMikPY/CA
	 itmtc+gbI709ayUio5p8rjelwRr3fKasiBmKvnirK7seXdOXOKXA3byUABkwmDmPWk
	 f1PH8q3Zswa0A==
From: Thomas Gleixner <tglx@kernel.org>
To: Biju <biju.das.au@gmail.com>
Cc: Biju Das <biju.das.jz@bp.renesas.com>, linux-kernel@vger.kernel.org,
 Geert Uytterhoeven <geert+renesas@glider.be>, Prabhakar Mahadev Lad
 <prabhakar.mahadev-lad.rj@bp.renesas.com>, Biju Das
 <biju.das.au@gmail.com>, linux-renesas-soc@vger.kernel.org
Subject: Re: [PATCH v4 4/9] irqchip/renesas-rzg2l: Drop IRQC_NUM_IRQ macro
In-Reply-To: <20260227140316.308106-5-biju.das.jz@bp.renesas.com>
References: <20260227140316.308106-1-biju.das.jz@bp.renesas.com>
 <20260227140316.308106-5-biju.das.jz@bp.renesas.com>
Date: Wed, 11 Mar 2026 10:06:34 +0100
Message-ID: <87jyvirazp.ffs@tglx>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain
X-Rspamd-Queue-Id: 43147262B46
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [4.34 / 15.00];
	MID_END_EQ_FROM_USER_PART(4.00)[];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-29183-lists,linux-renesas-soc=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	GREYLIST(0.00)[pass,body];
	FREEMAIL_CC(0.00)[bp.renesas.com,vger.kernel.org,glider.be,gmail.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com];
	RCVD_COUNT_THREE(0.00)[4];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	FROM_NEQ_ENVFROM(0.00)[tglx@kernel.org,linux-renesas-soc@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[kernel.org:+];
	RCPT_COUNT_SEVEN(0.00)[7];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-renesas-soc,renesas];
	TO_DN_SOME(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo]
X-Rspamd-Action: no action

On Fri, Feb 27 2026 at 14:03, Biju wrote:
> @@ -136,7 +145,7 @@ static void rzg2l_irqc_eoi(struct irq_data *d)
>  	raw_spin_lock(&priv->lock);
>  	if (hw_irq >= IRQC_IRQ_START && hw_irq <= IRQC_IRQ_COUNT)
>  		rzg2l_clear_irq_int(priv, hw_irq);
> -	else if (hw_irq >= IRQC_TINT_START && hw_irq < IRQC_NUM_IRQ)
> +	else if (hw_irq >= IRQC_TINT_START && hw_irq < priv->info.num_irq)
>  		rzg2l_clear_tint_int(priv, hw_irq);

As I pointed out in the review of the RZV2H driver:

   https://lore.kernel.org/all/87ecmavbs0.ffs@tglx/

this really begs for separate interrupt chips so that the decision is
made at setup time and not at every interrupt delivery in the hotpath.

Aren't you guys working together?

Thanks,

        tglx

