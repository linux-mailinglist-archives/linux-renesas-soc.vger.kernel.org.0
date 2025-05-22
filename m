Return-Path: <linux-renesas-soc+bounces-17412-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 92192AC16C6
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 23 May 2025 00:27:03 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 3AD893BD266
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 22 May 2025 22:26:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0FF45272E62;
	Thu, 22 May 2025 22:26:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="O5Tu+3lb"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D87FB270ED8;
	Thu, 22 May 2025 22:26:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747952807; cv=none; b=LKXi7gYco/8kUulaVVXfim/ATggF0qElKpj4/rEtlZddNOF2/RQM8Zg+piSITMqzUBUeJL5b73/7C7vPGaJ9TUm6c7oQZ0waxVo70UO3tlgJArWNwEQr0KH7SSeL+GbuvSGvcQRjJtAW/ybaQUt5QmIwxqcDVkFnGOEtAcZURFM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747952807; c=relaxed/simple;
	bh=HwjwT6l9nbjaToCFzsKj/WM3jn4D+rpjIUp6KVBTims=;
	h=Message-ID:Content-Type:MIME-Version:In-Reply-To:References:
	 Subject:From:Cc:To:Date; b=rqEy9EWdS8JchMNRSdVLR/pPBVBBQ0l02jiny0UwizEF0ad/V/JeQ2OP00m1Avs98DHndfuEMJgESR28XWtfZrjCQHHkJqZ/Z06Dw9uwNvLm/gvf83bBmndebtLxPlslfmy4PxhPbpsnkzhQ7FyI+++PcDzZWB53hCtK/l2dbbU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=O5Tu+3lb; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 53FBBC4CEEB;
	Thu, 22 May 2025 22:26:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1747952806;
	bh=HwjwT6l9nbjaToCFzsKj/WM3jn4D+rpjIUp6KVBTims=;
	h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
	b=O5Tu+3lbkDVFXcaHJIlC3O/AlIpU/K2Py4Jku6gBjhUBTYjG9YGZqNQNrcNpZ7RJc
	 dW1Mhx/YJUhpD72TuerIWGX9lpqmuKdm81y4GnCEf8S8mDcO5/gwoZOkXxKps1K/5B
	 2In1SS/57agY4m0SxLvL3zJLw1qy82NazArO324KalA0u1/poeei+2PvlxXtZI3Loj
	 twaphxMWIseaIH5cgi6XrBJaVLFFiGL4iuN+n0iFrqLFBJrQ8NRVo9MUgOqks5HIuT
	 BrnNh+Lnx8ImfjCGfFKUrFiFy0FLTYKxh7KQF9eieaYRX85Q64phl8noH4/aaIBzWE
	 4qSCEHJVBcaGA==
Message-ID: <327dc99f25e277b02e9c344b449cefcb@kernel.org>
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <cover.1746798912.git.geert+renesas@glider.be>
References: <cover.1746798912.git.geert+renesas@glider.be>
Subject: Re: [GIT PULL] clk: renesas: Updates for v6.16 (take two)
From: Stephen Boyd <sboyd@kernel.org>
Cc: linux-clk@vger.kernel.org, linux-renesas-soc@vger.kernel.org, Geert Uytterhoeven <geert+renesas@glider.be>
To: Geert Uytterhoeven <geert+renesas@glider.be>, Michael Turquette <mturquette@baylibre.com>
Date: Thu, 22 May 2025 15:26:44 -0700
User-Agent: alot/0.12.dev8+g17a99a841c4b

Quoting Geert Uytterhoeven (2025-05-09 07:22:59)
>         Hi Mike, Stephen,
>=20
> The following changes since commit 93f2878136262e6efcc6320bc31ada62fb0afd=
20:
>=20
>   clk: renesas: r9a09g057: Add clock and reset entries for USB2 (2025-04-=
22 11:38:28 +0200)
>=20
> are available in the Git repository at:
>=20
>   git://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-drivers.git=
 tags/renesas-clk-for-v6.16-tag2
>=20
> for you to fetch changes up to 28548f3f7994dd214ad4f4ba5763cd06333404a0:
>=20
>   clk: renesas: r9a09g047: Add XSPI clock/reset (2025-05-08 20:17:55 +020=
0)
>=20
> ----------------------------------------------------------------

Thanks. Pulled into clk-next

