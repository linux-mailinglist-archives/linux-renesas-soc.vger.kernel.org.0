Return-Path: <linux-renesas-soc+bounces-24585-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [213.196.21.55])
	by mail.lfdr.de (Postfix) with ESMTPS id 8E379C59104
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 13 Nov 2025 18:17:52 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id 2F73134F8EA
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 13 Nov 2025 17:07:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 09E45359F91;
	Thu, 13 Nov 2025 16:54:00 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-vk1-f170.google.com (mail-vk1-f170.google.com [209.85.221.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 58B2A3590DB
	for <linux-renesas-soc@vger.kernel.org>; Thu, 13 Nov 2025 16:53:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763052839; cv=none; b=ewiwI59zRCCEdQqgrKVc+JAuTq5YF8aybJts4jk8PkMizbKNRdE//ymgQCKTx6/xYLpy9ek0+XlJyilCzYfUu7Rx5Ol2rQuDb1QgWnOFBZvEa6CXlfc5RF2UUsxY4pSGQfbTzEXWPB8oUbCQwk588W0Z5BOjoW8cNYuMgLfhRSM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763052839; c=relaxed/simple;
	bh=JsV/8/54jQvxd0kSYYLeIfmgPFGknt20dq0zvf6pcTo=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=RhvCFpHlQYQjPFLv8xMJPVKt9eRdiSi1dexl5Hcr4nveyTF+1mpavwpfRG+x0SS1WcTJt6XZkYVCRH7huowtoc61HxevW2p3xnYHXH2/7+AMOtrj9SSgJMMHYBElp0e3BnHLjQL8g1JVLSVSLRjAOEY1BXPyT6I8JT1NuqhmjQ8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.221.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vk1-f170.google.com with SMTP id 71dfb90a1353d-55982d04792so667347e0c.1
        for <linux-renesas-soc@vger.kernel.org>; Thu, 13 Nov 2025 08:53:58 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763052837; x=1763657637;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ALBRC4wvbYHISURwEdik4fuZyBrb01I5jhftggw+rBA=;
        b=VqC0dmltLF/dQNA9UZYMweMYIsVqcJ1PODRIBNhz7lbvtoZR/qGIjV4u13YJ/RQZUC
         Jul4bx7bxCV/RKUeSBAbnRFY8cE1Sjrkr8fh+58JlyY+PJP1YLHamxhv3fbx/mgyC68Z
         KZQGszcDfFQeqn+d9BkSnj+4isSn2Nh8oHzKKbLyvYTsqHrClaFPWclxgnfqUb4XGHkH
         ORAIPJb5t+fa+G/kR8cNxBipQaGGrAJjxm9d+JewKwHoB3S427MepRMYaycERmzAWArM
         Oqc9lw+sHZjjAkazXUeKGKeFAckaNI4hq+kbJopbvdqRyrtD4AAM5kwY5GF8nlMMe6N1
         H/Qw==
X-Forwarded-Encrypted: i=1; AJvYcCXJ8mIEVI4rqYG8rp5agU5rnO9agzFmce4iiY/wHjUCeJvO3xiYfvb/MKOG8UdZQrZiZfIBwWb6EO4O0LoH4qm2hQ==@vger.kernel.org
X-Gm-Message-State: AOJu0Yy51q/4RAI1Cu+9Maek3oDTtcjYGkYFB0jhIHah7422DX1tOeVL
	nXYRwqS8lce2Go0UWk1i5wyvS3G0+77nRbvsXXy9v5FTJbD+p+LoDBQKEBSvcOp4GgI=
X-Gm-Gg: ASbGnct6DaCbW1/ihFB0SFHNl9tGTmvvW9qCiWWvbMB0hcSzyyzyMFFjr6KUATBCdZs
	qHLuB3FJTJkBb5g6vFRd5jSdV8AvRibHC4w9xhB9eCcLQLiFez0Atemi1K9bsDVZciaGiydOXBc
	QvLf2cP8EdgdVeujWva4tTVQaSQZGYHNJhbBxj/klQc5j8htrj6tn5VyNALFNsm5FImE6OzVNVh
	0J3tpMtv/31ef+TgvidldXiiYjGBrWafLSlgYwhFdInIbbl5WJulnPcgALuxJ69fjEkFPfnLS4v
	vX/Du4zRguRkthrnOyYqpftZEVIO8z0dzm0oF9AGtIs7bJAx8PZQks4nIIyJ0jGxqawdZQbsrgk
	iMdblP2MSCTrc3Zm/Xknys6WRIAmQp2qjLGpMKkkYheWTNfU2TXQVVT8lczQ0GL5r7nEEHdtuPU
	3gCpB5bVW0KLBv3aLQpQDXIH34LObpgFhmwcX4KA==
X-Google-Smtp-Source: AGHT+IGmqX5I/gsSbo0OYZpkzL55wPADie162BgheSYksSOPxe1be8suWLG7insBAYljVigVlNkAcQ==
X-Received: by 2002:a05:6122:83d2:b0:559:79d8:27a5 with SMTP id 71dfb90a1353d-55b1bb60637mr240970e0c.0.1763052836952;
        Thu, 13 Nov 2025 08:53:56 -0800 (PST)
Received: from mail-vs1-f45.google.com (mail-vs1-f45.google.com. [209.85.217.45])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-55b0f46319dsm823142e0c.17.2025.11.13.08.53.55
        for <linux-renesas-soc@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 13 Nov 2025 08:53:56 -0800 (PST)
Received: by mail-vs1-f45.google.com with SMTP id ada2fe7eead31-5ddf9c25c2cso768574137.2
        for <linux-renesas-soc@vger.kernel.org>; Thu, 13 Nov 2025 08:53:55 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCUcOv6jcIYNGTxymq3rxtMPtHr38VLl73SgqEGIesYLFh0+Z7ZNOszQ9hg5UcEBj+o7p19qBNyHwilW76jeqACpKg==@vger.kernel.org
X-Received: by 2002:a05:6102:4b82:b0:5db:25b5:9b5e with SMTP id
 ada2fe7eead31-5dfc5b93ff4mr177461137.22.1763052835289; Thu, 13 Nov 2025
 08:53:55 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20251101050034.738807-1-prabhakar.mahadev-lad.rj@bp.renesas.com> <20251101050034.738807-3-prabhakar.mahadev-lad.rj@bp.renesas.com>
In-Reply-To: <20251101050034.738807-3-prabhakar.mahadev-lad.rj@bp.renesas.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Thu, 13 Nov 2025 17:53:42 +0100
X-Gmail-Original-Message-ID: <CAMuHMdWfHwht8VUSyWHJi90kgt1gnz7Nh4VEBfoBveaZsfquhA@mail.gmail.com>
X-Gm-Features: AWmQ_bmlVtkk56vOIDIOnwx-1JovK4RapbFc85Q7wu_rCX62rAKZtONV7Zi4F7w
Message-ID: <CAMuHMdWfHwht8VUSyWHJi90kgt1gnz7Nh4VEBfoBveaZsfquhA@mail.gmail.com>
Subject: Re: [PATCH 2/4] dt-bindings: clock: renesas,r9a09g056-cpg: Add USB3.0
 core clocks
To: Prabhakar <prabhakar.csengg@gmail.com>
Cc: Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Magnus Damm <magnus.damm@gmail.com>, linux-renesas-soc@vger.kernel.org, 
	linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org, 
	devicetree@vger.kernel.org, Biju Das <biju.das.jz@bp.renesas.com>, 
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>, 
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Content-Type: text/plain; charset="UTF-8"

On Sat, 1 Nov 2025 at 06:00, Prabhakar <prabhakar.csengg@gmail.com> wrote:
> From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
>
> Add definitions for USB3.0 core clocks in the R9A09G056 CPG DT bindings
> header file.
>
> Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
i.e. will queue in a branch shared by clock driver and DTS source files.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

