Return-Path: <linux-renesas-soc+bounces-23066-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 2D95EBDEF0E
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 15 Oct 2025 16:11:00 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 987603B8C97
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 15 Oct 2025 14:09:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4A1E224C068;
	Wed, 15 Oct 2025 14:09:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b="ApJoSdLY"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mout-p-102.mailbox.org (mout-p-102.mailbox.org [80.241.56.152])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 54BBB23BD06;
	Wed, 15 Oct 2025 14:09:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=80.241.56.152
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760537353; cv=none; b=Rr1KsgGUMUFYPnmHZZux1lRc5vOxh7o1y9A+82e6/gUUqEJLhkwCHvpCrl4D6HKZwgDw4sptl3mTy0hiVIRFb/waZqE0Li5kWN+9NteFf8G27scfc3zhKWt4BmbDBhaF2kdoPmbWqTZXn/bO1/A5fFMVNpGJKXnnRCFE8vKmjsQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760537353; c=relaxed/simple;
	bh=/AMU1FOYMJs4Nb4ZF4Qzj51fmvWaGBlcXl+yppUas6s=;
	h=Message-ID:Date:MIME-Version:Subject:From:To:Cc:References:
	 In-Reply-To:Content-Type; b=kRQNsF1GSl7HRlsVd10geFl+1ZmOzuGtuhTbKc3tH9BYYJkvsO+l1Y01PK/yaEdERlgtitUVI/bvIGcPXCMnRrPU9mbvo8GqbyNAnh9ktYi2dRIHKvJQv8yFIrHpBE1+coqs3/IxJpmOamiSgazSWlWDCsKbFiyIzih8mFYrLa0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mailbox.org; spf=pass smtp.mailfrom=mailbox.org; dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b=ApJoSdLY; arc=none smtp.client-ip=80.241.56.152
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mailbox.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mailbox.org
Received: from smtp2.mailbox.org (smtp2.mailbox.org [IPv6:2001:67c:2050:b231:465::2])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mout-p-102.mailbox.org (Postfix) with ESMTPS id 4cmtHR3qS6z9v5D;
	Wed, 15 Oct 2025 16:09:07 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org; s=mail20150812;
	t=1760537347;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Xe4Cg3XHk9WX/sshl/sHtnnh4SOJatS1Nt7rugFQLpk=;
	b=ApJoSdLY1bjutb57XiLr/4vKS33N2MbZIv+lzF1Tw1O3KqYimZORZhsAxQ1BbzIgaxj5Mi
	zPp+7ZP10rLlK+K5udsvhPAXN0avGNSL9X0PFnbvvcUgT98cKSU0Lr2+C1QfLQkeiOXns/
	6U+W20WlAv9r7In95ZSwJxETQqxmUiQzAqnZB9pqJr/mbcfEiv1HP2mn9oSzVhfTpqJOD0
	83JRyg3aO2qnNmNnmKxNXBvA4JiShfkPf2rH4WK1LGkTI1pv9k6H+lZKCxXqqh+g+UPkTi
	9zoYnBAV0KrxNf8z0Jv/Qpc1g6CSjFrdvPE7BhTo7Wn/MnQrIuX8yRoaKs4mvA==
Message-ID: <7a159b09-d957-4d9b-9460-adf62df9a440@mailbox.org>
Date: Wed, 15 Oct 2025 16:09:03 +0200
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Subject: Re: [PATCH v2 4/4] dt-bindings: display: bridge: renesas,dsi-csi2-tx:
 Allow panel@ subnode
From: Marek Vasut <marek.vasut@mailbox.org>
To: Tomi Valkeinen <tomi.valkeinen+renesas@ideasonboard.com>,
 dri-devel@lists.freedesktop.org
Cc: Conor Dooley <conor+dt@kernel.org>, David Airlie <airlied@gmail.com>,
 Geert Uytterhoeven <geert+renesas@glider.be>,
 Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>,
 Neil Armstrong <neil.armstrong@linaro.org>, Rob Herring <robh@kernel.org>,
 Robert Foss <rfoss@kernel.org>, Simona Vetter <simona@ffwll.ch>,
 Thomas Zimmermann <tzimmermann@suse.de>, devicetree@vger.kernel.org,
 linux-renesas-soc@vger.kernel.org
References: <20250904210147.186728-1-marek.vasut+renesas@mailbox.org>
 <20250904210147.186728-4-marek.vasut+renesas@mailbox.org>
 <4ffcf4fc-17a9-4669-af07-f81ddb46aee9@ideasonboard.com>
 <d76ff19c-7b0f-4aa9-8ae2-d08c82d70410@mailbox.org>
 <aebc10ec-73ed-4843-95c5-9ba5a2759ccb@ideasonboard.com>
 <b4c0e78a-eecb-4a18-9199-18ea91c8df31@mailbox.org>
 <2da374d1-7557-4f7e-9160-86945b73731a@ideasonboard.com>
 <14e5da7c-c6ce-4bb6-884b-08629f5a5788@mailbox.org>
Content-Language: en-US
In-Reply-To: <14e5da7c-c6ce-4bb6-884b-08629f5a5788@mailbox.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-MBO-RS-ID: 0fb8f56894de275614b
X-MBO-RS-META: g54wzxtnzjkakehm6fai3y4gtt1n71h4

On 9/19/25 7:08 PM, Marek Vasut wrote:

Hello Tomi,

>>>> Ok. My point was just that the dsi-controller.yaml doesn't allow
>>>> "bridge" node (you can just rename the panel to bridge to test). I
>>>> thought someone (I just can't remember who was it =) will send a patch
>>>> for it, but I think that hasn't happened.
>>> Do you want me to drop the bridge part from the commit message (I assume
>>> yes) ?
>>>
>>> Any other change I should do before sending a V3 ?
>>
>> As we found out, this has been fixed in linux-next. For this, and the
>> rest in this series:
>>
>> Reviewed-by: Tomi Valkeinen <tomi.valkeinen+renesas@ideasonboard.com>
> 
> Understood, thank you.
Do you think this 4/4 can now be applied ? The rest already is.

Thank you

