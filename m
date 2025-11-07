Return-Path: <linux-renesas-soc+bounces-24302-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [IPv6:2605:f480:58:1:0:1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id 57128C3F054
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 07 Nov 2025 09:47:52 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id DD6704E82C2
	for <lists+linux-renesas-soc@lfdr.de>; Fri,  7 Nov 2025 08:47:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0502125C6E2;
	Fri,  7 Nov 2025 08:47:28 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-vk1-f174.google.com (mail-vk1-f174.google.com [209.85.221.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7ED3E26529A
	for <linux-renesas-soc@vger.kernel.org>; Fri,  7 Nov 2025 08:47:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762505247; cv=none; b=QbI0zDfcuZSsRVbUxlJumg3qUOlgZbcRoMRPfpVO0bojdhK0rxYfpjLiS4KOJwVPkz0AxjhWvrZ2sX1NB4s6KY9J7RFwWHV4cun8m9gqSecV9kqduAz9fYpmM0Qz1sW3G0m3eUnC+bAdd71y+7V+pzH3+Vkf9fMZSfQIxVkOQes=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762505247; c=relaxed/simple;
	bh=PvYF/sHPuMEq+8fWLIPGoI5jyBD3PEX35Mu+Vy6V+Yo=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=NvzCbMU2RAqvwEBWbzP4ue62nexHc3h2X6/EfrCBFGGzxhjGUtk0zOMHSN0nvIGsbcPyqVcg51aKqUkuOv99SGxPMEVerQpkbM87Wo7G1K8uYmN1aZmKgUvlD7hqz960vJuGKksRw5k6AEEP66K1VWpqkC8o2B8EK6JkOqW6IKM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.221.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vk1-f174.google.com with SMTP id 71dfb90a1353d-559a46bc9d8so67393e0c.0
        for <linux-renesas-soc@vger.kernel.org>; Fri, 07 Nov 2025 00:47:26 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762505245; x=1763110045;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=fv84lgioVMsP5SXRt5RM+4CQx1zYwL7FI4sF4TISOrk=;
        b=nOsKrZlntSeODw5gNBi1tT0zCsxkq8cTR731P7dvaO85jLmekGR8gQR6wNfCHAfUke
         stzpqrlcYI9l5reEmAe+aBKTV8MnDOdpgneA+j9CcNuH5izWoeB+xQ1ExQvj9eF4ifvP
         wKynHIrUEeb6tWMVON0Mx420Idh5RWQRkknAQbQzn5eQFi7d48QwR+w6UriRgJi85Ibm
         4QDKDh+n3N8UzI8LO4WlJBa7/EfeuMladaSEkZMFUnMYnszHm39A+vPaScYjYEGbOFYT
         CwrbXSQ1C65st72iJPinio5qbrN2qAXktkyLL8R8T15Z703ZzK4I0rlIe3FYvgtBUeIR
         WVOA==
X-Forwarded-Encrypted: i=1; AJvYcCW1tksMqSQmV0eNRwDTGvjZAWPI//99e3yfXo94wew6EClTEzdZfpIMUX1I9h0fqLVwxOKglwOVhxy0lWPf5/D+8A==@vger.kernel.org
X-Gm-Message-State: AOJu0YxCQH/9j95hvZ9NtKFfpyFgIr9fyJj2DZkJK1rboKIn6qdWnxl2
	a+i0/v0iKQhB6Xjwre2ErgbPU6vXBkiDx+UNEQaucKhmDdjiN3K6TcYAlP9noNkcB7c=
X-Gm-Gg: ASbGncteDSYTqThLg+xQcp8r3Pi3PB8wvCPBHaGGyfPhV9C8N9RmWxyZglM+t4iwFFf
	jSL5aRREZKSwl0ljkUx1OvKySMF1FmBTQ4bMeL1gUwoEnXSU+AEK7l4HOFpACY7ddr647HUZ2Wq
	UUDyV95Gdx8cGYPPL38S9K+2Lz+1megZXVKnUClbI5XKtiaBsWY/uqX2XZ3fLFniOiM04wOzxJh
	bmR9oZTlDT7UZzcX58LnkOAEV39o3WEQqXDEMtOy2cuWPqc+RkxUTXGXBiPjwsojbcBDfjrab6W
	PK6Jv0KcBBCshOqQFStU2Hz21XU7/HfTh9Ec+aIyyAsbHnkGDosCyQXggJGhfv8sY00VJOnNm0d
	SXX2YOdDr+LlKDa6NVmGCY17jSor9l9vNIhweXLHRhH4NU+me6C9Npe6QqoDobJRj2cJtbJmYvZ
	cdagXdc5U3F8906aJvV4cPeGVMkkRjDxTZfpHrKJXnIM6rnewU
X-Google-Smtp-Source: AGHT+IFsoFZbdlVBYhmWTjfVwnKD4cpInFJbFN8ttyducYprm9XaIcKscUJDvb+//1iqhw2f64Rp8g==
X-Received: by 2002:a05:6122:1d87:b0:54c:3fe6:627b with SMTP id 71dfb90a1353d-559a3a0d67fmr682112e0c.3.1762505245196;
        Fri, 07 Nov 2025 00:47:25 -0800 (PST)
Received: from mail-vs1-f41.google.com (mail-vs1-f41.google.com. [209.85.217.41])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-55996e27abdsm2409469e0c.4.2025.11.07.00.47.24
        for <linux-renesas-soc@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 07 Nov 2025 00:47:25 -0800 (PST)
Received: by mail-vs1-f41.google.com with SMTP id ada2fe7eead31-5d758dba570so218958137.2
        for <linux-renesas-soc@vger.kernel.org>; Fri, 07 Nov 2025 00:47:24 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCXcZeVpLe2mN+h66Ov74KvSXladq5lBxsBHe55TiMyl3Z+naIsYA3pXmqvht2HAQisiBUWfofiFLUPcyd5seF3ULw==@vger.kernel.org
X-Received: by 2002:a05:6102:3747:b0:5d5:f6ae:38dc with SMTP id
 ada2fe7eead31-5ddb22b0cccmr751397137.39.1762505243558; Fri, 07 Nov 2025
 00:47:23 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20251106211604.2766465-1-niklas.soderlund+renesas@ragnatech.se> <20251106211604.2766465-5-niklas.soderlund+renesas@ragnatech.se>
In-Reply-To: <20251106211604.2766465-5-niklas.soderlund+renesas@ragnatech.se>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Fri, 7 Nov 2025 09:47:12 +0100
X-Gmail-Original-Message-ID: <CAMuHMdWPTXCWPeYn0jSyLLYrA8EGZyOO7K8SJ6uJP-szvzZT2Q@mail.gmail.com>
X-Gm-Features: AWmQ_bnEzOQ8SOygg45RRCWr96B-LQAx_Y_KqMAbz1TsbUr3CSh72EhCGj54kt0
Message-ID: <CAMuHMdWPTXCWPeYn0jSyLLYrA8EGZyOO7K8SJ6uJP-szvzZT2Q@mail.gmail.com>
Subject: Re: [PATCH v2 4/4] clk: renesas: r8a779a0: Add 3dge module clock
To: =?UTF-8?Q?Niklas_S=C3=B6derlund?= <niklas.soderlund+renesas@ragnatech.se>
Cc: Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	linux-renesas-soc@vger.kernel.org, linux-clk@vger.kernel.org, 
	devicetree@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, 6 Nov 2025 at 22:16, Niklas S=C3=B6derlund
<niklas.soderlund+renesas@ragnatech.se> wrote:
> Describe the 3DGE module clock needed to operate the PowerVR GPU.
>
> Signed-off-by: Niklas S=C3=B6derlund <niklas.soderlund+renesas@ragnatech.=
se>
> Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>

Thx, will queue in renesas-clk for v6.19.

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

