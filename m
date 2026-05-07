Return-Path: <linux-renesas-soc+bounces-32217-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id kI86Crlk/GkqPgAAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-32217-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 07 May 2026 12:08:57 +0200
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 977DA4E67EA
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 07 May 2026 12:08:56 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 88E99301876E
	for <lists+linux-renesas-soc@lfdr.de>; Thu,  7 May 2026 10:08:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B25FF3D411A;
	Thu,  7 May 2026 10:08:49 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-vk1-f176.google.com (mail-vk1-f176.google.com [209.85.221.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 531BD3D3CF0
	for <linux-renesas-soc@vger.kernel.org>; Thu,  7 May 2026 10:08:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778148529; cv=none; b=C3YhyuIM6Q6DFCKpNhH5Vri4vHC93cU9xuNtwh40aWmZMKauBqA29+sFjTlaaakfZI+v6RTe75a1UJPqGboSawIkhu8SvCV8bKEjEtENEZWRb5A2Ljs33Jba2QnpQJFzQMz3hRliZsTopupQI8vvGT92ObLi5MS27064a2LPGjA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778148529; c=relaxed/simple;
	bh=kXQspXREuqyEYdjGDjyEBdOTtNmhzbYs7oU0PJZ6TYc=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=pfEfGk0bolv5EWngUR5JklTwxw5Yw8TYC6tff03qDBBFRgG4NydBTNv9dLXDj+x+Ujr4gUe51z5zPxb2wdM2chJLUakNhQk+cmYQsjGuYvi+SB+HzfGo5wLQh8uEGYjhLcwnWl9g1JZUjwm481wQNSZMi636vg8GfZW/u5sGVbc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.221.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vk1-f176.google.com with SMTP id 71dfb90a1353d-57513733658so198654e0c.3
        for <linux-renesas-soc@vger.kernel.org>; Thu, 07 May 2026 03:08:48 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778148527; x=1778753327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=jeAWFjgKNZgewmf7+VpB3j6D3JVvBcCkVJPHWNsKgvo=;
        b=F2ZUR6zkWUfW+J0td6ZnG51+wkKKjqfA/qSAa8hx3ddAyX4raPG3MMazUnGl+Aj2v4
         qVCywp1Sn8+82b/TRhaSWomzP7LJc9AgAybCbY9+GWr3xX8UzFVBGskf+HfYSOBQAfUt
         JgI4/A4x5awHIAZzTKFUle6g3MwBgBXMyr5hAw1Wog7/PFd/n2yMYLrbLxbr4Pkk9ovb
         txngJNW1fHV21KjpYa/XCTXLzk1Yl/E+ZzxhRlSiwmOqQ6r6fwQcqRwh/Ydm4flZR33x
         872JLaRz5LcgoOJlNP9qI7cn3s2ehBOx2jMDmYf8jmXRN5pRNc7fDGrEAa+oTZmRwYnf
         zTZA==
X-Forwarded-Encrypted: i=1; AFNElJ8KW5A2LGsCkyY6ca21lTN1SHqi2had/l3fW13QQFROmPNtoOAm0VWUh9Geghe5gIY8EYsMKVDA2XRQTM6qxewI6A==@vger.kernel.org
X-Gm-Message-State: AOJu0Yzz8EQ1XBn2EdkCgB7UHeqA2yaY/DzL0qXzNM1KMC5z74iYuotz
	U/N5loSYSlrglxhGWosGp8g85PI2cV5rsHFbsdgviaJQpiQKDKF3EGF+fPMkbw1/5Ko=
X-Gm-Gg: AeBDiesg6PxkF7sCGPSd0w9ytgwtNiYxgF5DgQjDkORO0vJs8gprbIjpewXwkvYQb+2
	6iUuEb53PnvPyI0jz4Dexs2YyVNc8gbKCACuPi1xQp5J/S7zq7L8MOKyuJUktBh7aImkeCTIS/i
	pVeexWUgntU7EpA+1CF6by449lmhM10Z9rd+27LSdC038QgGieAONOOr1Qx1t0vyMXQIwViagct
	wrJYEgoB+Soym54VVcf88Mfgs74uVjs8xE7UVMfrx48Wa1WBj82wisjzv8UJHLimzVvKgcEMQW8
	CXqqKrhY9HSO1AGrueVkFSbCA2p7thWKh6Mez3UOcUg0n3OiLc63qwik3RlKmU7krueMCgoZEAj
	2WCB1k+uG2Q+K4G1oZsLDtmlnBpxD//D1I/PjN7T6WQsrYGHDNaA6SaxWKnh/fiU29KIRyfdtZ0
	zSS9M0JdrqJ0FvTH0TqIa73vIGogrNLdtMWkU6eh5RwgBGcgwf1+f2xtlXWC8WYIZsn67smZ31z
	dg=
X-Received: by 2002:a05:6122:3784:b0:575:24b5:88e7 with SMTP id 71dfb90a1353d-575596afa83mr3778229e0c.11.1778148527240;
        Thu, 07 May 2026 03:08:47 -0700 (PDT)
Received: from mail-vk1-f181.google.com (mail-vk1-f181.google.com. [209.85.221.181])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-574a6ef15e0sm11708465e0c.17.2026.05.07.03.08.46
        for <linux-renesas-soc@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 07 May 2026 03:08:46 -0700 (PDT)
Received: by mail-vk1-f181.google.com with SMTP id 71dfb90a1353d-5673804da95so237963e0c.0
        for <linux-renesas-soc@vger.kernel.org>; Thu, 07 May 2026 03:08:46 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AFNElJ8ZHQn9GVOwGWUypjrorWThsqB5t9rnoT6ymWIDUSL6UzpVMfs1VJ0MQswTCsfMkSs6aMi5dZRk5CsqEqz+CdAAag==@vger.kernel.org
X-Received: by 2002:a05:6122:3120:b0:56a:f979:a9d1 with SMTP id
 71dfb90a1353d-575593b5a40mr3891168e0c.1.1778148525853; Thu, 07 May 2026
 03:08:45 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260430125342.439755-1-biju.das.jz@bp.renesas.com> <20260430125342.439755-5-biju.das.jz@bp.renesas.com>
In-Reply-To: <20260430125342.439755-5-biju.das.jz@bp.renesas.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Thu, 7 May 2026 12:08:34 +0200
X-Gmail-Original-Message-ID: <CAMuHMdW7J1VL6KFTt0M3UO_NFmBDnfggi=mSg58svPnRC+Psfw@mail.gmail.com>
X-Gm-Features: AVHnY4LpmaWS7LXimKPU_njn3ObmYrciwAw7lzjhzA4sY9Hm32MrRpd2gzDNZgY
Message-ID: <CAMuHMdW7J1VL6KFTt0M3UO_NFmBDnfggi=mSg58svPnRC+Psfw@mail.gmail.com>
Subject: Re: [PATCH v3 4/6] arm64: dts: renesas: r9a08g046l48-smarc: Add SCIF0 pincontrol
To: Biju <biju.das.au@gmail.com>
Cc: Magnus Damm <magnus.damm@gmail.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Biju Das <biju.das.jz@bp.renesas.com>, linux-renesas-soc@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>
Content-Type: text/plain; charset="UTF-8"
X-Rspamd-Queue-Id: 977DA4E67EA
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.46 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FREEMAIL_CC(0.00)[gmail.com,kernel.org,bp.renesas.com,vger.kernel.org];
	TAGGED_FROM(0.00)[bounces-32217-lists,linux-renesas-soc=lfdr.de];
	DMARC_NA(0.00)[linux-m68k.org];
	FREEMAIL_TO(0.00)[gmail.com];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	MISSING_XM_UA(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[6];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[geert@linux-m68k.org,linux-renesas-soc@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	NEURAL_HAM(-0.00)[-0.999];
	RCPT_COUNT_SEVEN(0.00)[10];
	R_DKIM_NA(0.00)[];
	TAGGED_RCPT(0.00)[linux-renesas-soc,dt];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,glider.be:email,mail.gmail.com:mid,renesas.com:email,linux-m68k.org:email]
X-Rspamd-Action: no action

On Thu, 30 Apr 2026 at 14:53, Biju <biju.das.au@gmail.com> wrote:
> From: Biju Das <biju.das.jz@bp.renesas.com>
>
> Add device node for SCIF0 pincontrol.
>
> Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
> ---
> v2->v3:
>  * Renamed SCIF_{RXD,TXD} -> SCIF0_{RXD,TXD} pins.

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
i.e. will queue in renesas-devel for v7.2.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

