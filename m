Return-Path: <linux-renesas-soc+bounces-30664-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id cHgIN1YxzGmwRAYAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-30664-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 31 Mar 2026 22:40:54 +0200
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 3FBA0371356
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 31 Mar 2026 22:40:54 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 9E3403009CDB
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 31 Mar 2026 20:29:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2F8FD44E040;
	Tue, 31 Mar 2026 20:29:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="rAoYCzD6"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0CA5844E037;
	Tue, 31 Mar 2026 20:29:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774988990; cv=none; b=HoUQWKKM7PfVoHiTR5R0YPVrvwAz3wz84KDRKmRCcnKcrZZTfPzOsZpgDDRSUTKhkSRyJ4om3GKOguujUIigHgonVp0Aiy5qSI4hmE9P+kG3hIZrc7GQ0WUqff4bffmUjwwh3xhFY+t9WPIrhd1xPY9HwsEJ7PpyioWZSvJinrU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774988990; c=relaxed/simple;
	bh=PHM6qilVc0iZwoOEphKJYaDvjoWJyY418p9srkYM3ck=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=LVD/IMn/JdVfi9q/uq4QvfFNbZJYb/FevG82U4XM7Hdec+yoKioCICH6NhRNojDf3iIgA8kvntX7h8sU0XsvR6ZFck9xx0wwGL/XxD5EIoR3rYXZzWibF6jwU7sqWgcnCYGa1j27gOWOMUVsyYIuRoG3QEDG+mUJeWrcDOU2238=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=rAoYCzD6; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0E0D1C19423;
	Tue, 31 Mar 2026 20:29:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1774988989;
	bh=PHM6qilVc0iZwoOEphKJYaDvjoWJyY418p9srkYM3ck=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=rAoYCzD6XInsoLsMcT3NALHIYIUNmiEVm162x2zDoWPl0gHc+CdHOhU7zK6nuzPrs
	 RB8l4d1nT0UJwFiq/Hc5Xc+PcYuGgHLg+vI/mgyfZotgpQ5lX7/Ea6BvjHP/wU238a
	 MLeT+frN0bKipjStmAgW0FuIu/Ng3dQH1ab+K8JmYTwEyISaaYBD1BtCYokIR2EAM/
	 8rBfzhnpylt5Ucn53IUjY1+sV/v98ZOwnxy7YNJZm3slx0NhqqhZHnPn0Yid0Ds4vw
	 qqagA/K3+un98d1uydEEuwVmfqlubgS3vtJbTIIKoBn5GTpcPAGY3SYNMukkJHp89a
	 /Hnpnm4BZzJzQ==
From: Thomas Gleixner <tglx@kernel.org>
To: Biju Das <biju.das.jz@bp.renesas.com>, "biju.das.au"
 <biju.das.au@gmail.com>
Cc: "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Geert
 Uytterhoeven <geert+renesas@glider.be>, Prabhakar Mahadev Lad
 <prabhakar.mahadev-lad.rj@bp.renesas.com>, "biju.das.au"
 <biju.das.au@gmail.com>, "linux-renesas-soc@vger.kernel.org"
 <linux-renesas-soc@vger.kernel.org>
Subject: RE: [PATCH 3/3] irqchip/renesas-rzg2l: Add NMI support
In-Reply-To: <TY3PR01MB113462DB4547CBE03D94F93628653A@TY3PR01MB11346.jpnprd01.prod.outlook.com>
References: <20260328103324.134131-1-biju.das.jz@bp.renesas.com>
 <20260328103324.134131-4-biju.das.jz@bp.renesas.com> <87qzp07z5v.ffs@tglx>
 <TY3PR01MB113462DB4547CBE03D94F93628653A@TY3PR01MB11346.jpnprd01.prod.outlook.com>
Date: Tue, 31 Mar 2026 22:29:46 +0200
Message-ID: <87o6k391z9.ffs@tglx>
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
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_MISSING_CHARSET(0.50)[];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-30664-lists,linux-renesas-soc=lfdr.de];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	GREYLIST(0.00)[pass,body];
	RCVD_COUNT_THREE(0.00)[4];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	FREEMAIL_TO(0.00)[bp.renesas.com,gmail.com];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[kernel.org:+];
	NEURAL_HAM(-0.00)[-0.994];
	RCPT_COUNT_SEVEN(0.00)[7];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[tglx@kernel.org,linux-renesas-soc@vger.kernel.org];
	FREEMAIL_CC(0.00)[vger.kernel.org,glider.be,bp.renesas.com,gmail.com];
	TAGGED_RCPT(0.00)[linux-renesas-soc,renesas];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	MISSING_XM_UA(0.00)[];
	FROM_HAS_DN(0.00)[]
X-Rspamd-Queue-Id: 3FBA0371356
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Tue, Mar 31 2026 at 17:10, Biju Das wrote:
>> From: Thomas Gleixner <tglx@kernel.org>
> Will drop the lock as it is not RMW operation.

Huch?

> +static void rzg2l_clear_nmi_int(struct rzg2l_irqc_priv *priv, unsigned int hwirq)
> +{
> +	u32 bit = BIT(hwirq);
> +	u32 reg;
> +
> +	reg = readl_relaxed(priv->base + NSCR);
> +	if (reg & bit) {
> +		writel_relaxed(reg & ~bit, priv->base + NSCR);
> +		/*
> +		 * Enforce that the posted write is flushed to prevent that the
> +		 * just handled interrupt is raised again.
> +		 */
> +		readl_relaxed(priv->base + NSCR);
> +	}
> +}

How is that not RMW?

I assume that you want to explain that it's not a RMW on a shared
register, right?

Thanks,

        tglx

