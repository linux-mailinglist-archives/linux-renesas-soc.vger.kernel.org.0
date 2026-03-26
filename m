Return-Path: <linux-renesas-soc+bounces-30321-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id eFBTINcBxWlZ5gQAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-30321-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 26 Mar 2026 10:52:23 +0100
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id D4F2A332AD5
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 26 Mar 2026 10:52:22 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 02E9D312BEFD
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 26 Mar 2026 09:44:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AA91837CD24;
	Thu, 26 Mar 2026 09:44:20 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-vk1-f172.google.com (mail-vk1-f172.google.com [209.85.221.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DF80437DEA0
	for <linux-renesas-soc@vger.kernel.org>; Thu, 26 Mar 2026 09:44:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774518260; cv=none; b=b0pGQRQ7V+HWIG3RR0T0lDPEvxCdnmXRAjFg4yWYFCScPvNhvH6zGU7f1cUeX/yOH1In3H1OiyfPJPTQFt4EaayiM+0qPL6Hd5AZBb2fKU0bSHXxZWXbagHZ6wBlzgKcfe4OX0VsYjvaDvSlkOcx3UmHRcfYm0wx6y4ShBR+oCc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774518260; c=relaxed/simple;
	bh=R3cKDJFdV1o0Z9LWC1jP8EKrlGtKAxcQyYi3Y/CIRxM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=KJ8xXTtP3N+SbfoLL2LhoaEnPnLMxarhsgCCHMdwhNRBqpteJ48dzi7EJI/qKxpPRgN6Vs8t2WTUwMNIKvO63q2OE6UUy9vvxIdHHRxjBawAh/Oh+9GrHw60URRDS2yL8T8o7rtQcmNblfuUhdoZidDhdBXt5bdig7bau22uMlM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.221.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vk1-f172.google.com with SMTP id 71dfb90a1353d-56a86f0a23bso757600e0c.0
        for <linux-renesas-soc@vger.kernel.org>; Thu, 26 Mar 2026 02:44:17 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774518257; x=1775123057;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=NLLjfS5BvDFcvjGePocKuzlspinwqEnC95/6wgf9NSk=;
        b=L9y9ypgVGmEdFr8QRmKmJKBYZaIONmQQmc2aYtYNYofudbDymu0OnXabcvOHnxC/fo
         SIUoI+eFfkV2O+TfOJJX/sQOFerjLfykVtUADWzeTy92uDZgNzIX5t34OQHUpexnWcxh
         Gw5rENmT3PIF9Ba3URgQLbHYmodbjh3Xeo/hKid4YhTilPFHs5fRP3VUcM6ARQnHkRM7
         N8+rdrfEMrFEj3X0IRmNbPex1lEgEbUaMpEGls/qrvz3Mic3lt5CJjH44Myq6AQO5/cL
         doD1XKr0DxevLbxP+p/qmJrXEqhYpB6uBSoWy5vEnKXaP282QHOIOuaymdfYkoAQByQU
         yXWA==
X-Forwarded-Encrypted: i=1; AJvYcCUVuqgOq1yCYUcviggy/k36J2p1SC+zOWJ1Qfd/tkd8geso+hWnn0eDDax+YK8urBsEGXplBvKpi4ibkrOFqB7ZsA==@vger.kernel.org
X-Gm-Message-State: AOJu0YxWXyrHxSmpNlGSMSW0L8PkDvZCUl7a6wadKbEJYxmzuD6A3YVQ
	DV5q6LCLo8K0YP+XrudcVAA6LM75x4yOFtztQr1pjtbSosOy51fI9X1pDWcviLK1NEg=
X-Gm-Gg: ATEYQzwTfhKVhs00rRmi3VwqENFXKNCvv0eIPqtdBZ9JriWB8Pr3ZS0Z/ZxhyUyMBc2
	pLR7mX1THbj3A5afLvYWMwxxWJpMDxvr91FxYETTqJpEJsGiBhFURcAJiTjx4Qqneanp9k/OhkL
	qsuQFgv9a9uQ1ZwIm47OW0irirm+jz23Fc32v8DdHy0kD9+mQrFjLaHzhkRLWjUpfiZbsniZKfu
	4cC4m2FkxRaP1w0XKqGD0OKyMoUznIGP058FQjfeN6/uAssKmqEWBIoViOiY78Vf1RuUJSf3QGr
	ceHz4vFYK/HRsg6Wd7q5haBdR4HFHLZgqRcdFaU8e5/WOnibGaGBXwddhQEJe8jvnvYg8xvLq7d
	7jlAaJ9LijvJqM+c5aRgThyVi8HTfD6nTzbjQo9vrOWU6hY6NzyaAI4rVhKExiqBmygQRfybCL8
	/70zLVSJSawNZ0Kj6nfSrGeIa0i1UO1OvRUOx5vqHK3e5yFQaEABq2m1odsq9gFYXNrS7nmhuJJ
	+w=
X-Received: by 2002:a05:6122:6581:b0:56d:288b:f1ca with SMTP id 71dfb90a1353d-56d288bf55bmr2792509e0c.12.1774518256586;
        Thu, 26 Mar 2026 02:44:16 -0700 (PDT)
Received: from mail-vk1-f175.google.com (mail-vk1-f175.google.com. [209.85.221.175])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-56d31bf719bsm3851750e0c.4.2026.03.26.02.44.15
        for <linux-renesas-soc@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 26 Mar 2026 02:44:15 -0700 (PDT)
Received: by mail-vk1-f175.google.com with SMTP id 71dfb90a1353d-56d36e7d8e6so297225e0c.2
        for <linux-renesas-soc@vger.kernel.org>; Thu, 26 Mar 2026 02:44:15 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCWNVHJlO3Wy16UZ4u9f5KBqaTZk7nCQRoj8qZxfLwv9jKTGb6/vxsJIgaGPdm2fTlAmsa/AB5huJ+N2Ytc7lJtMpg==@vger.kernel.org
X-Received: by 2002:a05:6102:84c1:10b0:5ff:d192:ff22 with SMTP id
 ada2fe7eead31-6038728e7b3mr2209468137.19.1774518254998; Thu, 26 Mar 2026
 02:44:14 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260326045355.223529-1-marek.vasut+renesas@mailbox.org>
In-Reply-To: <20260326045355.223529-1-marek.vasut+renesas@mailbox.org>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Thu, 26 Mar 2026 10:44:03 +0100
X-Gmail-Original-Message-ID: <CAMuHMdWM0zq2pAJAVEO=WkNyoVFFf-3OX2_+7fJxMWTPuG6hyQ@mail.gmail.com>
X-Gm-Features: AQROBzA5raX3WKUVOehzAlLaSiESouGRrUnc8wD5Mdt7U_rTWFsDl9lKV1nSlwY
Message-ID: <CAMuHMdWM0zq2pAJAVEO=WkNyoVFFf-3OX2_+7fJxMWTPuG6hyQ@mail.gmail.com>
Subject: Re: [PATCH] ARM: dts: renesas: r8a7742-iwg21d-q7-dbcm-ca: Drop
 KSZ8081 PHY C22 compatible string
To: Marek Vasut <marek.vasut+renesas@mailbox.org>
Cc: linux-arm-kernel@lists.infradead.org, Conor Dooley <conor+dt@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Magnus Damm <magnus.damm@gmail.com>, 
	Rob Herring <robh@kernel.org>, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-renesas-soc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-Spamd-Result: default: False [-1.46 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FROM_HAS_DN(0.00)[];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FREEMAIL_CC(0.00)[lists.infradead.org,kernel.org,gmail.com,vger.kernel.org];
	RCVD_TLS_LAST(0.00)[];
	DMARC_NA(0.00)[linux-m68k.org];
	TAGGED_FROM(0.00)[bounces-30321-lists,linux-renesas-soc=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-renesas-soc,renesas,dt];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[geert@linux-m68k.org,linux-renesas-soc@vger.kernel.org];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[6];
	R_DKIM_NA(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[9];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,linux-m68k.org:email,mailbox.org:email,mail.gmail.com:mid,glider.be:email]
X-Rspamd-Queue-Id: D4F2A332AD5
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Thu, 26 Mar 2026 at 05:54, Marek Vasut
<marek.vasut+renesas@mailbox.org> wrote:
> Microchip KSZ8081 PHY schema indicates that compatible string
> "ethernet-phy-id0022.1560" must not be followed by any other
> compatible string. Drop trailing "ethernet-phy-ieee802.3-c22"
> to match the schema.
>
> Signed-off-by: Marek Vasut <marek.vasut+renesas@mailbox.org>

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
i.e. will queue in renesas-devel for v7.1.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

