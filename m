Return-Path: <linux-renesas-soc+bounces-22453-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 7675DBA94DC
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 29 Sep 2025 15:18:24 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 2F2FE16EB41
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 29 Sep 2025 13:18:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4221C3016EB;
	Mon, 29 Sep 2025 13:18:21 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-vk1-f171.google.com (mail-vk1-f171.google.com [209.85.221.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B95402EF66E
	for <linux-renesas-soc@vger.kernel.org>; Mon, 29 Sep 2025 13:18:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759151901; cv=none; b=Zp33nN1tucmwV7Zczvf6cPRlPy7o8uGlxRIZ2WcC6CKNcwkuvOWeWIKHhuYHDqE3WdxPSCtdsQOzJIrcYNYgMcudQsfO0GLXzsHFoVTOElqhJOe6zxzM61WWKuK7AYSVMt86NL6njG0HueIVX3iPed9seLaLFn4S5VZXjHwW/+o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759151901; c=relaxed/simple;
	bh=wANisPC5z9cD4GP8SLP+vUm2YJjz+htvFrIhAJVRFN4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Wu54SMC92K5PYlhXT0ZF2AIwWlMcLQRNLNt4RHG5L9jOkRp8adSG0+yTag8WzK5XY9NrBcc7BffKuUUlYleOm4xS5GfLNFJKJU3b8BKA4uqD09CEEfv5a9N42qvkNOD4UeaIohdwOvzn2mEl3HINgIWYDdgk7kcvpEprtOLgZCo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.221.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vk1-f171.google.com with SMTP id 71dfb90a1353d-54bc6356624so3953343e0c.1
        for <linux-renesas-soc@vger.kernel.org>; Mon, 29 Sep 2025 06:18:18 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759151898; x=1759756698;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=id1UL4XMXXh5ORipw4ImulCQ1+I9qnWpIF3nvWEwJ6U=;
        b=qaoHU5I5s1YPe5ovoNrlOULaneSYkwf2xA8LyVOVN9AWxTVCkfomBmlA0tQ+rLRHF6
         omIxHYjAiiwFZJsGyNQ3WvzBb31LOmVKbn0SVTAlVcS4AnF0vUn+qRFv1LX3sQggrhEx
         HCQuSI8jSMlrD/kxEe93c4pxsg92HHatWTsN8hd+RYGfbWukJRJTtW9/3e4r75I2+pnx
         D1ez1SXE5Adv/9kTrFbbuMIvec9eqrMVDoqwWCURHBr9CaePpU8timg9bFFmcKB0pzQM
         NVy1iv/u2qyZOqVzuG7Pf9+IUHSjRiIF11okrDraODj9rFlmsRGXI4+Bv3xSDQL2o8GL
         Z/yQ==
X-Gm-Message-State: AOJu0Yz/uYbgsC3iPzZIijMegmtvKRBwaJJutiLQevzbS4u4DhXCeMkr
	L2lStsZcKwwArhXjd3dVfQvkVAMB76+pLWSzHD3lDYEXbzGKdfnIGdGYnSeB5eOY
X-Gm-Gg: ASbGncuK/ukFBhlf95AhrneL4G60pceO4mE8aYQJ/JUxWRi411WIyGRUojPP7eayBd9
	dKswd4r9q4cEFlQPRScSZrHscqamP6LKUnPefLJrloFZ5YA8LHkfhE4fEBVk6yn7lDeci52A3y1
	8oojhBPMYxXaoefiCxmd0kw2ecZUNJObYzKBBVLHAz0Em7qJ1xZhn2O9is0dZANk2DScaMNIpU2
	v3ihyu7mBqYbJRcki91qVQMpmwYPUHTLdEhVwS7F8DF96lbvSip0Ubm3xcxA/SzXBPKnGTeN88B
	dDfhnvZAUqYkqpfYU355tRXdE3HWpRAHYzY+lHM75PmiA7LXLzYig7XyzAb19J8vGfsPrbbWmLp
	TtotG6W5jGt79+WWqkxZTm6sMRaMccF8j+RaIQyZUcK76BFe05Vehion0VD1j
X-Google-Smtp-Source: AGHT+IEMJpS/MBpTI/cGnewy014SNDfNDE8DiefJyCp9ddM4c5PHwJ80Ru6n/8v/T713+Xzax50zMw==
X-Received: by 2002:a67:c90a:0:b0:598:371e:2450 with SMTP id ada2fe7eead31-5ced8763e0fmr233854137.15.1759151897706;
        Mon, 29 Sep 2025 06:18:17 -0700 (PDT)
Received: from mail-ua1-f46.google.com (mail-ua1-f46.google.com. [209.85.222.46])
        by smtp.gmail.com with ESMTPSA id a1e0cc1a2514c-916d2948cb7sm2386639241.9.2025.09.29.06.18.17
        for <linux-renesas-soc@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 29 Sep 2025 06:18:17 -0700 (PDT)
Received: by mail-ua1-f46.google.com with SMTP id a1e0cc1a2514c-8eafd5a7a23so2430388241.1
        for <linux-renesas-soc@vger.kernel.org>; Mon, 29 Sep 2025 06:18:17 -0700 (PDT)
X-Received: by 2002:a05:6102:610d:10b0:596:9fd8:9268 with SMTP id
 ada2fe7eead31-5ced07a8bf1mr228637137.8.1759151897233; Mon, 29 Sep 2025
 06:18:17 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250925093941.8800-14-wsa+renesas@sang-engineering.com> <20250925093941.8800-21-wsa+renesas@sang-engineering.com>
In-Reply-To: <20250925093941.8800-21-wsa+renesas@sang-engineering.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Mon, 29 Sep 2025 15:18:06 +0200
X-Gmail-Original-Message-ID: <CAMuHMdUbskmHcEbK-58v8cfHEGGWOMOSy-8-BVt=zowXxjBOFQ@mail.gmail.com>
X-Gm-Features: AS18NWAeYXe-qJCXY-WWJofniNFU5mV94n6tUJXfY1Rn4bVb4Ip3DmBe1300-RE
Message-ID: <CAMuHMdUbskmHcEbK-58v8cfHEGGWOMOSy-8-BVt=zowXxjBOFQ@mail.gmail.com>
Subject: Re: [PATCH 07/12] arm64: dts: renesas: r8a77995: add SWDT node
To: Wolfram Sang <wsa+renesas@sang-engineering.com>
Cc: linux-renesas-soc@vger.kernel.org, Magnus Damm <magnus.damm@gmail.com>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	devicetree@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Thu, 25 Sept 2025 at 11:40, Wolfram Sang
<wsa+renesas@sang-engineering.com> wrote:
> Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
i.e. will queue in renesas-devel for v6.19.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

