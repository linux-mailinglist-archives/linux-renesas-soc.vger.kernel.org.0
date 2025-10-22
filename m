Return-Path: <linux-renesas-soc+bounces-23407-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [IPv6:2a01:60a::1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id 064E8BFA807
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 22 Oct 2025 09:19:28 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id A72B4346A97
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 22 Oct 2025 07:19:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 964142F5A24;
	Wed, 22 Oct 2025 07:19:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="VGidfkyF"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BF1A12F3C26;
	Wed, 22 Oct 2025 07:19:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761117564; cv=none; b=sE/dYYVmLdY9WNSfeSSN7lAKXfZ/daYw73A7W0SiikJY6jLZI5/mpwb7HGfQIm3AZ550FTokf0pC99YWTeRNxtipxVgjZEL1gRTYnY/eJM/SHpeZnwU6I/FB9qtb9oJR1uW5SDBErVzs6qYBpakuKa3tUnjfvNVt9hQi0489ji8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761117564; c=relaxed/simple;
	bh=Z8ZwCkSX/8/aiTv9fav6N9vdybzcbu6o+Lr/dVyzBMA=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=DhfeWhbRmLcrH/HPObjZMlPJjo3mMGbooBM8sKSkdY36rAfEaSAhS802RTjdU6MLozKljzO/0kPlDeTY7j179XVO22fuyELPlrHyyXg9iB11jcn5RoCnBAU98aVnOle7+DY6DsK7cfXvqpJ2/4qg89otXZFYSU//ti+PcpAl9gU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=VGidfkyF; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from [192.168.88.20] (91-158-153-178.elisa-laajakaista.fi [91.158.153.178])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 51037557;
	Wed, 22 Oct 2025 09:17:36 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1761117457;
	bh=Z8ZwCkSX/8/aiTv9fav6N9vdybzcbu6o+Lr/dVyzBMA=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=VGidfkyFdjQs4Xkqali8Z5l5zRQs85bEr4mlwVU2ttknMtDtwguMjyeHSHG0X1eeD
	 wvT4Av+FK9CL54YTcg8DLc+L0sXV9bvh2LV8Lmqk0KgDMEkEnYtrwfc364QUzjgNzX
	 0HBBULOj+w71ZBqFRWGz47VyKZDCtESJPW7L0HQo=
Message-ID: <626acab8-46ae-44cf-b9ef-0ac78d0954c9@ideasonboard.com>
Date: Wed, 22 Oct 2025 10:19:17 +0300
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 4/4] dt-bindings: display: bridge: renesas,dsi-csi2-tx:
 Allow panel@ subnode
To: Marek Vasut <marek.vasut@mailbox.org>, dri-devel@lists.freedesktop.org
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
 <7a159b09-d957-4d9b-9460-adf62df9a440@mailbox.org>
Content-Language: en-US
From: Tomi Valkeinen <tomi.valkeinen+renesas@ideasonboard.com>
In-Reply-To: <7a159b09-d957-4d9b-9460-adf62df9a440@mailbox.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi,

On 15/10/2025 17:09, Marek Vasut wrote:
> On 9/19/25 7:08 PM, Marek Vasut wrote:
> 
> Hello Tomi,
> 
>>>>> Ok. My point was just that the dsi-controller.yaml doesn't allow
>>>>> "bridge" node (you can just rename the panel to bridge to test). I
>>>>> thought someone (I just can't remember who was it =) will send a patch
>>>>> for it, but I think that hasn't happened.
>>>> Do you want me to drop the bridge part from the commit message (I
>>>> assume
>>>> yes) ?
>>>>
>>>> Any other change I should do before sending a V3 ?
>>>
>>> As we found out, this has been fixed in linux-next. For this, and the
>>> rest in this series:
>>>
>>> Reviewed-by: Tomi Valkeinen <tomi.valkeinen+renesas@ideasonboard.com>
>>
>> Understood, thank you.
> Do you think this 4/4 can now be applied ? The rest already is.

Pushed to drm-misc-next.

 Tomi


