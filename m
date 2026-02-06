Return-Path: <linux-renesas-soc+bounces-27996-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id b9FXO6jShWklHAQAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-27996-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 06 Feb 2026 12:38:16 +0100
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 62274FD505
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 06 Feb 2026 12:38:16 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id EF7743016EC4
	for <lists+linux-renesas-soc@lfdr.de>; Fri,  6 Feb 2026 11:37:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 709CE361DC1;
	Fri,  6 Feb 2026 11:37:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="luMJ1rXK"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4DEA12EA732;
	Fri,  6 Feb 2026 11:37:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770377874; cv=none; b=ZdC2tlMnANiZ4iwyF/suepZvJw+biMhwMoCciGG3wZecaT4bZB8oTR6DMC7WmIE5Dnw0/vUNAMjcrhWGmcPzWMt7SyC3HO09B1zqTYoQ9ebuMOiLZyVRREfRiB3X9fKZSpgpbB6N9lWFHQG5g5NKk1qkrMamypRP2kZsNcNBK+M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770377874; c=relaxed/simple;
	bh=mX5w8lugLrf2LBWCQUJ6TbtGkFRbF7AGqyR5uQcf2Os=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=SuUNKR0FYCF0y8/xlPfT81KrUMv13gUtWbuzu2O7XR49JQoFSN9aZWveqRpvsTcapaJPOAuSf0jrMZfvC9HDuY+eiTCSwlTomW+zPEFXYi2O7NYfoVIw/FztetFwqsDJQWij+7z+GD2ZaazAPq6w3U97UOMEaAfUke61EgU6yUg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=luMJ1rXK; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F2A46C116C6;
	Fri,  6 Feb 2026 11:37:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1770377873;
	bh=mX5w8lugLrf2LBWCQUJ6TbtGkFRbF7AGqyR5uQcf2Os=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=luMJ1rXKJiatk74DJ2W62M9bSLGVAOEVnu4eAoBrf2D7gGa08CgE3Lm4brffeR8oe
	 lM7Oe4sGBESzyVpSLOcnZ6DQ5F/VS2rGSDBv50K3nU9bm9i5ey7+8YYAmJm1qtS16G
	 n273Lr1EFx91+wFyvxdpzXlvl0467tpbYNxuxZdHwlDkP0hhfzHjiJ+NfVF0R7767n
	 dinYy3SDiN9VgZBNjidQHCHNE+taPICtIOrj6Gax5tjpVvPMWUNemKwlWoSyorKvqy
	 vwHFoyycronKEjsMhvcwEMQhuXXXKA7FwaAQlIrkH7GWA4AonW+292hjlHk6N9n5bb
	 E5s3Ece7eUvIw==
From: Thomas Gleixner <tglx@kernel.org>
To: Biju <biju.das.au@gmail.com>, Rob Herring <robh@kernel.org>, Krzysztof
 Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Geert
 Uytterhoeven <geert+renesas@glider.be>, Magnus Damm
 <magnus.damm@gmail.com>
Cc: Biju Das <biju.das.jz@bp.renesas.com>, Lad Prabhakar
 <prabhakar.mahadev-lad.rj@bp.renesas.com>, linux-kernel@vger.kernel.org,
 devicetree@vger.kernel.org, linux-renesas-soc@vger.kernel.org, Biju Das
 <biju.das.au@gmail.com>
Subject: Re: [PATCH v3 0/9] Add RZ/G3L IRQC support
In-Reply-To: <20260206111658.231934-1-biju.das.jz@bp.renesas.com>
References: <20260206111658.231934-1-biju.das.jz@bp.renesas.com>
Date: Fri, 06 Feb 2026 12:37:49 +0100
Message-ID: <87ecmy14s2.ffs@tglx>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [2.84 / 15.00];
	MID_END_EQ_FROM_USER_PART(4.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[bp.renesas.com,vger.kernel.org,gmail.com];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-27996-lists,linux-renesas-soc=lfdr.de];
	RCVD_COUNT_THREE(0.00)[4];
	RCPT_COUNT_TWELVE(0.00)[12];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_TO(0.00)[gmail.com,kernel.org,glider.be];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[tglx@kernel.org,linux-renesas-soc@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[kernel.org:+];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-renesas-soc,dt,renesas];
	TO_DN_SOME(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,renesas.com:email]
X-Rspamd-Queue-Id: 62274FD505
X-Rspamd-Action: no action

On Fri, Feb 06 2026 at 11:16, Biju wrote:
> From: Biju Das <biju.das.jz@bp.renesas.com>
>
> The IRQC block on RZ/G3L SoC is almost identical to one found on the
> RZ/G3S SoC with the difference like it support more External IRQs, GPT
> Error Interrupts and also has additional registers for GPT/MTU IRQ
> selection, shared IRQ selection between external IRQ and TINT.
>
> It has 16 external interrupts of which 8 interrupts are shared with
> TINT[24:31] and are mutually exclusive. The external IRQ/TINT IRQ
> selection is based on a register in the ICU block.

Can you please give people the time to actually look at your patches
before you repost the full series every other day?

