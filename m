Return-Path: <linux-renesas-soc+bounces-17374-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 55D51AC0BE7
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 22 May 2025 14:48:00 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id AC134188F325
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 22 May 2025 12:48:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6C12E28A70A;
	Thu, 22 May 2025 12:47:57 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-ua1-f43.google.com (mail-ua1-f43.google.com [209.85.222.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BEFC97485;
	Thu, 22 May 2025 12:47:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747918077; cv=none; b=FZySSrby29AolMc4nu8EcJvqvTZbILXL/hH8GzOkzYAwA+9QtcnxgbmLi9qfyXfNJTa0IG/d8dulyzrOVwDTkfqfmgI6yazpFrpuM0zG9LAy0KWNcM63OdjkooikBY0TsUVENwA7Ya6x2oTC4E0McPE/Cai3PR2gMJp/icwUJ7o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747918077; c=relaxed/simple;
	bh=hP0ZVfCB6JynjgSxdlf8Ytn61msPqRO9wKxhpLuC+w0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=um0L/SQr6LfLAbui6U6FEa2nMapVjsGTlqGEuADrKgbrgl1sm/JzxPy51Wz887LkFNXjyvdgwB+RrE0DQ3+v5BkHWoQqmvu2MFctmPw33P9ZaAUvD9oCyeH0G2TpU1RfwCVTXYYp8RiPNdjdebEY0WRMVqVryAKal/ZrwUK+kp4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.222.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ua1-f43.google.com with SMTP id a1e0cc1a2514c-86d5e3ddb66so2018965241.2;
        Thu, 22 May 2025 05:47:55 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747918074; x=1748522874;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=YCJg9GT5uNyVe/VWlDDnpoIcbRgnzipWItRk7Im4Jr8=;
        b=f0GNFVuMxRB5wxTQ+BtHInZ3LIWgQckrGzGwkMyQYYLeyFJr6T3eYpTvATl010thyn
         hINvhcl1biXtkZ/MKWBASHxiz2RHVTmWxo47jDJzTrWP/PBZZiNiC+OkxGmAbq8zQQUJ
         BT8V2KSH4vObCX0ZIQKreeHl4FMBL5sdeGsaZK+jy2eQU5sPmxYvwMH3vSBAFj0CO/PV
         aGSnXxN1TqaExtrvCsD9oWwkNTc4hAXZgc6LzdbEOjELhOEuamj/y+2MZFVMyjh/rBtY
         AXaXj/HrZFreAz0JhPbepz2ca3+JnPMaEYfWwvzVpjN1Ha/E7HOE6bjv8DhS8cJmJDXA
         mi/Q==
X-Forwarded-Encrypted: i=1; AJvYcCVrvDW2WKYqEb8blT5ix7JaR3iZal3wlGgUmUIyuaf+5nMRY8v6Rfnx5nZHJroff4HmMeGKCypZNe/1LThF@vger.kernel.org, AJvYcCWmQZFWTRWlFiY87KTg8PdrtKLX3oaqxpXBhWOO0AmseufslY2CzrKnwcrzSHi6Y6oB0F2ZPCSUJvCJ@vger.kernel.org, AJvYcCXBgvRkVkhBNWAzRk06tywqtaWEZoHj1BjZOp1DR5fRFB/DUQMfWpJZ7G+YeO/JrZesSchq0c+b4DjIO16doOc1cGE=@vger.kernel.org
X-Gm-Message-State: AOJu0YylM614htM1VDXbHTXtZP5cF3GLCFLaYjEpF2jKmx0BtJ5RWHnQ
	W++axv48y0KCIu9sDI51ySBr1zRZSzibZuF5yNBq5WE4w05QGyDUZDsSDQzGZbKJ
X-Gm-Gg: ASbGncseyEbldbTY8ZLEbuSXWNWQ9qaQuFmWYF7BjZ58HvKr4DT1HcTdk/q8jvvQSIJ
	7/iZgrFt/0NDBiFcwsUin9k1T0M4ccJF8aF3NTMi34zNpNtZ6tXjxbU/QQMqF+GIimjO/EksOp9
	HYKcl0LHt1Eou63Ts0uYqGY/9soqsgU8DqFscB40nKoK/hr0rCRzaPWBwN6nJIIfHCiqgzJs+A8
	3vCMNxawCsw0rpYlZXBNO4XYIOQUQPzv0zNRa5cALCZxiOEL3y72USBoETbW5LdNAZcd8Mh04kn
	27S+Az0Kfe5andBC7F45+eBa4tUAOAkWeA7OkqcPux1W0OTnkXJxj+xjB5i3OY5BH6nACC3V779
	KMzlei8QOcQreXw==
X-Google-Smtp-Source: AGHT+IHdyOva4wIfCYOZ2IwTqqrQSOJi3nWgpbJGYZ9TfW15OZILniaRNPYF8bUq4WCmYYEw/qb0NA==
X-Received: by 2002:a05:6122:4d12:b0:529:373:fcb7 with SMTP id 71dfb90a1353d-52dba971e52mr22453769e0c.10.1747918073929;
        Thu, 22 May 2025 05:47:53 -0700 (PDT)
Received: from mail-vs1-f41.google.com (mail-vs1-f41.google.com. [209.85.217.41])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-52dbaa5a310sm11894717e0c.36.2025.05.22.05.47.53
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 22 May 2025 05:47:53 -0700 (PDT)
Received: by mail-vs1-f41.google.com with SMTP id ada2fe7eead31-4e2b21d1b46so1098682137.3;
        Thu, 22 May 2025 05:47:53 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCVHCyRxbAUe+Rietez2pNJFH565pMAnuKo70qTYzn7aDzlJe6WUj3qkJvqRjP64mX/7dtSewtgXFldoP+Q8VI+YiSI=@vger.kernel.org, AJvYcCVnSi4qDsE767qauJNHLF+r9yr93EAQVdZdtoVhGVkJ7+Ln9UbFnpRh8PQi4zhuWwTiBMYiiMYhrhWz@vger.kernel.org, AJvYcCWFJeA476Iv7UfLTYkl1w8S0RaT2XIJNIONAGdLIJIAVWPuIbV+dsAEGvvpTuxmuYZMF/QNewNeK9s7GH7X@vger.kernel.org
X-Received: by 2002:a05:6102:50a4:b0:4bc:82f:b4e0 with SMTP id
 ada2fe7eead31-4dfa6c4654bmr22684749137.22.1747918073159; Thu, 22 May 2025
 05:47:53 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250514162422.910114-1-tommaso.merciai.xr@bp.renesas.com> <20250514162422.910114-5-tommaso.merciai.xr@bp.renesas.com>
In-Reply-To: <20250514162422.910114-5-tommaso.merciai.xr@bp.renesas.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Thu, 22 May 2025 14:47:40 +0200
X-Gmail-Original-Message-ID: <CAMuHMdW6kesMP3iMtH2jSqjSAnk_x89qpjtyoPQGdPmUbtMkyA@mail.gmail.com>
X-Gm-Features: AX0GCFtXLO5BdQeF_IoiBnjuZu-VH9hFwehgjj5K52FoECNfBeZfmLwxMOWCN78
Message-ID: <CAMuHMdW6kesMP3iMtH2jSqjSAnk_x89qpjtyoPQGdPmUbtMkyA@mail.gmail.com>
Subject: Re: [PATCH 4/4] arm64: dts: renesas: r9a09g047e57-smarc: Enable CRU,
 CSI support
To: Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>
Cc: tomm.merciai@gmail.com, linux-renesas-soc@vger.kernel.org, 
	biju.das.jz@bp.renesas.com, prabhakar.mahadev-lad.rj@bp.renesas.com, 
	Magnus Damm <magnus.damm@gmail.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Wed, 14 May 2025 at 18:25, Tommaso Merciai
<tommaso.merciai.xr@bp.renesas.com> wrote:
> Enable CRU, I2C0 and CSI on RZ/G3E SMARC EVK and tie the CSI to the
> OV5645 sensor using Device Tree overlay. RZ/G3E SMARK EVK is a RZ/G2L
> alike EVKs then reuse rz-smarc-cru-csi-ov5645.dtsi.
>
> Signed-off-by: Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
i.e. will queue in renesas-devel for v6.17.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

