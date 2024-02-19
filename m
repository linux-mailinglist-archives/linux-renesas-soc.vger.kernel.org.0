Return-Path: <linux-renesas-soc+bounces-2976-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 44CCD85ABFF
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 19 Feb 2024 20:32:20 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 421D21C2146F
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 19 Feb 2024 19:32:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3D9A150A62;
	Mon, 19 Feb 2024 19:32:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Vxq8vN6U"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 147F350279;
	Mon, 19 Feb 2024 19:32:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1708371137; cv=none; b=lPMxpEBU3hF3kxBweNn4HSa0mucHzHHDWdrQsxoC/qHQ8FwhHrjqSNTT9EwOYdgzYU6z5hgQvnPgAmpwfH+SRe7H7YvJJgCjdClzm3PzK8QXiT+D21y5J3qpCDVDTfPDIKODeT27h64r0w+OVPimoZ3iDdlXtbSPu3Ly227TOt4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1708371137; c=relaxed/simple;
	bh=p5RAo5hI4iSESPcSw5RCQ97Q1AuDHzDzhuP4WoK07Gk=;
	h=Message-ID:Content-Type:MIME-Version:In-Reply-To:References:
	 Subject:From:Cc:To:Date; b=buOykyTTkJXLiqN5xyJNXI2Soo6+sCyXfoCNE4AVVhv4UdBFP0XwMOvCvSAUC8bcw7NOcQZDevZDhkuoFsSMxy7aQ7Jsb4I5LkEvXiNMrMCpR47zRnX4GqL8Kb/wibsvsn6mm0zqcVYKF8mtwuQrjsqSX/MW1mIEhUNubrXHJfc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Vxq8vN6U; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C8B7BC433C7;
	Mon, 19 Feb 2024 19:32:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1708371136;
	bh=p5RAo5hI4iSESPcSw5RCQ97Q1AuDHzDzhuP4WoK07Gk=;
	h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
	b=Vxq8vN6UJJAKGeRgcwOL82VEsKlRAIKA5vKEgB+DQIQu5HMTcJMIdsIctLRPo3A3c
	 oKEIR9ma3IAIIbdsHYvbWVpqeIVQQB+mj2E6JUO7S1qkbYC/aV6oBnMKt2T4Z9Ep1Y
	 nyAmDX+WCYlXtgS3JghyCnYf0D4T7CKpvOQiKbRuqNoIP/DnBtp7yIil4yTGpv6b3G
	 4vrwJ5zpLzPEnL3TzCtzeattjUZ9MQFLbeB/K842597KeH3R1rutL7g3uCiVgWWzcw
	 O1y2XhVKcJCzgG0dsXAjk1tLDEfpZ/NrUI2ZzG1/qpeLnVSvgFh+wzHduhIxcNGcfJ
	 PBks0egGihOQA==
Message-ID: <029d5ce38c0b2af992ce223430d0f7a6.sboyd@kernel.org>
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <cover.1707496335.git.geert+renesas@glider.be>
References: <cover.1707496335.git.geert+renesas@glider.be>
Subject: Re: [GIT PULL] clk: renesas: Updates for v6.9
From: Stephen Boyd <sboyd@kernel.org>
Cc: linux-clk@vger.kernel.org, linux-renesas-soc@vger.kernel.org, Geert Uytterhoeven <geert+renesas@glider.be>
To: Geert Uytterhoeven <geert+renesas@glider.be>, Michael Turquette <mturquette@baylibre.com>
Date: Mon, 19 Feb 2024 11:32:14 -0800
User-Agent: alot/0.10

Quoting Geert Uytterhoeven (2024-02-09 08:55:15)
>         Hi Mike, Stephen,
>=20
> The following changes since commit 6613476e225e090cc9aad49be7fa504e290dd3=
3d:
>=20
>   Linux 6.8-rc1 (2024-01-21 14:11:32 -0800)
>=20
> are available in the Git repository at:
>=20
>   git://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-drivers.git=
 tags/renesas-clk-for-v6.9-tag1
>=20
> for you to fetch changes up to 5aaa139b9a03e1a43484a73248c6353a9c4d95c6:
>=20
>   clk: renesas: r8a779h0: Add I2C clocks (2024-02-06 11:20:12 +0100)
>=20
> ----------------------------------------------------------------

Thanks. Pulled into clk-next

