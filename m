Return-Path: <linux-renesas-soc+bounces-14571-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 57083A66FD4
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 18 Mar 2025 10:33:09 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 29ADE3B4010
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 18 Mar 2025 09:32:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 683D61A8F68;
	Tue, 18 Mar 2025 09:33:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="FSHaHYYy"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from relay8-d.mail.gandi.net (relay8-d.mail.gandi.net [217.70.183.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BE86D1422AB;
	Tue, 18 Mar 2025 09:33:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.70.183.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742290384; cv=none; b=mV4qMTKxO15rjtyDRDiIxbR4EvAvKi7ful6m7+ReGX+yXDLJ0GcV7fO6231nXKRVmPXea7rCeg8w5ynkW4ZUCsnhHu5J/0cyxoZhiG+/i18e2tlipoULUK7Ohp5h+l8OHEWOiMETEv7Jg8qNxeDKKmkjqaO4DGaE4qZA/8yDdEc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742290384; c=relaxed/simple;
	bh=RskMyfpDzNxCjr76KXtA0WZtg3+07i+v5DFNtpndqik=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=j4ujUhZh/5YAcEigweOyX1kHDTLqfzJlzk4x8SFwFHQEeoqLJD4Ot0TgGded703dj7QkiRPbmZfkyAlOA4eQ3BkY8qGmynACyT83TKbUtqvU2ObD+SPLhbCmB9DjVxTHIlgeNeltl6vaKWsLUv5BxnXzOFHXX9F6sj3VejZtZbw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=FSHaHYYy; arc=none smtp.client-ip=217.70.183.201
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Received: by mail.gandi.net (Postfix) with ESMTPSA id 77D1643426;
	Tue, 18 Mar 2025 09:32:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1742290379;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=RskMyfpDzNxCjr76KXtA0WZtg3+07i+v5DFNtpndqik=;
	b=FSHaHYYyLRkX656bH5G7MO/UOUSm5yF+CI19iWkIqf7T5c4jqbFyYCOc/wNWkA0PnprgFb
	g0tf18hHg8Ytjz4A3R6JQ1DHmo4IvtWLvVbTQMmYcXXiX0/Jb1SbT1X+S7rW75irbX4zu0
	5i/wj0hE1jezJYN2lf0zqxpREZQDFASlaH0z7ZCJhemsAch4QtFMpOZYr4Ra7Grh6U+owO
	tdd8KPMStrv8IYRutK4Gnj+2xC5ih8AFQoxwdk8tA+L01IVsfJqwL7DkwQP7ArhMDHOwEb
	4aZtOVjBURsP/L9+QwTb7EMcd1BUfxg1T1lDknVrDelxf4l3exuaVYmbQrh5qQ==
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Wolfram Sang <wsa+renesas@sang-engineering.com>
Cc: linux-renesas-soc@vger.kernel.org,  Greg Kroah-Hartman
 <gregkh@linuxfoundation.org>,  Jiri Slaby <jirislaby@kernel.org>,  Rob
 Herring <robh@kernel.org>,  Krzysztof Kozlowski <krzk+dt@kernel.org>,
  Conor Dooley <conor+dt@kernel.org>,  Geert Uytterhoeven
 <geert+renesas@glider.be>,  Magnus Damm <magnus.damm@gmail.com>,
  linux-serial@vger.kernel.org,  devicetree@vger.kernel.org
Subject: Re: [PATCH] dt-bindings: serial: snps-dw-apb-uart: document RZ/N1
 binding without DMA
In-Reply-To: <20250318085353.18990-2-wsa+renesas@sang-engineering.com>
	(Wolfram Sang's message of "Tue, 18 Mar 2025 09:53:53 +0100")
References: <20250318085353.18990-2-wsa+renesas@sang-engineering.com>
User-Agent: mu4e 1.12.7; emacs 29.4
Date: Tue, 18 Mar 2025 10:32:59 +0100
Message-ID: <877c4md6pg.fsf@bootlin.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-GND-State: clean
X-GND-Score: -100
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgddugedvtdelucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuifetpfffkfdpucggtfgfnhhsuhgsshgtrhhisggvnecuuegrihhlohhuthemuceftddunecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpefhvfevufgjfhgffffkgggtgfesthhqredttderjeenucfhrhhomhepofhiqhhuvghlucftrgihnhgrlhcuoehmihhquhgvlhdrrhgrhihnrghlsegsohhothhlihhnrdgtohhmqeenucggtffrrghtthgvrhhnpeffgefhjedtfeeigeduudekudejkedtiefhleelueeiueevheekvdeludehiedvfeenucfkphepledtrdekledrudeifedruddvjeenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepihhnvghtpeeltddrkeelrdduieefrdduvdejpdhhvghloheplhhotggrlhhhohhsthdpmhgrihhlfhhrohhmpehmihhquhgvlhdrrhgrhihnrghlsegsohhothhlihhnrdgtohhmpdhnsggprhgtphhtthhopeduuddprhgtphhtthhopeifshgrodhrvghnvghsrghssehsrghnghdqvghnghhinhgvvghrihhnghdrtghomhdprhgtphhtthhopehlihhnuhigqdhrvghnvghsrghsqdhsohgtsehvghgvrhdrkhgvrhhnvghlrdhorhhgpdhrtghpthhtohepghhrvghgkhhhsehlihhnuhigfhhouhhnuggrthhiohhnrdhorhhgpdhrtghpthhtohepjhhirhhishhlrggshieskhgvrhhnvghlrdhorhhgpdhrtghpthhto
 heprhhosghhsehkvghrnhgvlhdrohhrghdprhgtphhtthhopehkrhiikhdoughtsehkvghrnhgvlhdrohhrghdprhgtphhtthhopegtohhnohhrodgutheskhgvrhhnvghlrdhorhhgpdhrtghpthhtohepghgvvghrthdorhgvnhgvshgrshesghhlihguvghrrdgsvg
X-GND-Sasl: miquel.raynal@bootlin.com

Hello Wolfram,

On 18/03/2025 at 09:53:53 +01, Wolfram Sang <wsa+renesas@sang-engineering.c=
om> wrote:

> Renesas RZ/N1D has this UART with and without DMA support. Currently,
> only the binding with DMA support is described. Add the missing one
> without DMA support which can fallback even more.
>
> Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>

That's true indeed.

Reviewed-by: Miquel Raynal <miquel.raynal@bootlin.com>

Thanks,
Miqu=C3=A8l

