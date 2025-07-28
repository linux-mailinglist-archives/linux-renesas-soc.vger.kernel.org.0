Return-Path: <linux-renesas-soc+bounces-19709-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 2D95BB138BA
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 28 Jul 2025 12:17:29 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 8E56B3AB207
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 28 Jul 2025 10:16:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 765B02561AA;
	Mon, 28 Jul 2025 10:17:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="NQGOEF3W"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from relay6-d.mail.gandi.net (relay6-d.mail.gandi.net [217.70.183.198])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 374C6225785;
	Mon, 28 Jul 2025 10:17:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.70.183.198
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753697833; cv=none; b=szn6BVo/dLuQ9a5KQPXIWrnB8PCFi7sXtEkLK3M1oNF+RpyMal5jyof3ke9v6Ut4DI+SzZIS4rRlkJNHG99sXev0vBdMRYAW95hVECcQEAGkNbbW0Wxgeq3lyPwpS98EfQLoUtSbIar+uVBywIfU+adgqwpdjAnbq2xfBenWr1c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753697833; c=relaxed/simple;
	bh=rrkwcWVAQx8sLtBRBFuUny/kpCpEKAlr5XI01r3K8FE=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=KM7QGXJ/muy9aHjTS+smMNqy1kovLqSfe3c8+XsACScZrgIC2/8JKaY4xeu2Rw1kSYrtynS0xIlWHd0z/zCXRGw++XaGw4nonrN/pHM99XKdGHlY9kICNuD+VuoIwG5O6vmFactH1y57oFzvaqnLrY6nCV555nQi8iOa5hMr6h4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=NQGOEF3W; arc=none smtp.client-ip=217.70.183.198
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Received: by mail.gandi.net (Postfix) with ESMTPSA id D85A443212;
	Mon, 28 Jul 2025 10:17:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1753697824;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=ZPJVXb/5d0Ebwv+JnWMIP1emP4lNCvm9KUIgiwqhWUU=;
	b=NQGOEF3WNChBSDjqr0SE9gRtUhivDHNrlPycFw2Oz08reaUOOwrvYZ0ttqT1o+Augy+K/N
	Cu/huwUQV5ywozTtc0Eo0sbMEhtR0MwF7t0UPgsmsxlBy6fSIeWKomeOWl26Nd3NiickKn
	oqNiJ4XtGKKBTMtvp9lOOyPZkZrDt/2WVAbib1ApoBANVfnijFs/KOWUrkplOwezq/ouIO
	jO18S9LHmpDTDsqFcZOTtE0oikQbxqWN2+nq1c9HuOQ5UI4ET8S8BC4ZmOytrT/awEOvNO
	k0HpfxP2TAq/Xsn/o8gRpuLAbrZqnGi35f4IX3jBcSVWCxZR5C6z2wJc3eVQKw==
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Thomas Fourier <fourier.thomas@gmail.com>
Cc: stable@vger.kernel.org, Richard Weinberger <richard@nod.at>, 
 Vignesh Raghavendra <vigneshr@ti.com>, 
 Wolfram Sang <wsa+renesas@sang-engineering.com>, 
 linux-mtd@lists.infradead.org, linux-renesas-soc@vger.kernel.org, 
 linux-kernel@vger.kernel.org
In-Reply-To: <20250702080110.46839-2-fourier.thomas@gmail.com>
References: <20250702080110.46839-2-fourier.thomas@gmail.com>
Subject: Re: [PATCH v2] mtd: rawnand: renesas: Add missing check after DMA
 map
Message-Id: <175369782376.102528.13884729975771855369.b4-ty@bootlin.com>
Date: Mon, 28 Jul 2025 12:17:03 +0200
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Mailer: b4 0.14.2
X-GND-State: clean
X-GND-Score: -100
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeeffedrtdefgdeludeludcutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfitefpfffkpdcuggftfghnshhusghstghrihgsvgenuceurghilhhouhhtmecufedtudenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurhephffvvegjfhfukfffgggtgffosehtkeertdertdejnecuhfhrohhmpefoihhquhgvlhcutfgrhihnrghluceomhhiqhhuvghlrdhrrgihnhgrlhessghoohhtlhhinhdrtghomheqnecuggftrfgrthhtvghrnhepheeifffhueelgfdtleetgfelvefggfehudelvdehuddulefgheelgfehieevvdegnecukfhppeeltddrkeelrdduieefrdduvdejnecuvehluhhsthgvrhfuihiivgepvdenucfrrghrrghmpehinhgvthepledtrdekledrudeifedruddvjedphhgvlhhopegludelvddrudeikedrgedvrdegiegnpdhmrghilhhfrhhomhepmhhiqhhuvghlrdhrrgihnhgrlhessghoohhtlhhinhdrtghomhdpnhgspghrtghpthhtohepkedprhgtphhtthhopeifshgrodhrvghnvghsrghssehsrghnghdqvghnghhinhgvvghrihhnghdrtghomhdprhgtphhtthhopehlihhnuhigqdhmthgusehlihhsthhsrdhinhhfrhgruggvrggurdhorhhgpdhrtghpthhtoheplhhinhhugidqrhgvnhgvshgrshdqshhotgesvhhgvghrrdhkvghrnhgvlhdrohhrghdprhgtphhtthhopehrihgthhgrrhgusehnohgurdgrthdprhgtphhtt
 hhopehfohhurhhivghrrdhthhhomhgrshesghhmrghilhdrtghomhdprhgtphhtthhopehsthgrsghlvgesvhhgvghrrdhkvghrnhgvlhdrohhrghdprhgtphhtthhopehlihhnuhigqdhkvghrnhgvlhesvhhgvghrrdhkvghrnhgvlhdrohhrghdprhgtphhtthhopehvihhgnhgvshhhrhesthhirdgtohhm
X-GND-Sasl: miquel.raynal@bootlin.com

On Wed, 02 Jul 2025 10:01:06 +0200, Thomas Fourier wrote:
> The DMA map functions can fail and should be tested for errors.
> 
> 

Applied to nand/next, thanks!

[1/1] mtd: rawnand: renesas: Add missing check after DMA map
      commit: 1257e75e62c363ff4e857a49fd5c4b1ca2b2b166

Patche(s) should be available on mtd/linux.git and will be
part of the next PR (provided that no robot complains by then).

Kind regards,
Miquèl


