Return-Path: <linux-renesas-soc+bounces-22795-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [142.0.200.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 16090BC4B83
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 08 Oct 2025 14:12:42 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id AC2A94E9039
	for <lists+linux-renesas-soc@lfdr.de>; Wed,  8 Oct 2025 12:12:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B06022F7ACF;
	Wed,  8 Oct 2025 12:12:35 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-ua1-f47.google.com (mail-ua1-f47.google.com [209.85.222.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 283C1244671
	for <linux-renesas-soc@vger.kernel.org>; Wed,  8 Oct 2025 12:12:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759925555; cv=none; b=EPrQja7k++tLkTkoM4e5QkPxAO9EVCIAv351neVFfWKg7qgUCQFkFPxfwpW9TKDHr7ihPY5brsjGmKfYTjb1oeayK6HlPCdoFXv3yNpMIUXuUlLWSN498KXd9+aSGTSKLeJOxrTgre+RKROeiN8mc/vO+QLFZFHbwdZXj1/+v8Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759925555; c=relaxed/simple;
	bh=o1l3n2y5YwxEXg2rM4gAYMR7pahw4lA+e2lcwHc4J4A=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=J85XImzg5IvlmK39GxiUhzK2wc6jDTBx9rJbPy457a/OYQS/aeL3Y4A0se63HH+/yLn2WMKYtEWRj0s82iuiUX59ChgqHojmzlN52NaAfr58gryj9eE8NwBcgsya3B7pJf4B7PmVbL848fi10RkKVn5OLeyYt+K3AnrURKAK/tE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.222.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ua1-f47.google.com with SMTP id a1e0cc1a2514c-90f5eb2feb8so1635152241.0
        for <linux-renesas-soc@vger.kernel.org>; Wed, 08 Oct 2025 05:12:33 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759925553; x=1760530353;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Brp2nrWlwG3bN8c/hrIoL4Nm2qLdFlreoXWyVG7Wt10=;
        b=gUYMdcWYfSdTWtiHNUMmQANmpiSlhD1IMp9tntzyPr6T7aLU0vrnICE8o8IFNh8nnE
         exltx7iiFRdVql+WqT5UGp0lAi7wf1qPZWzDPkcX2AWYdBY/svVnFl6vPAviukSEMnYq
         juzSiE6EIF+zatxzGtVQ7d6x4JDAkpwUjbnIDYXkVXv5ceXMbmV69uSbrV9YZr1l+g6k
         8M+DyJUhbsSWS2g1mUFe/YYEKLILl9ZJYcGm/Iu5qNuk9N8ySBv2d/zDQXIk/41d5q9Q
         NP54byjsJf6fQmqbAi5RE7isVh+dkpDbvVUvqk3e+UgnChuLcEF/JsGzXPK7Yhoc3CF4
         n4rQ==
X-Forwarded-Encrypted: i=1; AJvYcCXFAzsWNideAnkWJl/pjZft4b0EA/LbqeUJmWRceMEBnRxqwu072UgEhAiTqisJQFE5xd4IM817f4+QnF6+KsNw8A==@vger.kernel.org
X-Gm-Message-State: AOJu0Yz+a1HPu29q2O7Hem5tvWuwRvIHgUAKckuN2seeDK/4S4Delk97
	x22ve/czJYPqHK66ujY0cOfl8nxBIAW+sL4zPhev1OJgct8V8E4UWzel1lsCyQA5
X-Gm-Gg: ASbGncvW+VmEJ4Cg3AXpX3/hBcnZDIPsZlrP2PX4iYb/gjicoriR2IE2SaKE74vdd+m
	cesVK07GFolYhVTUMSyc7eLym3TG/JcaTXon/cZ6G/frM92lY2+jf1rB322aqSrAlICAqnr015k
	voiQcHhnZsy8+saTWeQ7fySzpfRvzv/ueVqJOLNAASoTKIOZo44QV8tyA0YrruYtH6nLABgvHGl
	0e6T6/WriHqo4SRh5DEoFHWF2BMnykg83Qf63tGq/jAVZH2kiFmoa01XcvtTNTJPU+JGOsPhKW3
	kgX7FtfAy+fKMg+GABk7GBqC6fjzjTPKMxrIO+uNx/Ly8F6ROtXdM3o7tjPpkUjz5EQF+34TCOT
	hatZbokA9C8cn2HwXmBthPYyOG67DT7XVqK9j2Ao0b/ohieTIXe9tHSXCDQO/UGYHN8uJKy4dgO
	3AXgFzyi7UoCN4zTuUCbM=
X-Google-Smtp-Source: AGHT+IFCPRZrqUZrDJdynCWWe9Lz+XOMzRNG72aDQpeKoX4JPQOd5TCiQIg1dAQvAUuwxfNARunIjg==
X-Received: by 2002:a05:6122:4f81:b0:530:7bd4:1761 with SMTP id 71dfb90a1353d-554b8b91c9cmr1087078e0c.11.1759925552587;
        Wed, 08 Oct 2025 05:12:32 -0700 (PDT)
Received: from mail-vs1-f50.google.com (mail-vs1-f50.google.com. [209.85.217.50])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-55497ee3001sm2149559e0c.6.2025.10.08.05.12.31
        for <linux-renesas-soc@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 08 Oct 2025 05:12:32 -0700 (PDT)
Received: by mail-vs1-f50.google.com with SMTP id ada2fe7eead31-5c72dce3201so3093240137.3
        for <linux-renesas-soc@vger.kernel.org>; Wed, 08 Oct 2025 05:12:31 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCWrp81xd+1zrCuZKp4VGCf0lS/FUwC+zYX/Q3GqUyTjP82pT82IUNmH3EVbfQjHHZs5CvunjpO6sAKFQJUc5OOVPw==@vger.kernel.org
X-Received: by 2002:a05:6102:f08:b0:519:534a:6c22 with SMTP id
 ada2fe7eead31-5d5e23b4082mr1034500137.32.1759925551779; Wed, 08 Oct 2025
 05:12:31 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20251007133657.390523-1-claudiu.beznea.uj@bp.renesas.com> <20251007133657.390523-7-claudiu.beznea.uj@bp.renesas.com>
In-Reply-To: <20251007133657.390523-7-claudiu.beznea.uj@bp.renesas.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Wed, 8 Oct 2025 14:12:19 +0200
X-Gmail-Original-Message-ID: <CAMuHMdWf=AfW40m0qJ3_P=Ni=OsO=KMqDY7USdvHEXmrHM+mzw@mail.gmail.com>
X-Gm-Features: AS18NWAtQie1NbudVP3BXMcF3ZQanxK6LGXJKC21rxZI487nMAs440k_Psy4Pfs
Message-ID: <CAMuHMdWf=AfW40m0qJ3_P=Ni=OsO=KMqDY7USdvHEXmrHM+mzw@mail.gmail.com>
Subject: Re: [PATCH v5 6/6] arm64: defconfig: Enable PCIe for the Renesas
 RZ/G3S SoC
To: Claudiu <claudiu.beznea@tuxon.dev>
Cc: lpieralisi@kernel.org, kwilczynski@kernel.org, mani@kernel.org, 
	robh@kernel.org, bhelgaas@google.com, krzk+dt@kernel.org, conor+dt@kernel.org, 
	magnus.damm@gmail.com, p.zabel@pengutronix.de, linux-pci@vger.kernel.org, 
	linux-renesas-soc@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, 
	Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
Content-Type: text/plain; charset="UTF-8"

On Tue, 7 Oct 2025 at 15:37, Claudiu <claudiu.beznea@tuxon.dev> wrote:
> From: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
>
> Enable PCIe for the Renesas RZ/G3S SoC.
>
> Signed-off-by: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

