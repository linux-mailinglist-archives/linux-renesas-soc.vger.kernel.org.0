Return-Path: <linux-renesas-soc+bounces-9193-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 2BDF998A70E
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 30 Sep 2024 16:30:47 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id CF5162809C8
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 30 Sep 2024 14:30:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 28F4D18FDDF;
	Mon, 30 Sep 2024 14:30:42 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-yb1-f172.google.com (mail-yb1-f172.google.com [209.85.219.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B20D923D2;
	Mon, 30 Sep 2024 14:30:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727706642; cv=none; b=lGeGZZWYJ/x1n3NK1to4sZwEXg9IfvJpLkeYXCQtgqqt3W3dscSNt9F5YMZV6cb+kaP3jAtKKPn3/KAOwcIxwLnapB4+t3vGmmEQ6MOycSY4mEsziHWPzd5o8NQgozUPoUgwwAhx7GnWHS3LAygr13c+9X8kN4mtYlgFAGdnymw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727706642; c=relaxed/simple;
	bh=MGcnCNqoEXzmE6FYl89rTUEJWSI/J4QNKOU9Kc4vO3w=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=nDdDNReMH/zZGN4jebcX95ZjHOxnc9Mfz04ay6cYoOJhc05Dt/TpT3mgfefvJ75QZ2IeRB418IFEy8CAy5PtHqxm0MUJsVGVFQMGBI8lx1L0u+DxMOjQKCyn+xveMMHcjxuv1f1UTZ95Jynlp1YKGDi9/a37E0V8inEh6F/ZWtw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.219.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-yb1-f172.google.com with SMTP id 3f1490d57ef6-e1d06c728b8so3916088276.0;
        Mon, 30 Sep 2024 07:30:40 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727706639; x=1728311439;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=YKcxK9GNB9gaSWI8ggATPf6ww114POrT/2xNc2BTkd0=;
        b=WMcqpH1/K+/xK62UvEswXsA3NspFQrrrmS4ei7ggOvcoqitMVHUIAkRjCzCftuehAY
         P5XYxCOMbzRLtGWO9K4GkEaEFMbtEdSdzK0I1xi12n/M0HQri8rq7CH/ZM/kiQFqvOXh
         BPRMGraRYXH7gm/sflT/NbcuCEX/Scxf5zXxQlJyebF5T5Re1oHJCyHxn8kfFw3s2wsA
         OUAdiqTrc5Sw4SXJObHGuJt2AUeucb4QAOI+A2R2RmVk9OaItoK2Spub5VBsOYf31eX9
         71rSlo+ImyjC6mcaj+qw00p6bF8OI0d/qk6RKVcBs7zmYYGdal6rYZ72XeYmBVvmSlL4
         UFEA==
X-Forwarded-Encrypted: i=1; AJvYcCVZ0LZr7emEMAA3SmNy3X+kCrlNnh2gJbW+bikrCbvTHJKEY6NTdgjtbCZY+izwEcoHsWY0czEcyLb+@vger.kernel.org
X-Gm-Message-State: AOJu0Yz5sjpTJ0fc2n892ZB/kT8lbtsYejPUQ22a+jcSUODSPBopVCdT
	rehadRP7uPCTD7PeMVn2CBXEPMOZ04ztiuTGvXnEq6pW/hYa7CKHKNIUcTet
X-Google-Smtp-Source: AGHT+IH8yBxqMokPzSq5Y9oj7Q+Tx7eUAIyt3sLuKaPaKIcHL4eLMPwsV8zffVkv6OT31e0pFg8jfw==
X-Received: by 2002:a05:6902:1b88:b0:e26:d4d:6f6c with SMTP id 3f1490d57ef6-e260d4d6fdemr6373598276.7.1727706638511;
        Mon, 30 Sep 2024 07:30:38 -0700 (PDT)
Received: from mail-yw1-f169.google.com (mail-yw1-f169.google.com. [209.85.128.169])
        by smtp.gmail.com with ESMTPSA id 3f1490d57ef6-e25e3ef9b55sm2352808276.5.2024.09.30.07.30.36
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 30 Sep 2024 07:30:37 -0700 (PDT)
Received: by mail-yw1-f169.google.com with SMTP id 00721157ae682-6dbb24ee2ebso39536387b3.1;
        Mon, 30 Sep 2024 07:30:36 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCUnJ42pWqOnlSbNSzZYkZc/nPzjhiPYbkAGSXgqfhrHmSCmQthlnHDT2tQ6O9M+d2CQlrKfPaLOiH2q@vger.kernel.org
X-Received: by 2002:a05:690c:ecc:b0:6e2:1467:17b4 with SMTP id
 00721157ae682-6e2474d0cfamr93105497b3.9.1727706635924; Mon, 30 Sep 2024
 07:30:35 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240927095414.10241-6-wsa+renesas@sang-engineering.com> <20240927095414.10241-10-wsa+renesas@sang-engineering.com>
In-Reply-To: <20240927095414.10241-10-wsa+renesas@sang-engineering.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Mon, 30 Sep 2024 16:30:24 +0200
X-Gmail-Original-Message-ID: <CAMuHMdVujUuPcydbipvW3F34-_3h6q2Bjt2vMeDbxrYzxoYVqg@mail.gmail.com>
Message-ID: <CAMuHMdVujUuPcydbipvW3F34-_3h6q2Bjt2vMeDbxrYzxoYVqg@mail.gmail.com>
Subject: Re: [PATCH 4/4] ARM: dts: renesas: rza2mevb: use interrupts-extended
 for gpio-keys
To: Wolfram Sang <wsa+renesas@sang-engineering.com>
Cc: linux-renesas-soc@vger.kernel.org, Magnus Damm <magnus.damm@gmail.com>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	devicetree@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Sep 27, 2024 at 11:54=E2=80=AFAM Wolfram Sang
<wsa+renesas@sang-engineering.com> wrote:
> Use the more concise interrupts-extended property to fully describe the
> interrupt.
>
> Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
i.e. will queue in renesas-devel for v6.13.

Gr{oetje,eeting}s,

                        Geert

--=20
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k=
.org

In personal conversations with technical people, I call myself a hacker. Bu=
t
when I'm talking to journalists I just say "programmer" or something like t=
hat.
                                -- Linus Torvalds

