Return-Path: <linux-renesas-soc+bounces-25752-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id E704FCBD16F
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 15 Dec 2025 10:03:28 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 8BD29300646A
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 15 Dec 2025 09:03:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F1B98329C74;
	Mon, 15 Dec 2025 09:03:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=microchip.com header.i=@microchip.com header.b="O2Eeatvg"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from esa.microchip.iphmx.com (esa.microchip.iphmx.com [68.232.154.123])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 396B23168F8;
	Mon, 15 Dec 2025 09:03:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=68.232.154.123
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765789404; cv=none; b=bIPTicitNbXEn/dSA/7oD+yzJldQf18p9WNRBnu9xfyA+Qlc/F795nIwOv6SBesKH6rrSUo+cFRCFFWornvxgXZeXbh9DxWfw+qAT4yHB5ER2NkN/jr4LLYF3HFHm+Am5FnIidS9lIQEvQRa2yX//mNRauv0WNqGc2pOPRUlhpU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765789404; c=relaxed/simple;
	bh=DYuEDXxxQwHvC4lI/FenVDoXRgqfrlpjK+/ONxLKFbQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=RXguyS6BwbxZT/TNsnokYD7PTsMCGxFpmQNHBdNvQvq77RssHLKVzPXq0J2XgEZ/gWwMcn1oxe0rU6HdDHuNEcpmqWAYnPVAWu1PRyRPgTlpt6VRNBN/nxUyTHRXjuyTVlgchCx4NOlFgHfD059pPsonG3o+d1RizhEJOI94BI4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=microchip.com; spf=pass smtp.mailfrom=microchip.com; dkim=pass (2048-bit key) header.d=microchip.com header.i=@microchip.com header.b=O2Eeatvg; arc=none smtp.client-ip=68.232.154.123
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=microchip.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=microchip.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1765789403; x=1797325403;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=DYuEDXxxQwHvC4lI/FenVDoXRgqfrlpjK+/ONxLKFbQ=;
  b=O2EeatvgysPccmWNbZ+Pk9a7ZfbEjYimEZoRuE+vbc3eKQr5K5dkM8vj
   5JweZUbfCMJWs7ubaKT/Romtd8Es7eu4aKB9D+j/e0BsQWMs8Fgj0kVrc
   MX+7yOhlbK5oG8txqO2mgGjtJ0T0OT0vnTq0vkLyJEj3OH1FCoM2kwM8g
   KMEKovcJ2y+vY5Fh6IfP1PWEoIu4KFLqLA5Q72n9SsZ7CIbZBQYYgMTIK
   OsOxedYGvJtAIjjLVXWfd5JvDvr7u96ZsQZXLj343YXyYS4ffJgob/16o
   /83g/SkNo56lezn43K2pXntkAGGlzSRjmZHOGUT+pK8q5+xzKpEdUXuZ5
   g==;
X-CSE-ConnectionGUID: YyHp0N6PScmqn7V/vLHJ2Q==
X-CSE-MsgGUID: IVipBb0SRZWUaB0w29GKSQ==
X-IronPort-AV: E=Sophos;i="6.21,150,1763449200"; 
   d="scan'208";a="49860825"
X-Amp-Result: SKIPPED(no attachment in message)
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa4.microchip.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256; 15 Dec 2025 02:03:16 -0700
Received: from chn-vm-ex02.mchp-main.com (10.10.87.72) by
 chn-vm-ex02.mchp-main.com (10.10.87.72) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.58; Mon, 15 Dec 2025 02:02:58 -0700
Received: from [10.159.245.205] (10.10.85.11) by chn-vm-ex02.mchp-main.com
 (10.10.85.144) with Microsoft SMTP Server id 15.1.2507.58 via Frontend
 Transport; Mon, 15 Dec 2025 02:02:56 -0700
Message-ID: <0ec01064-2755-401a-b2c8-76ad6ce686af@microchip.com>
Date: Mon, 15 Dec 2025 10:02:56 +0100
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] ARM: dts: microchip: Drop usb_a9g20-dab-mmx.dtsi
To: Alexandre Belloni <alexandre.belloni@bootlin.com>, Wolfram Sang
	<wsa+renesas@sang-engineering.com>
CC: "Rob Herring (Arm)" <robh@kernel.org>, Geert Uytterhoeven
	<geert+renesas@glider.be>, Magnus Damm <magnus.damm@gmail.com>, Krzysztof
 Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Claudiu
 Beznea <claudiu.beznea@tuxon.dev>, <linux-renesas-soc@vger.kernel.org>,
	<devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
	<linux-arm-kernel@lists.infradead.org>
References: <20251212203226.458694-8-robh@kernel.org>
 <aTytWyyZiYFnyauo@shikoro> <20251213010934353f1efe@mail.local>
From: Nicolas Ferre <nicolas.ferre@microchip.com>
Content-Language: en-US, fr
Organization: microchip
In-Reply-To: <20251213010934353f1efe@mail.local>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit

On 13/12/2025 at 02:09, Alexandre Belloni wrote:
> EXTERNAL EMAIL: Do not click links or open attachments unless you know the content is safe
> 
> On 13/12/2025 09:03:39+0900, Wolfram Sang wrote:
>> On Fri, Dec 12, 2025 at 02:32:14PM -0600, Rob Herring (Arm) wrote:
>>> This .dtsi file is not included anywhere in the tree and can't be
>>> tested.
>>>
>>> Signed-off-by: Rob Herring (Arm) <robh@kernel.org>
>>
>> Nowadays, this should be a dtso which did not exist back then. Is it
>> okay to convert it? Yes, I can do this.
>>
> 
> I don't think this will be missed by anyone. Unless you actually have
> one of the boards, I would simply drop this.

+1

Regards,
   Nicolas

