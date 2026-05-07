Return-Path: <linux-renesas-soc+bounces-32205-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id sLUjCGdb/GndOQAAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-32205-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 07 May 2026 11:29:11 +0200
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id A0A524E5E63
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 07 May 2026 11:29:10 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 5D36130B2AA1
	for <lists+linux-renesas-soc@lfdr.de>; Thu,  7 May 2026 09:24:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C30053C197C;
	Thu,  7 May 2026 09:24:10 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-vk1-f173.google.com (mail-vk1-f173.google.com [209.85.221.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 63AA13C0601
	for <linux-renesas-soc@vger.kernel.org>; Thu,  7 May 2026 09:24:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778145850; cv=none; b=NCb+r+Lir5T+EUsI/lUsEGuAddb4WBS6NA2tPiPwrtaycPxk8qVwbR5mVLaKE39FRojKXQoh+MqsqTOwwLMTiduUobO4ORNWb89M1VnqHa8smPES4u91lmSntFWBNgGBVCDchAzwt3GV319UPlwKmQHnqIWcTsGyaR6XNiWZUY0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778145850; c=relaxed/simple;
	bh=AMIb6q4EpAMzt52D+h3AqrP0Q2rrED/ImJNl3FKPJkA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=eqogyw7SKxY5g4sWt7C3eqa4kNWok4OM8yrWZsKAXq4DfrKZiOi1ZHGx0D+UOF5jxiOBBA9dBGKFiPZt99djLi5lhexV9kmulLm03IkHjIMkw36jaaapKU0EJ47aGLB+Y3WutQuPQ/VHwreenEcD/XMcQANX3d0kBbBoYxv53eE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.221.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vk1-f173.google.com with SMTP id 71dfb90a1353d-57513a91514so193744e0c.2
        for <linux-renesas-soc@vger.kernel.org>; Thu, 07 May 2026 02:24:09 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778145848; x=1778750648;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=TCndMd4yxjbHbIEJCX2AjFS4eFdSECDFSht1Q6asNeY=;
        b=cJXpjWXBa60H7VzbF9kNJrLbxcTr7KCGGvvjYgo2MXESdMfH9xg67x9knEFTrR1+zy
         /kXxTM8XmsorYu50KAEzXLP4bskCZksZyWgXsBsDo7tYaYO0Ut5Z6CsLPoLtKo3urnbP
         pgIImTj9TOFOPXIwAysweopO2sjCRicysjMjz6RemaGDNpqhhUjSD3OWxXnAd0XrVvaR
         vCzlLGqOaANr1Vrd3wPOFzj+bsGtSRX6ZHT2PDOfJMR4TbFYBgjBoZ7d083OilijHjuR
         XRzs6N0D5Jofy+LijLbWja8pdmmcpnuzxidOHG/ADnyO/BC8cFEuZUmxl9BY1Eyl1g6y
         5Rew==
X-Forwarded-Encrypted: i=1; AFNElJ/MhcDxXvYx2LmA0NKLYRTOrbtJP08hiE8Tf+z5fUqEnya1TY+7uzE4waWhiZSoZ2IqItU6h4WUBMAK7bHviCRVYQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YxQAlpWKx/9W6+gAWS+XBMOeiWOFhvk8j0D05I6NQ3bzkV2AOmJ
	xU04CM2eRg0daIVGdCQTGWa+ZDnd4tO98oOrfOJsKm7tAbYw1YEf0OL2GfiIB54S2OI=
X-Gm-Gg: AeBDieu9imc/JQksU4LhtEJBX2LKOa+RHs79ubjPme4uC+wP9922FgoRnBzxJ1LzvYH
	qceCJDJg6AmhmsTfuY7EP9U7cv6PBtDixJ0eg1M9MVvsrafia4VdlXf1QEYqQmebgqwwTa+YdgX
	NahTo2QSn0EmzoM0xOYz093+417p/EICmzZgIHPZlseDRQ6rFt7dOLPbJoQcSlbR8Nbef3uftEp
	IlawMeyTvpk8Ix03owL0IAmNtgy76jwn6bbk4lSOfFI+7OqtVlSnPt/5u/3r1EC0RkuZ22Wai1U
	tI0bkA5nMw3gGG1pLgkbCVBmn6yrwP9hY6IjHbzbBdWOGEvvtvFgJNa9sw0OyfBzlCRNZTAqsRF
	o/WE/PbyIghkPCQ8KDkaNsjdGFUGmQC+rjuM6imlVnhT024Ies1xfjGjjQgegi/GPh8tbjSmgS2
	pX0wMx2i9qpHVDUzcPpcCGnJgYSGuHHbyNdwQI3ZD8waIZgExnWHnVZlIBRPU/e4S/FMrobo5Ox
	r9vgp62sg==
X-Received: by 2002:a05:6122:3209:b0:56f:2609:cd95 with SMTP id 71dfb90a1353d-575596abf66mr4134894e0c.9.1778145848194;
        Thu, 07 May 2026 02:24:08 -0700 (PDT)
Received: from mail-ua1-f54.google.com (mail-ua1-f54.google.com. [209.85.222.54])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-574a6dc1e08sm11776977e0c.13.2026.05.07.02.24.06
        for <linux-renesas-soc@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 07 May 2026 02:24:06 -0700 (PDT)
Received: by mail-ua1-f54.google.com with SMTP id a1e0cc1a2514c-95d439bd3a5so167019241.3
        for <linux-renesas-soc@vger.kernel.org>; Thu, 07 May 2026 02:24:06 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AFNElJ9EiZiNJX0pQK93y37BljP05c5m/HTgUE3rqRBv8EmG4wIQISefCmmNbFah1gaERWYJhzB+iIw1uOLUblZeIjNJrA==@vger.kernel.org
X-Received: by 2002:a67:e703:0:b0:609:af4a:371 with SMTP id
 ada2fe7eead31-630f90266e4mr3464284137.23.1778145846187; Thu, 07 May 2026
 02:24:06 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260504225428.114959-1-marek.vasut+renesas@mailbox.org>
In-Reply-To: <20260504225428.114959-1-marek.vasut+renesas@mailbox.org>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Thu, 7 May 2026 11:23:54 +0200
X-Gmail-Original-Message-ID: <CAMuHMdWWUwpeZocbQimvLwDTGXPyPJCePfLLXxXFF7LhJATbNQ@mail.gmail.com>
X-Gm-Features: AVHnY4Li4IX9mDo-taz0IkcBUseN0_iOnoFKhnadIj5uAaSwC2Mm4fb9GuMco_0
Message-ID: <CAMuHMdWWUwpeZocbQimvLwDTGXPyPJCePfLLXxXFF7LhJATbNQ@mail.gmail.com>
Subject: Re: [PATCH] arm64: dts: renesas: gray-hawk: Fix AVB0 PHY node alignment
To: Marek Vasut <marek.vasut+renesas@mailbox.org>
Cc: linux-arm-kernel@lists.infradead.org, Conor Dooley <conor+dt@kernel.org>, 
	Geert Uytterhoeven <geert+renesas@glider.be>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Magnus Damm <magnus.damm@gmail.com>, Rob Herring <robh@kernel.org>, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-renesas-soc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-Rspamd-Queue-Id: A0A524E5E63
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.46 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FROM_NEQ_ENVFROM(0.00)[geert@linux-m68k.org,linux-renesas-soc@vger.kernel.org];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FREEMAIL_CC(0.00)[lists.infradead.org,kernel.org,glider.be,gmail.com,vger.kernel.org];
	RCVD_TLS_LAST(0.00)[];
	DMARC_NA(0.00)[linux-m68k.org];
	TAGGED_FROM(0.00)[bounces-32205-lists,linux-renesas-soc=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-renesas-soc,renesas,dt];
	PRECEDENCE_BULK(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[6];
	R_DKIM_NA(0.00)[];
	NEURAL_HAM(-0.00)[-0.997];
	RCPT_COUNT_SEVEN(0.00)[10];
	DBL_BLOCKED_OPENRESOLVER(0.00)[glider.be:email,linux-m68k.org:email,mail.gmail.com:mid,mailbox.org:email,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns]
X-Rspamd-Action: no action

On Tue, 5 May 2026 at 00:54, Marek Vasut
<marek.vasut+renesas@mailbox.org> wrote:
> Trivially fix PHY node alignment. No functional change.
>
> Signed-off-by: Marek Vasut <marek.vasut+renesas@mailbox.org>

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
i.e. will queue in renesas-devel for v7.2.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

