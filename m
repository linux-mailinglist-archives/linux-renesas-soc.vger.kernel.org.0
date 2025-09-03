Return-Path: <linux-renesas-soc+bounces-21264-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 97DA7B41DA6
	for <lists+linux-renesas-soc@lfdr.de>; Wed,  3 Sep 2025 13:54:12 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 40D6B54821C
	for <lists+linux-renesas-soc@lfdr.de>; Wed,  3 Sep 2025 11:54:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E6CF82FDC43;
	Wed,  3 Sep 2025 11:50:14 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-vk1-f169.google.com (mail-vk1-f169.google.com [209.85.221.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 65DD52FD7AA;
	Wed,  3 Sep 2025 11:50:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756900214; cv=none; b=aQShCCuyaIfgJBg3/Ts0Ard2yFRpeq3LgDHSAJZZob8UZJHwbhIwyUEwIoJL3nVczOHdmxUGDuXPYjGMBkIQ7/qtIppYY1CO19b3WHp7TyjX5Z+8A7BYWiZdY9QcvZj89NYea0O2lzotOP9iusfnAUQX9hWltsgqpsuJB+qHE/0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756900214; c=relaxed/simple;
	bh=AajlOWxKjdUUTWn5YhuS4qyYXyvVposyJBHLXEtO+zY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=N1MCnrTSeFaDsWh/YWoRn5rOpw/U2I8WwS7hz908hYzNN1YgAqxeumCJnOuomaWWXFtg3rYtJq9TFKweYFtjc8ohnr+9AwUZNIhQT8edZCAg0Z/yOzBMyLjk/fnCV86sXwUb/CXg2F5VxhczgrTtyqnW2OpECZLpqCu5ZMyaS1g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.221.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vk1-f169.google.com with SMTP id 71dfb90a1353d-544c598b9a4so554547e0c.1;
        Wed, 03 Sep 2025 04:50:13 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756900212; x=1757505012;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=GQI0UXrUkQSMrCEFpXzweLyUjhoJrUViHuXf5BvhEGU=;
        b=FGdPMoGhgmMe4tTXrH/W82a4439Si0vkAnY9SHbyrzC310d4qiJTi8eeRe3Q+62NwO
         l36LDDqf6z5/wgsnrJ0umGJtA5nfhrQ4fzLnU3nWzHBdWeLbl3LnWGYHUVez+kigvusm
         jmXIdAh8DS/2g9z2NbhxH8wn9mqYG9dXeWUZIBLzD4X3UiwH2siimB0i1cx6Znqj99gA
         UZyUygZMaw0M7FL+HN+In57pb+iY/3Y51K89YY4LUvoSZ1FY9AW2Cp11N2jF6Ll1IRPR
         MhAfgYBXSnohVCTWDo++O5O8s4rOgmKr2t2k33Rs4FaTsujnpLhGzzQNyw9126rmb9/X
         vPzg==
X-Forwarded-Encrypted: i=1; AJvYcCW4HldL9VjK/Ml/jpyAyglhJ+5mRisc81CUtpApxx0/lmd8g+ouVkVePTFgQGyw05++0nJI8EEpQXHT2rf5@vger.kernel.org, AJvYcCWFPNtkMzhgcwCS7v0vCIDla6q1R6FFDg0wEjdtZHe9da2F5y1ugERrFbMNjm9jP+NWYS6ysm/xY+UGLKwFXwx1BsU=@vger.kernel.org, AJvYcCWmOfu32ug+PRB4dEo0oULYzf5AGF7EUOPZPf5JbwedFNSXTfHHn5r5k2DBsWFEsFKNZHjlVLP5xdSF@vger.kernel.org
X-Gm-Message-State: AOJu0YwYGMl59HAnjUuc3xkRV2iv0hSnyB8WzCc3OLAPfPkbIJcCHWmr
	rd+GW7+iCEcmoR9YlKO2Wm99PrgGc0oEfQbP2PZgPyFmadlg3AB5zGiRNWglfq6k
X-Gm-Gg: ASbGncu+zp75ZBSQDkAp/RcB1NtLXEXNFUfJnY4PPWXF6T+0+EmnG6p9u1wBWAX12t0
	KZqTSJ/2QOZvWKsyHAHhsLA5XZ7ieZUIZSS9LbJ20Jqwo3RdOrrVCyGDjKqKx6+QjwGddv7w4hE
	HOv+OlGZ8WDyt73j+u7m7X+x3DCPlpVCDdU8sU0dZjPeuBh4ZH9h9+MhU5pP9u86WcRIzCu2Bh2
	dY8Wv0jh8fnQCdxySjnfbNTBiRNyK5wcnIqnSzPtuutIk4pwYphuK7dICLG1YKdGntqhymAdTLH
	IiGXJ06t4e4xhFHSTtmyVloZDL4KqlHIp0/ADldbPo2bDUfuxfxH1b1n6lYDnG91BKKeuxKEEbi
	iKpa5OaYiy3709NkZ9uOvMy9EWCByKctZxFjEPuIX42TaKrgSv857OpRd5cn5WTrMk/3M6Mo=
X-Google-Smtp-Source: AGHT+IGvrEikKFHlM9y5Ms3GQmcfLRUSYNykFsAuR5iEced9APZlM8BhkjkJ0/+DJUTEJy22CUzR8A==
X-Received: by 2002:a05:6122:3d06:b0:544:754e:a51f with SMTP id 71dfb90a1353d-544a025787fmr4333542e0c.11.1756900211999;
        Wed, 03 Sep 2025 04:50:11 -0700 (PDT)
Received: from mail-vs1-f46.google.com (mail-vs1-f46.google.com. [209.85.217.46])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-54491464bd1sm6570664e0c.19.2025.09.03.04.50.11
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 03 Sep 2025 04:50:11 -0700 (PDT)
Received: by mail-vs1-f46.google.com with SMTP id ada2fe7eead31-5352d06864aso67949137.2;
        Wed, 03 Sep 2025 04:50:11 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCVr3fYx5whQkTDVa8zSAVlSeC8CnRLRFUFkO9dKuLqfftDq1Zgpql5ZlAcvWkCVTuTjngTBB49fgV1o4EdkX8gnMFM=@vger.kernel.org, AJvYcCWmg9Zb7MGcOyx1nMB1SV1FcjI0AxdF8vuW3WZ4wKgmtXKT8BcJeSubx0HEH+omKkcEu5gevkJpMuLeWBFg@vger.kernel.org, AJvYcCXNRGQnf1bPNddf3NrvvBafjG2AIrrOYgsLwxGVse25HfB47YY907kgcJIWRhR6S3KolH5h++Gms/Wl@vger.kernel.org
X-Received: by 2002:a05:6102:5122:b0:528:72e2:431c with SMTP id
 ada2fe7eead31-52b1b2eca9dmr4253399137.21.1756900211522; Wed, 03 Sep 2025
 04:50:11 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250820200659.2048755-1-prabhakar.mahadev-lad.rj@bp.renesas.com> <20250820200659.2048755-7-prabhakar.mahadev-lad.rj@bp.renesas.com>
In-Reply-To: <20250820200659.2048755-7-prabhakar.mahadev-lad.rj@bp.renesas.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Wed, 3 Sep 2025 13:50:00 +0200
X-Gmail-Original-Message-ID: <CAMuHMdXW42jX1TZdf4L8wm_krnBtfApQpvTD26hOjWfzLeV0NA@mail.gmail.com>
X-Gm-Features: Ac12FXzJv2dh0IHvLOVKCGqJwWUfJgvoMZyFOjJZpmkcLRGSMgxrrOmhwbeAH5w
Message-ID: <CAMuHMdXW42jX1TZdf4L8wm_krnBtfApQpvTD26hOjWfzLeV0NA@mail.gmail.com>
Subject: Re: [PATCH v2 6/9] arm64: dts: renesas: rzt2h-evk-common: Enable
 EEPROM on I2C0
To: Prabhakar <prabhakar.csengg@gmail.com>
Cc: Magnus Damm <magnus.damm@gmail.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	linux-renesas-soc@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Biju Das <biju.das.jz@bp.renesas.com>, 
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>, 
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Content-Type: text/plain; charset="UTF-8"

On Wed, 20 Aug 2025 at 22:07, Prabhakar <prabhakar.csengg@gmail.com> wrote:
> From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
>
> Enable support for the R1EX24016 EEPROM connected to I2C0 on the
> Renesas RZ/T2H and RZ/N2H Evaluation Kits.
>
> Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
> ---
> v1->v2:
> - Added Reviewed-by tag from Geert

Thanks, will queue in renesas-devel for v6.18.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

