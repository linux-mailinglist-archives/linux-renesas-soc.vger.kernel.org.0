Return-Path: <linux-renesas-soc+bounces-12071-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 8A1C2A0AC8D
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 13 Jan 2025 00:05:38 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 9C54D165A28
	for <lists+linux-renesas-soc@lfdr.de>; Sun, 12 Jan 2025 23:05:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 269E01B87F8;
	Sun, 12 Jan 2025 23:05:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="fNjBMi49"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from relay7-d.mail.gandi.net (relay7-d.mail.gandi.net [217.70.183.200])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AEF8D155C97;
	Sun, 12 Jan 2025 23:05:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.70.183.200
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736723132; cv=none; b=P6KPLm941WAwqyeihx/pcNmkvJgkuQVR7W43M0ZM086rHTlAVC3Lk7S37dKzQjoWnvdINOp0OiHWKqFjVaaBS6VQHF5dGAx/sHeFB/gHKDy5DD/VJoPjPMua0Oi/7FHO7AD1/4GVnZY3lXI1mjzoZ8+GEC/4NS2Lu9r3W6+Ypqk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736723132; c=relaxed/simple;
	bh=wRJv0CXa2iQb8LtTvJO06nIhtXWz2uGWUUI6zQUhtjU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=cAaWT4IsZpM0q2j3z07iiuHub+jH7OekWRoTuJJKtoghYtsubvJiWqv8nQYH81RxEwByXcvh4Q4sJqJBq6CYz/6NhtJmfuu27MxG/BUlAZ+cW5erVs/405y6KRJ1zmeclrAbMNROAt33b63nArK+L7RXiuY7pWjZuSc7T01wPEA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=fNjBMi49; arc=none smtp.client-ip=217.70.183.200
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Received: by mail.gandi.net (Postfix) with ESMTPSA id 6C20D20002;
	Sun, 12 Jan 2025 23:05:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1736723122;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=dyMxsLN0chGxhzFvSBpmH2zYUSRw+LdQtJd49x8bpsA=;
	b=fNjBMi49DffcjuDcRDSql6Db7i+ZWCIPT2qfb9Ynz18iz0uhfpKyLgs0/jAx4VnVA8JMNI
	frIwjtbTKeMGJY8JFUMAqaNXAmYnvfCPkvV3XUOOYY5ONBNm4CycR4Ax4O5Jolktb+hWWs
	09z3NrL/HOWTmjxTKrQ6herx1D4Dw4bQjEZ6czDBU5ePiI5I0huq9NrCBnWFhra38JhjGu
	bXWbNtPlFO2mvCfYgVvOF20D3GBrfY84ajqGsn82EDalrMPZ3s1Cmg0hvBdFSSirmvRerw
	ap/0NEpTdzq9gU5fEcLZAZFLMSWSPvzOVOwIZXEHc58jiZeMUp5fznWt2M4qWg==
Date: Mon, 13 Jan 2025 00:05:21 +0100
From: Alexandre Belloni <alexandre.belloni@bootlin.com>
To: linux-i3c@lists.infradead.org,
	Wolfram Sang <wsa+renesas@sang-engineering.com>
Cc: linux-kernel@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
	Guenter Roeck <linux@roeck-us.net>,
	Jean Delvare <jdelvare@suse.com>, linux-hwmon@vger.kernel.org,
	=?utf-8?Q?Przemys=C5=82aw?= Gaj <pgaj@cadence.com>,
	Rasmus Villemoes <linux@rasmusvillemoes.dk>,
	Yury Norov <yury.norov@gmail.com>
Subject: Re: [PATCH v4 0/5] i3c: introduce and use generic parity helper
Message-ID: <173672283106.1485431.11388441970924620736.b4-ty@bootlin.com>
References: <20250107090204.6593-1-wsa+renesas@sang-engineering.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250107090204.6593-1-wsa+renesas@sang-engineering.com>
X-GND-Sasl: alexandre.belloni@bootlin.com

On Tue, 07 Jan 2025 10:01:58 +0100, Wolfram Sang wrote:
> Changes since v3:
> 
> * updated commit message of patch 4 to state that a bug gets fixed.
> 
> All acks from bitmap.h and HWMON maintainers are already included.
> 
> Old coverletter follows:
> 
> [...]

Applied, thanks!

[1/5] bitops: add generic parity calculation for u8
      https://git.kernel.org/abelloni/c/c320592f3f2a
[2/5] hwmon: (spd5118) Use generic parity calculation
      https://git.kernel.org/abelloni/c/32a8d362b515
[3/5] i3c: dw: use parity8 helper instead of open coding it
      https://git.kernel.org/abelloni/c/e89cc14e96a9
[4/5] i3c: mipi-i3c-hci: use parity8 helper instead of open coding it
      https://git.kernel.org/abelloni/c/e55905a3f33c
[5/5] i3c: cdns: use parity8 helper instead of open coding it
      https://git.kernel.org/abelloni/c/5e8c732357ce

Best regards,

-- 
Alexandre Belloni, co-owner and COO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

