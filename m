Return-Path: <linux-renesas-soc+bounces-33773-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id c7gCNO89KGp2AwMAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-33773-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 09 Jun 2026 18:23:11 +0200
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 259746624F9
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 09 Jun 2026 18:23:11 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=kernel.org header.s=k20260515 header.b=XKM5QbrT;
	spf=pass (mail.lfdr.de: domain of "linux-renesas-soc+bounces-33773-lists+linux-renesas-soc=lfdr.de@vger.kernel.org" designates 2600:3c0a:e001:db::12fc:5321 as permitted sender) smtp.mailfrom="linux-renesas-soc+bounces-33773-lists+linux-renesas-soc=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=quarantine) header.from=kernel.org;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 1AC573108F29
	for <lists+linux-renesas-soc@lfdr.de>; Tue,  9 Jun 2026 16:04:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 99BA2370AC0;
	Tue,  9 Jun 2026 16:04:26 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7AB2236D9F8;
	Tue,  9 Jun 2026 16:04:25 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781021066; cv=none; b=T67XUSFijX9ymPgJDMxQSEhuFR9hEX63TObBec9VhMSReilfkWFoSPA+qpgXEm8QKU3PZhhPbkL+Rw6w6xxohVgETL7+rkrNt2G+O6qpBftl266Eh6aeehQyEv5I09CFDjoNs2wyMPMf2fTSgsjkz6HOmSrjaSZ4/Fm+YHxbEAo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781021066; c=relaxed/simple;
	bh=9hLgtZ8NgBCHZ/yN8NFc6Qpxzdb/6VAOYIWGQIOE4ic=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ULASgnowDzDJsyq/gzXg6kyMlM/t5AHCaaZvNDtRgvyEXoG/UdWLYsAUKWvD30Ju4ej49I9T9WshB/Xr+H1XtcRFNli8pjmrLPDQXfhqgSdLl2s66ta4u+Gmh29fbt1lcs56nti27MCxEBaYHpe8QvhSnAeabzgT7n/7qhj9XCs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=XKM5QbrT; arc=none smtp.client-ip=100.103.45.18
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 25D431F00898;
	Tue,  9 Jun 2026 16:04:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1781021065;
	bh=rWNQsrFYpu/vCUAn3QHBEywCdhhRWN4mBS4hafW3zac=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=XKM5QbrTSEqzV9W8nx8Huka91MA4LxWNRh2NNEsEtDrLWvAnCt5zd8gtpfC+/EWFJ
	 5xpw+cefdi14hTplC0AJhzZs9Nq675hInP4aiBugYESzkDh8fIBuKwaHvQCAQB77qE
	 mOMTlPXSpNlfhYcaaW/A8utugTniC7wmuAKwJcxNYtnwAm2iHDGFWCakW07Nmx4kPm
	 nCFXrmTw/Yaasb+4/Qg1McSTx+xY486ix6+Iow+uc1tXjdbXX8T5bRX3wojy4OCS16
	 +ZqMIVA5Fe2tXvUoAcwEWMnuUVd6AeETdUmqIVZ9lf/iyfZ9ki+WqFxYqULTdvxgv/
	 J8Aq2YU8fqsOQ==
Date: Tue, 9 Jun 2026 18:04:21 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: phucduc.bui@gmail.com
Cc: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>, 
	Mark Brown <broonie@kernel.org>, Geert Uytterhoeven <geert+renesas@glider.be>, 
	Liam Girdwood <lgirdwood@gmail.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Magnus Damm <magnus.damm@gmail.com>, Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, 
	linux-sound@vger.kernel.org, linux-renesas-soc@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v6 01/11] ASoC: dt-bindings: renesas,fsi: add support
 multiple clocks
Message-ID: <20260609-eager-nightingale-of-devotion-b6ca1f@quoll>
References: <20260609113836.45079-1-phucduc.bui@gmail.com>
 <20260609113836.45079-2-phucduc.bui@gmail.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260609113836.45079-2-phucduc.bui@gmail.com>
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-3.16 / 15.00];
	WHITELIST_SPF_DKIM(-3.00)[kernel.org:d:+,kernel.org:s:+];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20260515];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:phucduc.bui@gmail.com,m:kuninori.morimoto.gx@renesas.com,m:broonie@kernel.org,m:geert+renesas@glider.be,m:lgirdwood@gmail.com,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:magnus.damm@gmail.com,m:perex@perex.cz,m:tiwai@suse.com,m:linux-sound@vger.kernel.org,m:linux-renesas-soc@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:phucducbui@gmail.com,m:geert@glider.be,m:krzk@kernel.org,m:conor@kernel.org,m:magnusdamm@gmail.com,s:lists@lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[15];
	FREEMAIL_TO(0.00)[gmail.com];
	FORGED_SENDER(0.00)[krzk@kernel.org,linux-renesas-soc@vger.kernel.org];
	TAGGED_FROM(0.00)[bounces-33773-lists,linux-renesas-soc=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[krzk@kernel.org,linux-renesas-soc@vger.kernel.org];
	PRECEDENCE_BULK(0.00)[];
	FREEMAIL_CC(0.00)[renesas.com,kernel.org,glider.be,gmail.com,perex.cz,suse.com,vger.kernel.org];
	TAGGED_RCPT(0.00)[linux-renesas-soc,renesas,dt];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	DKIM_TRACE(0.00)[kernel.org:+];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:email,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,vger.kernel.org:from_smtp]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 259746624F9

On Tue, Jun 09, 2026 at 06:38:26PM +0700, phucduc.bui@gmail.com wrote:
> From: bui duc phuc <phucduc.bui@gmail.com>
> 
> The FSI on r8a7740 requires the SPU bus/bridge clock to be enabled before
> accessing its registers. Without this clock, any register access leads to
> a system hang as the FSI block sits behind the SPU bus.
> Update the binding to support multiple clocks to properly describe the
> hardware clock tree, including:
>   - SPU bus/bridge clock (spu) for register access.
>   - CPG DIV6 clocks (icka/b) as functional clock.
>   - FSI dividers (diva/b) for audio clock generation.
>   - External clock inputs (xcka/b) provided by the board.
> The hardware supports several valid clock configurations. For example,
> when both FSIA and FSIB operate as slaves, only the fck and spu clocks
> are required. When a port operates as a master, it can use either an
> internal clock source (ickx + divx) or an external clock source
> (ickx + xckx). Therefore, while fck and spu are mandatory on r8a7740,
> the remaining clocks (icka/b, diva/b and xcka/b) are optional and depend
> on the selected master/slave configuration and clock source.
> Both sh73a0 and r8a7740 define the SPU DIV6 clock control register at
> 0xe6150084. The binding therefore documents the clocks supported by the
> FSI driver for these variants.
> 
> Signed-off-by: bui duc phuc <phucduc.bui@gmail.com>
> ---
> 
> Changes in v6:
>  - DT binding updates (drop uniqueItems, commit message) based on 
>    Krzysztof's feedback.
> Changes in v4:
>  - Update dt-bindings based on feedback from Krzysztof, Rob, and Geert.

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>

Best regards,
Krzysztof


