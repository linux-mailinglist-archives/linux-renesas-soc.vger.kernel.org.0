Return-Path: <linux-renesas-soc+bounces-21776-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 9D73CB53577
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 11 Sep 2025 16:33:20 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id E36981719BD
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 11 Sep 2025 14:33:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DA2F032BF44;
	Thu, 11 Sep 2025 14:32:55 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-vk1-f172.google.com (mail-vk1-f172.google.com [209.85.221.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5611433769B
	for <linux-renesas-soc@vger.kernel.org>; Thu, 11 Sep 2025 14:32:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757601175; cv=none; b=ELuHxo36ZPY/BHUCv+ndp5LWOrR6m9kpFo8VkHKenh8z0uYkIOkxy+6B0a8U6rSTJaulVXJW0g7319KsKLft33FTAnyOmfrDzniWgJo6bxgERzjiLOr7W8ssynhn4F8h4ji8N4FtWf1J+0Mu4xyExDZeKXSOUcHIvF2NGnte0jA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757601175; c=relaxed/simple;
	bh=VHhlVIuBdaDU+8PEYLzyCQ0H1QgdUb/zU81eSShlOus=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=tvyAzEvsN0V0LTJ5srSa7tu5bgW0hSxWsuCw1nYqjGTlDEv+wUgZO19uumNss6pGEaBN6H6b/wui8VMsnMvJ2DHVtQL4DGosbVymfXsWliGTOhti0m9HV9wHVyYaCbIcEHTbj+LnjIZUWDeIdHqPFYmCYDBspRktlJo70ojBrk0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.221.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vk1-f172.google.com with SMTP id 71dfb90a1353d-545df2bb95dso314225e0c.0
        for <linux-renesas-soc@vger.kernel.org>; Thu, 11 Sep 2025 07:32:54 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757601173; x=1758205973;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=hiuhbKCWVVhxdsKroAmlHWewkQOhNypPZ4OriaNJghs=;
        b=c6fd/9lRkWwfICTnPuGlaNqjfa8Aa4w3DvzdenpXrvaJQAOJaKvGr+ze22w5wSTo8u
         COaFASkeSZoYyUW9AGXt6vKNMmn9Jz2gFRuXnrUHWItGp9zNdFRW2OKBicnP1cxJws/q
         pXpOprmpngQhERFRX3Rniom7FEE4mhd0knGdQ4uROUwKt7yt5mfgl8TQ4vQfj5qzIYjd
         LGd07mH8XKrv2lrpU/pnyi+RCN7TR+o6HqYYPIUu67ylHQscsataE09uNMdh+heYdnb9
         /zdcMv4CjMPb3FdAQWuplzDQgSWf75fViqjau1oNWGmWPKO9vrC/fV8K+ja90hRzJLqO
         gjZg==
X-Forwarded-Encrypted: i=1; AJvYcCXfJJ+qfmEsAbQ9l81cdbDrcW9oDE6Z84vtSGAr9wpRvpszQSnV0jwxX/ppqEl0MoMkPSokWGFVInCevgO6yx/tJg==@vger.kernel.org
X-Gm-Message-State: AOJu0YwJrGQ95XO3XZd1EQ4KNj3gswe0gLAD+ZaWwSco2l3HieHNQXGF
	85JoVTHsTxgpyn6wZSD8eAYKpVa44rI6tRAudVeGJvLIFBpZzKgh0P9O3APbKdC1
X-Gm-Gg: ASbGncvziM1UhHGvNE4EkGyhfUZ9u/353SQ31KXnYygiVMcRAbCOB30fdf0ZMWzaG1Z
	Waq1nfF50fFSrJwFk1Qhwe+mFzKjxJEn5J1KijPl9XnhZKRLNIyi61WVZxhz6Q59EFLhaxZLJzb
	D7LKvF2Tml0AiVwvfNQPcU0NCx7/2xE4Pc65iKbMYGpMa3UtexIW9mrL6Y7IQqCRYbdO0kK2CUM
	zB+SPKf0Ps5geYSbt/U+v5iFR8zkXvdSrbCHeN8x/c/JtESJoUIl+oxRvydMt64oHKWXHYahZRZ
	SgYofGePyAL2FQTrpGuQqCQdedeTsJ5mCiB96PQzjCh5v/ueBCUzSLw2jSAXaf0vDYHCS5Hfvc+
	YiMds0KAdSBFGdDXOqdKARl9mPSI3/hevCBU0pXuLRVXnLEbq7+R/ZOta8RZX
X-Google-Smtp-Source: AGHT+IHxHXL/hoLxqIehuNhcstmqOU7IPCnbkB9ACMJgpX3hIzCsfgwRPrNywBscZNe3wgWncNXdLg==
X-Received: by 2002:a05:6122:1348:b0:530:6bcb:c97f with SMTP id 71dfb90a1353d-5473b0d401bmr5885197e0c.8.1757601172823;
        Thu, 11 Sep 2025 07:32:52 -0700 (PDT)
Received: from mail-ua1-f43.google.com (mail-ua1-f43.google.com. [209.85.222.43])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-54a0d40b62bsm272686e0c.21.2025.09.11.07.32.51
        for <linux-renesas-soc@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 11 Sep 2025 07:32:51 -0700 (PDT)
Received: by mail-ua1-f43.google.com with SMTP id a1e0cc1a2514c-8980d75995dso219077241.3
        for <linux-renesas-soc@vger.kernel.org>; Thu, 11 Sep 2025 07:32:51 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCWygAsQdDJf82S3BaftOd64sfoKphFCguZlgubA8SExusTFosSB4VVAIFYWmPXVWMTQv655mTgAlH6uve94GY1ptA==@vger.kernel.org
X-Received: by 2002:a05:6102:3e04:b0:527:4113:6ad6 with SMTP id
 ada2fe7eead31-53d0dfbd7e7mr5509483137.9.1757601170806; Thu, 11 Sep 2025
 07:32:50 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250904210147.186728-1-marek.vasut+renesas@mailbox.org> <20250904210147.186728-2-marek.vasut+renesas@mailbox.org>
In-Reply-To: <20250904210147.186728-2-marek.vasut+renesas@mailbox.org>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Thu, 11 Sep 2025 16:32:39 +0200
X-Gmail-Original-Message-ID: <CAMuHMdVMZ2rexeLrJsL9CNh_uG+1eHJndG=bn8K3_yRUNURXqg@mail.gmail.com>
X-Gm-Features: AS18NWCyQKXgN_PFlTPOYFuyv0ojGKrxYAZJ8mJkuqXIyr4JRZyFSZyPUiP0jDo
Message-ID: <CAMuHMdVMZ2rexeLrJsL9CNh_uG+1eHJndG=bn8K3_yRUNURXqg@mail.gmail.com>
Subject: Re: [PATCH v2 2/4] arm64: dts: renesas: r8a779g0: Rename dsi-encoder@
 to dsi@
To: Marek Vasut <marek.vasut+renesas@mailbox.org>
Cc: dri-devel@lists.freedesktop.org, Conor Dooley <conor+dt@kernel.org>, 
	David Airlie <airlied@gmail.com>, 
	Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>, 
	Neil Armstrong <neil.armstrong@linaro.org>, Rob Herring <robh@kernel.org>, 
	Robert Foss <rfoss@kernel.org>, Simona Vetter <simona@ffwll.ch>, 
	Thomas Zimmermann <tzimmermann@suse.de>, 
	Tomi Valkeinen <tomi.valkeinen+renesas@ideasonboard.com>, devicetree@vger.kernel.org, 
	linux-renesas-soc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Thu, 4 Sept 2025 at 23:02, Marek Vasut
<marek.vasut+renesas@mailbox.org> wrote:
> Rename dsi-encoder@ node to dsi@ node to follow node name pattern
> in Documentation/devicetree/bindings/display/dsi-controller.yaml .
> No functional change.
>
> Signed-off-by: Marek Vasut <marek.vasut+renesas@mailbox.org>

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
i.e. will queue in renesas-devel for v6.18, combined with the previous
patch.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

