Return-Path: <linux-renesas-soc+bounces-15833-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id D28E9A85818
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 11 Apr 2025 11:39:06 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 00D1F1BA312E
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 11 Apr 2025 09:39:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CE528296148;
	Fri, 11 Apr 2025 09:39:01 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-vk1-f180.google.com (mail-vk1-f180.google.com [209.85.221.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7A8ED27C865;
	Fri, 11 Apr 2025 09:38:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744364341; cv=none; b=mDfZL+ZmL7c9W7u7yyleJJoJ2xfbhhAOQYfSCo1NwMQ6zRjVApAFLpbXczLrdt+SUStNr6qVrGv3SP75YhrFW3RDHo0E0DoPyVX1xP1qTpFAHIkpyFXIvtF8wse9cZFZ0MRKxk6fXn+4sCcSBjgdWMy49a3dPRWAqa/A1XLuwLY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744364341; c=relaxed/simple;
	bh=hRDQyiSKRt7cxM3ElL561i4gzV5W6eh5WRYo2fbNmPM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=fW6cLIpV/TPZOgubD7lnwllcC/PGC17jvkj8BAIZYgasijJcfXWLA512ARj7qoDA4ZbQHiZ8o1pIvYoUWCvxwoOyRxewn9uV/kHhOkgr3/2cl43RwB9dljKvkDAYL9VdUEhmda1dELClGCLJFtvW2oONjDr7s1zjcGw1oh/vUvA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.221.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vk1-f180.google.com with SMTP id 71dfb90a1353d-52617ceae0dso672484e0c.0;
        Fri, 11 Apr 2025 02:38:59 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744364337; x=1744969137;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=A78gbXPCqvNn1iUerWF17uxNmJk0Rl0zWmZIrF1D5PI=;
        b=GvBYV+X+ciSx6Nr5uMgFJOfNLmitDhJ+enAURbnFwBpdFspLjWy8QwNdYvsz6Sbauu
         T0P5m4pJS44Lz7Ju/id81CaH10uVe3jtHtgmjZMKR+G1AKl6ThDmEVIlByEUNW7Andjg
         pFtyBKADAPj6FmhnbJ3NCVkt1RlfQyuhL5GtnpanzMpGNIFSVJvodUip+x2uM8PZftx7
         K6+jKbcRnD53gH6ovQlQniyseATU84V9Kn8eduLoLB0216nJVDB8wchzk7Gc8dsoP+N5
         9gFs2CYIogIM4onY8rBKQKDVrqeo/vFDDjZ9+XIvywjuCHzwrFxXHejBNSKY9PoMavvL
         kdqw==
X-Forwarded-Encrypted: i=1; AJvYcCX5Jax9Xs0humD8XlH5VvEVxga7Chrg3rcKAgsqdYA1bw7h/cLQWzAy87Q3SKREI50twjAjNIGo5N7H@vger.kernel.org
X-Gm-Message-State: AOJu0YzgV4RNX6ZptFk7elhIbrxBNcQufvxtbLUdQ3aiS0wLaJIH2Wjg
	6rRdmni/dnx+rcdKEDZNUt3muWJNnYpvyCEdHF0GT25LeR1YDAJDhDLPHp9/ia0=
X-Gm-Gg: ASbGncuUNaZwH1FwQP7DAtMe3gFm6094j6y6aXWS0TGuAxDCZtt72AaYXFJhlXdSLC4
	hB0LArUr4Q68jowB6M8kmw4Z4WDrwCQWB4uFPEZt+jozRqNxAmN+FoQs1tQIgKNXVmUai8B3GgZ
	4J/QUX9GHJh/Y9zTIdaWUNhCap8oQ2dYyVJF23e36O6UXdGcBEKe12pZj3zifDPgK28Wbkd8wAA
	hp3y42XM1jIuwijvrUqYdnIOvJeGlmF5Lbxrm7AUqZZxFIYdzeFGZ1N74tAnMJUTKBaOXCGKbZA
	I9UY151FEuVRpeonJfYlq/bZwwgeiHcfbJk5QToS/fk1oVZ1iuF2+ddNRlvSC7/smJ+EOPtX3yK
	P814=
X-Google-Smtp-Source: AGHT+IFUzbUa0npUeqgOH34SWwiHalgpQ2c63BxAT/sqSwRr8d08Llx+B8Zsv4NRM2xczbisFAf6rQ==
X-Received: by 2002:a05:6122:319d:b0:527:67da:74ee with SMTP id 71dfb90a1353d-527c34d1fd1mr1091357e0c.5.1744364337376;
        Fri, 11 Apr 2025 02:38:57 -0700 (PDT)
Received: from mail-ua1-f42.google.com (mail-ua1-f42.google.com. [209.85.222.42])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-527abd9b9afsm1063361e0c.27.2025.04.11.02.38.57
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 11 Apr 2025 02:38:57 -0700 (PDT)
Received: by mail-ua1-f42.google.com with SMTP id a1e0cc1a2514c-86d5a786c7cso780813241.2;
        Fri, 11 Apr 2025 02:38:57 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCXz151LbBsSI8jtpbr1bORaRpC/7lQmCJyqK+VYS+gVDHzBwCzlHl14mWy8iiZtviLCL1r4DTSbfL0p@vger.kernel.org
X-Received: by 2002:a05:6102:3ecf:b0:4c3:221:8f47 with SMTP id
 ada2fe7eead31-4c9e4f19ab3mr863676137.13.1744364337035; Fri, 11 Apr 2025
 02:38:57 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250410071406.9669-4-wsa+renesas@sang-engineering.com> <20250410071406.9669-5-wsa+renesas@sang-engineering.com>
In-Reply-To: <20250410071406.9669-5-wsa+renesas@sang-engineering.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Fri, 11 Apr 2025 11:38:45 +0200
X-Gmail-Original-Message-ID: <CAMuHMdWkonmkBwjzWtZQj8CSYj1+EbcWO_xCyXW1EyxQcWkdSg@mail.gmail.com>
X-Gm-Features: ATxdqUFaA7cpSU-CuOm-ynJ2a3EqBA_Rtqe7ftLljIFfsXqi8Mn3Jg2_HsOO3bY
Message-ID: <CAMuHMdWkonmkBwjzWtZQj8CSYj1+EbcWO_xCyXW1EyxQcWkdSg@mail.gmail.com>
Subject: Re: [PATCH 1/2] ARM: dts: renesas: r9a06g032: Describe SDHCI controllers
To: Wolfram Sang <wsa+renesas@sang-engineering.com>
Cc: linux-renesas-soc@vger.kernel.org, Magnus Damm <magnus.damm@gmail.com>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	devicetree@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Thu, 10 Apr 2025 at 09:14, Wolfram Sang
<wsa+renesas@sang-engineering.com> wrote:
> Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
i.e. will queue in renesas-devel for v6.16.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

