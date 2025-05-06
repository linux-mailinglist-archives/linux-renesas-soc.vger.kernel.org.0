Return-Path: <linux-renesas-soc+bounces-16730-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 709ECAAD05A
	for <lists+linux-renesas-soc@lfdr.de>; Tue,  6 May 2025 23:54:34 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id E6A4517DAE0
	for <lists+linux-renesas-soc@lfdr.de>; Tue,  6 May 2025 21:52:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2829C21FF2B;
	Tue,  6 May 2025 21:46:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Zh+ixwUK"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F05CF218EBA;
	Tue,  6 May 2025 21:46:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746567984; cv=none; b=JaDA0q1rvnFM0GA2umRsr/BjmCHHzUGpP/BKOc14G8n7Eq5IaiFiT6QgAAtbktYmiSSMj8EXNSLiJcf4TJVzj+Fw9+VX7u3VPvwernOSOel+k9RPpJHRf5ojOqH5lEcaNpj1T0iPkpF8XM6lQOTtHlDZOd7RItBy/lKVD3Se5ak=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746567984; c=relaxed/simple;
	bh=JZh7JIEyKmTg+cEAsy+X0FVY+ZyMKG8wVppUWPDa3C4=;
	h=Message-ID:Content-Type:MIME-Version:In-Reply-To:References:
	 Subject:From:Cc:To:Date; b=YPq6A95022iOa7lwWFE+96OKsNDtrHsYVMR8dZXHleoDGOFI0YiDFzT4hMcvEwt9fWoOatoG5sG7uYQIZOu+ooRYaHEyEZgdM+PsivyqB7Se0JL65/Q1/cY/j8wIDtBfiMr09N9mfcveCg1o9AHHGtAsHqK+2nPZFhj6Dfix4gU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Zh+ixwUK; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4FB5DC4CEE4;
	Tue,  6 May 2025 21:46:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1746567983;
	bh=JZh7JIEyKmTg+cEAsy+X0FVY+ZyMKG8wVppUWPDa3C4=;
	h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
	b=Zh+ixwUKfi6nE3HEW31XI/t2UiCX1BYmQ5cq+G/KZnZZHCSfSimyJZ7d1Y5KL6yIw
	 HKo8TJeQjttHB/NB9TJXvlbfIqSBiV1y3wZ/TOc1KQRf4ZD3VTd2JSYwuAmGUYiZe2
	 xETlYZzfZsAAj+WRXWez/gwS54ELLCiZwbgedDDbpNd9NuvtdS8IxCIBHMJjcUc9+f
	 TDMstJlS44Gvi3Mk+JcAqODFKLmvpsoiUfAfZHZhIt3hDTwKpICZAoqQKotkVk3luk
	 t+u5R/ghj7C02p/FLe6GLLZFxepPqnKPAjGL/AKMqgxKFiydRvSiUU33ibaI16XO0m
	 qjOGONxMgc7YQ==
Message-ID: <f91801c93328d358e261089a117d8afe@kernel.org>
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20250410062040.6346-1-biju.das.jz@bp.renesas.com>
References: <20250410062040.6346-1-biju.das.jz@bp.renesas.com>
Subject: Re: [PATCH v3] clk: davinci: Use of_get_available_child_by_name()
From: Stephen Boyd <sboyd@kernel.org>
Cc: Biju Das <biju.das.jz@bp.renesas.com>, linux-clk@vger.kernel.org, Geert Uytterhoeven <geert+renesas@glider.be>, Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>, Biju Das <biju.das.au@gmail.com>, linux-renesas-soc@vger.kernel.org
To: Biju Das <biju.das.jz@bp.renesas.com>, David Lechner <david@lechnology.com>, Michael Turquette <mturquette@baylibre.com>
Date: Tue, 06 May 2025 14:46:21 -0700
User-Agent: alot/0.12.dev8+g17a99a841c4b

Quoting Biju Das (2025-04-09 23:20:38)
> Simplify of_davinci_pll_init() by using of_get_available_child_by_name().
>=20
> While at it, move of_node_put(child) inside the if block to avoid
> additional check if of_child is NULL.
>=20
> Reviewed-by: David Lechner <david@lechnology.com>
> Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
> ---

Applied to clk-next

