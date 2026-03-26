Return-Path: <linux-renesas-soc+bounces-30324-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id AHvPI4oCxWl55gQAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-30324-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 26 Mar 2026 10:55:22 +0100
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 072A3332BAC
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 26 Mar 2026 10:55:22 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 412943137870
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 26 Mar 2026 09:46:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 50F7833A702;
	Thu, 26 Mar 2026 09:46:31 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-vk1-f181.google.com (mail-vk1-f181.google.com [209.85.221.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1E1B03218BA
	for <linux-renesas-soc@vger.kernel.org>; Thu, 26 Mar 2026 09:46:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774518391; cv=none; b=sl60nGVLCvbVGXU1vsdOS7T4u1KBJ6UwO/2pW1CfOzw+T4LEoRgGT3lCxMm1F7XE1BRUYXoNimM6yMYEq2a0G6QEB/T21okIjdQczmJLnykIdbye2h1SpNi5mJ2IoDDNcn3tGVFGozr+lm7POW540YV5VIYb9H/Qow0bnhbpn+I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774518391; c=relaxed/simple;
	bh=kIEyhxuYdaWsiktCdoerqKNEY9HJhJYjpyLKZYFTDC4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=FpBBPwd6nEXCYLqiKiZuym5IQ0V4MPRDuDLnZSVk3P8m+m2G5WeIw8jttXK1L/y+HJqZXbvApm4ZPd1RZLTbWDmT2oIbmEzE1aZgtBnGjoV/UcICZuSKWbSAZxOtEJmj0a1khAQ3f6q2GkLiic8cazg6ou9ySxwEs3awPfhUE68=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.221.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vk1-f181.google.com with SMTP id 71dfb90a1353d-56a8fdaddebso364376e0c.0
        for <linux-renesas-soc@vger.kernel.org>; Thu, 26 Mar 2026 02:46:29 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774518389; x=1775123189;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=aF0VWb50M+ZUryfs9KzhTMt2/O8j1VfHTGDlP+pSQVg=;
        b=Jz8RZVXFl+mvLXxJ7GMIphVm881acqVtQ+GBbEbxhyekOAPYpR0xqty5uoUZjOuVHl
         SYgwIrITAMwyU9U7MhO7SN5101IMtg+DKmIeFOF/Cqx8+cyjb7J5Xqd+jqDWCYjcL7cG
         Uxi82q6POLOtpoHcEWpIHHDM+g7wVjngczukDY3cWqZlpMCTLuOND3Otyzf9Bchvge+F
         /dBsSnbxrQzgR5hSO08CnFBncrbSk0FGg7gAx5J1NA2MFu1qXLInNZ4aRCH0QGZJSqAN
         psc6wOkkTg4rKxKAXMN9I6gF2D1/IThXgNnB+j6jIocrZA/XZb8rOFchxnOi7PaFxW5G
         LHyQ==
X-Forwarded-Encrypted: i=1; AJvYcCVtTjVtC2jy2Nbyvk/8E68+7kkj7W9dMnG0mDCFIUaIQWt9T9/Av4CLJwOG/K4Z1wi5JCEXCo50B6geH6btWXwUmA==@vger.kernel.org
X-Gm-Message-State: AOJu0YxW/eNxo/6OrThYFfYMtmoBOA2icOsN1da4jaMtV1iuVx86uEA3
	wE6hFy4W17qFk/CHiNTcnZbS8sCdDgyt/vwKoqRtrXBLMiuDUTeof+yydBP0UUXHgpM=
X-Gm-Gg: ATEYQzzKpT4DptbEWpcnpQmHwD9u1cEZZzUqjYQyAyX3TeZViAcyfv9j5lipTreWRB4
	mP/viS/K+7Gqi4JjKGC7yQmsrzljEsyeS/+ZJJdKnvHxw9WTO9Fr+Jl9wFxQBRxSXQhkrqNrc2G
	W75GtPoAHSHN8WDpRzh4Oy3IMrN5w+GLB0WmODSxvQoArYRAD5Aii6qDIOMtItOoNDCUbeLMOBF
	Ec8mZ+SejQ4dJ/eu7bpy7pbVP8xDXuTlPEUlYsEkahEWM3G4vHU3XWeuwJRFOZsamNPugzH48uB
	7mHwPdGexYrJXf0eX25cA4LTn7Rzet1LbEq0JtOAR7kusto6ogb1t0DcQH7bysTkpEL8usK88af
	EYUVgwlBv0dvmRM+G4LVPYknBQMDDEqZ4LSfBDQF18b3e4Q/yX/wYylwkUH+Rg+GjfhUDCKDJdL
	Kcf9ZnJM9/e7w7eCZcrO+aazDKQWKq+awBbGWGt/70/ncH1ETo075HpQCg57/L
X-Received: by 2002:a05:6122:2404:b0:56b:f8e:6b2f with SMTP id 71dfb90a1353d-56d220c5169mr3550557e0c.16.1774518389058;
        Thu, 26 Mar 2026 02:46:29 -0700 (PDT)
Received: from mail-vs1-f41.google.com (mail-vs1-f41.google.com. [209.85.217.41])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-56d31c29e46sm3468368e0c.5.2026.03.26.02.46.28
        for <linux-renesas-soc@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 26 Mar 2026 02:46:28 -0700 (PDT)
Received: by mail-vs1-f41.google.com with SMTP id ada2fe7eead31-604c237486dso207988137.2
        for <linux-renesas-soc@vger.kernel.org>; Thu, 26 Mar 2026 02:46:28 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCUOkpWEtRzJmQEX6ER+M27xlvzXGVgPOpp9LpVflgJbAY+iUdy6h9fZ5sLnhp6cdaViqmagMRrGgIdmsS41vFZi0g==@vger.kernel.org
X-Received: by 2002:a05:6102:3351:b0:602:6c69:eec7 with SMTP id
 ada2fe7eead31-60387246888mr2874362137.23.1774518388244; Thu, 26 Mar 2026
 02:46:28 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260326045523.223620-1-marek.vasut+renesas@mailbox.org>
In-Reply-To: <20260326045523.223620-1-marek.vasut+renesas@mailbox.org>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Thu, 26 Mar 2026 10:46:15 +0100
X-Gmail-Original-Message-ID: <CAMuHMdU67BBLP4NEZmvT36Pk5OjcbKEDjdyw7shZfiKhwVNGmw@mail.gmail.com>
X-Gm-Features: AQROBzC40eYoryYksApDOIGtz-evI70xDisaZpapKThRIts9LzB-N4Lzp7D6J98
Message-ID: <CAMuHMdU67BBLP4NEZmvT36Pk5OjcbKEDjdyw7shZfiKhwVNGmw@mail.gmail.com>
Subject: Re: [PATCH] ARM: dts: renesas: Drop KSZ8041 PHY C22 compatible string
To: Marek Vasut <marek.vasut+renesas@mailbox.org>
Cc: linux-arm-kernel@lists.infradead.org, Conor Dooley <conor+dt@kernel.org>, 
	Geert Uytterhoeven <geert+renesas@glider.be>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Magnus Damm <magnus.damm@gmail.com>, Rob Herring <robh@kernel.org>, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-renesas-soc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-Spamd-Result: default: False [-1.46 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FROM_HAS_DN(0.00)[];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FREEMAIL_CC(0.00)[lists.infradead.org,kernel.org,glider.be,gmail.com,vger.kernel.org];
	RCVD_TLS_LAST(0.00)[];
	DMARC_NA(0.00)[linux-m68k.org];
	TAGGED_FROM(0.00)[bounces-30324-lists,linux-renesas-soc=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-renesas-soc,renesas,dt];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[geert@linux-m68k.org,linux-renesas-soc@vger.kernel.org];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[6];
	R_DKIM_NA(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[10];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,glider.be:email,mail.gmail.com:mid,linux-m68k.org:email,mailbox.org:email]
X-Rspamd-Queue-Id: 072A3332BAC
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Thu, 26 Mar 2026 at 05:55, Marek Vasut
<marek.vasut+renesas@mailbox.org> wrote:
> Microchip KSZ8041 PHY schema indicates that compatible string
> "ethernet-phy-id0022.1537" must not be followed by any other
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

