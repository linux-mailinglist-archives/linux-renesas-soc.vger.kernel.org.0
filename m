Return-Path: <linux-renesas-soc+bounces-26879-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id A66DFD25BD9
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 15 Jan 2026 17:28:26 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 2824930022D6
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 15 Jan 2026 16:28:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 80B203B961B;
	Thu, 15 Jan 2026 16:28:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="nsos3ou+"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D82C134216C;
	Thu, 15 Jan 2026 16:28:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.246.85.4
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768494505; cv=none; b=K7UYCSMXewuBJO28FEEoixDuAIUZIH2wwOnUNBj6jlP+/T5bFMbyiSx4O4ZSgeM5brkXKALTMk7lc41OxrBsMhtppxhDQxvNqcQ5fNmGR7rEJxfqw18oBAMkPp+sgBeVGGkgGkqGrgvJpKp9RWa7R8V/S3HCAxMA/TqunR3PP/w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768494505; c=relaxed/simple;
	bh=YpovNE568W7Ac7JnxxhQPe1OhnL5OXlrDs3EhBUHymE=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=dSN9OBYQPgt4UgvJ7W1YAa1WeB5fQoW5QDxObtp8WkO6HF3bForETZbQ4inL0qEX1aJnM8vxYB0VennYoCaGDSATgBiuIMdjYxda/Qp0bvIBVDfxHutLGq0RaGNaSjo/iYgFEW0OrJYEK3F7OzoN5xDXiPnpMh3vvkJdERAQ9GQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=nsos3ou+; arc=none smtp.client-ip=185.246.85.4
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id BA70E4E42043;
	Thu, 15 Jan 2026 16:28:19 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 74A0E606E0;
	Thu, 15 Jan 2026 16:28:19 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id C7EDD10B6865E;
	Thu, 15 Jan 2026 17:28:15 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1768494498; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=aV+DHh3fdXtaIC3u63Krwbos/wLBUxocMbVXSHDTP1g=;
	b=nsos3ou+0dXnC+RTWJ3hjdNwPF9N+Nhroxkq56MKVWzboSPQhnpHjLZFHBKBY4Co+VdNPe
	HQeRGlOamfthtZ3pn1misdY7cecaAj+lcQ3kT2ha5rBlQDvsz55prcppoOjGZboPcswcgN
	bDuT7XDNXDUHQvopnEw832capF2AP3nsF23uuXkGhvNw+KXOUnDgpGBWL2lUhNexV6dnWc
	TEtloAK7L61M/Hk5vjJS3qGNG3vNjAiQbYvlrIhWXX/8TfSGcZNA+9pOnPWxnhnbfuAsB/
	lQ5FHmXBECLdx26HKjbizF9ZZOXOVkMb9PwQ1TgT1wfIPoA4eFzN5fu594GIhw==
Date: Thu, 15 Jan 2026 17:28:14 +0100
From: Herve Codina <herve.codina@bootlin.com>
To: Wolfram Sang <wsa+renesas@sang-engineering.com>, Geert Uytterhoeven
 <geert+renesas@glider.be>, Magnus Damm <magnus.damm@gmail.com>, Rob Herring
 <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>
Cc: linux-renesas-soc@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, Pascal Eberhard <pascal.eberhard@se.com>,
 Miquel Raynal <miquel.raynal@bootlin.com>, Thomas Petazzoni
 <thomas.petazzoni@bootlin.com>
Subject: Re: [PATCH] ARM: dts: renesas: r9a06g032: Add support for CPU
 frequency scaling
Message-ID: <20260115172814.10c46b51@bootlin.com>
In-Reply-To: <20260115160144.1200270-1-herve.codina@bootlin.com>
References: <20260115160144.1200270-1-herve.codina@bootlin.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.3.1 (GTK 3.24.49; x86_64-redhat-linux-gnu)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Last-TLS-Session-Version: TLSv1.3

Hi all,

SOB lines and author are not correct.

Even if it's me (Herve Codina) in all cases, I messed me up with the
"(Schneider Electric)" part.

Please ignore this v1. I will send a v2 with correct SoB and author.

Sorry for the noise.

Best regards,
Hervé


On Thu, 15 Jan 2026 17:01:44 +0100
"Herve Codina (Schneider Electric)" <herve.codina@bootlin.com> wrote:

> From: Herve Codina <herve.codina@bootlin.com>
> 
...
> 
> Signed-off-by: Herve Codina <herve.codina@bootlin.com>
> Signed-off-by: Herve Codina (Schneider Electric) <herve.codina@bootlin.com>

