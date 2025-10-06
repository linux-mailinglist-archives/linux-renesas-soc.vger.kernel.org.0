Return-Path: <linux-renesas-soc+bounces-22715-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id D3B55BBE803
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 06 Oct 2025 17:35:29 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 6ACE03A4039
	for <lists+linux-renesas-soc@lfdr.de>; Mon,  6 Oct 2025 15:35:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E5FDE2D8367;
	Mon,  6 Oct 2025 15:35:27 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-vk1-f173.google.com (mail-vk1-f173.google.com [209.85.221.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 706A0283FDF
	for <linux-renesas-soc@vger.kernel.org>; Mon,  6 Oct 2025 15:35:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759764927; cv=none; b=BwfaEi7SfvUT525RYKOhTBnq/wUydOJUMxIz80MqNv7Qk+TfnrSADEpRxfIgE0R9vHuIemJf9YmgFXZ9X4QZgkZyrbdp1eIT4TO3FX3zlGLmOIcRf0ccArwU8xourgrUsdQU4mDWr4E/aWsUe/jVOd5K9K+DK0phvw6GnWrc1gM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759764927; c=relaxed/simple;
	bh=dSnfb3yL4QKj2jW1vkztCLpaRi4oy5M2m+qzcux2G/c=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ZetOSJ4grdfbBAS6vCY/mhh82kZmm79bMGqtk0jzzu5hq7OBNvgyKBjV+huVFabVMqjT+ao8OqlUv6wJrh/6NYcMKAfJojf4mwIFWzj0g3QGmjXY2OqU9TqzddWAjLi4CwWy3GhkdB3doEFWX6ROuAoGa9KprXn5lZ/mwtszL+Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.221.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vk1-f173.google.com with SMTP id 71dfb90a1353d-54bc04b9d07so2007853e0c.1
        for <linux-renesas-soc@vger.kernel.org>; Mon, 06 Oct 2025 08:35:25 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759764924; x=1760369724;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=+jg3+SSfQDF+38T7p3MLG0Dd2g8S6PQVTqm3cXu4YzM=;
        b=bjwKWknWov0DlLnLJA/Z3nOl9UBmjSaRGsQjzWaoMkALEY4oqZlDFRIIrds30QGGRo
         KdS2KhIU3nTk8YiBe12/7vbEjuMvfuQRmbgtzRevSypSL52/DuZZxT0u7xlPiMkos7Ja
         DYH+BDT3yz4hrvMaXQMmLowW83TWXCtoefLEtLfndUYYRQxKnxJ1NKevF7GuuqoDVduo
         0QO2exbnYSUPOQmqB8NBxhBkmOl5LgXNte02BM1azPDt+poykerH4hrxvY5xIZQ2sqFv
         nyCZDLeAEJmZYdiWZlMXnnR/yYsB0JvmLUCL05zGC8/uzrpsIQ4+wevStmd/kai77FNS
         QFYw==
X-Gm-Message-State: AOJu0YxZc1dMtg5T9OoJ0YOQKCaPlG84I7Udt3qw5vAtm1Oa1GraBaGB
	U6ghDGXFteWL5rYnemKsZCWGeO8EYxrM5bFvD1Lfn/Cts7gpJSMNJ8dIVYxtuasn
X-Gm-Gg: ASbGnctpgugyLCfXOf821F8H7zydUJJ3JceVs9MoY/uDCya4IhCbI+BLH0nvrx03aic
	RL0+21r30n1eFAT8euhDlB76G+3at0NNb7psVOPKhxqqGHKQv+inwIYUyqEwAPGynkhp0Bq4SDJ
	2JaDbh/trjeD9ykiQaJV48+PYgOooSqtT4NlsXwgQwjH1fYFxj4b3CLuCRssQcqzMuswUWoP06n
	H5bDZmnSD/MdaWPzcygfihOF34O6KY10oV0db3UIMzuaG6kFWLJE5ygU6e3SzKeCk0DnIjEdkOb
	l+Id07tOOo7t5mlWgCkNVfcI43vpPwni9fmRmhVHg/wuXnJMIq8fAZjlVyerKlIiMJ/SccmfjHU
	PW6nXKUL5dvVtg4fKRaRrgaPi0io5eECha5Afic38eiPzRwodaqqu9bD6KN9bPq+bf4bi2BStl6
	PVk7qALz/e
X-Google-Smtp-Source: AGHT+IHpyIiYEv6ZccXK+rOis/WwFvQigRvUJhObZ3X5C8cb3kQu2LliXl2rl5PozbFz7slonOh+nA==
X-Received: by 2002:a05:6122:1da8:b0:544:8d16:4541 with SMTP id 71dfb90a1353d-5524e93ed0emr3818881e0c.7.1759764924008;
        Mon, 06 Oct 2025 08:35:24 -0700 (PDT)
Received: from mail-ua1-f54.google.com (mail-ua1-f54.google.com. [209.85.222.54])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-5523ce0f84dsm3105470e0c.3.2025.10.06.08.35.22
        for <linux-renesas-soc@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 06 Oct 2025 08:35:23 -0700 (PDT)
Received: by mail-ua1-f54.google.com with SMTP id a1e0cc1a2514c-90f6d66e96dso1458350241.0
        for <linux-renesas-soc@vger.kernel.org>; Mon, 06 Oct 2025 08:35:22 -0700 (PDT)
X-Received: by 2002:a05:6102:5793:b0:54e:76ce:8fb5 with SMTP id
 ada2fe7eead31-5d41d001020mr4224388137.9.1759764922078; Mon, 06 Oct 2025
 08:35:22 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20251006082520.10570-11-wsa+renesas@sang-engineering.com> <20251006082520.10570-16-wsa+renesas@sang-engineering.com>
In-Reply-To: <20251006082520.10570-16-wsa+renesas@sang-engineering.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Mon, 6 Oct 2025 17:35:10 +0200
X-Gmail-Original-Message-ID: <CAMuHMdXwhsYjHvHPjtGWmSJTp-Zu_5ZNB8P5dqYED-iR1XRqUQ@mail.gmail.com>
X-Gm-Features: AS18NWDaGoDl0gW_ZVX7-GNkRqZENsT-45ppIcJcSJ-FeFiGnUMc-x4usiLGAsY
Message-ID: <CAMuHMdXwhsYjHvHPjtGWmSJTp-Zu_5ZNB8P5dqYED-iR1XRqUQ@mail.gmail.com>
Subject: Re: [PATCH 5/9] arm64: dts: renesas: r8a779g0: add SWDT node
To: Wolfram Sang <wsa+renesas@sang-engineering.com>
Cc: linux-renesas-soc@vger.kernel.org, Magnus Damm <magnus.damm@gmail.com>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	devicetree@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Mon, 6 Oct 2025 at 10:29, Wolfram Sang
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

