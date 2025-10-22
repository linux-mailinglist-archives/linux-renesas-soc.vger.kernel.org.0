Return-Path: <linux-renesas-soc+bounces-23419-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id C5A1FBFB47A
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 22 Oct 2025 12:02:41 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 8396C3AA9E1
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 22 Oct 2025 10:02:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4F03930B521;
	Wed, 22 Oct 2025 10:02:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="NpyqG8GP"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E0A8930ACE3;
	Wed, 22 Oct 2025 10:02:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.246.85.4
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761127358; cv=none; b=Maw/7y2F497xJpShCLvzL5ZWWED1vPvbqIsVPN1JLSOa90dmmn8nGV+Eg+uOeleh0BDa2ROp7o/vBlAKbOHp67LckBpbrpyOh8Vm3SiAUZ18+0TjDEUbQY30XyNae95RlbclB/l/4RY1ga1LyNdFmWL2QxMi3f8T/aF+4UwuTpg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761127358; c=relaxed/simple;
	bh=aFu5pOgW/QXL5FSBZwccCI0J+8OS8Z/7m8YYt0QKzQw=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=EkGF7kVwouSawBjdo/E4yghAkmItFLeNZ7a6G/0fXWGLqTYA12knM5LkKNcSTa21nrfTE/qP8lT3+fkvZp2u+PkisP943BNbViVUBbG3Vwepcr9TBQrBrb2CFBdGTSfh8N4FWxbXrpZQhw4irPL0y+HpdY5UPlwZ5+E+gPzhzlw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=NpyqG8GP; arc=none smtp.client-ip=185.246.85.4
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id 4019F4E41270;
	Wed, 22 Oct 2025 10:02:34 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 122CB606DC;
	Wed, 22 Oct 2025 10:02:34 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id CA036102F2393;
	Wed, 22 Oct 2025 12:02:26 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1761127353; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=hQxx/KluC/+d3m4FrK0wA2hEdaOutnyxgsFe7NpoS3U=;
	b=NpyqG8GPS3jm4yxonp42vl4Ry0tGC45F6XfYs1a5Ew8l7wYjqtSGnA9SXf384EEz3qA380
	Dm9YOFIPfX56DKFm+/i9/75CR0Imkea6nrNtrDoKmZQ9xjh65MIV+DWry3E5GXGLr8LI1m
	E8o4jF7POwrN+nG6AYnNwAN0HZSsYX0Kmp2QpUa2j6r5ABqlVILy0zbcK3g/dUDEsSXnK9
	I/jyrvuYDJwWowyK8EJfJp/6e1US5wQpvK3oUk9G/GY14yAhCldyxWExLqC2e8d/tHVvFS
	MiYz+1eqSfD+K73TOQmYWqUtr2ujw+rLgonZQTwWz5pmGxAwxAnsKbUZpYX2tw==
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: linux-renesas-soc@vger.kernel.org, 
 Wolfram Sang <wsa+renesas@sang-engineering.com>
Cc: Geert Uytterhoeven <geert+renesas@glider.be>, 
 Linus Walleij <linus.walleij@linaro.org>, 
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, linux-arm-kernel@lists.infradead.org, 
 linux-mtd@lists.infradead.org, devicetree@vger.kernel.org
In-Reply-To: <20251002142639.17082-2-wsa+renesas@sang-engineering.com>
References: <20251002142639.17082-2-wsa+renesas@sang-engineering.com>
Subject: Re: [PATCH] dt-bindings: mtd: physmap: add 'clocks' and
 'power-domains'
Message-Id: <176112734652.141620.5938048164419652638.b4-ty@bootlin.com>
Date: Wed, 22 Oct 2025 12:02:26 +0200
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Mailer: b4 0.14.2
X-Last-TLS-Session-Version: TLSv1.3

On Thu, 02 Oct 2025 16:23:11 +0200, Wolfram Sang wrote:
> Physmap supports minimal PM since commit 0bc448b49e8a017e ("mtd: maps:
> physmap: Add minimal Runtime PM support"), so support it also when used
> in DT configurations.
> 
> 

Applied to nand/next, thanks!

[1/1] dt-bindings: mtd: physmap: add 'clocks' and 'power-domains'
      commit: 4e7a83ed83120858f676007706197aa5594d4dd9

Patche(s) should be available on mtd/linux.git and will be
part of the next PR (provided that no robot complains by then).

Kind regards,
Miquèl


