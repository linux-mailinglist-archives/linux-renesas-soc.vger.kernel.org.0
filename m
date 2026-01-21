Return-Path: <linux-renesas-soc+bounces-27239-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id iMwqIck3cWnKfQAAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-27239-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 21 Jan 2026 21:32:09 +0100
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [213.196.21.55])
	by mail.lfdr.de (Postfix) with ESMTPS id 4A3155D484
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 21 Jan 2026 21:32:09 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id 8E9A272DB82
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 21 Jan 2026 19:01:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A539D364E81;
	Wed, 21 Jan 2026 19:00:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="nuMTEY+6"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 74EF01684BE;
	Wed, 21 Jan 2026 19:00:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769022028; cv=none; b=c2m+eixo60hYKbwbrkHKSIAtQKnARMgMFGZlpjNVI4dC7qm3s/kbnvX1uVJroEo+hrpvk2fINw3WWns7mwWFRc0tgcjRTjOLLSziQJaID2vynu9QqF69ykxJczP3KPStq2mPssXqYqSR4oB+OgWhPVM6PJiQzOL5DyZyIZy6d04=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769022028; c=relaxed/simple;
	bh=x/3j4fyrtJStNpcsn4FO4MbauQjE4z7GMicX4DhNUoU=;
	h=Content-Type:MIME-Version:In-Reply-To:References:Subject:From:Cc:
	 To:Date:Message-ID; b=rgILfAic545fWmUo8IZVjrSJguVaLE7R0QO3XCBd2yliKhCOHeWCe0F/JJ1nO6SmM5mtpPcZSNNnAzLETHoii2C4A6FTSTxmJaop4ACvl3lE0vkH1bMbimFgWh9h6tmYpYoebWIbnlVYc9j8p86YURTrrrCpaYvCuXw7oluGMRQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=nuMTEY+6; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E71A6C2BC87;
	Wed, 21 Jan 2026 19:00:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1769022028;
	bh=x/3j4fyrtJStNpcsn4FO4MbauQjE4z7GMicX4DhNUoU=;
	h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
	b=nuMTEY+6CxGeNBac8vujIw7/EkXAmaka51JpalYKNfYVmwvKzZ8ceepIelL5axjUG
	 3XFTytMWBfBl6oan8oCdvqn69gxaRUh328CifPbpZ2HSnDIe0uj28epchMKgvQ8g9Y
	 L5Z+dqGIcSl81SnWiyaT+OVU+WFnAeZ6nO/TGzh9aiAq5PT2QU/4VTLoaanTBkMiyh
	 XfXLwktn8lroqCh7nwUqRtl7AjlLs+tJPMfHCURRubLj6aR/f1fquLTpZs5NAbjI1Q
	 AMVH2EdHGJ328RVEeK/C1YSDMGuHCmiLua1GsdSnuS2YTer7yC5xsAeidZlOMJGAMH
	 WnsE8Z9k7PlxQ==
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <cover.1768559843.git.geert+renesas@glider.be>
References: <cover.1768559843.git.geert+renesas@glider.be>
Subject: Re: [GIT PULL] clk: renesas: Updates for v6.20 (take two)
From: Stephen Boyd <sboyd@kernel.org>
Cc: linux-clk@vger.kernel.org, linux-renesas-soc@vger.kernel.org, Geert Uytterhoeven <geert+renesas@glider.be>
To: Geert Uytterhoeven <geert+renesas@glider.be>, Michael Turquette <mturquette@baylibre.com>
Date: Wed, 21 Jan 2026 12:00:25 -0700
Message-ID: <176902202598.4027.13205657073014309824@lazor>
User-Agent: alot/0.11
X-Spamd-Result: default: False [0.04 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW_WITH_FAILURES(-0.50)[];
	MID_RHS_NOT_FQDN(0.50)[];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-27239-lists,linux-renesas-soc=lfdr.de];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[kernel.org:+];
	R_SPF_SOFTFAIL(0.00)[~all:c];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[sboyd@kernel.org,linux-renesas-soc@vger.kernel.org];
	DMARC_POLICY_ALLOW(0.00)[kernel.org,quarantine];
	TAGGED_RCPT(0.00)[linux-renesas-soc,renesas];
	ASN(0.00)[asn:7979, ipnet:213.196.21.0/24, country:US];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCPT_COUNT_FIVE(0.00)[5];
	DBL_BLOCKED_OPENRESOLVER(0.00)[ams.mirrors.kernel.org:rdns,ams.mirrors.kernel.org:helo]
X-Rspamd-Queue-Id: 4A3155D484
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Quoting Geert Uytterhoeven (2026-01-16 03:51:04)
>         Hi Mike, Stephen,
>=20
> The following changes since commit ebb3acf4d7c95b52265084168b59a565bf9728=
83:
>=20
>   clk: renesas: r9a09g056: Add clock and reset entries for TSU (2025-12-2=
9 11:43:22 +0100)
>=20
> are available in the Git repository at:
>=20
>   git://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-drivers.git=
 tags/renesas-clk-for-v6.20-tag2
>=20
> for you to fetch changes up to 4fef3fd633be4a1a18c490a63f4131284f6ee0f4:
>=20
>   clk: renesas: Add missing log message terminators (2026-01-16 10:48:33 =
+0100)
>=20
> ----------------------------------------------------------------

Thanks. Pulled into clk-next

