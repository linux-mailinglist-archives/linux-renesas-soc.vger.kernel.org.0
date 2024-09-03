Return-Path: <linux-renesas-soc+bounces-8674-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 7D68196A9D3
	for <lists+linux-renesas-soc@lfdr.de>; Tue,  3 Sep 2024 23:14:25 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 28DB81F24838
	for <lists+linux-renesas-soc@lfdr.de>; Tue,  3 Sep 2024 21:14:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D1A921EBFEC;
	Tue,  3 Sep 2024 21:14:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="jR+Im7G2"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9E4D11EBFE1;
	Tue,  3 Sep 2024 21:14:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725398059; cv=none; b=ag1owZoQrVPoKP1Pul8cHX7eoBYXPBiGN8KPTQgHEUvUkEsXzW2CwagLJ4X7akfqrKUIQE/roir3D5PH6BcZUfV12g880lM453dLqiX566ttervYATClKYRXgdwJOYETOHebq22TbxCCsI6u8rQGH8ffDZ7ef71ZE77w9IBdImQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725398059; c=relaxed/simple;
	bh=WThEOLA5TFW3ECCpeFMQ7LYektseHiCktHPxmU2NnDU=;
	h=Message-ID:Content-Type:MIME-Version:In-Reply-To:References:
	 Subject:From:Cc:To:Date; b=swNjH5wxEs3cirDjC7QMwzK9ZIfCHAga1q/KbJMWTViBiWn1c4mH4aCknAjeDQUayyz47CAhcMAKbot5l8hOztzLwyEG1kZWn3/f9W8EmkyNkMFuYrJbFYYIfPcsx6QRKNzP/sFJjsU8uChHHkmFRsAO1oStl9zqZZicdPvk4K0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=jR+Im7G2; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F2E0FC4CEC4;
	Tue,  3 Sep 2024 21:14:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1725398059;
	bh=WThEOLA5TFW3ECCpeFMQ7LYektseHiCktHPxmU2NnDU=;
	h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
	b=jR+Im7G2GLlqEoAuP04YD7zc9bOl0W789IpWxbKEZzxThFrWWiqrwy2DResAhcgyZ
	 +eOsXY+ewlnz89ZEX1JqMbswqv+PF7pSwmUeOI7l1kqtqm6rjr1cGMNefV4GlecQJS
	 MzDDeOeblYG1W8L0DmhuNoI8cNuonP2FAqjEleGWC0YYDpK8JZsR34TOTI9cfAPs+x
	 K/JboefQIzPqx5SW0E+yK9kR+ThcrrkDu9gmnh6sS/9pV3yOIQF5TSL5jPMliCOeBQ
	 LQ2iIbn8TndyoNZwyTzU+10aOHvXFZ8BqIm5aNGH6WLYZvpux0bgVMo7tQHik8QVvo
	 twVwS0UeJ6e3g==
Message-ID: <7c04ce3b02e53cb9c05d990c223dde9f.sboyd@kernel.org>
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <cover.1725374868.git.geert+renesas@glider.be>
References: <cover.1725374868.git.geert+renesas@glider.be>
Subject: Re: [GIT PULL] clk: renesas: Updates for v6.12 (take two)
From: Stephen Boyd <sboyd@kernel.org>
Cc: linux-clk@vger.kernel.org, linux-renesas-soc@vger.kernel.org, Geert Uytterhoeven <geert+renesas@glider.be>
To: Geert Uytterhoeven <geert+renesas@glider.be>, Michael Turquette <mturquette@baylibre.com>
Date: Tue, 03 Sep 2024 14:14:16 -0700
User-Agent: alot/0.10

Quoting Geert Uytterhoeven (2024-09-03 07:51:57)
>         Hi Mike, Stephen,
>=20
> The following changes since commit 120c2833b72f4bdbd67ea2cf70b9d96d1c2357=
17:
>=20
>   clk: renesas: r8a779h0: Add CANFD clock (2024-08-20 09:48:24 +0200)
>=20
> are available in the Git repository at:
>=20
>   git://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-drivers.git=
 tags/renesas-clk-for-v6.12-tag2
>=20
> for you to fetch changes up to 3aeccbe08171b79f82fb802393a6324c7b732669:
>=20
>   clk: renesas: r9a09g057: Add clock and reset entries for GTM/RIIC/SDHI/=
WDT (2024-09-02 10:15:38 +0200)
>=20
> ----------------------------------------------------------------

Thanks. Pulled into clk-next

