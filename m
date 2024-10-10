Return-Path: <linux-renesas-soc+bounces-9667-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id E6BBA998FAA
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 10 Oct 2024 20:18:47 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 8AA211C237F0
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 10 Oct 2024 18:18:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C3F6319F423;
	Thu, 10 Oct 2024 18:18:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=web.de header.i=markus.elfring@web.de header.b="WP1mZtQK"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mout.web.de (mout.web.de [217.72.192.78])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9E2CE4A15;
	Thu, 10 Oct 2024 18:18:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.72.192.78
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728584322; cv=none; b=UlNgq76hw7DySvvxVCv+igBGev15jP4U826LYjbNbCPH2/FMkj7ekNTT2V0qxguzEc+WLO6aNwdwNHgP04mfoEHqdg9XCXZpvRYU8Aa+NL3XjxBYTtYwN7/0PBiTCwyaqfExX/W9clyF7KymAaxaZPrKnVvbLOn6rMocQ2ieUp0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728584322; c=relaxed/simple;
	bh=tgZQ4s8ceb4szMBJodEy/aL4HGRWnU41wemrxVirK70=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=YWaW0/X/CCI7SSNsIQoNsdbFDR3GVo+qiWG/MhRO+DtkyH31yPsRX2kM9aJK+6mFENS0ahQQAHaOCsMd75cwHNgrEB4CmMYNjtAdzGX6B7lGOsBe7MI7K8fliLwurZqUDMTtlx9LOF6Pff9/L5zP9zl7W/3PZTOl9gFZfn8Kn/4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=web.de; spf=pass smtp.mailfrom=web.de; dkim=pass (2048-bit key) header.d=web.de header.i=markus.elfring@web.de header.b=WP1mZtQK; arc=none smtp.client-ip=217.72.192.78
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=web.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=web.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=web.de;
	s=s29768273; t=1728584298; x=1729189098; i=markus.elfring@web.de;
	bh=+eu8CANFZAzZ0HdPiYagsaWK/CoxSGXipiAOszYTXG0=;
	h=X-UI-Sender-Class:Message-ID:Date:MIME-Version:Subject:To:Cc:
	 References:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:cc:content-transfer-encoding:
	 content-type:date:from:message-id:mime-version:reply-to:subject:
	 to;
	b=WP1mZtQKRb2+qa6dEJR4S4sYW4/fhZsRofdL6wH9sxz9/FR2qiU75Q6LXQ2y7TUT
	 tltrcdbXEEy2iLKIAWzZakVHXgHYYKFgCMwm3zO6WZZjX9I3cO34rRq4/GYGVIjfh
	 JlV1jxP8VPDhRdGKu5mZr1QsA93SX0Xo6aOOcCfuZx9pRj2KUU4usN6Att3K3roIN
	 gZ0FnS2Lslyp7/x0UO2maD7K1Vhe5sFBR4QOHJXwBAV2ndUQFW+iecCmGh9HP6RWk
	 39vLLmn116HYapCDvppOuJ2lv2qt2LwF1F5JUMidRE/uNz2GASFO2wd8JIdp246F/
	 tQ3+pZeR0//3mpwpqw==
X-UI-Sender-Class: 814a7b36-bfc1-4dae-8640-3722d8ec6cd6
Received: from [192.168.178.21] ([94.31.81.95]) by smtp.web.de (mrweb106
 [213.165.67.124]) with ESMTPSA (Nemesis) id 1MuVKK-1tqVtg0SUE-00tSy2; Thu, 10
 Oct 2024 20:18:18 +0200
Message-ID: <fb7b687e-cca7-4888-8041-bdace6946a37@web.de>
Date: Thu, 10 Oct 2024 20:18:16 +0200
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3] irqchip/renesas-rzg2l: Fix missing put_device
To: Geert Uytterhoeven <geert@linux-m68k.org>,
 Fabrizio Castro <fabrizio.castro.jz@renesas.com>,
 linux-renesas-soc@vger.kernel.org
Cc: Geert Uytterhoeven <geert+renesas@glider.be>,
 Thomas Gleixner <tglx@linutronix.de>, LKML <linux-kernel@vger.kernel.org>,
 kernel-janitors@vger.kernel.org, Chris Paterson
 <Chris.Paterson2@renesas.com>, Biju Das <biju.das.jz@bp.renesas.com>,
 Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>,
 Marc Zyngier <maz@kernel.org>
References: <20241010164155.808931-1-fabrizio.castro.jz@renesas.com>
 <2e9bf925-8fcd-4e0b-bc3b-996fffc84681@web.de>
 <CAMuHMdWURj8YzXKbt74KqgEX5fc1ivg_4ctMxUy3QdJGipLuZA@mail.gmail.com>
Content-Language: en-GB
From: Markus Elfring <Markus.Elfring@web.de>
In-Reply-To: <CAMuHMdWURj8YzXKbt74KqgEX5fc1ivg_4ctMxUy3QdJGipLuZA@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:28yzoQPmGP4FHa6GOXNEcCsPJuJt2ZVJYXEmPJNZDR2DA6wfw3h
 o2ZknYUpu1uxQxPE3sNvXpG+UoUelRQ8Td0RUQba4T+lmZEg0mJK/Gwh+FJj+S6RZM12yEI
 uxAVFjwpOKVWD721+GpyAm982TShZHbP8yxTSSZjFWTGYljpzbpofLqie99BNhaDldCdTNz
 uszdYzGGXowRzXT8I00WQ==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:XlfypRD/Hy4=;W7RhW9m3uzHT6LhhGuPWZdsS5fi
 D3sFTv8TtNnQ9YZASa8C7G8QDomUUglMedVSbN4kwmjBdeIcVcujMzOUh5nOwGD00mfWsj8d1
 qQFidQLMDOjBFaXXC2RD/wJYOuOMPmkyGzcXV/bgoe8Wzerx75zCZw1yCNjnxdAgWnocmYy9D
 b04j8qz5pSKaUKspvjQQA69aYsp7K8pf1eGKLfpJOn3Eq4dqh56mbMQ8kLotwyYZt7hvaqfJm
 OBqNSNFkVyFtr6t9wkRi29rPsUj6twkH6QGr58ReyEzqSlC0vVy8HMswjB5BnsUlLPhbOmGju
 atcijpYCs39bPPD0yVK+qxpykgbMB/xr7y2O9Pp4P1evTF6/hadSXwxIgslW+THtsp8cFmDFR
 3bo5IROkyXG8D+LRW5ynh/G7vZeNw6s7RwBip/tTdIizQKXdsMqnr7saAPAJwwl/8ScrkvWhW
 o1d4j8ooNuHdshf7s9WvlSvHAEm0aog101C7t887WLmNqs+6Za5e3WibT0fzDNLv+eZAFkbZi
 9AXZu+4ruTHtQYItCdPAjMXB1U9JlC84rr++WYuT0tavDup7VPa03OV0yENfHCnJ0IqWzIhbS
 pFsSCd6ZG1vqBj5JAUWLZ5L6wb3NICVon+gMjH7zTJSI93Rz5aY2hbBnqC93sd+QWuuNMlCx2
 5Qyd55n2Juzja1Cdy0vNY86F17knCyvcZEX1HcuuyeQuzQecisaRqJ8pwmF6O91Z/bHyNNNg1
 Hb0wNxg7XxW0ooONcC5FWNCC/i2172vu05EbP8u8Td7Uv/8vuDENonpa6SOPFldPQRu0Gor2l
 bbQLnClagWqLMtoUmRHOEfBA==

>>> rzg2l_irqc_common_init calls of_find_device_by_node, but the
>>> corresponding put_device call is missing.
>>>
>>> Make sure we call put_device when failing.
>>>
>>> "make coccicheck" will complain about a missing put_device before
>>> successfully returning from rzg2l_irqc_common_init, however, that's
>>> a false positive.
>>>
>>> Fixes: 3fed09559cd8 ("irqchip: Add RZ/G2L IA55 Interrupt Controller dr=
iver")
>>
>> Might the application of scope-based resource management become more
>> interesting accordingly?
>
> No, as explained in the comments:
>
>>> +       /*
>>> +        * coccicheck complains about a missing put_device call before=
 returning, but it's a false
>>> +        * positive. We still need &pdev->dev after successfully retur=
ning from this function.
>>> +        */

Please reconsider the applicability of mentioned programming interfaces on=
ce more
(as an evolving software design alternative for goto chains).
https://elixir.bootlin.com/linux/v6.12-rc2/source/include/linux/device.h#L=
1239

Regards,
Markus

