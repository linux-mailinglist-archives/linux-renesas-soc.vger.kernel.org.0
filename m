Return-Path: <linux-renesas-soc+bounces-9665-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 0C49D998F06
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 10 Oct 2024 19:57:26 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 073BDB2ADB1
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 10 Oct 2024 17:55:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8030B1CEACA;
	Thu, 10 Oct 2024 17:53:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=web.de header.i=markus.elfring@web.de header.b="o8G/lQSb"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mout.web.de (mout.web.de [217.72.192.78])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 24A9919ABC4;
	Thu, 10 Oct 2024 17:53:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.72.192.78
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728582830; cv=none; b=JbGwCneGWv/SV4EUTw8KpLwc6011NQ97sNyWkTrqkpFPmIF+f0aOts2o/5kgFSIYBuFVN0LvcC/sNgjpcehB82uuZISqFMfyEU6eSCApp0NWmpG7zgSZ/al0oOAq3U5isGNWqLGfpmfdUqWBUxJ72BYgkUjMWgIx1iO3HanMmQs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728582830; c=relaxed/simple;
	bh=0X0YxQOa1OiKz8GaWTAGs9aM+4QyEcL7l+GVc39WZ90=;
	h=Message-ID:Date:MIME-Version:To:Cc:References:Subject:From:
	 In-Reply-To:Content-Type; b=lMjWB3FtF8QtdPJmczRVJhoXwadHx858oIhaMfC+g4w1VyOHKtO6I6TbgVVLUAtZ7gwZRuRuItOggJ5O3hGOAneDbwywh3i1N7iWLJa0LYBeqDxom1MuuM6c1EVfah/1eN2SrWme6lnWxMAfX02Nu7/qbYWFnZ6egHNSHazOXio=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=web.de; spf=pass smtp.mailfrom=web.de; dkim=pass (2048-bit key) header.d=web.de header.i=markus.elfring@web.de header.b=o8G/lQSb; arc=none smtp.client-ip=217.72.192.78
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=web.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=web.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=web.de;
	s=s29768273; t=1728582798; x=1729187598; i=markus.elfring@web.de;
	bh=0X0YxQOa1OiKz8GaWTAGs9aM+4QyEcL7l+GVc39WZ90=;
	h=X-UI-Sender-Class:Message-ID:Date:MIME-Version:To:Cc:References:
	 Subject:From:In-Reply-To:Content-Type:Content-Transfer-Encoding:
	 cc:content-transfer-encoding:content-type:date:from:message-id:
	 mime-version:reply-to:subject:to;
	b=o8G/lQSby+kI/KFQK+a4EatTl5yyCISPQqaIsLREOJlU06RZqWasBhATU6Itec8k
	 w3q1j6njrvqKU58xdSspUWhSTWF9rq04VKVhw6llSvTnFzt/Lssoxm78McCSa3P8h
	 Fn4hBVsC0zCNNGZ3LWoZZRFbuDLTdfuKU/UDSXhRFRfjh+hqgBiA4ZmuTxAZc2vyx
	 YiyL8YeUWHYrccQ4YrhcffUctPIiBGLcZpGu9gIURlwWQTtmL1+yuCkrLrTxxDNtT
	 US8v5HAXP1L5h/uhmFZmKY2etVWrzRIYFW7kRmsqchHiRl1umDqIDijVOEgUg7pPj
	 BZJAZadvK58uZZ4p/Q==
X-UI-Sender-Class: 814a7b36-bfc1-4dae-8640-3722d8ec6cd6
Received: from [192.168.178.21] ([94.31.81.95]) by smtp.web.de (mrweb105
 [213.165.67.124]) with ESMTPSA (Nemesis) id 1Mo6Nt-1tk90n1Y55-00nwpD; Thu, 10
 Oct 2024 19:53:18 +0200
Message-ID: <2e9bf925-8fcd-4e0b-bc3b-996fffc84681@web.de>
Date: Thu, 10 Oct 2024 19:53:07 +0200
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Fabrizio Castro <fabrizio.castro.jz@renesas.com>,
 linux-renesas-soc@vger.kernel.org,
 Geert Uytterhoeven <geert+renesas@glider.be>,
 Thomas Gleixner <tglx@linutronix.de>
Cc: LKML <linux-kernel@vger.kernel.org>, kernel-janitors@vger.kernel.org,
 Chris Paterson <Chris.Paterson2@renesas.com>,
 Biju Das <biju.das.jz@bp.renesas.com>,
 Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>,
 Marc Zyngier <maz@kernel.org>
References: <20241010164155.808931-1-fabrizio.castro.jz@renesas.com>
Subject: Re: [PATCH v3] irqchip/renesas-rzg2l: Fix missing put_device
Content-Language: en-GB
From: Markus Elfring <Markus.Elfring@web.de>
In-Reply-To: <20241010164155.808931-1-fabrizio.castro.jz@renesas.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:s+TRnpRKUTP3hwfWpBXDjBOmuWLFr19ZgrbHGsfejHIjDC69MFg
 TU/aRWZaxMclBMEPw4FjVcW8cmW5PBZBFpxXV7FBYv7cgH8Gl/qxfXCoI88M+9o9eEgUmf6
 ndLwLKIWe/nD9Vdrx+bgQcas9oOmlfWM2QwRjh910aEayH6BDRNMaeajPaaoFB/LBvK+uP3
 ur90hvX8gP2dfeg38cQFg==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:gzhvEgWo+Lc=;VjKUM2vSEQaVYzkPO9vwP1PWP4O
 mZdBbCdTJpf7yTuBfBll/Ir6FX/jgdDGyP0lJ57JlqTRauoTqK3sKCx5hoWUVaI2b9Zn2UULE
 CzPnvzqYc0ZrUuBscLOsk/2PMpm9AEhBhCLQ51OtF1QrZr15gyLV0jVWuDXAUiziFa84QCXr0
 r5QYoisM0zhTPRzX6th0k3BbR4IZQZC/Y8zOSSJe2VJOw8qW9G01+ccggVSe0g7vajWUaHRil
 Jl8/kgFO+++C9Zl8MsQpU5Yko+JUNWq42jBmOdeqllMumbYFIPaz4qxHRkpRVsr/4VNs5bUCo
 W15TMDqk4a/retiXz1LDjUif3djkean8dEBGM9S665XogUIc+C949vj//cIr8s1//5B3dOtwz
 QzCO8aU3AvkjM1labH1no6fE3jvzY1k3FTpUH+OIrzvpXmb8Bm5O7Ikzz/dLvcGk1hrWeTux/
 bh+oJtr8Hh3Bo69/dNOfe94//LXbNda2Qqqf3FTKW8WYXzHD4dlKFl/J9eKUKRqR0oNG+SXOc
 vs2MpBqUVqDR6I6RmzF/KoGS367kz+br5TJgkpS6MP6fv9PKUzuOE5hsl+Uw5qNpy/YY4iqbT
 OUOTlNxWDnGWf76l6gPCIxVRWbcKUB/Oqmq+/2FFsV0Iv3HNAqKFUfNlL3ZHZoI2Ljh+7JoTn
 X+3rYQE2mmLAJyfCSumCj7RTl6qMS6YM1ek+hLR2kd33Q3MhQD6hcuhBBf5LQM8RAQ0dV9P+5
 HByEaCmaF3rDfE0hafpJs5Nqdi0xB5eJsC819k2Oz5i0d4yZOOFi4nYlEgw+GqWTy1/xGQgKd
 1xtIO5LvFaWjg6Rs/fBKlymg==

> rzg2l_irqc_common_init calls of_find_device_by_node, but the
> corresponding put_device call is missing.
>
> Make sure we call put_device when failing.
>
> "make coccicheck" will complain about a missing put_device before
> successfully returning from rzg2l_irqc_common_init, however, that's
> a false positive.
>
> Fixes: 3fed09559cd8 ("irqchip: Add RZ/G2L IA55 Interrupt Controller driv=
er")

Might the application of scope-based resource management become more
interesting accordingly?

Regards,
Markus

