Return-Path: <linux-renesas-soc+bounces-10148-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id A069A9B05BF
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 25 Oct 2024 16:26:02 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 3E8C7B22CFF
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 25 Oct 2024 14:26:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 852831FB8AD;
	Fri, 25 Oct 2024 14:25:50 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-yw1-f172.google.com (mail-yw1-f172.google.com [209.85.128.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A190E7083B;
	Fri, 25 Oct 2024 14:25:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729866350; cv=none; b=Q4FxeJzmE7IhPBFGbHdZl3jt7Z+cdwQxhpTuBiaXFfaTxmrRdMR6a4PJnmMNEhynvrvOqB5Apa9PKglpsEiOl9rYeouacg5eYyqKbXKFvfIEoSEydeaJQBpxpHdqD5dMxf30+jR6s7AqXa4QsSeSR7sbThudmGQEoTyqhM980as=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729866350; c=relaxed/simple;
	bh=7txhSpB1+LMaw3Qah4BUAhFDpA1PiJakkH7Bn+HLxyw=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ZeEnOD59LFQhTK+j4IGiIHpcv7+jU+LuaEnHNaRxNJQO78zTj8445PmzK4GG1CkQf8ZlTp0mD52oTF0qYEh0HEqV6O3I0+XTqCBo/Wid976b1PnQvmByaAG0yYhvBOAtbQ8BWEHd4kUSU4/PqNf9a+O0RSNtnNiEJELBkGAeEVE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.128.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-yw1-f172.google.com with SMTP id 00721157ae682-6e39bf12830so15633567b3.1;
        Fri, 25 Oct 2024 07:25:48 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729866347; x=1730471147;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=B4rAyIN9uUnDFzo3sF3mCIr3j07Xy0cr6D3dVjJ9Z0M=;
        b=W/xS+RRWa3rzTvP3GavTWtsDvQi4ZGT4N2/ui38sq0ta0Ay+mjqQ8A34pm4eZYFkGC
         h1rANr8Vi7y/56nJ/+c4zVk6EQlOBi3NHjCs+kaVzgDRr4imj6RJW37VFS32FcvQ69IH
         kCqVLuzmmsDj5cC2RPC01fr2boSSBgmsjE+dPmYlgjOJrgaSrZvHjDvpqabmYjHMWNrL
         88KVRpjz0QBieBYtrxmFU2Is5o7jtBcjD4qVsDLgM3TLY08sfnHwUMFvvPhOXd4K4kve
         twx8GGBAb1XUtrhDKa+WsFR2kuW5snos9gbxIqLQ3aj5NezKeBjg0pFFkuSpsUWCb6Z9
         Ogqg==
X-Forwarded-Encrypted: i=1; AJvYcCWpQEZi4qSvudE7onifAcvBkkXwBhJNMzkzzHAYXjL80TA+zKNbRSG0JU/egG1us7xq0+r5AUULuCM7@vger.kernel.org
X-Gm-Message-State: AOJu0YyBFLRSKN4YEtCCvuSKzNRy54eiAoGK0zixquPQ2+km9VHPg5ix
	Ibsquegngr0eO/gGKok+fdgc084NFJc5c/k5NFAxOIu6kh5zToAryWwDb8E2
X-Google-Smtp-Source: AGHT+IHVEdeymALrkQcn6CSrUhpshg8jBO8bT2ryLkaVmfliqWgj62lZ5szRKbi1tXWeEv6pNnKElA==
X-Received: by 2002:a05:690c:6c05:b0:6e3:2dec:6b01 with SMTP id 00721157ae682-6e842f881d1mr48969897b3.4.1729866346541;
        Fri, 25 Oct 2024 07:25:46 -0700 (PDT)
Received: from mail-yw1-f174.google.com (mail-yw1-f174.google.com. [209.85.128.174])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-6e9c6c987dasm2929877b3.129.2024.10.25.07.25.46
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 25 Oct 2024 07:25:46 -0700 (PDT)
Received: by mail-yw1-f174.google.com with SMTP id 00721157ae682-6e314136467so20734587b3.0;
        Fri, 25 Oct 2024 07:25:46 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCUqdiIafcY11eIdgvTJhnqzORv7g5bIuxPmM+89r83m840iEU2bm4KlMyMfTR4A/U338eTYeGryzSXZ@vger.kernel.org
X-Received: by 2002:a05:690c:11:b0:6e2:4975:43bf with SMTP id
 00721157ae682-6e84aac3206mr51041117b3.3.1729866345903; Fri, 25 Oct 2024
 07:25:45 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20241015224801.2535-4-wsa+renesas@sang-engineering.com> <20241015224801.2535-6-wsa+renesas@sang-engineering.com>
In-Reply-To: <20241015224801.2535-6-wsa+renesas@sang-engineering.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Fri, 25 Oct 2024 16:25:33 +0200
X-Gmail-Original-Message-ID: <CAMuHMdWtq9TNhnmn2Zxz8Q2sd18A2TGL_BtPe6SEpXBNEExTzQ@mail.gmail.com>
Message-ID: <CAMuHMdWtq9TNhnmn2Zxz8Q2sd18A2TGL_BtPe6SEpXBNEExTzQ@mail.gmail.com>
Subject: Re: [PATCH 2/2] ARM: dts: renesas: r7s72100: add dma entries for MMCIF
To: Wolfram Sang <wsa+renesas@sang-engineering.com>
Cc: linux-renesas-soc@vger.kernel.org, Magnus Damm <magnus.damm@gmail.com>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	devicetree@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Oct 16, 2024 at 12:48=E2=80=AFAM Wolfram Sang
<wsa+renesas@sang-engineering.com> wrote:
> Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
i.e. will queue in renesas-devel for v6.13.

Gr{oetje,eeting}s,

                        Geert


--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k=
.org

In personal conversations with technical people, I call myself a hacker. Bu=
t
when I'm talking to journalists I just say "programmer" or something like t=
hat.
                                -- Linus Torvalds

