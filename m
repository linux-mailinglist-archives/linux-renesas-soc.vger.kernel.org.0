Return-Path: <linux-renesas-soc+bounces-27786-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 0D3qFvVCgWl6FAMAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-27786-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 03 Feb 2026 01:36:05 +0100
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id 07523D309B
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 03 Feb 2026 01:36:04 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 7C1323003821
	for <lists+linux-renesas-soc@lfdr.de>; Tue,  3 Feb 2026 00:36:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AF40C1E5724;
	Tue,  3 Feb 2026 00:36:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="UnpiOK76"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8C54B1DA60F;
	Tue,  3 Feb 2026 00:36:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770078963; cv=none; b=hJSIQDpKI0CWzeTPBu1yhD8gm2xIO3S77TU/IkcaAB8WQ8xbVE4AaeI3+/FaSqM0c5N1A1nywX4MM11rOiwpUVII5NY4AoIWM0wp8Hm8+mdmxfJskSCfObbyArNkzXhn1LCNn4T5csBGusZWosS5Q9v+bSqHaVqhoCjYMrWfssM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770078963; c=relaxed/simple;
	bh=YH66jlqWTucD3o6rfLRNTV13L9DZ1S7HHrBe4+EeVYc=;
	h=Content-Type:MIME-Version:In-Reply-To:References:Subject:From:Cc:
	 To:Date:Message-ID; b=QXzJqCiak49zVjT+MtIZBlXPkUAnHBrJwIOVbvBfDvbo3I08MqHVncjrOubDAWZH/BQRTm5n4kQbV3H/TgFnZZRk/ujjqtbDi9veip8L8An2PuTDBXu22FwW081dtL84Q8dkUyjg/S9BDi4+eMCFSs4K5betbL6fjnwJ8lCaSPk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=UnpiOK76; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2395DC116C6;
	Tue,  3 Feb 2026 00:36:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1770078963;
	bh=YH66jlqWTucD3o6rfLRNTV13L9DZ1S7HHrBe4+EeVYc=;
	h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
	b=UnpiOK76NopNZOT/SPFmWNq6Q39cN4l4hQ1E89roSGOkV4/7/ANVScfaTLDwLeSiT
	 gY0yapY/6M9+hQQ/jVgIe4zUdnmJT9coiM5DsIKXPhhTl8AU6b+3gsDgZ7jg4lXRMA
	 IVE3hRhBs0rd0ca9Pt4APCMG5O/Lm4A8UeIVFIy6A3Xw8zlueeL8HkqWOKxTJUZe15
	 bnbOq12S3dPc9RU1tTppp4qMKhWoADGfk6+3SSjhIOUCHCcx0Zt/Jfg5KvgIZQ3rY0
	 /v0jmSNcq6o8uVuBeZWAoGRmWiAYHSTG2mB1BsHtg6rD7cD+5kNsXMOt/AtbqcKE+B
	 FsKbbvynxvMCQ==
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <15f24d006fc782d501922d6c88e836976d69c7cb.1768993373.git.geert+renesas@glider.be>
References: <15f24d006fc782d501922d6c88e836976d69c7cb.1768993373.git.geert+renesas@glider.be>
Subject: Re: [PATCH resend] clk: rs9: Convert to DEFINE_SIMPLE_DEV_PM_OPS()
From: Stephen Boyd <sboyd@kernel.org>
Cc: linux-clk@vger.kernel.org, linux-renesas-soc@vger.kernel.org, linux-kernel@vger.kernel.org, Geert Uytterhoeven <geert+renesas@glider.be>
To: Geert Uytterhoeven <geert+renesas@glider.be>, Marek Vasut <marex@denx.de>, Michael Turquette <mturquette@baylibre.com>
Date: Mon, 02 Feb 2026 17:36:00 -0700
Message-ID: <177007896097.4027.11771913420394908681@lazor>
User-Agent: alot/0.11
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.16 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-27786-lists,linux-renesas-soc=lfdr.de];
	RCVD_COUNT_THREE(0.00)[4];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[sboyd@kernel.org,linux-renesas-soc@vger.kernel.org];
	DKIM_TRACE(0.00)[kernel.org:+];
	RCPT_COUNT_SEVEN(0.00)[7];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-renesas-soc,renesas];
	TO_DN_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns,glider.be:email]
X-Rspamd-Queue-Id: 07523D309B
X-Rspamd-Action: no action

Quoting Geert Uytterhoeven (2026-01-21 04:03:11)
> Convert the Renesas 9-series PCIe clock generator driver from
> SIMPLE_DEV_PM_OPS() to DEFINE_SIMPLE_DEV_PM_OPS() and pm_sleep_ptr().
> This lets us drop the __maybe_unused annotations from its suspend and
> resume callbacks, and reduces kernel size in case CONFIG_PM or
> CONFIG_PM_SLEEP is disabled.
>=20
> Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
> ---

Applied to clk-next

