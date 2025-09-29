Return-Path: <linux-renesas-soc+bounces-22449-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id B9D29BA94BD
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 29 Sep 2025 15:15:36 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 746CA3A5837
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 29 Sep 2025 13:15:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F089A19D880;
	Mon, 29 Sep 2025 13:15:33 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-ua1-f49.google.com (mail-ua1-f49.google.com [209.85.222.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 71EC32AEF5
	for <linux-renesas-soc@vger.kernel.org>; Mon, 29 Sep 2025 13:15:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759151733; cv=none; b=Vz8Rd7/AfTYCMs4VjjRwGtxOdcDsTPb/3CtSBTP7RZwX/DbLly3DRMoHrZfM6iQGnVHE4HihoTS85A4FCHK9RMNV0z48EruEA2Zq2HVLGbBSyLsc8660w3ujs/MHAxOV/mh/Jsg+PXPuMEyfnHjLd0/XYoZ6QbQq0C4LTRKYhRE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759151733; c=relaxed/simple;
	bh=/CeoiIO4oEpN9VjHP8HfKiYF99Pkq0Nca8WusPYehew=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=mEMDiTx6Ek+N/cDk7RYL1ZNW2X7aeLuYUG52o2DUi6E3mslwBIFgm9p5V3i4nWR32Mo2EBL8xSUXbKsTMve2FFVp6ewrN83oWLKVpOCLnXeF6sLJ7V5TAyihPzY+T1egwDzDRkivy9llnidLUS5Yn/sLtutJD/93mHx1c4y+7C8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.222.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ua1-f49.google.com with SMTP id a1e0cc1a2514c-8e352f6c277so1015771241.2
        for <linux-renesas-soc@vger.kernel.org>; Mon, 29 Sep 2025 06:15:32 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759151731; x=1759756531;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=WGWKfU0acW/iaFNqPdL/2iourou2d7uCdc802/WdX5U=;
        b=KmphTiifYjwFGLPOObw2ZwbeuF0fVgEe6zhf0IVUvgKZOl/DH1eeRtuYrF/IVvsCpn
         +DjPSOFKMEvl7nkOXqNkdHgTHOhEANPzmr1WaJDDDppveoeJSkbvAjE/HDI6rnr0tDy3
         7SNw+SDdhws2Cffh1WohjFRypQ3QbXJqjPCWOkmdBueGJ3vNTX8id5abfROM70VqtZ6H
         jnPLS0mltIlVx0uD3hA6i/kCtU3caJ8Z/13lxBZGX2zjUArQ3k3mOILae0x9JhY6dd6S
         0iJfQQtVVssmNLH6K9B7n1/wrKyGlozc6XdyShDCymcWVGzBikhqOKNX1CqGqlF9+SJh
         Qvqw==
X-Gm-Message-State: AOJu0Yw4JJh7xJ9IDlvFK542sgkCx4OexbZ3s8T61YgGD5ZrA2YG6cfZ
	pN0m4vcTsRDJgWfa4xD6ARWTHaShpIeE1vQIyuRQIUEGzWT4vNSkFZVHeDoL55y5
X-Gm-Gg: ASbGncuIyJMNkPsYuPWUWRic+eefKYXf4NaUpHZJF38hQX6ULIgiOqgtxEhwJO5sdpq
	94OHrk3mQB6xDrAf5B9aGkhyMVPtlp+B2/incyWI3aCbAH0tN/hatvryPG4pbmPcAUe2xl5O8fT
	0OGNvY0wnFikBUVviEZ1uZ+nNzdW+pUpHD8f2xD7Kuk8ltIAouTO5986cjG43oaMJv/+rvh4Vju
	/39Rt+ILgtiHerA8oS6thd+FpuIrhPrSAeoHPm3UqYz4r4AL4NwP3USl8D5RtIcpbAizgRI38sI
	yeMZCartJkvttWmexTaLRpqibXxg0ePkFMQaezGdNMCwKrsXDje8wnA4B4ITlHpkNCQWW6SHi28
	8TyTNJ/ogaY6KJxbpfFYDWait1jCgYEevAGePX28VlGy5UUvzFslqqKeYCoPYbpJE
X-Google-Smtp-Source: AGHT+IHTFuSntEg2dWp7KY/2AE34jVt/9frY30ShY+djRW/3wooX5tePOM1JXA+0Lm3dp07239r5Pg==
X-Received: by 2002:a05:6102:41a4:b0:52e:90c:847b with SMTP id ada2fe7eead31-5acc623f628mr6506548137.13.1759151730992;
        Mon, 29 Sep 2025 06:15:30 -0700 (PDT)
Received: from mail-vk1-f179.google.com (mail-vk1-f179.google.com. [209.85.221.179])
        by smtp.gmail.com with ESMTPSA id ada2fe7eead31-5be147da365sm1646471137.9.2025.09.29.06.15.30
        for <linux-renesas-soc@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 29 Sep 2025 06:15:30 -0700 (PDT)
Received: by mail-vk1-f179.google.com with SMTP id 71dfb90a1353d-54aa30f4093so1783729e0c.3
        for <linux-renesas-soc@vger.kernel.org>; Mon, 29 Sep 2025 06:15:30 -0700 (PDT)
X-Received: by 2002:a05:6122:8c18:b0:54b:c83b:9299 with SMTP id
 71dfb90a1353d-54bea30052bmr6229796e0c.10.1759151730053; Mon, 29 Sep 2025
 06:15:30 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250925093941.8800-14-wsa+renesas@sang-engineering.com> <20250925093941.8800-17-wsa+renesas@sang-engineering.com>
In-Reply-To: <20250925093941.8800-17-wsa+renesas@sang-engineering.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Mon, 29 Sep 2025 15:15:19 +0200
X-Gmail-Original-Message-ID: <CAMuHMdXORD8pFRby+FQswFUSi8C5HVE=nAQq4U5iCgu74kkWFg@mail.gmail.com>
X-Gm-Features: AS18NWCWp0vwAjCqxkEVhkiKbracedhO7Drp3DSCL2VjLWHvrisv_m82-RlCmJY
Message-ID: <CAMuHMdXORD8pFRby+FQswFUSi8C5HVE=nAQq4U5iCgu74kkWFg@mail.gmail.com>
Subject: Re: [PATCH 03/12] arm64: dts: renesas: r8a77961: add SWDT node
To: Wolfram Sang <wsa+renesas@sang-engineering.com>
Cc: linux-renesas-soc@vger.kernel.org, 
	Geert Uytterhoeven <geert+renesas@glider.be>, Magnus Damm <magnus.damm@gmail.com>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	devicetree@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Thu, 25 Sept 2025 at 11:40, Wolfram Sang
<wsa+renesas@sang-engineering.com> wrote:
> Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>

My
Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
on the RFC is still valid, will queue in renesas-devel for v6.19.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

