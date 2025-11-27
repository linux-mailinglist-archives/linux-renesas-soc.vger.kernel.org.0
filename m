Return-Path: <linux-renesas-soc+bounces-25297-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [IPv6:2605:f480:58:1:0:1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id C4836C8F8B5
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 27 Nov 2025 17:48:55 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 6AA4C4E04A5
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 27 Nov 2025 16:48:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 623D031282D;
	Thu, 27 Nov 2025 16:48:52 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-vk1-f171.google.com (mail-vk1-f171.google.com [209.85.221.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 97AD121CC7B
	for <linux-renesas-soc@vger.kernel.org>; Thu, 27 Nov 2025 16:48:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764262132; cv=none; b=Da1zMVp3d4HdY6Qv+t9N0dllEvGzhSOrodCo4n7IYnBfTlrYwTby43lpj02ZNyC2geZZjkSRPzPAz/8aIg7Rvu4mb3ZCdYTIX8Sm5If68/JJD/Md6iJC7btn3SB9nGQ5kxVk++haZR8oBqrb1abZYH4jzQ3/KE9pzjqvrmlDQs8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764262132; c=relaxed/simple;
	bh=gELghKW0OPh5kQTULgvSsg4yXlnP4SGeldvFp7Xpo84=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=c2VbtQJObKbILmXDAOBCSV6JDzLmOqAHoQiSL1SUEYQaRMuvjoDJ9VPwK5AXsS7NNg4Sr2knPUw0goejYpjV5uORx2+8y/YCoVKd31dW46sC9rmaUtMNtTg7iapaaaTp3zNrj8VlOcL4SMU7pGrP1JQxUvBexZ1pn7W4LXndJLQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.221.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vk1-f171.google.com with SMTP id 71dfb90a1353d-55b4dafb425so1385708e0c.1
        for <linux-renesas-soc@vger.kernel.org>; Thu, 27 Nov 2025 08:48:50 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764262129; x=1764866929;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=UCph/oIWs5n+TGDNA3qr0f5pMAAMvVvpBNho4phGpiw=;
        b=s6/SKUonYyzA6rhLhV5g+Ja+qcy6crJbLdrgd87e/5loKL8IRNiSVjhA5DOoymnqoD
         Gv8KXsY68qMPRgYzjP/L9qNwk0g+SLYh5uioyJNmF0+DkU4/fOIArQlFtQoAIuczw4hc
         Ae0z1v0/CzWpn9R+hLsZbt02ajC54KTFkxcO2ZTEJswFq+pbvn46Z6Y879L8HhNgeYJL
         aX9Frf/Lf9DSwSJHP8frcN4CLzzWcgOtnZuUirjIqPI+hAFJvj0g+dhEKtARIxBHku54
         RPw2WgGZOxE+01q522FyLJFYhM8EGYysVodqA6Mc0N9SQ0iusbDOSKF6WkeYs153Pb4s
         APGw==
X-Forwarded-Encrypted: i=1; AJvYcCU/4O12z5+IuCAa5W5rtp2gmhgk2fH8rqWyDUJbWcPpsqaGQo6ATU68t7F8TM+9gjrcIFo9u305EziemdtdCajtxw==@vger.kernel.org
X-Gm-Message-State: AOJu0YzjB4YDnE5CgVoWpcng+qajv7FUN0u4TDCbHCfGhgXnXBfcCS9O
	BGyh9AkVaqaKizkaRn+X4Hs6nF6Yq/OxkxeRwJQwpP+OuDYCWeoEwU/xHI22eHb1
X-Gm-Gg: ASbGncsdHpnCglryqMTwYWnDQOSHPiYbWJRYyjzFZ/2ruDhi0VS+zruMEDG1p+/k36H
	4dHQdIgMZfVo6tcxrjCvXMA4zYLAJuuUYCc++3KFn7FCYa5k3UbOrQuSa+oXOisFG+qYrKcgaIq
	kc0Ih4aqsNpdxyG98unXyq1FtSn+VujNpsPxUb3K8HXM/nIjwvjx80nBpOQewTq21db+wlu6ujF
	Q4g8LEfjdOOOkYwvM56WN7Sm3ujY41EklKkpS6GGn0QU5zhLvDFX6FtsIC7Fbt2rzYGvMZX7ETw
	iLY8AAiNhyw1qzsVdlAbEnQde1FTPJ4d7gcD7Xai3cgQy+GNo0/S14pEIYJv1FRfl+W01XQ0blC
	MvCoulnVoNd5m0Xs/8Vjp3g3gIPuV01bb3ZXwGUFd883HSZdPDuGUL/E7VzdIwIVVfjgq1eZmpI
	kRp/6wYM6EZ0qOPoYLVwqswSdvajpQaZdqGDzeFe2rVULGxhCa
X-Google-Smtp-Source: AGHT+IE0dVsBwDUHgNj9knczS5szjwhE7RNkbrS+X4I5R5XEvSi+xUjxNfWhqOw8vyy8/N5luhSzMA==
X-Received: by 2002:a05:6122:8007:b0:55b:9bf6:da7d with SMTP id 71dfb90a1353d-55b9bf6db38mr6176185e0c.2.1764262129518;
        Thu, 27 Nov 2025 08:48:49 -0800 (PST)
Received: from mail-vs1-f51.google.com (mail-vs1-f51.google.com. [209.85.217.51])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-55cf4e1f4c2sm783114e0c.2.2025.11.27.08.48.49
        for <linux-renesas-soc@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 27 Nov 2025 08:48:49 -0800 (PST)
Received: by mail-vs1-f51.google.com with SMTP id ada2fe7eead31-5dbd8bb36fcso836122137.1
        for <linux-renesas-soc@vger.kernel.org>; Thu, 27 Nov 2025 08:48:49 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCU7tRg19mLZtUVtsRDUSdC5lZs0B9RjeZ1geGMY67xipRwpHom+ZxYTlndO79g0h8rnbwf9zvUWStf2V97A218umg==@vger.kernel.org
X-Received: by 2002:a05:6102:6cb:b0:5de:a2d2:8076 with SMTP id
 ada2fe7eead31-5e1c37b194amr11888330137.0.1764262129198; Thu, 27 Nov 2025
 08:48:49 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20251125224533.294235-1-prabhakar.mahadev-lad.rj@bp.renesas.com> <20251125224533.294235-2-prabhakar.mahadev-lad.rj@bp.renesas.com>
In-Reply-To: <20251125224533.294235-2-prabhakar.mahadev-lad.rj@bp.renesas.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Thu, 27 Nov 2025 17:48:38 +0100
X-Gmail-Original-Message-ID: <CAMuHMdVtrAYrkBWOB5ztNu0E6zLA15NP65L35GZm2+NrRJBfkA@mail.gmail.com>
X-Gm-Features: AWmQ_bl-oq7Sx1YxashiIqeDJ0PlR3SDIcdbPQbfrp7IQYko7t0M6eRppYVUS-M
Message-ID: <CAMuHMdVtrAYrkBWOB5ztNu0E6zLA15NP65L35GZm2+NrRJBfkA@mail.gmail.com>
Subject: Re: [PATCH 1/4] arm64: dts: renesas: r9a09g056: Add ICU node
To: Prabhakar <prabhakar.csengg@gmail.com>
Cc: Magnus Damm <magnus.damm@gmail.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	linux-renesas-soc@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Biju Das <biju.das.jz@bp.renesas.com>, 
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>, 
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Content-Type: text/plain; charset="UTF-8"

Hi Prabhakar,

On Tue, 25 Nov 2025 at 23:45, Prabhakar <prabhakar.csengg@gmail.com> wrote:
> From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
>
> Add node for the Interrupt Control Unit IP found on the Renesas
> RZ/V2N SoC, and modify the pinctrl node as its interrupt parent
> is the ICU node.
>
> Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>

Thanks for your patch!

> --- a/arch/arm64/boot/dts/renesas/r9a09g056.dtsi
> +++ b/arch/arm64/boot/dts/renesas/r9a09g056.dtsi
> @@ -183,12 +183,104 @@ soc: soc {
>                 #size-cells = <2>;
>                 ranges;
>
> +               icu: interrupt-controller@10400000 {
> +                       compatible = "renesas,r9a09g056-icu", "renesas,r9a09g057-icu";

I will drop the fallback compatible while applying.

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
i.e. will queue in renesas-devel for v6.20.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

