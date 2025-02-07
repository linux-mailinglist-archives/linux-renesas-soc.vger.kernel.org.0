Return-Path: <linux-renesas-soc+bounces-12934-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 05448A2BE51
	for <lists+linux-renesas-soc@lfdr.de>; Fri,  7 Feb 2025 09:46:16 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 2D8BD3A33FD
	for <lists+linux-renesas-soc@lfdr.de>; Fri,  7 Feb 2025 08:46:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 157061C07EE;
	Fri,  7 Feb 2025 08:46:02 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-ua1-f46.google.com (mail-ua1-f46.google.com [209.85.222.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D565F188907;
	Fri,  7 Feb 2025 08:45:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738917962; cv=none; b=VpZRfV3FCv2n04Vf3UYBDaGjfRKIF1XUCLho7iLzGCRo+qpbOQqd+U2CaELHPDS0Wi8Kyvw5pfBJhCHXpC1qEiaNiyfdpSgO3HrBD51pMhGDqDCUkO5BvBq1pG38KwtbbHUdqs4d1kMFXErDUtY/+CxVTPUuuE0uRPmdrU7r+6w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738917962; c=relaxed/simple;
	bh=tGH/LJHtSvltl/2wWnLMmTUYy7/N+jR8UJEBZDv1WmY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Yox0GqJsn9hdYapBgyur/zYFO6futkOjp24U+WZTmxQnkPZgd9wlXcs+su8lElGQxLjIiaSCLBgPf/I5LxfalrvAMB8EX/LLQwUZAFOH7ScmGdisjLye6iMhV0RtCDtvTHV9KspnBjcVIdFcUvgWKtPNCg/e1uIzozDuaSQ+gOg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.222.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ua1-f46.google.com with SMTP id a1e0cc1a2514c-866de72bb82so496551241.1;
        Fri, 07 Feb 2025 00:45:59 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738917958; x=1739522758;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=PrfsSuBuxYDnwv4fDnJCi8TimNMLQ1Jpwnj01otBtek=;
        b=EwtVRarLSt3eeaNB0xMGQe5KavEXqvNJjuJt20lweJsHXv47JAQBFdOJ5jl1QB5El2
         HB+CWYYOWwzRiy5tF75NWTmjhP8HbOYnuZ67K0hevoyfitHmqm5jGOBN7VyeB291NIg5
         aeVdVkdqsRUBlHY5JVVPK/a9k3UYQRajxceRiQKfet58jUcME2lgFbSXhRqH39tvuz2v
         +DgLOUqom38SsEViw0dMjtHJGqpC8PrOXDHxClp2Qkdz6eppgbPqOAJEioKLk1Bf3KHQ
         fJe8oHp77hLpCAIPahqwL8+ME9OUoaHkHkkHbIWrba5Q9JRNQ2eXe6UMIPqubbSlSHEZ
         iVQw==
X-Forwarded-Encrypted: i=1; AJvYcCUkUeylctCNXOfb2YRcE7sJLDcxP9YIL0t0uWkDb3GjJ4/QECt0RPCeWqg9ESTdjOuoNMT6JXjrRDSqXgO9PiYEnAc=@vger.kernel.org, AJvYcCV9M38FJEdqgOv7A+s9zIgklGSF5COStrsSH6jY4zrkGzUtCAjQQRZV8Hta7F1VLAsIap14n3zqXeha@vger.kernel.org, AJvYcCVyPoLQ1m2pKmKIt7OccxaQCgvty3AxFjoXiggIGI3NN389Q9rSqH7HBheKatqVn/b1c96SxEzizYjCDdFJ@vger.kernel.org
X-Gm-Message-State: AOJu0Ywqch6S3ThJx2898QpuXP6dPBIZsWVEku4TEjRChzImpkp4PiA3
	UqzUkq/XyelfjUkEizViCzvffHggPEEf1aqn/K8xwwsBUPExB3zyC9JfU4nF
X-Gm-Gg: ASbGncsAKDwljW8tTvwIDxDYMOboLGvP1AIcXa1/qV6x1vtpPlOu0ex3Af9FNjH+8LJ
	4aW+B+n2pe0mAGFH6CytYm/f67eP6ceUlvvnG8S3eTlQklcLVBNpItaUn01JDwkn57oJAnVVpwK
	7zS2Fl815P1RFnmn7ox0OEZbaua2f2W5LQzrThpn3NbJuIEhyPcHdlhQjy+tSOIiFakcsfJNvZc
	MSpAk6y9vAAkXqxSyn0OX7JKTcv6Q5NurJP37oUcKc+tFQne5F6OJeVhdkHoivxOjHTmnynPm43
	0IGvgEAXuqhAADXk7uIsNlXksIUOTV7N2g0uWVPAjAYsydHbb5zX8Q==
X-Google-Smtp-Source: AGHT+IGADgy4QmOQhKkQixBVY+Z7qJm2jORHkXbmNvjF7dVjQWSqdPOAFc0sCHaT27htkX8rLFEJZA==
X-Received: by 2002:a05:6102:3907:b0:4b9:d227:a2e2 with SMTP id ada2fe7eead31-4ba85da60fdmr1182288137.3.1738917957714;
        Fri, 07 Feb 2025 00:45:57 -0800 (PST)
Received: from mail-ua1-f52.google.com (mail-ua1-f52.google.com. [209.85.222.52])
        by smtp.gmail.com with ESMTPSA id ada2fe7eead31-4ba77305d6csm555032137.29.2025.02.07.00.45.55
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 07 Feb 2025 00:45:56 -0800 (PST)
Received: by mail-ua1-f52.google.com with SMTP id a1e0cc1a2514c-866f771cd5bso389382241.0;
        Fri, 07 Feb 2025 00:45:55 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCU6x6ylH1ORKLR0v7KcKJ+r191xj1Wszb7IdHgcrJkK8mmo4xWxHvKC0HFC454cfQkKPRA5/STP/IWb@vger.kernel.org, AJvYcCVi4jgFjiGXRJMSvbz8b7KdKY1PigGA+6vKvjvrxjTsgQcoVTvErWGcJqh43u+IpmQkFCO7WyODAu37pp7exiLRMVw=@vger.kernel.org, AJvYcCXha5FIuaQl0wPu+/N8LwQfz0+QewQPOuHXph0wxYkg3bir7HqLw+zgc9YwrGFJD2Ia3LElkSpOIqWP+0Zq@vger.kernel.org
X-Received: by 2002:a05:6102:158b:b0:4b1:2894:1048 with SMTP id
 ada2fe7eead31-4ba85e2de3fmr1311753137.10.1738917955556; Fri, 07 Feb 2025
 00:45:55 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250131-myir-remi-pi-v3-0-2dda53e79291@collabora.com> <20250131-myir-remi-pi-v3-1-2dda53e79291@collabora.com>
In-Reply-To: <20250131-myir-remi-pi-v3-1-2dda53e79291@collabora.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Fri, 7 Feb 2025 09:45:44 +0100
X-Gmail-Original-Message-ID: <CAMuHMdX8wnzjUrEbo8+5z8SMw==doM4gy8OZ-vxzS3EbZ-0xyg@mail.gmail.com>
X-Gm-Features: AWEUYZno8bC8Bv7xoq5IUzfC5Z36nN5bEmTAMbmgn4lpeJz3lTQwHEApyIY4Md4
Message-ID: <CAMuHMdX8wnzjUrEbo8+5z8SMw==doM4gy8OZ-vxzS3EbZ-0xyg@mail.gmail.com>
Subject: Re: [PATCH v3 1/2] dt-bindings: soc: renesas: Document MYIR Remi Pi board
To: Julien Massot <julien.massot@collabora.com>
Cc: Magnus Damm <magnus.damm@gmail.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, kernel@collabora.com, 
	linux-renesas-soc@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, 
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Content-Type: text/plain; charset="UTF-8"

On Fri, 31 Jan 2025 at 10:58, Julien Massot <julien.massot@collabora.com> wrote:
> Document the MYIR Remi Pi" which is based on the Renesas
> RZ/G2L ("R9A07G044L2") SoC.
>
> Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
> Signed-off-by: Julien Massot <julien.massot@collabora.com>

Thanks, will queue in renesas-devel for v6.15.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

