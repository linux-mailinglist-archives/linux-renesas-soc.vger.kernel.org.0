Return-Path: <linux-renesas-soc+bounces-13747-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 74BDFA46EAA
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 26 Feb 2025 23:39:14 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 2B9A11888E5A
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 26 Feb 2025 22:39:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6CF3E25D1E9;
	Wed, 26 Feb 2025 22:39:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="NV8nB54j"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 43EA525D1E3;
	Wed, 26 Feb 2025 22:39:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740609549; cv=none; b=DwkFTcyaUPNkXSg3ifrEBq7AvuFQ31+xGp1ZZ+T8R1Cy9uJF+QcDppLNr77U/EUFh3lTIiFQyz/JNEn0LpeS82W9e7TO084N2T6iqsjrx413LF56SePlY6YirjDSijMsi2tevT6reaMN2pGH6mdIoFjfMHWbRdHOlkxyHC2xh0s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740609549; c=relaxed/simple;
	bh=o0wDW1elrmIyGg/qOhv6CjT4a8C3ze88DyV6cl/5DNs=;
	h=Message-ID:Content-Type:MIME-Version:In-Reply-To:References:
	 Subject:From:Cc:To:Date; b=RX1wFs4y5+VoMqQ9yollyvjyuMUDbLsVccGQzUYa/6i3dlssr+PJYDe4YgGMzufweJgo/vpYcUPjAtpgzxg0X//xxjZHlihDcIYoyJAYtwaleXa1RdGBl9QRIzJWhV1tOhIapB98qjxDNwAuH7zHyYF/YikKe99LyW04a5ZUNMI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=NV8nB54j; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A69B3C4CED6;
	Wed, 26 Feb 2025 22:39:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1740609548;
	bh=o0wDW1elrmIyGg/qOhv6CjT4a8C3ze88DyV6cl/5DNs=;
	h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
	b=NV8nB54jsza0p8W421NDVZrfXhmO+SNWOGb7L1oPgNu+h/oVrkb4gchYvxrAXwnZA
	 AmpMPKdN1KAp7QV4TQPBEt2s7RtKKoo3712qtc9yplGxnOF1ZyVE9knt/uGIqp0lhU
	 e/t/HENbdx+ny9ieLrOttwkGsANmOHoUwDydZtbcZKda62l7gLw1f3QIsMqNatkT4U
	 2hHf5pal6WMTDirnFKeY8+FEZ485NjX4g6fsGxbHW1Yyn6cKG3jHDbvuSoyF3o7Hq4
	 QxXsXF7qmg6iDvkOpcD5JJxJiezj0MmBpBrb49z5E/1VNbi0QxOYylSkRVX63GaC7z
	 V+Jg9F9OwZ5YQ==
Message-ID: <eb867227ce8d9e9c02777a996d043f9a.sboyd@kernel.org>
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <cover.1740157133.git.geert+renesas@glider.be>
References: <cover.1740157133.git.geert+renesas@glider.be>
Subject: Re: [GIT PULL] clk: renesas: Updates for v6.15
From: Stephen Boyd <sboyd@kernel.org>
Cc: linux-clk@vger.kernel.org, linux-renesas-soc@vger.kernel.org, Geert Uytterhoeven <geert+renesas@glider.be>
To: Geert Uytterhoeven <geert+renesas@glider.be>, Michael Turquette <mturquette@baylibre.com>
Date: Wed, 26 Feb 2025 14:39:06 -0800
User-Agent: alot/0.12.dev1+gaa8c22fdeedb

Quoting Geert Uytterhoeven (2025-02-21 09:01:59)
>         Hi Mike, Stephen,
>=20
> The following changes since commit 2014c95afecee3e76ca4a56956a936e23283f0=
5b:
>=20
>   Linux 6.14-rc1 (2025-02-02 15:39:26 -0800)
>=20
> are available in the Git repository at:
>=20
>   git://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-drivers.git=
 tags/renesas-clk-for-v6.15-tag1
>=20
> for you to fetch changes up to 9b12504e8c8c2f1f7e5f16afdd829603dd0c9508:
>=20
>   clk: renesas: r9a09g047: Add CANFD clocks and resets (2025-02-20 17:42:=
03 +0100)
>=20
> ----------------------------------------------------------------

Thanks. Pulled into clk-next

