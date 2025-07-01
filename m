Return-Path: <linux-renesas-soc+bounces-18965-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 7DAEFAEF6E0
	for <lists+linux-renesas-soc@lfdr.de>; Tue,  1 Jul 2025 13:42:37 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 446F3447B6B
	for <lists+linux-renesas-soc@lfdr.de>; Tue,  1 Jul 2025 11:41:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C5520273D70;
	Tue,  1 Jul 2025 11:40:59 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-vs1-f44.google.com (mail-vs1-f44.google.com [209.85.217.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4CF0521FF54;
	Tue,  1 Jul 2025 11:40:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.217.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751370059; cv=none; b=IrotC+wYsa5BIQ1P3vDGCmR14AxKDDqAJyXg+J0fdj/QA9Yl77MeGTgCq4uxxD/9PdD4D4fNRtCfIyeVh0Pn9W4LaRDMhMT41+SmYhNuZs81DfWnL1kmwFR7t4BS1Ph6yoX5Stl0azi4ypAA5iG+MLwWJJK/hjwxHlB88DvM30c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751370059; c=relaxed/simple;
	bh=qIJIH4YEhbCS95kpqgXnKstq4YnYq3JUHTlRdSwEEEE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=U59r1s/1sC05+NEK/5lUXrl6GtjiucC4+d69+UW7wEc1qj8qBiF4JtCqOlOBm8R8mFLeAiywNWRnUnUlTclmintFk/zCYNJnJr1rBidxT4IpxJBwCJdGKmHC7BacK4zTGl8aQBcgijOw1hR8yTcQatrbDw5LTwAaKTkyYoAH5Fw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.217.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vs1-f44.google.com with SMTP id ada2fe7eead31-4efbfe9c7a5so1503856137.0;
        Tue, 01 Jul 2025 04:40:57 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751370055; x=1751974855;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=AOcRi6B5B+dvEeJlg+Zfz3o6xVyLAxTKeohAHCWC9j0=;
        b=Iu1j8hbztnlo2KBrmnsfFEgd1Z0TACgctv5pmbQ7AHT/qQmkBMXGu5HrNtzOERduSQ
         epQG6qFPEgPDkd4VZXv7ISUiMQXQekQRlOZM37k24m2Dcrtl4Xdw5niVIbF6bVioS63f
         GStNAmK4py2gW5z6HlVKfqKAK+z2ACP6ZEq8BasqYDfsuXbGa+rKzfITM+x8dChS5bVC
         Io3QuksR1pcjTEbZd8oPCc7CMYeKYOLFhrnLASBa94lwUK1qrb8XyruxkUGU/3+jrNp1
         HV7+1FEyqCu5OiG2ABpAXIDcZ6DFJvjpn34QwMlVdyVCKM+/yntMvJ9O9OO68xSuhzBx
         coRQ==
X-Forwarded-Encrypted: i=1; AJvYcCUFiEw30gAzFSMFtpx7p0JRwo8NvYZ/XicoBqad4aFXMAbtXeGNri8DQfiWjd8q97LEV/LJYwQZu2U6aQbE@vger.kernel.org, AJvYcCUejM+o20o/GHj6VXcv6r9/vi10O8FKLvPgkEwBKWZeUEcoOWmKSL0pwtHLe55IWRNqNyoJek3Sn5q1CRmVPJ/RgaA=@vger.kernel.org, AJvYcCVJSt5ZARXyM5PKx/ll1/mspITh/tqfWdWhuuatGD/9IstIW02UPlQSN2/mmwzh3/Jk74/BA2EoWlQb@vger.kernel.org
X-Gm-Message-State: AOJu0YwZAMbSm23cK6uX2RSaUxUKwIz+eceWJl45Xp1lXpJdL84cEOc+
	/6gSfIGN5w9wf3ut9Qc70qwMnRIgruy0k4GJtZE89Kw54O1FZCnmP10z2RMN+aVe
X-Gm-Gg: ASbGncslS2QsIsPY5ADPXJYsTnKcqtxhyw8QLqmv8qmxOfDgL6qmxPkt2QtfI51mdeZ
	L4J4BfPz3tfi8cJT3DS5DaqSXlCvzLTzxGQmMxNFhNuNA3yJ8PJhJLHSFOv+2krpfyy5/mNoqHF
	4aW18clqpT0p4TTzy5TcAQlCQA+/hXBiU+cQEQALaeMZUERuz7Roq8HxK0EHcUbcUd3i7EWOR57
	hxuzw8mDLs3UsBDtw2mesNW6qCFCOs7ajaOKuI0Jz68qDV6vurMDty0AGZvKOjyx3s+cJvD6eRE
	7h26EasXfi0u+kb1RKaH9LupQtzmWSywuzN7pifzyImcIcfsRR53TmjmOW4YgbMqJdOQFRYOkq8
	ESMMOZrK0KyHXvk2a6LMSTpOP
X-Google-Smtp-Source: AGHT+IGxWU3FxFZMtqSI7OX4ETJDg0vlzmtRADulKJ0ub2J+pxF6f7Y1AZsPElZjEfzosh0+IUjAWw==
X-Received: by 2002:a05:6102:41a1:b0:4e5:5c14:5937 with SMTP id ada2fe7eead31-4f143abc1e1mr1927600137.1.1751370055228;
        Tue, 01 Jul 2025 04:40:55 -0700 (PDT)
Received: from mail-vs1-f52.google.com (mail-vs1-f52.google.com. [209.85.217.52])
        by smtp.gmail.com with ESMTPSA id ada2fe7eead31-4ee4c79e97fsm1550536137.6.2025.07.01.04.40.55
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 01 Jul 2025 04:40:55 -0700 (PDT)
Received: by mail-vs1-f52.google.com with SMTP id ada2fe7eead31-4efbfe9c7a5so1503842137.0;
        Tue, 01 Jul 2025 04:40:55 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCUawgtQOi6bwcVShmmIhFU9YxDDg6n8N/kI4Y/v5WSqiitk1oh5CnEqIkqxCLdLHdpOFH8Nt27bJfPux1KXarnn42U=@vger.kernel.org, AJvYcCUcd6i6K52jlcdzXGUQlF7y1jPwebjZbDyoG2QNF91ihcqs0Fo4ggesVwssDvcTwXL/Ju5he+T1MYYijmLr@vger.kernel.org, AJvYcCUw5xRqBpp8B5yQHLYxFQH8grGLIVPX5sCdRW2PLCNhECX+bc+SitZtm+NAl3fuNT5atfp49KmmAozB@vger.kernel.org
X-Received: by 2002:a05:6102:161e:b0:4e9:963a:a42b with SMTP id
 ada2fe7eead31-4f143c3175bmr1810651137.8.1751370054766; Tue, 01 Jul 2025
 04:40:54 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250624171605.469724-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
In-Reply-To: <20250624171605.469724-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Tue, 1 Jul 2025 13:40:43 +0200
X-Gmail-Original-Message-ID: <CAMuHMdWAsbN+oXS8jUPSLs2hebyi7WwQ0ZarO=gVT9vO4pM5nw@mail.gmail.com>
X-Gm-Features: Ac12FXwnT1ii07TJ8Qwnos5t26OYrAnHgWO9yirgVE6UX7f6jYpLQJf2pbez6pQ
Message-ID: <CAMuHMdWAsbN+oXS8jUPSLs2hebyi7WwQ0ZarO=gVT9vO4pM5nw@mail.gmail.com>
Subject: Re: [PATCH] dt-bindings: memory: renesas,rzg3e-xspi: Document
 RZ/V2H(P) and RZ/V2N support
To: Prabhakar <prabhakar.csengg@gmail.com>
Cc: Krzysztof Kozlowski <krzk@kernel.org>, Rob Herring <robh@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Geert Uytterhoeven <geert+renesas@glider.be>, Magnus Damm <magnus.damm@gmail.com>, 
	Biju Das <biju.das.jz@bp.renesas.com>, linux-kernel@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-renesas-soc@vger.kernel.org, 
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>, 
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Content-Type: text/plain; charset="UTF-8"

On Tue, 24 Jun 2025 at 19:16, Prabhakar <prabhakar.csengg@gmail.com> wrote:
> From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
>
> Document support for the Expanded Serial Peripheral Interface (xSPI)
> controller found on the Renesas RZ/V2H(P) (R9A09G057) and RZ/V2N
> (R9A09G056) SoCs.
>
> The xSPI hardware block on these SoCs is functionally identical to the
> one on the RZ/G3E (R9A09G047) SoC. Therefore, the existing driver can be
> reused without modification by using `renesas,r9a09g047-xspi` as a
> fallback compatible.
>
> Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

