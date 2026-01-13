Return-Path: <linux-renesas-soc+bounces-26674-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 7130FD1928D
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 13 Jan 2026 14:50:18 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 02C503025A7E
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 13 Jan 2026 13:46:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6C6192773CB;
	Tue, 13 Jan 2026 13:46:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b="mZ6EEVYi"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mout-p-201.mailbox.org (mout-p-201.mailbox.org [80.241.56.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4DC461509AB;
	Tue, 13 Jan 2026 13:46:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=80.241.56.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768311994; cv=none; b=uBzghOEkq7W7LjA91uCHqDJHJMGlzbCqHFyteWMHjTzNcDhdRBHvrSGihy/+HllxqdyzZQz/OPynvzn98cCH9kkpCzwo+Wjx0FD2YPlg/JSrtBG9tStAout+h4F2UMbAAU7ziYBiJkkfgOibdGll8Ia33prxEaxcu6NsYwfcLGU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768311994; c=relaxed/simple;
	bh=B1XKwTriXAjAkyFzryOp2BYHFzaZSQFWOI/BybvyBYw=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=JRBbgTlOUCKBGQ8XnJEQqvKGqpNSKKDlqstTz0VV5xPZtnNvu7Kwb7GH6SKkHKxmzQbFCFzVL7T+LXfBuNIAQCa0NRKEcNibr+YnVSdNc+exm/BDKOOJ5DX9nO0PH724weMk52Z1iGWugYT+2AKhFRb8iXo/W8OUguc1a+OcpVg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mailbox.org; spf=pass smtp.mailfrom=mailbox.org; dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b=mZ6EEVYi; arc=none smtp.client-ip=80.241.56.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mailbox.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mailbox.org
Received: from smtp202.mailbox.org (smtp202.mailbox.org [10.196.197.202])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mout-p-201.mailbox.org (Postfix) with ESMTPS id 4dr9Wl230xz9tbf;
	Tue, 13 Jan 2026 14:46:27 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org; s=mail20150812;
	t=1768311987;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=9ruF/DsgLWD0LRXxihhCM3ESkEbVG3zR2tbPJGjW51E=;
	b=mZ6EEVYiZBBXdssndtpObyqnE1uihRU40kAdZos5gzlOWVPeu5Lq4cNGqaZgKTJ6p99jxz
	7DyKSFZxk5a3Jq/KRvd8AVUW0KtjzwRQHkIJpto/M+PWwKWXYwXP1xgiQu1obNaxunmqF0
	e1J4M0N+0znpD2GSehQI4mFwXtneGvZjD004PeWZ1k5eqWOO1dlGTk0PDc4nYKqRDR+DBp
	6QSKDeT+nDTR+Z4h7ugsUvH2iy1P1AZKRN/pE3k8KnqSqfcinYJ0XhuTpFNkYu8JOmAwtJ
	vnNKTNQHvYIk2qx02zy3RhtTSkpj9rjnS9EZfbLf6mKCS7mAlwnj/f7lwY8Axw==
Message-ID: <16413d54-ee02-4939-af51-d7f9ab0404f7@mailbox.org>
Date: Tue, 13 Jan 2026 14:46:21 +0100
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Subject: Re: [PATCH 1/2] dt-bindings: display: panel: Fork Waveshare panels
 into separate document
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: linux-arm-kernel@lists.infradead.org, Conor Dooley <conor+dt@kernel.org>,
 David Airlie <airlied@gmail.com>,
 Geert Uytterhoeven <geert+renesas@glider.be>,
 Jessica Zhang <jesszhan0024@gmail.com>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Magnus Damm <magnus.damm@gmail.com>, Maxime Ripard <mripard@kernel.org>,
 Neil Armstrong <neil.armstrong@linaro.org>, Rob Herring <robh@kernel.org>,
 Sam Ravnborg <sam@ravnborg.org>, Simona Vetter <simona@ffwll.ch>,
 Thierry Reding <thierry.reding@gmail.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, devicetree@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 linux-renesas-soc@vger.kernel.org
References: <20260113000715.231238-1-marek.vasut+renesas@mailbox.org>
 <CAMuHMdVGsfCTzSSjh474Ohimad2W5h1Z=vNhS6zU=Lb9f5Zbxw@mail.gmail.com>
Content-Language: en-US
From: Marek Vasut <marek.vasut@mailbox.org>
In-Reply-To: <CAMuHMdVGsfCTzSSjh474Ohimad2W5h1Z=vNhS6zU=Lb9f5Zbxw@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-MBO-RS-ID: 588823f942cb957b9f4
X-MBO-RS-META: nhcdrwhot3odx4wmekmq13qmg4s4teu5

On 1/13/26 10:13 AM, Geert Uytterhoeven wrote:

Hello Geert,

>> --- /dev/null
>> +++ b/Documentation/devicetree/bindings/display/panel/waveshare,dpi.yaml
>> @@ -0,0 +1,32 @@
>> +# SPDX-License-Identifier: GPL-2.0
> 
> scripts/checkpatch.pl:
> 
>      WARNING: DT binding documents should be licensed (GPL-2.0-only OR
> BSD-2-Clause)
>      #68: FILE: Documentation/devicetree/bindings/display/panel/waveshare,dpi.yaml:1:
Sigh, fixed in V2, thanks .

I'll send V2 in a few days to get some feedback on 2/2 first.

