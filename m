Return-Path: <linux-renesas-soc+bounces-33332-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id SH8sG/ZcGWoLvwgAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-33332-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 29 May 2026 11:31:34 +0200
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id 0FDF55FFF8D
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 29 May 2026 11:31:33 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id DA09D300F5C5
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 29 May 2026 09:31:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1EBD33C1985;
	Fri, 29 May 2026 09:31:26 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-vk1-f169.google.com (mail-vk1-f169.google.com [209.85.221.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0C1E23AE6E6
	for <linux-renesas-soc@vger.kernel.org>; Fri, 29 May 2026 09:31:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780047086; cv=none; b=l9hPieaAB49KMHkRUnshUkoRmPjDf/yOue44+8b8R0qHI7Hmg1pF01GFcDVXWAEr85RN4qk1fYp+tH55BIQkQEkKH1MOySqo/uc3YR+TmL6lh2Dn1K6u3WV96w+kOUjq2vkbG/mhpWi2VzjPpMJy9qB9nfcJujf7GzIw6vt12oA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780047086; c=relaxed/simple;
	bh=fkaQRWlguE1XcB8+mrrOiMJJfeTRiMx6aKZNUDiyeY0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=WgMlEUnWMSVhiCSSrJhD/jZHDEHaGTbtTnx2q5IVx0Np6swi5a+JgKWXhvUkeyrId1PcFQU2cZqlRkUszHBH+HGH3CjPJrCejmkWJ0xMhDDb1TOUTnOYQHEnfYo8Jl+biI9jonhgKimZyA4fMrGLa4JPh522jCZOULkTapvvKdI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.221.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vk1-f169.google.com with SMTP id 71dfb90a1353d-57512b86273so9825355e0c.3
        for <linux-renesas-soc@vger.kernel.org>; Fri, 29 May 2026 02:31:24 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780047084; x=1780651884;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Jre8RAaVdOIJ6OFsSp8WRmOCVJOhYOYPv+VFLctcfh8=;
        b=RVJohC01+nuc28R5eV+w7C8XOiRQOXoxdjWfdRfJ32B443vcmEUd258+uP2lxY2+/+
         jIoUPITUsXLwGBcFKw7JsCEmDNv9UVHiLc2QtBZLThWqDt+z+0w6DCpbyIcibNEEizL6
         yTv+vC5exwRVAmxeCe0iC5hq4HbKEdzzhv85bJkqIebV3GVPDsPxu5xVLeWWVN8FAsQw
         oOpnvQh8r39ctA3bkABotKx2PWE0FNgZIYQIjRcxzil1/UGMZ8ZHJLQ5NU5gNSxxvDDj
         9kAd1ey+UPhDbVHB2yBiF09XUTvk9qFIsvMnMHGFEwVWovHzEllCKMXSGk4TPLkJeRHl
         0gWg==
X-Forwarded-Encrypted: i=1; AFNElJ/qBBs4qLoDLSLPKJJDYFUwdJCl6Qy/FKiz613kHD60lzWhKNkgCVDyXmaNkScNH88ii+NkyavBVOiF+tbaeQ48qQ==@vger.kernel.org
X-Gm-Message-State: AOJu0Yy/F4ZLK/dckL64a4TEOx2ag6lyGFd81/C4WUvj/b3IWpBo4tHl
	R0XCvGzdMR0QRswSmkyKmN5uzOschO5/wzOUVIfswCUJ9NTszLVZkRXxTFAJeX8tcVM=
X-Gm-Gg: Acq92OH9knyRFdR7ZTTWob8wBxEbtG1/00X6xYw/+Pd7vif1pvpXsR9mxHzXrbIEwXG
	mBjxhGEAVovCyckt4iUzF4dTGrlVY1W+1tW2KpC9qYWAmf1QtC0cH71GVSU/Cs85W0J5+002Saw
	a5+nE6KXqppzBSbOlZ8wiJ6FGmzq6/4LUhYrzPeJdxGkdE5vUSz9/QpQn3r+8SQr0FU4Tn5rSAl
	2wqoxcz9rC5K2TQStFaDbwRYV0EJPXeMqLssjvgIy/cOCJqgQYoaKu/lJtC6hbS6qfEQbDeDZWj
	6WxvoTgWSdHeJlLJKDz3icOrXxp+O1rzJ0ZDg4YkogUN9YWZRHgYXXxEOSCgMBN+jV875bCXPmp
	YdEWDIyUwUK6B6vEWHgQ5Tmz/d22QJ5jKS+Po4jKpMeguUHFtwhOz2+iSz/xGpawNEHwW6PJ/K9
	+lOyuSa+hX9FlTKMcuLTkxFFnJsvMA1iSWaVJixElJm8W+HaYkyC65KYWbHvTdj3hsGBHEX/s=
X-Received: by 2002:a05:6122:1817:b0:56b:815c:961d with SMTP id 71dfb90a1353d-599f64e4a4bmr584030e0c.5.1780047084085;
        Fri, 29 May 2026 02:31:24 -0700 (PDT)
Received: from mail-vs1-f52.google.com (mail-vs1-f52.google.com. [209.85.217.52])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-599da3ed0cfsm786146e0c.16.2026.05.29.02.31.23
        for <linux-renesas-soc@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 29 May 2026 02:31:23 -0700 (PDT)
Received: by mail-vs1-f52.google.com with SMTP id ada2fe7eead31-6c28e1511adso98963137.0
        for <linux-renesas-soc@vger.kernel.org>; Fri, 29 May 2026 02:31:23 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AFNElJ+iEIOSz3gg3JQbx4un9DqktYI7zZ7jqlKudG4ya4rO8W/20oGb6IdediX+Hu9PqFEcriwADYx35nPi8COdlBcCFg==@vger.kernel.org
X-Received: by 2002:a05:6102:1498:b0:639:4bb7:c916 with SMTP id
 ada2fe7eead31-6bf2b42f26emr693736137.3.1780047083481; Fri, 29 May 2026
 02:31:23 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260519100022.116318-1-biju.das.jz@bp.renesas.com> <20260519100022.116318-2-biju.das.jz@bp.renesas.com>
In-Reply-To: <20260519100022.116318-2-biju.das.jz@bp.renesas.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Fri, 29 May 2026 11:31:12 +0200
X-Gmail-Original-Message-ID: <CAMuHMdULG5KiCrm2cFZoy-kvLEG6qZpLx1fNi44rZgEdFs30Jw@mail.gmail.com>
X-Gm-Features: AVHnY4L71FrecII2P--Vqr75z7vmkHcqqegJs4qIL_cRpsjO8D5Eiqg2zGFC3ew
Message-ID: <CAMuHMdULG5KiCrm2cFZoy-kvLEG6qZpLx1fNi44rZgEdFs30Jw@mail.gmail.com>
Subject: Re: [PATCH 1/2] arm64: dts: renesas: r9a08g046: Add rsci{0..3} device nodes
To: Biju <biju.das.au@gmail.com>
Cc: Magnus Damm <magnus.damm@gmail.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Biju Das <biju.das.jz@bp.renesas.com>, linux-renesas-soc@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>
Content-Type: text/plain; charset="UTF-8"
X-Spamd-Result: default: False [-1.46 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FREEMAIL_CC(0.00)[gmail.com,kernel.org,bp.renesas.com,vger.kernel.org];
	TAGGED_FROM(0.00)[bounces-33332-lists,linux-renesas-soc=lfdr.de];
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
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	NEURAL_HAM(-0.00)[-0.982];
	RCPT_COUNT_SEVEN(0.00)[10];
	R_DKIM_NA(0.00)[];
	TAGGED_RCPT(0.00)[linux-renesas-soc,dt];
	DBL_BLOCKED_OPENRESOLVER(0.00)[glider.be:email,sto.lore.kernel.org:rdns,sto.lore.kernel.org:helo,renesas.com:email,mail.gmail.com:mid,linux-m68k.org:email]
X-Rspamd-Queue-Id: 0FDF55FFF8D
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Tue, 19 May 2026 at 12:00, Biju <biju.das.au@gmail.com> wrote:
> From: Biju Das <biju.das.jz@bp.renesas.com>
>
> Add rsci{0..3} device nodes to RZ/G3L ("R9A08G046") SoC DTSI.
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

