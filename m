Return-Path: <linux-renesas-soc+bounces-32215-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id oLsXKGNk/GkqPgAAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-32215-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 07 May 2026 12:07:31 +0200
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id ABC4E4E67AE
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 07 May 2026 12:07:30 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 820943006019
	for <lists+linux-renesas-soc@lfdr.de>; Thu,  7 May 2026 10:05:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E81963D1711;
	Thu,  7 May 2026 10:05:02 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-ua1-f50.google.com (mail-ua1-f50.google.com [209.85.222.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4E71033343C
	for <linux-renesas-soc@vger.kernel.org>; Thu,  7 May 2026 10:04:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778148299; cv=none; b=Oc/m9lja/5b2H+BhU0zZPy+xKIpsS0r1rDNjWxuwttJ/ltPfyOrRjeaD+2A4B5hb6E+9YfYZWcokj6nDN099LEY+D8UnHQ2ksfHqKbnu7W7J2/s5W/rtq8PSq1EZjls73s3efgT24bSsJPSW+1JJcBvQiYyTLKPDE1/lPYaa6iY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778148299; c=relaxed/simple;
	bh=QBNlHtLLDp0a8vFoZD5o8h4tPmjDdNgQ6trWUPVrqy4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=LFKY18lpaXagLFw1Z9sWE/Dz1zzEOGIoHQPsTWyW3GM11XdDE8AoHhMDgsBFkgfzR2DlEdxIawQn4RrteMwUG1JCPo9F4wpu3nTHYLZRZ3pbA1qTkv91/bDqUjTaxcKnLFpaH7QPgwQiBQvOQFrsLc414nWNhmHZsG1SqwdNHVw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.222.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ua1-f50.google.com with SMTP id a1e0cc1a2514c-94dcf70af41so169577241.1
        for <linux-renesas-soc@vger.kernel.org>; Thu, 07 May 2026 03:04:54 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778148292; x=1778753092;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=9efMTaesRZN0akOd53Z+KOsQbLcKFvwTSfRhpnKaLP8=;
        b=ihZt0L9mYD0Cka7OQR1u8Angm0BP8ujZQze4jeNb3ziY//BkDPkQs1ZZ1PU0/OVSEg
         JUUsweabpnGPmjBmI5hnyVQPMl7BWAcY1olQ+wCbc5chfmxMdtpH9FUSDzEwxAv0MKSe
         qo4acki6qjyUugfRNUJXedcLkZLkG7Ku/cak2h51oBT18f+wZJPaQlyVnYK2O/G4fURR
         DdG8NmOTBwqMPvBg4o7TJrF9PML09e4Bto0Knt+rgtJv+oGXujxxKvylz6QUsf1/9FiF
         28r0eWkUbOgo9oIKT+fBslkQhfRvQE6eYWaHCvOriWcAX+bdGy9mWeZ004uBvH487ESw
         5qfA==
X-Forwarded-Encrypted: i=1; AFNElJ86mdvGbGULzviJ3wWfQr+53pRZmuyRkt5gSakp+87BNjxBUpeIjJb69EnD0dEpFRPQR0asM2yGAxhiN3fAx93/8Q==@vger.kernel.org
X-Gm-Message-State: AOJu0YzN4wKshzcqhlvD3WAm4MupJs2ipEb/Hke8uSwxi8Yv6xoGz+QU
	m2b/hr8z59hwg/qpqzmWSvON/nlEoPDoQPJxeZBSeU2J1fX2ywlJlBEJXYrzDGvVA7s=
X-Gm-Gg: AeBDieus4+RrEE6cbW3vr46P+ltPjfwXuV5dpxLO5OXCa7vTcMVaol6NaSLUdVaihRt
	hDbqpWastznl7F/QiDVCmnbbBlttnz2bb4Z0xdJ69bBRhrt0gIgxoVVJTIhRpGPzLyWlx+bGZtk
	NBe6xsQrML3jtAbWe8quAHmsfxhyOpUQoMzPEsXt2bCadcjPDcE6QNjqGZ/hxjEQEqI4GEC30lB
	i88ZDyeiRtNHqLZ+5HffeXZqeZWxpUbUxdgtGLE621ERwMbgz3fX8MBl9mDeNuZkaTWuiWu8bn2
	9o6HZb4gK3j40Unf7IVZiyram/O1f0Nv0BYuzhaBqZk+B5Rmv8e4WZFGALD6d2FRFZ6knnSEbdm
	yqNfdX+c1wciswUDWa6HZqfl/ZyVyteILIaZLKYqSmPROTZ2RJbzDMno7C1OPyK6x+l5Sx2WFbs
	CIlxwoVJ7pSRcOwpFEMzRi0C1BbsCupN/fBD1sQCjhpuraM4RuljBgOEropBYDv21u72P/qL7U4
	24a8AXHcfwpyZjygmZHMxun
X-Received: by 2002:a05:6122:a1a:b0:575:2f91:6fd3 with SMTP id 71dfb90a1353d-5755955ad50mr3618657e0c.5.1778148291728;
        Thu, 07 May 2026 03:04:51 -0700 (PDT)
Received: from mail-vk1-f172.google.com (mail-vk1-f172.google.com. [209.85.221.172])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-574a6ef4012sm12386266e0c.18.2026.05.07.03.04.50
        for <linux-renesas-soc@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 07 May 2026 03:04:50 -0700 (PDT)
Received: by mail-vk1-f172.google.com with SMTP id 71dfb90a1353d-5751e12c524so225172e0c.1
        for <linux-renesas-soc@vger.kernel.org>; Thu, 07 May 2026 03:04:50 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AFNElJ+bIr6hFd+xOvNcu+lDtL/FVA74mFzPUlu6N4W+0d3YywAW4Mu+RbG/qwLl2viuNY4hG+9FF4mKNZeR22RCPT3uSA==@vger.kernel.org
X-Received: by 2002:a05:6122:8495:b0:575:637e:9509 with SMTP id
 71dfb90a1353d-575637e99f3mr1977950e0c.13.1778148289893; Thu, 07 May 2026
 03:04:49 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260430125342.439755-1-biju.das.jz@bp.renesas.com> <20260430125342.439755-3-biju.das.jz@bp.renesas.com>
In-Reply-To: <20260430125342.439755-3-biju.das.jz@bp.renesas.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Thu, 7 May 2026 12:04:38 +0200
X-Gmail-Original-Message-ID: <CAMuHMdWM3gBS6CO-cQgc6KPSdpwLWwBTynJDcF4HSAs72A+xTQ@mail.gmail.com>
X-Gm-Features: AVHnY4K8a0WnnvU517ZJkdnKHi3kSgA8X-ASA_i7MddMM06qNDSHegwIXTpj4ZY
Message-ID: <CAMuHMdWM3gBS6CO-cQgc6KPSdpwLWwBTynJDcF4HSAs72A+xTQ@mail.gmail.com>
Subject: Re: [PATCH v3 2/6] arm64: dts: renesas: r9a08g046: Add ICU node
To: Biju <biju.das.au@gmail.com>
Cc: Magnus Damm <magnus.damm@gmail.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Biju Das <biju.das.jz@bp.renesas.com>, linux-renesas-soc@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>
Content-Type: text/plain; charset="UTF-8"
X-Rspamd-Queue-Id: ABC4E4E67AE
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.46 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FREEMAIL_CC(0.00)[gmail.com,kernel.org,bp.renesas.com,vger.kernel.org];
	TAGGED_FROM(0.00)[bounces-32215-lists,linux-renesas-soc=lfdr.de];
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
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	NEURAL_HAM(-0.00)[-0.998];
	RCPT_COUNT_SEVEN(0.00)[10];
	R_DKIM_NA(0.00)[];
	TAGGED_RCPT(0.00)[linux-renesas-soc,dt];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns,glider.be:email,mail.gmail.com:mid,renesas.com:email,linux-m68k.org:email]
X-Rspamd-Action: no action

On Thu, 30 Apr 2026 at 14:53, Biju <biju.das.au@gmail.com> wrote:
> From: Biju Das <biju.das.jz@bp.renesas.com>
>
> Add interrupt control node to RZ/G3L ("R9A08G046") SoC DTSI.
>
> Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
i.e. will queue in renesas-devel for v7.2.

Gr{oetje,eeting}s,

                        Geert


--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

