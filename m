Return-Path: <linux-renesas-soc+bounces-11831-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 129C4A00E14
	for <lists+linux-renesas-soc@lfdr.de>; Fri,  3 Jan 2025 19:51:59 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 9C98E7A1999
	for <lists+linux-renesas-soc@lfdr.de>; Fri,  3 Jan 2025 18:51:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BFFE11FBCB6;
	Fri,  3 Jan 2025 18:51:53 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-vk1-f182.google.com (mail-vk1-f182.google.com [209.85.221.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3A6EB1FAC49;
	Fri,  3 Jan 2025 18:51:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1735930313; cv=none; b=CGNh9gib/fBqn9wUH4Pu+PkI41+asADcWWbv6baF2J0oump6sCM9UbwXC97K3Yn3uURlkF5D6B7DAcycQ3LSYmHk3nHwfal8wScXbNXwS6HKDLLEiKK4/duNY7ap63vfOcj9ikYPIHwgpGp5P89+V1709878jdSbpVTeUVJ2NdQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1735930313; c=relaxed/simple;
	bh=i6AQPNm8kweBoFAB3WaCxDVdsRTW3lpzSrXmCL6h2f8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=BAnZvv8cYhz/ROUFpPxPYVTqf9WW5as2zZlMMTQSaYvhfiYj+UNTdEu6tkrSbNeQmA44AfEr7oWJS2c9UhqpgJU++5GoKI7IE/A85YImlKqeLPeKNFJIG+dY8paw/tAKtuJZtWce2daC0J9mdAR24VT1BAawcGYrY2yRTLpgRRg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.221.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vk1-f182.google.com with SMTP id 71dfb90a1353d-51640f7bbd3so3793123e0c.2;
        Fri, 03 Jan 2025 10:51:52 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1735930311; x=1736535111;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=sZy0sbitpsA/U06Jvg9KjvfY+VLijKd/wneOC9eJIZE=;
        b=ESL1Ae1YqhDc1ZOJtw2hfFh2xb1HdQlSJwg35+Iqaer7kfHm3dhB35DFYjUOmIAAYR
         LiiP/D0efbKgtOJtlBFLMQnHvog4pzwXC0aNNsfZh43I61pJm6qaUaHQ3oDvXEtRKMEW
         /Z1+IFWjHx5znV0MNhkVk5YAM9ZhLuLZE+REyf5UG/TeysWcoLIWYNdtWf+2w8vfCpfl
         ckNiECTu0sXHc6zLQ4/97PXCaxiu1drkhmBji3+lb22/HnHSCF2L9ESBkHxGGYKe/lL+
         y9H7OHJniYQhLACRVhCvF/epzmUP76aq4CPrtlzxC8mVlqJD61IYIQqe9/Eg7c1OQ/Eh
         VFKA==
X-Forwarded-Encrypted: i=1; AJvYcCVl/fPKZonhRgpQxDNq/oJwibbaVGGDh5Wsv37LutKf0LTqEhHk42lasJq+oF6s56aeGE40lcJyLvkB@vger.kernel.org, AJvYcCXP6UcIpjGbgm34zbCr3stU2x75ECiGwPtpoLCVgoKMD+bumjFQqRh2f2EBQpd4EZ2uUFWXkXXKtU8mrYFhUWGOUxI=@vger.kernel.org
X-Gm-Message-State: AOJu0YzUWY7zC5JQU5ZAgLi7EKM3EcUO3hYRCuQni/UrcpZOlIjXjEjl
	ni4W6vZQ0+Tq5plmJQfNh4tG5sSce72b1Khd2fJjbIwX35RgcLdjW0UCmv9lFsA=
X-Gm-Gg: ASbGncuKjNlLtUOJD7anGE/DnobcJjSFbWdJIUXIL8mAyK4B//QybPAfYmYqy8Ae3OY
	FDKqnD9uBVYF6vX/curzclIuhIe4OwzscXxSdOumC89XbjN/+qK3mb16csQ8WbJW9kPTx52351i
	/PmYjEpOGKSby/EW8tXu10L40WNLKk9nKKX27/WZWyUaj29Lv4yLO+B7u2JDJhqyVtPtbbmqlu0
	aoNpUxhL3pWw+6QI48Ayvaw2F6jSrlhzNHL6lvNf8/a3bDcmG0msn5+OczQ951L9RhZwnxb/BJT
	2GDNIDWppncUwDrDC/Q=
X-Google-Smtp-Source: AGHT+IHReo00BXUxem2Safs+rLd2q2yR0tpnChV4i5G66tpfbljreTmv+JOzHtvEEeQ3zMDccB4SYw==
X-Received: by 2002:a05:6122:4014:b0:515:4ff6:10c1 with SMTP id 71dfb90a1353d-51b75abb4b1mr35107736e0c.0.1735930310152;
        Fri, 03 Jan 2025 10:51:50 -0800 (PST)
Received: from mail-vs1-f54.google.com (mail-vs1-f54.google.com. [209.85.217.54])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-51b68bae028sm3343547e0c.17.2025.01.03.10.51.49
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 03 Jan 2025 10:51:49 -0800 (PST)
Received: by mail-vs1-f54.google.com with SMTP id ada2fe7eead31-4afd56903b7so3159623137.1;
        Fri, 03 Jan 2025 10:51:49 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCUcy5qSk4IQBQ58cLDhokf3WichE82XwvyStoSLWsE9O6fd+DR9uIeSp94vCxQeHakcB/0OA091NezOzzwtL+x/SOQ=@vger.kernel.org, AJvYcCXynjzbuulZ2L0ujnAqnDAI7DHycPLB3SQWOTxAkTowRItHuP0epx6KwZGO3SogGQCM8h6Pffat7tdi@vger.kernel.org
X-Received: by 2002:a05:6102:b04:b0:4af:be6e:f0aa with SMTP id
 ada2fe7eead31-4b2cc49d580mr29184306137.25.1735930309401; Fri, 03 Jan 2025
 10:51:49 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20241216195325.164212-1-biju.das.jz@bp.renesas.com> <20241216195325.164212-8-biju.das.jz@bp.renesas.com>
In-Reply-To: <20241216195325.164212-8-biju.das.jz@bp.renesas.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Fri, 3 Jan 2025 19:51:37 +0100
X-Gmail-Original-Message-ID: <CAMuHMdVnvdtoR5Vh6gr6g1WYpz=Hrp5vPgeLDRoqsuV32oW1Pw@mail.gmail.com>
X-Gm-Features: AbW1kvaytxgcyt0xnRlb0IXcqu1F5fMFoOwoi-dBPuH8P40MKYmon79rYHdpkj0
Message-ID: <CAMuHMdVnvdtoR5Vh6gr6g1WYpz=Hrp5vPgeLDRoqsuV32oW1Pw@mail.gmail.com>
Subject: Re: [PATCH v4 7/7] arm64: dts: renesas: r9a09g047: Add scif pincontrol
To: Biju Das <biju.das.jz@bp.renesas.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Magnus Damm <magnus.damm@gmail.com>, 
	linux-renesas-soc@vger.kernel.org, devicetree@vger.kernel.org, 
	Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>, Biju Das <biju.das.au@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Dec 16, 2024 at 8:53=E2=80=AFPM Biju Das <biju.das.jz@bp.renesas.co=
m> wrote:
> Add device node for scif pincontrol.
>
> Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
> Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
> ---
> v3->v4:
>  * Replaced rzg2l-pinctrl.h->renesas,r9a09g047-pinctrl.h header file.
>  * Retained Rb tag.

Thanks, will queue in renesas-devel for v6.14.

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

