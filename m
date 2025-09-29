Return-Path: <linux-renesas-soc+bounces-22448-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 4B76DBA94B7
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 29 Sep 2025 15:15:17 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id CE5DF189079D
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 29 Sep 2025 13:15:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D8F4F1DE89A;
	Mon, 29 Sep 2025 13:15:13 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-vk1-f170.google.com (mail-vk1-f170.google.com [209.85.221.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 334F91A3167
	for <linux-renesas-soc@vger.kernel.org>; Mon, 29 Sep 2025 13:15:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759151713; cv=none; b=iQe30kmGlCDUh51MsIKJ+/xvXlKluh77KF610nREvgsz1U01w4iPDvA/mcHPVIGDuo1CNGyYhANnnylxAB5y7yidDN4W1qSOl2R06doOSNgTvUpD8W7HZy6RFEpTpTS24WuEmjz5lSd4jC6FmSl6t5ZnUZr2xbMfYDxkXT1/rYw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759151713; c=relaxed/simple;
	bh=25QVpmBoR7pVggVi8SCeBBL/ftaE/xNScWjYKPGOX4c=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=qlfwHUBxYyFyxuwWRckJ8+X8PA2r40dyBInoUkR9O0x456h1BTqlASbrixGc557edaLBtEjPe8aHs7XTlibbexjcI2USrDcY5V845tCGg8fRrO5qbujzwU+wph4UHh8dz7OKV1d2ye1kTlWJYMnF+D4GcCkzetJdMtUHVVWLB4A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.221.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vk1-f170.google.com with SMTP id 71dfb90a1353d-54bbaca0ee5so568644e0c.3
        for <linux-renesas-soc@vger.kernel.org>; Mon, 29 Sep 2025 06:15:11 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759151711; x=1759756511;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=cSc4pwxNOa0392isOmyuqWj84KWUJBERAZ3w9UdjLTA=;
        b=fHlX/zptArbmFnwOvZLlUjTJx4dT7mBzrULnU1OPqGnPVY3EQiZ/aY+W5w6l7xIEw4
         Ekl8JxrsiJWpvJ4Kypg9FOu2FJyY2dQNS7rY358B3IGcd10BfHoeAtC8Z0FOSS1sUqV8
         QDtDHiXTkq1QFT6beKSLx5M0NxvE9cP8aNzQinZn+E3Eh6KYRjoQtb+934qZp1m+t4Xs
         oHQXNk1aSWEUbafnagMlgAeMNFSouy9m9wUi9Uly0JfpqvPpalQNP3FCzSy+BMFaPYpS
         pOqmYMZgnvLlfawMQ1KXcbwrvTmlJBLvIR1ODZtrAkkZx39xOSk1rqITAN3SlwBv6r3O
         uKkQ==
X-Gm-Message-State: AOJu0YxAALxwTij5l8m6ZquBtxD3a61KC4jIzLA4PULns64YHsUzEn96
	ILWs173ZzQyNwVGJi5RCtXqQAbdyOU8fK+YnZYq3B5U+iTtpiQPG8ciOT6sFxICd
X-Gm-Gg: ASbGnctkalpYlyJp0BQI3wu/9QJMmOF6wCc3VT+KodIWWIJWBxcsuY6RiPSVrzKbdwZ
	R7F1FSpFS527bPB9kp7jTqZm6M6LoMFKQWQtoD/o9xXXbSvPNKhJF+67momOlb6GzaBSlgwFUo6
	9P066d9eNxkhS1Wub+YivAq5y/+unljkn+Kp4v9aoMOWlskBc7WLnxSBL/b1jFWY33c3H5UiVCH
	0fH2dQ/5iADD8Tw2Zv2TK+X4nZU+e5p2MAqDJLaq+B+S2QkCwn/QhJmZHXSbUCCs6L1Dv3ICe/D
	hBl9eWZCwieHB+KsRP+j7Msqv+Vo327uoXelqBH9nK+swqembubJLcjCw//c5HtGz8emzjsw69N
	TuIwO5cuRfht09jSOf4Oi511ATqJWY5E64ZIW1mC0vkgKSxa7vtkMcU20ciYTgPwB
X-Google-Smtp-Source: AGHT+IGgmu2spdPyGdcaAq0RdLj5imDQlsVfVZTAoZtWQhfn7/KAsNaSonAVWBvCSa+XmMKUsTbZeg==
X-Received: by 2002:a05:6122:7cf:b0:54a:a1f1:ef42 with SMTP id 71dfb90a1353d-54bea1c094amr5513117e0c.5.1759151710610;
        Mon, 29 Sep 2025 06:15:10 -0700 (PDT)
Received: from mail-vk1-f173.google.com (mail-vk1-f173.google.com. [209.85.221.173])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-54bed881e81sm2240682e0c.2.2025.09.29.06.15.10
        for <linux-renesas-soc@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 29 Sep 2025 06:15:10 -0700 (PDT)
Received: by mail-vk1-f173.google.com with SMTP id 71dfb90a1353d-54ccb693131so137894e0c.1
        for <linux-renesas-soc@vger.kernel.org>; Mon, 29 Sep 2025 06:15:10 -0700 (PDT)
X-Received: by 2002:a05:6122:308e:b0:54a:23dd:5a9e with SMTP id
 71dfb90a1353d-54bea190263mr5089492e0c.3.1759151709973; Mon, 29 Sep 2025
 06:15:09 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250925093941.8800-14-wsa+renesas@sang-engineering.com> <20250925093941.8800-16-wsa+renesas@sang-engineering.com>
In-Reply-To: <20250925093941.8800-16-wsa+renesas@sang-engineering.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Mon, 29 Sep 2025 15:14:58 +0200
X-Gmail-Original-Message-ID: <CAMuHMdW0Ub=pfdPunBuXC55nQa_iu5W54jMcx714Bhmb3KZWFA@mail.gmail.com>
X-Gm-Features: AS18NWBMxS3buGoOE_HDNs7xKX5YTZcMVNk8miT3zn1LyOl0EOjllS70cwOh0nc
Message-ID: <CAMuHMdW0Ub=pfdPunBuXC55nQa_iu5W54jMcx714Bhmb3KZWFA@mail.gmail.com>
Subject: Re: [PATCH 02/12] arm64: dts: renesas: r8a77960: add SWDT node
To: Wolfram Sang <wsa+renesas@sang-engineering.com>
Cc: linux-renesas-soc@vger.kernel.org, Magnus Damm <magnus.damm@gmail.com>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	devicetree@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Thu, 25 Sept 2025 at 11:40, Wolfram Sang
<wsa+renesas@sang-engineering.com> wrote:
>
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

