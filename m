Return-Path: <linux-renesas-soc+bounces-27789-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id UAWmNmJngWl5GAMAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-27789-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 03 Feb 2026 04:11:30 +0100
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 32F8ED3FE0
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 03 Feb 2026 04:11:30 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id C76D1301691B
	for <lists+linux-renesas-soc@lfdr.de>; Tue,  3 Feb 2026 03:11:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 58F4B217659;
	Tue,  3 Feb 2026 03:11:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Jz/irr4k"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3375F1F0995;
	Tue,  3 Feb 2026 03:11:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770088283; cv=none; b=rHz7uACn355/OeEIrXxmTWyWHy1qKwEJ/JNBBHDl3T+VCchng+5Pc2E2MLG8swXsHr8BDWcgb1VumOzFn9GaNoj7zOWxK7yaGipV2QoGmZE/UVFydPdWyKU+Go7cqXPwvLKf/p18rBC/LLXrylb9b4jLXo9+FYYCkGk8iLREz4o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770088283; c=relaxed/simple;
	bh=E1Kr5dxFfKLFi4l3I9Au9CGOz+lmGOipCc4fAAAyUNU=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=IiextSnY9QG5n3KX7G9pW7SqCKJv7ThY9kc88h84KGNVzWqB0NfaIURH66xTFyFPh99phtoHOrlCSfbcl4K2Am+SQxBnYUkzxYNsqLojgGMRIvB+DI3sII6OIhLE/ARu0Uv+zdV+Fa62xnt7iu8FxoGzDcqyi50VcnSjOeJMXGg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Jz/irr4k; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1B910C116C6;
	Tue,  3 Feb 2026 03:11:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1770088282;
	bh=E1Kr5dxFfKLFi4l3I9Au9CGOz+lmGOipCc4fAAAyUNU=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=Jz/irr4km3Bt2oEYy2O6RCRALfxAVdib0Qngvy+TC/fK+Ke5f8DwX45sESTdxztqh
	 cpkas3ZCHMXGzC+meXIJtHWm8AX2+biX72vYMoPnON1V4P3arohVja1k2YKYSP/sbL
	 FFyxqJtj4wu5nbBzhjqzHuaA5WjMHqwbzi+dPGvbU1BmNsyl+VW0MgXI3Bj1CtMK+p
	 lrRhX5hhD2S2G/YD/lS1xrdqlEzaHzfoqBQPPckqhqK3L8c6YSDziCIyJlxLlN+6a7
	 VIpSFzWuXqWtGwDU6crUFcPukZ4juetQ1PnJtnPFpjsOJp+bHgmHCU7fnKaKVq4Rho
	 eeXGHJD5EIQuw==
Date: Mon, 2 Feb 2026 19:11:21 -0800
From: Jakub Kicinski <kuba@kernel.org>
To: Niklas =?UTF-8?B?U8O2ZGVybHVuZA==?=
 <niklas.soderlund+renesas@ragnatech.se>
Cc: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>, Andrew Lunn
 <andrew+netdev@lunn.ch>, "David S. Miller" <davem@davemloft.net>, Eric
 Dumazet <edumazet@google.com>, Paolo Abeni <pabeni@redhat.com>, Geert
 Uytterhoeven <geert+renesas@glider.be>, Magnus Damm
 <magnus.damm@gmail.com>, Richard Cochran <richardcochran@gmail.com>,
 netdev@vger.kernel.org, linux-renesas-soc@vger.kernel.org
Subject: Re: [net-next 4/4] net: ethernet: renesas: rcar_gen4_ptp: Hide
 private data from users
Message-ID: <20260202191121.71326ca2@kernel.org>
In-Reply-To: <20260201183745.1075399-5-niklas.soderlund+renesas@ragnatech.se>
References: <20260201183745.1075399-1-niklas.soderlund+renesas@ragnatech.se>
	<20260201183745.1075399-5-niklas.soderlund+renesas@ragnatech.se>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[renesas.com,lunn.ch,davemloft.net,google.com,redhat.com,glider.be,gmail.com,vger.kernel.org];
	TAGGED_FROM(0.00)[bounces-27789-lists,linux-renesas-soc=lfdr.de];
	FROM_HAS_DN(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[kernel.org:+];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	MISSING_XM_UA(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[kuba@kernel.org,linux-renesas-soc@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linux-renesas-soc,renesas,netdev];
	RCPT_COUNT_SEVEN(0.00)[11];
	TO_DN_SOME(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 32F8ED3FE0
X-Rspamd-Action: no action

On Sun,  1 Feb 2026 19:37:45 +0100 Niklas S=C3=B6derlund wrote:
> The Gen4 PTP helper module is already used by RTSN and RSWITCH to
> support PTP clocks and will be used by RAVB too. Hide the Gen4 PTP
> private data structure to make sure none of the users poke at it.
>=20
> This will be more important for RAVB use-cases as more then one RAVB
> device will need to cooperate using one PTP clock source.

IMO hiding type definitions in C is an anti-pattern.
Sooner or later you'll need a sizeof or a static inline helper=20
and you'll have to bend over backwards to access the type info.

We can take this if you have a strong preference, but please
think again if you really need this or it's a code cleanliness
instinct carried over from objective programming, hence foreign..

