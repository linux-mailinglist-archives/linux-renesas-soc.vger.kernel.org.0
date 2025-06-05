Return-Path: <linux-renesas-soc+bounces-17870-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 0D222ACECF0
	for <lists+linux-renesas-soc@lfdr.de>; Thu,  5 Jun 2025 11:37:52 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id C54687A7B9A
	for <lists+linux-renesas-soc@lfdr.de>; Thu,  5 Jun 2025 09:36:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2513220E31C;
	Thu,  5 Jun 2025 09:37:47 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-vk1-f174.google.com (mail-vk1-f174.google.com [209.85.221.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9394A1FC0E6;
	Thu,  5 Jun 2025 09:37:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749116267; cv=none; b=SLjqNq5BSugdKa9dmyp47MGv/Z88yzNYYmeUXjWokx8sU8TGZI7NwjYCM1IYZrkPkdNLaaBML27M3oqO/Wdb1j1+WoGnl1gjbHIZhzLoFFaWlRp6yW/Z/41tMKxgsmuHw6dbtoxGaGhZShpTm09Wgqs9txLqM52hM1FUYOiwnJQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749116267; c=relaxed/simple;
	bh=fg1aGXNTXEoDQOcsUXAjgvHx6B9lsbMV7HXDWbj5rvY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=KfamkWir2q0a2aoObtsFRrJKRTBLir4hAVExcDwRkxtRonWBp00pukv7yRiXLnNEaQqevg67BDfTHw34OeTIVmPJxcR2F868L+ESQDE6AwxJ1tz9ODaMLJrLW1uuJS+zXIpoEGrVph/0bJ8W8fKFAuLj/CvONokldnfLVF2g8fU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.221.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vk1-f174.google.com with SMTP id 71dfb90a1353d-52f22008b6aso337171e0c.1;
        Thu, 05 Jun 2025 02:37:45 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749116263; x=1749721063;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=e2EfADjmE624Fyh9KxWEFW8BFZQjPOGIHUNDJwkrSIU=;
        b=oeoeY0QYSS1z0AOyOwdyXxcBFBJkq8+5yaDecQkjZR2/N7b8L8SrfDEcD5gIy8hwYs
         hHqKDc/AZaesPq5exFpPlAe8ZHza3sY0gom8Jsl1dHr9EQ8V4Sfm74TorJ7ncuxm/rnc
         EvfVwVJ7CJIpU0fMspm6MSYntOBKkxKHC+Ed7q3VabpZlJZaPtHmVBc7oQehjFr+UZE/
         oit7qlit4vNqwVgsKWEmDfaayLppIHJMh2R8zKIIqW4TABKRvloJJvkwa3FbeFhlIOm+
         ZHQflfT+jrSkiYM2z45xRDAc2YZZBq87E27nYp4nO7aq1p7oZ/yNnEP3sHSbZyHaAsAc
         fIwQ==
X-Forwarded-Encrypted: i=1; AJvYcCUQSoQOmM5ja2VVNL8jmPMsCcH7B1J7lw8uGpsFpgbp6Py6alQa1xourUVYpf6oAw5HqB6PPqiuPK8B@vger.kernel.org, AJvYcCVUWVKAXm5ibHtfBrLIDxg0IbTD+6UntuJICs4jO73nH+ct8iTWiSqN3FNjDjs/+CJLmqbf814Z/JzS9/+F@vger.kernel.org, AJvYcCVvEyj482WhejVPFlMKeaqHIHl6z46gr07X/4XEIUyc43i0NDFT1bDqE6p7/mv6FMfeF7iMEkRH5GM3@vger.kernel.org, AJvYcCXZxCZ1Fqiwn0uuzRwXKbIepuFh2nWlt7IRvqpWQ2uKmShbIEZywec6Pi2DC5JmVoSyo+zuhdO0bVgomgDuXtFne34=@vger.kernel.org
X-Gm-Message-State: AOJu0YwUcOio8q72BmjLAv6n4dYDgfYJsXAShONCorjzXpYfqpF2PKxB
	BTwggevF8ccd0ecuTgKJbEruo4lvovqqO7QlaNy+IguUbq8M7dIuKVqfYuajs1CI1EQ=
X-Gm-Gg: ASbGncvVzvwUj0tcPWnhN+m80AdjFDVlzKhryY6JM9aSbBcapNpbry0i0NhHOPF5Td6
	3YwqpzCqGXFCuopeD67d5DOHEN2N++F+3YJu/Xu8Eo3vtQjLoQ8DWM82A8nO9/S4W9DxJaqFW0K
	UIEdBl4PCVXiXhUKFWACB1tWgbhZUZ7qNA0FIpDQK9oSQl+MwYddF55Q13V+kZb52cMa2gbpbq2
	5qbx5cuysBHt5bx7Ybk8u68kdGZd69f/eY3kZe4v4Gr8edj7RCYFRFXkNYmq0xXRfHrW/La4LNr
	zFv97Xoxg3N1b+a65y4K8OrnFOv3+etbwwp8ejakK3mdzDPPQ/foCPxq8ftiqbfxRA/+D93Y28R
	GWehMWdB6mE6avw==
X-Google-Smtp-Source: AGHT+IH2Gv+tmZTW5+lmLqXxdMZBlUkMuYUG5YU/l+oUH6DCEqBUNgnCqCKmv3sts9Nh6kS+7GWKGA==
X-Received: by 2002:a05:6122:30a2:b0:52f:4680:1c89 with SMTP id 71dfb90a1353d-530c734132amr5155649e0c.7.1749116263440;
        Thu, 05 Jun 2025 02:37:43 -0700 (PDT)
Received: from mail-ua1-f54.google.com (mail-ua1-f54.google.com. [209.85.222.54])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-53074ad9192sm12185876e0c.17.2025.06.05.02.37.42
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 05 Jun 2025 02:37:42 -0700 (PDT)
Received: by mail-ua1-f54.google.com with SMTP id a1e0cc1a2514c-86fbb48fc7fso219594241.2;
        Thu, 05 Jun 2025 02:37:42 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCU9T/y3TuqpsLbFUWe1h7rEqGwSGkCd33ehYosTHmAF1EHlVa8UbGtF8PFdOxeb5QyHF5CdaywhnvOn@vger.kernel.org, AJvYcCV05+dksz4Nrd3LxKkZrB3DDKwjBYCtLmPLn7tFaHuLuOiO3W9GXBxgnusX8XwlA/xo3paMjY3Ki77/pUD3@vger.kernel.org, AJvYcCVUl61We3ye2ppFZP1RJ9xdqS8/FOBufCZHxZhXq+wcEWZz/zRrqg8NSgt/ZU655FytsyqUtV5prUFN@vger.kernel.org, AJvYcCXN/2HAfe1YzfbUKTvhtsdqWgPcPs6jXt0sb6AkiD6YRtkS6ogBwrRkLw0RpuPN5CRvtj9j0R91Zv4nrRYEmXZM+Yg=@vger.kernel.org
X-Received: by 2002:a05:6102:50a6:b0:4e6:ddd0:96ea with SMTP id
 ada2fe7eead31-4e746d06f2emr4558564137.10.1749116262530; Thu, 05 Jun 2025
 02:37:42 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250527112403.1254122-1-claudiu.beznea.uj@bp.renesas.com> <20250527112403.1254122-8-claudiu.beznea.uj@bp.renesas.com>
In-Reply-To: <20250527112403.1254122-8-claudiu.beznea.uj@bp.renesas.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Thu, 5 Jun 2025 11:37:30 +0200
X-Gmail-Original-Message-ID: <CAMuHMdXoY5LYmtbbGrwD5P4+o4PWbccUb4xjCoJ1B8zz9OT=WQ@mail.gmail.com>
X-Gm-Features: AX0GCFtl4mbnGF63n4nje_xT9I8tTxn_TjXGn-vyOODMB09Wy3aTMOHUiazDwKY
Message-ID: <CAMuHMdXoY5LYmtbbGrwD5P4+o4PWbccUb4xjCoJ1B8zz9OT=WQ@mail.gmail.com>
Subject: Re: [PATCH v3 7/8] dt-bindings: clock: rzg2l-cpg: Drop power domain IDs
To: Claudiu <claudiu.beznea@tuxon.dev>
Cc: mturquette@baylibre.com, sboyd@kernel.org, robh@kernel.org, 
	krzk+dt@kernel.org, conor+dt@kernel.org, magnus.damm@gmail.com, 
	linux-renesas-soc@vger.kernel.org, linux-clk@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
Content-Type: text/plain; charset="UTF-8"

On Tue, 27 May 2025 at 13:24, Claudiu <claudiu.beznea@tuxon.dev> wrote:
> From: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
>
> Since the configuration order between the individual MSTOP and CLKON bits
> cannot be preserved with the power domain abstraction, drop the power
> domain IDs. The corresponding code has also been removed. Currently, there
> are no device tree users for these IDs.
>
> Acked-by: Rob Herring (Arm) <robh@kernel.org>
> Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
> Signed-off-by: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>

Thanks, will queue in renesas-clk for v6.17.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

