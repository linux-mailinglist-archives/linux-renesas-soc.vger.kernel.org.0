Return-Path: <linux-renesas-soc+bounces-9797-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 02C9B9A05C2
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 16 Oct 2024 11:39:10 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id B7FF1286CA7
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 16 Oct 2024 09:39:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 20442205E35;
	Wed, 16 Oct 2024 09:38:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=web.de header.i=markus.elfring@web.de header.b="LwoRvWZS"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mout.web.de (mout.web.de [212.227.15.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A491D205E11;
	Wed, 16 Oct 2024 09:38:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=212.227.15.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729071538; cv=none; b=hP8aP7nFCu2DOYY17w+j2tvMunOchlBS0pQ9+eshyr8CSjBWHB6pJLkHzsXjfvoPWsHaFmt6bPqg6i95f7FflDOqZjTh6YMB6AXjviz/pvADPFGxZmWQKU6fCNN5moyXeOn8DKIYSqE3TKMbNNc+PJj7+NKWE3TCF30i5Zpnhmg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729071538; c=relaxed/simple;
	bh=1qNWlha39QPc1Ly/s5ajEd47r0N517ph0wNTDjVEGDM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=jlA53aqhz2omDlOu1pV/gKm+Fkr+3ERNzPNTmkhNKwFwXo1L6G15jDBc6iWzzNk9On2gXQPrstovEFnh5fWk68c6ISB1SWM8eBbVTb4IoLlnz68oztsEAmj2sIf409/YZQ69cmN+oRjHYop0Jg+vvuhmLUY2JjIU+VDYLba9A/A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=web.de; spf=pass smtp.mailfrom=web.de; dkim=pass (2048-bit key) header.d=web.de header.i=markus.elfring@web.de header.b=LwoRvWZS; arc=none smtp.client-ip=212.227.15.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=web.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=web.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=web.de;
	s=s29768273; t=1729071498; x=1729676298; i=markus.elfring@web.de;
	bh=1qNWlha39QPc1Ly/s5ajEd47r0N517ph0wNTDjVEGDM=;
	h=X-UI-Sender-Class:Message-ID:Date:MIME-Version:Subject:To:Cc:
	 References:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:cc:content-transfer-encoding:
	 content-type:date:from:message-id:mime-version:reply-to:subject:
	 to;
	b=LwoRvWZSkfYs01v5E531zNKtNo+U4LRmyxrCZ5iGIwD6/QoXI7YpBJSjrEayxmMg
	 aTxyoA7HWHib3HhIBehoteteCMXTGBufoyOMPCTxeR5vt9NzjORjG6hVE2wc+/w9a
	 N5bUg59sgEXdb7xsLWX7b/NIvDwf3VwaxGcL2EZ+59l80WSjxg9IICUJMIwR8cmfJ
	 9hbBjKQNIdpGC4SB+MxDw7B85bCzm8A47w6Sp61kHY+aUmA/GG3Br3eTpD/8U7XnM
	 f2LsU+wY72NgfMzbqyQPVvsxSRnHFcvgmdTaGDPlFNTvMkkuCSiDKXvJRZN9XBtM/
	 Xf1SDwOfsXUUCfBmdQ==
X-UI-Sender-Class: 814a7b36-bfc1-4dae-8640-3722d8ec6cd6
Received: from [192.168.178.21] ([94.31.89.95]) by smtp.web.de (mrweb005
 [213.165.67.108]) with ESMTPSA (Nemesis) id 1N7QUL-1u1PBE4Bav-017oVD; Wed, 16
 Oct 2024 11:38:18 +0200
Message-ID: <692cabd4-038b-403a-b21e-69a2b0492e57@web.de>
Date: Wed, 16 Oct 2024 11:38:08 +0200
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [v4] irqchip/renesas-rzg2l: Fix missing put_device
To: Thomas Gleixner <tglx@linutronix.de>,
 Fabrizio Castro <fabrizio.castro.jz@renesas.com>,
 linux-renesas-soc@vger.kernel.org,
 Geert Uytterhoeven <geert+renesas@glider.be>
Cc: LKML <linux-kernel@vger.kernel.org>, kernel-janitors@vger.kernel.org,
 Biju Das <biju.das.jz@bp.renesas.com>,
 Chris Paterson <Chris.Paterson2@renesas.com>,
 Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>,
 Marc Zyngier <maz@kernel.org>
References: <20241011172003.1242841-1-fabrizio.castro.jz@renesas.com>
 <663a37fe-ffc4-4826-b8ba-bcefdb0e7992@web.de> <871q0hdofq.ffs@tglx>
Content-Language: en-GB
From: Markus Elfring <Markus.Elfring@web.de>
In-Reply-To: <871q0hdofq.ffs@tglx>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:dpzg1uJ8a44W5ottMAMvWnOcF5NjfXFRWQXFJuNIHmHtUgJ95iN
 doSeAhykY7I0vmCWQjcEbraTPtQfYDyqZF0gALjYTb7gZgYDqHY4/jz5xJkIzYw7a3vXXDF
 Ki/JmxN6diSQ9rgCsiD4B8xjNAdzmspIG3JpfLud9KsetK9gg4E/dFcZEsKjjJYfbQqTb0Y
 kkF8xxsHekS/bhGLZviIg==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:WCpCtI+ZGXk=;VKAI/nwgqM+VAvtPWbWeIeR8xjr
 NIKQaAIHIz7Jz5a2B8YNWTvJ+mvRWMKPwqgbc2OM5e/t2syW+W/pVl0zgB34WXK3K+F6hj1EC
 U0m53CsivrsXWzeR2UtxTpMo/7820I2UuLIEOMf8qRY7jQyvLxmZ6ietLjONBoUYqenX9U3FK
 MCzZM2Gvs7AKN249p0/WYbYOP+8DHCbsTBJAHHIuHH/m3eS4EfUTIKzvNJqjJ2eW+fWdNayVo
 ppdIYx4g7yz9ARJojW2Bvb3xFIGOqme50hAf2FkvQFJtfKZjlfZmzJ5sKUYOOvMVhgRXB6eBo
 HoPd/BhnoNNquAl4lI689HLP27J/Puk9wan2wBxa1MB5ka6UnjT6vup6zknPEj3iGa+tbzBbN
 hHe0/unIhqsCrJvxOJ1Tp/MrXK7h9pzoqLqmYJOFkuVE0VR1zu6GNLQOK/xYBrIwdQeTfrgCM
 gipM7xtnWA2qqE4Zc34e2gOsEDLOxdRBikb7LK5bulD48CyrBvXMiBjTSmw9R3vB6piJ8yxuM
 FxXUO6DanGZOhAG03dF7MDGN2DEGgb6O4coa26m6eUlTANbTZUfb9U8NR09+oInU+jX1vbtDp
 O6f2ELRpWjgMBZA+abJxF/lopMP1nxdCUG9gYOOYDUmPYhdvFcpK+e+a0ZeXA3Cn81whebs8x
 GFuFFNdt3KQFZF/DqwAzN5xQWo/PixXHFLUd5K2JENWtEjrZq56NMbz5jpNAvBppwhl1NIpFB
 PVK0BAraBn6EpQdvVf1Ds+gMSbAR64PhU7DRKCU1HffRMEzUWcRrRA5Is5Omp+cJORIl3lHjo
 mBsffrvWgh+sGKIG0BWQvwNQ==

>>> rzg2l_irqc_common_init calls of_find_device_by_node, but the
>>> corresponding put_device call is missing.
=E2=80=A6
>>> Make use of the cleanup interfaces from cleanup.h to call into
>>> __free_put_device (which in turn calls into put_device) when
>>
>> Can it help to influence the understanding of this programming
>> interface by mentioning the usage of a special attribute?
>
> Can you please stop pestering people with incomprehensible word salad?

Which patch review comments would you find more appropriate here?


>>> leaving function rzg2l_irqc_common_init and variable "dev" goes
>>> out of scope.
>>>
>>> Mind that we don't want to "put" "dev" when rzg2l_irqc_common_init
>>> completes successfully, therefore assign NULL to "dev" to prevent
>>> __free_put_device from calling into put_device within the successful
>>> path.
>>
>> Will further software design options become applicable here?
>>
>> Can any pointer type be used for the return value
>> (instead of the data type =E2=80=9Cint=E2=80=9D)?
>
> How is this relevant here?

I imagine that the usage of error pointers can occasionally be helpful
for such programming interfaces.


>>> "make coccicheck" will still complain about missing put_device calls,
>>> but those are false positives now.
>>
>> Would you like to discuss any adjustment possibilities for this
>> development tool?
>
> Would you like to get useful work done insteead of telling everyone what
> to do? There is nothing to discuss.

I got other impressions for corresponding development opportunities.


> But this change fixes a bug and that's it.

Maybe.


> We are not doing cleanups in a bug fix.

Additional adjustments can be offered in subsequent update steps
(within a patch series?).

Regards,
Markus

