Return-Path: <linux-renesas-soc+bounces-14043-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 8C026A53E48
	for <lists+linux-renesas-soc@lfdr.de>; Thu,  6 Mar 2025 00:16:57 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 938451885666
	for <lists+linux-renesas-soc@lfdr.de>; Wed,  5 Mar 2025 23:17:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 55C3B1A5BB2;
	Wed,  5 Mar 2025 23:16:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="fj7/s2I+"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2CE4C1E505;
	Wed,  5 Mar 2025 23:16:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741216613; cv=none; b=DCrASeiqSRqGehjjodYmWVqJfDIcqd9X0Pba8QqbbnXVVxhcLWbbGH1AZaoiPctaFBUXj9FWcMhIr2JoQ+7HCNnz44eZNl6ewH8CZ9yvYxrV4dhyXCitzGYRMTTbsd3+u115oJ4KoMGB7zQRKjdsWR4KMZqNfbI+Qc+t1X/qhN4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741216613; c=relaxed/simple;
	bh=cG6vsCG90EAJSPt/F9Elqf8boQ0oADDov+5AMiRq8mg=;
	h=Message-ID:Content-Type:MIME-Version:In-Reply-To:References:
	 Subject:From:Cc:To:Date; b=oTZNphzmijVVDQM2zDM+cxUjvPsCwi1OH2tTZ0PMy/+2vF/0gqZb8mm6cpZ+ec6h3TiURK9OvCWsrx/YmhgAxhSJi+WkdOG76WItU4Uh1453GXPZ8DwBYWxZkkcN4ZmLhhA/Mk+ya5ASGWd8+/y/k2BcSbxzzjD0a4kJfkMoFLk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=fj7/s2I+; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7D9B8C4CED1;
	Wed,  5 Mar 2025 23:16:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1741216612;
	bh=cG6vsCG90EAJSPt/F9Elqf8boQ0oADDov+5AMiRq8mg=;
	h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
	b=fj7/s2I+HFigCsO8p61/LvB+vTSGJM9IPBoKYdEJ+r8ShBGfPegISSpwkFX80flxW
	 t84Zpc16NZLkez2wPK2LgMpc6t/ydDpt1AllkJrdBuESbsvuMml0EsZDOgBZUXRZvS
	 KBc8Yu8qFJZyLDCtXYajtG8V7I4T83mpp8UBUP0EhhuZRf2GkEO+k3f2OohlPM1oAb
	 cQGVe2g/Sr+KvDIEDJb+WVz75fF9ZAigYpoPVT368Dg+pWopic2sOlH/k5BPS5PJ3o
	 lufhgTyxKbgW0XB9GccyZTW/6q/mu+f0mvf1hc6OY4hFAvMqtJbfHl34O7K+ujX4P1
	 cb8aMQ5nVJL/Q==
Message-ID: <1347ee4d678ce81c33917b3802601aee.sboyd@kernel.org>
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20250303110433.76576-2-biju.das.jz@bp.renesas.com>
References: <20250303110433.76576-1-biju.das.jz@bp.renesas.com> <20250303110433.76576-2-biju.das.jz@bp.renesas.com>
Subject: Re: [PATCH 1/4] clk: renesas: rzv2h-cpg: Add support for coupled clock
From: Stephen Boyd <sboyd@kernel.org>
Cc: Biju Das <biju.das.jz@bp.renesas.com>, linux-renesas-soc@vger.kernel.org, linux-clk@vger.kernel.org, Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>, Biju Das <biju.das.au@gmail.com>
To: Biju Das <biju.das.jz@bp.renesas.com>, Geert Uytterhoeven <geert+renesas@glider.be>, Michael Turquette <mturquette@baylibre.com>
Date: Wed, 05 Mar 2025 15:16:46 -0800
User-Agent: alot/0.12.dev1+gaa8c22fdeedb

Quoting Biju Das (2025-03-03 03:04:19)
> The spi and spix2 clk share same bit for clock gating. Add support
> for coupled clock with checking the monitor bit for both the clocks.

Could you add an intermediate parent clk of both spi and spix2 that only
handles the enable bit for clock gating? Then the enable count handling
would be in the core clk code.

