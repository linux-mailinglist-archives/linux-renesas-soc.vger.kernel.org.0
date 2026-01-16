Return-Path: <linux-renesas-soc+bounces-26925-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id DDD75D33655
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 16 Jan 2026 17:09:03 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 64E9F302B758
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 16 Jan 2026 16:09:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E026D341057;
	Fri, 16 Jan 2026 16:09:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="D9FDqvJ8"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from smtpout-04.galae.net (smtpout-04.galae.net [185.171.202.116])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BE22033A03F
	for <linux-renesas-soc@vger.kernel.org>; Fri, 16 Jan 2026 16:08:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.171.202.116
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768579741; cv=none; b=u3nKOderqZ+Dl+uGYlRkfCsm0JNtmps1cipS7UZJMa9fchbD2c0rb0Law/rFS6vDfMRSTmvXtKksdyENXu5Siv2Xz9z5dJI+p4Ywmx84fxBtfDMR9mt/IQ/DXjN0fYHL1S7yH3dZPOP7VNMkhoqzG7JVhyug1PXRVIl0ZprQuGY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768579741; c=relaxed/simple;
	bh=LEQ67zD2GizwFmfgfIz2kKoGg93pry3gARSDOjMr/tk=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=RkOWd+ultmOe7psWvUC+IJNLXlWMmVNCaBneSRF2MwoIC0aSkNwZ7sasaWM8dZAVDAs/7pcqCvQsUmSr+DxjCjE/zTFwT2GbKoY8uakgINbdaGY07L1ocSDs9cpmBpWaCIjWzUKFMvSF01tfvyveW0PvlOoFTLXx8fGvbnD+bFk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=D9FDqvJ8; arc=none smtp.client-ip=185.171.202.116
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-04.galae.net (Postfix) with ESMTPS id 4A5D6C1F1FC;
	Fri, 16 Jan 2026 16:08:31 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id F2A8F60732;
	Fri, 16 Jan 2026 16:08:57 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 47BAE10B68B7D;
	Fri, 16 Jan 2026 17:08:56 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1768579737; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=/f1gixZHedoGOkCXCUBXXGEkdUc3U2vcZxvr9M68SYI=;
	b=D9FDqvJ8AitqzAkFl04x5UmEhWqcCGJkjb2PrV1oaNt6JTrxbAcw/ffweld5cGys+CeV3n
	f17Nn3jPl4ox/VzCyxPPBRNRI+EwWrBnA1Pq4jxyrTpazPr5PH4aHvouhkU8FVz50GODSM
	mVTGKWhszGJn642prMrnRaRFMi75OrEeUmoZdGRicCu65gS6EfTvrlG2rxQFAyvEpe1/wS
	Fcm+NvznyFuGMRSAKiBhAOrQ2iCFgMPAjh70PircsGVZF5MWB/qhFwxf2n9LSkTXCxN3pe
	3DDjEfY+6LG5nFu/mC0SOCFbadh2C1WIK3GLftfZtH87+z6gvKif7/0sfqxj6A==
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Wolfram Sang <wsa+renesas@sang-engineering.com>
Cc: linux-renesas-soc@vger.kernel.org,  Geert Uytterhoeven
 <geert+renesas@glider.be>,  Magnus Damm <magnus.damm@gmail.com>,  Rob
 Herring <robh@kernel.org>,  Krzysztof Kozlowski <krzk+dt@kernel.org>,
  Conor Dooley <conor+dt@kernel.org>,  devicetree@vger.kernel.org
Subject: Re: [RFC PATCH] ARM: dts: renesas: r9a06g032-rzn1d400-db: add QSPI
 node including NOR flash
In-Reply-To: <20260116114852.52948-2-wsa+renesas@sang-engineering.com>
	(Wolfram Sang's message of "Fri, 16 Jan 2026 12:48:48 +0100")
References: <20260116114852.52948-2-wsa+renesas@sang-engineering.com>
User-Agent: mu4e 1.12.7; emacs 30.2
Date: Fri, 16 Jan 2026 17:08:55 +0100
Message-ID: <874ioltu94.fsf@bootlin.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-Last-TLS-Session-Version: TLSv1.3

Hello Wolfram,

On 16/01/2026 at 12:48:48 +01, Wolfram Sang <wsa+renesas@sang-engineering.c=
om> wrote:

> Enable the QSPI controller to access the connected SPI NOR flash. The
> NOR datasheet may suggest faster tuning parameters but those did not
> work on my board.
>
> Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
> ---
>
> Depends on the series "[PATCH v2 00/13] spi: cadence-qspi: Add Renesas
> RZ/N1 support". As this is still under discussion, this patch is RFC
> only.
>
> The tuning values used came from Miquel and work here as well. An
> interested party may try to tune this further but I will go the safe
> route here.

In case you feel adventurous, this paragraph made me remember that I had
noted down some slightly more aggressive values related to the DB board
(which I don't have) in some of my notes. A bit of digging resurrected
the following:

     tshsl-ns =3D <30>;
     tsd2d-ns =3D <3>;
     tchsh-ns =3D <3>;
     tslch-ns =3D <3>;

Anyhow, thanks for the follow-up patch and thanks for testing.

Reviewed-by: Miquel Raynal <miquel.raynal@bootlin.com>

Thanks,
Miqu=C3=A8l

