Return-Path: <linux-renesas-soc+bounces-11204-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 3D18B9EBE9E
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 10 Dec 2024 23:56:07 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id E155216085F
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 10 Dec 2024 22:56:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B6B5A23F9F1;
	Tue, 10 Dec 2024 22:52:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="GQKAkUUc"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 843C823F9EB;
	Tue, 10 Dec 2024 22:52:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733871142; cv=none; b=VY00n74HJA9FzFLrr0lN89xmvg58GATJO6LTANw86yYmxaGx2tH7HZkUEb8mkReI65Rmcue6RO5dwJcypRHLLsN6KCQgfgbJNgXQyYs8u4T1isWfiublNvjbU5KM9I2zpDzez7494ns4jd9IGW+sYI3ZALt9jIo8qE9QTjK9BlE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733871142; c=relaxed/simple;
	bh=LssiNIj8oGW6nd7zlyMfCYyCX8QpiqI63Pa2tgrjihE=;
	h=Message-ID:Content-Type:MIME-Version:In-Reply-To:References:
	 Subject:From:Cc:To:Date; b=MkdHZ0JrDRGx3CM+5dyvp1CnR2VLkkLa25Ri74zquR3bl9mSyAZbtzWKL8ppFhb31JZH92Qdeti2XhX/X58zgOrHfa0mreMShLpaM2BLJ6T30d5oW5hLiONRz7QbFvZRPyXGM4MtqsvmyeQB7kA5cnRS73SzFLhHgICY8Gnk0Ik=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=GQKAkUUc; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 19637C4CED6;
	Tue, 10 Dec 2024 22:52:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1733871142;
	bh=LssiNIj8oGW6nd7zlyMfCYyCX8QpiqI63Pa2tgrjihE=;
	h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
	b=GQKAkUUcVf8Xq587TPnxbWz52ZlCgNv2GpEOSLzw4jnMQd52SdKI16QYvsS9VE9gN
	 w/SWlMQ5ikPYdXw1CVNkJ1Yl3aGTu5G+b5XbMlZnwZJH3PyogpwRl/Ouyl1z/ThSYW
	 DoTLxVtBAsl4nhDZPzYdC2Ps5zatUftUJF4gwZUWs/Au0XB8oWACf3SOoYT/heH/gR
	 zU+zEj63ppXxxyNuBR2JQqRjPEjLjrlkkkKTpmfCfqRgONjy1Zb9rHUjuUf1wtGvBk
	 P+MmF07VeGToYtl1EwJ8kjb1gprJHmO8Ug4XEUDQNVowA+hX69z9EbFPq0XoGKUsa5
	 I752WE0y6rezA==
Message-ID: <4b11a074b63c582981454d8d9d64ac0f.sboyd@kernel.org>
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20241210170953.2936724-4-claudiu.beznea.uj@bp.renesas.com>
References: <20241210170953.2936724-1-claudiu.beznea.uj@bp.renesas.com> <20241210170953.2936724-4-claudiu.beznea.uj@bp.renesas.com>
Subject: Re: [PATCH v4 03/24] clk: versaclock3: Add support for the 5L35023 variant
From: Stephen Boyd <sboyd@kernel.org>
Cc: claudiu.beznea@tuxon.dev, linux-renesas-soc@vger.kernel.org, linux-clk@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, alsa-devel@alsa-project.org, Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
To: Claudiu <claudiu.beznea@tuxon.dev>, biju.das.jz@bp.renesas.com, broonie@kernel.org, geert+renesas@glider.be, lgirdwood@gmail.com, magnus.damm@gmail.com, mturquette@baylibre.com, p.zabel@pengutronix.de, perex@perex.cz, robh+dt@kernel.org, tiwai@suse.com
Date: Tue, 10 Dec 2024 14:52:20 -0800
User-Agent: alot/0.12.dev1+gaa8c22fdeedb

Quoting Claudiu (2024-12-10 09:09:32)
> From: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
>=20
> Add support for the 5L35023 variant of the Versa 3 clock generator.
>=20
> Reviewed-by: Biju Das <biju.das.jz@bp.renesas.com>
> Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
> Signed-off-by: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
> ---

Applied to clk-next

